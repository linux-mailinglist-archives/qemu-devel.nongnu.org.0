Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6375F4D4647
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:49:59 +0100 (CET)
Received: from localhost ([::1]:46814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHIs-0002iq-Go
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:49:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxL-0005K0-T2
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:43 -0500
Received: from [2607:f8b0:4864:20::1034] (port=50878
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxK-0007x0-Cw
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:43 -0500
Received: by mail-pj1-x1034.google.com with SMTP id m22so5002437pja.0
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gt6Df7YFZj3yIOaHOAXNxeneFRB5t2HH9HYYGKeZPd8=;
 b=AQQXji4rnhgAAQr38u97QZIOMNlTdasBbQ7aHHiB8yScDZKedi6AtTrbId/+2BcOCO
 dN5wqSTiaIBg8UMqHOCHu5CKdm0JDCd1R4IC4v6mGaJdc77XQP2JLJ4yTBbRfHUwvNYt
 C/Fwc9cY9atZVRMlq7DgpRsJZmn78YUbSI/p5uQ6AG7InqVG3/6kZm78TjCYR7O/tF6Z
 87ZqLw9rwQ18H2vRNSJ8K52hrsTiuL+J/c6gnnsgX6frGiTodXbLZLMwzpAeBYxvNNNc
 p7HjteW6o52zyO1dJB2mxkktP2yen9yAfjtF4zI7kvQVU52agMo+441sWsj3nfeFyTvt
 UlFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gt6Df7YFZj3yIOaHOAXNxeneFRB5t2HH9HYYGKeZPd8=;
 b=pgug3/BGsuh63Wn6NI/HUF5axexjTQ6mz0IRwB84pSK0p1XDtvM6CA6fhP9Y/nMrxq
 HegeFRbgxu2BbP9gcE2oNkEscPJ/gLcXJzeqbfmLiFm8HZqKoOQtA+tEKd+x9/ox6PC7
 EOh8b05LBp+Gx6P9vwoQBCZCHI81Nl4Aztdv4gq85LJaLd3Jk3RZf5CkHTCGDabPlz52
 FVJfMhXBXOWrr7oBDE8nltuFrAFdyQDSW3zS/C0ete7sT4zRZ1aMhUKa3AnjdzXMGEQT
 vQha4ENLBLeTJKkVptaEqDmkK7E6P7GOQfMgYW1UWWPrsoVYKrSuwn3PweeeYOTs9koB
 5bwQ==
X-Gm-Message-State: AOAM532zdCBnLr2eYTxEwnNFZU8qkWGs+0hJlDlHhcNnEynQBAbGlswl
 l9p5IJhei/+dkPJoUlv9QYvKt4sQ1zXfZA==
X-Google-Smtp-Source: ABdhPJzzidDnMH1OjFqeqiqCPxZODCoyy4Jon5fx97HrswQl1vfNcs7tPH3PF0fBVuOn3hM3/yFXig==
X-Received: by 2002:a17:90b:4a07:b0:1bf:b159:185 with SMTP id
 kk7-20020a17090b4a0700b001bfb1590185mr4537730pjb.65.1646911661058; 
 Thu, 10 Mar 2022 03:27:41 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:27:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 13/48] target/nios2: Use hw/registerfields.h for CR_STATUS
 fields
Date: Thu, 10 Mar 2022 03:26:50 -0800
Message-Id: <20220310112725.570053-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
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

Add all fields; retain the helper macros for single bit fields.
So far there are no uses of the multi-bit status fields.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 1bcbc9ed63..ecf8cc929f 100644
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
2.25.1


