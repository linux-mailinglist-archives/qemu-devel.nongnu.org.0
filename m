Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C30B542F7C5
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 18:14:16 +0200 (CEST)
Received: from localhost ([::1]:40420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbPqZ-00085B-Db
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 12:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mbPor-0006Zo-Gq
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 12:12:29 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:49936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mbPop-000828-Kp
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 12:12:29 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-9D-Uf0B4PNSmKY3FHmXtSA-1; Fri, 15 Oct 2021 12:12:22 -0400
X-MC-Unique: 9D-Uf0B4PNSmKY3FHmXtSA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AA1A362F9;
 Fri, 15 Oct 2021 16:12:21 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.195.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9522D5F4E2;
 Fri, 15 Oct 2021 16:12:19 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] accel/tcg: Fix monitor deadlock
Date: Fri, 15 Oct 2021 18:12:16 +0200
Message-Id: <20211015161218.1231920-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
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
Greg Kurz (2):=0D
  rcu: Introduce force_rcu notifier=0D
  accel/tcg: Register a force_rcu notifier=0D
=0D
 accel/tcg/tcg-accel-ops-mttcg.c |  3 ++-=0D
 accel/tcg/tcg-accel-ops-rr.c    |  3 ++-=0D
 accel/tcg/tcg-accel-ops.c       | 11 +++++++++++=0D
 accel/tcg/tcg-accel-ops.h       |  2 ++=0D
 include/hw/core/cpu.h           |  2 ++=0D
 include/qemu/rcu.h              | 21 ++++++++++++++++++++-=0D
 util/rcu.c                      | 23 +++++++++++++++++++++--=0D
 7 files changed, 60 insertions(+), 5 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


