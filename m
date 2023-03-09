Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 432336B2EAE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:25:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMe9-0001ED-ET; Thu, 09 Mar 2023 15:13:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMdn-0000aC-Q5
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:13:33 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMdj-0002JP-OI
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:13:31 -0500
Received: by mail-pg1-x531.google.com with SMTP id s18so1800848pgq.1
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jRe4AvoYjKgyovABus1FI6CTw7oWkwxqQpkLptCkxCA=;
 b=emaMQMhRgFbGZjIJ7H7COcL2r+GTYqGoEUGUS51zpO08d76bbN95lSTTiJklIN+5Je
 iOSqI3dgwjRXMDezS2uCtvG9dG3IYTkD+2gClPdOZMK9SVMT+wTwFT4gADe+QvlnC+6c
 cIOc4ZjlXu+7vG1TRkbpmmfjX8CayRVTJZZYV3dhF1nvSSVpJcNZvwARPzTMIhhbIcQX
 xoWme9wN0WqRFFOzQfrGs6vKQItFIxKUE8eZg6wdZgdBx0Gm7WLF3v14emzHE5NzQ+Zh
 1jsCkLDBy8J8inKcaAHOmMvpgyxpwRXkDTiIiSHpTMvhXIF7QU2xeuuhlonDWVDiZCvC
 pryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jRe4AvoYjKgyovABus1FI6CTw7oWkwxqQpkLptCkxCA=;
 b=s8oCBjzRf3Kw5VHISIG30Rf6fT8Wb8gK1iSbX+hRZqkxroCWUjhjQ9fbuV+5jh9hSE
 2uxd4Hxc3kHcLnx5IdADGhwsaGW+2X4Ydnrso/MEvlaDlWBGWczF/VZlzHn9InSYZqnZ
 xmGmDrihYgHfJ/Qd7vgQcIzjywksL8HK1kkC9F+ftVrb2mFsQn6edRysgIFyU31bWDUO
 WoxnVfQjcNyaYQ0lpqLDJNdMo3WPpPxv01YLGgHfybK87sf8mgb0jvaZsX1cAJgxPDtM
 qDBKpDmtudTBkgg2IzrUVysXndvjYYrgVIvZyjmGrtqef0KueP71VDXHYwj4vEw5joxr
 7hTQ==
X-Gm-Message-State: AO0yUKU2OFW0zm27ccfFUpRbFRlPDF9qq7fIJj+YaJdI9vlKLmB4NPK5
 D43CUQHGTA4Hd47CTnuehdo+Y1QEaCqZglQsOp4=
X-Google-Smtp-Source: AK7set/K+afQvL/W6Zxwb0tR6ljsI2dKZqcL2x7DRTR5nrnk9wVwDbulRQGFdpgQ2XPrZYAIwL1Fag==
X-Received: by 2002:a62:5258:0:b0:5a9:bd0c:4704 with SMTP id
 g85-20020a625258000000b005a9bd0c4704mr21120940pfb.14.1678392799413; 
 Thu, 09 Mar 2023 12:13:19 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a62a50f000000b005b02ddd852dsm11867744pfm.142.2023.03.09.12.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:13:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 89/91] target/tricore: Use min/max for saturate
Date: Thu,  9 Mar 2023 12:05:48 -0800
Message-Id: <20230309200550.3878088-90-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Use tcg_constant_i32 for the bounds.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/translate.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index a3a5263a5d..2646cb3eb5 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -2443,21 +2443,13 @@ gen_msubsui_64(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2_low, TCGv r2_high,
 
 static void gen_saturate(TCGv ret, TCGv arg, int32_t up, int32_t low)
 {
-    TCGv sat_neg = tcg_const_i32(low);
-    TCGv temp = tcg_const_i32(up);
-
-    /* sat_neg = (arg < low ) ? low : arg; */
-    tcg_gen_movcond_tl(TCG_COND_LT, sat_neg, arg, sat_neg, sat_neg, arg);
-
-    /* ret = (sat_neg > up ) ? up  : sat_neg; */
-    tcg_gen_movcond_tl(TCG_COND_GT, ret, sat_neg, temp, temp, sat_neg);
+    tcg_gen_smax_tl(ret, arg, tcg_constant_i32(low));
+    tcg_gen_smin_tl(ret, ret, tcg_constant_i32(up));
 }
 
 static void gen_saturate_u(TCGv ret, TCGv arg, int32_t up)
 {
-    TCGv temp = tcg_const_i32(up);
-    /* sat_neg = (arg > up ) ? up : arg; */
-    tcg_gen_movcond_tl(TCG_COND_GTU, ret, arg, temp, temp, arg);
+    tcg_gen_umin_tl(ret, arg, tcg_constant_i32(up));
 }
 
 static void gen_shi(TCGv ret, TCGv r1, int32_t shift_count)
-- 
2.34.1


