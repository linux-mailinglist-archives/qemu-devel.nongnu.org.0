Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E1967A0DE
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:08:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNhc-0005Gv-Vb; Tue, 24 Jan 2023 13:07:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhF-0004yh-3X
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:03 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhD-00073e-CE
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:00 -0500
Received: by mail-wr1-x434.google.com with SMTP id b7so14737599wrt.3
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 10:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yF79W/oG8BIP2TY7X/k2rfY64Zx5JTk5QXqtO8k21/c=;
 b=ekgFWCiAljHyOA3AgWNH51A0FrWr/r1mG5jZkolFJgUjIjqCcWLQ9SViPOMIc0DnBA
 hHZWBgk1xmcDcEO9ghLc6LIJqrug0hwwG1llL39Pqrl1IhCuf3oEZgzSsAMTZxDqxb9s
 dm/81BCOmU03h5jtAi90NU3GnPtgHkQ5tMG5L2eZilaAW7tvAlyWmgMAJUYqGQsJvR8+
 Z7WMFdRCOl0NWe2tPKEzPxlEiAf1IXDTrnrmYO6u4iiDFoJhdK+yju+RXYg6T7xkfORM
 baS4MFHdUwxlfQFm5OwLVH91jWBXh/1pXNROjCAcAZ1u4rNsEdCyQ6bOpqyYYx6FixBC
 e9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yF79W/oG8BIP2TY7X/k2rfY64Zx5JTk5QXqtO8k21/c=;
 b=NzHz0S514NUN/T2aY58YSnkvRJvXzg+RW+ZYFq5hktu+47FMob1hDLNaiDY6xvWZTw
 uldeVItO9EvpG3AZTkiINqos0sMtet//5Va8r5VNNvV4bwR25qugMOlHUI4zmAbeFhCC
 14W43QAUM0OoKFBt0xee+OI4XpBGpHPqtOGhMwR4dHNPFvE1sADTE/vre9KLZS/2fVRJ
 pcIdyAHynspW1tQfwqgjBMr/EmgDurrmPEnTCqc475b92UUgN74IbIOQoHzAqVR7pn7Z
 Yn7O3gywKVpDMg2K/1837mZE3YvzCSVTXyOLF0vtqDsMk5Ducfx8Hy3mnO2kXy2lWCUg
 rYvQ==
X-Gm-Message-State: AFqh2kqagfyeQLqEYbwKslOFQzvcxKuY0oCWqfJwGHQSS7L9lfuLho7q
 jt3PWqzPCUmmz004FeYUYwpgbg==
X-Google-Smtp-Source: AMrXdXtKc9rQZMZioj9sLzYynVvlcRznxyzfUtKemGtFONrm6kxPJBgot/7jA0h1EJASN6VMnmde6A==
X-Received: by 2002:adf:e9d2:0:b0:257:15b9:8b66 with SMTP id
 l18-20020adfe9d2000000b0025715b98b66mr24864437wrn.62.1674583616765; 
 Tue, 24 Jan 2023 10:06:56 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q14-20020adff78e000000b002be07cbefb2sm2902794wrp.18.2023.01.24.10.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:06:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6D4C21FFD2;
 Tue, 24 Jan 2023 18:01:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, qemu-arm@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Emilio Cota <cota@braap.org>
Subject: [PATCH v2 32/35] translator: always pair plugin_gen_insn_{start,
 end} calls
Date: Tue, 24 Jan 2023 18:01:24 +0000
Message-Id: <20230124180127.1881110-33-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

From: Emilio Cota <cota@braap.org>

Related: #1381

Signed-off-by: Emilio Cota <cota@braap.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230108164731.61469-3-cota@braap.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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


