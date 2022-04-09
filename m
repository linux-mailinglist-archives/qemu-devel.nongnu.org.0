Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C382F4FA0AD
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 02:28:44 +0200 (CEST)
Received: from localhost ([::1]:47956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncyy3-0007LL-UA
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 20:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncye2-00006u-BS
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:08:04 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydz-0003WJ-PQ
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:08:02 -0400
Received: by mail-pl1-x62d.google.com with SMTP id j8so9234463pll.11
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 17:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q+NlwqyQSZalosOWPHcbsVEejz0bpldPcXN2ZslQ7DA=;
 b=PKZRZPekTT/IhFJLLRCM4HPB5ZkgsadpgzFEc/j8fwlhSrNrvmdaV92OBPSnVFjUqV
 5ExHf2CFiJFhl6BY7brKRF69WCAMI10Ba1XK4Jobh5fh7e5dSQm/JfwHHWz7mPqbVTss
 s/jxwxyQc1sTayj/05iHD8KxDJkki5AgYayG8KPJYU3EYmoWvOZIKezhywC3BrVpw5Qc
 RC5OnYn2P+T+d65OwbCQcl5fQccNP3/yYn2SfiD41blHkqw8rf+nAy5TK1aBrHBi35Yp
 r3EHR1jk2fi+8X84YntnEqyivhQZbRcilDMTqvruLWdqEDAepCXakkNjZZIM1XRej8wT
 +hSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q+NlwqyQSZalosOWPHcbsVEejz0bpldPcXN2ZslQ7DA=;
 b=C9YyfFaC7rVq/r17fSyE3PIePewrZ2HZmCb4EJjz7E8tlXvChmeg2GdxuYK9/nR5de
 mNAY1hMAZZ7RqrMiUCp3xA588yybnK2F6Cg5RBZSIL8hHWOf1wDBHygy2j0R7/vOGgis
 I0kHV6Bdjrl4wR4OjJTgDvv2MYQkcaXJ/b50sLUQtZq6WMiowDO2wdoDrT1myAgyDtma
 +1254m4B3tLcbt45ncV41NsvDeD0pW2pb2mt2BfqDXheI84X1k3c15GbI1Cxnjvq0f4m
 g6bxyUL9nFt8mVR463vNi86CBESktFL2c80+B6aTmIxTJ6v6E+oiLHNCA7wj+wmTg2Mk
 QttQ==
X-Gm-Message-State: AOAM533nJipH1Epv3l0Bt+37ccn3f4QSiUP6tWgNb0JjRwSeZ8cuKT7m
 T+KcL+cdG/8x0m1FY1Kg/r+o4O3E4COHyQ==
X-Google-Smtp-Source: ABdhPJxxMzkQLO1QiDicw65+vvX3ldUgvzajX37CblgvTPqnp09TrpIfS+9ec8NiZyuP0BgpZp2ArQ==
X-Received: by 2002:a17:90a:4604:b0:1bc:8bdd:4a63 with SMTP id
 w4-20020a17090a460400b001bc8bdd4a63mr24613194pjg.147.1649462878511; 
 Fri, 08 Apr 2022 17:07:58 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 t69-20020a637848000000b0039831d6dc23sm22073961pgc.94.2022.04.08.17.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 17:07:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/16] target/arm: Enable FEAT_IESB for -cpu max
Date: Fri,  8 Apr 2022 17:07:42 -0700
Message-Id: <20220409000742.293691-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220409000742.293691-1-richard.henderson@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This feature is AArch64 only, and applies to physical SErrors,
which QEMU does not implement, thus the feature is a nop.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 03c6707111..def0f1fdcb 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -838,6 +838,7 @@ static void aarch64_max_initfn(Object *obj)
     t = cpu->isar.id_aa64mmfr2;
     t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1);      /* FEAT_TTCNP */
     t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);      /* FEAT_UAO */
+    t = FIELD_DP64(t, ID_AA64MMFR2, IESB, 1);     /* FEAT_IESB */
     t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1);  /* FEAT_LVA */
     t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1);       /* FEAT_TTST */
     cpu->isar.id_aa64mmfr2 = t;
-- 
2.25.1


