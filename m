Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A1060D929
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:18:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVuV-0005KA-W2; Tue, 25 Oct 2022 22:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVuT-0005Jm-Kz
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:49 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVuS-0001HO-6x
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:49 -0400
Received: by mail-pg1-x52a.google.com with SMTP id r18so13415702pgr.12
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xCgUD/CDm7rh2G6Hg1YAveve5hrsKtyPudhnNjch8RI=;
 b=dkklZ+0VYCYHJy6hkBFIXPoNR53foc4BMrGM7gSaBRPJlk0N+D7JKq04+EugRg85vh
 AfaQ8k1LCtFFKy7twrQefMAiNqpucjbQfrTNhlHIuw+4sVQsXAeK3ut0V5HSMxFFX0Xh
 6304NAzxcxIqOgDhPETK3sNHg9s58+WKhIqIVN/EAaT+zfp5dbQq/I/Ikkglr9anFLqY
 uvVRRk5XEhxd2hfzDmjtbEkbRCEEx31NkfS/Q7VEkspo2hDZM7qkAxEnLs2yJnTLglth
 +hmCtZc/klwGw1/lQeuBuclgok8ztflbUWgSerCDN1VAYtXmoMrYeP9O9ObiJdoyKJ3M
 hlEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xCgUD/CDm7rh2G6Hg1YAveve5hrsKtyPudhnNjch8RI=;
 b=7HM3JBacVcL2HAAbzUo+sEKddRgnkjrgVQ1H9XFNDewWTVmgJpRWYQtA/tgdrPcIBU
 mj8L7Nsme1PmCS1hjDCwRJd7HDoHmAjrK4JmPLoer8prrZelPY0wHDNx5lhH1Jz1Pp7/
 955vrZxiPB63mNyHV6HcNLb8gVBvYQxKDKixaKsZjW76YqbBo8LuOce/s8AkqzoqGy61
 SdcsMzuejEDlzru5aihFoFQYxQaZibe2OFqsHLtvH8u6PDiZXBEGQqv/jPHevVjJqV3I
 ZdPa/JQxwcwMScVKxkM6mKXgNscwO4SeBw3oqTjKOLEHUzwn2qRYSrzgrrxn+vNjpmSJ
 N3iA==
X-Gm-Message-State: ACrzQf2Vxiqhgr+GRJuAEu3txLGsfMEjBsVe0y5l9FABNYXViytKvwNI
 kbRa23671ZHfnlE4YtHBVL8ojSrCwSnO9ceb
X-Google-Smtp-Source: AMsMyM7m51GSPQvbHRSe2HdiCmqcBBu6YYPkPGkotSFM/xc+/y8abupbWRAdL91J5jHDaA9uITxhTQ==
X-Received: by 2002:a63:5a08:0:b0:43c:9fcc:cc54 with SMTP id
 o8-20020a635a08000000b0043c9fcccc54mr35100239pgb.229.1666750366891; 
 Tue, 25 Oct 2022 19:12:46 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:12:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 30/47] target/hexagon: Convert to tcg_ops restore_state_to_opc
Date: Wed, 26 Oct 2022 12:10:59 +1000
Message-Id: <20221026021116.1988449-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/cpu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index fa6d722555..03221fbdc2 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -271,9 +271,13 @@ static bool hexagon_cpu_has_work(CPUState *cs)
     return true;
 }
 
-void restore_state_to_opc(CPUHexagonState *env, TranslationBlock *tb,
-                          target_ulong *data)
+static void hexagon_restore_state_to_opc(CPUState *cs,
+                                         const TranslationBlock *tb,
+                                         const uint64_t *data)
 {
+    HexagonCPU *cpu = HEXAGON_CPU(cs);
+    CPUHexagonState *env = &cpu->env;
+
     env->gpr[HEX_REG_PC] = data[0];
 }
 
@@ -327,6 +331,7 @@ static void hexagon_cpu_init(Object *obj)
 static const struct TCGCPUOps hexagon_tcg_ops = {
     .initialize = hexagon_translate_init,
     .synchronize_from_tb = hexagon_cpu_synchronize_from_tb,
+    .restore_state_to_opc = hexagon_restore_state_to_opc,
 };
 
 static void hexagon_cpu_class_init(ObjectClass *c, void *data)
-- 
2.34.1


