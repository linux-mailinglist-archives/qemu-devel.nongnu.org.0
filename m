Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5836063B4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:59:59 +0200 (CEST)
Received: from localhost ([::1]:48170 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olX1Y-0008GK-T7
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:59:57 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWw4-0003SU-LX
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU81-0005TW-Mz
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:33 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:42628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7z-00016L-MM
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:25 -0400
Received: by mail-pf1-x431.google.com with SMTP id i3so20024689pfk.9
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/GWofEQojLLXXLRwojNJiYI+Du4LjIcNNqXdtRzxkFU=;
 b=XopguzG/bXd7huBvfqVcTd+Qnz9q6N1c2asOd3fVT7kNjvdtgAtg68Aq/HveliH3+b
 j20Ts/I2LcoFLNm+m/tCmPqrOeDoWdwPo3yu7ZvXDvZwPHvo3lgIM/boEt+h5Dl6Wadd
 7D2B2ZafxvOOm6ScqhLumX8WOpj78sXLb3Qi4QEnZlip5Uw6DHZVI/oOTO3YIIzn+uSb
 +cTTJ2xtBVkSPcF7j8PDsJ7JrqtgqlC1/KUICSC+t3GSxZNY+0pz9VNzzJrxXXM5uD9G
 yN0Bo5kqBhty3Ids5kKZoFDK343TL7Tf12L99r3e/+mL3+2/s/thy1CED8hBXvV+fPCi
 b2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/GWofEQojLLXXLRwojNJiYI+Du4LjIcNNqXdtRzxkFU=;
 b=u2NHNyWLNjfR5CV4kCxv5wRYr0c96g7aDL+wxX5+Mzj1w0i2i0eCJStcgc0pZUw/ZW
 +pIKKBhdTgqwxtmIoqoJoapegmG5Ns2I82tChKedbn+pWb9eXP/BHJ7qcEi187uFD6ln
 4y6KZmT6potoF187eyC7pfn0i3mt4AV/IP9fSY/jsazek6wT4ACScErNudR4ZnXoNoR1
 J2rJyqeEM2UM68wDfIEMD1RrAPVj2Sed0AbE4Xul0nHE5QMuHEbwg6JN4n0PWrEQafCM
 r/MA4AFpPLzTCvzNystGHgsad3Sul31d9jfbApav6eOZPeCwGP8LJ571YQ2b/FS3PTQe
 nFnQ==
X-Gm-Message-State: ACrzQf1/tpq5H9k8CED82qFJMFw71UlOiM93PwdrWySK27sAirpadVV4
 bJLfQnudRGkRnvEzCJZZGSgPriByaWaRlh1+
X-Google-Smtp-Source: AMsMyM6E+u6+vT1VwbIanCTrSqHLLGzM2BlSAxpxOAT+Yg8kHzIPu33G3XdWyio+UBhEerZTxs+4AA==
X-Received: by 2002:a05:6a00:843:b0:563:fd4:d73 with SMTP id
 q3-20020a056a00084300b005630fd40d73mr13619242pfk.47.1666266862175; 
 Thu, 20 Oct 2022 04:54:22 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w206-20020a627bd7000000b0056109e15638sm13065464pfc.54.2022.10.20.04.54.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:54:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/31] tcg: Allocate objects contiguously in
 temp_allocate_frame
Date: Thu, 20 Oct 2022 21:52:34 +1000
Message-Id: <20221020115242.2301066-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115242.2301066-1-richard.henderson@linaro.org>
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

When allocating a temp to the stack frame, consider the
base type and allocate all parts at once.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 5b17892058..3a0cbe8ac6 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3318,11 +3318,12 @@ static void check_regs(TCGContext *s)
 
 static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
 {
-    int size = tcg_type_size(ts->type);
-    int align;
     intptr_t off;
+    int size, align;
 
-    switch (ts->type) {
+    /* When allocating an object, look at the full type. */
+    size = tcg_type_size(ts->base_type);
+    switch (ts->base_type) {
     case TCG_TYPE_I32:
         align = 4;
         break;
@@ -3353,13 +3354,26 @@ static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
         tcg_raise_tb_overflow(s);
     }
     s->current_frame_offset = off + size;
-
-    ts->mem_offset = off;
 #if defined(__sparc__)
-    ts->mem_offset += TCG_TARGET_STACK_BIAS;
+    off += TCG_TARGET_STACK_BIAS;
 #endif
-    ts->mem_base = s->frame_temp;
-    ts->mem_allocated = 1;
+
+    /* If the object was subdivided, assign memory to all the parts. */
+    if (ts->base_type != ts->type) {
+        int part_size = tcg_type_size(ts->type);
+        int part_count = size / part_size;
+
+        ts -= ts->temp_subindex;
+        for (int i = 0; i < part_count; ++i) {
+            ts[i].mem_offset = off + i * part_size;
+            ts[i].mem_base = s->frame_temp;
+            ts[i].mem_allocated = 1;
+        }
+    } else {
+        ts->mem_offset = off;
+        ts->mem_base = s->frame_temp;
+        ts->mem_allocated = 1;
+    }
 }
 
 static void temp_load(TCGContext *, TCGTemp *, TCGRegSet, TCGRegSet, TCGRegSet);
-- 
2.34.1


