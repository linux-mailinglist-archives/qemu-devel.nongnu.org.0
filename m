Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077BE2FBB0B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:24:29 +0100 (CET)
Received: from localhost ([::1]:59676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1srr-0006yX-Ug
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:24:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfH-0007ht-FZ
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:27 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:54970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfA-0001Ft-FJ
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:27 -0500
Received: by mail-wm1-x333.google.com with SMTP id i63so63390wma.4
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Bgw0IoVQc5jfS/jOJVPouYGj93maDzWFb/0klbk3tEY=;
 b=PyP0Ldp93N9Gp0L0A+H1BR4O6+p4e9QfDCUOWmKRMlc+kDgYGa9ks/3UIyG4esWELU
 v0XyQp0ad7MptycjDzmOPerQ6W/E8jtlcWXURE+HilIqiNjaWNodPQtog3DAxO9NdXqF
 rStTY9oBoz5aDIvVDJ+Xk0MqUCw3J9FmCH3goJh/oOStY+PATPk0+lBVIfHq9Wy0iURY
 YrLEf+t7+jDjiGXI0igWVS7WxFJADTr0J5btftD/QlnWDFNoo0PBZq6KdB8W/j3Sd3ni
 Bbw70u8tBoQK8fuyJt755IlAocASC9tS4sdfsjleMC1J3vXJmbVI1WRK1//SdN10bqQD
 jRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bgw0IoVQc5jfS/jOJVPouYGj93maDzWFb/0klbk3tEY=;
 b=Vo9YrryypfZrDrsrKo7qhEbFE9/XIuNK4eJ6bAgI3WE78dxeM8y+5ueG5GZLib4TMg
 sAn/BjrAi25G7sSbQUwRTpwVWu1HprDVln7mH+bh8VCkzsl7+lv8wdit8XmyQj56XH8D
 Tqlcb4pb0ObjbSZ9g4b2Yxk2NCZNuxG40OK8+7lFibHzdIxnwjDOFsC7YikBOufmkWA7
 uLRrEqiZzvk+4hKB7aNklI3QQEZVMBS4y6UXgS02berdXhqfd1MIHpBPUD5SNB1fApRt
 nQoyQtxuzv2llpSmAA10n5gHjKAQD3Fsbz2ZMrCZoKTuboqG8DSqENh6+0J0kPYI5ojf
 yMGw==
X-Gm-Message-State: AOAM532s6jfjBCsrD48CIf1KifghkX+K8E/y+AHeU2DNtmiR9lPwi7Bi
 0uUeWrN/3UktG5+AhC+EZvnlsRzc3E31xw==
X-Google-Smtp-Source: ABdhPJxBgZhkkf5aCZXZGh93viSduRKk9K58qwsmKYXMYLrWZlAAvqxK4oONLN1cFBXAj287mo+Uzg==
X-Received: by 2002:a7b:cd90:: with SMTP id y16mr73271wmj.115.1611069078895;
 Tue, 19 Jan 2021 07:11:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/33] target/arm: translate NS bit in page-walks
Date: Tue, 19 Jan 2021 15:10:46 +0000
Message-Id: <20210119151104.16264-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210112104511.36576-12-remi.denis.courmont@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ae0ccf72f58..521f85a695a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10430,6 +10430,18 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             fi->s1ptw = true;
             return ~0;
         }
+
+        if (arm_is_secure_below_el3(env)) {
+            /* Check if page table walk is to secure or non-secure PA space. */
+            if (*is_secure) {
+                *is_secure = !(env->cp15.vstcr_el2.raw_tcr & VSTCR_SW);
+            } else {
+                *is_secure = !(env->cp15.vtcr_el2.raw_tcr & VTCR_NSW);
+            }
+        } else {
+            assert(!*is_secure);
+        }
+
         addr = s2pa;
     }
     return addr;
-- 
2.20.1


