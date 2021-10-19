Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 753FC432D8E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 07:58:12 +0200 (CEST)
Received: from localhost ([::1]:53416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mci8Z-0000xK-2Y
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 01:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mci7A-0007O7-Lb
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 01:56:44 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:50715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mci78-0002xC-QR
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 01:56:44 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-sJzmnWHWO42Glhp8Y5xnMA-1; Tue, 19 Oct 2021 01:56:36 -0400
X-MC-Unique: sJzmnWHWO42Glhp8Y5xnMA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE96E801FCE;
 Tue, 19 Oct 2021 05:56:34 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.192.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64E4F19C59;
 Tue, 19 Oct 2021 05:56:33 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] accel/tcg: Fix monitor deadlock
Date: Tue, 19 Oct 2021 07:56:30 +0200
Message-Id: <20211019055632.252879-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-stable@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 7bed89958bfb ("device_core: use drain_call_rcu in in qmp_device_add"=
)=0D
introduced a regression in QEMU 6.0 : passing device_add without argument=
=0D
hangs the monitor. This was reported against qemu-system-mips64 with TGC,=
=0D
but I could consistently reproduce it with other targets (x86 and ppc64).=
=0D
=0D
See https://gitlab.com/qemu-project/qemu/-/issues/650 for details.=0D
=0D
The problem is that an emulated busy-looping vCPU can stay forever in=0D
its RCU read-side critical section and prevent drain_call_rcu() to return.=
=0D
This series fixes the issue by letting RCU kick vCPUs out of the read-side=
=0D
critical section when drain_call_rcu() is in progress. This is achieved=0D
through notifiers, as suggested by Paolo Bonzini.=0D
=0D
v2:=0D
- moved notifier list to RCU reader data=0D
- separate API for notifier registration=0D
- CPUState passed as an opaque pointer=0D
=0D
Greg Kurz (2):=0D
  rcu: Introduce force_rcu notifier=0D
  accel/tcg: Register a force_rcu notifier=0D
=0D
 accel/tcg/tcg-accel-ops-mttcg.c |  3 +++=0D
 accel/tcg/tcg-accel-ops-rr.c    |  3 +++=0D
 accel/tcg/tcg-accel-ops.c       | 15 +++++++++++++++=0D
 accel/tcg/tcg-accel-ops.h       |  2 ++=0D
 include/qemu/rcu.h              | 16 ++++++++++++++++=0D
 util/rcu.c                      | 22 +++++++++++++++++++++-=0D
 6 files changed, 60 insertions(+), 1 deletion(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


