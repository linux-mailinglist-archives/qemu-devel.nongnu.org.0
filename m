Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3A82603A2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 19:52:27 +0200 (CEST)
Received: from localhost ([::1]:40378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFLJa-0006Gj-05
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 13:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kFLIK-0004fc-Ky
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 13:51:08 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:33236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kFLIJ-0000kX-81
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 13:51:08 -0400
Received: by mail-pg1-x543.google.com with SMTP id e33so8338987pgm.0
 for <qemu-devel@nongnu.org>; Mon, 07 Sep 2020 10:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/iCHgyxkq9v43nhcSQtgg4n7M9LvoD8NgErTOXuCnmg=;
 b=g8zk1RdBa61GBirf1Ej5ISFHYe+2Av+drjkjjfZTS2Fmx/UZDFiW04dRML+UG2TYDq
 ImRVsmtiSKVOTy+ZFUCgAahY81NmQMYB40NDoumgpR+kOL/jwICjngvM8LZVgvwMa/IV
 bdV8uTJO6aDfvmNtHqDZp/Jx1Dkqhv+jz76ogrlNchGNgIBUfRjpv4pOyBBOfKmR16um
 2XO/CL3/b2MnufGhk6HqutEv7KcMCchDaVK+9xChNAbiJxYbAoV7AjthGexPPE9MKOSb
 YPkvSwiSVOxmZasoGc4RXabm4CfMptgUtJAWmrA3b+w3Kgl30NpOmLmjuwHL6DgPkh9S
 ZP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/iCHgyxkq9v43nhcSQtgg4n7M9LvoD8NgErTOXuCnmg=;
 b=FKdhyOxDbgCa92GTUh4m/7s4QJJREvh7uyHGfR0Vg72S2yLqx53Y1b5AhXeiiN6tF4
 Sft61nAQ2GmGwPu+uQJBMR9jUmIy9u0DFbNrzgoQSXFGtqG3hH5dUbVnUvDI3jfVbJCh
 cHpyn+L8ayna2EexzN85jVKP8V9IHiDZdBjoDW5u0x8JA37/6/rAl42F0gZqGmtfOxe/
 ZqFKEKaps5eiXVgCDIebridsMDqpns4xZGiCCjV5qR+v+G6vg93Al1w6XEupxrxULx1l
 dOaPwMILFj6hIHma+MAcWbTvMqvycdBRq5ugetfsIXR/qSzU2to5MWqxcvZoVJcG2aVm
 UUlg==
X-Gm-Message-State: AOAM530G028Z2BUYxRm7zDEs8hX0TrDsVCB4gNhXr9X9L21ekBryjvcy
 JyyMKX1x5xuolzZj3rp4xr710uqbseVjug==
X-Google-Smtp-Source: ABdhPJwSfI9O25Kgu0siLoVszF6IBvHMaQNEWs53laJLJe6m+1FQmeAfcX/8kXCoDRTQuxh20lVY5w==
X-Received: by 2002:a63:ff01:: with SMTP id k1mr6885043pgi.141.1599501065563; 
 Mon, 07 Sep 2020 10:51:05 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id ga3sm1651496pjb.18.2020.09.07.10.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 10:51:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/hyperv: Fix 32-bit build error for vmbus.
Date: Mon,  7 Sep 2020 10:50:43 -0700
Message-Id: <20200907175102.28027-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907175102.28027-1-richard.henderson@linaro.org>
References: <20200907175102.28027-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: peter.maydell@linaro.org, Jon Doron <arilou@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

../qemu/hw/hyperv/vmbus.c: In function ‘gpadl_iter_io’:
../qemu/hw/hyperv/vmbus.c:383:13: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
  383 |         p = (void *)(((uintptr_t)iter->map & TARGET_PAGE_MASK) | off_in_page);
      |             ^
cc1: all warnings being treated as errors

Fixes: 0d71f7082d7 ("vmbus: vmbus implementation")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Jon Doron <arilou@gmail.com>
---
 hw/hyperv/vmbus.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/hyperv/vmbus.c b/hw/hyperv/vmbus.c
index 75af6b83dd..3482e9c6cb 100644
--- a/hw/hyperv/vmbus.c
+++ b/hw/hyperv/vmbus.c
@@ -380,7 +380,8 @@ static ssize_t gpadl_iter_io(GpadlIter *iter, void *buf, uint32_t len)
             }
         }
 
-        p = (void *)(((uintptr_t)iter->map & TARGET_PAGE_MASK) | off_in_page);
+        p = (void *)(uintptr_t)
+            (((uintptr_t)iter->map & TARGET_PAGE_MASK) | off_in_page);
         if (iter->dir == DMA_DIRECTION_FROM_DEVICE) {
             memcpy(p, buf, cplen);
         } else {
-- 
2.25.1


