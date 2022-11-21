Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0871A631E6D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 11:34:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox46P-0007If-JX; Mon, 21 Nov 2022 05:32:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ox46G-0007HT-P8
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 05:32:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ox46E-0007az-NR
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 05:32:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669026746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H1V3o9LA1aIUUFCxb9Vh+jArO0Qh0kgnudTNTg69Es0=;
 b=d4/8FKvtXevo/mkdOnmXg1sJT+t/G9+eHB3XKdaIFLkwU/QCx4hldqE9XtABf/RmQCf0Lj
 d5L6LqfXmmqiwdoU2gcnZZwczWvFtygzTTWLsS4O+6GwOkQZhZJrvV77q2wHfFLbJp+l5D
 1KFZ/PznVimYrd93MdSIH9G/MDXM4jI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-Ats5EELNNVyggs5zWU5kJQ-1; Mon, 21 Nov 2022 05:32:22 -0500
X-MC-Unique: Ats5EELNNVyggs5zWU5kJQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 295A2801585;
 Mon, 21 Nov 2022 10:32:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E988D1415117;
 Mon, 21 Nov 2022 10:32:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0ACA8180093B; Mon, 21 Nov 2022 11:32:14 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: seabios@seabios.org
Cc: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 2/4] detect physical address space size
Date: Mon, 21 Nov 2022 11:32:11 +0100
Message-Id: <20221121103213.1675568-3-kraxel@redhat.com>
In-Reply-To: <20221121103213.1675568-1-kraxel@redhat.com>
References: <20221121103213.1675568-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Check for pae and long mode using cpuid.  If present also read the
physical address bits.  Apply some qemu sanity checks (see below).
Record results in PhysBits and LongMode variables.  In case we are not
sure what the address space size is leave the PhysBits variable unset.

On qemu we have the problem that for historical reasons x86_64
processors advertise 40 physical address space bits by default, even in
case the host supports less than that so actually using the whole
address space will not work.

Because of that the code applies some extra sanity checks in case we
find 40 (or less) physical address space bits advertised.  Only
known-good values (which is 40 for amd processors and 36+39 for intel
processors) will be accepted as valid.

Recommendation is to use 'qemu -cpu ${name},host-phys-bits=on' to
advertise valid physical address space bits to the guest.  Some distro
builds enable this by default, and most likely the qemu default will
change in near future too.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 src/fw/paravirt.h |  2 ++
 src/fw/paravirt.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/src/fw/paravirt.h b/src/fw/paravirt.h
index 4e2e993ba9d3..7ca3fdcc06d4 100644
--- a/src/fw/paravirt.h
+++ b/src/fw/paravirt.h
@@ -31,6 +31,8 @@ typedef struct QemuCfgDmaAccess {
 extern u32 RamSize;
 extern u64 RamSizeOver4G;
 extern int PlatformRunningOn;
+extern u8 PhysBits;
+extern int LongMode;
 
 static inline int runningOnQEMU(void) {
     return CONFIG_QEMU || (
diff --git a/src/fw/paravirt.c b/src/fw/paravirt.c
index c880cb10a1bc..d50a8a7e9d55 100644
--- a/src/fw/paravirt.c
+++ b/src/fw/paravirt.c
@@ -32,6 +32,10 @@
 u32 RamSize;
 // Amount of continuous ram >4Gig
 u64 RamSizeOver4G;
+// physical address space bits
+u8 PhysBits;
+// 64bit processor
+int LongMode;
 // Type of emulator platform.
 int PlatformRunningOn VARFSEG;
 // cfg enabled
@@ -129,6 +133,61 @@ static void kvmclock_init(void)
     tsctimer_setfreq(MHz * 1000, "kvmclock");
 }
 
+static void physbits(int qemu_quirk)
+{
+    unsigned int max, eax, ebx, ecx, edx;
+    unsigned int physbits;
+    char signature[13];
+    int pae = 0, valid = 0;
+
+    cpuid(0, &eax, &ebx, &ecx, &edx);
+    memcpy(signature + 0, &ebx, 4);
+    memcpy(signature + 4, &edx, 4);
+    memcpy(signature + 8, &ecx, 4);
+    signature[12] = 0;
+    if (eax >= 1) {
+        cpuid(1, &eax, &ebx, &ecx, &edx);
+        pae = (edx & (1 << 6));
+    }
+
+    cpuid(0x80000000, &eax, &ebx, &ecx, &edx);
+    max = eax;
+
+    if (max >= 0x80000001) {
+        cpuid(0x80000001, &eax, &ebx, &ecx, &edx);
+        LongMode = (edx & (1 << 29));
+    }
+
+    if (pae && LongMode && max >= 0x80000008) {
+        cpuid(0x80000008, &eax, &ebx, &ecx, &edx);
+        physbits = (u8)eax;
+        if (!qemu_quirk) {
+            valid = 1;
+        } else if (physbits >= 41) {
+            valid = 1;
+        } else if (strcmp(signature, "GenuineIntel") == 0) {
+            if ((physbits == 36) || (physbits == 39))
+                valid = 1;
+        } else if (strcmp(signature, "AuthenticAMD") == 0) {
+            if (physbits == 40)
+                valid = 1;
+        }
+    } else {
+        physbits = pae ? 36 : 32;
+        valid = 1;
+    }
+
+    dprintf(1, "%s: signature=\"%s\", pae=%s, lm=%s, phys-bits=%d, valid=%s\n",
+            __func__, signature, pae ? "yes" : "no", LongMode ? "yes" : "no",
+            physbits, valid ? "yes" : "no");
+
+    if (valid) {
+        if (physbits > 47)
+            physbits = 47;
+        PhysBits = physbits;
+    }
+}
+
 static void qemu_detect(void)
 {
     if (!CONFIG_QEMU_HARDWARE)
@@ -161,6 +220,7 @@ static void qemu_detect(void)
         dprintf(1, "Running on QEMU (unknown nb: %04x:%04x)\n", v, d);
         break;
     }
+    physbits(1);
 }
 
 static int qemu_early_e820(void);
-- 
2.38.1


