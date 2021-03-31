Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6447734F8C8
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 08:32:02 +0200 (CEST)
Received: from localhost ([::1]:46998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRUOX-0008OT-DI
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 02:32:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRUIJ-0004Xl-Q9; Wed, 31 Mar 2021 02:25:36 -0400
Received: from ozlabs.org ([203.11.71.1]:54609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRUIG-0000ov-4b; Wed, 31 Mar 2021 02:25:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F9GX667VZz9sWT; Wed, 31 Mar 2021 17:25:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617171926;
 bh=IAXTeCAYq9UAhT4FZCaUQxfKJxQcGMr2ZL37dSw0zEk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eHK/EfqhEBKjCuKDJ5cCbAwZ4DP+kkfxhZAifmA+Y+iYVI/ZzbVZsLOAXbpfO1Vt2
 bhb2yr841VlSJHqNZNb1EBo8VgwfQgNoo6kJ7Bx2a+6vj8CByGkmn2E7KPp/199HFL
 mr2slqlVgltRVisNegW+DZKxhLVUvuaOgJwMuU4E=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 2/5] target/ppc/kvm: Cache timebase frequency
Date: Wed, 31 Mar 2021 17:25:21 +1100
Message-Id: <20210331062524.335749-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331062524.335749-1-david@gibson.dropbear.id.au>
References: <20210331062524.335749-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

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
Message-Id: <161600382766.1780699.6787739229984093959.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/kvm.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 298c1f882c..104a308abb 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1815,24 +1815,37 @@ static int read_cpuinfo(const char *field, char *value, int len)
     return ret;
 }
 
-uint32_t kvmppc_get_tbfreq(void)
+static uint32_t kvmppc_get_tbfreq_procfs(void)
 {
     char line[512];
     char *ns;
-    uint32_t retval = NANOSECONDS_PER_SECOND;
+    uint32_t tbfreq_fallback = NANOSECONDS_PER_SECOND;
+    uint32_t tbfreq_procfs;
 
     if (read_cpuinfo("timebase", line, sizeof(line))) {
-        return retval;
+        return tbfreq_fallback;
     }
 
     ns = strchr(line, ':');
     if (!ns) {
-        return retval;
+        return tbfreq_fallback;
     }
 
-    ns++;
+    tbfreq_procfs = atoi(++ns);
+
+    /* 0 is certainly not acceptable by the guest, return fallback value */
+    return tbfreq_procfs ? tbfreq_procfs : tbfreq_fallback;
+}
+
+uint32_t kvmppc_get_tbfreq(void)
+{
+    static uint32_t cached_tbfreq;
+
+    if (!cached_tbfreq) {
+        cached_tbfreq = kvmppc_get_tbfreq_procfs();
+    }
 
-    return atoi(ns);
+    return cached_tbfreq;
 }
 
 bool kvmppc_get_host_serial(char **value)
-- 
2.30.2


