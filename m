Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3CC69D2F2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:44:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUB8c-0007nA-O7; Mon, 20 Feb 2023 13:43:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6c-0004dJ-3m
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:47 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6W-0004CC-10
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:40 -0500
Received: by mail-pl1-x62c.google.com with SMTP id z2so2651815plf.12
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Gcs847vjJc3xC2UOWHkazgkIaAtl/2Q94u6UiZ63QI=;
 b=qXoF6sn60KHuqW07X9lDJSLj+rGUWa94GIASrnNxPi4V4w+DjVVRE6oN71BjEPqsGZ
 3qP6Emx7RRwW6Wck7AEfP04ABMb8zywhvTK5IWcX0XGl0bxJSw5IQtZoODo+d455MPxr
 8V7eOUXt2pmUfymdouVgQdZaSCZ81w+RC09WHtrFPLhkLR7s0y/mS7VOJL3NW5ub/h4N
 /grFONatbyO8jIvEO7zZW8tNaBzDHdy5o9w1yUUuAZ0IOuZRxfOh5V9mBQ8tX6uWGDz0
 V5ok+r9raB8R2eIqyjvZxRy6O06jmgwDlclyx1EBP5c//V+FpQZGLc2kHzReKjmZPU32
 d2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Gcs847vjJc3xC2UOWHkazgkIaAtl/2Q94u6UiZ63QI=;
 b=pYSQyxov0hjzPDf/vLO0WjbiL64wf54AifN4Nwbaiy8/F9Lj/5oMmEIxsskjPNckIq
 EJCbARZUH9/Jx+itRNOLbs5M/fvuJURCHoaQ++fLpCj8wau4NnNIvB2abf/xcE5bY/58
 tVKAnegGV1ZWXT4JLS4KQUUGjbF2S9dfZUT0hSxP70138ZdOLUiSYVzTDv6u3BKiy+fD
 b2GE91tJ4Go3+rI3f8zk1ZCnGfJk3t/b4JyWSsHFcJhFVY7dexp6P9wiqTaz31aI2FC/
 RWJq4NAhaLO6PawTLwtL1tAdOOlYOPN3ahHvuQ4q98hiRFpGU8QBLIhF590xdwoCx4un
 kD4g==
X-Gm-Message-State: AO0yUKW8YgkqDU6aGhiRLgMS5qRDiTfNVplwBGzhY5OIjtJc7vaonfoG
 adqETB4KPJS8mpAdCjgUmu+dd7vv9jBP0UmAEV8=
X-Google-Smtp-Source: AK7set/+9RSE+MucON9o85IG5z+4Cgs2+wKH4k4UZmVJWOo33L1tAivyWTGoXZB8NVeu15On0d/LQQ==
X-Received: by 2002:a17:902:e5cc:b0:19a:b754:4053 with SMTP id
 u12-20020a170902e5cc00b0019ab7544053mr3552864plf.26.1676918490562; 
 Mon, 20 Feb 2023 10:41:30 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jk20-20020a170903331400b0019258bcf3ffsm1911676plb.56.2023.02.20.10.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 10:41:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 19/27] target/s390x: Introduce help_goto_indirect
Date: Mon, 20 Feb 2023 08:40:44 -1000
Message-Id: <20230220184052.163465-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220184052.163465-1-richard.henderson@linaro.org>
References: <20230220184052.163465-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Add a small helper to handle unconditional indirect jumps.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 6757a0f44f..afa5f56fc4 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1205,6 +1205,13 @@ static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
     }
 }
 
+static DisasJumpType help_goto_indirect(DisasContext *s, TCGv_i64 dest)
+{
+    tcg_gen_mov_i64(psw_addr, dest);
+    per_branch(s, false);
+    return DISAS_PC_UPDATED;
+}
+
 static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
                                  bool is_imm, int imm, TCGv_i64 cdest)
 {
@@ -1235,9 +1242,7 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
             goto egress;
         }
         if (c->cond == TCG_COND_ALWAYS) {
-            tcg_gen_mov_i64(psw_addr, cdest);
-            per_branch(s, false);
-            ret = DISAS_PC_UPDATED;
+            ret = help_goto_indirect(s, cdest);
             goto egress;
         }
     }
@@ -1560,9 +1565,7 @@ static DisasJumpType op_bas(DisasContext *s, DisasOps *o)
 {
     pc_to_link_info(o->out, s);
     if (o->in2) {
-        tcg_gen_mov_i64(psw_addr, o->in2);
-        per_branch(s, false);
-        return DISAS_PC_UPDATED;
+        return help_goto_indirect(s, o->in2);
     } else {
         return DISAS_NEXT;
     }
@@ -1595,9 +1598,7 @@ static DisasJumpType op_bal(DisasContext *s, DisasOps *o)
 {
     save_link_info(s, o);
     if (o->in2) {
-        tcg_gen_mov_i64(psw_addr, o->in2);
-        per_branch(s, false);
-        return DISAS_PC_UPDATED;
+        return help_goto_indirect(s, o->in2);
     } else {
         return DISAS_NEXT;
     }
-- 
2.34.1


