Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEEF36F8EF
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:07:28 +0200 (CEST)
Received: from localhost ([::1]:49558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQzX-0008DE-Q8
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUN-0007ri-Br
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:16 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUA-0001Ml-Dp
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:13 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 p6-20020a05600c3586b029014131bbe5c7so1436905wmq.3
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DiF32QeCsZqW+MwIB45pg6ndEJiiUl9cfXFtev1sD1o=;
 b=XuFCK+LWmqAZ4GWyBGdEFCEbQv7YdbHZzmrSIbU+WIKdkPmgzmXyeZJdRqdttvSiiA
 zURrrX4gmXZ4yZGOSDfXQdJ3pPM+jQD+gYTv4r5ni5I2FYQi6uu2RXAi6cEISpdUR+LL
 5JAdGvoCDHye/ekVa1x9oD18JlOUmeHn6d7xfPFqpPzWEnxkDFlllSJMkUjMaDiUXYgG
 Sl3x682D8g/Qz2D3YCHK39tUt7hs2iipqGYE2iYkCpbWIwwS7c5F9WN79J0zYHTbZRXA
 zxb4dyfy4/ZHq820S/rxEsEMm0qcV515FvZAOcvN8yVQJxwViY5nFbB7jv8e81un3OE+
 NKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DiF32QeCsZqW+MwIB45pg6ndEJiiUl9cfXFtev1sD1o=;
 b=MuFHypcR0Jsf25xOk4FSwGP7Zmq1y3AWmBmFyFf38bdP5aCuQyMna4ON6p85inNl2D
 u0ku2hrsFMYiZ6hHO//v011X5zcR8bdr4SBphX1EytlEMDLfUaZFLhgxSMrG9OwaCEPv
 uxSsWbIzLPbuY8srLpnVhh7UsmmyZJ3wd7K6x4x25MzUfnedaGoh8BtgB/hXkC8KGq3w
 eKO/p8knFWR0qTPcQRpSPuQIRXQiw1qXJVMsIAEiRNnMMDfvYZsDm6auDdOttwl2gqdQ
 vXWNE5o5xV8Sy6DaxtNneLbnc6pr/QWQmD4aMMWxJLcRBVhGMPvttlc7+Na2qCeiXFxn
 Y4NA==
X-Gm-Message-State: AOAM533ryCccvw6o6wG8eDAaGtjnLbTN9BLZRUgO9pEO/GGQLR5e9uDp
 QfRbtxBEiCrwe+xYJ6lkHX+Ni2kNyQWLAH8o
X-Google-Smtp-Source: ABdhPJx5WmWbFgTOvjnnqr1/4WT2ZLTu6wg8iUZCpjjjd00FIhjEWM36h1yjziu6GpRTjFO/3QxQiA==
X-Received: by 2002:a7b:c103:: with SMTP id w3mr16048791wmi.137.1619778900293; 
 Fri, 30 Apr 2021 03:35:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.34.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:34:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/43] target/arm: Enforce alignment for RFE
Date: Fri, 30 Apr 2021 11:34:22 +0100
Message-Id: <20210430103437.4140-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210419202257.161730-19-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9095c4a86f3..b8704d2504b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8357,10 +8357,10 @@ static bool trans_RFE(DisasContext *s, arg_RFE *a)
 
     /* Load PC into tmp and CPSR into tmp2.  */
     t1 = tcg_temp_new_i32();
-    gen_aa32_ld32u(s, t1, addr, get_mem_index(s));
+    gen_aa32_ld_i32(s, t1, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     tcg_gen_addi_i32(addr, addr, 4);
     t2 = tcg_temp_new_i32();
-    gen_aa32_ld32u(s, t2, addr, get_mem_index(s));
+    gen_aa32_ld_i32(s, t2, addr, get_mem_index(s), MO_UL | MO_ALIGN);
 
     if (a->w) {
         /* Base writeback.  */
-- 
2.20.1


