Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDAE44B2C4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 19:37:05 +0100 (CET)
Received: from localhost ([::1]:39716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkVzU-00053O-J1
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 13:37:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mkVy1-0003LJ-Be
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 13:35:33 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:37623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mkVxz-0001LY-P0
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 13:35:33 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-_UlVLABiMkyklqaybUMyFQ-1; Tue, 09 Nov 2021 13:35:28 -0500
X-MC-Unique: _UlVLABiMkyklqaybUMyFQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6A2E87D541;
 Tue,  9 Nov 2021 18:35:26 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.194.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7502D60936;
 Tue,  9 Nov 2021 18:35:24 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/2] accel/tcg: Fix monitor deadlock
Date: Tue,  9 Nov 2021 19:35:21 +0100
Message-Id: <20211109183523.47726-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Mailman-Version: 2.1.29
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
This series fixes the issue by letting RCU kick vCPU threads out of the=0D
read-side critical section when drain_call_rcu() is in progress. This is=0D
achieved through notifiers, as suggested by Paolo Bonzini.=0D
=0D
I've pushed this series to:=0D
=0D
https://gitlab.com/gkurz/qemu/-/commits/fix-drain-call-rcu=0D
=0D
v4:=0D
- use rr_kick_next_cpu() instead of async_run_on_cpu(first_cpu)=0D
=0D
v3:=0D
- new separate implementations of force RCU notifiers for MTTCG and RR=0D
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
 accel/tcg/tcg-accel-ops-mttcg.c | 26 ++++++++++++++++++++++++++=0D
 accel/tcg/tcg-accel-ops-rr.c    | 10 ++++++++++=0D
 include/qemu/rcu.h              | 15 +++++++++++++++=0D
 util/rcu.c                      | 19 +++++++++++++++++++=0D
 4 files changed, 70 insertions(+)=0D
=0D
--=20=0D
2.31.1=0D
=0D


