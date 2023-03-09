Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F206B2E4B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:12:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMaL-00052g-9N; Thu, 09 Mar 2023 15:09:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaF-0004Ua-WE
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:52 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaE-0001ah-91
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:51 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so3024688pjz.1
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392589;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DLZEot0hF6NAbXrKFQ/07RYgG9Dd/Q8qZBFDowmkBRE=;
 b=S+e3/6/9MVtvVwkJpSrd3h00AGY6JU+pnTfG3653lvayAX4Ceypoiba8Ve37XoX+/R
 XAQ3iQbf6aggmO/4+7sGsv/IV1dOV5xFhQVzg5MLoTFQXVfMP5FmRTQNafzcgTOhdLE+
 hk4ed3mL72V5ZddKNK8VYNZXLFzPKCdAfQzOwA7yW86joWwrTo3e4nq+/srLeHtycq1T
 mADYLiME88heGeUvdYn/cNXLhnXvmAy089u52no5Do6+b1418cYlFvFPaZfrpauWECAL
 rwwkaYNj0JT1Y+g+ahqYSZ+es2auz0FLOQhJwlnzZ2jjgPtzA/1m9YKpz1r3ik6ckWln
 rc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392589;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DLZEot0hF6NAbXrKFQ/07RYgG9Dd/Q8qZBFDowmkBRE=;
 b=IYk985tpeG1LJb+CgUNQ4W8h3q5aQwPzSI3xoW3dW3pJWR0DRNVT4BKAi6/F4bWdoq
 TGtBjFmvF75Ng/iFKziDU16ytZW4V2nNbhqfildWNs/49jrXeP3M7KIOIEJMaL4GaeP4
 HwlDe/JSXN3xIjLLbQ5JC6rlKeNPSwA5SsQyUzl0zK1L4B8BR8FgpcmTayUULeFiGXQE
 GBFRQGprxdVfqp4KYJz8sLLqxj7BhvXH1AC+FC64OLGU/XlLK6IAzsz5NeHUXHqLnBDU
 3A0Ot1CMcg/rU7ZcbwYD1MeZ+a9qWlyyDV4QWnvzS28GNF2Ve7Vszq2aHEia41GCL2fa
 gAsg==
X-Gm-Message-State: AO0yUKVpcwGsojpZLgshqToeMbIYPHhpzs9VXYROzGvH1Dl+FVkeBmC5
 ZrJqa4Lij04AiN5Z5kwHw9RQcdvUY8S7oD/B1KI=
X-Google-Smtp-Source: AK7set/KEbLxFbVLYwqBabDHT4anTs+p4vn9JZaXIpeEwgBsW8XnJfX9KURL063WzWOAuafL1WBUSA==
X-Received: by 2002:a17:903:22ce:b0:19d:90f:6c6c with SMTP id
 y14-20020a17090322ce00b0019d090f6c6cmr27571681plg.17.1678392588988; 
 Thu, 09 Mar 2023 12:09:48 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 64/91] target/tricore: Use setcondi instead of explicit
 allocation
Date: Thu,  9 Mar 2023 12:05:23 -0800
Message-Id: <20230309200550.3878088-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

This removes the only use of temp.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/translate.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 19cf4b6cc7..6b2065803f 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -3514,17 +3514,14 @@ static void decode_sr_accu(DisasContext *ctx)
 {
     uint32_t op2;
     uint32_t r1;
-    TCGv temp;
 
     r1 = MASK_OP_SR_S1D(ctx->opcode);
     op2 = MASK_OP_SR_OP2(ctx->opcode);
 
     switch (op2) {
     case OPC2_16_SR_RSUB:
-        /* overflow only if r1 = -0x80000000 */
-        temp = tcg_const_i32(-0x80000000);
-        /* calc V bit */
-        tcg_gen_setcond_tl(TCG_COND_EQ, cpu_PSW_V, cpu_gpr_d[r1], temp);
+        /* calc V bit -- overflow only if r1 = -0x80000000 */
+        tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_PSW_V, cpu_gpr_d[r1], -0x80000000);
         tcg_gen_shli_tl(cpu_PSW_V, cpu_PSW_V, 31);
         /* calc SV bit */
         tcg_gen_or_tl(cpu_PSW_SV, cpu_PSW_SV, cpu_PSW_V);
-- 
2.34.1


