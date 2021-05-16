Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFEC381F01
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 15:08:40 +0200 (CEST)
Received: from localhost ([::1]:33438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGVb-0003eI-Mk
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 09:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFzb-0007qQ-KP
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:35 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:36452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFz7-0007rj-Bc
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:35 -0400
Received: by mail-qk1-x729.google.com with SMTP id c20so3322063qkm.3
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RndXytbTpyoZf87SoTBz0zxUXITxwgpEDPn6NB45UNI=;
 b=Iyvgq1tZ+Wc/X3y9EH47MrrlnfZrHPU64rQ7pY94+3Nc0wQo2ccTHg6hSLcLSs3/zL
 4Z7fIhuZwZN5oa/PB0ttML1tVdBF125qddRGssIEXS4IIJAguAQyvbl4cPRopt5ZWuQQ
 ucQAvz5a9tYRdYK8x36Xq+aV993J/ZAgpaBqTHtL3mPSKHdwHacTRUXdlPiDsm9PSHvE
 Evw45OlpJWPPgG6Fv8KZt2CIwCKwKjDGQXwORWNan7juohfmR280uImstyDjdoBl8rY0
 Jb9iA7ZPmvhl5uGKAToKVLi/jQIxKmiIpvTO1dLPZG90DALoyLIYqRmypSBFDC0YpQEb
 jODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RndXytbTpyoZf87SoTBz0zxUXITxwgpEDPn6NB45UNI=;
 b=sgcBEC8lpy47CHSL6k4YjFq7+lpni6/g5QBO3w5lC6rZyQciMa/O1HpNMTTewjewkT
 WnNAfQ6kZVtwEzc3XYB35Oj9fCbkXplZ/LvYvjaBIOPDsl5wSyNBam85BWIsonGPwtvT
 F0RtTNWYwmNYuIqKTcfGrgSO72htytvMkB3Gr43LlOx3hzNL22QuX1QOv2wxtRiS1lio
 L+ieUz1uviYs9fmxdPwaPc36wXq0YVQc8BsMGW8eGYHy1Dakn6njGE0JeOR0PgYwiRKM
 DdMn/hiq2n7CECInVjoZ8MFsBmnJYqTFU6cRmFx7MW3Ecj1F6DDK6Q4xmakPy0zL99QX
 x9TA==
X-Gm-Message-State: AOAM530a4ybcaXbmDcNyU1uDwU1/hxUKkuMg9DqVRJ0M7R8Nxxg17u9z
 Q/8431mNDK4KXU+UTgc0I9DH2dUzak3uNZuQvkQ=
X-Google-Smtp-Source: ABdhPJwEUjEr1XBxA3GZoz7BvcbcP+aDRF2Ohj8eR8BqPJKnmErvKrZqBokuOJyEl27X+9pLfL9LTA==
X-Received: by 2002:a37:a3d7:: with SMTP id
 m206mr51287967qke.343.1621168504040; 
 Sun, 16 May 2021 05:35:04 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:35:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/46] softfloat: Use mulu64 for mul64To128
Date: Sun, 16 May 2021 07:34:23 -0500
Message-Id: <20210516123431.718318-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x729.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Via host-utils.h, we use a host widening multiply for
64-bit hosts, and a common subroutine for 32-bit hosts.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-macros.h | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/include/fpu/softfloat-macros.h b/include/fpu/softfloat-macros.h
index 2e3760a9c1..f6dfbe108d 100644
--- a/include/fpu/softfloat-macros.h
+++ b/include/fpu/softfloat-macros.h
@@ -470,27 +470,10 @@ static inline void sub192(uint64_t a0, uint64_t a1, uint64_t a2,
 | `z0Ptr' and `z1Ptr'.
 *----------------------------------------------------------------------------*/
 
-static inline void mul64To128( uint64_t a, uint64_t b, uint64_t *z0Ptr, uint64_t *z1Ptr )
+static inline void
+mul64To128(uint64_t a, uint64_t b, uint64_t *z0Ptr, uint64_t *z1Ptr)
 {
-    uint32_t aHigh, aLow, bHigh, bLow;
-    uint64_t z0, zMiddleA, zMiddleB, z1;
-
-    aLow = a;
-    aHigh = a>>32;
-    bLow = b;
-    bHigh = b>>32;
-    z1 = ( (uint64_t) aLow ) * bLow;
-    zMiddleA = ( (uint64_t) aLow ) * bHigh;
-    zMiddleB = ( (uint64_t) aHigh ) * bLow;
-    z0 = ( (uint64_t) aHigh ) * bHigh;
-    zMiddleA += zMiddleB;
-    z0 += ( ( (uint64_t) ( zMiddleA < zMiddleB ) )<<32 ) + ( zMiddleA>>32 );
-    zMiddleA <<= 32;
-    z1 += zMiddleA;
-    z0 += ( z1 < zMiddleA );
-    *z1Ptr = z1;
-    *z0Ptr = z0;
-
+    mulu64(z1Ptr, z0Ptr, a, b);
 }
 
 /*----------------------------------------------------------------------------
-- 
2.25.1


