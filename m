Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0C5681C21
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:02:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMbGR-0000Ri-Gf; Mon, 30 Jan 2023 16:00:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbG4-0008HS-0p
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:00:11 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbFz-0005Gu-La
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:00:06 -0500
Received: by mail-pg1-x52d.google.com with SMTP id v3so8583094pgh.4
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9QzDuYhpKFFA2gUguenBfDgLvy1ufqCAqRSkJft3ioA=;
 b=BpDTKpfL0DrBEX9cTkmufwPCKPUM8pCpR4EDfAebKSgCCvBWx6ejloPli+4fmkr79t
 kncdTQ0LaznwK5pW5QeXNcbGpiHtaF30RuEPllGOG+M+CC58SYiMHxdROMTxvepQF3u4
 gl05WQrma39/NHftE0H/ieice4p6Bwl4tKVfs8EqXVNV55rLHX9CABAg0Yk6alSIEH1o
 9JZZHwJe1nbpEYVPpekKA3udqtsU/vO69nHK2noruLSUkprT8UA2fjKSv0duJ1QK9bdL
 tc1NvJbLhgTATEP27XRgKwtQCwPR6Anr+9BiG6VTWppGZQ86bkivbdcS1Is2zzyg5AJW
 uotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9QzDuYhpKFFA2gUguenBfDgLvy1ufqCAqRSkJft3ioA=;
 b=BsmsC0iSI1jPbV6E1UyE4BfRMvAmYtgrXMRdhxOQcLcoKNd1xQ/F6WG1nponhPgscx
 6wKLQxRhUBWT8xtLoDyVOZZ05PZ7OXBTYaHEUrh98pO2P7AJQMhvhLTXEeD6/C32Jmpb
 +jRBo/owx589kjZirAMXD/vcjkOu00AEAOeBXXdqpYg+DpOkdn77QbSiXvzi5EKxP0fo
 011iSuYD+TQJJdtVjOXOwt4mj7WmTv70klvJjVxUS8jB7o5pjpjtYXNGilWfHx+jWC2k
 NRZhwzKfT7YVPSV6n2wnZivkPzMuwjAMd69f5apVdw9U/Sj9jLZPZOBlyGN7ZnvQ8mGZ
 vuGg==
X-Gm-Message-State: AO0yUKX1e6zJEux5e1McBQ+uzYVmnRNPX1Q9yIH4e+QnSqVLA79bgUe5
 Usev36Na8DQV5Al/IVRB1hCX3kR+XohUcqch
X-Google-Smtp-Source: AK7set+qfDunj1wcLCBd0ZPpUGc/QFKilmnL0l6pqqG5Mvv+exIrvWO4q02jzplmVk0kgs/r8oo2yA==
X-Received: by 2002:a05:6a00:1404:b0:58b:bce2:7eb7 with SMTP id
 l4-20020a056a00140400b0058bbce27eb7mr10377945pfu.10.1675112400540; 
 Mon, 30 Jan 2023 13:00:00 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 x10-20020aa79a4a000000b00593eb3a5e44sm102933pfj.37.2023.01.30.12.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:00:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	cota@braap.org
Subject: [PATCH 12/27] accel/tcg/plugin: Use tcg_temp_ebb_*
Date: Mon, 30 Jan 2023 10:59:20 -1000
Message-Id: <20230130205935.1157347-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130205935.1157347-1-richard.henderson@linaro.org>
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/plugin-gen.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index c7d6514840..ea875c0990 100644
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


