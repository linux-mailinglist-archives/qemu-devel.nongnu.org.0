Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679976A6618
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 04:01:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCig-0002zv-DC; Tue, 28 Feb 2023 22:01:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCib-0002Xs-DF
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:25 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCiI-0004H7-Jx
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:08 -0500
Received: by mail-pl1-x62b.google.com with SMTP id a2so2127757plm.4
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 19:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DKuK62hxv2vXEM1ktPotl0poAfziKcuIlZAl/cEb0MU=;
 b=y61lSzMTlk3P/5yKLDD03ajoGxJYPOB1ToKby5FIVrt4TNisFCNV2IDU9jsO5v/QEr
 beVzb6Pf0RETC01yaO6qNusclEF1X+XnP+xj5aeMiTq7L8JQtf1rWOWA+Gst8yc+Lo4s
 N0oXcLsSGp9LvHkOuBTXAh05nurm2kRFen1EVfBk1Cks+fXZLdPVKjmpIVbxkawqLt6u
 eHn7CBzvJT8wNzS6kmQTp5l4fbV3AHf/+mQFoZGhmSqIVObft2sPw0z9l859vokmtX0x
 ieoAAvqwNvuitVAcl+6K3mvMLiH3wkV9SKMspj4SwiEcU3ZT7pNY2/Pm64dgIUudokSB
 Sa2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DKuK62hxv2vXEM1ktPotl0poAfziKcuIlZAl/cEb0MU=;
 b=7iWY2QjpOCI1AvgcbXfjIZCS0V6u5odQl7iKgX8xZvc5tP1Hobs4l4bp2Hh811NlQX
 vrLPsOzrmFulZS5vtv5E2phwb581lS91KYm2E+ilmPtq+Op99ApOiyAZeI9dPDE0aayS
 GfX+d9tEaL6bRUDWZyipHneoK0V/DhNRjkFD9TpwRmtbu2dkOM9ieF3Ul885a38s5FN3
 3k27XOlmZuuACspgiJHW1YLT/T/alumTRL5DVS5Nzoc6HFYZNCtvyCW84L/Hkxwim7qv
 otq3DPCkd1Xb5F/dfnyz08toyLCjTUrdEHfXmBCLT8EgpukL+o2S00IhLJbq+oEcfRYC
 1XMw==
X-Gm-Message-State: AO0yUKVC0LI85V8TMneUVQWDa768kp0Uuh3Xb0ejyS9Gwxp9hvAKU0hc
 v891AsdLyQItku+THI6dJmZeZUD7VmMVWF6Bst0=
X-Google-Smtp-Source: AK7set9VZHCLgBIgMcB5UTGgfnZ/lupaN39AQCkh9ZhVFNHnhiFZuioww3t5G6YRu18ZsEIZpnWhYA==
X-Received: by 2002:a17:903:284f:b0:19c:eb9a:76fe with SMTP id
 kq15-20020a170903284f00b0019ceb9a76femr4001218plb.62.1677639665015; 
 Tue, 28 Feb 2023 19:01:05 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a170902be0b00b0019aca830869sm7181444pls.238.2023.02.28.19.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 19:01:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 46/62] accel/tcg/plugin: Use tcg_temp_ebb_*
Date: Tue, 28 Feb 2023 16:56:27 -1000
Message-Id: <20230301025643.1227244-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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


