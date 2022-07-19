Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4F357A635
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 20:12:04 +0200 (CEST)
Received: from localhost ([::1]:54776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDrhT-0003a1-Gt
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 14:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrWR-0006Pu-8n
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:00:39 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:38849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrWP-00069v-O4
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:00:38 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-10c8e8d973eso32948654fac.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 11:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AViijIJtcLlgLyYNC1Ztvc7ay6udyTNu67ccSkCMIC4=;
 b=aEWaMinV03apyduK5KR2RmfRVr1Tp330SAIN9/7aycoOhoYgTsOGVTNaxcGv+rGN7e
 ACkop7nu871zjQXo39QZQ1aSXkq82W+ngFskrRs9OoQ7m7TlZGUVXrLJEFO2vdVhxLKq
 4k2QXKDksgt5I3yLsvSbu7GRBDiPlbTDpSaLnJNqaJVs59OkdKiSsmZsYozC2jrS789Z
 +S2BBuojxuulgiRbZcLVdKF0GP0gxPZz4tG0b7YqawmNhbyHCSHLyz2Chpx+fcp1CBIJ
 X9zff2/gmvzk4N+s47VwB8WdYjiBD7QirkVz7oDooMOGSbWqkKynluSJa5DOL0FoBTuL
 DB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AViijIJtcLlgLyYNC1Ztvc7ay6udyTNu67ccSkCMIC4=;
 b=eKnUqSN6kv4fXzbi09D5h3qC/4qa3K23+8/wuZBFBGJR88soACfZGRglZf6MV4JxNJ
 FbWAzZiHebqwJHR2I2ioduipAqKMLsAp3R2ou7l03p9mB0HJtr59NzslZ9jlQxwSAH8n
 X0ARur/LrkyzJHIXZeLc240pqpUmwLqLZWUbNJ7HjUmwiOsjIHQDmSLhT2YjaaJaYBth
 7PZrMK1XRHkLo15Z4bXCeDmQ2Ate+dA6Om+mWQbM3+gl3GxlRUxXEcBawHMx8YbW8ozE
 FxrVvFPeWjx/gKp3zdcoJ377IcqWyWgMA1YgWV06hmDjzmkwjNfjbis2P84HbCCPQCmv
 A4HA==
X-Gm-Message-State: AJIora/UMESHYmHai+7V/QrM9qvymzcSSi+3+xvZoh2Xw4kuPsUfCVNm
 SMtoTAMB93CU6zJO9cV0XdZmUMObMCs+4A+R
X-Google-Smtp-Source: AGRyM1scC8iSgG5jZdM2BUbLYFzWiDMCvGHCWQ7sM9dcn4U53FNiVEV8lxd5d8rqTlM+XhbcpV+Ajw==
X-Received: by 2002:a05:6870:2409:b0:10b:c5d0:3edb with SMTP id
 n9-20020a056870240900b0010bc5d03edbmr344656oap.293.1658253637085; 
 Tue, 19 Jul 2022 11:00:37 -0700 (PDT)
Received: from stoup.. ([172.58.110.182]) by smtp.gmail.com with ESMTPSA id
 c25-20020a4ae259000000b0035eb4e5a6cesm6286747oot.36.2022.07.19.11.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 11:00:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 07/21] target/loongarch/cpu: Fix cpucfg default value
Date: Tue, 19 Jul 2022 23:29:46 +0530
Message-Id: <20220719180000.378186-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719180000.378186-1-richard.henderson@linaro.org>
References: <20220719180000.378186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x31.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

We should config cpucfg[20] to set value for the scache's ways, sets,
and size arguments when loongarch cpu init. However, the old code
wirte 'sets argument' twice, so we change one of them to 'size argument'.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220715064829.1521482-1-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 0d49ce68e4..1415793d6f 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -406,7 +406,7 @@ static void loongarch_la464_initfn(Object *obj)
     data = 0;
     data = FIELD_DP32(data, CPUCFG20, L3IU_WAYS, 15);
     data = FIELD_DP32(data, CPUCFG20, L3IU_SETS, 14);
-    data = FIELD_DP32(data, CPUCFG20, L3IU_SETS, 6);
+    data = FIELD_DP32(data, CPUCFG20, L3IU_SIZE, 6);
     env->cpucfg[20] = data;
 
     env->CSR_ASID = FIELD_DP64(0, CSR_ASID, ASIDBITS, 0xa);
-- 
2.34.1


