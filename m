Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E4F6C8E3A
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 13:34:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pg35w-0001fH-24; Sat, 25 Mar 2023 08:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg35u-0001dU-6L
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 08:34:02 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg35r-0006mU-LU
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 08:34:01 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 w13-20020a4aca0d000000b0053b8aa32089so678992ooq.5
 for <qemu-devel@nongnu.org>; Sat, 25 Mar 2023 05:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679747634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EbGNFLVkiqPgbxaUqmz1zDM/6rQ/gc8PTX9QSSUbkHs=;
 b=wS1N2iYK+L202d+B/J1lXXvL2F4pn2E15SbAzBxuceNdtHCIlcsCUOa1Udad71328B
 B4kHRjYpX7f9dybnGzwcEx2E5NE/ql4xfYxa3LRjuWr8slgAb0ES0J8/LSWdK/SJ3F1f
 7BnQL72TmpOK7jvf4GMIJncoRBlTt8pHft6ntEEUb0lRSz+Q9/SyhTEYJ6CidILl3ZB3
 YIKjdvsfMCJ9IinLScsjp5kWGjkjJnys1gd+y8FgmFX2W+NC2iqY+3cvU+16aK5EsO1Y
 m+P/3Kb+beaZbL85hq1Q+lsQ/JIriBawLv/LC7XNGS8z9Wm7AGQBi7IoZQfnKy+sEtlg
 dOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679747634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EbGNFLVkiqPgbxaUqmz1zDM/6rQ/gc8PTX9QSSUbkHs=;
 b=xGlWsD+UpU4wWY9kSwQCevBJ552+SC2aUD9i8qsHNRxBMYF4pY0D6Qj4tdcmB9M+ju
 joqoLntAGI3p3N+VMpwuPuqbIgk4QOtq9ER8pIavxW9rZxfNlAs5EwCPCDi/To4wO8Bi
 BtlVCUNje/tnKvLhXHR3f9TKoCLPai+e7xLrirlIp49Yv2djsAlcCKuuZjMlN2edDsvN
 WMu/H4Rx5DyohFBlqrduUeUWOnaNOITD+duyAq1sAkAv1zn/nPRcEw5KmI5OUCSzIbf7
 MlbO4rRmn6ehG+0N659BG3Tbcn6SBfoeszsg7aTR0NaO5nJKdzpFDTIz9wO1ARUerG/M
 vZ6A==
X-Gm-Message-State: AO0yUKWqd+KDtUAGTz5tJP109Apb14c7Ac70I5ESIlRkF/q+3TOzrJ/U
 FuaWu5CFvrca7Anb/LKATcKPoISpjd+XF4/D1uQ=
X-Google-Smtp-Source: AKy350aTa3VPVvqTzxSdnc6xjuldI2NaHAOCXD97O3QgrAvlt6BQI+nmAgdLgVxyNSL8vZpOLBWl2A==
X-Received: by 2002:a17:90b:180e:b0:23f:ae99:3c94 with SMTP id
 lw14-20020a17090b180e00b0023fae993c94mr5094749pjb.23.1679741691002; 
 Sat, 25 Mar 2023 03:54:51 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 23/25] target/riscv: Merge checks for reserved pte flags
Date: Sat, 25 Mar 2023 03:54:27 -0700
Message-Id: <20230325105429.1142530-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc29.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 850817edfd..82a7c5f9dd 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -976,14 +976,14 @@ restart:
         /* Reserved without Svpbmt. */
         return TRANSLATE_FAIL;
     }
-    if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
-        /* Reserved leaf PTE flags: PTE_W */
-        return TRANSLATE_FAIL;
-    }
-    if ((pte & (PTE_R | PTE_W | PTE_X)) == (PTE_W | PTE_X)) {
-        /* Reserved leaf PTE flags: PTE_W + PTE_X */
+
+    /* Check for reserved combinations of RWX flags. */
+    switch (pte & (PTE_R | PTE_W | PTE_X)) {
+    case PTE_W:
+    case PTE_W | PTE_X:
         return TRANSLATE_FAIL;
     }
+
     if ((pte & PTE_U) &&
         ((mode != PRV_U) && (!sum || access_type == MMU_INST_FETCH))) {
         /*
-- 
2.34.1


