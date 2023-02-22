Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7920169FF8C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 00:31:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUyWR-0000S6-HV; Wed, 22 Feb 2023 18:27:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWP-0000Rr-JT
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:37 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWN-0005Kz-Vx
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:37 -0500
Received: by mail-pl1-x634.google.com with SMTP id e9so5767369plh.2
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 15:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DKuK62hxv2vXEM1ktPotl0poAfziKcuIlZAl/cEb0MU=;
 b=z4jeLqw6vmWQP8K0ARgR4kNxNhkTw1nj2j4kOSQG98ihVx94ViE/hAdLYwm7z9ZrSz
 Z3VaHvXk4sOPM3GgF5UgUu7p3dFe02ZmsWeflj7DnELmzPmbrmI31gygTS9oEXMy7jVO
 /VHR/mfLHsQycKOUqxita0YurEaef5R6D6PpfFpt5Hi5kg1SMnQdc6kuqvVqb/Oe8Adj
 bluWiKcdlp28JuqSV0AHVg11GwSag9e+1hrOUm+AffBRN8QI0XhH/czDUeaC/q/2jk8E
 F98prlFR90Msj5PvaHT9OJpGrmtS+3fL/viCMR0Pi59RTeTjYItSbZg+CuB3+iI78UxE
 auGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DKuK62hxv2vXEM1ktPotl0poAfziKcuIlZAl/cEb0MU=;
 b=qhDisfQG6njpF81HnoKUZePcs+QGHA+tNeZOLg/wdmKfZHLn27qtqjrD4K1NFL7n04
 MXh+sjpXEcAD6sx9nXiwKFThNyRb7VjXbxEyD6dz+HHLFYM11C9WrXd0Frtenh2Ghg/7
 f/lhOCUx6GPbPLhhPrlEywdQLYV6r7l6409QTDg/drds/llTmesnGAOC8cL3Vqu2sVRN
 9GY480gokblIY6Qrz/NaPCK6RpWvT04eNdL6yWh+ThBWiFPjctTxPRYDKgn17mtN4gG/
 jxJ2oq6YPiijGBo5KDv51nFESp6oEY2PXywlsVYl2ZKgEisU1d1QEI/xztcSHqpURxfk
 u86w==
X-Gm-Message-State: AO0yUKVtMXUpvEKugcHPBmLJGcixWd7oUz8AudLhBrytHhYnu5GTWxmy
 cLkhCyADkA16JUfrNQjIuKX6H/GF3jbUse5/ahM=
X-Google-Smtp-Source: AK7set9tb0kUhrUjxgI2vwol4/BbTrl8YwR+gNiVfVFVrPh0+lXJmvir+CgU+TYgcT3sRswiwVL4QQ==
X-Received: by 2002:a17:90b:1b12:b0:234:b00f:3492 with SMTP id
 nu18-20020a17090b1b1200b00234b00f3492mr11129357pjb.34.1677108454723; 
 Wed, 22 Feb 2023 15:27:34 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a17090ad49000b00234e6d2de3dsm5008918pju.11.2023.02.22.15.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 15:27:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 12/28] accel/tcg/plugin: Use tcg_temp_ebb_*
Date: Wed, 22 Feb 2023 13:26:59 -1000
Message-Id: <20230222232715.15034-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222232715.15034-1-richard.henderson@linaro.org>
References: <20230222232715.15034-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

All of these uses have quite local scope.
Avoid tcg_const_*, because we haven't added a corresponding
interface for TEMP_EBB.  Use explicit tcg_gen_movi_* instead.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/plugin-gen.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 17a686bd9e..9b793ac62c 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -93,11 +93,13 @@ void HELPER(plugin_vcpu_mem_cb)(unsigned int vcpu_index,
 
 static void do_gen_mem_cb(TCGv vaddr, uint32_t info)
 {
-    TCGv_i32 cpu_index = tcg_temp_new_i32();
-    TCGv_i32 meminfo = tcg_const_i32(info);
-    TCGv_i64 vaddr64 = tcg_temp_new_i64();
-    TCGv_ptr udata = tcg_const_ptr(NULL);
+    TCGv_i32 cpu_index = tcg_temp_ebb_new_i32();
+    TCGv_i32 meminfo = tcg_temp_ebb_new_i32();
+    TCGv_i64 vaddr64 = tcg_temp_ebb_new_i64();
+    TCGv_ptr udata = tcg_temp_ebb_new_ptr();
 
+    tcg_gen_movi_i32(meminfo, info);
+    tcg_gen_movi_ptr(udata, 0);
     tcg_gen_ld_i32(cpu_index, cpu_env,
                    -offsetof(ArchCPU, env) + offsetof(CPUState, cpu_index));
     tcg_gen_extu_tl_i64(vaddr64, vaddr);
@@ -112,9 +114,10 @@ static void do_gen_mem_cb(TCGv vaddr, uint32_t info)
 
 static void gen_empty_udata_cb(void)
 {
-    TCGv_i32 cpu_index = tcg_temp_new_i32();
-    TCGv_ptr udata = tcg_const_ptr(NULL); /* will be overwritten later */
+    TCGv_i32 cpu_index = tcg_temp_ebb_new_i32();
+    TCGv_ptr udata = tcg_temp_ebb_new_ptr();
 
+    tcg_gen_movi_ptr(udata, 0);
     tcg_gen_ld_i32(cpu_index, cpu_env,
                    -offsetof(ArchCPU, env) + offsetof(CPUState, cpu_index));
     gen_helper_plugin_vcpu_udata_cb(cpu_index, udata);
@@ -129,9 +132,10 @@ static void gen_empty_udata_cb(void)
  */
 static void gen_empty_inline_cb(void)
 {
-    TCGv_i64 val = tcg_temp_new_i64();
-    TCGv_ptr ptr = tcg_const_ptr(NULL); /* overwritten later */
+    TCGv_i64 val = tcg_temp_ebb_new_i64();
+    TCGv_ptr ptr = tcg_temp_ebb_new_ptr();
 
+    tcg_gen_movi_ptr(ptr, 0);
     tcg_gen_ld_i64(val, ptr, 0);
     /* pass an immediate != 0 so that it doesn't get optimized away */
     tcg_gen_addi_i64(val, val, 0xdeadface);
@@ -151,9 +155,9 @@ static void gen_empty_mem_cb(TCGv addr, uint32_t info)
  */
 static void gen_empty_mem_helper(void)
 {
-    TCGv_ptr ptr;
+    TCGv_ptr ptr = tcg_temp_ebb_new_ptr();
 
-    ptr = tcg_const_ptr(NULL);
+    tcg_gen_movi_ptr(ptr, 0);
     tcg_gen_st_ptr(ptr, cpu_env, offsetof(CPUState, plugin_mem_cbs) -
                                  offsetof(ArchCPU, env));
     tcg_temp_free_ptr(ptr);
-- 
2.34.1


