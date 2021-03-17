Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E617533F3F9
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:27:23 +0100 (CET)
Received: from localhost ([::1]:50028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMY4w-0000ea-T9
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lMY2e-0007gK-22
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:25:00 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:42140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lMY2c-0001PF-G8
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:24:59 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-j1JMnjQ7Pfi7N0sCrqEtOQ-1; Wed, 17 Mar 2021 11:24:46 -0400
X-MC-Unique: j1JMnjQ7Pfi7N0sCrqEtOQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1717802B7A;
 Wed, 17 Mar 2021 15:24:44 +0000 (UTC)
Received: from bahia.lan (ovpn-113-236.ams2.redhat.com [10.36.113.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2745810016F8;
 Wed, 17 Mar 2021 15:24:43 +0000 (UTC)
Subject: [PATCH] target/ppc/kvm: Cache timebase frequency
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Wed, 17 Mar 2021 16:24:43 +0100
Message-ID: <161599468311.1752480.3413807875011702040.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Each vCPU core exposes its timebase frequency in the DT. When running
under KVM, this means parsing /proc/cpuinfo in order to get the timebase
frequency of the host CPU.

The parsing appears to slow down the boot quite a bit with higher number
of cores:

# of cores     seconds spent in spapr_dt_cpus()
      8                  0.550122
     16                  1.342375
     32                  2.850316
     64                  5.922505
     96                  9.109224
    128                 12.245504
    256                 24.957236
    384                 37.389113

The timebase frequency of the host CPU is identical for all
cores and it is an invariant for the VM lifetime. Cache it
instead of doing the same expensive parsing again and again.

With this patch applied:

    384                 0.518382

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 target/ppc/kvm.c |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 298c1f882c67..9ad3dae29132 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1819,7 +1819,13 @@ uint32_t kvmppc_get_tbfreq(void)
 {
     char line[512];
     char *ns;
-    uint32_t retval =3D NANOSECONDS_PER_SECOND;
+    static uint32_t retval =3D -1;
+
+    if (retval !=3D -1) {
+        return retval;
+    }
+
+    retval =3D NANOSECONDS_PER_SECOND;
=20
     if (read_cpuinfo("timebase", line, sizeof(line))) {
         return retval;
@@ -1832,7 +1838,8 @@ uint32_t kvmppc_get_tbfreq(void)
=20
     ns++;
=20
-    return atoi(ns);
+    retval =3D atoi(ns);
+    return retval;
 }
=20
 bool kvmppc_get_host_serial(char **value)



