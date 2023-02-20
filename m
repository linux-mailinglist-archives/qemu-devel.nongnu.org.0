Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F4369D706
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 00:28:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUFYQ-0003jT-HE; Mon, 20 Feb 2023 18:26:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYO-0003hz-NU
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:26:40 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYN-0000JI-30
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:26:40 -0500
Received: by mail-pj1-x1029.google.com with SMTP id o16so2898252pjp.3
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 15:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mH7WMawWeBvYR6Z0Haoxdyec8KWtOPSKDJkaIsK10I4=;
 b=nvVlE274/tK3ExBcRxUCRMfxZtDgtaXLidNuM/h88+aFHH42rv7txuXLvJPi9QU3wp
 ST3DgC+FuSc9yh1ld89cVh8o5MzK4ChA+tekjIZtUTZMgjePQEXcsVExbfOk3wkgPjR6
 szfXtyxk6/gBYsYUgJhNnK74rj5n2OMRlsp2ByKYR3+j4/3oYY3a33LB5HlZfmd7CttQ
 E19d0y8QLxc+Fn6AGFhR5OgB395ccd2I0JvbuZ+yg5OjyDEIqzQow16l2Sgu/dW6gC9+
 NDl6gvlS0FYXm5FpT++5WMa/v32hP4GbcesMDaNh/Zv5vsQj2dfTAMasFn6EBUjGaEgU
 ev0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mH7WMawWeBvYR6Z0Haoxdyec8KWtOPSKDJkaIsK10I4=;
 b=ldRfqjNF6JHUuZdgD9R7b82vObrJDTHuAubhrEBCGk18t+5VOVIiwdme31wD8sZzHl
 jmnHYMDRs2yMKmyMCysD0wCCtlYTZvOPYB+f+DMTOnXxOI8pFLF4Rm9PDYgVHpjowHhN
 d5HqgecPFinvYkJllL4i69VYLngr4LVGMprSYkMUUyrboat62qUcqqfWm74sg3yonJVd
 rUzcfLnk3sJEijzgBYDaFrDiLNwEOdPZxa8vhHpbwhRzwV9UYtOB09m5B5V0Gkvadyve
 zkjRTBEZhsdtLKqxeXkI1F+RvQCOwRhXgFC/SGvVLrxppTryOTd2qmDzY18eBpHwHun1
 vShQ==
X-Gm-Message-State: AO0yUKUTiBPeKwDsQKOXqmVvS2X0FtX+iN8CTqGhD+8/2KFgggSjD04H
 fO96LqOlHc+GxKJPHfB7OflD249ZnWQdj3KdrE0=
X-Google-Smtp-Source: AK7set/ojI5y0ewTqhcrZqUuupCMsC9mJ+gKhvVZNFaMgw+NgMyhWXSBV9GcEdcFcPeiEKtSw7G2Mw==
X-Received: by 2002:a17:903:2808:b0:19a:ea48:730c with SMTP id
 kp8-20020a170903280800b0019aea48730cmr1919079plb.46.1676935597252; 
 Mon, 20 Feb 2023 15:26:37 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902690a00b001992e74d058sm2665348plk.7.2023.02.20.15.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 15:26:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 04/21] target/arm: SCR_EL3.NS may be RES1
Date: Mon, 20 Feb 2023 13:26:09 -1000
Message-Id: <20230220232626.429947-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220232626.429947-1-richard.henderson@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

With RME, SEL2 must also be present to support secure state.
The NS bit is RES1 if SEL2 is not present.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 42d94e0904..2ebca3e2b6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1856,6 +1856,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         }
         if (cpu_isar_feature(aa64_sel2, cpu)) {
             valid_mask |= SCR_EEL2;
+        } else if (cpu_isar_feature(aa64_rme, cpu)) {
+            /* With RME and without SEL2, NS is RES1 (R_GSWWH, I_DJJQJ). */
+            value |= SCR_NS;
         }
         if (cpu_isar_feature(aa64_mte, cpu)) {
             valid_mask |= SCR_ATA;
-- 
2.34.1


