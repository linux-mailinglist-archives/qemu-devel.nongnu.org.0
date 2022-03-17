Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B7E4DBDFC
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:08:58 +0100 (CET)
Received: from localhost ([::1]:46988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUiNd-0003GH-L9
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:08:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKY-0000L6-Kr
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:46 -0400
Received: from [2607:f8b0:4864:20::102d] (port=40541
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKX-0002CP-3G
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:46 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 mp6-20020a17090b190600b001c6841b8a52so617533pjb.5
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tamfos1uvfrgy6OTL/hYTKA67kxVDj5ysduH3BCBsBo=;
 b=QAHbwSdIssQcShnOhNJFbQlfNKbiDhNLSrTWafGWgc896A1D3oH6/gh8I5niinulMq
 6l9/T3+NpZQuFt4cpFigaJ2p3Nmykcd+Ff8bUdyzZHLGXUc0zy0+4aIrNgEg3oF8im/Z
 rlX3fGB2vm0TKIt2VbfDGKQG10rpdO/0x9eHSioTI3Oz4sZQsH8u+an9qXfw0v+wegGC
 aATw9vCLhXz2fplXD07XapD80VfTofajNYOE98PfRYF07j0D6Q2ox3tjFzW0pUUHs7Q/
 2/oepVYSD0SY/fG1vR4qfCxmJ2Elh/MIxdUfiAWA3GWCgLHzfgT6vcxhypP/gX6FUywr
 SSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tamfos1uvfrgy6OTL/hYTKA67kxVDj5ysduH3BCBsBo=;
 b=7JWAoW1c73b7nyJ9gXFTprDkiDbEByr4+qCWzuKmQhsdXazvUHhpAXNc+GaoALwSvq
 /t5BNAT3N4z2OuJ38FVKwzNUPd/UGmF+iHPxLDYg/Ca2WWG8/LGqzAneqxiJmchTL8PC
 P2Ai7axSkzeoUro6hmxXVIzNU3H7cs3CeHe1N139t4vxP8YLSRHT+tzbNVwp6q9IYuBv
 DxC1BzmrVSHTiqSTvTLYKjgTRW8NYVOYMTdMUum6YaNWKMsCbONG4HfuzTmBn1uZvgqv
 AxeExyCm8sQhbT6kGeLAiJWkq+MCcH7wnGxIBpVFijFQWa1IsWF+ZV4sQaNZ0ziYhdGr
 /ZXg==
X-Gm-Message-State: AOAM533MYiPRymICtOiw8lY+nIjti/7scEIHWv1I2mno30Od566uXHZ9
 9A2r3jKSj1ZWCmZrlU5Lfpha2SOibpVGYg==
X-Google-Smtp-Source: ABdhPJyZo5QknB53NiTQ1dbCtg0qDrWlwHJPv3UV70s5liQGxOJRAEkGQ1LhQeUDC9GvNpYNuHlnwQ==
X-Received: by 2002:a17:903:2341:b0:151:d33b:90f4 with SMTP id
 c1-20020a170903234100b00151d33b90f4mr2862921plh.22.1647493543804; 
 Wed, 16 Mar 2022 22:05:43 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:05:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 04/51] target/nios2: Add NUM_GP_REGS and NUM_CP_REGS
Date: Wed, 16 Mar 2022 22:04:51 -0700
Message-Id: <20220317050538.924111-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: marex@denx.de, Peter Maydell <peter.maydell@linaro.org>,
 amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Amir Gonnen <amir.gonnen@neuroblade.ai>

Split NUM_CORE_REGS into components that can be used elsewhere.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
Message-Id: <20220303153906.2024748-3-amir.gonnen@neuroblade.ai>
[rth: Split out of a larger patch for shadow register sets.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index ca0f3420cd..adeb16377d 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -56,9 +56,11 @@ struct Nios2CPUClass {
 #define EXCEPTION_ADDRESS     0x00000004
 #define FAST_TLB_MISS_ADDRESS 0x00000008
 
+#define NUM_GP_REGS 32
+#define NUM_CR_REGS 32
 
 /* GP regs + CR regs + PC */
-#define NUM_CORE_REGS (32 + 32 + 1)
+#define NUM_CORE_REGS (NUM_GP_REGS + NUM_CR_REGS + 1)
 
 /* General purpose register aliases */
 #define R_ZERO   0
@@ -79,7 +81,7 @@ struct Nios2CPUClass {
 #define R_RA     31
 
 /* Control register aliases */
-#define CR_BASE  32
+#define CR_BASE  NUM_GP_REGS
 #define CR_STATUS    (CR_BASE + 0)
 #define   CR_STATUS_PIE  (1 << 0)
 #define   CR_STATUS_U    (1 << 1)
-- 
2.25.1


