Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F223AE17F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 03:42:22 +0200 (CEST)
Received: from localhost ([::1]:56686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv8xB-0001Su-NU
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 21:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8qF-00048v-4d
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:11 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:45827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8q1-0005Ey-HL
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:10 -0400
Received: by mail-pg1-x536.google.com with SMTP id y14so1403100pgs.12
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QjJQaVk4TJcc1Pr+MWyHRIaip7LxYhlzkm4i0kRZ5gY=;
 b=ym/nxXLJLjB5Ns54EzuUTIWA71Iue6fpabWf1s0p8GuguZtVehMawvM3Tvv9jWXRVL
 IzuiODAIzF74jFjCJucLMjr9w7c1CQJZgpD20aOcGig1+Rzgels36sUcjwn4qlkZ3h2m
 vxI3XJRXHsvJln8SU4FMkqHvwxEOt3/Gz7TprBxO3CF9+7DEb9bK5Z7U1Jf/lrDlarvO
 ELaym3xnPN+tsJpJnDlQ63xF5mn6FnqEdoJJVVvbNsfdIKtnsbfHqk4354+1YhtzVkGk
 VLkIckkZ2JVulsSFzE1lNc+/vxKcYT0yK7+cYP2i4H7CJcWWBRJ3pHJJ3zuv1CkO51SA
 eNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QjJQaVk4TJcc1Pr+MWyHRIaip7LxYhlzkm4i0kRZ5gY=;
 b=uT63+qykA6Mk9S6pxKgvu2OfB0lb5Abe0N+3RRRUkxOIN2zs54CwJm16n3WZz+dvlk
 lGfbnlmrPrsLKBXamkRlCGyzD/MgHQrcRMGolCInf11QzxLLb7ur0YcuGdasLQL1E4nI
 o/QUEZpjUJFEQsW9gzDSDfYBNFRKUBmZKNZbjVRjFzfLJWKC16pxn18XeDIpUGhAaV6n
 tjJkt4Pts7mRpLcaspTn1b/mbsbyZM6M8D/xF9udrudxcsmSRU1Fb1ssSwGZtZgYflr3
 XdY+TRZDJ7wbGDfpNHWLiEEunm02PDC0CRq4dDbKoZgZvoHQDMnx7cETR+BRIFm5SAf/
 VG2Q==
X-Gm-Message-State: AOAM531EtpFlDfp//8fNDy6oCCzz+U2LU5UDJB1PQ2KMUf5xQyjCE0P+
 LJSpk1YgiLKAYqrwbmn5skUiZBxYjmY8jQ==
X-Google-Smtp-Source: ABdhPJwXv3UFYXGHxgAhbqDFbTO1ToIBsgr+akWsgvJVdjkcsaZomUyibLke+4sf6SjwRKkMsvy/Qg==
X-Received: by 2002:aa7:9507:0:b029:2df:b6dc:c68c with SMTP id
 b7-20020aa795070000b02902dfb6dcc68cmr17175056pfp.31.1624239293793; 
 Sun, 20 Jun 2021 18:34:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s27sm1495628pfg.169.2021.06.20.18.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 18:34:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/26] target/sh4: Use translator_use_goto_tb
Date: Sun, 20 Jun 2021 18:34:35 -0700
Message-Id: <20210621013439.1791385-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621013439.1791385-1-richard.henderson@linaro.org>
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/translate.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 9312790623..9ac9bc722e 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -225,17 +225,12 @@ static inline bool use_exit_tb(DisasContext *ctx)
     return (ctx->tbflags & GUSA_EXCLUSIVE) != 0;
 }
 
-static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
+static bool use_goto_tb(DisasContext *ctx, target_ulong dest)
 {
-    /* Use a direct jump if in same page and singlestep not enabled */
-    if (unlikely(ctx->base.singlestep_enabled || use_exit_tb(ctx))) {
+    if (use_exit_tb(ctx)) {
         return false;
     }
-#ifndef CONFIG_USER_ONLY
-    return (ctx->base.tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
+    return translator_use_goto_tb(&ctx->base, dest);
 }
 
 static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
-- 
2.25.1


