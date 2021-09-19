Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B2F410922
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 04:03:12 +0200 (CEST)
Received: from localhost ([::1]:44934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRmAh-0003aU-CL
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 22:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5D-0003hF-R8
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:31 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:33727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5A-00058C-4s
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:31 -0400
Received: by mail-pf1-x434.google.com with SMTP id s16so4622632pfk.0
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 18:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=knwCTwHt8Z3taSHUyiLNVvta8fjC+vg+aD5RA0fP+2w=;
 b=gln/hRixji2EHSHMm1D1vYlQrqytONndTwuAABs8OCKaFVpEZL+s3fYDrwq3gN/sqC
 +ggsmL1WvVeLW0fhEU9Cg+plD6h6aryFHHyDfnvdaCv8/kPM05Zd90Uf/Is06POyLWyJ
 RYUFC2kfZ0zAojr1Edb1VinHyJZaFMgNIoEEu9bdwMHM5tpEzgPcvGPWpgpwG2AkPEi0
 rBePpE6UaQVMImsZHp2TnGzePV0DmEz14IscZ3lHZPUrIbxpQdMtxnfCScCbSugF3OtX
 zCtSTFX8JGj+6VVau7k/3b/biIWNRB1UND2geGTXTQFvv0yOQWiMjAyLtJHcylU+D61C
 nxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=knwCTwHt8Z3taSHUyiLNVvta8fjC+vg+aD5RA0fP+2w=;
 b=ptoL/MFdPCZYv04inXgdgeZQv8FbIry4Fz3i3G1+B1X2JStXFBq0oOuP2fKvU8rxqe
 ebrgpXNnUTLS4fMhVBJyiOgYqgoQjVMDolMvk8RGOzmnIWNE9HPozcgvKJWfMqmJKwsZ
 Yy18xQCI0c91s5wpsTxDv0B1RD2SznO6z6TfxZk5KHY4inKgeJzfMaqcFsC70r6y7Ivj
 Oh0lZCaCgrYm+5N6rK+O7A3CapSn17+cETj61ksHlzdXU8P0f0G7Vn5cJKULfYn3zXwH
 03Q3EUFItPcR6hlT8paP9TI1MY97XtimiK1yR9KYn6SMCn1Gglyna/ZbRF/+beZIn6El
 QVjQ==
X-Gm-Message-State: AOAM531krJssK1lTBC5VqWrRXNvRgHHcNgmRzisFTR0zICBWLZJkYY0f
 2aM/9ln7uRSft1rc5t2ACfP33ZuJBaROeA==
X-Google-Smtp-Source: ABdhPJwKxtCXdOtHAwWeuSUgMdVjrJc4SnR26g4o9+P+yi3VMKyxPucQRblEVk2Xyxw04KVBq4Evjw==
X-Received: by 2002:a63:d456:: with SMTP id i22mr17026444pgj.421.1632016646757; 
 Sat, 18 Sep 2021 18:57:26 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k14sm6747899pgg.92.2021.09.18.18.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 18:57:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/25] linux-user/hppa: Use the proper si_code for PRIV_OPR,
 PRIV_REG, OVERFLOW
Date: Sat, 18 Sep 2021 18:57:01 -0700
Message-Id: <20210919015718.466207-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210919015718.466207-1-richard.henderson@linaro.org>
References: <20210919015718.466207-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These si_codes have been properly set by the kernel since the beginning.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hppa/cpu_loop.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index c01ccbbdc0..10487df88c 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -147,11 +147,17 @@ void cpu_loop(CPUHPPAState *env)
             force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN, env->cr[CR_IOR]);
             break;
         case EXCP_ILL:
-        case EXCP_PRIV_OPR:
-        case EXCP_PRIV_REG:
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->iaoq_f);
             break;
+        case EXCP_PRIV_OPR:
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->iaoq_f);
+            break;
+        case EXCP_PRIV_REG:
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVREG, env->iaoq_f);
+            break;
         case EXCP_OVERFLOW:
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->iaoq_f);
+            break;
         case EXCP_COND:
         case EXCP_ASSIST:
             force_sig_fault(TARGET_SIGFPE, 0, env->iaoq_f);
-- 
2.25.1


