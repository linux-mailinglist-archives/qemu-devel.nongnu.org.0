Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 435064D1111
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:34:50 +0100 (CET)
Received: from localhost ([::1]:52890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUMr-0008Jb-Ac
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:34:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU8z-0005BE-GH
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:31 -0500
Received: from [2607:f8b0:4864:20::635] (port=34445
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU8y-0006JW-2c
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:29 -0500
Received: by mail-pl1-x635.google.com with SMTP id s18so3041416plp.1
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JPTHTSr1fVu62i4usn5tZsGs9hYEq9+hrYhQRAip59M=;
 b=ZQjkmvvcElCrcLyEr7hn5CcI2AKV5/0TyNDtBKzevA29sDKIR+thgKIlL7oTRAwoS4
 6Lj3tROQhq/O5CVyI6MfXh98eD7N65jftHCcRkyZ/+c/gl6OOWGNNh2TKD7ueyETB1wQ
 Yf16bW7VxVI91gBdGYZOVVPvQjwEnBUuNZAFgFAoTxJS/nvRETS0875uJxzXl1qWnuxH
 LTnB5qDeZiTADGfI0ITnGBKmGqIogXTcqB7g25S7jkThvAJvjMFvQhV+bXi9zATJhNku
 dwWwFbn1lU1hq55DR4KTVEGlg61Xm9zItH8b2655IIBpu+r9XMaBYl2LtKeiUa/trGWd
 npUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JPTHTSr1fVu62i4usn5tZsGs9hYEq9+hrYhQRAip59M=;
 b=bvR4+JI8hVx4fztKOaFmWV1vd0wRI8tFBism58dJupUq2RV9YOtpVZZcfOo1c3rDFS
 NdEflPPTkM6JYgl3DdNLsHNaHNj7pWEVhL6hwfFojBnaVVhN81W317aOUq9ZGWelcgDh
 nAVrpriM8XV6dila1m1GaDViC9eSQrS4I6L9pQMyTN4NaFISZ2QLK2DaJtHgWfhIO54i
 Ii3FPEl8z8L1Ke0JVzzcjSkHFRD6MSMaUPBigtgBcbfHCfftRdaTwplqBTdw0wdhHIY+
 bSGYWLS0rg0n8Q42wt3oi9/tXHM9pW7bJdhMwNzaD8hds2+y24PwSKwUJPPbii0F9Mvy
 FzFg==
X-Gm-Message-State: AOAM531n8dwZVKnv/FCrzYWX4ZhJjASNnXUo5IFlvdCSapEZmDuf95Tw
 wz/dNulESyNM5rrd0cFz1IJf2zFduoKEtA==
X-Google-Smtp-Source: ABdhPJyNX1HGYX7oT4K1uPMbmxosmKelhMX6DZJlX8mu89+Vf0Yxi5ul/hoVCEg3SNw6G+iOtrOTLg==
X-Received: by 2002:a17:902:7888:b0:148:adf2:9725 with SMTP id
 q8-20020a170902788800b00148adf29725mr16437305pll.136.1646724026808; 
 Mon, 07 Mar 2022 23:20:26 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/33] target/nios2: Use hw/registerfields.h for CR_STATUS
 fields
Date: Mon,  7 Mar 2022 21:19:43 -1000
Message-Id: <20220308072005.307955-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

Add all fields; retain the helper macros for single bit fields.
So far there are no uses of the multi-bit status fields.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 5bc0e353b4..26618baa70 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -23,6 +23,7 @@
 
 #include "exec/cpu-defs.h"
 #include "hw/core/cpu.h"
+#include "hw/registerfields.h"
 #include "qom/object.h"
 
 typedef struct CPUNios2State CPUNios2State;
@@ -80,15 +81,23 @@ struct Nios2CPUClass {
 
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
+
+#define CR_STATUS_PIE  (1u << R_CR_STATUS_PIE_SHIFT)
+#define CR_STATUS_U    (1u << R_CR_STATUS_U_SHIFT)
+#define CR_STATUS_EH   (1u << R_CR_STATUS_EH_SHIFT)
+#define CR_STATUS_IH   (1u << R_CR_STATUS_IH_SHIFT)
+#define CR_STATUS_NMI  (1u << R_CR_STATUS_NMI_SHIFT)
+#define CR_STATUS_RSIE (1u << R_CR_STATUS_RSIE_SHIFT)
+
 #define CR_ESTATUS       1
 #define CR_BSTATUS       2
 #define CR_IENABLE       3
-- 
2.25.1


