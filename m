Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2A850BF18
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:57:29 +0200 (CEST)
Received: from localhost ([::1]:48008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxX6-0003I1-PW
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwap-0000Ba-8n
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:15 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:43551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwan-00080k-Qx
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:15 -0400
Received: by mail-io1-xd32.google.com with SMTP id 125so9208607iov.10
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SrtdhebFHwQH2QuEUcsrlEhP5p9ppqhl2VFXayXosos=;
 b=y9eTBHoSCvquzFsYyBFaTw+jHR3RuZ0KwdgRBHWmRgoYX4osFZe5aiXGU0JJVoLtq6
 lAWqbRBZmd9dDz3+ej6Uq4K50Rpsx1HrW/esjj96RlX6wd4l9m6wVbuTMovlKbNqLtc/
 1icjiQE1+GRZL9xM0iebQFAhtcGQU49FGjer3QVz49CcSDJilOGrWWpH3KzlWBC/0+Ww
 JZo4EFolCFJmEkQtHa+PzyGFvFt0ugdknZjFiI7vmMvHJaEOOGlXtOk2RjVkSn815qv3
 HW32bj6Zya88KPJGhoOBis9ZrrVGttkeDFYkfxy0nrmY6BETxgj27htyaNuxr+a0l/PS
 2yGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SrtdhebFHwQH2QuEUcsrlEhP5p9ppqhl2VFXayXosos=;
 b=QskHlZ9a204raJj5iTjwkpdU6hmyfovONvVvY0lc2eUG4YIm9WPb2t//Lzv5kuhRDr
 SrX2phrS/tzoRj6sKzhPLPoO6yp5AuXfibwPOGink/ZoSxkYPLHtXpHHQr7WmFepeUTA
 AE4Vq5oH/y9RCw3WGhArdy1gvJcGLYcUZm6aqhFSXUX2fJk/gWVyNbegcINcP92epOSF
 HRckSr9Oh5PHMwr+J/XW4UkK3aPr9DxOpDSGDLzoYtoPz1WF0PDOz4ZV3rDupzkmiRGY
 4h5qoAJYO+YbzUubqO3u2RHuShHWgdsydsVCwf0tasahWutYiYUdDi1E9OY/HUngm6/C
 GcJw==
X-Gm-Message-State: AOAM531KyRGDoyIhJowcES2cYaQ4OwfjSSM21eUmuK/F+gdrVr9dIeis
 5ZoWSLPZyVxHwdLnHDzhCHOisyXhyTKcHm0L
X-Google-Smtp-Source: ABdhPJyBAJPE9tXbSE6KpJyEwjQrMlkNnwg9uW6HavEKGR0+bZY1tGAI1zSrLXSk5Z9gM3bIwhRIBw==
X-Received: by 2002:a02:9999:0:b0:314:4a83:ac2e with SMTP id
 a25-20020a029999000000b003144a83ac2emr2423197jal.37.1650646632954; 
 Fri, 22 Apr 2022 09:57:12 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a6b8b17000000b00649a2634725sm816380iod.17.2022.04.22.09.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:57:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 51/68] target/nios2: Enable unaligned traps for system mode
Date: Fri, 22 Apr 2022 09:52:21 -0700
Message-Id: <20220422165238.1971496-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unaligned traps are optional, but required with an mmu.
Turn them on always, because the fallback behaviour undefined.

Enable alignment checks in the config file.
Unwind the guest pc properly from do_unaligned_access.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-48-richard.henderson@linaro.org>
---
 target/nios2/helper.c             | 4 ++--
 configs/targets/nios2-softmmu.mak | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index c5a2dd65b1..2e9fea4a01 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -241,8 +241,8 @@ void nios2_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     CPUNios2State *env = &cpu->env;
 
     env->ctrl[CR_BADADDR] = addr;
-    env->ctrl[CR_EXCEPTION] = FIELD_DP32(0, CR_EXCEPTION, CAUSE, EXCP_UNALIGN);
-    helper_raise_exception(env, EXCP_UNALIGN);
+    cs->exception_index = EXCP_UNALIGN;
+    cpu_loop_exit_restore(cs, retaddr);
 }
 
 bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
diff --git a/configs/targets/nios2-softmmu.mak b/configs/targets/nios2-softmmu.mak
index 9a372f0717..1e93b54cd1 100644
--- a/configs/targets/nios2-softmmu.mak
+++ b/configs/targets/nios2-softmmu.mak
@@ -1 +1,2 @@
 TARGET_ARCH=nios2
+TARGET_ALIGNED_ONLY=y
-- 
2.34.1


