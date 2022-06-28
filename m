Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B57855BE85
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 07:51:40 +0200 (CEST)
Received: from localhost ([::1]:60360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o648R-00011E-2J
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 01:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63F0-0002G0-T8
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:22 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:51862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Ez-0008IL-Bm
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:22 -0400
Received: by mail-pj1-x102f.google.com with SMTP id l2so10248182pjf.1
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gmqcmiTjW8Am1AjqY8MfRxNedvHrq6L4BnMrgUFJA4c=;
 b=dazlx0Y12li2+0hdT2HllQzLmT3n3PeyvUSGDa7lGEdLPj0DkvnBgHgspwJVdxfgzo
 YJ1U/klupK5gfjeTILldmrJYQzzzYkwz/k91GO50eMDilSx+3bJnSGjxgEZvvm16thEH
 9iwwI8IXWNkrZy6qH7MZsNuJqJxoongNoznKGJ6UvZxdHIbOBvyzLqOoHRMNuLwNx5F8
 vi8nSU35pcUbf9cAxc9KmxQObtvBGrIrBdHfnY2kX0X43vXaNgOs4Lh8vGucKp+hK4Tn
 Fx3w8xrYxnERAh3xFtApW6M9KGSIWTRePwO4QVhgS2nR2ldU5FsW0Lr7YdupgOw+wigT
 nd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gmqcmiTjW8Am1AjqY8MfRxNedvHrq6L4BnMrgUFJA4c=;
 b=rgqtXhGTWH1206B8V/UEn3qxS/TPGLSWHyHTFMFltNP1+eeh18WMXGZMtBkrk+E3P7
 P2kFaQgAgG3VwcBQUE5NpvqZUDlzoKlvDGZxF7qQya7NmLbayLqgDLiDfKEiBdR09k/t
 TVwrD95vCsYrkLGCH2NPjSuJVIeL7qBSHkI40ETrr1GAoHUFxmp5x0k3YOZNxA5H1sIg
 3rcQs5kec0hwrLpGXpn0Ol30WfesX8NxP4+KDEXK03VoK36Lg4w4lCPVu/bAmxca0+jQ
 EwdRBXocv47n45QSR/WdzzCSsc5LlAUh31AsaJ1vbXQT57jbQk6Jz6saPZRFTUseHdxU
 kgQw==
X-Gm-Message-State: AJIora/l2FsOWAle36EMMr7huWFMuuVBwuOD5SwQTRWMrXtQGb1Gao/o
 yWoMncpxSL42HqvIuk0ibNklN+dAwHFTBg==
X-Google-Smtp-Source: AGRyM1v6F8jzDqX1X7bKrz9LTrG8FnYqQVCI1um5tnk7pqkPkgjPA43bMspHXO3ixuT7p7783ITtCQ==
X-Received: by 2002:a17:90b:2285:b0:1ec:aa3f:8dc1 with SMTP id
 kx5-20020a17090b228500b001ecaa3f8dc1mr4542280pjb.145.1656392059912; 
 Mon, 27 Jun 2022 21:54:19 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:54:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>
Subject: [PULL 05/60] accel/stubs: Add tcg stub for probe_access_flags
Date: Tue, 28 Jun 2022 10:23:08 +0530
Message-Id: <20220628045403.508716-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

Reviewed-by: Luc Michel <lmichel@kalray.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/stubs/tcg-stub.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
index ea4a0dd2fb..6ce8a34228 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -21,6 +21,13 @@ void tlb_set_dirty(CPUState *cpu, target_ulong vaddr)
 {
 }
 
+int probe_access_flags(CPUArchState *env, target_ulong addr,
+                       MMUAccessType access_type, int mmu_idx,
+                       bool nonfault, void **phost, uintptr_t retaddr)
+{
+     g_assert_not_reached();
+}
+
 void *probe_access(CPUArchState *env, target_ulong addr, int size,
                    MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
 {
-- 
2.34.1


