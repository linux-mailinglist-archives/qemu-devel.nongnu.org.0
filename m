Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 895423D47F7
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 15:52:05 +0200 (CEST)
Received: from localhost ([::1]:36568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7I4S-0007FZ-Kf
	for lists+qemu-devel@lfdr.de; Sat, 24 Jul 2021 09:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7I1c-00053L-Uv
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 09:49:08 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7I1b-0000kU-AE
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 09:49:08 -0400
Received: by mail-wr1-x432.google.com with SMTP id o1so5365023wrp.5
 for <qemu-devel@nongnu.org>; Sat, 24 Jul 2021 06:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c7z+GYhXxuCb+T04d1yFr2qL06daIAh24I6xSy8/9AA=;
 b=d3GgIb2i4Ho3PuewNAu7P3gs29cFYb6QYF8f9/cf+kko92+EgFVWp3SkqCIZcYLxu4
 JPumIGi8qNSkkc5eSMQdJvM076UvCTfl20C4+A3/F4hhj894uyPNIpNOLaI4QcRFORm2
 RyfozTJ+CeQyaiJPKMSnrm19XbEdEdP6Vr/33XVYEom4iL+EgD3tAYpHdFwS8eUxjkod
 kBuODqbFPuvQYbJjJ2HS/MR/9FS5Jo9kBf0ETsA53Bi4hW+CDJ6VrXQUdYYXj4qr6wWn
 HBOxYAOn2v6YEU2CaM4YdwCh2Hxeeo4GN4+P2ruU0iLmK6jDtzvHtJ23+YypTR55s+a7
 /LxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c7z+GYhXxuCb+T04d1yFr2qL06daIAh24I6xSy8/9AA=;
 b=K1S01woIqJ2TbUHXMl+EWJ4TclaFDwZ0L5zDNeF8iYnEyGF+bcH1ri7yJKjOeyVgMF
 DE6lqKTYWCqCyN+Ed53H6YFYsiQTzmZ1G+ZczetQAhVc5zNJCPSPr4nccTf0pI7vZc9T
 860YWfuziMj5MON3drN3px7Uw+eLn2TgAHVxhXJ65wmvbC+MvMphC4Qg48MWeITi5pAQ
 xxh2p5TlULTxhJKlFaw1WPCheg4I0DgGjak9hU2KOcrX2ANY4cUKa7/fG/xZpaKLgLEo
 ZKanZqMtuyrhyMpPIA/x8QjCjxaT0fVa6/dI7ri1xxm4cLwJgOGAjkEhApGZR+fbKwS4
 +NvA==
X-Gm-Message-State: AOAM531rJb5Ab/E7th7q1P7MXD7CKUDa7uYGFvnj/3t6kFSuNKogcmyP
 wgOsZn8P+NaOXFDvv5J/vgWwjAdg178Hpw==
X-Google-Smtp-Source: ABdhPJyY71jOPe9WibfyTlWc6jbQ9Zn/SAkk6/KtDC+yZVplGFO65E2AutFCdji28JUxfUOp8ZuBUw==
X-Received: by 2002:a5d:67cc:: with SMTP id n12mr10252848wrw.131.1627134545584; 
 Sat, 24 Jul 2021 06:49:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n5sm34690344wri.31.2021.07.24.06.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 06:49:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 1/2] target/sparc: Drop use of gen_io_end()
Date: Sat, 24 Jul 2021 14:49:01 +0100
Message-Id: <20210724134902.7785-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210724134902.7785-1-peter.maydell@linaro.org>
References: <20210724134902.7785-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The gen_io_end() function is obsolete (as documented in
docs/devel/tcg-icount.rst). Where an instruction is an I/O
operation, the translator frontend should call gen_io_start()
before generating the code which does the I/O, and then
end the TB immediately after this insn.

Remove the calls to gen_io_end() in the SPARC frontend,
and ensure that the insns which were calling it end the
TB if they didn't do so already.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/sparc/translate.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 11de5a49631..bb70ba17deb 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -3401,7 +3401,8 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         tcg_temp_free_i32(r_const);
                         gen_store_gpr(dc, rd, cpu_dst);
                         if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
-                            gen_io_end();
+                            /* I/O operations in icount mode must end the TB */
+                            dc->base.is_jmp = DISAS_EXIT;
                         }
                     }
                     break;
@@ -3454,7 +3455,8 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         tcg_temp_free_i32(r_const);
                         gen_store_gpr(dc, rd, cpu_dst);
                         if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
-                            gen_io_end();
+                            /* I/O operations in icount mode must end the TB */
+                            dc->base.is_jmp = DISAS_EXIT;
                         }
                     }
                     break;
@@ -3588,7 +3590,8 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         tcg_temp_free_ptr(r_tickptr);
                         tcg_temp_free_i32(r_const);
                         if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
-                            gen_io_end();
+                            /* I/O operations in icount mode must end the TB */
+                            dc->base.is_jmp = DISAS_EXIT;
                         }
                     }
                     break;
@@ -4582,7 +4585,8 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                                 }
                                 gen_helper_wrpstate(cpu_env, cpu_tmp0);
                                 if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
-                                    gen_io_end();
+                                    /* I/O ops in icount mode must end the TB */
+                                    dc->base.is_jmp = DISAS_EXIT;
                                 }
                                 dc->npc = DYNAMIC_PC;
                                 break;
@@ -4598,7 +4602,8 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                                 }
                                 gen_helper_wrpil(cpu_env, cpu_tmp0);
                                 if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
-                                    gen_io_end();
+                                    /* I/O ops in icount mode must end the TB */
+                                    dc->base.is_jmp = DISAS_EXIT;
                                 }
                                 break;
                             case 9: // cwp
@@ -4697,10 +4702,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                                     gen_helper_tick_set_limit(r_tickptr,
                                                               cpu_hstick_cmpr);
                                     tcg_temp_free_ptr(r_tickptr);
-                                    if (tb_cflags(dc->base.tb) &
-                                           CF_USE_ICOUNT) {
-                                        gen_io_end();
-                                    }
                                     /* End TB to handle timer interrupt */
                                     dc->base.is_jmp = DISAS_EXIT;
                                 }
@@ -5327,9 +5328,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                                 gen_io_start();
                             }
                             gen_helper_done(cpu_env);
-                            if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
-                                gen_io_end();
-                            }
                             goto jmp_insn;
                         case 1:
                             if (!supervisor(dc))
@@ -5340,9 +5338,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                                 gen_io_start();
                             }
                             gen_helper_retry(cpu_env);
-                            if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
-                                gen_io_end();
-                            }
                             goto jmp_insn;
                         default:
                             goto illegal_insn;
-- 
2.20.1


