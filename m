Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D85631E70
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 11:34:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox46K-0007HU-8t; Mon, 21 Nov 2022 05:32:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ox46E-0007H5-PK
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 05:32:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ox46D-0007a6-AG
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 05:32:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669026743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N16dmJ2ldQi5wTQcb08lwbKkAEKIRFIXMq6H9NvkL9U=;
 b=LTb1lk6fxFS0oa2u4HVOAmAMdaSPMLTY34ditnZlhYXGvYJQ0wj73S2/XHbMr6jp8EfF9I
 i1cHoIgJc1tjCs+1/Dpgm0MG6o2XfhuM77LgnANT9souT8Bw27sPa644SsrbrXgee8k6Ga
 +cEU/lKEX5Bwpmr8TLYIiGR0l0S8gb4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-U7tK_FfsPN-HSjn23z0HyQ-1; Mon, 21 Nov 2022 05:32:19 -0500
X-MC-Unique: U7tK_FfsPN-HSjn23z0HyQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17E9E3C0DDBE;
 Mon, 21 Nov 2022 10:32:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA44B492B13;
 Mon, 21 Nov 2022 10:32:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 07458180093A; Mon, 21 Nov 2022 11:32:14 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: seabios@seabios.org
Cc: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 1/4] better kvm detection
Date: Mon, 21 Nov 2022 11:32:10 +0100
Message-Id: <20221121103213.1675568-2-kraxel@redhat.com>
In-Reply-To: <20221121103213.1675568-1-kraxel@redhat.com>
References: <20221121103213.1675568-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

In case kvm emulates features of another hypervisor (for example hyperv)
two VMM CPUID blocks will be present, one for the emulated hypervisor
and one for kvm itself.

This patch makes seabios loop over the VMM CPUID blocks to make sure it
will properly detect kvm when multiple blocks are present.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 src/fw/paravirt.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/src/fw/paravirt.c b/src/fw/paravirt.c
index fba4e52db684..c880cb10a1bc 100644
--- a/src/fw/paravirt.c
+++ b/src/fw/paravirt.c
@@ -56,20 +56,31 @@ inline int qemu_cfg_dma_enabled(void)
 
 static void kvm_detect(void)
 {
+    unsigned int i, kvmbase = 0, max = 0;
     unsigned int eax, ebx, ecx, edx;
     char signature[13];
 
-    cpuid(KVM_CPUID_SIGNATURE, &eax, &ebx, &ecx, &edx);
-    memcpy(signature + 0, &ebx, 4);
-    memcpy(signature + 4, &ecx, 4);
-    memcpy(signature + 8, &edx, 4);
-    signature[12] = 0;
+    for (i = KVM_CPUID_SIGNATURE;; i += 0x100) {
+        eax = 0;
+        cpuid(i, &eax, &ebx, &ecx, &edx);
+        if (eax < i)
+            break;
+        memcpy(signature + 0, &ebx, 4);
+        memcpy(signature + 4, &ecx, 4);
+        memcpy(signature + 8, &edx, 4);
+        signature[12] = 0;
+        dprintf(1, "cpuid 0x%x: eax %x, signature '%s'\n", i, eax, signature);
+        if (strcmp(signature, "KVMKVMKVM") == 0) {
+            kvmbase = i;
+            max = eax;
+        }
+    }
 
-    if (strcmp(signature, "KVMKVMKVM") == 0) {
+    if (kvmbase) {
         dprintf(1, "Running on KVM\n");
         PlatformRunningOn |= PF_KVM;
-        if (eax >= KVM_CPUID_SIGNATURE + 0x10) {
-            cpuid(KVM_CPUID_SIGNATURE + 0x10, &eax, &ebx, &ecx, &edx);
+        if (max >= kvmbase + 0x10) {
+            cpuid(kvmbase + 0x10, &eax, &ebx, &ecx, &edx);
             dprintf(1, "kvm: have invtsc, freq %u kHz\n", eax);
             tsctimer_setfreq(eax, "invtsc");
         }
-- 
2.38.1


