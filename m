Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF1E53BA88
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 16:17:23 +0200 (CEST)
Received: from localhost ([::1]:54386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwldZ-0008Oz-Sg
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 10:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nwlbH-0006r0-OE; Thu, 02 Jun 2022 10:15:00 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35]:46147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nwlbG-0000Vk-8G; Thu, 02 Jun 2022 10:14:59 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-d39f741ba0so6829356fac.13; 
 Thu, 02 Jun 2022 07:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GqeITH7xKocPHvSnoZpjx3cOxEt1zdxYLUFFz/QsWGI=;
 b=AH5BwEhKQgW43cFuUFzdoWhjnZblVjex42QevmQ+E+bZ4ax6H9CMQqhgsuK0wqgyFR
 ez7YKpgxNcYhc+FSAnhA2Z1C/gFYHxWafZLMHp1rGqikZ0qBaqflrmN5Bq3xHkWapSJN
 W8nGqjJK/mxm9aQQSs/SySX79Zj4O/vQUZF0pDRVvW79qIcUDspE5iZix6zyvB0NxN3n
 Nx5dWw1DBtCnqNwO8GIWAimbpuPOkIjML+AdKTRs1XKaInK64yDiEYSViI/mfh3eP/6i
 UZnQIXpshzogy0+OuVTbaH6A986xd6kjlDBoV1FbF1B+0yMBivHXuRaCxY+xyJM+A6i0
 mmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GqeITH7xKocPHvSnoZpjx3cOxEt1zdxYLUFFz/QsWGI=;
 b=MK0VP+bIakldKbl+XtMoBXA0yxVnoCyrrw2y7pQG+GJgGD3DtmIYMV2TeKCHt7fpDr
 myQ+Av2/0zAM3Dgv9ejtaSJW48897VjD4dy2srv/KZayNIo+K+5JMZnpGmtvshw27eRX
 UztcLsWUoQgb8lHwKb6U0F+8M2zWyO9S9rP5hI63pWaFt4PPo3H6qxozBhjYnTUIJA60
 6mO7W2e5irlgaMSkxaoFp//MjbhvIN3TLNh4Es4cydBGK4IWcI98/Wq+qh4vLztmKs+T
 ytsUiwphTtE+Xt5keTmzrLV+3Jc/L4O+yeEcMENWJe0AS40OnF4dTw0x3pJ1d4ga9oiO
 WJ7A==
X-Gm-Message-State: AOAM5322BZptENyRgHyvrF5wBMGh0qPjNNIq2fsYu8RjfWFTFToT7c3h
 0HMlKdV8oQXPfVdHxrP75sNbn7VjmP5deQ==
X-Google-Smtp-Source: ABdhPJwOq3yZicvnh/ExX3s+JU5eQLo3r41lboTJNfUZ9gMdWin0LtjGiB4wYnquKgKfyQUy8yRKcw==
X-Received: by 2002:a05:6871:b0f:b0:f3:3687:515f with SMTP id
 fq15-20020a0568710b0f00b000f33687515fmr11995993oab.220.1654179296086; 
 Thu, 02 Jun 2022 07:14:56 -0700 (PDT)
Received: from balboa.ibmuc.com ([152.250.93.219])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a4a984b000000b0035ef3da8387sm2344441ooi.4.2022.06.02.07.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 07:14:55 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] target/ppc: avoid int32 multiply overflow in int_helper.c
Date: Thu,  2 Jun 2022 11:14:49 -0300
Message-Id: <20220602141449.118173-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x35.google.com
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
---
 target/ppc/int_helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 105b626d1b..eb65ab4d82 100644
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


