Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B3A33F7B3
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 18:59:39 +0100 (CET)
Received: from localhost ([::1]:33606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMaSI-00085k-7Q
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 13:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lMaQ2-0006qi-Mw
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 13:57:18 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:29279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lMaQ0-00042o-VD
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 13:57:18 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595--q9GStCfOUykwSEQwNitNA-1; Wed, 17 Mar 2021 13:57:10 -0400
X-MC-Unique: -q9GStCfOUykwSEQwNitNA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A92883DBF6;
 Wed, 17 Mar 2021 17:57:09 +0000 (UTC)
Received: from bahia.lan (ovpn-113-236.ams2.redhat.com [10.36.113.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87752648A2;
 Wed, 17 Mar 2021 17:57:08 +0000 (UTC)
Subject: [PATCH v2] target/ppc/kvm: Cache timebase frequency
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Wed, 17 Mar 2021 18:57:07 +0100
Message-ID: <161600382766.1780699.6787739229984093959.stgit@bahia.lan>
User-Agent: StGit/0.21
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
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
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

Rename kvmppc_get_tbfreq() to kvmppc_get_tbfreq_procfs() and
rename the 'retval' variable to make it clear it is used as
fallback only. Come up with a new version of kvmppc_get_tbfreq()
that calls kvmppc_get_tbfreq_procfs() only once and keep the
value in a static.

Zero is certainly not a valid value for the timebase frequency.
Treat atoi() returning zero as another parsing error and return
the fallback value instead. This allows kvmppc_get_tbfreq() to
use zero as an indicator that kvmppc_get_tbfreq_procfs() hasn't
been called yet.

With this patch applied:

    384                 0.518382

Signed-off-by: Greg Kurz <groug@kaod.org>
---
v2: - do the caching in a distinct function for clarity (Philippe)
    - rename 'retval' to 'tbfreq_fallback'
    - expand the changelog a bit
---
 target/ppc/kvm.c |   25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 298c1f882c67..104a308abb57 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1815,24 +1815,37 @@ static int read_cpuinfo(const char *field, char *va=
lue, int len)
     return ret;
 }
=20
-uint32_t kvmppc_get_tbfreq(void)
+static uint32_t kvmppc_get_tbfreq_procfs(void)
 {
     char line[512];
     char *ns;
-    uint32_t retval =3D NANOSECONDS_PER_SECOND;
+    uint32_t tbfreq_fallback =3D NANOSECONDS_PER_SECOND;
+    uint32_t tbfreq_procfs;
=20
     if (read_cpuinfo("timebase", line, sizeof(line))) {
-        return retval;
+        return tbfreq_fallback;
     }
=20
     ns =3D strchr(line, ':');
     if (!ns) {
-        return retval;
+        return tbfreq_fallback;
     }
=20
-    ns++;
+    tbfreq_procfs =3D atoi(++ns);
+
+    /* 0 is certainly not acceptable by the guest, return fallback value *=
/
+    return tbfreq_procfs ? tbfreq_procfs : tbfreq_fallback;
+}
+
+uint32_t kvmppc_get_tbfreq(void)
+{
+    static uint32_t cached_tbfreq;
+
+    if (!cached_tbfreq) {
+        cached_tbfreq =3D kvmppc_get_tbfreq_procfs();
+    }
=20
-    return atoi(ns);
+    return cached_tbfreq;
 }
=20
 bool kvmppc_get_host_serial(char **value)



