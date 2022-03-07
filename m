Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 902D84D04D3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 18:02:08 +0100 (CET)
Received: from localhost ([::1]:45372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGkI-0003Og-I1
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 12:02:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGW7-0001v4-Bs
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:27 -0500
Received: from [2a00:1450:4864:20::335] (port=56172
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGW5-0007lw-Tx
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:26 -0500
Received: by mail-wm1-x335.google.com with SMTP id i66so9555178wma.5
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 08:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=MRh+1RqLLcfZLhVPGuXevsBv8v4iq4OG65QKu3dfbzw=;
 b=lA6lducashhhMtl8Li24OA+QT+sv8GjzsqDictcjJuoT4yf09sii/biSZtOMr2nIvE
 AqRHQAdEbZx3330YwXUpoA8d4eOEFTVLjoXT88izbo1cvm8hUsWxbb0AW6Au86O6RZyA
 rxfXgtstZMJD5X5f0wDHkqhhHXMIeghRXGXohlbVG7Eyi72ncvxRiGTOdkr+XPyGKRNN
 r+/lCQNvexIIpcr+ahedyxYukMlRUlmPz19OLYWFfqWqH+78vspfoKD2yLkHx8yNGyj4
 +fILhI3NQeXYNUcKDiXQabc9mldvcPf6u+VTL5bCODg4KUXt3CnN7A4y/eeUHEvUw2wg
 AnEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MRh+1RqLLcfZLhVPGuXevsBv8v4iq4OG65QKu3dfbzw=;
 b=TUrCMW9dAUwbDvZ59vuN1niQRIWAe7YXojVmxDq3aMfqSxRNAyK/iAXlPwcs+rf3gW
 C6zGqJ+uwBVJvJDRLBw79Win74Uhe4JOVgXaNaH/uCRn8uXmjlOhQOwYn3i8/d38kvMq
 hfnlsHqANI/FSWP2/JhbwZFwfrpoJfs3nu3QFQTU81weFcxOxpSAuKrxfGWYzEvX/yfH
 XyG3ORazB71rlxTtpwu3p4AFpDYIZPv/VX5Wc/6jDcsfw1MWcDE+C9mMETl3jRvMWz/N
 P3kGRcYROlkQk1GCHZqDc/3syPmGMMeS33Run0BrmRfOzr5W9G2YgYAjIhqxwoZbM0NI
 7wRQ==
X-Gm-Message-State: AOAM532VLTmmdeFkuTfmj3bcRxMt1j3Y4vtx28doq5u/YE2ZmFjONZF+
 aqJHje7ZcOHYs4Pw9BBqbhldOqi+AUtNpQ==
X-Google-Smtp-Source: ABdhPJwcDAStyz91+FCCEtr63klDX1df/Q9Bo3I/pqeWTNKKxNtx02d9x5ah8IbEbB0v/oPynPr7mw==
X-Received: by 2002:a05:600c:19d4:b0:389:771e:3c4f with SMTP id
 u20-20020a05600c19d400b00389771e3c4fmr9799281wmq.23.1646671644689; 
 Mon, 07 Mar 2022 08:47:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v188-20020a1cacc5000000b00384b71a50d5sm13806652wme.24.2022.03.07.08.47.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 08:47:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/18] hw/intc/arm_gicv3_cpuif: Fix register names in ICV_HPPIR
 read trace event
Date: Mon,  7 Mar 2022 16:47:06 +0000
Message-Id: <20220307164709.2503250-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307164709.2503250-1-peter.maydell@linaro.org>
References: <20220307164709.2503250-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The trace_gicv3_icv_hppir_read trace event takes an integer value
which it uses to form the register name, which should be either
ICV_HPPIR0 or ICV_HPPIR1.  We were passing in the 'grp' variable for
this, but that is either GICV3_G0 or GICV3_G1NS, which happen to be 0
and 2, which meant that tracing for the ICV_HPPIR1 register was
incorrectly printed as ICV_HPPIR2.

Use the same approach we do for all the other similar trace events,
and pass in 'ri->crm == 8 ?  0 : 1', deriving the index value
directly from the ARMCPRegInfo struct.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220303202341.2232284-6-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_cpuif.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index d7e03d0cab8..1a3d440a54b 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -612,7 +612,8 @@ static uint64_t icv_hppir_read(CPUARMState *env, const ARMCPRegInfo *ri)
         }
     }
 
-    trace_gicv3_icv_hppir_read(grp, gicv3_redist_affid(cs), value);
+    trace_gicv3_icv_hppir_read(ri->crm == 8 ? 0 : 1,
+                               gicv3_redist_affid(cs), value);
     return value;
 }
 
-- 
2.25.1


