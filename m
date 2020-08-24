Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 192AA250005
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 16:41:45 +0200 (CEST)
Received: from localhost ([::1]:33128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kADfM-0003vO-31
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 10:41:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADU9-0000OY-3R
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 10:30:10 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:34927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADU4-0002mt-RW
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 10:30:08 -0400
Received: by mail-wr1-x442.google.com with SMTP id b17so8125978wru.2
 for <qemu-devel@nongnu.org>; Mon, 24 Aug 2020 07:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pd01uxw/z+OGFpmWpo0tpfZAh/qZHgIvhk5c35++C1s=;
 b=I+SE297L0XUSzXiduKOfJSXy6OtZVdpqbwk6m9A8fBTwIo18wOfcSqEZ4CemjrbMHy
 samsrqj+kROvIeDPhtu5/6ncpxVN8lITAh4Iz17UBhMejGf2oz7LEvCp7nwwmhLK5Hyl
 ZA8+SBGgHsjXj1jGr8CmBloRzLJqjI9uTNKXDbNm5GsiqCFLLNwgMK7htFC54JV9nTXJ
 GCWBWO3ods+bVe1TpFseDEFoBE+Cv4bmO1p6dlfx3TpNb+06Dt0sEPWPTZ2wjyXmP1Ny
 NnyI5SsweE06+Wuvau2is8waQPCRqgcR21EjMEixuf/BY8h4O3iq804eGUqiGdX4s6H/
 r/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pd01uxw/z+OGFpmWpo0tpfZAh/qZHgIvhk5c35++C1s=;
 b=g6ZE1PbvPoh+sX66D9oj6klUugROq7ePEXXUaB7irNKUde7p07thxATBPHsL3F4uMw
 jesjrmxI3p/N7kOcoDntGs/VoD8FdFZVZF67856pXlxAR5ynbraYiBZzozd5goFRWyMk
 HF7BfeSeohZezUYuK16xOubNYnKYMRGjIClkxM6Mhso6xipVZFHLLgUsTaswmbaOCcPh
 4cYjaaPZYp3TIbI7hvX0oYegQ2p1yJdOX41XethgPCcFeEJ/GbuhjMXDxGEi+c/FZC2u
 KZtGA7PnNWLp+kdAJjKIfmI79zbfrUIA0Y9BCwPmL+6mEyQr5+7SA7bVAcY2EB18DTsH
 WfTQ==
X-Gm-Message-State: AOAM531F8cFGRlzTWtbYrdkRuGnjbYi3ilT1gcz2R3xRIE4AEQbVWLZC
 HafVdwa2EaeeecJHWJY/y6VUYQ==
X-Google-Smtp-Source: ABdhPJyGprRtOB+3xH7ptABh0mOi9uA82xHm09a3/UeUepp/CDFj+EJqQW7o+kVCAC3CBConTY4Ejw==
X-Received: by 2002:adf:f847:: with SMTP id d7mr5813070wrq.328.1598279400140; 
 Mon, 24 Aug 2020 07:30:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b14sm24499091wrj.93.2020.08.24.07.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 07:29:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 22/22] target/arm: Enable FP16 in '-cpu max'
Date: Mon, 24 Aug 2020 15:29:34 +0100
Message-Id: <20200824142934.20850-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200824142934.20850-1-peter.maydell@linaro.org>
References: <20200824142934.20850-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set the MVFR1 ID register FPHP and SIMDHP fields to indicate
that our "-cpu max" has v8.2-FP16.

TODO: this patch needs to go at the end of the series.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c   |  3 ++-
 target/arm/cpu64.c | 10 ++++------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6b382fcd60e..c179e0752da 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2143,7 +2143,8 @@ static void arm_max_initfn(Object *obj)
             cpu->isar.id_isar6 = t;
 
             t = cpu->isar.mvfr1;
-            t = FIELD_DP32(t, MVFR1, FPHP, 2);     /* v8.0 FP support */
+            t = FIELD_DP32(t, MVFR1, FPHP, 3);     /* v8.2-FP16 */
+            t = FIELD_DP32(t, MVFR1, SIMDHP, 2);   /* v8.2-FP16 */
             cpu->isar.mvfr1 = t;
 
             t = cpu->isar.mvfr2;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index dd696183dfb..3c2b3d95993 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -704,12 +704,10 @@ static void aarch64_max_initfn(Object *obj)
         u = FIELD_DP32(u, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
         cpu->isar.id_dfr0 = u;
 
-        /*
-         * FIXME: We do not yet support ARMv8.2-fp16 for AArch32 yet,
-         * so do not set MVFR1.FPHP.  Strictly speaking this is not legal,
-         * but it is also not legal to enable SVE without support for FP16,
-         * and enabling SVE in system mode is more useful in the short term.
-         */
+        u = cpu->isar.mvfr1;
+        u = FIELD_DP32(u, MVFR1, FPHP, 3);      /* v8.2-FP16 */
+        u = FIELD_DP32(u, MVFR1, SIMDHP, 2);    /* v8.2-FP16 */
+        cpu->isar.mvfr1 = u;
 
 #ifdef CONFIG_USER_ONLY
         /* For usermode -cpu max we can use a larger and more efficient DCZ
-- 
2.20.1


