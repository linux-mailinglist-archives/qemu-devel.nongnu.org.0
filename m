Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0215F4343E5
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 05:28:49 +0200 (CEST)
Received: from localhost ([::1]:51870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md2HY-0000an-3c
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 23:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md26Q-0006iR-NM
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 23:17:18 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:46798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md26L-0000xa-P6
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 23:17:18 -0400
Received: by mail-pf1-x42d.google.com with SMTP id i76so1688596pfe.13
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 20:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JW/tzOqQKK5hRD4CRoj0kca6rOybKGXTUDDhLFOWwb8=;
 b=ShQkPjwvwiDWZUQrmbbzGxAvrkQlnTdDlHMrDqdBiIjVsHOn07nL+Mib/kpEgCNB0d
 m0dftLl7BrEI8JiwqfMtXUXh+cqnamDJBzE1ZkW7pBBiuf9L6UBMv4YgpZDA42rGmr6N
 ZsTwSbeOm5+aJNZxarSImrcj/q1sm2bKrvktAH4HrVx/6k6MidNwI2IpMlLHfNozf+WV
 wrskI5Yyo8XGt/+Qq3yrqlViUsxbObSgM/L1kBNo2AQ3L/kxLFkE7eERvd6E9WR7q0k1
 D9GxtIILx+Knty54mHMgrW6nPe9+cK63p1C14eMXvPEkvON/FfwSj0f8SlXG83YtuN89
 PpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JW/tzOqQKK5hRD4CRoj0kca6rOybKGXTUDDhLFOWwb8=;
 b=X9hzx3xDUbI55Eu4Cbi45kefSdYVxbfHsgqgEAvbABpusWUIw1ZFtkMmLW/TY4HReg
 b3jPHN+w48yuJBVtE8uyrHxIhBVjlJEyDv9NjZi9DotZm+0BS9JMTtf8ZVL9Ca7Ic2Fg
 uXj+PyOgDsYKjv6/rWev4w/ZgbJzZMz7Tul813e8J46ChYxPWj0NlZeHk6tSVVDBlprB
 X0zHQ/ggsUS8gNXb0MavsBJVAwVePvg77C2JpNyDYntP++Ixzn0RsM4/QBGh0gqMyG33
 j7jN3LLrWAvDFCQjf5Z0Y/qG5V+mRCxgqrb6RF2X/4KKHK4xiZ15YKTOBh/F8FM3NCnY
 HaXQ==
X-Gm-Message-State: AOAM531j3h9zdE1mR8/ECBUFf/i2cgBE4/k22OJD0FGEK5OsAeg0hJd9
 bHYOvtsrTdiq9WQnDfDwIJvjMCAmgkJOYw==
X-Google-Smtp-Source: ABdhPJxQhWOKVbOnuvY5DM74J82I57zhn6j20V0k3ZSfMna4kbkgLl6B10cyIuZvrd7eEMxoxDDNpQ==
X-Received: by 2002:a05:6a00:1148:b0:44d:2798:b08a with SMTP id
 b8-20020a056a00114800b0044d2798b08amr3874577pfm.2.1634699832426; 
 Tue, 19 Oct 2021 20:17:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c8sm505364pjr.38.2021.10.19.20.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 20:17:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 02/15] target/riscv: Create RISCVMXL enumeration
Date: Tue, 19 Oct 2021 20:16:56 -0700
Message-Id: <20211020031709.359469-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020031709.359469-1-richard.henderson@linaro.org>
References: <20211020031709.359469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


