Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 470A26FE308
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 19:10:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwnIw-00079q-Ng; Wed, 10 May 2023 13:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwnIc-00076n-Q5
 for qemu-devel@nongnu.org; Wed, 10 May 2023 13:08:22 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwnIU-0003zB-NM
 for qemu-devel@nongnu.org; Wed, 10 May 2023 13:08:22 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f427118644so35646645e9.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 10:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683738493; x=1686330493;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=AMgWjdExqQvD0z7w+v6d0whyaY3pAvLUhKRIvQ5q42Q=;
 b=ieMCqTYZ0V31LXZKOpznDQx8mLfstB7QqFtKT6Z1sGhRmMlSCO74HxPGw0hYAT/qYY
 dEYswIPwrs24SJGEX6ORGpgh4VaeHFHmJ9SVDwruVa8+rqUpzdGdWpWA7JOVnaTe3jJ9
 n5NTrr5W4DkYg+cTjFeyGXz/EKMvBpsLYeIBVIlTzs6SgBVikEeUrlVQT7bPW8oD7tje
 Po+tAF9EXFxMe+jZsLHYxmDOUDvskhryMY9Ijk86Uorxs/MlGo2zcNidCbgRWyWLqWto
 FRMn3+8vev1XYq9VzdxxRXArGQki3trHwGKbwkziOf047s9Cm7ZPZDsaKzyDqsFfubxT
 vi8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683738493; x=1686330493;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AMgWjdExqQvD0z7w+v6d0whyaY3pAvLUhKRIvQ5q42Q=;
 b=F6Mn3MKAyP0sXLoxF9WVzouy9ffYTKiFI/lqRnMRtJ05+q8arK66XldzGI4v3KsYLi
 hgFMe+G4eN/aYau5TlgbNkuwITCqMUIhpqG5A1+GhOC5F9tAovG49Fd4Wa8n67a1bcpA
 Q/kwV7XsEnzfiPI+DyH03q9tTpvcIVXLjTBd9ae8F4pNWykVG75K9H83BjcCMnAyVD8o
 PYDqMVqyr1L10gQMpyz3ojD0fuZhwa2sSP/hpnFttxR5F/KK9zirmaKhdlkHmsNDUXF8
 kIXswoMDhDJxlSa/+nJeHFEw4Nm7L1m/fvSyXIfgBv7FJHHSgyejG1ABRiU5+i4e1WZ0
 DzSw==
X-Gm-Message-State: AC+VfDxECCksSIM59FkejFKDVI8fschANJk/J6u0UPyOOvN6UuEorFfk
 H9NmNlmlsZfEiSIx7QiRPmCtH/TZ1llcgLXUhkwgQA==
X-Google-Smtp-Source: ACHHUZ6Sohpmh7q2lO7wV4HaShbGv5hqTk0cYL/Lit+v+zuhTYC5xX5DyhkqSsnpVqExlgEr/z/xhA==
X-Received: by 2002:a05:600c:cf:b0:3f4:2a06:dc59 with SMTP id
 u15-20020a05600c00cf00b003f42a06dc59mr5967586wmm.12.1683738493285; 
 Wed, 10 May 2023 10:08:13 -0700 (PDT)
Received: from stoup.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 n2-20020a05600c294200b003f17eded97bsm23272011wmd.19.2023.05.10.10.08.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 10:08:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] disas: Fix tabs and braces in disas.c
Date: Wed, 10 May 2023 18:08:12 +0100
Message-Id: <20230510170812.663149-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Fix these before moving the file, for checkpatch.pl.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/disas.c b/disas.c
index b087c12c47..d46f638a72 100644
--- a/disas.c
+++ b/disas.c
@@ -226,11 +226,12 @@ void target_disas(FILE *out, CPUState *cpu, target_ulong code,
     }
 
     for (pc = code; size > 0; pc += count, size -= count) {
-	fprintf(out, "0x" TARGET_FMT_lx ":  ", pc);
-	count = s.info.print_insn(pc, &s.info);
-	fprintf(out, "\n");
-	if (count < 0)
-	    break;
+        fprintf(out, "0x" TARGET_FMT_lx ":  ", pc);
+        count = s.info.print_insn(pc, &s.info);
+        fprintf(out, "\n");
+        if (count < 0) {
+            break;
+        }
         if (size < count) {
             fprintf(out,
                     "Disassembler disagrees with translator over instruction "
-- 
2.34.1


