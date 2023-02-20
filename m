Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2B169D2EF
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:44:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUB8g-0008PP-3U; Mon, 20 Feb 2023 13:43:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6g-0004fT-Cl
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:49 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6b-00045u-SU
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:44 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 il18-20020a17090b165200b0023127b2d602so2372672pjb.2
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yGToGuwwYtvWTL4/oWkEUIL2elnwxjyqoTAnw+xRj6w=;
 b=EIu/snbx4VRgsF4sbaczRTcA5TX3pI0SzQqYznmdjkTiFppO5KkrYU+v6lbUYHcsgN
 HAXlsTcAvZvJFhd36qSz1XYkdmNo7BYL54aA+yC9N5S4vQBo64FqHNhtSuFoI3qERvHg
 OCbsgkBYWwirwC0CuU8nMABrfTC5fLGCRoP/17UFVuIxVlq1/gIx914ChU/5iAiXfNBw
 e7qtdoGE2+0tjTa5EkZTRoGnc/AJH5HkG/N5WXHD/WeXOW3r64PlbpIgmW3CosoZkUyc
 MTWxGJ5fh8kxyqdElc8DmZddZfa1lVfyOcm1rb6N8+ToTsF+8IHMXWXcE/OsyWHDNk+d
 7QAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yGToGuwwYtvWTL4/oWkEUIL2elnwxjyqoTAnw+xRj6w=;
 b=j2Fyb7OLjRz+S4c1SIAkH0/OTK7WtlfC42t0XkfzE0t2yb3YhGRIOyW//yb3GidVOA
 Lai1sNmyD4+7nS08XuFvXC/yj66zBP6Vp1kbCqYeWBzmFaAVcX9fLvHLyEW05U06o/jp
 RajGm5jfZcKIIQmkBfLwBQB3oFmypIji5l2UGzPWoor3zrqmq2vSKZFCkeiJpAg7ecPh
 lvf8BPncMM/escFzFagXBzLlwB8MX1Z1rUU8ZlXGcnPe17zFIZAQUAqu/9ROO7C3bSXK
 jyHMB4mi76KCj0/WM4tGMGllImyezgXHkxpxKSZ1i5Oo4+w1/0ZqeJnX1bVh2DrGzAOp
 4n4w==
X-Gm-Message-State: AO0yUKXahdLYKMbCjDbKtYVMxDVy/+ApW3R52fJrOqaDex4j20L9dN/c
 D/LbUZ2hbGr/+rlUci1IsX5ZGKDrekVAZ5dEKx0=
X-Google-Smtp-Source: AK7set/OAyfnkj3ZWgdrHfa9coLdaJH03j0SFa3Ih2FdbhQ1U/k0bPoa32fAYiVPtn/plKSi+399pA==
X-Received: by 2002:a17:903:234b:b0:19a:7f4b:3ef6 with SMTP id
 c11-20020a170903234b00b0019a7f4b3ef6mr3240792plh.3.1676918496245; 
 Mon, 20 Feb 2023 10:41:36 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jk20-20020a170903331400b0019258bcf3ffsm1911676plb.56.2023.02.20.10.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 10:41:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 22/27] target/s390x: Split per_breaking_event from
 per_branch_*
Date: Mon, 20 Feb 2023 08:40:47 -1000
Message-Id: <20230220184052.163465-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220184052.163465-1-richard.henderson@linaro.org>
References: <20230220184052.163465-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This allows us to update gbea before other updates to psw_addr,
which will be important for TARGET_TB_PCREL.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 4e39cf1646..8fbbbf8bbd 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -365,7 +365,6 @@ static inline bool per_enabled(DisasContext *s)
 static void per_branch_dest(DisasContext *s, TCGv_i64 dest)
 {
 #ifndef CONFIG_USER_ONLY
-    gen_psw_addr_disp(s, gbea, 0);
     if (per_enabled(s)) {
         gen_helper_per_branch(cpu_env, gbea, dest);
     }
@@ -375,7 +374,6 @@ static void per_branch_dest(DisasContext *s, TCGv_i64 dest)
 static void per_branch_disp(DisasContext *s, int64_t disp)
 {
 #ifndef CONFIG_USER_ONLY
-    gen_psw_addr_disp(s, gbea, 0);
     if (per_enabled(s)) {
         TCGv_i64 dest = tcg_temp_new_i64();
         gen_psw_addr_disp(s, dest, disp);
@@ -1169,13 +1167,14 @@ struct DisasInsn {
 
 static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
 {
+    per_breaking_event(s);
+
     if (disp == s->ilen) {
         per_branch_disp(s, disp);
         return DISAS_NEXT;
     }
     if (use_goto_tb(s, s->base.pc_next + disp)) {
         update_cc_op(s);
-        per_breaking_event(s);
         tcg_gen_goto_tb(0);
         update_psw_addr_disp(s, disp);
         tcg_gen_exit_tb(s->base.tb, 0);
@@ -1189,6 +1188,7 @@ static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
 
 static DisasJumpType help_goto_indirect(DisasContext *s, TCGv_i64 dest)
 {
+    per_breaking_event(s);
     tcg_gen_mov_i64(psw_addr, dest);
     per_branch_dest(s, psw_addr);
     return DISAS_PC_UPDATED;
@@ -1249,6 +1249,7 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
     }
 
     /* Branch taken.  */
+    per_breaking_event(s);
     if (is_imm) {
         gen_psw_addr_disp(s, psw_addr, disp);
     }
-- 
2.34.1


