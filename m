Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA516630F9
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:10:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyRk-00032Q-MF; Mon, 09 Jan 2023 15:08:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRf-0002vk-Q6
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:36 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRd-0007QA-9L
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:35 -0500
Received: by mail-pl1-x62e.google.com with SMTP id w3so10776423ply.3
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fuFmEK8Iwf94SJtJ1ovewqobkADHJCdvU7OnItfY0Yw=;
 b=hOHop+L0xydJi1wUplFj/YjpLaRujrORDC+Ljhs1ZCgFepO35+Cs4PQP7cheDS9zLt
 miXWhAO4CoZDFh7OWSWfL7j5E4uRxXzzpdLpvZP1W4OqCay3BFnqBZToNEjLMDotb4tS
 tKeB1vPq5sghW2MMYqWSrs9NMT42RVqS6mHLjucN74WjjkDYK5vnmycsRhydf13BcF6p
 ZvbuOL7TGzNqWl2Q3DMjWYFQEAJL44AU0bEQ6XTUt0vHUCzcIN1HVGCtTSDcIAZeMv6S
 8E6AvivO6zLtEu5CWFBiHkTAxZJ15eZPVt/IxxtZBK0Um85j5qYBqFGD0vu9CByDK1v1
 JGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fuFmEK8Iwf94SJtJ1ovewqobkADHJCdvU7OnItfY0Yw=;
 b=brJrWTE78Y6MtBKS/3riAu5VDK1m3a6soHzTA/+Qq+zXuypmCM7LuqxQSgf3OgUPIK
 9ZTcMed1Sw002La/a/PQvGqxb5K4A1N+BkhxmNQWcHgJ0ibBPhYPkiWnhuf3XNLyVJy/
 7/Wa481F4nBYwBzheJXzyU0QqykXzRQSGLnJa3HJ1dYdqMGv2KdAnYQm3CUbUi3fgwJl
 6fEYhPsVbksVnD17j/a82Y6wIKt/ovJ3gA4c9Ops5GU7r2kEtEgZSNZqDFiP1TmvdIsO
 zPj3MgiAzSZ/DFPlZyzlEjrDIGDHuPluS2sVL7BRChGDXGt8kpO/hms6bewOcinhCEUu
 XhPg==
X-Gm-Message-State: AFqh2koGFXl4Plb4tLsk5gqEBIkslnAvndc134XjyJRL85VtJC3o5zvm
 3bvUnjXSIY5FxPHNChdbyCS/ALxQHFdjViEc
X-Google-Smtp-Source: AMrXdXuNusuv3hz4l1wrqgQUTshj0AjZ22ObpzeRQkfB39kwxYILXy42jZcBQfV9Upc0FPJesDBbAw==
X-Received: by 2002:a17:90b:2291:b0:226:43ba:54af with SMTP id
 kx17-20020a17090b229100b0022643ba54afmr34011919pjb.2.1673294912268; 
 Mon, 09 Jan 2023 12:08:32 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a384200b0022727d4af8dsm577574pjf.48.2023.01.09.12.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:08:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 09/27] target/s390x: Remove pc argument to pc_to_link_into
Date: Mon,  9 Jan 2023 12:08:01 -0800
Message-Id: <20230109200819.3916395-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109200819.3916395-1-richard.henderson@linaro.org>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

All callers pass s->pc_tmp.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index b41f5af988..fadb87ad4a 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -174,8 +174,10 @@ static void gen_psw_addr_disp(DisasContext *s, TCGv_i64 dest, int64_t disp)
     tcg_gen_movi_i64(dest, s->base.pc_next + disp);
 }
 
-static void pc_to_link_info(TCGv_i64 out, DisasContext *s, uint64_t pc)
+static void pc_to_link_info(TCGv_i64 out, DisasContext *s)
 {
+    uint64_t pc = s->pc_tmp;
+
     if (s->base.tb->flags & FLAG_MASK_32) {
         if (s->base.tb->flags & FLAG_MASK_64) {
             tcg_gen_movi_i64(out, pc);
@@ -1534,7 +1536,7 @@ static DisasJumpType op_ni(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_bas(DisasContext *s, DisasOps *o)
 {
-    pc_to_link_info(o->out, s, s->pc_tmp);
+    pc_to_link_info(o->out, s);
     if (o->in2) {
         tcg_gen_mov_i64(psw_addr, o->in2);
         per_branch(s, false);
@@ -1549,7 +1551,7 @@ static void save_link_info(DisasContext *s, DisasOps *o)
     TCGv_i64 t;
 
     if (s->base.tb->flags & (FLAG_MASK_32 | FLAG_MASK_64)) {
-        pc_to_link_info(o->out, s, s->pc_tmp);
+        pc_to_link_info(o->out, s);
         return;
     }
     gen_op_calc_cc(s);
@@ -1579,7 +1581,7 @@ static DisasJumpType op_bal(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_basi(DisasContext *s, DisasOps *o)
 {
-    pc_to_link_info(o->out, s, s->pc_tmp);
+    pc_to_link_info(o->out, s);
     return help_goto_direct(s, (int64_t)get_field(s, i2) * 2);
 }
 
-- 
2.34.1


