Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5376867C3
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 14:58:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNDcm-0006Wr-S7; Wed, 01 Feb 2023 08:58:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pNDcj-0006RM-VK
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 08:58:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pNDci-000308-AG
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 08:58:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675259883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LAlEK0K4mv11Ts4OUBYTr/ODe+SOQ3ZBS+suwD9zHOc=;
 b=Vd2J4vvl91Nrnp/ttW/247Q/9jJdpXozyl7xsiKJiUZCOMylWg5wNWTwpfItjHnJFyhgHi
 uNGOe2OIIyf4pED31P6ofzINk7kO3Pq37ULS2B4UWu/5VJk0a99KbdmoI/E8HwCXhH3ngk
 1RYSwxNZlsDoPcE+lMM49keNDoGyP48=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-dhNNBnUbNMKodu4UHWu8hQ-1; Wed, 01 Feb 2023 08:58:02 -0500
X-MC-Unique: dhNNBnUbNMKodu4UHWu8hQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD6C9100DEA1;
 Wed,  1 Feb 2023 13:58:01 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8642640ED784;
 Wed,  1 Feb 2023 13:58:01 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 Yang Zhong <yang.zhong@linux.intel.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jing Liu <jing2.liu@intel.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 1/2] target/i386: add support for FLUSH_L1D feature
Date: Wed,  1 Feb 2023 08:57:58 -0500
Message-Id: <20230201135759.555607-2-eesposit@redhat.com>
In-Reply-To: <20230201135759.555607-1-eesposit@redhat.com>
References: <20230201135759.555607-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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

As reported by Intel's doc:
"L1D_FLUSH: Writeback and invalidate the L1 data cache"

If this cpu feature is present in host, allow QEMU to choose whether to
show it to the guest too.
One disadvantage of not exposing it is that the guest will report
a non existing vulnerability in
/sys/devices/system/cpu/vulnerabilities/mmio_stale_data
because the mitigation is present only when the cpu has
	(FLUSH_L1D and MD_CLEAR) or FB_CLEAR
features enabled.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 target/i386/cpu.h | 2 ++
 target/i386/cpu.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d4bc19577a..4948130900 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -889,6 +889,8 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 #define CPUID_7_0_EDX_SPEC_CTRL         (1U << 26)
 /* Single Thread Indirect Branch Predictors */
 #define CPUID_7_0_EDX_STIBP             (1U << 27)
+/* Flush L1D cache */
+#define CPUID_7_0_EDX_FLUSH_L1D         (1U << 28)
 /* Arch Capabilities */
 #define CPUID_7_0_EDX_ARCH_CAPABILITIES (1U << 29)
 /* Core Capability */
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 4d2b8d0444..390120cad8 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -858,7 +858,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             "tsx-ldtrk", NULL, NULL /* pconfig */, "arch-lbr",
             NULL, NULL, "amx-bf16", "avx512-fp16",
             "amx-tile", "amx-int8", "spec-ctrl", "stibp",
-            NULL, "arch-capabilities", "core-capability", "ssbd",
+            "flush-l1d", "arch-capabilities", "core-capability", "ssbd",
         },
         .cpuid = {
             .eax = 7,
-- 
2.39.1


