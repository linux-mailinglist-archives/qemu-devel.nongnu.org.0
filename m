Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4832F6630
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 17:46:27 +0100 (CET)
Received: from localhost ([::1]:38686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l05lS-0000Rt-IZ
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 11:46:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05Mk-0003bk-Q2
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:20:54 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05Mi-0000QA-Qx
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:20:54 -0500
Received: by mail-wr1-x429.google.com with SMTP id c5so6383064wrp.6
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zqsvG/tgjzibFUr+DnxVrJpcOLAGGaGJJcyo444CtTw=;
 b=hQ1awrFHJbT7JiNAcNc94YAZfgEaIjO76RtEgMYpb8nVDqQ7/S8kUqY7cfOjJWI7i5
 Ppk9nL/PI/q/asLrgFsQGBJqnnGXs0BcdDE5xvtyC+uotZxkXrNK63XzCA4P2IRznnFa
 rwtnLcXysaYdx0M9N19NbGoqDfbSx4CdfaMvDO3L6kHokx2onmxi17ewCYIcm6C11u5P
 heYLttdlsRXkvRc6VFPmtoh00svjFNnufW7HN21bm7xa4o7zj7C0d8N/Dk6+HPXT+dNJ
 E1YA6Aw1m6c1PoRv7/wUrUL7gzAUvI3aohPg3UvxFJe0akxoUV9yPD+dwjzxOEfPIM0f
 zw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zqsvG/tgjzibFUr+DnxVrJpcOLAGGaGJJcyo444CtTw=;
 b=jSCC2Xo19QUq3wL7LKTyzeRFaK6aFB8So6H6g1E/UmCOh3FBNxt5+8Yo6IfVvHhg9A
 nbVGWbStzJ0pBaKyjBjdzAlavyxftaiCIIUjmiR3+HCLXf1V6LOH2UMdutPJ9SiDqmRX
 JMeXy71ZETpnBXDQyybXR/u6HObdoL7FtT4X4GNwBq6JHPaozSHbp/upVDfQz+o9TTBb
 XLqfSGjEtT3MU7lRweqGWoMnynij/+y3jB0W2S+TkFo02BI8Fmtbh+7zQ8hplQNF6B/6
 xpwzGYfbMAZV1/sccVTP+baJGsZTqU8kMKjhPHTCWxXTOFYKJjeIV4A3xC6hm7AA9B9N
 yvRg==
X-Gm-Message-State: AOAM531pKBinXBBWH4HR6i7lA9TwemViJKwZeSrHy+MUgOwkryWK3toG
 tziouz0+Bjm33wGybyDPM9iYfBtlKjw=
X-Google-Smtp-Source: ABdhPJz+e+GfRqsaYnyDFnMt9ylTZqSltCDlXyNYoesNFkQO790oD/X6S3HOmRhTDmm32dkORNyZvw==
X-Received: by 2002:adf:ec92:: with SMTP id z18mr8950512wrn.166.1610641250376; 
 Thu, 14 Jan 2021 08:20:50 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z6sm10983650wrw.58.2021.01.14.08.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:20:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: 
Subject: [PULL v2 36/69] target/mips/translate: Expose check_mips_64() to
 32-bit mode
Date: Thu, 14 Jan 2021 17:20:05 +0100
Message-Id: <20210114162016.2901557-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114162016.2901557-1-f4bug@amsat.org>
References: <20210114162016.2901557-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To allow compiling 64-bit specific translation code more
generically (and removing #ifdef'ry), allow compiling
check_mips_64() on 32-bit targets.
If ever called on 32-bit, we obviously emit a reserved
instruction exception.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20201215225757.764263-3-f4bug@amsat.org>
---
 target/mips/translate.h | 2 --
 target/mips/translate.c | 8 +++-----
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index 1b918a439b1..60e59675ef1 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -129,9 +129,7 @@ void generate_exception_end(DisasContext *ctx, int excp);
 void gen_reserved_instruction(DisasContext *ctx);
 
 void check_insn(DisasContext *ctx, uint64_t flags);
-#ifdef TARGET_MIPS64
 void check_mips_64(DisasContext *ctx);
-#endif
 void check_cp0_enabled(DisasContext *ctx);
 void check_cp1_enabled(DisasContext *ctx);
 void check_cp1_64bitmode(DisasContext *ctx);
diff --git a/target/mips/translate.c b/target/mips/translate.c
index d4d5d294f34..7e8afb363ac 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -2971,18 +2971,16 @@ static inline void check_ps(DisasContext *ctx)
     check_cp1_64bitmode(ctx);
 }
 
-#ifdef TARGET_MIPS64
 /*
- * This code generates a "reserved instruction" exception if 64-bit
- * instructions are not enabled.
+ * This code generates a "reserved instruction" exception if cpu is not
+ * 64-bit or 64-bit instructions are not enabled.
  */
 void check_mips_64(DisasContext *ctx)
 {
-    if (unlikely(!(ctx->hflags & MIPS_HFLAG_64))) {
+    if (unlikely((TARGET_LONG_BITS != 64) || !(ctx->hflags & MIPS_HFLAG_64))) {
         gen_reserved_instruction(ctx);
     }
 }
-#endif
 
 #ifndef CONFIG_USER_ONLY
 static inline void check_mvh(DisasContext *ctx)
-- 
2.26.2


