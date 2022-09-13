Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 182B05B70E8
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 16:34:26 +0200 (CEST)
Received: from localhost ([::1]:47096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY6zX-0000ll-JE
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 10:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY6tp-0003qR-S7
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 10:28:29 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY6tn-0006y3-G9
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 10:28:28 -0400
Received: by mail-wr1-x433.google.com with SMTP id bq9so21111325wrb.4
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 07:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=sw9CQ87TLvgANwDy6abBvcyo5irfX7fP8stttGLcdDM=;
 b=IjSl43sbQbPKI92aqnMoytT9oYVF3syNGCcrgAwKIOwERLCMYVj11siNjrxdfazlNX
 G2+i6807civLmaMlUvC8dA+DElx7nEBnNXz5hq9nd6714pkKAhvkhropUKuaFEJb6CDQ
 z5UNReLJQuDyUU7xVSMII77+m19aPjENpI6IaMJW7OFfzte971vdQAMH/RKLU+M3Gcr1
 Go4906GcJ8/Vv4MuwkmsI1bRep52mKyrvudcgfTps9WlN9k5TqTzGfutWZr8RxsoccnA
 z93Hff6r0hwttYul0wxiCxM9cb0kiSdVh/dj+LvKn5kVD9Mxyyl2Qa4RLXymd4Iw0TQz
 apyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=sw9CQ87TLvgANwDy6abBvcyo5irfX7fP8stttGLcdDM=;
 b=eTEKESbNG25JWCYL1fMxXDPrrl64+py775q4I9EkWn6ZKrBAopIWdkDMkZD1pqTVl6
 JSFrEzMKK8Qf53lSkowlX1u+1d3vjteDOGLv5Zna612JqaLwVIYZpQOMHrMNKiV7fHty
 jcgUBzcc4LJEXvrI14mEYoYzEGsK4G7ch+vmpeOU4XNetTknMb03obsxzo4c2oqVj4Qw
 Et6AueYGbrngS72WJMyyAY7zfZjjg4HNviotrNv9TSMlg0YaYBktr/g13sAegDJijtIv
 Ol20XmPy0jxlgXSNsj68a+/FSjgCg5J6JNu+J0p+AqNKQ75i/vxRa/diE2iKA5Xp6rqD
 2KwA==
X-Gm-Message-State: ACgBeo3/EkTVKb875RwKQmQfSGF/YYv+DNfutL2gTDiJ0qA/qlu8TV8k
 5giBr+yB1rlByMPVSY6rGTIMuUllRo01qoMz
X-Google-Smtp-Source: AA6agR4aRWEzolhGC6PuH5LWZRdYCasbewhwiMJ6G6IIY8xPEnv8yAEu9fqnAvyutQK9zR/lz/TjAQ==
X-Received: by 2002:a5d:650e:0:b0:228:b09e:de9a with SMTP id
 x14-20020a5d650e000000b00228b09ede9amr19420028wru.360.1663079305627; 
 Tue, 13 Sep 2022 07:28:25 -0700 (PDT)
Received: from stoup.. ([89.101.193.68]) by smtp.gmail.com with ESMTPSA id
 e17-20020a5d5951000000b00228dc37ce2asm10673165wri.57.2022.09.13.07.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 07:28:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	mark.cave-ayland@ilande.co.uk
Subject: [PATCH 2/2] target/m68k: Perform writback before modifying SR
Date: Tue, 13 Sep 2022 15:28:18 +0100
Message-Id: <20220913142818.7802-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220913142818.7802-1-richard.henderson@linaro.org>
References: <20220913142818.7802-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Writes to SR may change security state, which may involve
a swap of %ssp with %usp as reflected in %a7.  Finish the
writeback of %sp@+ before swapping stack pointers.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1206
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 87044382c3..8506da0a0b 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -2285,9 +2285,9 @@ static void gen_set_sr_im(DisasContext *s, uint16_t val, int ccr_only)
         tcg_gen_movi_i32(QREG_CC_N, val & CCF_N ? -1 : 0);
         tcg_gen_movi_i32(QREG_CC_X, val & CCF_X ? 1 : 0);
     } else {
-        TCGv sr = tcg_const_i32(val);
-        gen_helper_set_sr(cpu_env, sr);
-        tcg_temp_free(sr);
+        /* Must writeback before changing security state. */
+        do_writebacks(s);
+        gen_helper_set_sr(cpu_env, tcg_constant_i32(val));
     }
     set_cc_op(s, CC_OP_FLAGS);
 }
@@ -2297,6 +2297,8 @@ static void gen_set_sr(DisasContext *s, TCGv val, int ccr_only)
     if (ccr_only) {
         gen_helper_set_ccr(cpu_env, val);
     } else {
+        /* Must writeback before changing security state. */
+        do_writebacks(s);
         gen_helper_set_sr(cpu_env, val);
     }
     set_cc_op(s, CC_OP_FLAGS);
-- 
2.34.1


