Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B225107C5
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:58:31 +0200 (CEST)
Received: from localhost ([::1]:48816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQOM-0006aK-TL
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmg-0002g0-VU
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:36 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:33322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPme-0004Qp-Gt
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:34 -0400
Received: by mail-pg1-x534.google.com with SMTP id k14so16764562pga.0
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E+4Qd4E9HIFHi1BwjZ85dNcwW/a/s3TNOGQFzvuAjJM=;
 b=cHCv1jlG4qfzF3vmLuJ8TByVOIV7ODPAmMR8z5XYh+bl2/IE5afeMSouPbkViS8aB1
 DEq+bVgeUgBK4Jl956d+XMYM9bNALujRf3CsyOPQxjf4biQObMghoj3pxHMSc1449T7I
 6FTCUIxnIUSIUChMPJYWGJaGoKdiFBnk2IJ7ZV9IIeND59CAy+g1mFgf5AfPviLKeI7L
 PNI1bqB5pyOomGrQll1euGAtxhoxHS65fJC5RwZWax3+79JxtFeHZnR+get5gqWPKpvb
 3fjOoQSE9q/OMArwMx95TXVi9F2gwKKJQCSry1Hx0RkTm1uf8StBwXpooCwj3awhN3X0
 gYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E+4Qd4E9HIFHi1BwjZ85dNcwW/a/s3TNOGQFzvuAjJM=;
 b=tjMTSLp7q/ea+knLS0lGROdc0NkGpSe42vfbm6K2KwlEMYanNab7pVeCkaJcyotlmx
 1MDXln4Sf/cPzHWhSeGwgduiAe+22UHzgW3MIqkHdlPCsFPqrQ+uwB+XzWjJEVs7xWMj
 leNanuleYJ2e+H21p4o9a1jfFxkIi+Y9Nz6h8/5XakZqWt4L3nVgsqYjUFQGcjMZnJxu
 SEMxglvX9P4PGUc7tKorvDPEWz/FrpiqGeACORr1xm149rohOPns3dPyzRvFRmYh25Md
 VdCXgN5KS3R1VRG3FLztQJpOva9bwuVB8NzC6IdNaiof4is4r3MUaQz549d1fLRcLrx6
 9tMg==
X-Gm-Message-State: AOAM533QHKxjYkcoQ/D4a+J6qD/71Hw5pCnAsLhlMnr+5FJyGo8f62/7
 X8eFS+0+36Hj403OnLsAHNIEawlWXw2rtQ==
X-Google-Smtp-Source: ABdhPJws1zABuk4zLqoWJUcadVfjeGlcawsSd6IOqDTI0pBFHfBmZxSSriti1EzoP4Y5AFw/wjRB1Q==
X-Received: by 2002:a62:1b91:0:b0:50a:64d0:58a2 with SMTP id
 b139-20020a621b91000000b0050a64d058a2mr25670391pfb.38.1650997170097; 
 Tue, 26 Apr 2022 11:19:30 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/68] target/nios2: Use hw/registerfields.h for CR_STATUS
 fields
Date: Tue, 26 Apr 2022 11:18:23 -0700
Message-Id: <20220426181907.103691-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Message-Id: <20220421151735.31996-25-richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 68ff8033b6..562dca8195 100644
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


