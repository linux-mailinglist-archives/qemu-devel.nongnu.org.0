Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3B36AABCF
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 19:20:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYWTZ-0006Tx-Oi; Sat, 04 Mar 2023 13:19:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWTS-0006QN-Mx
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:19:14 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWTR-0003Ne-8a
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:19:14 -0500
Received: by mail-pf1-x430.google.com with SMTP id y10so3421557pfi.8
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 10:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677953952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5UwUYgI1qBBmzGL8lHSf6ndjeIZ/lkTM7FpzJkl1le4=;
 b=ZEpR9qnGXXy3wtf0zu3UR6/7hZKk8uxGVEIxV1WLqaflS56nnifXwPcPpGhNVSLadG
 DlSzZE1RQDsLYhBtsbNXKoZWbHWNIqtfPHYRbmEozDP7hNk1nzK5gLm49dXnAalTITnw
 NRPATJPtl8mD0gvi9hHNHdsNFxtRdfKtH7nE+8ASPIazN6qa+Vm/MDh4LpWXZhdAoU+g
 qItyoGJ4yNwuATh9g7dxiXIUFaOtmwrTL2g3jaEZ1w6wdLs4fJ/Y+Mve7eZQBr4vRxZ1
 ZLCGQTtjF0RjwEIeJj0VGozMVNpCJpS4RStgngeCf3vpS/y2d+WrTOmwVBE78QFNgcKb
 KjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677953952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5UwUYgI1qBBmzGL8lHSf6ndjeIZ/lkTM7FpzJkl1le4=;
 b=A5m4WI+NC5RsoKAYsCRpq9w6NXWc3zsB6JGcOE3/iPwVZnLE3SmkgHNcDodlwjdXpx
 OFYrnbahHeMJV390OIx/0Bp3r0xHdbwQC8URRa7nsm65yvWE8zGsXYOGGKrcfvE69gDC
 41s8zr5YCzYjVN0tFRkYivot2C7ldXuyxHkQrKm3Xh2fdBn1EDXwX+SNoaSrI5Wpf4W9
 kWEPw5zRavVU5PK8X8V/TCFAKT1IGTOpdMI2vdEKykHfhFDwwC+695w8Gv4Vuj5dfvh2
 wJVSlvxOnamczoi/J0FUiDXb1emOcOuiQ7kGi2oHCc7f1pEPhbGiB6VkEkDHn0owdrqp
 233g==
X-Gm-Message-State: AO0yUKV7koefrdKCrTb4K8Pi93YjrZVxpe1YSZ8mxg7qX0CtXj+v4rJW
 G0wo/TREbM+Nw3q4sXiL68TyIYjC7Axl/aGwl1jQcQ==
X-Google-Smtp-Source: AK7set/gTjS786ddrIRm6L/4kdyMSGAC5q57ThL6FUSZjHKJ5y7rA+GgimlQ7nDPP478NPPwvYCkaA==
X-Received: by 2002:a05:6a00:796:b0:5a8:e3d5:d7d4 with SMTP id
 g22-20020a056a00079600b005a8e3d5d7d4mr9302178pfu.7.1677953951884; 
 Sat, 04 Mar 2023 10:19:11 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:62b1:64d8:8207:f04e])
 by smtp.gmail.com with ESMTPSA id
 25-20020aa79259000000b005d866d184b5sm3529668pfp.46.2023.03.04.10.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 10:19:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH v3 11/20] target/mips: Drop tcg_temp_free from
 vr54xx_translate.c
Date: Sat,  4 Mar 2023 10:18:51 -0800
Message-Id: <20230304181900.1097116-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230304181900.1097116-1-richard.henderson@linaro.org>
References: <20230304181900.1097116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
---
 target/mips/tcg/vr54xx_translate.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/mips/tcg/vr54xx_translate.c b/target/mips/tcg/vr54xx_translate.c
index a7d241e4e7..804672f84c 100644
--- a/target/mips/tcg/vr54xx_translate.c
+++ b/target/mips/tcg/vr54xx_translate.c
@@ -49,10 +49,6 @@ static bool trans_mult_acc(DisasContext *ctx, arg_r *a,
     gen_helper_mult_acc(t0, cpu_env, t0, t1);
 
     gen_store_gpr(t0, a->rd);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-
     return true;
 }
 
-- 
2.34.1


