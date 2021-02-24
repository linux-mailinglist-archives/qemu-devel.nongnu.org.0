Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3AC324435
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 19:59:55 +0100 (CET)
Received: from localhost ([::1]:33966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEzO6-0000X8-FU
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 13:59:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEzLo-00064h-KZ
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:57:32 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEzLn-0002eX-9J
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:57:32 -0500
Received: by mail-wr1-x42f.google.com with SMTP id 7so2920468wrz.0
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 10:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dbstaMPFkZR/YHzcDJ3JxaNPdajf1J5Vka3V0TW9Seg=;
 b=RgAKQxgs+TxE+DmR7wZ47qvFxL8vwwzI5LSCG6lUh+NyxJtb+ucdz+m9qV1lXMKQmA
 koViZc+unV+8teCUbsFmPdnTP9uCWoXCIwiF3RLYFEjEro+FuKlAQcdMHT1/Trs7Dq0V
 syLA3FltHjgilwvswGW6tPGkPMFGp/bdoSEPkWWm92k4tp0DF9cWvszB5kZPOgwJ+ZCD
 es6SxrUdnGrxWrxlaHLNZAL5CfA6MBObNxfUj3ByJvHoQS4lsd1y39LvpR86sNqx3Nun
 taUNRH2bqC/+54DvTGYUvzjOFKdjVKb7py6hkMEYTn3GBOUKJKCrrri10jkZmzs5tx0Q
 ZSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dbstaMPFkZR/YHzcDJ3JxaNPdajf1J5Vka3V0TW9Seg=;
 b=FQFgOAf5KS9vhAG+JMGncE+amDqyzVz4MqrevYecF2mehiB8sI80EtR9vTlnFsMqqu
 279aK0IdPTPWVEruazoWCbQp4u9O1G2Vmv+aY2h1VUKuEXg4u2Lwcxw+AIYJSIEPlx1r
 4D3Z0Rk+qjwnhe5+cdCgnuRRp+bhWM+X8p7aDnJ6rx5RQI8KLGg7fgZ7qr7/J7+ETkbG
 lwEnxlJCrYzg7Z7D+bKPgHIiPxCLkUqBIo+Q2xqtY+Jt+J5CbMVzKHJ+TB+s7CNT+xX7
 KV6hUXlirXBR9DKug/gu5Hr/M7BgR8ZvwQW6WRBkN5gLQKMlOozbzmv0UPfiw96788Ah
 mvpg==
X-Gm-Message-State: AOAM533CvdhoFdT6Ny3I3HWbQuTtwH57mfLtMkkA43u6F8zkKkiH/AWw
 lvhLeKdskMSKhDdwvy9U78nsIeOA1ak=
X-Google-Smtp-Source: ABdhPJyn5OUo5mvI8NUXKDp4sB09xssm5NgiCMu0IY5LVjjCDrgeonyYr2C5QKa0TLiQpQbHhqcXZw==
X-Received: by 2002:a5d:4d0e:: with SMTP id z14mr32276405wrt.411.1614193049749; 
 Wed, 24 Feb 2021 10:57:29 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 2sm5462364wre.24.2021.02.24.10.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 10:57:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/12] target/mips: Rewrite complex ifdef'ry
Date: Wed, 24 Feb 2021 19:56:57 +0100
Message-Id: <20210224185706.3293058-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210224185706.3293058-1-f4bug@amsat.org>
References: <20210224185706.3293058-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Craig Janeczek <jancraig@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No need for this obfuscated ifdef'ry, KISS.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 70891c37cdd..1f1c5f33c87 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28276,13 +28276,16 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
 #if defined(TARGET_MIPS64)
         if ((ctx->insn_flags & INSN_R5900) && (ctx->insn_flags & ASE_MMI)) {
             decode_mmi(env, ctx);
-#else
+            break;
+        }
+#endif
+#if !defined(TARGET_MIPS64)
         if (ctx->insn_flags & ASE_MXU) {
             decode_opc_mxu(env, ctx);
-#endif
-        } else {
-            decode_opc_special2_legacy(env, ctx);
+            break;
         }
+#endif
+        decode_opc_special2_legacy(env, ctx);
         break;
     case OPC_SPECIAL3:
 #if defined(TARGET_MIPS64)
-- 
2.26.2


