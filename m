Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D3367C9FB
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:32:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0La-0003Ev-Bh; Thu, 26 Jan 2023 06:23:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LU-0002xI-V3
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:09 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LS-0003eA-PX
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:08 -0500
Received: by mail-wr1-x435.google.com with SMTP id m14so969078wrg.13
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vuHIkf4e6GqtJJGRDN7Gz8dOSuK3Oawb4EIUEUIUh9o=;
 b=B8K0411TdwY+DKBgVJXc7IYNsW9FyFIzT3N6xfcBP91n5xTPuf0/FfqZXLIFa4glHh
 gcmQ3e7Ztrf8PeFrdXKG8AkXfJtV9uqGz2ItJma69QhA+bdQTfHLwkSevxkPaxN1oUjx
 EkjHJUMM/JWpx4TEsxgBiD/XPMNDW11S50d3hLfH+x79lE2aP+fbsJnibsZkS0t5vRY/
 3OFoskaYpUH/KMGCRzcw/nUg2fVpJrRiKmvE1xX3LJoVpFaSQOuPDfYYgxHi9HeeWnHd
 eoOKtw5aStXtd8bRx3cOQbBrbkAJjEJ7MFzUg1j50BnNrVJEkgUw23fJKoxgb3DM+JB1
 9D5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vuHIkf4e6GqtJJGRDN7Gz8dOSuK3Oawb4EIUEUIUh9o=;
 b=dd3hdK7iyAG0lObeKl0AWz9H6aTWHY27XCdZgxCiRqwIYkJZlXWmC5zKfdFImeKI9z
 2a/usD+kxYeEdfBRl/U5aUIqQKT1UUiqCrF/rDgOVL3nYOwA/yIR60VId278EyU44/FR
 /kkfWqztkRNPPDgIFiUMk/qsI0pIZIakTwF8FVaKajI5sTGpoQxKMngt3rJsmXtCX+h+
 PluPrpO/4BvSeKJdmSzLUrqQxiJmputBLncV0mK+T1IGxiIG6/K17pAakLN9/eE2l0kj
 6yZFZfyT7sb7Yc0SyopQe5+mfI+hTmEuVw71ppnLfuv8kIM7RUhVaZDB3FgmqEVio7PN
 vF5w==
X-Gm-Message-State: AO0yUKUFGuBA7w0wXuYcQqfmqu3PTsnZ20YPHA3jpdjFyoBna6YzAchb
 OQ2mJeACwSuxoHLSp9R3c8PduQ==
X-Google-Smtp-Source: AK7set8AWvS9UpeEoBWw/tVS22IgcPYKsX/LwrOHtGoczjuCGFai0S2nudMW2+sXC+yfQ/Lv+O7PIA==
X-Received: by 2002:a05:6000:1f05:b0:2bf:bc38:17c1 with SMTP id
 bv5-20020a0560001f0500b002bfbc3817c1mr4802157wrb.4.1674732185848; 
 Thu, 26 Jan 2023 03:23:05 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q3-20020adff503000000b002bfae1398bbsm1042967wro.42.2023.01.26.03.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:23:01 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A6C111FFCF;
 Thu, 26 Jan 2023 11:22:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Emilio Cota <cota@braap.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 32/35] translator: always pair plugin_gen_insn_{start,
 end} calls
Date: Thu, 26 Jan 2023 11:22:47 +0000
Message-Id: <20230126112250.2584701-33-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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

From: Emilio Cota <cota@braap.org>

Related: #1381

Signed-off-by: Emilio Cota <cota@braap.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230108164731.61469-3-cota@braap.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230124180127.1881110-33-alex.bennee@linaro.org>

diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 061519691f..ef5193c67e 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -100,19 +100,24 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int max_insns,
             ops->translate_insn(db, cpu);
         }
 
-        /* Stop translation if translate_insn so indicated.  */
-        if (db->is_jmp != DISAS_NEXT) {
-            break;
-        }
-
         /*
          * We can't instrument after instructions that change control
          * flow although this only really affects post-load operations.
+         *
+         * Calling plugin_gen_insn_end() before we possibly stop translation
+         * is important. Even if this ends up as dead code, plugin generation
+         * needs to see a matching plugin_gen_insn_{start,end}() pair in order
+         * to accurately track instrumented helpers that might access memory.
          */
         if (plugin_enabled) {
             plugin_gen_insn_end();
         }
 
+        /* Stop translation if translate_insn so indicated.  */
+        if (db->is_jmp != DISAS_NEXT) {
+            break;
+        }
+
         /* Stop translation if the output buffer is full,
            or we have executed all of the allowed instructions.  */
         if (tcg_op_buf_full() || db->num_insns >= db->max_insns) {
-- 
2.34.1


