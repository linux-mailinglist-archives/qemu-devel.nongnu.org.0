Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B5F2EB18C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:40:54 +0100 (CET)
Received: from localhost ([::1]:60272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqKD-0003Hx-74
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:40:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0i-0002WS-TS
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:46 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:54340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0g-0006db-Fr
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:43 -0500
Received: by mail-pj1-x102f.google.com with SMTP id f14so13056pju.4
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1C9DAauAp7ESr+w+Jngt35D1tFX2Zjw12yc74O3Eyt0=;
 b=I/V1vPVLQVR13pOrXFmUuyTiGilNIhZtksqtSRL7gNAHju7Jh9XllBuiZ7UlVUATrA
 D0pW9yukKSvm0O5s4pni4eFn9UE1eVBJGOFE98CVge+i4o+bVsXoMS4vGE06la7DXb8S
 EAJiuXMS1kY9sNAeGV1MyQ5RcHaAlM8YJcL3rNr7A20H9TmDQCeEu4uRpGoqKjE1Yk6N
 SVXlGcuNpyrTqdrKfKxGRFfzDh3iaPkBgXtXu4IYCbj41SrlrhqOfhs86nn2kX6yWE8k
 Jo+jXg/74CBTdXRwhLy+e1h0DcClFLciPmlujSPr6Ze8VVsFUCLsL0LeBjt0JbR69Ccv
 nEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1C9DAauAp7ESr+w+Jngt35D1tFX2Zjw12yc74O3Eyt0=;
 b=J7M3hTNSPtP4wg+8TV1gDvjxGbGuXpi9hElLy+Jf2x0J5jdSXIgq8Vht7iVrc19IIt
 AFl+REIYudJOcZ0SgMAJt0w+ZJ0NplP2CCg+O8NxiPnlBi16TEqXqp0dB4v5tcQOdQhm
 B0Wh1KiLY8oG2sEw+d0cRSz8hdo+PKR/NefkeHJpGysMBYnMWUcFJE2YruU9FNv5zjRi
 N3i18usBMpHXELQAt3fAcPpt+FlXswsoWzPriTgF8ZIs4YYASQSjf5Lk2BIJW5olE0nS
 RNyE3qUsDCO4w2E/FegodC7ABOkLZdVmGyCTA19uHDZEP4HyRXpMssuKSNRDecgH30UJ
 xGSw==
X-Gm-Message-State: AOAM533dv88vZEFoGoKyO93pMKrFRHn5pMVEDFdJTV/GokWCcnFJIpyq
 Y8p3Nt7EaZ6LWCwZW+xQ3hCWP4QVi2rK+Q==
X-Google-Smtp-Source: ABdhPJxmAxsb3BlWjwvE+QvDAYV/qsoyBJa4QnxyYC2Dry7sLvueyNtcRs9rJlAI9Jzgkz9FOIf1tg==
X-Received: by 2002:a17:902:6a82:b029:da:fc41:bafe with SMTP id
 n2-20020a1709026a82b02900dafc41bafemr649510plk.20.1609867240301; 
 Tue, 05 Jan 2021 09:20:40 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 26/43] tcg: Introduce tcg_tbrel_diff
Date: Tue,  5 Jan 2021 07:19:33 -1000
Message-Id: <20210105171950.415486-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Joelle van Dyne <j@getutm.app>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index e744a1ce02..e6fce9a049 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1146,6 +1146,19 @@ static inline ptrdiff_t tcg_pcrel_diff(TCGContext *s, const void *target)
     return tcg_ptr_byte_diff(target, tcg_splitwx_to_rx(s->code_ptr));
 }
 
+/**
+ * tcg_tbrel_diff
+ * @s: the tcg context
+ * @target: address of the target
+ *
+ * Produce a difference, from the beginning of the current TB code
+ * to the destination address.
+ */
+static inline ptrdiff_t tcg_tbrel_diff(TCGContext *s, const void *target)
+{
+    return tcg_ptr_byte_diff(target, tcg_splitwx_to_rx(s->code_buf));
+}
+
 /**
  * tcg_current_code_size
  * @s: the tcg context
-- 
2.25.1


