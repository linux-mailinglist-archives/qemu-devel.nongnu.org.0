Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C4B1D88EC
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 22:14:01 +0200 (CEST)
Received: from localhost ([::1]:54798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jam9A-0002mz-ON
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 16:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jam5l-00066Y-4V
 for qemu-devel@nongnu.org; Mon, 18 May 2020 16:10:29 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:41351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jam5k-0002Fe-Gn
 for qemu-devel@nongnu.org; Mon, 18 May 2020 16:10:28 -0400
Received: by mail-lj1-x243.google.com with SMTP id v16so7206109ljc.8
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 13:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jR9L/wbg4aQ0cuRy0qRNTwprcuRVrceB2F0RYIgLz9Y=;
 b=Rkur4t1h2MSgpXEayY7CNNbZ5XmBFsUqZHKp1JpxHwFNkud9pV7yavFOpYXc4fT5Vd
 ZtlTyy0MgUpRamAIh83WDVVTN7mGda0NyBls+yWNaklZ8MKS1RhR6rSrQ5FDPZrBoAvl
 zdMLzrBT+yIe7XnKTwAkyMhjcFbWkz/E4HF/qaQrK60zLQi1gVNhWpRvTeO4GvR5ERqq
 U+DHT8/1rH44pflLkQR+R3NuGRxFFQs1oaiHVKAhuQ0qBEY0Mk/8CtKThPQ0sUdXewlq
 wNsJP9PenWb8CZo9LDAkJ5y0X/wKetp+lU783nqbhsKOySVvg24rC7nPeuyPaVWMOUeg
 IprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jR9L/wbg4aQ0cuRy0qRNTwprcuRVrceB2F0RYIgLz9Y=;
 b=OW7bf2AtcrLaKgrD2h1x9PJFjWB8RJsmvXfhl9UcACSUG2tOFT+RCXhrBIQIFeDLh7
 FDM47PB7A2CiIRImJOKGr/sl47sNjqwkYl5hoddJUMYlJj5y1DpegI9yYyN0wXosslly
 yEG+fMsOf1MSpUN4hb0fcf/PvEaYf0LC2Jm/lMm3wKuDL9RR1UXFViLxMSYvRMLE9/T+
 mBwDmcx4GqXVTqgVP4OVAn4hH5zkbqbKN9VCiL/iFVcaUV6nfi6WbAUQ7pB3bj1Ex+Rg
 hqPoydPUp5o40N2FqS1sHYr2CFjVKgKxnwhVsmv3KsozCcYX1R3ll//10jyiD0/dJEmV
 2d+w==
X-Gm-Message-State: AOAM531dVjWc6Nu/EFtTIstiHJAkjTL2pyiHJKIaSF63T+MdGwH9iIbS
 JlzM6uyXUkaTLN7NCy1yxNlFzqe1kqk=
X-Google-Smtp-Source: ABdhPJxKcT/C3M2n/VGscsNG01sb8ufdNG85ioDieoSwxTRXWs11u+wYirRgXAh6N0vDlyyOOCr+MA==
X-Received: by 2002:a2e:9917:: with SMTP id v23mr9566080lji.254.1589832626662; 
 Mon, 18 May 2020 13:10:26 -0700 (PDT)
Received: from localhost.localdomain ([109.245.227.98])
 by smtp.gmail.com with ESMTPSA id c78sm8700591lfd.63.2020.05.18.13.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 13:10:26 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 03/21] target/mips: fpu: Demacro MUL.<D|S|PS>
Date: Mon, 18 May 2020 22:09:02 +0200
Message-Id: <20200518200920.17344-4-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200518200920.17344-1-aleksandar.qemu.devel@gmail.com>
References: <20200518200920.17344-1-aleksandar.qemu.devel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::243;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-lj1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_PASS=-0.001,
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
Cc: aleksandar.rikalo@syrmia.com,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is just a cosmetic change to enable tools like gcov, gdb,
callgrind, etc. to better display involved source code.

Reviewed-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
---
 target/mips/fpu_helper.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/target/mips/fpu_helper.c b/target/mips/fpu_helper.c
index 715a872cae..449e945166 100644
--- a/target/mips/fpu_helper.c
+++ b/target/mips/fpu_helper.c
@@ -1208,7 +1208,6 @@ uint64_t helper_float_ ## name ## _ps(CPUMIPSState *env,           \
     return ((uint64_t)wth2 << 32) | wt2;                           \
 }
 
-FLOAT_BINOP(mul)
 FLOAT_BINOP(div)
 #undef FLOAT_BINOP
 
@@ -1284,6 +1283,42 @@ uint64_t helper_float_sub_ps(CPUMIPSState *env,
     return ((uint64_t)wth2 << 32) | wtl2;
 }
 
+uint64_t helper_float_mul_d(CPUMIPSState *env,
+                            uint64_t fdt0, uint64_t fdt1)
+{
+    uint64_t dt2;
+
+    dt2 = float64_mul(fdt0, fdt1, &env->active_fpu.fp_status);
+    update_fcr31(env, GETPC());
+    return dt2;
+}
+
+uint32_t helper_float_mul_s(CPUMIPSState *env,
+                            uint32_t fst0, uint32_t fst1)
+{
+    uint32_t wt2;
+
+    wt2 = float32_mul(fst0, fst1, &env->active_fpu.fp_status);
+    update_fcr31(env, GETPC());
+    return wt2;
+}
+
+uint64_t helper_float_mul_ps(CPUMIPSState *env,
+                             uint64_t fdt0, uint64_t fdt1)
+{
+    uint32_t fstl0 = fdt0 & 0XFFFFFFFF;
+    uint32_t fsth0 = fdt0 >> 32;
+    uint32_t fstl1 = fdt1 & 0XFFFFFFFF;
+    uint32_t fsth1 = fdt1 >> 32;
+    uint32_t wtl2;
+    uint32_t wth2;
+
+    wtl2 = float32_mul(fstl0, fstl1, &env->active_fpu.fp_status);
+    wth2 = float32_mul(fsth0, fsth1, &env->active_fpu.fp_status);
+    update_fcr31(env, GETPC());
+    return ((uint64_t)wth2 << 32) | wtl2;
+}
+
 
 /* MIPS specific binary operations */
 uint64_t helper_float_recip2_d(CPUMIPSState *env, uint64_t fdt0, uint64_t fdt2)
-- 
2.20.1


