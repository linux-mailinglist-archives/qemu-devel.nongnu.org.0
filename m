Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E14B432AF4
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 02:04:26 +0200 (CEST)
Received: from localhost ([::1]:50228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcccD-0007c9-IQ
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 20:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZB-0004ct-J5
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 20:01:17 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:38830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZ6-0001d3-FG
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 20:01:16 -0400
Received: by mail-pl1-x632.google.com with SMTP id i5so6175565pla.5
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 17:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JW/tzOqQKK5hRD4CRoj0kca6rOybKGXTUDDhLFOWwb8=;
 b=rwAI9/EIpVqwgULEbFSMPpiM1lrpuntD/n+xTqIW6499dGzikZ2uzEdWrwbtdSk/uR
 NQW6psEvyT46J/G0pHyxxNf9lomJqZpwh/xlemFC7awfWV9WI9w+/BTgCedWVkB+tmY/
 uRmhRIdAHEdSenzCqi2LJ/9ZyGHtcBIUsOzQgTJpIfR7taKBsUydzIqa6K0sao1uLkVb
 JIEYePKgxmz5BuQ0O72pC5UOnEHI7Jgg1Vd9FV6YcYRzzAjgdxs7fQeaKLdrpzIfaahF
 2NMbS5UR8KkxKyXSPoZYhc28sY9f+q907JiZF+mXnRJBWCN5q5HSx69RgstOaiKmwbfJ
 x4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JW/tzOqQKK5hRD4CRoj0kca6rOybKGXTUDDhLFOWwb8=;
 b=6vMdpJQ/LXBEPQAQWedbSdP6e+abb5iZEP/OY+/hwTsGOnkE2rZykRS0POZMcNQEKI
 l/hNhR9qhe8YxsDTf+qvTXukU/uiO+Bzt23OE0DqpKHXzdJfSlQps3F43wEC+rIXLsPN
 gD+dcjlca+A2st4DJDH62lfnixWF2n1glwvWqQPnXVz+WuTOsH73H1Pshrr9Iitoxt8q
 TBsRPXcqh2fkQNkNoreGKfyIyWAATE6yw2d1b/qRhquE0XwXtHb42q6IrG4TwtkueKPe
 OvlrYAZn8PMaRuDd3rRX96DC057LKCvIXZiZWoIXvpagOhgu0LGeOGPf0rwTJo3ocgh6
 XKAg==
X-Gm-Message-State: AOAM531HD61NqbozwnNn6fBWgiYq5EFphHFxmf34EghlX2z5Y8RUHEvP
 dvmDgUL5IB2FZ6yfCnlXzwOnWbLRV/Vq0Q==
X-Google-Smtp-Source: ABdhPJwZe0RzSfxdrTjSRCFjkEzz7wYMqP8kROUagvRMTRG24RC4y0XU4+ozI5ObX0yjt/JUkP/bRQ==
X-Received: by 2002:a17:90b:1e01:: with SMTP id
 pg1mr2363214pjb.81.1634601670806; 
 Mon, 18 Oct 2021 17:01:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q14sm3068220pfk.3.2021.10.18.17.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 17:01:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/16] target/riscv: Create RISCVMXL enumeration
Date: Mon, 18 Oct 2021 17:00:54 -0700
Message-Id: <20211019000108.3678724-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019000108.3678724-1-richard.henderson@linaro.org>
References: <20211019000108.3678724-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com
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


