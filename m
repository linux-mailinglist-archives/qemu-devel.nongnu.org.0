Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6205F1501
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 23:36:53 +0200 (CEST)
Received: from localhost ([::1]:43086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeNgi-0003Z6-NZ
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 17:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNWk-0005um-2Q
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:26:34 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:34742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNWi-0005NJ-E8
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:26:33 -0400
Received: by mail-qk1-x72f.google.com with SMTP id g2so3622883qkk.1
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 14:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=FcUiK2Okdru3cG4LiS1rgcAo1RAHSsbMmma9k9kUJWI=;
 b=M/vYG3g7pBcDMupCoDn3WfBcgdaFwjO23mq2B70iQzSKpCv0IeE5jHTfJI5fVLT1E0
 PgI0Orj1mKrCAH1NhBZPBW0BmMzJfAHWDfn0wFqIo6Ir9Yo4g0Yrx42qUAZrdPduAs0C
 nKeiu1JeKKr45k60si+HolYZeGPtoQrAbX/+JpWaek7G3OXyfxX+O229yJTxJR1Ui/w9
 O83M8VhOH0+s2BdPv3M+sWErbyOsRVMa66z9pmmi9Kx0K1N/gRSMfJm9IvSlTJ+YwnhI
 5EZaYaQ/X4skWGpAq9Bxu585DCazSoAp/hPu0V8M1EraIqP4aKAXPHsiN7QqXwLQACwo
 /8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FcUiK2Okdru3cG4LiS1rgcAo1RAHSsbMmma9k9kUJWI=;
 b=7fv7tJPAx5GaSGWf4zh1/KLBsO0xgk/6G0dwpO8zgm20ka2t8GI4IVbqOqCj8MUi1K
 hUr+zMSbKMuuDD2u8U/Lz8+VzslCYJlK7aJjIcC8c9t3KC9aT22jdxdW+JXG+KJ4PFsw
 430S3zzFL/8B+Txmp8jdEH8PYDqVoYWiU/jf5Et8HyiG/ixnOcoxHJIiMv17x5rJucQh
 HCkvtqFynre+pSydtQIDNcsDEvoAcRiAT5RI+P5IdAt36jZKwLDCtxR48aQJXNBY6YIT
 rz0tEu32aZ6K+P+jIlaRYYqENS1vmze+GFxaPWZmF8GCxgpIHOTxuDKye3FhNfKUHy0r
 fvyA==
X-Gm-Message-State: ACrzQf3+tA4DyKHm3WNw4w5+1UyZtnbMGf1iZudrOk9U7DvkhcFRB/j6
 /BqMfrN0aeusEAJQUWjVsdiE1Fs9Xx/9sA==
X-Google-Smtp-Source: AMsMyM6loljQRd6cl4HV3UCyakLRfBTm65jW08ySn2YeIn5/YxSqYO2KALAAdswRzWp37hnb6tdkEg==
X-Received: by 2002:a05:620a:29c9:b0:6ce:a961:af73 with SMTP id
 s9-20020a05620a29c900b006cea961af73mr7625044qkp.226.1664573191390; 
 Fri, 30 Sep 2022 14:26:31 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a1:5a60:d0d7:468b:5667:114b])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05620a28d200b006ce813bb306sm3696370qkp.125.2022.09.30.14.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 14:26:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linux.org, alex.bennee@linux.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v6 02/18] hw/core/cpu-sysemu: used cached class in
 cpu_asidx_from_attrs
Date: Fri, 30 Sep 2022 14:26:06 -0700
Message-Id: <20220930212622.108363-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930212622.108363-1-richard.henderson@linaro.org>
References: <20220930212622.108363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Alex Bennée <alex.bennee@linaro.org>

This is a heavily used function so lets avoid the cost of
CPU_GET_CLASS. On the romulus-bmc run it has a modest effect:

  Before: 36.812 s ±  0.506 s
  After:  35.912 s ±  0.168 s

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220811151413.3350684-4-alex.bennee@linaro.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220923084803.498337-4-clg@kaod.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/core/cpu-sysemu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index 00253f8929..5eaf2e79e6 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -69,11 +69,10 @@ hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
 
 int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
     int ret = 0;
 
-    if (cc->sysemu_ops->asidx_from_attrs) {
-        ret = cc->sysemu_ops->asidx_from_attrs(cpu, attrs);
+    if (cpu->cc->sysemu_ops->asidx_from_attrs) {
+        ret = cpu->cc->sysemu_ops->asidx_from_attrs(cpu, attrs);
         assert(ret < cpu->num_ases && ret >= 0);
     }
     return ret;
-- 
2.34.1


