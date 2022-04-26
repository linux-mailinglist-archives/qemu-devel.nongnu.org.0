Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC92510743
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:39:45 +0200 (CEST)
Received: from localhost ([::1]:58200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQ6C-0007Sn-GB
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmW-0002Uj-DB
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:24 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:35670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmU-0004Ld-1n
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:24 -0400
Received: by mail-pf1-x434.google.com with SMTP id t13so5055946pfg.2
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aSCpXgZFYrLKFx9z48EM2Iny/HfNa5ePJRFMiB+lNrQ=;
 b=N+u9E1lwGhGsj2Xfdj9bGCMiknWs5MzgJDR78Xjee3FC6OaOyqejTzICzEjpWiaCqq
 /uRu76GMnMCt4R95M03z7Sy4fr5iNCGUkORSS4W8r1gCgZdDORG4p5U/IDtT9Emns83I
 fOFC3wqc4nfsJ318lbq470NkPenXmOneLCKdgYVGx1fpMYVRKTRN/Q3gM44w5x6MhUlg
 m0iChju+7Y4wiQBAwJRFhbAZqP2/Pvx4rCG04mn7MMVCBA0FHHCeM9NBxfxG3dhzL7px
 Ul8yLKDnCn247iGWZjWv6CjZpyFw55W8mdjzpSyd8L9F9ByiBDd3qT+3Gi3ZcLZsBkdN
 9IKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aSCpXgZFYrLKFx9z48EM2Iny/HfNa5ePJRFMiB+lNrQ=;
 b=7wPLStG3BuGvIeRBeMqZTDHONCDueF3DnOv/NMf1uENtjM3spC6IVdh/ZJy7xrojp9
 p8O3GeCVz7aknVnh7bfi0N/pAKlSLDW4T4S51xMJXuFmTkRxclVE8mBxNnV+LzB/ug9I
 8BbgPpZTYUiyjmMDORftC5+aXLwtqAf7Pqz1g44HqiObH9/w3GP6Xwzp9e+O94JwapOv
 Ke2v8mxl3ILYF+RpjfB9uCdKiFnqTCrGZXDde5xctoVoNAHdo9vC52/ppQ8Ipuu5G2R4
 nDRHjGhtZtHeIADCzvwTQzZghugT9A6bRNdG2DNat0evsWVi7enyd29pu+I+DUo/5B6g
 v0sw==
X-Gm-Message-State: AOAM530IDamvzvUFzqkxoaUDRQ59Vb9YpXqOEibgOUpEmXOLgFouNCop
 P27LXJS7vDOElXSSJ6MkKP9U1KyQK6EoSQ==
X-Google-Smtp-Source: ABdhPJxja3S+MkGHbbZtdFre7BOMxF+JeUIxfjlrvJ2htjROE+TOiMdG7ZI/vIoyGHPb6gI/sTwX8Q==
X-Received: by 2002:aa7:8890:0:b0:50a:9b3d:bfa5 with SMTP id
 z16-20020aa78890000000b0050a9b3dbfa5mr25997728pfe.48.1650997158227; 
 Tue, 26 Apr 2022 11:19:18 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/68] target/nios2: Build helper.c for system only
Date: Tue, 26 Apr 2022 11:18:10 -0700
Message-Id: <20220426181907.103691-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

Remove the #ifdef !defined(CONFIG_USER_ONLY) that surrounds
the whole file, and move helper.c to nios2_softmmu_ss.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220421151735.31996-12-richard.henderson@linaro.org>
---
 target/nios2/helper.c    | 3 +--
 target/nios2/meson.build | 7 +++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 55b8fb0bcb..04a8831443 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -28,7 +28,7 @@
 #include "exec/helper-proto.h"
 #include "semihosting/semihost.h"
 
-#if !defined(CONFIG_USER_ONLY)
+
 void nios2_cpu_do_interrupt(CPUState *cs)
 {
     Nios2CPU *cpu = NIOS2_CPU(cs);
@@ -292,4 +292,3 @@ bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     env->regs[CR_BADADDR] = address;
     cpu_loop_exit_restore(cs, retaddr);
 }
-#endif /* !CONFIG_USER_ONLY */
diff --git a/target/nios2/meson.build b/target/nios2/meson.build
index 62b384702d..2bd60ba306 100644
--- a/target/nios2/meson.build
+++ b/target/nios2/meson.build
@@ -1,14 +1,17 @@
 nios2_ss = ss.source_set()
 nios2_ss.add(files(
   'cpu.c',
-  'helper.c',
   'nios2-semi.c',
   'op_helper.c',
   'translate.c',
 ))
 
 nios2_softmmu_ss = ss.source_set()
-nios2_softmmu_ss.add(files('monitor.c', 'mmu.c'))
+nios2_softmmu_ss.add(files(
+  'helper.c',
+  'monitor.c',
+  'mmu.c'
+))
 
 target_arch += {'nios2': nios2_ss}
 target_softmmu_arch += {'nios2': nios2_softmmu_ss}
-- 
2.34.1


