Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A47C45727F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:11:25 +0100 (CET)
Received: from localhost ([::1]:37212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6U0-0006HY-Nf
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:11:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6OC-0004wj-LS
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:24 -0500
Received: from [2a00:1450:4864:20::42b] (port=42805
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6OB-00049V-5L
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:24 -0500
Received: by mail-wr1-x42b.google.com with SMTP id c4so18945135wrd.9
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P3ZxUOIY7M4EJjayoYfQ2lSz8e1LGmQKLC/bBHZphWE=;
 b=Ks5vkJ4ZQT2CQVqS6QOxrzGXM39ZC0GRHdQQ3qneWrNOG4r6s1p65U1D0/amPF1z9Z
 emE3hGG0duoYp+A/nVP+ppMAVM8+cubgAB/6WGquBMKnlvnBY0ltxBCCFU4etWg/u1DA
 +aj0XMliirCh6ZmiHuxhUoLaFFPAl+zoaLmzTJjK/0g1EBhftExwfdSXD3h4y5IasS6Y
 SGvTOUxpX7zSdGvZy4sTOi8ZU7lEM22nzqOAx1qHR1Ssw2NphgSlkllthwyRo+zH84us
 OCikV0FMNsgxrNdB0lfSvGec2UA8T/CoBmgVe2juUtsXvoIXSzJwkAWRVwjlmhlVFRmZ
 MVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P3ZxUOIY7M4EJjayoYfQ2lSz8e1LGmQKLC/bBHZphWE=;
 b=JJ7UddO+KVvjuda+hbkZmIaK+iUu8ObW+BTSA1U35S2iAx3oEpYrHmIhe3U/95TBy8
 hteNwxLWddOV1yul98+WRVhccZGRytUHMrKzfHq90eYduq0G9gYZuP4zHXIWCKUVBD+K
 b/WzYgA0dymUK2GqrhwcwDRnR8zNqswce/ZDL+Whwn6dk8NhxXDF0HvwU2qcSQnFSRX1
 +Bt/oKAI584bANbpJhaU7azU9mFR/lco0VOmipNoxrZ6zbFdvrJk8Yg0zcDdH3EDPa8p
 gMt4XewKhiDI8VvjJyQ+5zQaT3ib5sQlJA8S4PiXnACs3ezxfqCH9DjM3tCfTJdwnN15
 nUug==
X-Gm-Message-State: AOAM530Hsh/Koeq05Hc90rFsVqxt+H1fu/gavOSC+AVQxaxQ6V/pQHY3
 Mq7yDCz/YUoSwh0q3QUaPkSmxTyz1NNMOIi+qvc=
X-Google-Smtp-Source: ABdhPJyLeZp8sCUEaIVHJgJjS2cq1tA1TorU6H30JVpIui9Fn7f+EY0Un9FXsvJ1aa7AJZFRd/mPcA==
X-Received: by 2002:a05:6000:10c7:: with SMTP id
 b7mr9025159wrx.160.1637337921626; 
 Fri, 19 Nov 2021 08:05:21 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:05:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/35] softfloat: Add flag specific to convert non-nan to int
Date: Fri, 19 Nov 2021 17:04:33 +0100
Message-Id: <20211119160502.17432-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, alex.bennee@linaro.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PowerPC has this flag, and it's easier to compute it here
than after the fact.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-types.h |  1 +
 fpu/softfloat-parts.c.inc     | 14 +++++++-------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index 33224b5f22..9ca50e930b 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -157,6 +157,7 @@ enum {
     float_flag_invalid_idi     = 0x0200,  /* inf / inf */
     float_flag_invalid_zdz     = 0x0400,  /* 0 / 0 */
     float_flag_invalid_sqrt    = 0x0800,  /* sqrt(-x) */
+    float_flag_invalid_cvti    = 0x1000,  /* non-nan to integer */
 };
 
 /*
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index cc8c2c3aee..ce580347dd 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -1055,7 +1055,7 @@ static int64_t partsN(float_to_sint)(FloatPartsN *p, FloatRoundMode rmode,
         break;
 
     case float_class_inf:
-        flags = float_flag_invalid;
+        flags = float_flag_invalid | float_flag_invalid_cvti;
         r = p->sign ? min : max;
         break;
 
@@ -1077,11 +1077,11 @@ static int64_t partsN(float_to_sint)(FloatPartsN *p, FloatRoundMode rmode,
             if (r <= -(uint64_t)min) {
                 r = -r;
             } else {
-                flags = float_flag_invalid;
+                flags = float_flag_invalid | float_flag_invalid_cvti;
                 r = min;
             }
         } else if (r > max) {
-            flags = float_flag_invalid;
+            flags = float_flag_invalid | float_flag_invalid_cvti;
             r = max;
         }
         break;
@@ -1120,7 +1120,7 @@ static uint64_t partsN(float_to_uint)(FloatPartsN *p, FloatRoundMode rmode,
         break;
 
     case float_class_inf:
-        flags = float_flag_invalid;
+        flags = float_flag_invalid | float_flag_invalid_cvti;
         r = p->sign ? 0 : max;
         break;
 
@@ -1138,15 +1138,15 @@ static uint64_t partsN(float_to_uint)(FloatPartsN *p, FloatRoundMode rmode,
         }
 
         if (p->sign) {
-            flags = float_flag_invalid;
+            flags = float_flag_invalid | float_flag_invalid_cvti;
             r = 0;
         } else if (p->exp > DECOMPOSED_BINARY_POINT) {
-            flags = float_flag_invalid;
+            flags = float_flag_invalid | float_flag_invalid_cvti;
             r = max;
         } else {
             r = p->frac_hi >> (DECOMPOSED_BINARY_POINT - p->exp);
             if (r > max) {
-                flags = float_flag_invalid;
+                flags = float_flag_invalid | float_flag_invalid_cvti;
                 r = max;
             }
         }
-- 
2.25.1


