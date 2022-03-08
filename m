Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4993D4D1103
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:31:53 +0100 (CET)
Received: from localhost ([::1]:44250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUK0-0002SV-Bd
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:31:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU8o-00052h-OM
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:19 -0500
Received: from [2607:f8b0:4864:20::1034] (port=42780
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU8l-000643-ET
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:17 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 c16-20020a17090aa61000b001befad2bfaaso1595251pjq.1
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v5cuX7PyuKwfVmE1y8ht1UYEI7b12iFAXqSTc+0g5D4=;
 b=dUt8K19HuC+AL76lYrxCeHURZ0rNEq6y3I4dsLY5uBKBDKYpywH0DoTwQsftPR/y69
 3WtLKlfPssPDcpnDvTMxJZrInTWc3HBT9aHnTLXbYy9hRTo008KdknDz2Zbyzdj0+sqY
 xwjjwf16kdV3QRXfm4F1MMWqexWPWDAqpSwjvYzvfuQcBtogD0C8TYO0qxTduoiX+v93
 OrDVlIA4cHCrsSgT45rlatkxVToyyZEcl9EFKmahHWGG1z9mG1OWBCR4+aBDfk31RPN1
 +gMl0Lm0O06k7ILejPsue8S6ioQOz/N/a3BgIr8e1GpCD6FqwB1PDtNe7sNwdwfLC/gl
 cvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v5cuX7PyuKwfVmE1y8ht1UYEI7b12iFAXqSTc+0g5D4=;
 b=QjjPNbtYqIkxAURWdGKsN1M9LlShpM9xyZrPxmkhYU1peh/BfeHTUvY/pbqZhhFKN2
 TAY5Y7boeFUStYDitXFvw5ABj7mk8kxHIhPMtfD311wqnabQu7gndCzU1qm/r42VTNcg
 90P/RvH0hxwEAB3YOsFKJNJY2GsAJw28Wm25C/TNYPwS6SRQ+MHWsoim7gLSjKrIFyin
 mqtMo4uqZ764FLyilebkRZn79XGx+p2ksdByxtygn9d0S5WGN4ynzc+r7nHnukO4R6NW
 HcGQiX11rd4D9GQbzATS4pa7YYD8mVSJBu7R9GLMXPXwAVY4uSOT83h30XVlCOXETS/2
 7FHg==
X-Gm-Message-State: AOAM533iGQbS27RQeJ39JS6JuJJoZiXtSuOofYVJjhMxaT0QPOfEw6rq
 P7fiUY0n84X0HQxbrCYJOkbHT5KRRlidag==
X-Google-Smtp-Source: ABdhPJwm4rV4qie4xgiL8eUsen87hOQDpyTv20DpmknCbf+6dVLUQIn1cENHMNGupm6JIpgbxVoq3A==
X-Received: by 2002:a17:90a:2d6:b0:1b8:cd70:697d with SMTP id
 d22-20020a17090a02d600b001b8cd70697dmr3293806pjd.78.1646724014245; 
 Mon, 07 Mar 2022 23:20:14 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/33] target/nios2: Add NUM_GP_REGS and NUM_CP_REGS
Date: Mon,  7 Mar 2022 21:19:35 -1000
Message-Id: <20220308072005.307955-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Amir Gonnen <amir.gonnen@neuroblade.ai>

Split NUM_CORE_REGS into components that can be used elsewhere.

Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
Message-Id: <20220303153906.2024748-3-amir.gonnen@neuroblade.ai>
[rth: Split out of a larger patch for shadow register sets.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index a00e4229ce..655a440033 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -57,9 +57,11 @@ struct Nios2CPUClass {
 #define EXCEPTION_ADDRESS     0x00000004
 #define FAST_TLB_MISS_ADDRESS 0x00000008
 
+#define NUM_GP_REGS 32
+#define NUM_CR_REGS 32
 
 /* GP regs + CR regs + PC */
-#define NUM_CORE_REGS (32 + 32 + 1)
+#define NUM_CORE_REGS (NUM_GP_REGS + NUM_CR_REGS + 1)
 
 /* General purpose register aliases */
 #define R_ZERO   0
@@ -80,7 +82,7 @@ struct Nios2CPUClass {
 #define R_RA     31
 
 /* Control register aliases */
-#define CR_BASE  32
+#define CR_BASE  NUM_GP_REGS
 #define CR_STATUS    (CR_BASE + 0)
 #define   CR_STATUS_PIE  (1 << 0)
 #define   CR_STATUS_U    (1 << 1)
-- 
2.25.1


