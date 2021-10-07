Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EF24259DD
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:49:53 +0200 (CEST)
Received: from localhost ([::1]:55014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYXWi-0006n7-E3
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYXUO-0003xo-SR
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:47:28 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:36476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYXUM-0006pe-JY
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:47:28 -0400
Received: by mail-pg1-x533.google.com with SMTP id 75so521184pga.3
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 10:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZJ63cbY+lnqN4JixeYMitc/OluC43ZJ3MKKbgpDVcuI=;
 b=OeZ3gZOFKMJbuI7ucd6XK1PngGO0j9qKq5axNPtkCWA4SfN3qYPIw30wOxXlFBp7/Q
 MTHGZdO13It8yH0rwY8vh2E2taidupwSI/Aa72X5Gg8aEvJnPlhKCQ23Hp6OtOiTP2r+
 ktBMqQHSGWVPQsDmbJSnQ3AB0062llSaTMz/6hrmCVoaN0MUTflvYwYgWPO9ePzfF4uy
 xmkjKmYzfRYUhCKnLbG1gh/ui53p7XMZuES27xyUZqwcPNtflYY24N2VAaaCAgyk9NCo
 BbXguzHW+Y87rbGIBi0HbpyPLfyV2LkJg4zuS+vo5GCm2TOi5mz+O831NNhtE/lu2ZGt
 ES/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZJ63cbY+lnqN4JixeYMitc/OluC43ZJ3MKKbgpDVcuI=;
 b=osf/jkIxcJmdudEidNQ6+UbSJ8XJ81+2v5NjjwXx99BGu4wSk/bnRn8gKUwMF5KcYi
 +yS2Hop6aOZjj6Gm3RR/2qmbhjYgGrbJ9NHNgyzCWQyR1BezU0eQuMQc1VZw6xYJKr8E
 zvyYIlxbRuXQ+rkBOydQvTtKKceQNf9qHfIfi9mAlAxs03A6Imv3zFdXu9Yns8T2ZLp+
 yFsIfLTvaYSxhI3hHUdAI65FNj2SJNWZRvya8OyXiQskDI/6HM9OLTxfAaGiFj6uY2NN
 1RY9rV76sFlkE3N+IQgeWQ8MOpgp9NpIq8G/XYhxP1nbJbrcHqBaUSi6gqnEPCYpCO2h
 nHiw==
X-Gm-Message-State: AOAM532eSppb5LwUqKjn7fDl9kHcjhzn7Q2KtM0Df2V36yrXFosSgLW9
 S/cTtyy3liAgsr8KsnSRo83nTMyjj4y8Aw==
X-Google-Smtp-Source: ABdhPJw8vasVK7Zj7/6/zoU0SuTc9iX/PklysLtPezH3p2jRoaCgHwJhFujzS+6W/dZr6KJ8Uy6/QQ==
X-Received: by 2002:a63:191a:: with SMTP id z26mr736280pgl.373.1633628845301; 
 Thu, 07 Oct 2021 10:47:25 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 197sm83318pfv.6.2021.10.07.10.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 10:47:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/13] target/riscv: Create RISCVMXL enumeration
Date: Thu,  7 Oct 2021 10:47:11 -0700
Message-Id: <20211007174722.929993-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007174722.929993-1-richard.henderson@linaro.org>
References: <20211007174722.929993-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: alistair.francis@wdc.com, frederic.petrot@univ-grenoble-alpes.fr,
 qemu-riscv@nongnu.org, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the MXL_RV* defines to enumerators.

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


