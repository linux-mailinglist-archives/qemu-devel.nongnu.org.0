Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8907318BE7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:23:12 +0100 (CET)
Received: from localhost ([::1]:43436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABw7-0001CF-T3
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:23:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYs-0007u4-P6
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:10 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYr-0008NO-CD
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:10 -0500
Received: by mail-wr1-x433.google.com with SMTP id v1so495821wrd.6
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WshNHyd6X+FZoKhq1yVntiLeg2lGOxs8cfnC0ZZ7SBI=;
 b=Rq3w4uHMalxPcDxkh6zdl8wIdAbYyCKaa+wfD0qc15EWcHd2xdmXMe3E7MF70Ze/7D
 SS6u+6/1ZGPqd1/Qn+bDFbwPgMtkGdwI8qIqo61WFM7G02TBfYEAjVGUrFhh2L9Gj8Yn
 4D/Nq0DBok99gpOfbr4lAHJkwI2N7vrmk5xlLrBmQ8et1jU4Q0Y/cnDcNNmZpmZ0Dt0y
 SI5131Q48ymp+3KGwxavuq59S6NKBxXWki3Fupb4TzVwvlJLmlshEiluVfkbYLHDpx6w
 SY9gGFyrUwu+OVtiNe/2W3awzZmvuaDH1ALRl0bXDTobwq1ZuHXdq8fcwDbJNui7g1wL
 bU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WshNHyd6X+FZoKhq1yVntiLeg2lGOxs8cfnC0ZZ7SBI=;
 b=B+udZsZFxka/J669wJROXs7GA9tzVJmlfZ+LP1C/4rQjQvEm58j1UUllf2gEsVnE05
 x1tai6sYVIGFZg4Mnm0N8k8JP8oSBwWfSuAua5MbyrGR8AxZbk3RZoq6GWCY0+yQaPfw
 lFtYxqmDjvv7wJ90hUkmMais1vfg9Gxh9bE++zICCOfz+3q5fhBld3iXM1BMM0AORbID
 C9SbwxNpczIJdvvwStqWAaxOd8AbKDHdPvGFRhV/dpVMG4l3HiNVTMqG+ES+i8zWoAer
 qtRhy/3ZdtFNrS1PJm4EAeToo5EEhh0olRlKdf/XFv/pB29R7VSwGw1zumlQMGeFdDx1
 s5DQ==
X-Gm-Message-State: AOAM530fMxF5MUkMBA1R+ACrXbGZAwBNGCyv6HOTZgMksK/Jlr7M8i5Y
 hyKO/ujQyojivnffV7vX+7SND+C4f82hYg==
X-Google-Smtp-Source: ABdhPJx/x2Kl0ifr0W2nwlhA728APngnSm73KKktfz4nOBWXIcUdWwIwx3vyKF9V+tQRilx9se7eZw==
X-Received: by 2002:a05:6000:1362:: with SMTP id
 q2mr5581707wrz.31.1613048348130; 
 Thu, 11 Feb 2021 04:59:08 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/45] target/arm: Set ID_PFR0.DIT to 1 for "max" 32-bit CPU
Date: Thu, 11 Feb 2021 12:58:22 +0000
Message-Id: <20210211125900.22777-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

From: Rebecca Cran <rebecca@nuviainc.com>

Enable FEAT_DIT for the "max" 32-bit CPU.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210208065700.19454-5-rebecca@nuviainc.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 8ddb2556f8c..5cf6c056c50 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2202,6 +2202,10 @@ static void arm_max_initfn(Object *obj)
         t = FIELD_DP32(t, ID_MMFR4, CNP, 1); /* TTCNP */
         t = FIELD_DP32(t, ID_MMFR4, XNX, 1); /* TTS2UXN */
         cpu->isar.id_mmfr4 = t;
+
+        t = cpu->isar.id_pfr0;
+        t = FIELD_DP32(t, ID_PFR0, DIT, 1);
+        cpu->isar.id_pfr0 = t;
     }
 #endif
 }
-- 
2.20.1


