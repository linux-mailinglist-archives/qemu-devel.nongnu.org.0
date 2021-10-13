Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8A242CC21
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 22:53:26 +0200 (CEST)
Received: from localhost ([::1]:55574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1malFd-0001d7-Kf
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 16:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malDT-0007Ms-TY
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 16:51:11 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:35407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malDR-000837-Ng
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 16:51:11 -0400
Received: by mail-pf1-x42d.google.com with SMTP id c29so3567146pfp.2
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 13:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JW/tzOqQKK5hRD4CRoj0kca6rOybKGXTUDDhLFOWwb8=;
 b=EqILzztPTSxPua6iFy6dHn3jeX6cXzqW77Yl3/exjx7p+vLROqBR+ZNvehvsfpV+vX
 nBeib442CuPXopJsSX9r7Y+wCHhqnztRRWWyWM8i7NTWSdOdkAWkPVXdTm0SIzf46J80
 by/lYBIkyBLRju9BGchrTiXYrmGentSl94w2/7oty6Uzgc3vwFzhFUzzM/1aAp5W+xCu
 I2aLDe++4wXbUh2cvZRcHk7B2C6SbO9zoZaRdFyxsIcUwvtSwKjXAN8Clnn3IXkrZLiv
 G1HijfFtjCVd77CQz5fWlqCquxbQmfJ/tCXKEOwl6N1Q5mDHx3N+7UojpA4UP1dXBEuN
 38mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JW/tzOqQKK5hRD4CRoj0kca6rOybKGXTUDDhLFOWwb8=;
 b=PFI82nvXF/ZoXlAxepj5qelORAZPj14m0PTm9N1fEId/a+/M+uQH1oZame/lmfRsbW
 E9Guw5OXOD8bwXNhJZEXFUeb5hZpORrhGAkSgA1JS5l5+yVA1vqZrKm+oBR5YUZeiPza
 kDFttdu2gco0Gw6VGJqJULJwSeG6hHfwDD1MmQXqqpsI7hscbhEbN1jXpxujfnW16wCS
 iTx3ibVR0NQncn7wjOIZDmetlXUbmeadh9RKilV3q0Lj8pwDL+CENnRz3v+/Mu7jvq70
 I3IBDcozuzKwutZsEs8JyCF0ls30fcZhilmvmtluEh7lZwjK63/cwg9bbnSyNX3nyqAC
 gjwA==
X-Gm-Message-State: AOAM5328x3arXdByewGHplOVkw5rT2fSrYVjYTkL/5YfqzAcKkxNJU98
 P4XzVxHaIcmDXO2uaA1nSaFe8xowg3L/rQ==
X-Google-Smtp-Source: ABdhPJwrJFPfJ6/V8iyAtjRsITpGLi2DFp9t9aXsYGMdmU3w3c9T9JV7kNu4ylnUlv0QA4sPPoCUrQ==
X-Received: by 2002:a63:af15:: with SMTP id w21mr1123470pge.205.1634158268069; 
 Wed, 13 Oct 2021 13:51:08 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t71sm383043pgc.29.2021.10.13.13.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 13:51:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/13] target/riscv: Create RISCVMXL enumeration
Date: Wed, 13 Oct 2021 13:50:53 -0700
Message-Id: <20211013205104.1031679-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013205104.1031679-1-richard.henderson@linaro.org>
References: <20211013205104.1031679-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alistair.francis@wdc.com, frederic.petrot@univ-grenoble-alpes.fr,
 qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the MXL_RV* defines to enumerators.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_bits.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 999187a9ee..e248c6bf6d 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -364,9 +364,11 @@
 #define MISA32_MXL          0xC0000000
 #define MISA64_MXL          0xC000000000000000ULL
 
-#define MXL_RV32            1
-#define MXL_RV64            2
-#define MXL_RV128           3
+typedef enum {
+    MXL_RV32  = 1,
+    MXL_RV64  = 2,
+    MXL_RV128 = 3,
+} RISCVMXL;
 
 /* sstatus CSR bits */
 #define SSTATUS_UIE         0x00000001
-- 
2.25.1


