Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B084C981A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:03:28 +0100 (CET)
Received: from localhost ([::1]:34032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPAac-0004No-Ud
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:03:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXU-0001F9-Qv
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:13 -0500
Received: from [2607:f8b0:4864:20::62a] (port=44926
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXT-0004wB-6B
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:12 -0500
Received: by mail-pl1-x62a.google.com with SMTP id q11so14577561pln.11
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E1rlJYYazfRdVeynNKa6RTb/vpD+L0sCNF3QpW/Zvp8=;
 b=iWENCHPYZqKwbsB8w9uYNeYg9InVg6/l1aX3WDGZzSjCc5EK9ycc/+CwlktONCfPCa
 hPfYWpllMJqmgylTcktcbf6FC69B6wjIEoksowCHtRFj3XF6SZrz/NPJNE52UlaBnBdg
 D9VChukulTP79+uRMGFmtMKrKaopmQ0qUoobCkqFrrX3yjv4t1BLy12aBqpOQC4pH25U
 mcm6yfXmIVA7nkJpdKuFUfK/ZTg+wNWvqKMFMQPUsaqHAcbj7mneiZ+K/b/grOyIJ0te
 +/Q861Vlr3WcEEQPVRvCEtq9vh9bKisEEUQaFhTzN1j+yGLIYjNI9gZPBuC1aZeAuPKq
 qLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E1rlJYYazfRdVeynNKa6RTb/vpD+L0sCNF3QpW/Zvp8=;
 b=5+tBV/QEn+BoTCVr4JXmtT+lSkYXmDweS87Fm0WzClpnm8CkyqlhUGGfzxz4YlmwRq
 AOHO4ieCsOFmQAEaTq0Lj81KfUN/SlDU2D464vP2ylvfwZ4BVHjSEho/f2/J8PuUEuHL
 eGRsJbqA76NO6Q/ecVv07xFUcZBcnH9TAUChbtb86tp2pPa5NqD+DzRgbVj7Uf0EnU0x
 UUYr2kaHc1ijhh4EvDIyn4l5T6GOJcUvxmHBhkBEIuuq/Y+xBWqU27PPmr0Yt/yJXqae
 WMIjVqtd5Mcm9LyQKv0OJkHWATIm+d+v3dQayHjflF3oU+5rA9H0CSk8e14BWxmu66xd
 uYnA==
X-Gm-Message-State: AOAM532C4dQ9dFHYKeN+l3gIFxm7bMNMf6E7Fegf9tJtrkeQmPcsPklJ
 ExxopxuPhRUExeG9TY+1dkASk0n494/GnQ==
X-Google-Smtp-Source: ABdhPJxsLWUEHCSRx5y6+idMrcUWQioEy8o+e4wivRjqPDiY4+t5NktOzFpUTisz2QcYRZhmg8a/Ug==
X-Received: by 2002:a17:902:bd04:b0:151:6cec:4b3 with SMTP id
 p4-20020a170902bd0400b001516cec04b3mr11176922pls.106.1646172006144; 
 Tue, 01 Mar 2022 14:00:06 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:00:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/18] target/arm: Set TCR_EL1.TSZ for user-only
Date: Tue,  1 Mar 2022 11:59:42 -1000
Message-Id: <20220301215958.157011-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set this as the kernel would, to 48 bits, to keep the computation
of the address space correct for PAuth.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index c085dc10ee..e251f0df4b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -206,10 +206,11 @@ static void arm_cpu_reset(DeviceState *dev)
                 aarch64_sve_zcr_get_valid_len(cpu, cpu->sve_default_vq - 1);
         }
         /*
+         * Enable 48-bit address space (TODO: take reserved_va into account).
          * Enable TBI0 but not TBI1.
          * Note that this must match useronly_clean_ptr.
          */
-        env->cp15.tcr_el[1].raw_tcr = (1ULL << 37);
+        env->cp15.tcr_el[1].raw_tcr = 5 | (1ULL << 37);
 
         /* Enable MTE */
         if (cpu_isar_feature(aa64_mte, cpu)) {
-- 
2.25.1


