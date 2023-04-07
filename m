Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1116DB3AD
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 20:53:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkrBn-00053E-Lz; Fri, 07 Apr 2023 14:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkrBk-00052B-FU
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 14:51:56 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkrBh-000874-Fn
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 14:51:56 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 60-20020a17090a09c200b0023fcc8ce113so2031827pjo.4
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 11:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680893511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2qWjpSR7JS8/58Ywm9SNFYWb7gykfyATwi7wvhb4xc8=;
 b=d7QEVjRj8bLrUGAByzh3iK60WtnSRXb9Ei1/8vlsQ8rDTAg6gZWxiKGsqjBUtAZlqN
 dpEc2UVgl0qHQHF0uzUrONXWKFXsB2JhR4OKSy8X7us3pavVh660IYVoZzfcv6N66NVj
 GzfGp+BxAjNu4zCt1ZMOuQSLu+Myd31W1Sk4DeSE2vswuhWPBj5zzx5gVV6zyYmUVY0C
 ihUES38khSFyREVm20wMhRudEHbezQ7vF+jUeaVPpBukiK0rhZ1sknxeIMao4fiZDlEl
 DZjNNhm+jwCPyL7MoEfoZwJgqi/ymDDVQAl7mQPWJQS1hmDS7bdEa1HGNhK07WS29AlZ
 N9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680893511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2qWjpSR7JS8/58Ywm9SNFYWb7gykfyATwi7wvhb4xc8=;
 b=2UhhzB0/yD70gWSCiSl4MKcT+vsQGbnXCl20Z+lA2l/szG0zUnibvk9BI1fD4nS8YO
 thUShCzlZ9y3eHl57LbgVMBOjaFJby4ptrRSeEoiNoCQgIl/GPao/WJc0d6ek5L8vABy
 u+BfWvBphY91v/04X12LpBRS2jSOxd8NQCA/0+bj6VK+ljQ/kmKE/WSChSNknjywq6kc
 9p46RkiAaBRqvUroXIFU5PRH7V+I0XyPjGWuQnJnsoA2f85jw//6viCncQDBAHGrIm2/
 TjjDjavkvb4ttlb0JU8QE6vJsdEM7gdy4mxuudpFrimh/BjGoWOPU0ZKPk6RoHG1P/OI
 8y/w==
X-Gm-Message-State: AAQBX9fOAiBR7tzNbXWC2yi9EjN/bLDjNthJPeKt+cpEhHAlc3G+zR+a
 kxuhXF/P/y5Rz8GcJ65NAECNq9fiJHgL0LZpHl0=
X-Google-Smtp-Source: AKy350bD2aovWQLccuTINTSE0F9smMiAKd7FjCNX6LspR9WWUQqDDaxlogwkgsvqv8FzyI6mCDQUdA==
X-Received: by 2002:a17:902:cec7:b0:1a1:c82d:dcf3 with SMTP id
 d7-20020a170902cec700b001a1c82ddcf3mr12068847plg.12.1680893511072; 
 Fri, 07 Apr 2023 11:51:51 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a1709028d8400b0019c13d032d8sm3205796plo.253.2023.04.07.11.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 11:51:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 1/2] target/arm: PTE bit GP only applies to stage1
Date: Fri,  7 Apr 2023 11:51:48 -0700
Message-Id: <20230407185149.3253946-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230407185149.3253946-1-richard.henderson@linaro.org>
References: <20230407185149.3253946-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Only perform the extract of GP during the stage1 walk.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index ec3f51782a..58a6de09bc 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1585,11 +1585,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         result->f.attrs.secure = false;
     }
 
-    /* When in aarch64 mode, and BTI is enabled, remember GP in the TLB.  */
-    if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
-        result->f.guarded = extract64(attrs, 50, 1); /* GP */
-    }
-
     if (regime_is_stage2(mmu_idx)) {
         result->cacheattrs.is_s2_format = true;
         result->cacheattrs.attrs = extract32(attrs, 2, 4);
@@ -1600,6 +1595,11 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         assert(attrindx <= 7);
         result->cacheattrs.is_s2_format = false;
         result->cacheattrs.attrs = extract64(mair, attrindx * 8, 8);
+
+        /* When in aarch64 mode, and BTI is enabled, remember GP in the TLB. */
+        if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
+            result->f.guarded = extract64(attrs, 50, 1); /* GP */
+        }
     }
 
     /*
-- 
2.34.1


