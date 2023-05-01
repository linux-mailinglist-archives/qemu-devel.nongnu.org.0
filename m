Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F40B96F3957
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 22:48:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptaPp-0003gu-GU; Mon, 01 May 2023 16:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptaPn-0003gi-9y
 for qemu-devel@nongnu.org; Mon, 01 May 2023 16:46:31 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptaPl-0006h9-Mp
 for qemu-devel@nongnu.org; Mon, 01 May 2023 16:46:31 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f199696149so17135855e9.0
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 13:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682973987; x=1685565987;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ug2Lixa3LoiqV9kh/GiOhtm5H8yJmkeeTBedz2OJQLU=;
 b=zKrIEh1ouTvInmQvj/Ri105dXNJNIXtyqNBLxwlWDsnKKG48jkRF+rRQliXgC02B2f
 aPkiqUtA9L+XssOyJSHPigdSF+jthdd6PGm9lKAk6Et26OYJX+tiZGHraj40u7aD90aX
 yR1+oiBCReybmngWC962ZzN25GsfoDww15sfK4ZbmP1OcWFueMBBX7CWtnqSNUlcoXao
 7C5HyU93nSoP6DWTDtnRtWCbzfU8WkB6TdGkpxmd42OsOu1KT2gqtryoiY01jJ2lY6AJ
 plTTYCtOgMdZMIV9dtX936d6iOx86ntie4P9wIO09xblj47e3mbuZdGnpFSVY224f5Ke
 lOhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682973987; x=1685565987;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ug2Lixa3LoiqV9kh/GiOhtm5H8yJmkeeTBedz2OJQLU=;
 b=K9LdQ9agrxhFKvTFXGpeWDa3YQd1T7R0VBKgUwLYceruOfCdpFZdE37oc7dLJbzfk9
 uxiUlKvlbTCOs1kUkKD6u6u4IWs9+4GQP/9sl18h9xm9tEZiuineFAMyvGQ+t42tdCsP
 uZanw8Ge1CFJ9kuu2DhlTzGP5CuSCrTM5scanr/hlH47wZTQl8Rw6pGcLOCThbm/avTX
 8FmXpKAS1vt5eqxEr+BSTWBTsT4sLOExcd19to8rlg4y9rUKyrCIFUbJL5PchtGgfI4y
 txtyuO/220hb02Tsq1UInY94o1f/0r+Xp2eDMNpWkoSbTp2+2fg4kShn3JkXcJn3GLSo
 boTQ==
X-Gm-Message-State: AC+VfDxVRLJfh3kOywUKGJNebuwIm4cg+1zNvjZ8eHag282ARdwC4Zsh
 L1N+6XLBcgccW/Hp/XMrWn41v33sEXr22/BYdcI2Pw==
X-Google-Smtp-Source: ACHHUZ4UwAwbPnSmWeHBtZayJ7dYPGmaHyiKLFPJo/mBCsLXC0lkde6Vfho4wkbcoUvz+6F05fiy1w==
X-Received: by 2002:a05:600c:b43:b0:3f1:6f3a:fcbc with SMTP id
 k3-20020a05600c0b4300b003f16f3afcbcmr10832638wmr.16.1682973987021; 
 Mon, 01 May 2023 13:46:27 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:eca5:8bcb:58d9:c940])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a7bc045000000b003f32c9ea20fsm8776991wmc.11.2023.05.01.13.46.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 13:46:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] qemu/int128: Re-shuffle Int128Alias members
Date: Mon,  1 May 2023 21:46:25 +0100
Message-Id: <20230501204625.277361-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
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

Clang 14, with --enable-tcg-interpreter errors with

include/qemu/int128.h:487:16: error: alignment of field 'i' (128 bits)
  does not match the alignment of the first field in transparent union;
  transparent_union attribute ignored [-Werror,-Wignored-attributes]
    __int128_t i;
               ^
include/qemu/int128.h:486:12: note: alignment of first field is 64 bits
    Int128 s;
           ^
1 error generated.

By placing the __uint128_t member first, this is avoided.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/int128.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index f62a46b48c..9e46cfaefc 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -483,9 +483,9 @@ static inline void bswap128s(Int128 *s)
  */
 #ifdef CONFIG_INT128
 typedef union {
-    Int128 s;
-    __int128_t i;
     __uint128_t u;
+    __int128_t i;
+    Int128 s;
 } Int128Alias __attribute__((transparent_union));
 #else
 typedef Int128 Int128Alias;
-- 
2.34.1


