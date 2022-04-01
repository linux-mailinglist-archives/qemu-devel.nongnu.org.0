Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F5B4EFA55
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 21:17:53 +0200 (CEST)
Received: from localhost ([::1]:44976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naMmN-0008Bj-OD
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 15:17:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naMlS-0007Tw-PF
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 15:16:54 -0400
Received: from [2a00:1450:4864:20::636] (port=46711
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naMlR-0002OC-3Q
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 15:16:54 -0400
Received: by mail-ej1-x636.google.com with SMTP id c10so7726983ejs.13
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 12:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8FLRianXdp3B5fs6ZYVe/Zkfg2KCdYELJRVpOeN6hs0=;
 b=xBwIJXiGGBdUD5Ngmg6A52KEpfqn2mxFIO1mZsPgEE7IPIBz3Kxz2lQmhdrpINYefS
 O5N1yp5ZK8r/N+0aSMjbEM6ZWmyYSrTOA8FDhxQ4leo1Hixux3cZDEGZOrFs7UhxAeAk
 Xy+yEKfWVtOl4w7RvSwPNus+dHENnPxj8RitPX9g11fQFUrL3p90/+C+j53cJ8zQiuLt
 VtYk1O2cBP0GOYEEyPMSYpoMTJyty0CEayJ6PmzUtcnIXKxPvdSL3bfMXbHdbo02PhIZ
 CG4+BzbcS/AyIyG4d4RqvBotB7R+OuHg01a7KSns7esX/n/j3wt2mtXEEIpC1wSuv13q
 3MfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8FLRianXdp3B5fs6ZYVe/Zkfg2KCdYELJRVpOeN6hs0=;
 b=ZHRT99NRLM7YIZo2QCrbMqCYm+mZoth+Mz8Iypraf9E9tZ8c5Adfkc3yMc8Vtdq0+B
 iRBrBKMyfHyftZ6T6LvChXjpfdslFRPEmCMIiBWG9CgylPxje5wM1gQOyCNLQ5dRTcuK
 Ta2HVZJhqSwGf9zE7VCx6hxXV6GrzbT0PQ6WhMVUGMX/vonKKhEMNBYKiA/d32H+HUtG
 PuyOo4TietcLGMOJK1L1mz3ODOiGdVrELKpL+jDzmmpgcRnEUQYKeW6OBnOK20Pb7G0Q
 5vWDzceraapcIga/HEPGpeUhJCtcTTiLLU6vW1BUJ25JoKfdf31suoG+ugaWV7oaT6WZ
 6pFQ==
X-Gm-Message-State: AOAM533ZqOSVY2OioAOlfDN5N7kdEnJJhG8CbRIPXTh84dJ/TOnmc4xb
 2kWO2a+xvfNr8JXJ2602oUcvj/6IKb0RM9UlsYA=
X-Google-Smtp-Source: ABdhPJzotVr/MvOXW80KP/CRGyO28oVsho+Mtby32Ppw77/Ti7UntQ3yEjtnc7vHo5vs6ETZu7st4Q==
X-Received: by 2002:a17:907:3e12:b0:6da:f8d9:efeb with SMTP id
 hp18-20020a1709073e1200b006daf8d9efebmr1104756ejc.634.1648840611420; 
 Fri, 01 Apr 2022 12:16:51 -0700 (PDT)
Received: from localhost.localdomain ([185.81.138.17])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a50cf87000000b0041b7bd52e1fsm1568249edk.78.2022.04.01.12.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 12:16:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user/ppc: Narrow type of ccr in save_user_regs
Date: Fri,  1 Apr 2022 13:16:43 -0600
Message-Id: <20220401191643.330393-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: danielhb413@gmail.com, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity warns that we shift a 32-bit value by N, and then
accumulate it into a 64-bit type (target_ulong on ppc64).

The ccr is always 8 * 4-bit fields, and thus is always a
32-bit quantity; narrow the type to avoid the warning.

Fixes: Coverity CID 1487223
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/ppc/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index ec0b9c0df3..ce5a4682cd 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -229,7 +229,7 @@ static void save_user_regs(CPUPPCState *env, struct target_mcontext *frame)
 {
     target_ulong msr = env->msr;
     int i;
-    target_ulong ccr = 0;
+    uint32_t ccr = 0;
 
     /* In general, the kernel attempts to be intelligent about what it
        needs to save for Altivec/FP/SPE registers.  We don't care that
-- 
2.25.1


