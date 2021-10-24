Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0011438A9F
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 18:21:59 +0200 (CEST)
Received: from localhost ([::1]:59770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1megFy-0005lN-NI
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 12:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1megAi-0005ob-6T; Sun, 24 Oct 2021 12:16:32 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1megAg-00087E-0R; Sun, 24 Oct 2021 12:16:31 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 b133-20020a1c808b000000b0032ca4d18aebso6508414wmd.2; 
 Sun, 24 Oct 2021 09:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9VeXic0fs8CIZcPeph0iPU6CO4mvSNbwetSuj8mQ6Wc=;
 b=JjPgRwFXXmRAQMRY1Xw/f8qgythrTAU7QWpeVE++uzfedbXv08PaokKHaK5FNG3xcQ
 7xrVa7Kisr6yBhgW2xtoPJPfM8CRylMm2/a0CP9wc+AJbYiLpudTuIwTMDOwYz4KRGX6
 DUUXM3MPCC7wmVvUdHnSjGXHvP7rxQxr9OmMBEe3wUrzRlXDPhgKvYXxvUKJpS5qUlue
 8Utk62ToamYemtWx0YB+5s3kKxNRDN1ZjiYp4jQbLh6zJdx4GC5kaxGe8o+1OG5RfvOK
 H5lxdlTfFF1xBu1u6Ca3ecOKfQXFFWfWgUHf4v3IdRSQ6RtqD6eeYGoW0g6+TuApkxud
 qP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9VeXic0fs8CIZcPeph0iPU6CO4mvSNbwetSuj8mQ6Wc=;
 b=aLvEbVJ6XQVDhd8zYaA8xqyhSR+DSTpr5SRYk37ydiX7C7fdt0aNTYtart23ZsfqEW
 35rSJXeaI3ZM8ce0W0+qDNP4LMzuvH9YDUAOtJ3BR0cVRiQbCj0wErIgzv0DbkiX/DIp
 PKqlE3PkZg50BfpFObl/jLfx4FzuIdvbwJlY2XdYXE5HGtwGq0pZyjjmsFZepgQaP1l/
 utvW/5JYKvHujatMEUUARzsAcjmsHs/ZrnhSWdIy3LIdD0UOxvstAqCMjImD0Y4QPZX7
 vsUHAm6jPP02lwZ4kE/uvrVn5YYQCx1pBFjey2t3i+cHJoBwPcSVMA9k+c6vzeCc7Rq5
 Ud5g==
X-Gm-Message-State: AOAM530V5mamIiFq4ZxCVeesttPblXueCBjHlIwl0IfyWRU5sM/+AxFs
 jJImKQBt8OnDVg38vWNGHsQ18ViFNko=
X-Google-Smtp-Source: ABdhPJxggDeHVcUvoLpUfU0aPKXNusGRWwmur8bsuWSIUmhTv3/qUciUFh+8NHhmhZoRiod4TZ0lsQ==
X-Received: by 2002:a1c:9ac7:: with SMTP id c190mr18390509wme.2.1635092187627; 
 Sun, 24 Oct 2021 09:16:27 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 m2sm5472303wrb.58.2021.10.24.09.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 09:16:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] target/alpha: Use tcg_constant_i64() in gen_call_pal()
Date: Sun, 24 Oct 2021 18:16:16 +0200
Message-Id: <20211024161619.325903-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211024161619.325903-1-f4bug@amsat.org>
References: <20211024161619.325903-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid using a TCG temporary by moving the flag and
exception address to the constant pool.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/alpha/translate.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index a4c3f43e720..326d4216aad 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -1191,20 +1191,17 @@ static DisasJumpType gen_call_pal(DisasContext *ctx, int palcode)
     return gen_excp(ctx, EXCP_CALL_PAL, palcode);
 #else
     {
-        TCGv tmp = tcg_temp_new();
         uint64_t exc_addr = ctx->base.pc_next;
         uint64_t entry = ctx->palbr;
 
         if (ctx->tbflags & ENV_FLAG_PAL_MODE) {
             exc_addr |= 1;
         } else {
-            tcg_gen_movi_i64(tmp, 1);
-            st_flag_byte(tmp, ENV_FLAG_PAL_SHIFT);
+            st_flag_byte(tcg_constant_i64(1), ENV_FLAG_PAL_SHIFT);
         }
 
-        tcg_gen_movi_i64(tmp, exc_addr);
-        tcg_gen_st_i64(tmp, cpu_env, offsetof(CPUAlphaState, exc_addr));
-        tcg_temp_free(tmp);
+        tcg_gen_st_i64(tcg_constant_i64(exc_addr),
+                       cpu_env, offsetof(CPUAlphaState, exc_addr));
 
         entry += (palcode & 0x80
                   ? 0x2000 + (palcode - 0x80) * 64
-- 
2.31.1


