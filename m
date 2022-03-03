Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F2B4CC7D8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:19:51 +0100 (CET)
Received: from localhost ([::1]:54450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsrW-00034J-F4
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:19:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYY-00064O-7y
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:14 -0500
Received: from [2607:f8b0:4864:20::435] (port=40824
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYW-0004IW-Oc
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:13 -0500
Received: by mail-pf1-x435.google.com with SMTP id z15so5796329pfe.7
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 13:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=skxQgQ+RFu2/aWNtYDojkF6HkGJxnV7g042MDaIDVgY=;
 b=wrxxfHJEi5y51wg2AXYp3LLxXUjhCw58/qAmxceWi0dZPCphS/Itul+mfyawEJQVXn
 zPo+MlOvxaeKG6Ej8E3x3OH93C+66ouH9c0Wt7KLWrIYaJDo77okkNZJayWAu+JvJhKU
 7MLSRwVToVrrAljzKH5MJneL6ObL4clv/gbzWOrUVQn1xsMPpm2oJY26TK8OJFGX/YTa
 Q6tMsrE9YlbN5jpH1xH3306EPmiG2atWM7sMcG28NXJ2C3j+NDlEGw8UqrcxG/ZVAyLE
 HbARlpvrStN5PAKt3l+et95NOGuadbDpNTsw13DaSL7rgkBKcdgyXRsQkHTczTQ4kV6N
 gGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=skxQgQ+RFu2/aWNtYDojkF6HkGJxnV7g042MDaIDVgY=;
 b=717oru0crH8rOYOkxfxwDugXjMx7ZG0juWDMw77ycQFwC+RQH01/QpLbifLtnp0o1u
 peDbXy97QjeJfpFeupdZCGSTXBpSeMor2v9HAhD+oyNfZz8bIjXWegFdX9UFYbc9fPLn
 82peJsxQSxptRr8WRVk94fUjZlWVNDWD3EmcFFqpYfPKbuRp8VWJEVF1GY1/pkfdJOrz
 hBc8tW2hnmq/dtJ/s86TmX28oqnscAkAsGl9SBOP78dK9NIodVjajMYad0uWQQgtRl0I
 TUC9GxYXEdNL2tV38ljsqYQMXfVBK0hCK74U7SFimaK0JNtEbrRcRS3mywP7LHBSc5vM
 Z28w==
X-Gm-Message-State: AOAM530mJjG+PMH2IYWn7cwFU8I0fzhbBTyr3Vj0D9wrBUfjTCO1wHsK
 LQ33dRN1jjEgD9Na0lV0nprnMUNxSuFIIA==
X-Google-Smtp-Source: ABdhPJxd+coDCTDAeWpcbVWv/eWyyYnzS0G7rW/kx6i38qnZBLPvBBqPdosW10op/mE8c/WGK0JGEw==
X-Received: by 2002:a63:1651:0:b0:342:b566:57c4 with SMTP id
 17-20020a631651000000b00342b56657c4mr30971957pgw.258.1646341211512; 
 Thu, 03 Mar 2022 13:00:11 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.13.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 13:00:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/30] tcg/i386: Remove rotls_vec from tcg_target_op_def
Date: Thu,  3 Mar 2022 10:59:30 -1000
Message-Id: <20220303205944.469445-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no such instruction on x86, so we should
not be pretending it has arguments.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 19cf124456..1fbb4b0593 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -3329,7 +3329,6 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_shls_vec:
     case INDEX_op_shrs_vec:
     case INDEX_op_sars_vec:
-    case INDEX_op_rotls_vec:
     case INDEX_op_cmp_vec:
     case INDEX_op_x86_shufps_vec:
     case INDEX_op_x86_blend_vec:
-- 
2.25.1


