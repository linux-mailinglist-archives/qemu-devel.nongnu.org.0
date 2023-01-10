Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB116648D6
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:15:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFIbN-0003nD-Tp; Tue, 10 Jan 2023 12:39:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIb9-0003Zb-Fr
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:43 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIb4-0001FK-02
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:43 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso12506074wms.5
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 09:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hF/3DoG9owY2pD8TEHjkZ0ZRm2+7IOUIANxR5871mgM=;
 b=GldqPs404+eL0NDoRaW6NC1GQgQQDsnqVKpLVsodyTn9cw0oLXa3XX12eZtNIu0rmx
 0RM44NfM+JwUhWs3Ivkwq72EIaWrz2CZZB5eh4QiSe4xoiKBAOzmw8tnWbOJKLAu0yEL
 6anRTGXbhJbb4YqCPau8UiQRRgHIt/lih3ojGnid048kLj5P/5kUaGHlygoPHCpowUsc
 nNybVQLGxqWDD08meEaJgGbjKDR/ahsa7hWEuFK3q7s/60qZrM8dtM4RZII7N/0gJfPC
 VYkCxSOBMwEjghDisRqqxBwAPZJRd/JFCJkCKe/pkz0X6WahBPaDHT+4rXe5hLn3bssE
 3Tgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hF/3DoG9owY2pD8TEHjkZ0ZRm2+7IOUIANxR5871mgM=;
 b=tdn+ryAORBGqB187GLt2mDebj7h6nsYu4zQlf4WVd88XwTIAk/FU4gI5gCQ/zaVklv
 5nbGoI9hscu6vzUnFNsG3mVqQp8ebYpdcJNebLcAFzUu6tV5ujqnDlY/wQr9zF9TQnKM
 3n35UbFzpTQSkaM9KvWfu1OiLw6OKklM06GXRevVReZKsETulNQNGNDFzWYBCOYo6KTE
 wxtLL1UTp4aF6PhG0t1JKe3I0SQnYW95eBQs39xEu2ZL8L4hDBoeC/lxmayQaUFSvB/L
 B9eoR/+8wHweNPR+YXMYKaOtKMlUOujUtV4MHVfa5nfkB+3W6veLasTiUMRoNuN+BMu8
 JLRQ==
X-Gm-Message-State: AFqh2kpH46/EYhzLqImzMgms6uNZCwRK539C9YSR2xMP0bT29OxrBIxL
 MaNlL6eNr/nh7RNQ7gvMKZgHLA==
X-Google-Smtp-Source: AMrXdXtKhRsctgEY2qL9Csp9dWfy3fIDeNiz1plXF3SGWso0RMc/ntX9eWlRlDamQ/ylgRK6/5f+5g==
X-Received: by 2002:a05:600c:5399:b0:3d9:c6f5:c643 with SMTP id
 hg25-20020a05600c539900b003d9c6f5c643mr18786079wmb.29.1673372377327; 
 Tue, 10 Jan 2023 09:39:37 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c0a0c00b003cfa81e2eb4sm15551258wmp.38.2023.01.10.09.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 09:39:36 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E34FC1FFCD;
 Tue, 10 Jan 2023 17:39:25 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Ed Maste <emaste@freebsd.org>, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 John G Johnson <john.g.johnson@oracle.com>, Emilio Cota <cota@braap.org>
Subject: [PATCH 24/26] translator: always pair plugin_gen_insn_{start,
 end} calls
Date: Tue, 10 Jan 2023 17:39:20 +0000
Message-Id: <20230110173922.265055-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110173922.265055-1-alex.bennee@linaro.org>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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


