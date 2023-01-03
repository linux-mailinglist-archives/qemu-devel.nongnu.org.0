Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D141965C5F1
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:19:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrf-0000HP-An; Tue, 03 Jan 2023 13:18:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqm-0008IM-Os
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:40 -0500
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqk-0005C0-LR
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:23 -0500
Received: by mail-vs1-xe2f.google.com with SMTP id 3so32565601vsq.7
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZkEGcogj27YdFJQTywgiITgHI/jXlYMGF8YkSZKNLjc=;
 b=OdlkCUnO2Uxx0rv9SDJotaMqmCzirnX5oBoMpMo/v1Uw7jhHH+ekq6g2BOUT4oeXyn
 G3MEdy4bTs5ffpx7XDwZj6XhFdrTrzqo95Z1QcJlKbnG7SsxzwQZvZE1Wo3FO28GKIiq
 5jHtEPyCri0F9Y2uSoqLeQ5J222QljYl5WuodTf2xC9eBagiWEv3s/xWR5t/h6g2CPJA
 0bTa6yG9SV6uUdncWfiKfYELr+9OH46KM7l7AQW4VsNBgtXoZ9yaB/CJvtl5fomgcLGJ
 hzaHRORr6i/G/BWJVPnVIHL8/TqGN19Lo0iwb8ZKU/4LCW8R07v0kXLLJ0XVkRmi3ylK
 m1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZkEGcogj27YdFJQTywgiITgHI/jXlYMGF8YkSZKNLjc=;
 b=G64KBnVII10g88QJPyptDnUlO5EFN+sIXfXG22OJEMvXCvEED59R2D5UfUXpEv+Iat
 0jHhixrbkZXM9ugw/IhQey/vm5uRZ3/bucc+oUtEGiRDBTyslX+k9ZC2gYvEMaX/H1mx
 iJPCOj7t5pT5G2/4hCZtWJ0tzi39XPOSNdDHQEKTP3OlSArifoK2HZLyjIK2U5wtMFgh
 UlcDtmhCg36CsXKiHFggG/d0Hhw69wQbQh3Bh6bBnUlNJjAPa6u28uFBwieltjmQf+sZ
 eL33v3lmQySY6AyJbPN72hEHgkcopWD1EiWZobZYBuGW6oOxLHAZ7YVrRk8aIteQi2gG
 WBpg==
X-Gm-Message-State: AFqh2kpjof7gHK/NZC9bSXZo51g7FFOJMYIIL1kB39JYqjsCZywZqCSK
 pfraG4ji6u/gplIhSPh47dYyhjGmUpRoJ6x3TZE=
X-Google-Smtp-Source: AMrXdXulXRq4YTSV3PqtwEHk332qbByKrxYBsP/FA10Oxln8D6n0j5Ka6T0U91sjXmTX+nQ3lm5/qg==
X-Received: by 2002:a67:fb0d:0:b0:3c9:27b2:3f04 with SMTP id
 d13-20020a67fb0d000000b003c927b23f04mr14482397vsr.32.1672769840511; 
 Tue, 03 Jan 2023 10:17:20 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:17:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 10/40] target/arm: Copy dtb_compatible from ARMCPUClass
Date: Tue,  3 Jan 2023 10:16:16 -0800
Message-Id: <20230103181646.55711-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Move the default initialization of dtb_compatible to arm_cpu_class_init,
and copy back to the instance in arm_cpu_init.  Further class overrides
will come in a future patch.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-qom.h |  3 +++
 target/arm/cpu.c     | 15 ++++++++++-----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 057978b9db..5509ef9d85 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -71,6 +71,9 @@ struct ARMCPUClass {
     const ARMCPUInfo *info;
     DeviceRealize parent_realize;
     ResettablePhases parent_phases;
+
+    /* 'compatible' string for this CPU for Linux device trees */
+    const char *dtb_compatible;
 };
 
 void register_cp_regs_for_features(ARMCPU *cpu);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a6c6916f36..1bc45b2b25 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1181,6 +1181,7 @@ uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz)
 static void arm_cpu_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
+    ARMCPUClass *acc = ARM_CPU_GET_CLASS(cpu);
 
     cpu_set_cpustate_pointers(cpu);
     cpu->cp_regs = g_hash_table_new_full(g_direct_hash, g_direct_equal,
@@ -1189,6 +1190,8 @@ static void arm_cpu_initfn(Object *obj)
     QLIST_INIT(&cpu->pre_el_change_hooks);
     QLIST_INIT(&cpu->el_change_hooks);
 
+    cpu->dtb_compatible = acc->dtb_compatible;
+
 #ifdef CONFIG_USER_ONLY
 # ifdef TARGET_AARCH64
     /*
@@ -1220,11 +1223,6 @@ static void arm_cpu_initfn(Object *obj)
                              "pmu-interrupt", 1);
 #endif
 
-    /* DTB consumers generally don't in fact care what the 'compatible'
-     * string is, so always provide some string and trust that a hypothetical
-     * picky DTB consumer will also provide a helpful error message.
-     */
-    cpu->dtb_compatible = "qemu,unknown";
     cpu->psci_version = QEMU_PSCI_VERSION_0_1; /* By default assume PSCI v0.1 */
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_NONE;
 
@@ -2243,6 +2241,13 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifdef CONFIG_TCG
     cc->tcg_ops = &arm_tcg_ops;
 #endif /* CONFIG_TCG */
+
+    /*
+     * DTB consumers generally don't in fact care what the 'compatible'
+     * string is, so always provide some string and trust that a hypothetical
+     * picky DTB consumer will also provide a helpful error message.
+     */
+    acc->dtb_compatible = "qemu,unknown";
 }
 
 static void arm_cpu_leaf_class_init(ObjectClass *oc, void *data)
-- 
2.34.1


