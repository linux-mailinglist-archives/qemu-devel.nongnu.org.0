Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D474DBE31
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:24:32 +0100 (CET)
Received: from localhost ([::1]:33456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUich-00076s-Bd
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:24:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKw-0001N2-DE
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:11 -0400
Received: from [2607:f8b0:4864:20::1033] (port=55273
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKu-0002Hn-RK
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:10 -0400
Received: by mail-pj1-x1033.google.com with SMTP id b8so3934345pjb.4
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c1gnsNdU+y7p35LQc37uO6M9rdhacpyrBQDCJlMzk6g=;
 b=lZQiZ3t+f905hUkYZY7elr21fcBUSiKuqZpWGjHMguPQNRjRnAN5zmAOro5Q4DlJst
 NcQfNqulMyCP2kqKpMPoBO/qOHgTA4Puy69JpLBGX7Q5Jzk/Rh6rUqDMTgPivqGxhTNp
 VaiF1rpuwm2lJiZf39saCCHnsdQdbn5J0n4+h0+bAlRh70ZtgT9e+Ic/ZJgeN/00jKYu
 UpwChxblZ6Uj36z25RN2tAPHgUdAnyor3bvl1xRUUGdtZer0CvmIPXUbwz00Av694iN6
 Q8qPC1Rz67iwPULUeeoc5TTVhXxL5uv13sHi7mKsOYvuIReztQ7jCcUwUvUv1sz0yUc8
 uYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c1gnsNdU+y7p35LQc37uO6M9rdhacpyrBQDCJlMzk6g=;
 b=iZS61OK/zDhGuIraKjz9J53AYfV22yrthTau8wbFge8CF5t8szRWiTQj1RncohiFiZ
 4ZfHDwMcdhS9YjsUnpwxiOlT98RjX/rqk3q81sFsPyxlS3sNTOKpbw5x+IT1zP5jCGx0
 KlJMZ2qtWFPmErDCz6CLZSVEZXps74QpX+465ylueIOZis75ZVjgn/JbDD3EReOPzbcP
 FL5AnXHz1XH1OaS3QfC3tgKMS/EZ0PiSG8UQk/YV3ituqavYazd+0usB5sbfjFQKTE0u
 q6EFF3SBzmvtZMfY6JfzQMwytTYQd3ElEEVC6qGkVyCpmXfPLMB7nHB+ezmoLfwfSRyW
 9Ikg==
X-Gm-Message-State: AOAM531jjFekkvOXSzyoleUbxvy2hjcIPTC7SUyWyGjrro93fUoPHWdd
 hMv4l8/xvUengj56PO21ygeA8EuzQ87hCQ==
X-Google-Smtp-Source: ABdhPJzTeImC5BiGyPq062YlPfbkrWmW1qb3EgNJOxHkzgxD+UAkTjqqrmp9Hd48gyU5hzj03Lccrg==
X-Received: by 2002:a17:902:8f83:b0:151:5c71:a6e6 with SMTP id
 z3-20020a1709028f8300b001515c71a6e6mr2885075plo.126.1647493567600; 
 Wed, 16 Mar 2022 22:06:07 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:06:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 28/51] target/nios2: Implement CR_STATUS.RSIE
Date: Wed, 16 Mar 2022 22:05:15 -0700
Message-Id: <20220317050538.924111-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: marex@denx.de, Peter Maydell <peter.maydell@linaro.org>,
 amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without EIC, this bit is RES1.  So set the bit at reset,
and add it to the readonly fields of CR_STATUS.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 2f1f5e35aa..9fc4fa7725 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -59,9 +59,9 @@ static void nios2_cpu_reset(DeviceState *dev)
 
 #if defined(CONFIG_USER_ONLY)
     /* Start in user mode with interrupts enabled. */
-    env->ctrl[CR_STATUS] = CR_STATUS_U | CR_STATUS_PIE;
+    env->ctrl[CR_STATUS] = CR_STATUS_RSIE | CR_STATUS_U | CR_STATUS_PIE;
 #else
-    env->ctrl[CR_STATUS] = 0;
+    env->ctrl[CR_STATUS] = CR_STATUS_RSIE;
 #endif
 }
 
@@ -132,6 +132,7 @@ static void realize_cr_status(CPUState *cs)
     WR_REG(CR_BADADDR);
 
     /* TODO: These control registers are not present with the EIC. */
+    RO_FIELD(CR_STATUS, RSIE);
     WR_REG(CR_IENABLE);
     RO_REG(CR_IPENDING);
 
-- 
2.25.1


