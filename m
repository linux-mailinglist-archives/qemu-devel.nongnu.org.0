Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDEF255F83
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 19:12:50 +0200 (CEST)
Received: from localhost ([::1]:35706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBhvm-0000TH-20
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 13:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBhop-0003oy-Ul
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 13:05:39 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:36319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBhoo-00032w-DP
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 13:05:39 -0400
Received: by mail-pg1-x52d.google.com with SMTP id p37so731293pgl.3
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 10:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uHfxrHQWg2O+r2PVrn88/8hdFFb+717npid0qZec8zg=;
 b=yK79qwzfaH40Z1JVCkGqopZ7hJptf/Ot/frQc/0ErjJMAd6FpCqW99D10qMvAs9wej
 eAbAuBkEJINReChClbJtpxIsLo6ytnNkxoEPkANaVL+VhOTVejR8lgdv/2HByPoovTZG
 aQDGy+27Ul6RklJNRada767cTVJTBFPrxNNJtCGHDFWm6pJccWGEaI18msdkq3cocX/f
 x8FZV5BPBPTuFWVsofd9o71keMOy08pWjd5tgTpafy68CrzPfAuRG92aT/gMbn/AxNCy
 E1jEdrpOi2YhV8kgRNQ6+aTqdjoTCmou03L2b854hqTYshKGlcRMW/mTYEkUjtuTX5N2
 BIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uHfxrHQWg2O+r2PVrn88/8hdFFb+717npid0qZec8zg=;
 b=dSarxfu/iNsWMdM7IMdR/gO0uU4JIWWnxNY9fUVvc5Pteds7Xz9DESpEEzHClBXRV7
 XITpFxZt1DEsTmujifisgTyNCjJzj1kJFQv7h1EpOxr9fSB0Th4dnJVZDRFiJJcjZl3Y
 H8/0DHg6QrVQHd1wZMK5OSwrNScMUCKW2z7h/ITrbjk75Jn/WGJof99AtYmEFLJSVcHv
 QiXGGhRS07hYLyCqXyPkQ4ieuk5kmKAmw6R0F/mWln83RZ7JjkU8U4M4A4E/nz5egshP
 CqUZtMM3xci0b5WL29QlSJj/S4JHkhSxQbGWVLixmFcan0sFZ8/rTqkr/NSrf4AOxMGq
 JQ1Q==
X-Gm-Message-State: AOAM531ZzXI/gE+9YgRJqvH0UmJgXfacsj+pulscnk2medWMFsfSkruB
 Hr9s6f0koxqk9RXfrgAY8UaPdNtu1aZpSA==
X-Google-Smtp-Source: ABdhPJw7Csw6kXNFcNj+Y+cCIgPZQaEOamW8n++pGMvmnpYGjRHIgL9QqdDly6+q8wTRP0xqfcLLdA==
X-Received: by 2002:a63:7056:: with SMTP id a22mr1809199pgn.12.1598634336675; 
 Fri, 28 Aug 2020 10:05:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id q12sm2277495pff.196.2020.08.28.10.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 10:05:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/16] crypto: Constify cipher data tables
Date: Fri, 28 Aug 2020 10:05:16 -0700
Message-Id: <20200828170523.418603-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200828170523.418603-1-richard.henderson@linaro.org>
References: <20200828170523.418603-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 crypto/cipher.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/cipher.c b/crypto/cipher.c
index 3711b552fa..068b2fb867 100644
--- a/crypto/cipher.c
+++ b/crypto/cipher.c
@@ -25,7 +25,7 @@
 #include "cipherpriv.h"
 
 
-static size_t alg_key_len[QCRYPTO_CIPHER_ALG__MAX] = {
+static const size_t alg_key_len[QCRYPTO_CIPHER_ALG__MAX] = {
     [QCRYPTO_CIPHER_ALG_AES_128] = 16,
     [QCRYPTO_CIPHER_ALG_AES_192] = 24,
     [QCRYPTO_CIPHER_ALG_AES_256] = 32,
@@ -40,7 +40,7 @@ static size_t alg_key_len[QCRYPTO_CIPHER_ALG__MAX] = {
     [QCRYPTO_CIPHER_ALG_TWOFISH_256] = 32,
 };
 
-static size_t alg_block_len[QCRYPTO_CIPHER_ALG__MAX] = {
+static const size_t alg_block_len[QCRYPTO_CIPHER_ALG__MAX] = {
     [QCRYPTO_CIPHER_ALG_AES_128] = 16,
     [QCRYPTO_CIPHER_ALG_AES_192] = 16,
     [QCRYPTO_CIPHER_ALG_AES_256] = 16,
@@ -55,7 +55,7 @@ static size_t alg_block_len[QCRYPTO_CIPHER_ALG__MAX] = {
     [QCRYPTO_CIPHER_ALG_TWOFISH_256] = 16,
 };
 
-static bool mode_need_iv[QCRYPTO_CIPHER_MODE__MAX] = {
+static const bool mode_need_iv[QCRYPTO_CIPHER_MODE__MAX] = {
     [QCRYPTO_CIPHER_MODE_ECB] = false,
     [QCRYPTO_CIPHER_MODE_CBC] = true,
     [QCRYPTO_CIPHER_MODE_XTS] = true,
-- 
2.25.1


