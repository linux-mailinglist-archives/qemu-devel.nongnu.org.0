Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D54CC565124
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:43:28 +0200 (CEST)
Received: from localhost ([::1]:48968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Ic3-0006HS-U2
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITN-0000Le-0o
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:30 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:38615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITL-0004wq-HZ
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:28 -0400
Received: by mail-pf1-x436.google.com with SMTP id k9so8457623pfg.5
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 02:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KtmNbu9yExeJxvfDUNJQ5c1VHDhvr7IbviTyJY19R0g=;
 b=JkbPHVE26B6Uuawwrbljc5T/BHUuBry4VSmAQTSUp5OzR644PWjI/D1rilq/9ugw+5
 G2aGbF+tsJgH4a5gMgecYJoeWEvodJTullDsZRLYi/avRuLoREJjQXZk8cqX81KPDHvU
 qbk4dgBNmIJlKOiBWkRhddD+FkzaGarIemQqRXGDgwjw3GOIY8C/mNHnM01lZLDpcNRL
 CCe/FU0qLxyE7rYbEMwCFsS89GGUD6s1xUOjkmLB91w2S9uxYKLLZhdq/trJBj9XQjTt
 fKaP/zLl0lXdGgMeHe5Yv1RmVDT3O7FgyDXwmUPXRmc6qXF3/JxsgjiFOgln02QmSbWz
 LjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KtmNbu9yExeJxvfDUNJQ5c1VHDhvr7IbviTyJY19R0g=;
 b=HphdnyK2ZiyNOkEjjVfhGASQqcmk5eDSulUqJBvDk2fr9Z/QryTpXZ6hR4tYeT0AGz
 gH7sYMToL3iVqydskfSlKbMO2UJ5wwGV9SbBZwwXDsrpF+wigDhgJ3eKpBnX5YS4ldoe
 NLC6E7qPlzAWfuIyEBjSb2rz4VkUnPJugB/Mr8xZS4NyMZW61EnKQ+HYWLUeiemCqMRH
 hFiOlrgD2hFtmuSaNbCOsihHcw04WQfMiMrgUtYpFWgwf2T6SFFvnzAB+DSxhk8k8N7S
 zC93EsQmoyXQFHhA7JKPedGDoiRLuw7YmTdjMVItyWP1oAWMRegynLGS7OfOSEU9wvu0
 snqA==
X-Gm-Message-State: AJIora8/aOd9fwL6YmfxzSJAxEtcs2iBuNNkKv3xeYpdMHx6hav7OdFB
 R0gBVaYGTzGlmpMFaQPreS4rByzo49JFPQyS
X-Google-Smtp-Source: AGRyM1tmBaDI5Q6C14VHLJ1f22uHp81jkW/GUCr6yjxGEaQAM7zRjMdhvYrXYsxn7vXdfd6hFvNPFQ==
X-Received: by 2002:a63:6c42:0:b0:3fe:465:7a71 with SMTP id
 h63-20020a636c42000000b003fe04657a71mr24153697pgc.101.1656927266792; 
 Mon, 04 Jul 2022 02:34:26 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 z5-20020aa79e45000000b00525b7f3e906sm15353355pfq.27.2022.07.04.02.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 02:34:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 08/23] target/loongarch: Fix missing update CSR_BADV
Date: Mon,  4 Jul 2022 15:03:42 +0530
Message-Id: <20220704093357.983255-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220704093357.983255-1-richard.henderson@linaro.org>
References: <20220704093357.983255-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

From: Song Gao <gaosong@loongson.cn>

loongarch_cpu_do_interrupt() should update CSR_BADV for some EXCCODE.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220624031049.1716097-9-gaosong@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 4c8f96bc3a..e32d4cc269 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -171,18 +171,20 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
         cause = cs->exception_index;
         update_badinstr = 0;
         break;
-    case EXCCODE_ADEM:
     case EXCCODE_SYS:
     case EXCCODE_BRK:
+    case EXCCODE_INE:
+    case EXCCODE_IPE:
+    case EXCCODE_FPE:
+        env->CSR_BADV = env->pc;
+        QEMU_FALLTHROUGH;
+    case EXCCODE_ADEM:
     case EXCCODE_PIL:
     case EXCCODE_PIS:
     case EXCCODE_PME:
     case EXCCODE_PNR:
     case EXCCODE_PNX:
     case EXCCODE_PPI:
-    case EXCCODE_INE:
-    case EXCCODE_IPE:
-    case EXCCODE_FPE:
         cause = cs->exception_index;
         break;
     default:
-- 
2.34.1


