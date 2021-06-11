Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB75D3A4B45
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:36:34 +0200 (CEST)
Received: from localhost ([::1]:58794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrqhV-0006w0-Ru
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqev-0004HJ-Ap
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:33:53 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:37883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqes-0006OE-J8
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:33:53 -0400
Received: by mail-pg1-x530.google.com with SMTP id t9so3655544pgn.4
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xx5lp96zsjKDJqIzIsAiA4NHIQLDT9JH68RupV1IPlw=;
 b=zp80zVLTI2yxIcqQVMPFYfJ0GtXjqsomCwxeXX3g4X6x7nue9IWOGwmplkz9hWi+G0
 AtqCvEC4nBPEkC+TEUhmtb7sJxo3BkLhcnERkmAwB8smCWBCXRv75KbQDNLRjJKwU8Rd
 cUnNQN3KNU9heSDpRyS6GUaM4JO08NDRc8EBde2qEW1I8ZfAiHOTl2VrcHOohYhNcje5
 iyumvNAL8XmQEawMGxtvlUOtC4yAvoHTEphPW9H9Lnv1D06kEEMrbWcJkcw9gGZ1G6uz
 3rtudgOi4hpBcqea9tvhJf7gkjYYhFJgfM3N/cLO62+M0DMBB9wJxotO8KJ66rea9Yqy
 a55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xx5lp96zsjKDJqIzIsAiA4NHIQLDT9JH68RupV1IPlw=;
 b=eYjTWqeK1gKoEbtFk46+Bt1rJh7IoRdigo054KJxC9m8ZCBTzvbrCMC/JRPB9xHTEE
 3aZSYNboDx7OdlycjRgRhjqH4dkyE6HAx+empLzN+0OXzgAgq6CxRbYxg4Uc1sSY4d0R
 w5BExn3RvRRBfsfOgsWOlcQs4nKO2/RXS7OvmK3mGrWlpbKz2H2dpmLrHwejYQk+83nd
 wNl4qOyXn//JuL27itjZHC+IGq9X1HMxsds0kbOlae7tvramZwqVNyW5KoARhd3U68wr
 BdpijIr8ogTy5AfMHjznNR7hTbDaZ0PD2ug8KgIkTsTp2pPwYDexl/BxSJYs8YJd7yI4
 k0Ng==
X-Gm-Message-State: AOAM533XqeAOFgPRD/E0WG7zC2JT1rfjzYuXOX6rbsIehr1dicSWbC7r
 RTfdPFTz9S5f/ey5+CYNvliF29Fu17Ultg==
X-Google-Smtp-Source: ABdhPJw+qS5yikgILmoEzdNx0qiDujK0ir8oteBdyHXfmiRQX9ccgq2zTxQVrMjj34XiNvA2cjKlqA==
X-Received: by 2002:a62:2901:0:b029:28e:ef3d:10d2 with SMTP id
 p1-20020a6229010000b029028eef3d10d2mr10496083pfp.45.1623454429242; 
 Fri, 11 Jun 2021 16:33:49 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id m134sm6349606pfd.148.2021.06.11.16.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:33:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/8] softfloat: Use _Generic instead of QEMU_GENERIC
Date: Fri, 11 Jun 2021 16:33:41 -0700
Message-Id: <20210611233347.653129-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611233347.653129-1-richard.henderson@linaro.org>
References: <20210611233347.653129-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: pbonzini@redhat.com, thuth@redhat.com, ehabkost@redhat.com,
 Richard Henderson <richard.henderson@liaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@liaro.org>

Signed-off-by: Richard Henderson <richard.henderson@liaro.org>
---
 fpu/softfloat.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 1cb162882b..6f4aea7dee 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -686,11 +686,13 @@ static float128 float128_pack_raw(const FloatParts128 *p)
 #include "softfloat-specialize.c.inc"
 
 #define PARTS_GENERIC_64_128(NAME, P) \
-    QEMU_GENERIC(P, (FloatParts128 *, parts128_##NAME), parts64_##NAME)
+    _Generic((P), FloatParts64 *: parts64_##NAME, \
+                  FloatParts128 *: parts128_##NAME)
 
 #define PARTS_GENERIC_64_128_256(NAME, P) \
-    QEMU_GENERIC(P, (FloatParts256 *, parts256_##NAME), \
-                 (FloatParts128 *, parts128_##NAME), parts64_##NAME)
+    _Generic((P), FloatParts64 *: parts64_##NAME, \
+                  FloatParts128 *: parts128_##NAME, \
+                  FloatParts256 *: parts256_##NAME)
 
 #define parts_default_nan(P, S)    PARTS_GENERIC_64_128(default_nan, P)(P, S)
 #define parts_silence_nan(P, S)    PARTS_GENERIC_64_128(silence_nan, P)(P, S)
@@ -892,11 +894,13 @@ static void parts128_log2(FloatParts128 *a, float_status *s, const FloatFmt *f);
  */
 
 #define FRAC_GENERIC_64_128(NAME, P) \
-    QEMU_GENERIC(P, (FloatParts128 *, frac128_##NAME), frac64_##NAME)
+    _Generic((P), FloatParts64 *: frac64_##NAME, \
+                  FloatParts128 *: frac128_##NAME)
 
 #define FRAC_GENERIC_64_128_256(NAME, P) \
-    QEMU_GENERIC(P, (FloatParts256 *, frac256_##NAME), \
-                 (FloatParts128 *, frac128_##NAME), frac64_##NAME)
+    _Generic((P), FloatParts64 *: frac64_##NAME, \
+                  FloatParts128 *: frac128_##NAME, \
+                  FloatParts256 *: frac256_##NAME)
 
 static bool frac64_add(FloatParts64 *r, FloatParts64 *a, FloatParts64 *b)
 {
-- 
2.25.1


