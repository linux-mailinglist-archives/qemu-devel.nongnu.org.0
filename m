Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B903D0959
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 09:04:04 +0200 (CEST)
Received: from localhost ([::1]:43274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m66Gy-0008Vt-17
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 03:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vr-0005C3-R7
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:17 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:42806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vq-0005bp-Cd
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:15 -0400
Received: by mail-pf1-x432.google.com with SMTP id y4so1478294pfi.9
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 23:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xElal7zBzDgeiDYpk/rqZK/vrTjKBD2Z3snsIesdaks=;
 b=mFVXkgNvQAgyiBL/sjul8Z/OlnKd6DUaI9QePkcWjA7v+2pGcykDA7yz6B8qf0SbCl
 qtq9GbQjGTLNr/9sqJ5MzB+9kRnPovb6ha5CEikIoTbm+OQWP0by4Oh0TkL+ODFCrvQI
 rpL/5kHkA6E5m+j+yp1pRq6irYeqiPm5hfiwuhn2C6WVdJ/TvHevDGg+vprK1oQS+1pc
 YirImxHEJTYs9fRGaEhRysOknS1TZ5+yh1TQNPVZVPLzXTlvIPX9E5MaNbTF23GWdcON
 HizcWa7R6XhXlkf+hfCKDriFuwZUsTR/BEiaVk5b3XdKvGkl8UXzlKZtX4SjwTm3BwBT
 c6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xElal7zBzDgeiDYpk/rqZK/vrTjKBD2Z3snsIesdaks=;
 b=m7o3EuV3clJ0t8kYURshQ3D1X6shu5nKeKtApbvVEkdF0OKGgD6Q3CCBzRlksu9vuZ
 PRZPF3Vxbtv0mhqBe0SS+M5KbebgfZsCSfC2aKyiQEcTf6UMqBqA/5iMfVVlXdjIdJrc
 IxfB68jHDrACV4xxPiU/n1qz3z/88kZjCZF5F4xPqHiG+kUtwgiXCTCUYcq6lpMbjxkq
 GOWWhF7bb3Wnu0HSGDVnCsuJbfn8utvmUyuJg9Tzq89Q2sLF6u6kgvihxJ7HcBD4XayZ
 8BHRUA2C8PEPd9+cpiKZuZPfY2JmpuOj4VDGkqq0xw9qUaAhI6KJ26tTXseA0EhqWdw9
 G1yw==
X-Gm-Message-State: AOAM531vvxkBsrEqkNjH8x+KSD/37XD/jgb+RlDCK6NP2ig0wAmAqoEd
 agpNL10g+Y/UWYdZ1X+lPIxyGbNIL3Eo2w==
X-Google-Smtp-Source: ABdhPJyQTSn1+7B4kUZ0mqcoNRrkQLtBtkC1SnvxKQ4LK9Dxu5sOinXIBlrEe9N7bL7Blc74R6QIDw==
X-Received: by 2002:a65:41c7:: with SMTP id b7mr34882402pgq.81.1626849733177; 
 Tue, 20 Jul 2021 23:42:13 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id q17sm21146132pjd.42.2021.07.20.23.42.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 23:42:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 15/23] target/openrisc: Drop checks for
 singlestep_enabled
Date: Tue, 20 Jul 2021 20:41:47 -1000
Message-Id: <20210721064155.645508-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721064155.645508-1-richard.henderson@linaro.org>
References: <20210721064155.645508-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB single-stepping is now handled generically.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/translate.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index d6ea536744..7e1aace63a 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -1659,11 +1659,7 @@ static void openrisc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
             /* The jump destination is indirect/computed; use jmp_pc.  */
             tcg_gen_mov_tl(cpu_pc, jmp_pc);
             tcg_gen_discard_tl(jmp_pc);
-            if (unlikely(dc->base.singlestep_enabled)) {
-                gen_exception(dc, EXCP_DEBUG);
-            } else {
-                tcg_gen_lookup_and_goto_ptr();
-            }
+            tcg_gen_lookup_and_goto_ptr();
             break;
         }
         /* The jump destination is direct; use jmp_pc_imm.
@@ -1680,19 +1676,11 @@ static void openrisc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
             break;
         }
         tcg_gen_movi_tl(cpu_pc, jmp_dest);
-        if (unlikely(dc->base.singlestep_enabled)) {
-            gen_exception(dc, EXCP_DEBUG);
-        } else {
-            tcg_gen_lookup_and_goto_ptr();
-        }
+        tcg_gen_lookup_and_goto_ptr();
         break;
 
     case DISAS_EXIT:
-        if (unlikely(dc->base.singlestep_enabled)) {
-            gen_exception(dc, EXCP_DEBUG);
-        } else {
-            tcg_gen_exit_tb(NULL, 0);
-        }
+        tcg_gen_exit_tb(NULL, 0);
         break;
     default:
         g_assert_not_reached();
-- 
2.25.1


