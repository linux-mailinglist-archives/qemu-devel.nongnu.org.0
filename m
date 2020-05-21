Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F3A1DD36F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 18:56:23 +0200 (CEST)
Received: from localhost ([::1]:49576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jboUF-0001el-7a
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 12:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jboIX-0003AH-5I
 for qemu-devel@nongnu.org; Thu, 21 May 2020 12:43:57 -0400
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:35890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jboIW-0006ZH-9G
 for qemu-devel@nongnu.org; Thu, 21 May 2020 12:43:56 -0400
Received: by mail-qk1-x742.google.com with SMTP id y22so7877338qki.3
 for <qemu-devel@nongnu.org>; Thu, 21 May 2020 09:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O0fBrT3P1tRSLH4phcxb7WjFxDduimB9rIeQgvMHfic=;
 b=Nfc2kIvSPenViflfeJM4tjswpI4JwXKOCODAyP/Itoxn5rdYCVYjQD+MHLXotXd1vG
 JVohFIhLLVnNh5VVHD7Y5jkowCoDM/aNYUCGeRic4azba+iVBe8XzxG6PH0F/XDp97Cy
 XJczMJ6HR2E+agnQsjMpSmv6Gi1a4oCv85tVqPkw8nNLlubJ3R6cun3/UWpvrage2E+f
 wSavcfef4cVnzGMqCkca+ggKc5neCUsz1qz+bqwmwP7cy79eE10diotJPGjgRrAU6MZ0
 m4lRtUDSOaKAg4asH98bPpyZWzm3xXoCWwyz5T/uVjfWwJ/mASHeoGiPdfFhQY1pJHwU
 RqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O0fBrT3P1tRSLH4phcxb7WjFxDduimB9rIeQgvMHfic=;
 b=YxhwCWegS65z5hOq4sTWiSEV3b2N9eCTtMl/dF+jstWZ6RxdlJeA4RVM2GUDpWL7rW
 nCEs3n9s8gmBucBvVf5XNdUYCNxkqUQS6Lcg53AhehIXaNNbFguH03aWuqrl9WscQ09N
 obMIP1IIQn4XFxwoBAG9G3MwNOpvWJ/dOGpJ3/HllJgx6qt/mu//4ubjz/71yWMzDSJn
 uPUTOfHzIbyX8rrgLdw+H74Ttv+0VIzbrKWCiCLypAK5KUSUM2MSXA4KXwsIPHpD+BH4
 zFAMy83vkY5Tsy3PxFPtDokG9YnSiK8D2ACkDf5un5vcgeXqhu+SDfjWrYuvLrrpTISQ
 V4cQ==
X-Gm-Message-State: AOAM530vfmGSB7qaE8NuPakwgwj7Ypv4Vj/cJumCyYX/Lsz6ZtIRdDoQ
 RcoHQKcGlXBxk8Ox+VcF4kbkpkBGH05aRQ==
X-Google-Smtp-Source: ABdhPJw0uY5hxNe8Voh6Zzw77Wfi79mdVgVdf+ls36Xz9W/K6hYqMQmPEKZ/zEIJlwNwbgY1vIGhFQ==
X-Received: by 2002:a37:b144:: with SMTP id a65mr10557733qkf.462.1590079435014; 
 Thu, 21 May 2020 09:43:55 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:1944:c530:655c:5583])
 by smtp.gmail.com with ESMTPSA id x24sm5923829qth.57.2020.05.21.09.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 09:43:54 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 30/74] openrisc: convert to cpu_halted
Date: Thu, 21 May 2020 12:39:27 -0400
Message-Id: <20200521164011.638-31-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200521164011.638-1-robert.foley@linaro.org>
References: <20200521164011.638-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::742;
 envelope-from=robert.foley@linaro.org; helo=mail-qk1-x742.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: robert.foley@linaro.org, richard.henderson@linaro.org, cota@braap.org,
 peter.puhov@linaro.org, Stafford Horne <shorne@gmail.com>,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Cc: Stafford Horne <shorne@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 target/openrisc/sys_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
index d9fe6c5948..2615571ce7 100644
--- a/target/openrisc/sys_helper.c
+++ b/target/openrisc/sys_helper.c
@@ -134,7 +134,7 @@ void HELPER(mtspr)(CPUOpenRISCState *env, target_ulong spr, target_ulong rb)
         if (env->pmr & PMR_DME || env->pmr & PMR_SME) {
             cpu_restore_state(cs, GETPC(), true);
             env->pc += 4;
-            cs->halted = 1;
+            cpu_halted_set(cs, 1);
             raise_exception(cpu, EXCP_HALTED);
         }
         break;
-- 
2.17.1


