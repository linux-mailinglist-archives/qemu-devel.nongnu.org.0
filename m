Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B14D4D1142
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:46:46 +0100 (CET)
Received: from localhost ([::1]:50588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUYP-0000hJ-Cs
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:46:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9H-0005GN-P2
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:52 -0500
Received: from [2607:f8b0:4864:20::42f] (port=37388
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9D-0006Ow-CA
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:47 -0500
Received: by mail-pf1-x42f.google.com with SMTP id t5so16608144pfg.4
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f4LFEjNzvKTomQ6aq5bDTV/uxlszeP0HWEDXmP1bzdw=;
 b=MtNGz9FGPuZ+E8BKRX2FVYeSTszP/wr/pc1yATnrs8I5/khY4Dl+BFTSk27IERPHyg
 qIyudnyQmr7gIfnJTD/V/VWq8mlLmn2tA+PA18bLuhrSrrxybBfXuxJSbkWeclB/8gZ4
 Y8b0PdchpQjTEVHyUSGHE7FluWoe8Id6yMCPj0WdLEBTWhef9ZV1xAkBoRhNTpHXQ8kt
 em1f55zsIv8jwsRJNKOXwI05NVHYi6JW19NvFeclFavf8OfYAzpT+q4p0ZwXxQ3OEDRm
 iPRJBmBJJKulMJJMiSquW2fp8UryImVNpTvEjpIireF/ImRMo1Ub7bRXIE/qOX7m5diO
 c/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f4LFEjNzvKTomQ6aq5bDTV/uxlszeP0HWEDXmP1bzdw=;
 b=4cNnFa1Ugpw+SLLZ8UM3UWPyrdGmjQAcQ3Wgheh7w34R/nBu50h+ThYU8vb98YkIjY
 HA2HrL3LUBNWzMp6TG47aeCpcocmxhCiwqNg2klBL9DUCC1GwFLIcZaj4l3af5dC0eL7
 oEQGlGsJs8kwpzbm0WP3C/Oy+kaIq/s6i3YSskmmsfi5/mCoALRq4X4Gv+lFnZoUgaIJ
 nJ5ezQiswRMJ7mwrSAG3Agc8r3GWkaQpvL7XIVASAji6EOm7u9G9RtN3Qzo+PoXVJCks
 Ax/bW3vrfG3m7s+WaTBdG1EhGn89HSIjSo6gvNThEMPuJgaHKJbqqS9WOhzV8zwJ9kO0
 ke3A==
X-Gm-Message-State: AOAM532+1pfZioIUB4wFarBKG/rBGwu4FA2kzx+P+gCRPrcEJ8lDSr5B
 yz2moRv/D8Dq9yd3dvcydSXJQgoRZONmMg==
X-Google-Smtp-Source: ABdhPJwGbj2dgIWrzODorg4Nn5obiwVAiTWSXU5q24cNNpSWNT7bJfgq8jfda/Vv23sKY635DXMSaQ==
X-Received: by 2002:a05:6a00:228d:b0:4f6:d4a8:7f47 with SMTP id
 f13-20020a056a00228d00b004f6d4a87f47mr15922833pfe.66.1646724039336; 
 Mon, 07 Mar 2022 23:20:39 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 19/33] target/nios2: Implement CR_STATUS.RSIE
Date: Mon,  7 Mar 2022 21:19:51 -1000
Message-Id: <20220308072005.307955-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

Without EIC, this bit is RES1.  So set the bit at reset,
and add it to the readonly fields of CR_STATUS.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 1 +
 target/nios2/cpu.c | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 7faec97d77..b418deec4c 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -108,6 +108,7 @@ FIELD(CR_STATUS, IL, 4, 6)
 FIELD(CR_STATUS, CRS, 10, 6)
 FIELD(CR_STATUS, PRS, 16, 6)
 FIELD(CR_STATUS, NMI, 22, 1)
+FIELD(CR_STATUS, RSIE, 23, 1)
 
 #define CR_STATUS_PIE  (1u << R_CR_STATUS_PIE_SHIFT)
 #define CR_STATUS_U    (1u << R_CR_STATUS_U_SHIFT)
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index fbcb4da737..ed7b9f9459 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -59,9 +59,9 @@ static void nios2_cpu_reset(DeviceState *dev)
 
 #if defined(CONFIG_USER_ONLY)
     /* Start in user mode with interrupts enabled. */
-    env->status = CR_STATUS_U | CR_STATUS_PIE;
+    env->status = CR_STATUS_RSIE | CR_STATUS_U | CR_STATUS_PIE;
 #else
-    env->status = 0;
+    env->status = CR_STATUS_RSIE;
 #endif
 }
 
@@ -109,6 +109,7 @@ static void nios2_cpu_initfn(Object *obj)
     WR_REG(CR_BADADDR);
 
     /* TODO: These control registers are not present with the EIC. */
+    RO_FIELD(CR_STATUS, RSIE);
     WR_REG(CR_IENABLE);
     RO_REG(CR_IPENDING);
 
-- 
2.25.1


