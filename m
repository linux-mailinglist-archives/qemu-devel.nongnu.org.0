Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C82B4D1112
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:34:54 +0100 (CET)
Received: from localhost ([::1]:53380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUMv-0000C8-Cj
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:34:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9G-0005GL-Q3
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:52 -0500
Received: from [2607:f8b0:4864:20::42e] (port=46756
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9A-0006OG-Q9
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:44 -0500
Received: by mail-pf1-x42e.google.com with SMTP id s11so16555752pfu.13
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j21dTyIj41G0K43gYWwqQRtlgt2XT5TcX5RNUrMtfBI=;
 b=zZGkqOimN6rEFEy6wYLBE4Cc8UfQSiZmClq3qNgXtZCRUnuwaT61b01I1bdYaz+Bbs
 H9G394kAcH4S5cLL4FojyF6PHr6E88pbCVIxB08tcLPVsixVL0K4MzK/UcXAuJiHpBus
 jmIVcDPM5qSpycCc/tQPsczzu2oLB34zy+IMJ5BFNz/52CKqovopQ+H+BJAZOD8f4Prs
 thH3WnTpXSsyTyvYu00sRHLd4BLAJZNg2rpUJMMVfOpWDpZIGjnieQDsITiwR2azRT8A
 NZZSii49sA7h1zsJAL9PxL5D7SPgtMRcz3Fllzm6a/3PU5Ob4IXr56zBCWjIuEiT0WGm
 Mcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j21dTyIj41G0K43gYWwqQRtlgt2XT5TcX5RNUrMtfBI=;
 b=6Zx0SD8zygPXBnozOResDF7gkLuoh4F1GWAENlkKlrUv/SNb5eXmsRXaE0ZQIvYARb
 qtEQGrAbHl/XhHkqSE1/47SvJZSSMTm0yxGOygV6zBRqNbmKzuLNJLtIY+Mx2md7CJvc
 Y3SKcT6U3I8QXaHs/MuO+HWDL6YT3/5sXhU/3gT8unSMGl8OrIETzWs+QtJQlLYL6dq7
 J1gnrXoeSUabQ41jLUBhNrUrskYU6sYOb1fJUqAIuvv1uD+Jkh7Y6XspRi/y7zgKbp1o
 vD7HrMj7sdGU4bA4LAmTTUnatLEcXTFXnejgiD+MbC6s41x5WtIgRuM4VMrfzK0gvqIq
 xzyA==
X-Gm-Message-State: AOAM533dfHUZSu7zS0IWJTG3qoOlowEfv4ycGcx2VuYtBNs06/cowrJS
 v02bGVvpXRAm2GUKBWgpjhMC5uxOiQQ+0g==
X-Google-Smtp-Source: ABdhPJxh7ZJBL5ZpwipjkFhQoYbwFpM6rmvn3gDrg6Ji5hihD2D2/ikpgoTM5zE54twkSlCUHZVurA==
X-Received: by 2002:a63:513:0:b0:380:1180:9b48 with SMTP id
 19-20020a630513000000b0038011809b48mr11112051pgf.623.1646724037772; 
 Mon, 07 Mar 2022 23:20:37 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/33] target/nios2: Implement cpuid
Date: Mon,  7 Mar 2022 21:19:50 -1000
Message-Id: <20220308072005.307955-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Copy the existing cpu_index into the space reserved for CR_CPUID.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 189adf111c..fbcb4da737 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -159,6 +159,7 @@ static ObjectClass *nios2_cpu_class_by_name(const char *cpu_model)
 static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
+    Nios2CPU *cpu = NIOS2_CPU(cs);
     Nios2CPUClass *ncc = NIOS2_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
@@ -171,6 +172,9 @@ static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
     qemu_init_vcpu(cs);
     cpu_reset(cs);
 
+    /* We have reserved storage for ctrl[CR_CPUID]; might as well use it. */
+    cpu->env.cpuid = cs->cpu_index;
+
     ncc->parent_realize(dev, errp);
 }
 
-- 
2.25.1


