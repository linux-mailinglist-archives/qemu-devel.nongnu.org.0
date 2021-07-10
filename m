Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1BE3C3552
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:47:20 +0200 (CEST)
Received: from localhost ([::1]:41252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2FCK-00042C-0r
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExU-0005UY-DL
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:00 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:36501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExS-0002KG-PH
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:00 -0400
Received: by mail-pf1-x436.google.com with SMTP id 21so11703617pfp.3
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sdOgSd63WVU1p/GLMq6rl3ZMILt/ihpRB26uHAUfMXo=;
 b=qSSz5CLaMfP2Vu0D8doc5pjj540IkJ9engKjlilM28uz0d9g4KxBe79Wh9EKOxCRTS
 1SJ4gXW88v4kodPKhlDJWA0lzFI4Y9xtmUYCemLXitz+Afe3mEDq4V2ESmniRA1Jr/3r
 RvuBezlYn3FPcbB49Zkg5J5MvXZyxXIlCtgd5KVV4qFKAWcCdjGaqGuaiGzcubPK5iFp
 Kh8Uv0X1J6QzhNa5lJrejwS+jsfgga8S1ouTmo57uqThBOeFpMKcD32AwsyW+TXdPc5e
 Tu4ru3s0q7j9lTbtVKncz6G+Qs37Rvqgtou/8u9iMVnsZD9jMAEYynfm7Taza+BeZpzb
 1+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sdOgSd63WVU1p/GLMq6rl3ZMILt/ihpRB26uHAUfMXo=;
 b=Z/xb22IXdVcvvErgY+ZfHiFexvvaF+Iv913rC/EXN6aIRs/a+Jh7v5/bBTb7evFTH4
 N8spO9PwhHrWyPUnS9DXIZcIYZV2Tmk1RTwEAkgV8l9kjLs3RxXeddFRcqWTOxx2NdEx
 K6AzLgQPmA9peGfmFCYVzykfDFnohG0K5IjsMRtz0FETpZkSezqM8oIXqXimr16vE831
 pdjefZicPvZxL6p01ydo2RfbeKjZHyeOkaM04+4FTDBvQpebdOYgqnKFOl+76WgYTCzc
 2bmRfPS7vRyhmq8ZFLxc62Q9iamuAPiQlM/yZa9+IM8qPn8RFdqwQCWJ1eowv6pIQQsy
 +zOg==
X-Gm-Message-State: AOAM530V6u5bzuvfo3AL535kHF2tTabLDx+5Afc5J9YOyvxoiDq8gUsR
 muWsqzL20nz2pXzHWvu1N6jWNnZv5FF3tw==
X-Google-Smtp-Source: ABdhPJzBQdooxVIFD4NRQrgVrYhrXZUieRyQCnSIhO2wyLpzvwSZwjHG0p692yd3FdxBycEJ14AUOQ==
X-Received: by 2002:a63:5802:: with SMTP id m2mr29842992pgb.171.1625931117514; 
 Sat, 10 Jul 2021 08:31:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:31:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/41] target/m68k: Use translator_use_goto_tb
Date: Sat, 10 Jul 2021 08:31:20 -0700
Message-Id: <20210710153143.1320521-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Acked-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 348fc6e844..1fee04b8dd 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -1519,16 +1519,6 @@ static void gen_exit_tb(DisasContext *s)
         }                                                               \
     } while (0)
 
-static inline bool use_goto_tb(DisasContext *s, uint32_t dest)
-{
-#ifndef CONFIG_USER_ONLY
-    return (s->base.pc_first & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)
-        || (s->base.pc_next & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
-}
-
 /* Generate a jump to an immediate address.  */
 static void gen_jmp_tb(DisasContext *s, int n, uint32_t dest)
 {
@@ -1536,7 +1526,7 @@ static void gen_jmp_tb(DisasContext *s, int n, uint32_t dest)
         update_cc_op(s);
         tcg_gen_movi_i32(QREG_PC, dest);
         gen_singlestep_exception(s);
-    } else if (use_goto_tb(s, dest)) {
+    } else if (translator_use_goto_tb(&s->base, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(QREG_PC, dest);
         tcg_gen_exit_tb(s->base.tb, n);
-- 
2.25.1


