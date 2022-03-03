Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B294CB545
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 04:15:46 +0100 (CET)
Received: from localhost ([::1]:37812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPbwP-0001Jv-9b
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 22:15:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPbsV-0006wp-OG
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 22:11:43 -0500
Received: from [2607:f8b0:4864:20::102f] (port=46771
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPbsU-0003Wg-67
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 22:11:43 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 15-20020a17090a098f00b001bef0376d5cso3623332pjo.5
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 19:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z0nTGi36Q6kY2XhTWFaFoUNK+G34o+/T62xUlFxQppc=;
 b=zcgdZr3CaBtvHQgE1kM8OA3KdTpe5q2TFD04PX1L40Rr5C7qbBY+dPbMTNJ1S8pyPn
 U3AjOcFEh2iuSftOIJZ2iQP32tr5fJjoaU9FIp+fhlkXd6Ca6/upDlIbIU+g5wMAYZpB
 oqMfYMRjeEkdTJ2kg3CN/JuV3xm6l4qSqY8TWr4ZZUbOzctWQlhSGAfU3agNzvG96K+n
 BOTtdX3c55Lfj8xy3BAVQa3TJZt/a6IOfuDbnYWGPn+EWObnOKoINtHocYa+MdlqJnam
 LDoJsyPMqZF9ZYx2AYV6LkBAIlum2Yog/0ckqIB1ji2ib3EnCVGR2IpwueIZxaSeglQp
 rJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z0nTGi36Q6kY2XhTWFaFoUNK+G34o+/T62xUlFxQppc=;
 b=48lf21jg+qNeyFHbGxE9BQkfxo5YrYqVMpvHVzQVn06OuEJtjQYqtyTn/7vYr1a7u+
 QOBwueX38UM1xY+FWx5oGzBYhiaoaTzEF7QTwShX5IMZxZoEp77K+57enrRnHDXc1fd1
 KUrqolhrakgGZWkvMIPd2P2du5UH20OUpwOwmEejgSdzU1eu0FXTJB1/VUmymBasmDhL
 bhe30ELeGimg/JZbVngkp1WqR+/ReHU2UBcfGtyX6+37vfp8K8MSy74QmTEy169m8h7k
 CrMgGBySQar4F/7W3T3ABNlhBfoK39gOg+tPRSJUL1oFfx1y0d3xZR//l22JffRfxz9w
 iCWQ==
X-Gm-Message-State: AOAM531K1F2ZuLFguOISATJ88VOZtkzGJUcH4ZsDpVXLGBK0RwzCYlhT
 skeT//FbHDZ/XQQu1vf9EZ6afEQ0JJq4YA==
X-Google-Smtp-Source: ABdhPJyiMTh0olcdYXgs30VnHPmVwN9603ULmzKcd0ghhsMSqIWxMWF80zz5/FLfGgrqBI+lEyPUqA==
X-Received: by 2002:a17:902:8c86:b0:151:8226:e93b with SMTP id
 t6-20020a1709028c8600b001518226e93bmr11379437plo.128.1646277096293; 
 Wed, 02 Mar 2022 19:11:36 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-e819-4400-f268-c391.res6.spectrum.com.
 [2603:800c:1201:c600:e819:4400:f268:c391])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a056a00170700b004e01663f59bsm605789pfc.117.2022.03.02.19.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 19:11:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] tcg/s390x: Fix tcg_out_dupi_vec vs VGM
Date: Wed,  2 Mar 2022 17:11:30 -1000
Message-Id: <20220303031132.444233-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303031132.444233-1-richard.henderson@linaro.org>
References: <20220303031132.444233-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The immediate operands to VGM were in the wrong order,
producing an inverse mask.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 6e65828c09..508f1bccc7 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2715,7 +2715,7 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
                 msb = clz32(val);
                 lsb = 31 - ctz32(val);
             }
-            tcg_out_insn(s, VRIb, VGM, dst, lsb, msb, MO_32);
+            tcg_out_insn(s, VRIb, VGM, dst, msb, lsb, MO_32);
             return;
         }
     } else {
@@ -2729,7 +2729,7 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
                 msb = clz64(val);
                 lsb = 63 - ctz64(val);
             }
-            tcg_out_insn(s, VRIb, VGM, dst, lsb, msb, MO_64);
+            tcg_out_insn(s, VRIb, VGM, dst, msb, lsb, MO_64);
             return;
         }
     }
-- 
2.25.1


