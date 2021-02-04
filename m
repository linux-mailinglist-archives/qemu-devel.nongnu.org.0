Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A5730EA22
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:25:28 +0100 (CET)
Received: from localhost ([::1]:52092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UKl-0008BL-CD
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:25:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjJ-0005Rg-Ly
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:47 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:45514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjG-0003z3-Nm
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:45 -0500
Received: by mail-pl1-x62e.google.com with SMTP id b8so870455plh.12
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v4sc5nm0f4c/U5WbNEJOfl++DRfDxzP3f+V/F9gDHfw=;
 b=whrQNSZ7YOQk5yTbZlf4volSG8dr1SYfIVlzZkFxLJDz/gA1XgH+XEehaEmOYxFgAW
 7wGbo7ZWzkHCIcoR9WWuTk5mSF75PqKuziUg6tuH96ui0DDpPwURTNimMFx6Y0HLHBvv
 J11N/0Q5+8zN6DVGCT4gA5IyaRW6+kLPoN3Q+JlveuwePWLjl6eFxEKzgldbeVZLHcMW
 xhkOP2n65YE6po1lR4k1IDlrspVizZ3u1lJ8J8dyv2Ke8JHmyRLh+KmVEwOiqc+z+uzp
 FARBmpxykw05pZMLpsbsJTYxc5MV5ruq/C/VgsGvUEECRabawr4Uhip1GfiIg2Fjb6DU
 JlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v4sc5nm0f4c/U5WbNEJOfl++DRfDxzP3f+V/F9gDHfw=;
 b=BnhS8+c/jFUAw1YU3SPdcPYAU8q2a021bPQpD3r12cTVbs7iJhH3vd9qrxoAPQqz8E
 QUzT0sVhwCrqBh2CZns6kWGQ5Eq4THRyklJrBi8qlFSAFqdEbk07DU7A9kqHt18MXy0s
 /IKNwBxlNGWpuDN6D7JaWGIfHWOzaUcj9+AJhhA3EImsJv6O08tw5TBQyTpYnmtvSUil
 hfyY6mWNea7XZjDEpTR5fR+bYkNKqF+V3XnxQQ5RJ9laATk1dX7pDeAdu5h8x8fwZVR0
 AKvOVdnuCT+DWgLIx7HTooWvrH974XgBn0cPqKFKQhYe7t4tq4d/KAmETflxdv+EVrK4
 yLjw==
X-Gm-Message-State: AOAM5308wrexCrDH4lEkUNRLBjDByYSVSBWEtTgGO3pp62vFAXKU5b5H
 LY5tey55Z9EX2K47niuS6IKknQCVieRYijEr
X-Google-Smtp-Source: ABdhPJxcaubt4QKsvQdLX7jGvMPCUm2JXuClTf+Q913ehmBAcnGROIW7nUN2k8qbf4xiz/B+WJqyBg==
X-Received: by 2002:a17:90b:23c2:: with SMTP id
 md2mr5845606pjb.222.1612403196885; 
 Wed, 03 Feb 2021 17:46:36 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 47/93] tcg/tci: Split out tci_args_l
Date: Wed,  3 Feb 2021 15:44:23 -1000
Message-Id: <20210204014509.882821-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 86625061f1..8bc9dd27b0 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -184,6 +184,11 @@ static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
  *   s = signed ldst offset
  */
 
+static void tci_args_l(const uint8_t **tb_ptr, void **l0)
+{
+    *l0 = (void *)tci_read_label(tb_ptr);
+}
+
 static void tci_args_rr(const uint8_t **tb_ptr,
                         TCGReg *r0, TCGReg *r1)
 {
@@ -434,9 +439,9 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif
             break;
         case INDEX_op_br:
-            label = tci_read_label(&tb_ptr);
+            tci_args_l(&tb_ptr, &ptr);
             tci_assert(tb_ptr == old_code_ptr + op_size);
-            tb_ptr = (uint8_t *)label;
+            tb_ptr = ptr;
             continue;
         case INDEX_op_setcond_i32:
             tci_args_rrrc(&tb_ptr, &r0, &r1, &r2, &condition);
-- 
2.25.1


