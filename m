Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 299E150A47E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:40:50 +0200 (CEST)
Received: from localhost ([::1]:42402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhYvJ-0006cR-7h
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZW-0007YD-KE
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:18 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:43758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZU-0006J9-Fj
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:18 -0400
Received: by mail-pl1-x630.google.com with SMTP id d15so5156711pll.10
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+mtXVKAjUVRS64m73YmB+z7ejlvTN+BDSTEhooEYEys=;
 b=dB03xJOetW7gTapLPP0j6HdcdtCdxbbAt+h+wm4mqZ4Z4aNjr3CbCJt0zoc0bxzvPe
 +xr/aMue4nuyUISm/t0yYqdpDFfch5Nv9uv+uVB1yvkVdof1FFFzgXQ15/8Ba2A2xtYk
 WOR6RWjRspCgv+XOnkzUvis4QSlDXvVVBi2nzYymEW9K4QrkXcQ7WKlRV5FLlhMmt60Q
 /0TnrPIeHtOQDAPterPQ+lNd6CHvssAloT4B/IEIq1a5MT+FSmbcm4slJ4jRzVYPLP+W
 SVf1w+MGGhBBKyaJ52y9Vc6SZYCSKT2kVELzpK38rCib+ey6VMQsPwG2HEZBOtWbdZbR
 9rog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+mtXVKAjUVRS64m73YmB+z7ejlvTN+BDSTEhooEYEys=;
 b=IlhPap6Y81aMItbEDRdv0TgJt/k2QnYHx0BMk8gfnD+U0a0/7KbnHO65K5ySoPFwys
 D6CA/c5ld1wg5jjnZFikf/8hQwsohHYVrznmm3fT0tDcbBu2I8ROzHcxHbG6X/Qc5Ifc
 biMH2ZawIeVIvLa9IzJB7WtP1H2MneO2fEFignp3n+ZcyOxoyV5RMYgmxlz2NAa8Z7YP
 cQIy5tQIC6jegmfJGlcHlWxyMOlt8Z/0BF3COcQ/z156yyttcn4B4a3fcS4uXohzuPC/
 5lrMlWETFb6i/1VuCZcfluLjT2hqoTi72XFN8d4iaGDDBriYFT6prhTQ82Nx/khaafL3
 Lmtg==
X-Gm-Message-State: AOAM5319m7ieI0IjsT2fyql8D2KQ/rvn/meRN/pZu9FGriVnDD0lAbDA
 3SUhjQrQMvOevk+74fNQ92DMByRnQ9cHVA==
X-Google-Smtp-Source: ABdhPJxglMs2QfswzmUYWVWWENlP/jptEGY/jcANyrTCsTdjifWx834jqktQIbp+SHSsrdRIUCZNhg==
X-Received: by 2002:a17:902:ea4f:b0:158:5013:1403 with SMTP id
 r15-20020a170902ea4f00b0015850131403mr26076510plg.75.1650554295167; 
 Thu, 21 Apr 2022 08:18:15 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:18:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 24/64] target/nios2: Use hw/registerfields.h for CR_STATUS
 fields
Date: Thu, 21 Apr 2022 08:16:55 -0700
Message-Id: <20220421151735.31996-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add all fields; retain the helper macros for single bit fields.
So far there are no uses of the multi-bit status fields.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 872bc2a46f..44fc681c58 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -23,6 +23,7 @@
 
 #include "exec/cpu-defs.h"
 #include "hw/core/cpu.h"
+#include "hw/registerfields.h"
 #include "qom/object.h"
 
 typedef struct CPUArchState CPUNios2State;
@@ -79,15 +80,24 @@ struct Nios2CPUClass {
 
 /* Control register aliases */
 #define CR_STATUS        0
-#define   CR_STATUS_PIE  (1 << 0)
-#define   CR_STATUS_U    (1 << 1)
-#define   CR_STATUS_EH   (1 << 2)
-#define   CR_STATUS_IH   (1 << 3)
-#define   CR_STATUS_IL   (63 << 4)
-#define   CR_STATUS_CRS  (63 << 10)
-#define   CR_STATUS_PRS  (63 << 16)
-#define   CR_STATUS_NMI  (1 << 22)
-#define   CR_STATUS_RSIE (1 << 23)
+
+FIELD(CR_STATUS, PIE, 0, 1)
+FIELD(CR_STATUS, U, 1, 1)
+FIELD(CR_STATUS, EH, 2, 1)
+FIELD(CR_STATUS, IH, 3, 1)
+FIELD(CR_STATUS, IL, 4, 6)
+FIELD(CR_STATUS, CRS, 10, 6)
+FIELD(CR_STATUS, PRS, 16, 6)
+FIELD(CR_STATUS, NMI, 22, 1)
+FIELD(CR_STATUS, RSIE, 23, 1)
+
+#define CR_STATUS_PIE    R_CR_STATUS_PIE_MASK
+#define CR_STATUS_U      R_CR_STATUS_U_MASK
+#define CR_STATUS_EH     R_CR_STATUS_EH_MASK
+#define CR_STATUS_IH     R_CR_STATUS_IH_MASK
+#define CR_STATUS_NMI    R_CR_STATUS_NMI_MASK
+#define CR_STATUS_RSIE   R_CR_STATUS_RSIE_MASK
+
 #define CR_ESTATUS       1
 #define CR_BSTATUS       2
 #define CR_IENABLE       3
-- 
2.34.1


