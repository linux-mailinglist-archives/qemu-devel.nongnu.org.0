Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C89250BE04
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:09:18 +0200 (CEST)
Received: from localhost ([::1]:58062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwmT-0002Pf-IK
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWl-0000ho-N3
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:03 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:36636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWj-0007FD-EV
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:03 -0400
Received: by mail-pl1-x635.google.com with SMTP id q3so12117119plg.3
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aSCpXgZFYrLKFx9z48EM2Iny/HfNa5ePJRFMiB+lNrQ=;
 b=LByxlg54d0AIIDCzr/D15lGHWPGV5N2irwjQNPMUPR4zU+N77hzDBwi4UFO8cE/Jsi
 qGFWtsom+6+5jtdxdFy6OXVKBSKLj62MrH+1IF8j0l/c4hKDZ+M2rhcQ+lrBtOKm71KR
 fbAJ6+ZY3xVfQIkoUS+R71KqJzuPS/4vr3ehWciXWlYH9hurJ8BU2PuYRKvdqFW1ygf2
 qYZXQNL8MNqf2a5AP9sc/4gFy5Xn7voSanJ8o12SCgwq2ReqPfA4VISlthxEhkcPBbpW
 UWEYfXkfXGCm2AEcOp79EqgyBH8LO82lK+SvwkHXJM5CTSiJirj2bgQzik2dOm072vi8
 aHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aSCpXgZFYrLKFx9z48EM2Iny/HfNa5ePJRFMiB+lNrQ=;
 b=ALDzVQCaFeKlREe2c/w4EjLbRKSMbfAjGJbGogWRu/u3EDt4cERsQ+ApWtFHyyFas0
 FXF6w/PhZpsyN0irs/38Q36AIIlROr5HzSl0dH4O25HOH7DjBEWa5MvItjiH53PLt9N4
 EJIVLyq851/x0naXnTG8S1jY3T8cZamX2+N70g8TEBMkPc2UrsuHH3D08aYMVf1dn5yI
 JyzBeRM7NTyT1aAnHogvTxQtY7109VNPVo/bBpvOGUeUw1x4Hvm+SyJGHnzV4TshJK0z
 b24HzqOqAT0+Q1m6RrsSkBuxfFzZ4FQtnvXG0N6OKvbGNoz5Mm/EndbiomkZsy9tOxeW
 Y/kg==
X-Gm-Message-State: AOAM532gTb37AdV7YSDIjgC0ZDLD3DwBf+eo9zVfxnNztER5jXxj66CL
 YRNNCRyaUPlfHIx0Rf7tmbVAlehjTmUrqPF7
X-Google-Smtp-Source: ABdhPJxYZw1APvqi4f2ZXgD8Up6Lvmjak/uSUe51iBogOmoSFUmuwfRKHaldmzLUxXTvfQUp1Msmcg==
X-Received: by 2002:a17:902:d541:b0:158:f5fc:2737 with SMTP id
 z1-20020a170902d54100b00158f5fc2737mr5623979plf.114.1650646380141; 
 Fri, 22 Apr 2022 09:53:00 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:52:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 11/68] target/nios2: Build helper.c for system only
Date: Fri, 22 Apr 2022 09:51:41 -0700
Message-Id: <20220422165238.1971496-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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


