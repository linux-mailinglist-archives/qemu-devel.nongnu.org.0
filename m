Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B5D6F5177
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:29:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6qE-0001rz-NG; Wed, 03 May 2023 03:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6q2-0001K7-JD
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:46 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6pz-0001eb-0n
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:46 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-2fa0ce30ac2so4406954f8f.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098621; x=1685690621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pPLvUEtS2r7DTVcycF0JmWSxgARIqH2mkH/yVD891tk=;
 b=xtf+bJzuA4udwzT9xrjcpgY2cJKaVP8gRei3Zam1AWJcvx+84me3LoOFPmHlQSaNPA
 sy+AlANJGlEU4brFdwq+JixmvtdYzKik8M3KoPYalAKVjPw9y3CBd6dML92aOjGbdEAO
 3hMAYld2BLrQbkGr1dSx8B8kcc13ZfoMDgf3ZyzSsKoEsJNeMwsBpPzhZa/RcN69aMJK
 y/75QuIiW4pAQOWZNpewKGVCKqm7+nyLCydA+EZreCmzfBzBYFTOP0T5mTBkLUxLJCc/
 HVpfASeTQn2HDlfuSo3FNdor3K2r6hr8LjCOMJaB8cw2eU8K+BqDMkaf+hRG8u+pfxao
 BCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098621; x=1685690621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pPLvUEtS2r7DTVcycF0JmWSxgARIqH2mkH/yVD891tk=;
 b=aWhae5QcCyYau/usruRNH2SLM3S4Dk6n2le6aPGe1n1QSiegBoZiJh01QIHQfP+MPB
 Sizo2k5soiYLA5vGUrR5mp2ObLiiG97pd95ijaz5RpuJJmUn83wjM0cq8Mp0o4nO0zcY
 cqcBzSUBCNEnKxpk7COng+cptiZshB2Y3pt4bfbiy9r57z1W5kQxHqt00X3Yt7JE+njb
 pbcDr3NJNFUprxhqAo9IcDqlipFPP7tmavfw5xqyhmTTX41KYbGPpn0CqycRqRmFnVq+
 JQsRjMRKrp7TTCisJVHnVFY2BFeCfLUGnBOWjS6UQpMW9BFG091XnuQCAh1j46kqmWv1
 BXvg==
X-Gm-Message-State: AC+VfDyHoaQrQR5QhP63Jz3SqrR7M6rcQqmwSceGZ5+HFzspe2GmWNeG
 kvC8PkSxlZM9CpDQTuycAFf6HamUTagtf452gjdRCg==
X-Google-Smtp-Source: ACHHUZ5UhjJWxbeMUcbpeeDZ8O8dDZdfnXHYFVynQcRe1hIapi0kgd2tBi74crVUtOYsGvDL494GAg==
X-Received: by 2002:adf:db46:0:b0:2f5:aadb:4642 with SMTP id
 f6-20020adfdb46000000b002f5aadb4642mr15027210wrj.41.1683098621598; 
 Wed, 03 May 2023 00:23:41 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:23:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 08/84] accel/tcg: Merge do_gen_mem_cb into caller
Date: Wed,  3 May 2023 08:22:15 +0100
Message-Id: <20230503072331.1747057-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

As do_gen_mem_cb is called once, merge it into gen_empty_mem_cb.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/plugin-gen.c | 41 ++++++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 04facd6305..55e892b684 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -92,27 +92,6 @@ void HELPER(plugin_vcpu_mem_cb)(unsigned int vcpu_index,
                                 void *userdata)
 { }
 
-static void do_gen_mem_cb(TCGv vaddr, uint32_t info)
-{
-    TCGv_i32 cpu_index = tcg_temp_ebb_new_i32();
-    TCGv_i32 meminfo = tcg_temp_ebb_new_i32();
-    TCGv_i64 vaddr64 = tcg_temp_ebb_new_i64();
-    TCGv_ptr udata = tcg_temp_ebb_new_ptr();
-
-    tcg_gen_movi_i32(meminfo, info);
-    tcg_gen_movi_ptr(udata, 0);
-    tcg_gen_ld_i32(cpu_index, cpu_env,
-                   -offsetof(ArchCPU, env) + offsetof(CPUState, cpu_index));
-    tcg_gen_extu_tl_i64(vaddr64, vaddr);
-
-    gen_helper_plugin_vcpu_mem_cb(cpu_index, meminfo, vaddr64, udata);
-
-    tcg_temp_free_ptr(udata);
-    tcg_temp_free_i64(vaddr64);
-    tcg_temp_free_i32(meminfo);
-    tcg_temp_free_i32(cpu_index);
-}
-
 static void gen_empty_udata_cb(void)
 {
     TCGv_i32 cpu_index = tcg_temp_ebb_new_i32();
@@ -145,9 +124,25 @@ static void gen_empty_inline_cb(void)
     tcg_temp_free_i64(val);
 }
 
-static void gen_empty_mem_cb(TCGv addr, uint32_t info)
+static void gen_empty_mem_cb(TCGv vaddr, uint32_t info)
 {
-    do_gen_mem_cb(addr, info);
+    TCGv_i32 cpu_index = tcg_temp_ebb_new_i32();
+    TCGv_i32 meminfo = tcg_temp_ebb_new_i32();
+    TCGv_i64 vaddr64 = tcg_temp_ebb_new_i64();
+    TCGv_ptr udata = tcg_temp_ebb_new_ptr();
+
+    tcg_gen_movi_i32(meminfo, info);
+    tcg_gen_movi_ptr(udata, 0);
+    tcg_gen_ld_i32(cpu_index, cpu_env,
+                   -offsetof(ArchCPU, env) + offsetof(CPUState, cpu_index));
+    tcg_gen_extu_tl_i64(vaddr64, vaddr);
+
+    gen_helper_plugin_vcpu_mem_cb(cpu_index, meminfo, vaddr64, udata);
+
+    tcg_temp_free_ptr(udata);
+    tcg_temp_free_i64(vaddr64);
+    tcg_temp_free_i32(meminfo);
+    tcg_temp_free_i32(cpu_index);
 }
 
 /*
-- 
2.34.1


