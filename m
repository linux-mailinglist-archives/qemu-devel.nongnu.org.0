Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D91D362195
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 16:00:29 +0200 (CEST)
Received: from localhost ([::1]:40860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXP1I-00044L-Am
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 10:00:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXOwp-0007Ig-G2
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 09:55:51 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:40559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXOwn-0004yP-Rb
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 09:55:51 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so16589163wmy.5
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 06:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fUFShcPDC317X/vb6vVkDpZRUIQxAt+AfUe4Dq7Bom8=;
 b=kM7cbZo5c5PQVnivS7VKxWw66HdUKfBK8PsHXC5VtfAgnLBtPznXNjISlsJu8RgAxN
 RBk/t0rARmrBIfFbRAzjqzTq1jJk2rHZVqEDTsvMbTx2owk8iytQADju7N6BGFuTT16W
 6n8GH2k+myxoIoqjTtF/OLkr4qgwU2lnlDPtUPNRrmXKSv9pgrdJW4hS7L/EPwNCCzJo
 6ycwVRLWKhGbDk2IpsmSLUUR1yRBEJZSobHzVbEMMFE+ZvshuzFBlS40e977LF+wntWd
 Cp89JBrmPPK9MIO9Xt9oJtbCJ6wmGM/jdwdHOpESlYi/TCNO6ffQioQeXbE1DNgh2sBJ
 SNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fUFShcPDC317X/vb6vVkDpZRUIQxAt+AfUe4Dq7Bom8=;
 b=ohjzWrcJeMdzi9ZDerxV67PVozzRhpBlD3Lc5jjzchlFocd1U97LAl0WAdyjLHszsj
 PHmLT12bIS82cCTH7ifm30FUM6PeY0ggRndAWpiDq457O/mWj8+zByRDQk/C82QJH7M+
 uDHXEMDb3SHMBOMGyS82PwO4V8LGTypPCTO+BzO4neFfXOfLWM1SqYt2wvXti32Rg9k0
 iYkv3fUGyo9GhMLdgRcGL1aBwB3giVd6UTah69nguYAcBEdkhKvu2AI9BbBRRttTWsK9
 k0tEwS8sgl6dyhwExNy/3LwouqufKNuaB3/9LpmVFG+A+xkQNvN6lvxMIbSHyrt6ixH3
 YqFw==
X-Gm-Message-State: AOAM532lA1e9+JyiyppHlTYV7UhOOSHVd8PbpwBTtx2ah3iqefZhWlKC
 OWFaYr/y4nyXkm9iDWcIeIXZD9xftcHUfNa4
X-Google-Smtp-Source: ABdhPJxB3QWeofmB669kmE4yFzoi7BT8F7CPyxA9K5lFQbd4wYHa4I2+wHs0oIaTs5ISvn9r26FA6w==
X-Received: by 2002:a1c:1dd0:: with SMTP id d199mr8251569wmd.54.1618581348589; 
 Fri, 16 Apr 2021 06:55:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p14sm10686528wrn.49.2021.04.16.06.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 06:55:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0? 5/6] include/qemu/bswap.h: Handle being included
 outside extern "C" block
Date: Fri, 16 Apr 2021 14:55:42 +0100
Message-Id: <20210416135543.20382-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210416135543.20382-1-peter.maydell@linaro.org>
References: <20210416135543.20382-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make bswap.h handle being included outside an 'extern "C"' block:
all system headers are included first, then all declarations are
put inside an 'extern "C"' block.

This requires a little rearrangement as currently we have an ifdef
ladder that has some system includes and some local declarations
or definitions, and we need to separate those out.

We want to do this because dis-asm.h includes bswap.h, dis-asm.h
may need to be included from C++ files, and system headers should
not be included within 'extern "C"' blocks.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu/bswap.h | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 4aaf992b5d7..2d3bb8bbedd 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -1,8 +1,6 @@
 #ifndef BSWAP_H
 #define BSWAP_H
 
-#include "fpu/softfloat-types.h"
-
 #ifdef CONFIG_MACHINE_BSWAP_H
 # include <sys/endian.h>
 # include <machine/bswap.h>
@@ -12,7 +10,18 @@
 # include <endian.h>
 #elif defined(CONFIG_BYTESWAP_H)
 # include <byteswap.h>
+#define BSWAP_FROM_BYTESWAP
+# else
+#define BSWAP_FROM_FALLBACKS
+#endif /* ! CONFIG_MACHINE_BSWAP_H */
 
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+#include "fpu/softfloat-types.h"
+
+#ifdef BSWAP_FROM_BYTESWAP
 static inline uint16_t bswap16(uint16_t x)
 {
     return bswap_16(x);
@@ -27,7 +36,9 @@ static inline uint64_t bswap64(uint64_t x)
 {
     return bswap_64(x);
 }
-# else
+#endif
+
+#ifdef BSWAP_FROM_FALLBACKS
 static inline uint16_t bswap16(uint16_t x)
 {
     return (((x & 0x00ff) << 8) |
@@ -53,7 +64,10 @@ static inline uint64_t bswap64(uint64_t x)
             ((x & 0x00ff000000000000ULL) >> 40) |
             ((x & 0xff00000000000000ULL) >> 56));
 }
-#endif /* ! CONFIG_MACHINE_BSWAP_H */
+#endif
+
+#undef BSWAP_FROM_BYTESWAP
+#undef BSWAP_FROM_FALLBACKS
 
 static inline void bswap16s(uint16_t *s)
 {
@@ -494,4 +508,8 @@ DO_STN_LDN_P(be)
 #undef le_bswaps
 #undef be_bswaps
 
+#ifdef __cplusplus
+}
+#endif
+
 #endif /* BSWAP_H */
-- 
2.20.1


