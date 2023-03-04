Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 571C36AABE0
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 19:22:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYWTW-0006QP-Ao; Sat, 04 Mar 2023 13:19:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWTQ-0006OO-6q
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:19:12 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWTN-0003Me-Nc
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:19:11 -0500
Received: by mail-pg1-x52b.google.com with SMTP id h31so3295209pgl.6
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 10:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677953948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y9Yxuq9oSk+IAEhFz8O1INvxDLagZl+WTzfcEJCwEho=;
 b=GfgywBfz35AbuxjVfJlSAM1gvH+VLw23/4t+VJBgUUW/bnBNrNgUNdAjNIXjZ4JmAM
 RaVRzBhaN9sRilggkXHWaG08zvTCikRQvFhEKd1vVGrTCkeAMSjUIEcVrjjSk9a5ruO3
 fAlldyLtQ6Mm5wokPT4kMAZgxxKMrlE3mdKGzLK75jVgG+DPh7j7l36znE9qBNwIDM0D
 TAHjXAp731qmNnjcoWf1CyDBQLGvEPHsujRSkSIbYCvM4kpgLd8SneDa4u5NEwtWPXUv
 RwYMza1YUmXJ3Vy99cdR+BQWLSQOh59Q0gkEjxqS59N/WiPDX+hVW147l24ZHaji2R/q
 d1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677953948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y9Yxuq9oSk+IAEhFz8O1INvxDLagZl+WTzfcEJCwEho=;
 b=QlRYtqs+tcfNzU5n0cISYKD8VbU3QRJeQMxQ1XtZfu6iMIs3tgS+iSLM8xeMfu9MXo
 Z27YWOVV3VvR+aNaKzrdv1+zAO6mW4x5U55QWXAtyBMTEUdtzBBNy3LHbsTpVh8QqNRP
 oHic9IViVBikXb0CVcJkAE5jRRr3h7qs9s8PhTgm2fy9c0AD5fIAbqrxSMV6GNYg3rqh
 WQcpdoJIWa15gLYFRx6vbAt8ylFjHLzZHh/is31sjtHFad9Wl/HYaY75iDc5qcu/3r3b
 BXRKji+4XVAR7PH+AHdfesUrSXkkIZXiSS3qihgg64dml+0yunSvp3dNL3TvbX60Wu/u
 m+Ag==
X-Gm-Message-State: AO0yUKWo7Wze06ez4R1/m8n142ModxpTBQNGE3cVTBpIgpeqnakPKRs7
 1b33mMQ3am/dsKD8WxZE4JfgOMLpe/YvOyQ2I9yfaw==
X-Google-Smtp-Source: AK7set9kz5/f4kfVcIRR3KRzXxMlCQUM/U5KkibzjxKjXKONFVP9bdhAlke+72KV++G8+rz8Cw/Mhw==
X-Received: by 2002:aa7:9d11:0:b0:602:7c0:3afe with SMTP id
 k17-20020aa79d11000000b0060207c03afemr5912165pfp.26.1677953948385; 
 Sat, 04 Mar 2023 10:19:08 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:62b1:64d8:8207:f04e])
 by smtp.gmail.com with ESMTPSA id
 25-20020aa79259000000b005d866d184b5sm3529668pfp.46.2023.03.04.10.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 10:19:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH v3 07/20] target/mips: Drop tcg_temp_free from
 octeon_translate.c
Date: Sat,  4 Mar 2023 10:18:47 -0800
Message-Id: <20230304181900.1097116-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230304181900.1097116-1-richard.henderson@linaro.org>
References: <20230304181900.1097116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
---
 target/mips/tcg/octeon_translate.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/target/mips/tcg/octeon_translate.c b/target/mips/tcg/octeon_translate.c
index 6a207d2e7e..103c304d10 100644
--- a/target/mips/tcg/octeon_translate.c
+++ b/target/mips/tcg/octeon_translate.c
@@ -40,8 +40,6 @@ static bool trans_BBIT(DisasContext *ctx, arg_BBIT *a)
     ctx->hflags |= MIPS_HFLAG_BC;
     ctx->btarget = ctx->base.pc_next + 4 + a->offset * 4;
     ctx->hflags |= MIPS_HFLAG_BDS32;
-
-    tcg_temp_free(t0);
     return true;
 }
 
@@ -61,10 +59,6 @@ static bool trans_BADDU(DisasContext *ctx, arg_BADDU *a)
 
     tcg_gen_add_tl(t0, t0, t1);
     tcg_gen_andi_i64(cpu_gpr[a->rd], t0, 0xff);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-
     return true;
 }
 
@@ -83,10 +77,6 @@ static bool trans_DMUL(DisasContext *ctx, arg_DMUL *a)
     gen_load_gpr(t1, a->rt);
 
     tcg_gen_mul_i64(cpu_gpr[a->rd], t0, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-
     return true;
 }
 
@@ -103,8 +93,6 @@ static bool trans_EXTS(DisasContext *ctx, arg_EXTS *a)
     gen_load_gpr(t0, a->rs);
     tcg_gen_sextract_tl(t0, t0, a->p, a->lenm1 + 1);
     gen_store_gpr(t0, a->rt);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -121,8 +109,6 @@ static bool trans_CINS(DisasContext *ctx, arg_CINS *a)
     gen_load_gpr(t0, a->rs);
     tcg_gen_deposit_z_tl(t0, t0, a->p, a->lenm1 + 1);
     gen_store_gpr(t0, a->rt);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -142,8 +128,6 @@ static bool trans_POP(DisasContext *ctx, arg_POP *a)
     }
     tcg_gen_ctpop_tl(t0, t0);
     gen_store_gpr(t0, a->rd);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -167,10 +151,6 @@ static bool trans_SEQNE(DisasContext *ctx, arg_SEQNE *a)
     } else {
         tcg_gen_setcond_tl(TCG_COND_EQ, cpu_gpr[a->rd], t1, t0);
     }
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-
     return true;
 }
 
@@ -194,8 +174,5 @@ static bool trans_SEQNEI(DisasContext *ctx, arg_SEQNEI *a)
     } else {
         tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_gpr[a->rt], t0, imm);
     }
-
-    tcg_temp_free(t0);
-
     return true;
 }
-- 
2.34.1


