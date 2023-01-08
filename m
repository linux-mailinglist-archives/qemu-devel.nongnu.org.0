Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 707EB6616D4
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 17:49:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEYqH-0006in-7o; Sun, 08 Jan 2023 11:48:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pEYqE-0006gA-J0
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 11:48:14 -0500
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pEYqD-0000Q9-40
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 11:48:14 -0500
Received: by mail-qv1-xf33.google.com with SMTP id j9so4694794qvt.0
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 08:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bfHq7d6gEeqDcPDN5XCy/P/V1tIeaifeaACu/hJYYAI=;
 b=0kTMznWqh+avjIW3JXqlsnVR8vzd7KkcmsE6WgY1wVx9OqjeYaDq0YeJVZhlV5+3Rw
 jeG2wcF5pBd1gRONVdFO9e3X5gfjuAMJcxkDnontL028yo2/4RiCaBRL9iEdlqy6ZiiU
 kJ1mlhO0fQI84Kl5odNfsn/swEOsby9rQAJExODqhOH6kVI8QRFZqCC+H2wTVjcUcmIO
 W99oF5vLewauU8DtwSNZRvGkDtEopplI8vlxwGO+asXhj4lY/3IrHLyzEJagyrvsVBvY
 zt4qGcs7SAnq8/SPY9UyuVbu3FX9h9xUASFr+mHnryTNsHX5nQbe3Zm2W6p2jIsFKUAH
 BGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bfHq7d6gEeqDcPDN5XCy/P/V1tIeaifeaACu/hJYYAI=;
 b=64mF/fDJuixUY1wv3qpjy+R+3fTBtLbT94/AmAWUQR+drLaztIH7MbGEjQXhf3A+qG
 wgjlm5AycUILGVw9o0FWS36s10qfb0+TlGxfpLAwnZAQgfliysdiQlCZZNqdrUhb/DiH
 jLVQYO82fl8qto8bsB3hADjYJTRsXGDIeAVmDUBGS5u3pYnc9Oqs0lW0onE220ktmrwN
 7U3AhdxB+v9duhsBPHT7VgoQvNlLN4imU0KKk+qSehXlSB3DBAGGy/HINYOwI04O/hRV
 7lOzqlj2c+237Xg8hDQAtU88y1Da9C1HON3JGgQtfEWDwEqObBVgGkn5YyCda18PavCk
 JJ1A==
X-Gm-Message-State: AFqh2krvcflTh2DQlJmDlafm0v/z8miAeMMpdlmrlRXoF/L/uwXXHqe1
 yPglJl0zbrxV8GeIP/yc2N1x/wVd+i5iOGWWS+Y5DA==
X-Google-Smtp-Source: AMrXdXt3KLZnifqhYTxinAzAtqiiTLprsDw1jeoXfeiiY0aQBO/ez4Z5tDi71xQAG9JKGDagCuVZLg==
X-Received: by 2002:a05:6214:5a07:b0:532:1ebe:84c8 with SMTP id
 lu7-20020a0562145a0700b005321ebe84c8mr11351759qvb.2.1673196491988; 
 Sun, 08 Jan 2023 08:48:11 -0800 (PST)
Received: from localhost ([185.156.46.146]) by smtp.gmail.com with ESMTPSA id
 y10-20020a05620a25ca00b006fa4cac54a5sm3915882qko.72.2023.01.08.08.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 08:48:11 -0800 (PST)
From: Emilio Cota <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aaron Lindsay <aaron@os.amperecomputing.com>, Emilio Cota <cota@braap.org>
Subject: [PATCH 2/4] translator: always pair plugin_gen_insn_{start, end} calls
Date: Sun,  8 Jan 2023 11:47:29 -0500
Message-Id: <20230108164731.61469-3-cota@braap.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108164731.61469-1-cota@braap.org>
References: <20230108164731.61469-1-cota@braap.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2607:f8b0:4864:20::f33;
 envelope-from=cota@braap.org; helo=mail-qv1-xf33.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

Related: #1381

Signed-off-by: Emilio Cota <cota@braap.org>
---
 accel/tcg/translator.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

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


