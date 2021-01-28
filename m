Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 428F530715F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 09:26:38 +0100 (CET)
Received: from localhost ([::1]:33488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l52dR-0007TY-Ar
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 03:26:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52af-0005dk-3B
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:23:45 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:36247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52ac-0005cr-MY
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:23:44 -0500
Received: by mail-pf1-x431.google.com with SMTP id u67so3528947pfb.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 00:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RcEW49jm5cwG5H+YCNoBE8sdtPqM5Tz+Y2fGrDe8qGg=;
 b=cxlXSSgiClkq81TrqpRtxPcNVIFWeuVfDXZmv7bqU53wj6PjOecGXe5wASn08IUnFY
 VHtSgY6N/jsArLV/yDryu6BB8jVc1+S696eJDSc32V5H+bbfT409Y6i2N/02sy0fBMkS
 FxYkuXrEY9elwBseOy7XWmhgTUTVRxrnqMVBxRsfbQRTGHRrHTX2M3zgLRbZurGkRigv
 G3fhE2q9+XuB9lhx0Oq8Qd5z3MTXZZU3bSO74NPFe8qIVjWzFNdYaepV16+YaaG2EP3h
 vZeBlXBz0nonyX0SpHloAnMcFaXZDDMHKldocPYL83SHiRJmJR+c5HjAjplT1KKvIMnI
 6hbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RcEW49jm5cwG5H+YCNoBE8sdtPqM5Tz+Y2fGrDe8qGg=;
 b=CaWzhWUxifjnryXJuilgREGkhsvBLK+BMQqqGZPSRXYTFqipMWn+BTkatPcA2krjdb
 WKn269GkdhKvWj33pjuChMIyBBR1zYgdyrpSUoQDPujMlUJF+kH/Kdtdzlzb/VGb1Xo/
 zcmbT/W47nRjRsQWpDHnJay15nvyXio67hayroz2C3dowDJAlvrByUf8+e1hX7T0kx9G
 QLFZwWqqCmGlfrAYDmpzQLQl8t3wG4XK4Xzxi6T5b6Xbq/AtBp0xC/KV31m4VJHgGr/W
 OkueuEEF5CmJNAcLXrQhwCJbf1Hih46+lQeTmLn+21yJknq8s5TQTWrsKCZ1OPkI8EtH
 FDqQ==
X-Gm-Message-State: AOAM5303taxkQ5cyp8lw6RS3aHdfzCYG+znxYpzQv+Scw2RL/4lwNaR/
 rcgHR53vpqQ+SX+2ePwiVuEtDoXrLSsGM81R
X-Google-Smtp-Source: ABdhPJye8K8Rw1XYkfGYIG+EuST2xfq+9/XINQkRXEnMsxr82gXBStVCBrYT5pNxGKfvQ6DzAIRU6w==
X-Received: by 2002:aa7:86c3:0:b029:1c1:a025:b2ff with SMTP id
 h3-20020aa786c30000b02901c1a025b2ffmr14746805pfo.14.1611822220749; 
 Thu, 28 Jan 2021 00:23:40 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id s24sm4658292pfd.118.2021.01.28.00.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 00:23:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/23] exec: Make tci_tb_ptr thread-local
Date: Wed, 27 Jan 2021 22:23:11 -1000
Message-Id: <20210128082331.196801-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128082331.196801-1-richard.henderson@linaro.org>
References: <20210128082331.196801-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Each thread must have its own pc, even under TCI.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 2 +-
 tcg/tcg-common.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 125000bcf7..f933c74c44 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -544,7 +544,7 @@ void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr);
 
 /* GETPC is the true target of the return instruction that we'll execute.  */
 #if defined(CONFIG_TCG_INTERPRETER)
-extern uintptr_t tci_tb_ptr;
+extern __thread uintptr_t tci_tb_ptr;
 # define GETPC() tci_tb_ptr
 #else
 # define GETPC() \
diff --git a/tcg/tcg-common.c b/tcg/tcg-common.c
index 7e1992e79e..b183db84c7 100644
--- a/tcg/tcg-common.c
+++ b/tcg/tcg-common.c
@@ -26,7 +26,7 @@
 #include "tcg/tcg.h"
 
 #if defined(CONFIG_TCG_INTERPRETER)
-uintptr_t tci_tb_ptr;
+__thread uintptr_t tci_tb_ptr;
 #endif
 
 TCGOpDef tcg_op_defs[] = {
-- 
2.25.1


