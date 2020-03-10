Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B4B180443
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 18:03:14 +0100 (CET)
Received: from localhost ([::1]:37150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBiHh-0005dB-Ny
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 13:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49964)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liran.alon@oracle.com>) id 1jBi6x-00079w-UQ
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 12:52:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <liran.alon@oracle.com>) id 1jBi6w-00080F-Rj
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 12:52:07 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:50702)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <liran.alon@oracle.com>)
 id 1jBi6w-0007xs-JU
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 12:52:06 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02AGcToY085248;
 Tue, 10 Mar 2020 16:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=Y+xng8xGIGilSa0d/6zOW6qU5eyKDrqFR+ferzQsKk8=;
 b=bwXbOksO3UQhojgVu7Q0q1JwupoltXYP8IKYAjiXua1fcTST09+aPC+uE6ziJf8lxe6G
 9SIHggY92DVFrcEdP4HPL07ZAGTOqCmIUui2CfGCPIFLFdATNB7lrv+KmlDETHtNR2Vv
 Nae8wbNXpGInjfo1Ybhz+ncVKqRZWds/dMocO4LpZ+iRIey7FXuEWRRWoulkSoj2rbQL
 w9seNg94Jcdpy5MKKYYMmEkK5v0CYe+DO+vLGwO77FDgSBSkOKDEhFbFN49sgQVAjFdj
 emaFcw0dh8E79CxVeOVcYZ39Gwjxb9+1WVjtETpqkj29RMYkVGhOhtjM9vEw5Do4ntGH lQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2ym31uetj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Mar 2020 16:52:04 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02AGbavG030383;
 Tue, 10 Mar 2020 16:52:04 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2yp8rjyjjt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Mar 2020 16:52:04 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02AGq3Jh011704;
 Tue, 10 Mar 2020 16:52:03 GMT
Received: from spark.ravello.local (/213.57.127.2)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 10 Mar 2020 09:52:02 -0700
From: Liran Alon <liran.alon@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/16] i386/cpu: Store LAPIC bus frequency in CPU structure
Date: Tue, 10 Mar 2020 18:53:30 +0200
Message-Id: <20200310165332.140774-15-liran.alon@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200310165332.140774-1-liran.alon@oracle.com>
References: <20200310165332.140774-1-liran.alon@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9556
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0 mlxscore=0
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=1
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003100103
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9556
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 lowpriorityscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=1
 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003100103
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 156.151.31.86
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
Cc: ehabkost@redhat.com, mst@redhat.com, Liran Alon <liran.alon@oracle.com>,
 nikita.leshchenko@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No functional change.
This information will be used by following patches.

Reviewed-by: Nikita Leshenko <nikita.leshchenko@oracle.com>
Signed-off-by: Liran Alon <liran.alon@oracle.com>
---
 target/i386/cpu.h |  1 +
 target/i386/kvm.c | 10 +++++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 576f309bbfc8..9c7cd7cde107 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1580,6 +1580,7 @@ typedef struct CPUX86State {
     bool tsc_valid;
     int64_t tsc_khz;
     int64_t user_tsc_khz; /* for sanity check only */
+    uint64_t apic_bus_freq;
 #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
     void *xsave_buf;
 #endif
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 69eb43d796e6..8534ca9760d7 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -60,6 +60,10 @@
     do { } while (0)
 #endif
 
+/* From arch/x86/kvm/lapic.h */
+#define KVM_APIC_BUS_CYCLE_NS       1
+#define KVM_APIC_BUS_FREQUENCY      (1000000000ULL / KVM_APIC_BUS_CYCLE_NS)
+
 #define MSR_KVM_WALL_CLOCK  0x11
 #define MSR_KVM_SYSTEM_TIME 0x12
 
@@ -1496,6 +1500,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
         }
     }
 
+    env->apic_bus_freq = KVM_APIC_BUS_FREQUENCY;
+
     /* Paravirtualization CPUIDs */
     r = hyperv_handle_properties(cs, cpuid_data.entries);
     if (r < 0) {
@@ -1800,9 +1806,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
         c = &cpuid_data.entries[cpuid_i++];
         c->function = KVM_CPUID_SIGNATURE | 0x10;
         c->eax = env->tsc_khz;
-        /* LAPIC resolution of 1ns (freq: 1GHz) is hardcoded in KVM's
-         * APIC_BUS_CYCLE_NS */
-        c->ebx = 1000000;
+        c->ebx = env->apic_bus_freq / 1000; /* Hz to KHz */
         c->ecx = c->edx = 0;
 
         c = cpuid_find_entry(&cpuid_data.cpuid, kvm_base, 0);
-- 
2.20.1


