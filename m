Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 877F26F51A1
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:33:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6p6-00074o-2f; Wed, 03 May 2023 03:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6oz-0006ql-Jo
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:41 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ow-0007J8-CG
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:41 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f173af665fso30096315e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098553; x=1685690553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pPLvUEtS2r7DTVcycF0JmWSxgARIqH2mkH/yVD891tk=;
 b=S9E55tR7z99t6wAtiXufLtU1l3184OhXQK6gVtO5sKximgDOIQKqru7sjZ8dHXjX+f
 nwXMbUrC3yiUqNA7V1yL1Cv/o7W3tv+e1ylfOwxpoTIv795JMYRNgzUDv1cDT2dzSsJx
 0549noETNcoY469SLTBawH8ncqwz9g3AVxm8jChDKk9MISg8Tty0UBf00a5kkuKj4wXY
 bj0f/ru/WlpNbrN0GI93539LIY0nhnt9CpYDVisD9hLlKkpuKujHjLV5QRuc0SbXqa6d
 Xd9pKoODiF90nYQV5kE/31SHq3pwifmnUCuMjY0WF9L4awciAoIwaNlq5tsd/Si4fBcs
 WzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098553; x=1685690553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pPLvUEtS2r7DTVcycF0JmWSxgARIqH2mkH/yVD891tk=;
 b=Zg3VNfTp6cn1KZjlkfKojkMTTcWSONG3la+4d1k8JxqTf/j+dgWFv70D9WxOsVv36y
 eCetdaofaw+eCLgkzFU+vplQwHvmym/1jISRauVPuajOeZusPAinbeOsV+8pzwzmluhk
 bNrVcsYmPgVosJYoSh7zGrGNmZP8cM7RURjYJMKqS2KlBuSs8jPzXPQHoXsXqBlPdgfX
 8XkuztfGzQcuBbxQI0fz6Y1NN1wP7s9j1YJpfHMD0cX0ClUfBe9F/SmPQt9bmA/5HrET
 i77z1n66YLDB3oDbOK0zag/rTyznJLX/ysJvvscfqt10qQYGIVLZn4X1NztefroagpKp
 GTBA==
X-Gm-Message-State: AC+VfDyNyp0KxatZ0eCKg4e9TXe6LDcOiYMblYFG0u+ZMNYr6b5xLhtt
 ZwMNIQ5KDclfJbht+LKGPs3pDYAhsRWLPim1OREv8A==
X-Google-Smtp-Source: ACHHUZ5dg2bfPaQjBBpB3uNrjM6BXxEd41zR9QX+ekp/0+ZjEBEc867iCSTm/26U/vXXAHpoD5emWQ==
X-Received: by 2002:a05:600c:3787:b0:3f1:9540:d5fe with SMTP id
 o7-20020a05600c378700b003f19540d5femr13364552wmr.21.1683098553409; 
 Wed, 03 May 2023 00:22:33 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm962789wmj.23.2023.05.03.00.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:22:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 08/84] accel/tcg: Merge do_gen_mem_cb into caller
Date: Wed,  3 May 2023 08:21:00 +0100
Message-Id: <20230503072221.1746802-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072221.1746802-1-richard.henderson@linaro.org>
References: <20230503072221.1746802-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
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


