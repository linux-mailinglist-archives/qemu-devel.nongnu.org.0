Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D1E376E7F
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:20:35 +0200 (CEST)
Received: from localhost ([::1]:42866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCa2-00023l-U4
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC5G-0004ro-1o
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:46 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:38815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC50-0003g1-45
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:45 -0400
Received: by mail-pl1-x634.google.com with SMTP id 69so1536078plc.5
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RndXytbTpyoZf87SoTBz0zxUXITxwgpEDPn6NB45UNI=;
 b=c6tA/hOmsdMywC7W6Ey8D5CCg+Rr2zLDoZgOe0uv18/UucQXgny8Uul1FftPE34/rw
 cXNLzgkJLuYZaFVgzX6J14kK6Hxp1jU7XOoQqRqoNFMbNoooL5qPZDQL1gmgAQELRa8u
 hH6amW3qXptSWEc14UNCwr93OnEvNqu2dQK3WddfS8SEeFDmyu+USLYn+fZMe5tG8JVT
 cHZPIpzff7CLJyajAtyVSxN98mte6WvoX7bq+Fy1OVAuyx8a8Y4E/JLMhWqAUoANy7JL
 ThffoUiqX2jrcdGJpGzFBXW5J10HWYESFYkAz/57aEScwvdFs/jzU8J6e+qT8lc4UXhr
 vqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RndXytbTpyoZf87SoTBz0zxUXITxwgpEDPn6NB45UNI=;
 b=rVFr6l1mYHa20vI1528ERaEClsTTsjZkhjqPNm8jsjV++bFKtU5N37rRT+II7uqxC9
 SXyj6bgPXs4lFOExdLTXZ6uieiFRuCI+m2SzsK5h+zIuXEsUXiUwvKQgmJNu2cmJeVeW
 PgCWmie7A26uPSFUCVB/gZ4N3icCMpCqIRfLUxmUh6/FMOmL9eu+nDkm8bLchOhkEOZN
 DEwbtN0EVgTEApsdj7WeQ9UIRykhpv6x3AlNHAOq0DJRc1N7sQkqXDNsGV3YBY4pRUMv
 r2BbuoKGHszKoUuP3oEx+APEl2wO3x+22uiJj9IYe8TILiHTsVxKOqV5ewQJcARUR09D
 vkgQ==
X-Gm-Message-State: AOAM532gxzju3dx2VALkPaIyZRft1sLm7K9aqpeL5kv8vQyW1FxMhb+H
 uc1U+fj8mvGOddp1/evGtqbavpu8WKkudA==
X-Google-Smtp-Source: ABdhPJxct59W6X+6AxKcvJkDerATd0RDWxCQpzf/iL4f6VzDrB5VER+ZDXW+pOekakaM4+kHdjHilA==
X-Received: by 2002:a17:902:a9cb:b029:ed:61be:2cfb with SMTP id
 b11-20020a170902a9cbb02900ed61be2cfbmr13180155plr.9.1620438508352; 
 Fri, 07 May 2021 18:48:28 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 38/72] softfloat: Use mulu64 for mul64To128
Date: Fri,  7 May 2021 18:47:28 -0700
Message-Id: <20210508014802.892561-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: alex.bennee@linaro.org, david@redhat.com
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


