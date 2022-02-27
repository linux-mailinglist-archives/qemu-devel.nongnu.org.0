Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 606F14C5E0A
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 19:23:34 +0100 (CET)
Received: from localhost ([::1]:55256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOOCj-0005KA-CU
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 13:23:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOAr-0002cO-12
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 13:21:37 -0500
Received: from [2607:f8b0:4864:20::102e] (port=54028
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOAp-0007nl-3T
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 13:21:36 -0500
Received: by mail-pj1-x102e.google.com with SMTP id bx5so9198994pjb.3
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 10:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J7e/u37TYv9IPJn4rjMKxL8Ql7HntkOG8MpKKjdYqdw=;
 b=rTZ88MCkNO/ftTZDXO/mXy2bILQk/iQZ+4uSCaWOvNU0nEXO/UkxlnKub391wHjnpa
 mqA2VLMZHJlgiGQO4lSWdcyVnI9CFdQwteIit1gURjc6X2VRLv0265TIC2Ko6MyGLPFk
 pJrFRjKkWNMt5+PMefB8WSxlsvMAOsZlpQITKEjmTNkNOcqOR4JJId0JL+dbl+1DRHAM
 KSToYIxM0atvDvRGZfHuHoQNI/MDymv51WW9ETG2OKyHDS+sJ6MjYhc5+k3MW8ZopVIt
 8o/qAzqwNi6BNTMrztvNRKrl/AJWdgadbuzwo/vYzkvq705TgGoY3pAuwL24G56eAiEY
 RF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J7e/u37TYv9IPJn4rjMKxL8Ql7HntkOG8MpKKjdYqdw=;
 b=eFBzP4/GRWEemf6goosNmvf1FBDBXrEem3pT8Iwamwcgcs7tB98rlnqGUEfKzp8uDt
 hY2KWUlD5n4f/qtdtHE7JG7nOGleqcoV/gtIIDbqOoGgmnXSKdvr3/0x4xRaHUHUYO0x
 KL0eIupmopmXVPbYJ9wsBUdzLCZ1DfmOJ9jq0/isy2BDLBiVmLL0KpImQJdmzsH1yONG
 unkqHaGYBLyAdlcgNOorINOBYHKSZFjj7PIBkrKL7KNe6G0DD8swPkwt+VtXpdJuI2QL
 asuSkt2ba2buIF4K5iQeSTyhEKAvU8lJnUue51WItHgUYMtZpq4OiLkVvZY8ZwTa5wZB
 7B4A==
X-Gm-Message-State: AOAM530+q/ujaoe3A6H5uzPR5eYVKjXimyocZoHkDAhx8vvvMQRtJ3Ea
 d6aGSelTih3DeBD6r33ZFl2YDQsAmk2A3g==
X-Google-Smtp-Source: ABdhPJxjqLlDaROPy80lbxQAk+g+5ZuMFvAW3JfkF+/6Qa1ypGgyF/wBuTC4Q3raf+8ci3hj0Vm7Ug==
X-Received: by 2002:a17:902:744a:b0:14f:a63b:577d with SMTP id
 e10-20020a170902744a00b0014fa63b577dmr17109488plt.86.1645986093854; 
 Sun, 27 Feb 2022 10:21:33 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-23be-43d9-7006-705a.res6.spectrum.com.
 [2603:800c:1201:c600:23be:43d9:7006:705a])
 by smtp.gmail.com with ESMTPSA id
 t41-20020a056a0013a900b004e167af0c0dsm10776252pfg.89.2022.02.27.10.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 10:21:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/7] target/nios2: Only build mmu.c for system mode
Date: Sun, 27 Feb 2022 08:21:21 -1000
Message-Id: <20220227182125.21809-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220227182125.21809-1-richard.henderson@linaro.org>
References: <20220227182125.21809-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can thus remove an ifdef covering the entire file.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/mmu.c       | 3 ---
 target/nios2/meson.build | 3 +--
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/nios2/mmu.c b/target/nios2/mmu.c
index 306370f675..437fad09b7 100644
--- a/target/nios2/mmu.c
+++ b/target/nios2/mmu.c
@@ -25,7 +25,6 @@
 #include "mmu.h"
 #include "trace/trace-target_nios2.h"
 
-#if !defined(CONFIG_USER_ONLY)
 
 /* rw - 0 = read, 1 = write, 2 = fetch.  */
 unsigned int mmu_translate(CPUNios2State *env,
@@ -217,5 +216,3 @@ void dump_mmu(CPUNios2State *env)
                     (entry->data & CR_TLBACC_X) ? 'X' : '-');
     }
 }
-
-#endif /* !CONFIG_USER_ONLY */
diff --git a/target/nios2/meson.build b/target/nios2/meson.build
index e643917db1..62b384702d 100644
--- a/target/nios2/meson.build
+++ b/target/nios2/meson.build
@@ -2,14 +2,13 @@ nios2_ss = ss.source_set()
 nios2_ss.add(files(
   'cpu.c',
   'helper.c',
-  'mmu.c',
   'nios2-semi.c',
   'op_helper.c',
   'translate.c',
 ))
 
 nios2_softmmu_ss = ss.source_set()
-nios2_softmmu_ss.add(files('monitor.c'))
+nios2_softmmu_ss.add(files('monitor.c', 'mmu.c'))
 
 target_arch += {'nios2': nios2_ss}
 target_softmmu_arch += {'nios2': nios2_softmmu_ss}
-- 
2.25.1


