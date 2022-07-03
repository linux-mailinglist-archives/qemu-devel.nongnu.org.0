Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 029C6564685
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:49:29 +0200 (CEST)
Received: from localhost ([::1]:33344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7wEK-0001lI-5T
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7vSE-0004uV-Ug
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:59:48 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:34648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7vSB-0004Ag-EM
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:59:45 -0400
Received: by mail-pl1-x62d.google.com with SMTP id z1so267465plb.1
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=21yVEfcVUBo097kH9wR354mUzWjfCDzfOMaCfmjHzQU=;
 b=ralihiRoAOAmdtv4kxXS1x6YAjyz8s+MBaAaRAJ9rXULMSKP9FFx5/jms3mCNnj49h
 twm+ftTlq5aUv4YQHd5efZgQ8/RqPII3Wo8T0TcMKRdqUzdlefd0uE6PY37abIjIZpZJ
 hG7UrEkh+KX9ykOxgx8XZEKAK3JRU1Jw/DK5Gn0MnEMSJmaWqygbfUn+XQyIvZOjJtB6
 f3Ag0sQErhEuOzYzqzYfZZeDFWGW8FvQCyECESHLJb2WtyXLUlHL6hXUu/cc0QniwcEe
 RF2WEqtRX1Uv+TAUJG1ah5mtvPxfeKPnxSJthKXBsXayjScgWV6UGWlvBmR0oD5bawjT
 DpbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=21yVEfcVUBo097kH9wR354mUzWjfCDzfOMaCfmjHzQU=;
 b=BOLO+Gsbs2HPqNHDlb+dkea/ax4HAyGsxideuJORbPzXDknk1SeUGLHTfLmvHHCG/O
 Ie4g+HKi2+n9jwTg1S6N0HehYhym9S+Io/OPKxgA7g/rA+29jH+pamAFk+tTtbkbztqE
 SDxErGfYv0znBhpvOjCJwsGyivfLGI8R8t7C+JxfePVDkdkzQrnhOlLdjVKtQv2L+rJj
 SXr2Ep/jgSxaqhDbC4robBX0ZykS7bZhPtUm+u1JEJ8Qwe2yT2YF9BtrcxSYxnjdxFyY
 0CwtOC+1Fm2uOtgkGFegfF08V2cnOyV5KlZs7Wfqjewqo2n1nc9hR3uqF3hYMASmxPSt
 1zBQ==
X-Gm-Message-State: AJIora/PHAYN0YWZ5GbVib06wDtSPGavJ1aa1UO2wlPyBi0hSJG8QsLt
 HiGRqjfl7Z7xQohJ4c5o8oilbn3xJjGrw9+9
X-Google-Smtp-Source: AGRyM1tDS/o6soM8tzWk7l9P1h5H4rt7YPONQ6wZHNUYVxkndpXlFuLRGHUt/+TiYxg58DS2Hm1JtA==
X-Received: by 2002:a17:90b:3148:b0:1ed:75:47b with SMTP id
 ip8-20020a17090b314800b001ed0075047bmr27783520pjb.9.1656838782161; 
 Sun, 03 Jul 2022 01:59:42 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 cq16-20020a056a00331000b00518764d09cdsm18777593pfb.164.2022.07.03.01.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:59:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PATCH v21 07/13] target/loongarch: remove badaddr from CPULoongArch
Date: Sun,  3 Jul 2022 14:29:07 +0530
Message-Id: <20220703085913.772936-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703085913.772936-1-richard.henderson@linaro.org>
References: <20220703085913.772936-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Song Gao <gaosong@loongson.cn>

We can use CSR_BADV to replace badaddr.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220624031049.1716097-8-gaosong@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu.h     | 2 --
 target/loongarch/gdbstub.c | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 71a5036c3c..4b4fbcdc71 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -246,8 +246,6 @@ typedef struct CPUArchState {
     uint64_t lladdr; /* LL virtual address compared against SC */
     uint64_t llval;
 
-    uint64_t badaddr;
-
     /* LoongArch CSRs */
     uint64_t CSR_CRMD;
     uint64_t CSR_PRMD;
diff --git a/target/loongarch/gdbstub.c b/target/loongarch/gdbstub.c
index 0c48834201..24e126fb2d 100644
--- a/target/loongarch/gdbstub.c
+++ b/target/loongarch/gdbstub.c
@@ -21,7 +21,7 @@ int loongarch_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     } else if (n == 32) {
         return gdb_get_regl(mem_buf, env->pc);
     } else if (n == 33) {
-        return gdb_get_regl(mem_buf, env->badaddr);
+        return gdb_get_regl(mem_buf, env->CSR_BADV);
     }
     return 0;
 }
-- 
2.34.1


