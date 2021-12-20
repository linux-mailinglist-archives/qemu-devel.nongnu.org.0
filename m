Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 215B247B515
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:21:36 +0100 (CET)
Received: from localhost ([::1]:45778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzQ6B-0008P0-8O
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:21:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqq-0000Vy-9K
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:44 -0500
Received: from [2607:f8b0:4864:20::42b] (port=42569
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqo-0005uu-Ak
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:43 -0500
Received: by mail-pf1-x42b.google.com with SMTP id t19so3476582pfg.9
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 13:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ta3Ko9zxfZ4eRR7LoDI2ksYw0ZQI5fINkcgZmVZuQY0=;
 b=hX+OtUffJanhryZ6O07gJcsVdcxnpXg287moCDvDwGTkMuASRT2n4OaC/WkxyuGU5t
 sKlzy9wTfyWdVPaKKXRt49SqJ4wKZZycHx0depkXrWjCQdW9+iWlhgFuiX0z+pWCTHQB
 5goDqPj2+tRaTDQVYoaBZ79Xt3Nd/woTN3bEMh4hZjQWMaG1+kM/uN5w/4/SDXSFihRe
 D6Rp1XdC30s5f0E1cDa1StJVmH6+HcJHddmmP9rLI5sD9drdhzGus7L7zKMuUpe0Q9fg
 wKfvCiFzzCK6VkHYCFqkIkvScuDWNOX5XlbW++qBPGDNtPjiBUP53+fsta8wbn0SdTiq
 qyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ta3Ko9zxfZ4eRR7LoDI2ksYw0ZQI5fINkcgZmVZuQY0=;
 b=vllbr6+cncxCvY1p6DifCo0nE+iGVt2+h4/BPiajusSuhPRO6kTI3BcbNQT+YsW8Uu
 qf7jBnU0+wkUByVDNh1xRhtobpNA/tfkb9OTEcnwZmv0ofygt78N7OcOb29/ZviWiIH9
 jOX+Aw1GAjPCptvCzEH2S75ivxdSJvKdhrMNcigyt4Vdtx+UtveijzCIukeFmIYGk7vL
 DPtMAlJNg4d4pcVrXkuny7qb+SPx2O2KAKeMqACUEP66L9nct5bDGiRWYygm0EalSWTF
 RFECYzINdAmZRhcrz1lnP3C3CcgW3pJ+pfAedDk0SYJEM4TksdBPAEKPJCvISKW/aQMi
 edMQ==
X-Gm-Message-State: AOAM531ODuDyRvxlgCl0QhNtgGUUowqqbRvt6tBLWBve6e3Vxz0wQ61Q
 Hcx2dRlUhipUslXDTgohCEGbAZsG3AvecQ==
X-Google-Smtp-Source: ABdhPJwFuRZ4q47+uz7terCdI6hq7WtPrRkb+WNAu01CJfgKQ0Cd8Ez2G3B0SyRX6T7c/J0+HZNkYw==
X-Received: by 2002:aa7:9481:0:b0:4ba:82e3:1964 with SMTP id
 z1-20020aa79481000000b004ba82e31964mr16300884pfk.4.1640034341144; 
 Mon, 20 Dec 2021 13:05:41 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id d13sm20091021pfu.213.2021.12.20.13.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 13:05:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/24] linux-user/microblaze: Fix SIGFPE si_codes
Date: Mon, 20 Dec 2021 13:05:17 -0800
Message-Id: <20211220210529.150423-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220210529.150423-1-richard.henderson@linaro.org>
References: <20211220210529.150423-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
index 263b68aea1..cf1668a45f 100644
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


