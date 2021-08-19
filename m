Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E3A3F20E9
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 21:43:08 +0200 (CEST)
Received: from localhost ([::1]:58758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGnwS-0001MS-2w
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 15:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mGnrj-00019W-HK
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 15:38:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mGnrh-0000Ac-JB
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 15:38:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629401893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kMS3MmvHJATpnU9OCesaNF9ryXpBjG2wuo9K9+YbnyE=;
 b=hC8kPWC4KVxzmKsgSb5f8TeDQk2vbJxoHdUwGCCEe4yEXSvVXpm2yXNhy837LhiUJk7bfS
 /uCEuWDcv/p15VmzEoh0LfG5tm3VUNBGGmWTWS+3pmvUDGnN3v8oeflw3IuMxlkXvtQ1VS
 dcFrlLVeS7wuqzEUKska+Ir2vbGt5ZU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-FInNp3ebPl-UDK2v9nKI9g-1; Thu, 19 Aug 2021 15:38:08 -0400
X-MC-Unique: FInNp3ebPl-UDK2v9nKI9g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20F9F1015189;
 Thu, 19 Aug 2021 19:38:07 +0000 (UTC)
Received: from gator.home (unknown [10.40.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B4F01970F;
 Thu, 19 Aug 2021 19:38:05 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 3/4] target/arm/cpu64: Replace kvm_supported with
 sve_vq_supported
Date: Thu, 19 Aug 2021 21:37:57 +0200
Message-Id: <20210819193758.149660-4-drjones@redhat.com>
In-Reply-To: <20210819193758.149660-1-drjones@redhat.com>
References: <20210819193758.149660-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 ishii.shuuichir@fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have an ARMCPU member sve_vq_supported we no longer
need the local kvm_supported bitmap for KVM's supported vector
lengths.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/cpu64.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index eb9318c83b74..557fd4757740 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -265,14 +265,17 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
      * any of the above.  Finally, if SVE is not disabled, then at least one
      * vector length must be enabled.
      */
-    DECLARE_BITMAP(kvm_supported, ARM_MAX_VQ);
     DECLARE_BITMAP(tmp, ARM_MAX_VQ);
     uint32_t vq, max_vq = 0;
 
-    /* Collect the set of vector lengths supported by KVM. */
-    bitmap_zero(kvm_supported, ARM_MAX_VQ);
+    /*
+     * CPU models specify a set of supported vector lengths which are
+     * enabled by default.  Attempting to enable any vector length not set
+     * in the supported bitmap results in an error.  When KVM is enabled we
+     * fetch the supported bitmap from the host.
+     */
     if (kvm_enabled() && kvm_arm_sve_supported()) {
-        kvm_arm_sve_get_vls(CPU(cpu), kvm_supported);
+        kvm_arm_sve_get_vls(CPU(cpu), cpu->sve_vq_supported);
     } else if (kvm_enabled()) {
         assert(!cpu_isar_feature(aa64_sve, cpu));
     }
@@ -299,7 +302,7 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
              * For KVM we have to automatically enable all supported unitialized
              * lengths, even when the smaller lengths are not all powers-of-two.
              */
-            bitmap_andnot(tmp, kvm_supported, cpu->sve_vq_init, max_vq);
+            bitmap_andnot(tmp, cpu->sve_vq_supported, cpu->sve_vq_init, max_vq);
             bitmap_or(cpu->sve_vq_map, cpu->sve_vq_map, tmp, max_vq);
         } else {
             /* Propagate enabled bits down through required powers-of-two. */
@@ -322,12 +325,12 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
             /* Disabling a supported length disables all larger lengths. */
             for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
                 if (test_bit(vq - 1, cpu->sve_vq_init) &&
-                    test_bit(vq - 1, kvm_supported)) {
+                    test_bit(vq - 1, cpu->sve_vq_supported)) {
                     break;
                 }
             }
             max_vq = vq <= ARM_MAX_VQ ? vq - 1 : ARM_MAX_VQ;
-            bitmap_andnot(cpu->sve_vq_map, kvm_supported,
+            bitmap_andnot(cpu->sve_vq_map, cpu->sve_vq_supported,
                           cpu->sve_vq_init, max_vq);
             if (max_vq == 0 || bitmap_empty(cpu->sve_vq_map, max_vq)) {
                 error_setg(errp, "cannot disable sve%d", vq * 128);
@@ -392,7 +395,7 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
 
     if (kvm_enabled()) {
         /* Ensure the set of lengths matches what KVM supports. */
-        bitmap_xor(tmp, cpu->sve_vq_map, kvm_supported, max_vq);
+        bitmap_xor(tmp, cpu->sve_vq_map, cpu->sve_vq_supported, max_vq);
         if (!bitmap_empty(tmp, max_vq)) {
             vq = find_last_bit(tmp, max_vq) + 1;
             if (test_bit(vq - 1, cpu->sve_vq_map)) {
-- 
2.31.1


