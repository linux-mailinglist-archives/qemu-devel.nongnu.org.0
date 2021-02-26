Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 346A932601A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 10:34:48 +0100 (CET)
Received: from localhost ([::1]:60182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFZWJ-0005wt-5u
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 04:34:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFZTB-0004KO-13
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:31:34 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:39938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFZT8-0002xW-Sz
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:31:32 -0500
Received: by mail-ed1-x52e.google.com with SMTP id w21so10123005edc.7
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 01:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dbstaMPFkZR/YHzcDJ3JxaNPdajf1J5Vka3V0TW9Seg=;
 b=h2AFTtkqbk6BWjAJTvW98XGcwIVnTNzOUe5LZlMGwxJxBm0YqSHUNwq7c0ZyRmz0w1
 VhWhmJEOAO4XS10pF+Ip2wNu5e7imIMDhuNQzvYxTGIuahUDBBwvEGpLXpzGzUF8eITk
 q4NXBTHxKpYWuZI6gLbt9GAvvhGy/4S0s5pL+lAJPI+nkFD0+4uJis8+GajfNG0aAKfW
 bpnUI2TL8aAomOvc/vlCIowNH+/7ADhvhmM5fMvnubDIneh5YvHBFr5JK9Nh6VMrQ5c4
 DzkVUynShUDaWTBk+1h08foacIJELsVtzJnqRkxe+oRaRr0PnNVj9PECxePwXbRSS260
 Kzdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dbstaMPFkZR/YHzcDJ3JxaNPdajf1J5Vka3V0TW9Seg=;
 b=d9gtqMMigfhSza5o/TWQwKBX2HChwqISXwLu5633psPaWIUuXyGCqmWl7NZxpw4JCW
 SI9pVlpKpPCtJvkMyFoHBJZknl+InoLz++SmjSjgPDqs9S5eT2JJ+J369kb9NK1VYFR4
 yQDtFzpRWxxkOOeWWbqvKi7likjJaa9s+NUhl58DqiKd9CSLQNCRIiM8PqrDbSNVjr0S
 NTEYKYlrDZl57hdQc9x08mr5Q+j50HuwHJRilmQ2ATQfOeuJm9Fr6uSsY/9DlI5w4lvk
 02sDGPDRT0Jjjy39sIQ85ccwUR5i3Twjh3uNmcfUj+8QYhSzPRSo/6wzNcJUf5IMEgJt
 0avA==
X-Gm-Message-State: AOAM533a/SIBRQBMri33r9TbfjPgRM5KWQWG3EQvgXgiYYKG+FIFfWaQ
 1CZKIT4oHVJzj9P7E06E13KkTBkJI0A=
X-Google-Smtp-Source: ABdhPJwf5l+22E6ayVEAGpzxA5ac93l2sqB/BO5C+9I265yye10Qf6ZC4hy9a1NyNBfF9yAA/9t3Og==
X-Received: by 2002:aa7:cf12:: with SMTP id a18mr2225594edy.111.1614331889170; 
 Fri, 26 Feb 2021 01:31:29 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j17sm5346721edv.66.2021.02.26.01.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 01:31:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/13] target/mips: Rewrite complex ifdef'ry
Date: Fri, 26 Feb 2021 10:31:00 +0100
Message-Id: <20210226093111.3865906-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226093111.3865906-1-f4bug@amsat.org>
References: <20210226093111.3865906-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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


