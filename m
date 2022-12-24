Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C52655BFD
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 01:15:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9EP0-0002hH-0W; Sat, 24 Dec 2022 18:58:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOl-0002P6-OH
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:52 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOk-0006Lh-7X
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:51 -0500
Received: by mail-pl1-x62c.google.com with SMTP id s7so8041233plk.5
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tz8pxyjZBQm1+qEjyv1TGYW3iZ6MjviUhbwrA5+bw+s=;
 b=pkUn1F/R7f6HmHMPtPaET3u5rtxThO/Llt7pnva75dhCbgHiXgfMtHih4rbLWAvuNo
 agmFc5HV3O6CxGGYrCCYVe7xyAF+BNnzp4eDJH+xqGlHOFLAVs/rbnlYxk89vUcy3T/a
 nH4MHQtn05kQ8czvYnrigs8L592/UBcbn4a8hNiNL3Jva/XwvohxPm2FmC1UWrwtWAWX
 ruPkO67P3D/atsA4j2pmTFtmdKNFn+74oIqM2KjD9KpKnPTExsYozMb/u7mqBL5fRjNJ
 aa0oYBTee9sOBp+usXK2sg+3/7pWKO9VE2OniWHRq0tWaTJBrTPAamin+oProXgG7YFF
 hzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tz8pxyjZBQm1+qEjyv1TGYW3iZ6MjviUhbwrA5+bw+s=;
 b=dv2BrKB+KfRWKSoWgh6bxV9u40pY6tmibQnea//bhgCzvxmOS/aZcyGDl0jn1Nc6Dt
 /YMFJm2gGPJCaY8veAO9UMhCYiie2y0qJHQxPGjUrd2Vrsox1xwlNI9u812XCRt3yAG8
 bGAw1xvBSQBYVakUcb5rdX59uCM1kLC2uT0opRwk1KD3atuO+z62ImNXF0gmb5jkyOyt
 KtELLLNnjOzdkw6tMcALPXqtkT5JThlQSSHwTCN4yD8cmKNY4Zei6hhW4WvPTuyhYmiE
 gcydT2VRPZl6nmkVeX+1H24AofnsJ2UroVuH73QPNNpNDP1F7TV9V9QrrfVxzEE53zYf
 vS5Q==
X-Gm-Message-State: AFqh2krZgIy5ks77enmjlSVfmrKNz6i/TdFhkxrpID2/z7dcSlHXHLeg
 wgCgICZTltA72kAkV0rR5t0lFLVtdbTRFOAk
X-Google-Smtp-Source: AMrXdXvReEAYlYX5PyL+6EAKZ8F+6sqJTg3s+91996dcsP2U069DyA4KXPJzNx/hWVfGg+4MSVPCQA==
X-Received: by 2002:a17:902:e0c9:b0:192:6853:b5b4 with SMTP id
 e9-20020a170902e0c900b001926853b5b4mr3724065pla.23.1671926268963; 
 Sat, 24 Dec 2022 15:57:48 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00187022627d7sm4599716plb.36.2022.12.24.15.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 15:57:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v5 28/43] tcg: Introduce TCGCallReturnKind and
 TCGCallArgumentKind
Date: Sat, 24 Dec 2022 15:57:05 -0800
Message-Id: <20221224235720.842093-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Prepare to replace a bunch of separate ifdefs with a
consistent way to describe the ABI of a function call.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-internal.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index 2c06b5116a..f574743ff8 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -27,6 +27,21 @@
 
 #define TCG_HIGHWATER 1024
 
+/*
+ * Describe the calling convention of a given argument type.
+ */
+typedef enum {
+    TCG_CALL_RET_NORMAL,         /* by registers */
+} TCGCallReturnKind;
+
+typedef enum {
+    TCG_CALL_ARG_NORMAL,         /* by registers (continuing onto stack) */
+    TCG_CALL_ARG_EVEN,           /* like normal, but skipping odd slots */
+    TCG_CALL_ARG_EXTEND,         /* for i32, as a sign/zero-extended i64 */
+    TCG_CALL_ARG_EXTEND_U,       /*      ... as a zero-extended i64 */
+    TCG_CALL_ARG_EXTEND_S,       /*      ... as a sign-extended i64 */
+} TCGCallArgumentKind;
+
 typedef struct TCGHelperInfo {
     void *func;
     const char *name;
-- 
2.34.1


