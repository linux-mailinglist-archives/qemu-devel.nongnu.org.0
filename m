Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 552684572C6
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:22:41 +0100 (CET)
Received: from localhost ([::1]:39734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6eu-0002RC-FI
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:22:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6Ok-0005rs-JX
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:58 -0500
Received: from [2a00:1450:4864:20::32e] (port=36646
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6Oi-0004MN-T3
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:58 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso10873846wml.1
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tGtNLXcWOvrcTLji2ClQOvIyc/zLp7dG4I24EvpNZ/Q=;
 b=jC7nb+5FC5fZCgAlT//OA8cuOEAuciivUVE/n3mzG18iTI71hmIJLHnOByt2sB4D3Y
 tHzPsisVcq9SE4xhkL4RJW8ta+s53miqa43F6ZuZXYDYTbvsP4sGGnUaxzpryCOVwGER
 sWkS7vBCSMiFEmnx53OXF+slSuox+pBlYuxwpGajRNDfZ2k+Uky8FBl7Drkg4im9FsuN
 yxstZlPaIXFdh6seq/cR1U18MGarMvyqDGkaBmcR2Ucf1QBDatpAvnpkDYvkuPfRchDz
 FxhMvDtdllGfnWYan7AtttARSDxf7Rag79ZXa3PW+besQMsMYCz4WiobEY+pxTG1q7V6
 s+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tGtNLXcWOvrcTLji2ClQOvIyc/zLp7dG4I24EvpNZ/Q=;
 b=lziIFY+utlKmcI3BgeomylAAEPnFxXbbEpLbtvRVm13dLxS2xosmhVYiLN+YSwJQrQ
 zmecZbvXklRtKA7SYt7YSqTQUqe8OTqQ6nTuvv/gJzMXZVgydFGuBtxFMioZgmqxEENS
 UlVNlT7RO7vMEYAuALkEWoXfAk7Fr6pm9oK3HEXWNI71gudQNBQgDumcqbsdhHqCIKdF
 M6dkTiSdQXpUDzyLZYUy1tz2XDzCxcgG++GfhxIZnJ7YAt8l1hMERooScVTWbe0YY79J
 Ahbh5bUqUrApC8vGQzx6eJXxTkn70GlPyngvTvcZ3zyF7FXOlve17M69MGcqXJvS5+No
 aQRA==
X-Gm-Message-State: AOAM533GKDn7LCh3se0ya3YzqIKwuS2TCsBBIaj3LycPpIyNCMWbs/+Z
 yTw1/G3pfhMPrvUP0izwpuTbhK7Tg5YRaFAwwb0=
X-Google-Smtp-Source: ABdhPJymOxwjxZ0epym9M2KRE84woHRbUlhagyX8imscsru62wQXftUBaa0Zp9AydRsnaxEMAJ3OIA==
X-Received: by 2002:a05:600c:1e06:: with SMTP id
 ay6mr978406wmb.64.1637337955606; 
 Fri, 19 Nov 2021 08:05:55 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:05:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/35] target/ppc: Do not call do_float_check_status from
 do_fmadd
Date: Fri, 19 Nov 2021 17:04:47 +0100
Message-Id: <20211119160502.17432-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, alex.bennee@linaro.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will process flags other than in valid in helper_float_check_status,
which is invoked after the writeback to FRT.
Fixes a bug in which FRT is not written when OE/UE/XE are enabled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/fpu_helper.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index d2a7bf5e63..e0c35a3977 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -651,11 +651,8 @@ static float64 do_fmadd(CPUPPCState *env, float64 a, float64 b,
     float64 ret = float64_muladd(a, b, c, madd_flags, &env->fp_status);
     int flags = get_float_exception_flags(&env->fp_status);
 
-    if (flags) {
-        if (flags & float_flag_invalid) {
-            float_invalid_op_madd(env, flags, 1, retaddr);
-        }
-        do_float_check_status(env, retaddr);
+    if (unlikely(flags & float_flag_invalid)) {
+        float_invalid_op_madd(env, flags, 1, retaddr);
     }
     return ret;
 }
-- 
2.25.1


