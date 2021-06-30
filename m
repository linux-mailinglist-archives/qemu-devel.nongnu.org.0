Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C363B8887
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:35:25 +0200 (CEST)
Received: from localhost ([::1]:41038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyf3U-0008D6-4C
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0n-0005Bv-QC
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:37 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:34372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0j-00020j-Sn
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:37 -0400
Received: by mail-pf1-x42b.google.com with SMTP id i6so3343071pfq.1
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8W3E8oUQSB677QQyABV7B4p2F0hPm4epmS7TTIJ96Bk=;
 b=SlOIausg4Hz3hJmCWvLEkzRhqbskKyU7TpFEFXCuLEtxGbF90YnW306n14zNBG2GM0
 tT1EBK9KsRvRZZtvIv01L6ZBLVW4o10OdTfSxAaCCcCKIVimWqcPHC7XQThhtBI+LzO3
 g3g4s2bKn7vAEG1yr4UKcy/7Lzol+9HZd7E4hLfuw+RzJy9Mhfcshxv9Urp0ThsA4guR
 CAJZqVmTblshVILHQfPhzdFQP0fRNQTCTjE3tzpKcWvyQBaMMzf7C7D9vZkGmgpboMvu
 IJ/S8a80UpMxUNsIbAAGPdxSeywR1mPBdlFtbsxL36OyB0Mgk8oGENBK+IaJOujwBvN8
 XPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8W3E8oUQSB677QQyABV7B4p2F0hPm4epmS7TTIJ96Bk=;
 b=jmjf6pL89Gll81Z7pogI/+e//JXIwUpn6ZFWVMmbxhc6GIGW8H0pzxBOxJNaVX4dn1
 zko3qNis0VGYMhR9fitSt1+G59h0Y5Qz+ElNCNidhZktHq4q+8WzgiUAFmHsxQf/4A+4
 zvfo6KEpGMO1DOorT2U5d5JWMhfQ3RCTSz4Ooo6zhFfZVPKYXILY55BEFScb30w4RUWO
 j61JngiBMk6gWGVtMbOEj2N+BghFpxt6RGSGr/U6Re9PjohstPFTFqzHOL9I7OfXL1bC
 dnA419OiCEX0Ldn50aFxoVGmmhZJFJNbLXEhuAWNHWc2q60Z18GHiXKEX/+m7vJtDNg8
 vXPw==
X-Gm-Message-State: AOAM531oBjeHMGIgWVGXAxXhaiOFsbml8X/mkhuTuZSLcgc7BWhnhDXa
 zIqDWVSHGj113SLJMUzOE5gXcTDSvR0Ihw==
X-Google-Smtp-Source: ABdhPJzPCuHITqRac7URQ/mJzlqZpFikothdLaYVIm2BDr40MmuEtrQFibadPw15LeO+0wvb/+i6fg==
X-Received: by 2002:a62:1d84:0:b029:304:5af1:65f6 with SMTP id
 d126-20020a621d840000b02903045af165f6mr35035355pfd.80.1625077952590; 
 Wed, 30 Jun 2021 11:32:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/28] target/avr: Use translator_use_goto_tb
Date: Wed, 30 Jun 2021 11:32:06 -0700
Message-Id: <20210630183226.3290849-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Single stepping is not the only reason not to use goto_tb.
If goto_tb is disallowed, and single-stepping is not enabled,
then use tcg_gen_lookup_and_goto_tb to indirectly chain.

Cc: Michael Rolnik <mrolnik@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/translate.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index c06ce45bc7..8237a03c23 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -1083,14 +1083,17 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
 {
     const TranslationBlock *tb = ctx->base.tb;
 
-    if (!ctx->base.singlestep_enabled) {
+    if (translator_use_goto_tb(&ctx->base, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(cpu_pc, dest);
         tcg_gen_exit_tb(tb, n);
     } else {
         tcg_gen_movi_i32(cpu_pc, dest);
-        gen_helper_debug(cpu_env);
-        tcg_gen_exit_tb(NULL, 0);
+        if (ctx->base.singlestep_enabled) {
+            gen_helper_debug(cpu_env);
+        } else {
+            tcg_gen_lookup_and_goto_ptr();
+        }
     }
     ctx->base.is_jmp = DISAS_NORETURN;
 }
-- 
2.25.1


