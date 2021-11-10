Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC3844C0B7
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 13:04:31 +0100 (CET)
Received: from localhost ([::1]:58738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkmL7-0004An-V2
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 07:04:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkmIt-0002oE-8b
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 07:02:11 -0500
Received: from [2a00:1450:4864:20::332] (port=38500
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkmIn-0003Df-06
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 07:02:10 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso1511142wms.3
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 04:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qHnAaC4KhlYFrHlyH1Juombpl61nGHWeKH8zTnb+vdM=;
 b=wWlgNz/s6g1OFPclG7kN9HSFlt0eL2kk46RwA2moiHp2bZysC3PpkoHiR0wY5yvqtY
 mnk0rQdrwl7PeyzJ+Sak3xQImv2toUe89QzTosxpVvLLYIK4VCTbnWE07epWfcuJ9/J8
 Km8lh1CL8B5D71hEP8jquhWs+kXfT/VK4dbMITwK1kRhIJ47FEas5SOa1Oh9o5c2J6Hl
 7/yKJUNHml+6VBJed0hzs3Jdw8XhGVT/Hjv+cDDPOv6anh1H6Ns4OHlWL/Z/zcSWiR18
 eCseU9WqHkkQkEf0yNXeEO7UYlUeNxDTAcGmlxhdCTrSV8T1g5AqV4fBfE4jIdY6Y7cu
 NNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qHnAaC4KhlYFrHlyH1Juombpl61nGHWeKH8zTnb+vdM=;
 b=Jz0wJjQjd7l72kUPvqsJlOZGauNv/R2qYF2c9dduxkaXtjiBq0IpaEM8kUVCBqyG+8
 Mj+8Qj73z7RMeibaYcXkvCtfpdKVf05AOomUtmpPZ3UAyCQ67zMgGt+pXawlORfCGF9S
 cVq3szY0kIZarzE3By3rewG+eG93rA172jWh5OBzLhwxMov71V5MaZTIdg9v69A7zP5s
 khBKgF5Yx4J6OZ99bknbvSHRyOs7LR/r3jml3YIRaxRvNnzG6tgnFdXdjj1Y0sN4cMpd
 5vtYUiC1fBt0iZePHvahZ0tPjWLP0nsj52DGfd27jEPg5UhsJnps5yac5C55VoUU5fLv
 PDqw==
X-Gm-Message-State: AOAM532Sf3dSIuR44nqOtbN0J61wsgmIrtGPSAwphNOEHi0uMbgwQYYH
 CPPdU/nHxL2i7Q1VRJidMr7K3DrMwW8Ds0Pl
X-Google-Smtp-Source: ABdhPJx6rLoHzR1nUUM5Wfz/WAGlfseelQyxvSOo/CQwdxRG+Aqt4VwMIh21BsHdNca/OyDMIJUJmg==
X-Received: by 2002:a7b:cbc3:: with SMTP id n3mr15905030wmi.15.1636545722453; 
 Wed, 10 Nov 2021 04:02:02 -0800 (PST)
Received: from localhost.localdomain
 (104.red-2-142-241.dynamicip.rima-tde.net. [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id h2sm7600337wrz.23.2021.11.10.04.02.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 04:02:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg/optimize: Add an extra cast to fold_extract2
Date: Wed, 10 Nov 2021 13:01:56 +0100
Message-Id: <20211110120156.188537-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

There is no bug, but silence a warning about computation
in int32_t being assigned to a uint64_t.

Reported-by: Coverity CID 1465220
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index dbb2d46e88..2397f2cf93 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1365,7 +1365,7 @@ static bool fold_extract2(OptContext *ctx, TCGOp *op)
             v2 <<= 64 - shr;
         } else {
             v1 = (uint32_t)v1 >> shr;
-            v2 = (int32_t)v2 << (32 - shr);
+            v2 = (uint64_t)((int32_t)v2 << (32 - shr));
         }
         return tcg_opt_gen_movi(ctx, op, op->args[0], v1 | v2);
     }
-- 
2.25.1


