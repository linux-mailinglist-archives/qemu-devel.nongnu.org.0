Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 650B0487E95
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 22:53:35 +0100 (CET)
Received: from localhost ([::1]:48850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5xB0-0001ia-BU
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 16:53:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wr3-0005BC-1c
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:57 -0500
Received: from [2607:f8b0:4864:20::530] (port=45931
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wr1-0007pY-1y
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:56 -0500
Received: by mail-pg1-x530.google.com with SMTP id f5so6485361pgk.12
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 13:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nnIfwY6lMbUB9YHpQy15uEKax+AILhmSHbZZeVZpWtQ=;
 b=QyLkhQ9aP6l9dcTKQV+K5C7Ilevr41fknntG8UiorNypA6I0AQ3oYL49XBLJvs5eeK
 md0o5bd0s2qr/i3CQhQyN4KWbXZbpJ+K8e2bdptsJmFjddFAaCKR1KmCxB+r/R9sVj8e
 Td53DUa5cz0lzzlBDgofxzjZWTwhKgojwBuph9+i3m19DLT6opcmob1z+UuviaAOCv3I
 olf9N9dj0JPCjqh8WswqDbpDsYtlAfceN+Ec1oApj59AgleuT50ui12oZRyrg0ejQV6j
 0n3DgEkpeZPfTJhffSC8/vlt0sAgNxveQt56rhrqaeYd2XAfiSJqb9OHUVoN9eMUYNaH
 TDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nnIfwY6lMbUB9YHpQy15uEKax+AILhmSHbZZeVZpWtQ=;
 b=do6y8BpqfEYpp7wzvfARus2TdLTgqFnej2modbz3whWfrWkcPUHC2K4Bo+QQJXgWH9
 IaBwbGJWIjiq+P0cFHFwzNQ8qz2/+5hbnZdSqzGa3IzwgzOwn1C3C4TgEnQcOFeOSpNp
 EwPT+6KIpQIi5JXDyuMsmk5UNV3ByMp1ajaur1FHB7FzK3Xu/a8MTJemgB557SvxstL1
 4/sQbHrXsH3fV9CVmWDqfrBgxqGIDvQOkxLHSgidIuAjbCJO3A6wc0RfzmG613+PxV/B
 qIC/V34BupXcxsqzqzJY5tT9RgGrsRmo2godZFvVtBqjsgiN3CO3vylElrkedtmKEudn
 z2wg==
X-Gm-Message-State: AOAM532EMzBonuDRg8dB/81SYQ2OX+4Uz09vW7MXvLkqY8OZKP8Yf1A4
 pKY9uqe2QFyPszb54mZF9at1ioD7O3Z3ZA==
X-Google-Smtp-Source: ABdhPJxyNZgAsXeMGrKPefimQ2UTCBOBZDFXwDJa8b7ZqzskB8lSt4e3mcnSIz1jlu+2u23qKhzDFQ==
X-Received: by 2002:a63:6707:: with SMTP id b7mr58387982pgc.588.1641591172121; 
 Fri, 07 Jan 2022 13:32:52 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y11sm6633030pfi.80.2022.01.07.13.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 13:32:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 13/24] linux-user/microblaze: Fix SIGFPE si_codes
Date: Fri,  7 Jan 2022 13:32:32 -0800
Message-Id: <20220107213243.212806-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107213243.212806-1-richard.henderson@linaro.org>
References: <20220107213243.212806-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a typo for ESR_EC_DIVZERO, which is integral not floating-point.
Fix the if ladder for decoding floating-point exceptions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/microblaze/cpu_loop.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index 08620d4e68..1a2556be2c 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -77,15 +77,25 @@ void cpu_loop(CPUMBState *env)
             env->iflags &= ~(IMM_FLAG | D_FLAG);
             switch (env->esr & 31) {
             case ESR_EC_DIVZERO:
-                si_code = TARGET_FPE_FLTDIV;
+                si_code = TARGET_FPE_INTDIV;
                 break;
             case ESR_EC_FPU:
-                si_code = 0;
-                if (env->fsr & FSR_IO) {
+                /*
+                 * Note that the kernel passes along fsr as si_code
+                 * if there's no recognized bit set.  Possibly this
+                 * implies that si_code is 0, but follow the structure.
+                 */
+                si_code = env->fsr;
+                if (si_code & FSR_IO) {
                     si_code = TARGET_FPE_FLTINV;
-                }
-                if (env->fsr & FSR_DZ) {
+                } else if (si_code & FSR_OF) {
+                    si_code = TARGET_FPE_FLTOVF;
+                } else if (si_code & FSR_UF) {
+                    si_code = TARGET_FPE_FLTUND;
+                } else if (si_code & FSR_DZ) {
                     si_code = TARGET_FPE_FLTDIV;
+                } else if (si_code & FSR_DO) {
+                    si_code = TARGET_FPE_FLTRES;
                 }
                 break;
             default:
-- 
2.25.1


