Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5C64B1B92
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:46:21 +0100 (CET)
Received: from localhost ([::1]:39438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIL0v-0002Oj-0I
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:46:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKn4-00044K-7c
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:05 -0500
Received: from [2607:f8b0:4864:20::1035] (port=39746
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKn1-0007MS-Nu
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:01 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 v13-20020a17090ac90d00b001b87bc106bdso10401249pjt.4
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KMWZPJpRr/1EU+0WBrOLUzmhcggx5S8kf5YnkmrzW7A=;
 b=TqQVr9vg1LXue62Z6jBLWtLiiZPMJYBEca3IWfWl1ZMENKYLtwVN/6orgbvDY+TX6n
 9w+YVYFLEbjPH0Pbo/qoQWx/qgBFJKH+4UwX8lnRcmvc8Y/iUN5IKXxZIvoDE9PVBOlk
 DZro3ivJxz7975Ix9BdkAIgPdMhjM8EQ6Y0lMQY1eFcyK9CY+ZqwxtsF4IC4Pa12bNRi
 Pk8Gp/6HD8QJsXVQsYcKZXf7JdESFLS44FdJzCTDRquyPrtFGqVjEKWv42KIExd1jivu
 0Ep+3q2nhSEDtZ/qGZdImuLXWK4yoZWBQcyq3TvABF+vCv/tAReUJErMvgB7btg9YTLn
 cAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KMWZPJpRr/1EU+0WBrOLUzmhcggx5S8kf5YnkmrzW7A=;
 b=15urWhri9G/6Ql1NiyPKqp5SqgKOCEOcNLnmAFB6Z/WIXF2Kz/O55Wy5nqEk4qXuEJ
 1Z+3Mdo5CoBk3Lc/RqsqDmb0C9QU02Ge5FJenWtwyVA5Lr3/+H92aVkewlN/2VKdq5Kf
 A6HMof2lGlimluJ5xpF8+66OHwmIFf7wOIwOI1LQKJ4vgsI4tnzY3cm1OvDB4HDqddc7
 Q1alhOUJ9DJYiQcDwxoZDKp4rlqnW8mTWOeKgVcY63AgebVkIk152YcgA6BVHstLX384
 lhVqUwqrVNfAK7FUyVo/apnEJgdkjC3b4eUebXRPIR5oDKg9+pv9h2QezHDEQM1vG7wL
 vtMQ==
X-Gm-Message-State: AOAM532tw3KxFQZsQBgjYHarNUXewBLfFit/J2JEJlYjmwGUJDvmOhoz
 TFhyy2o/FB3F7w7qVaWa60uHv2g1H9RsRpW8
X-Google-Smtp-Source: ABdhPJwMEoWmt0fqhIVrwlkUqQlMVW2S9WTfRLONNDNFx5cnZdwzfcWD4BKlcrRaRLaDKrs0kfoA6g==
X-Received: by 2002:a17:902:e5cd:: with SMTP id
 u13mr5044745plf.40.1644543118322; 
 Thu, 10 Feb 2022 17:31:58 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:31:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/34] tcg/loongarch64: Fix fallout from recent MO_Q renaming
Date: Fri, 11 Feb 2022 12:30:34 +1100
Message-Id: <20220211013059.17994-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: WANG Xuerui <git@xen0n.name>, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <git@xen0n.name>

Apparently we were left behind; just renaming MO_Q to MO_UQ is enough.

Fixes: fc313c64345453c7 ("exec/memop: Adding signedness to quad definitions")
Signed-off-by: WANG Xuerui <git@xen0n.name>
Message-Id: <20220206162106.1092364-1-i.qemu@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 9cd46c9be3..d31a0e5991 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -871,7 +871,7 @@ static void tcg_out_qemu_ld_indexed(TCGContext *s, TCGReg rd, TCGReg rj,
     case MO_SL:
         tcg_out_opc_ldx_w(s, rd, rj, rk);
         break;
-    case MO_Q:
+    case MO_UQ:
         tcg_out_opc_ldx_d(s, rd, rj, rk);
         break;
     default:
-- 
2.25.1


