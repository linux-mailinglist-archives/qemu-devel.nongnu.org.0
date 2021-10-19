Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A8C433C24
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:28:44 +0200 (CEST)
Received: from localhost ([::1]:38400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcryl-0001z3-Jv
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqyt-0004pW-Rg
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:24:48 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:36804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqyo-0007Tb-81
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:24:47 -0400
Received: by mail-pg1-x535.google.com with SMTP id 75so19699725pga.3
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 08:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JW/tzOqQKK5hRD4CRoj0kca6rOybKGXTUDDhLFOWwb8=;
 b=oSHSzyl+0YEoYo3DImNOanUBwswlpvbVBX5nM0So6eJa3nUXscwS7h9Do9CqBSWePu
 uxsEDre1AN/LmZ6VhlkNQL4jHKefAF/NCW9kMoHGUEaTDi+X7Q1YPrjeDL6Qy/Zccd8h
 uNiw5Krptdcizh81zaRoDmaoSP207839+yFDHZtS+JivqdxBPryXuV+wqL9mmfbR7Nxs
 4gGMb26bT8WvuMPxkMxFeWc4LtTm1Sr2Gyr78qiFnNhiEbC5Ov/eH8WiKVyV69b1Yvxz
 Q6PbMK61dBwTs5jwnsVq6zWHfpIO/cR2MhctNPO7bCHHteePhEM9HUPEVG7jdP4Opayx
 pbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JW/tzOqQKK5hRD4CRoj0kca6rOybKGXTUDDhLFOWwb8=;
 b=vMihlgUHYkIbwrzMRuT4fbwRUzNdAHDchvkhIA3HgEyn+gtCt9Eiul1TDSCyJkA42u
 AOQEk+phVuDsx3OdJKJqAulZs+OjHn6jOPJfr6w43PDUy5c3+znklB3+wrYcxzBfClUT
 MijlqDU0OnA6F7cX5BtMp3ZsDh14haVkEQ1cif6oasHX0nQjonycq9LFFy3ziQedKOA3
 +CkYYENnAEjWFqCxA/rYIsSMmhiBm873C63GVNNlQaUrwbzqHYRHdbdefuD+thVbFWik
 Xe/5/elhzl/3PLWI3w8mHjyUTYIfTpt1/u6BTdVYDrb3D4gbYrw86pAaMxyFxoRUYYjZ
 9p8w==
X-Gm-Message-State: AOAM533V2zJ8Veg2Xur0IE0GtBG8VOkWnNBkKw8GJbkgZf93TMsLKHiC
 7i5zjusb4ESq5yMxWWkNDkug+xoXEVNoHw==
X-Google-Smtp-Source: ABdhPJxGBwTDfp4HIDiHMqu4Mh2tdouSDgVUAt574v2HlbVaeAMPvy8sWQoWtKlpRo8UskTn8aYfZA==
X-Received: by 2002:a63:b91c:: with SMTP id z28mr17756291pge.393.1634657080938; 
 Tue, 19 Oct 2021 08:24:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id i2sm3293814pjt.19.2021.10.19.08.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 08:24:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/16] target/riscv: Create RISCVMXL enumeration
Date: Tue, 19 Oct 2021 08:24:24 -0700
Message-Id: <20211019152438.269077-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019152438.269077-1-richard.henderson@linaro.org>
References: <20211019152438.269077-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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


