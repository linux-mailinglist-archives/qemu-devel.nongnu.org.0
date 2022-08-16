Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 395C7596492
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 23:23:50 +0200 (CEST)
Received: from localhost ([::1]:41390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO42P-0004rV-Cf
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 17:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3HE-0005Ib-PJ
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:35:06 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b]:45719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3H7-0004VO-MB
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:35:04 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-11ba6e79dd1so7808389fac.12
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 13:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=qdoo/EFfZ9+xL61qXYRJd5BN7nP+QxbxeeGNggpMDL4=;
 b=u22ZyIGLJSrcJgxnhNPzQVYdrnflr6ghpy3rqUxNUiojETvR0MLU2apMWIRvYjEqHi
 IbfNQjJzUQjxMuO360eVSutUCJAcJR0wTRC3kEh3hLn/ycSvUm+j9A9TYnN0YddoOMLI
 nblCG8PihdVMBqA8l2/Ullw5RQEPYj2nd4x3j3Mbdd668TtvXkf461QhqP/7LyvLxGPQ
 1xawIPiDCcdM8R7KAa1PardmKyjcMQSUMjTnCfZEMw/9IZxyhDTFdxAxs23FS/nF1HWE
 zCH9c0+2buSn7uxHKIW6XJWI4O6mZhpoW2EV1XYvJ0KW6iPgSTVahf4Ee/jtsQTPqoY2
 rGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=qdoo/EFfZ9+xL61qXYRJd5BN7nP+QxbxeeGNggpMDL4=;
 b=KMhEcobRCSowKV4oaF8e7WfbyfWpjhKGJssdBcqPtE4Fw3/Iqll+4ZcpSXdhydZeXK
 XfJyhCEOdDi/YMJah/8bsdLZRoxU4FFO7AmkVLo096kFipNFu+4ZdkrsGCj/qXR1JfwM
 ALbsjw15Q1Faxj0fKbRoJsl4ZsHNOnYkX5fBcKMn+yoV19qRQOj+dbkri3zYMrGWxwch
 cDBjC8EC3NO3kTEz+qGehY9mlqIClwm27V9WoU1whvg31u3/CIH++dEgKqTwsznHv/+h
 VLewjcWr1JxL91OTf0CVDrjybM/TQULclkBFgfJ0v8BUkS1aT7z97eS/rWk+WLdUC/rW
 YgEw==
X-Gm-Message-State: ACgBeo2ePr6eaHTKaooaw0JuyFo57jaaYlWBM1QHw9GXHbBjkUE2jrek
 OAVF0nOxC+lTlujPBhsxTKu/CMdqO/su0w==
X-Google-Smtp-Source: AA6agR6KekUm+FhkES1zQq5teMKAOnDNUYbcnFJIqtIOOzoY/ziSfNKrrULXyCi/1fylMrKkDLN5UQ==
X-Received: by 2002:a05:6870:a2d0:b0:11c:3148:c44c with SMTP id
 w16-20020a056870a2d000b0011c3148c44cmr166044oak.38.1660682097001; 
 Tue, 16 Aug 2022 13:34:57 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 13:34:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 25/33] target/arm: Introduce curr_insn_len
Date: Tue, 16 Aug 2022 15:33:52 -0500
Message-Id: <20220816203400.161187-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A simple helper to retrieve the length of the current insn.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     | 5 +++++
 target/arm/translate-vfp.c | 2 +-
 target/arm/translate.c     | 5 ++---
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index af5d4a7086..90bf7c57fc 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -226,6 +226,11 @@ static inline void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
     s->insn_start = NULL;
 }
 
+static inline int curr_insn_len(DisasContext *s)
+{
+    return s->base.pc_next - s->pc_curr;
+}
+
 /* is_jmp field values */
 #define DISAS_JUMP      DISAS_TARGET_0 /* only pc was modified dynamically */
 /* CPU state was modified dynamically; exit to main loop for interrupts. */
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index bd5ae27d09..94cc1e4b77 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -242,7 +242,7 @@ static bool vfp_access_check_a(DisasContext *s, bool ignore_vfp_enabled)
     if (s->sme_trap_nonstreaming) {
         gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
                            syn_smetrap(SME_ET_Streaming,
-                                       s->base.pc_next - s->pc_curr == 2));
+                                       curr_insn_len(s) == 2));
         return false;
     }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9474e4b44b..638a051281 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6660,7 +6660,7 @@ static ISSInfo make_issinfo(DisasContext *s, int rd, bool p, bool w)
     /* ISS not valid if writeback */
     if (p && !w) {
         ret = rd;
-        if (s->base.pc_next - s->pc_curr == 2) {
+        if (curr_insn_len(s) == 2) {
             ret |= ISSIs16Bit;
         }
     } else {
@@ -9825,8 +9825,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             /* nothing more to generate */
             break;
         case DISAS_WFI:
-            gen_helper_wfi(cpu_env,
-                           tcg_constant_i32(dc->base.pc_next - dc->pc_curr));
+            gen_helper_wfi(cpu_env, tcg_constant_i32(curr_insn_len(dc)));
             /*
              * The helper doesn't necessarily throw an exception, but we
              * must go back to the main loop to check for interrupts anyway.
-- 
2.34.1


