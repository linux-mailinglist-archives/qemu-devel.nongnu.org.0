Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6606FED7C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:06:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1IS-0006IS-Eb; Thu, 11 May 2023 04:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IG-0006I1-DJ
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:04:56 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IE-0000w4-Px
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:04:56 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-50bd875398dso12512099a12.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792293; x=1686384293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fbkyE6bJfLhheM4qb7LWlvv0iU1hoxBxThnKXs5khSU=;
 b=YV2ibgjTOw6ff3Hm3Nvv5s7UdNuPXInTZ1QTgAd8z69+cAX+cdWkTeCRRQj9uA4X+V
 hQ+krIkjT0XnbSFThNv71/OStOFUTc7lN9O/TZN5hM9wikCXfaahSKHOabhCoI6iOnZA
 zUfyUwQz9ryCi9G//ZQMrin0NVmCkGiE0y02fk/2gfCgLF/71IjYJfBim0Yv5mY1j65P
 dcwy2q/CRpv2Xhof7VFcbdebHUl98EL7hLnwFfONbtpktWspCYp9uV5Yfh+jhuy1ScUY
 Y3nh3aHcllB7ZjFItoY1fY6V3m/JtiQ+L4XrbDhS0rQ2fEhowacs/FR8s02Ht2NEftWu
 0V9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792293; x=1686384293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fbkyE6bJfLhheM4qb7LWlvv0iU1hoxBxThnKXs5khSU=;
 b=XwyuIwLYFAoglAAl/MJnfVg6FKeroNEvvqyz4Tfpx3QQ7/fCZNmUx3BYnSoA+ZMeDi
 qwaJ3yV+d1drpBxghrH6XVuCn0s4BGqSHpgMkC16LyZAqSND3W0bSfL3vutpxyDQbg6q
 DWt74WRcuk/tu49MxKb7iYla/97mH7tze+OjP9jPGTaAh5txs92iWpYCDhnUl05YVlpN
 fO94ttC66aKLLXN7Tzm5gHSu22AQiDQZLHPobi9+UqR+rW9yRp3bNYfdXMFY5hyk/y7d
 zTrRtjMTZjJunHSk4PnHvjdL4lARAPyF5uuhUf2JSS+cMS3LVmY2F7QEhorhLHTwChBF
 MAyg==
X-Gm-Message-State: AC+VfDysD2UyGKA+TYbPh/PRiZvb/MeYX4HJ3pW5ili3KmAkqOpRtxf/
 AgEMs5UEGqFE3l3Q7KMkA4BFScWii6pNRGlaI3Pz8Q==
X-Google-Smtp-Source: ACHHUZ5aDYj08c6JWmFpr7XWeS0hbAtRcrccxXQ/sXkwiDHrcdiKAwSvysbfNBfhGB3PP3QWFlV8Rw==
X-Received: by 2002:a05:6402:2d0:b0:50d:91c8:9e16 with SMTP id
 b16-20020a05640202d000b0050d91c89e16mr12441760edx.12.1683792293422; 
 Thu, 11 May 2023 01:04:53 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 i12-20020aa7c70c000000b0050bd7267a5csm2662095edq.58.2023.05.11.01.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:04:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 01/53] target/m68k: Fix gen_load_fp for OS_LONG
Date: Thu, 11 May 2023 09:03:58 +0100
Message-Id: <20230511080450.860923-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Case was accidentally dropped in b7a94da9550b.

Tested-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 744eb3748b..44d852b106 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -959,6 +959,7 @@ static void gen_load_fp(DisasContext *s, int opsize, TCGv addr, TCGv_ptr fp,
     switch (opsize) {
     case OS_BYTE:
     case OS_WORD:
+    case OS_LONG:
         tcg_gen_qemu_ld_tl(tmp, addr, index, opsize | MO_SIGN | MO_TE);
         gen_helper_exts32(cpu_env, fp, tmp);
         break;
-- 
2.34.1


