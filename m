Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0243552F28
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 11:51:48 +0200 (CEST)
Received: from localhost ([::1]:38816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3aXz-0001FC-SI
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 05:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aR6-0007sk-Vg; Tue, 21 Jun 2022 05:44:40 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c]:45022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aR3-0007MW-UO; Tue, 21 Jun 2022 05:44:39 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 v33-20020a4a9764000000b0035f814bb06eso2594704ooi.11; 
 Tue, 21 Jun 2022 02:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8j3mSBud8SR0reAw6KEwp2o8Neb26wSgmj15b5qeYag=;
 b=D7rYvkXRuR1pkowzpiyKq7CRtAOZ3UL3F7Bfre77TqUcE+IbmU8Jpm6YlSa3ExKJjS
 lRGFMKiuAJyIWc4rsCM0TMB24gJ0zswRWXAfEHRyzHbELxzoJ7nuSGyaDtOt2tl2cNps
 f5s2aqqPHmX94DkT6c/iR2/ccZ5Vu2Q7Np+CGwkF561QIk+tzDNdaOpRegK/IXyeT5Jx
 rxnYNLeqrhWZL9pYjNXCEN/AMQQTEII9FpHHEj7S1FTQWcUpzlr82Y4RsMFB2CZjpWuv
 MQNcIE4BTqMSy6YNejQ/8pY3GwLq25XdNPfzeab10M8xFfjO6xe2w0jIlrht64cgDgkS
 D9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8j3mSBud8SR0reAw6KEwp2o8Neb26wSgmj15b5qeYag=;
 b=eEY5H9Km0UGIvWcs/AcDAW0J83uIqLRP/PoCLOtP1YVeMpt3xxzePC6fiuaTboaCAW
 a4tSzBtukADWDwH0jV4OkEOXM2YU88AyAhhMk7NkH2fwenJhU+1kkg9c2vLnxd0vTJeo
 +UPf0P35oM1djtyoDBa9I2Wv591KOXJ0xrr4mjlsQjwgQBkbeKFQ7xBxltgccTYqZtgS
 Prvqvdbflz0djQyGswD+C8lZjYihosZMrvlm7LtuWUu0xk4g6K72JHHXipIwLhjGSMj/
 8Nopn0Z0HWTNmsCVtRlv5/cAgYx2hfL+UZMg2a5/WIqjW9fbX2zmzYD7nfkHSL65xhKf
 p/Dw==
X-Gm-Message-State: AJIora+rrDDhH1HhahtFDw7oIhFxS3+q+Q979+t0xE4+on87qipzDI9E
 B8GR6rLY2BYzD0Jvnw/kmzgVzlGGGTTyDw==
X-Google-Smtp-Source: AGRyM1sOrsNi5fhhk9ShTlHGKCoYU3pkAx4UyVRUyYFwqwj46/ub1Yw59Qth7aNd+0ZbfWWzycj3YQ==
X-Received: by 2002:a05:6820:614:b0:41b:8f3f:a6c9 with SMTP id
 e20-20020a056820061400b0041b8f3fa6c9mr10844995oow.95.1655804676310; 
 Tue, 21 Jun 2022 02:44:36 -0700 (PDT)
Received: from balboa.ibmuc.com ([187.34.29.129])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a9d7a49000000b0061020865f1asm7555119otm.50.2022.06.21.02.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 02:44:36 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>
Subject: [PULL 13/15] target/ppc: avoid int32 multiply overflow in int_helper.c
Date: Tue, 21 Jun 2022 06:43:58 -0300
Message-Id: <20220621094400.122800-14-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621094400.122800-1-danielhb413@gmail.com>
References: <20220621094400.122800-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity is not thrilled about the multiply operations being done in
ger_rank8() and ger_rank2(), giving an error like the following:

Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
    Potentially overflowing expression "sextract32(a, 4 * i, 4) *
sextract32(b, 4 * i, 4)" with type "int" (32 bits, signed) is evaluated
using 32-bit arithmetic, and then used in a context that expects an
expression of type "int64_t" (64 bits, signed).

Fix both instances where this occur by adding an int64_t cast in the
first operand, forcing the result to be 64 bit.

Fixes: Coverity CID 1489444, 1489443
Fixes: 345531533f26 ("target/ppc: Implemented xvi*ger* instructions")
Cc: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Cc: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Message-Id: <20220602141449.118173-1-danielhb413@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/int_helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 11871947bc..3ae03f73d3 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -789,7 +789,7 @@ static int64_t ger_rank8(uint32_t a, uint32_t b, uint32_t mask)
     int64_t psum = 0;
     for (int i = 0; i < 8; i++, mask >>= 1) {
         if (mask & 1) {
-            psum += sextract32(a, 4 * i, 4) * sextract32(b, 4 * i, 4);
+            psum += (int64_t)sextract32(a, 4 * i, 4) * sextract32(b, 4 * i, 4);
         }
     }
     return psum;
@@ -811,7 +811,8 @@ static int64_t ger_rank2(uint32_t a, uint32_t b, uint32_t mask)
     int64_t psum = 0;
     for (int i = 0; i < 2; i++, mask >>= 1) {
         if (mask & 1) {
-            psum += sextract32(a, 16 * i, 16) * sextract32(b, 16 * i, 16);
+            psum += (int64_t)sextract32(a, 16 * i, 16) *
+                             sextract32(b, 16 * i, 16);
         }
     }
     return psum;
-- 
2.36.1


