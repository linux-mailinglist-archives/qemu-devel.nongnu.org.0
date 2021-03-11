Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB1E337604
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:45:09 +0100 (CET)
Received: from localhost ([::1]:54068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMYm-0000LP-Qu
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:45:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMU0-000386-Q6
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:12 -0500
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:42804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMTx-0006E0-VI
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:12 -0500
Received: by mail-qk1-x72d.google.com with SMTP id z190so20752035qka.9
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QO2Vfh3SDoVnZQbKSwcYrZxIMU26hsw0Q/rupUE+HGg=;
 b=HOFlGWpxJz2UoRSGQpBrO9ob2TEXxH8nkyY+5hZSqIq+SvHUqVwlgg6v8R2ife76YM
 KeMx7cBp/mwIfR0hNPmrjdoUEDCXbMjbOVLS9kOLW8+16dVZh7qRXib0SAlV40pREBgG
 heI5HwtCi8KZsiW6kCB7i1XNQdMYdrAeoeQujao+foMwkvBzL3mJ3p8dbGBnrsKpDwbg
 VmcprOUGMVQoitHo8FV3x6/h+NzE/8Vn+j28CRW5k4LY59Uyrdc+5dO256afUBurDEp3
 8aOS87CjkluvObgs91MLNgd6Q7F2fcU6MnMfojyCvnadwIa26FWjj1RFyNVdLLITgfie
 nEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QO2Vfh3SDoVnZQbKSwcYrZxIMU26hsw0Q/rupUE+HGg=;
 b=CBN/6jomkpYwXCQWq9RT3LzWHK4aOQNQujdgUMHRNQUlMJBwJ4Yf4OP9F3PsMW43ZL
 2xs/+uwmt9DutDZBaLfTajv0ONN6w4zTEHj83FG03qhn3wGeps5mWMJRYNfEkG0TqnAd
 eCE+33ksebAHxccXU0CpkPJvlFkK++lNZpMbmssYElsN9lhCO1K3rJXvZw7YVdDLzBc/
 arOKljCcW/JJYK7jIjZJk0auEcpr+v2Lt8MBoH56f0bWAoBWd6kwDZ+9Orv9AN5i7C9I
 LO+vyUR9nRhK6VHx5WwpO3F6zqULrq5OZkWClg8JoIzKeFGJ7UiMZ/aYo1eMVSOjvpQH
 03Ew==
X-Gm-Message-State: AOAM532iJ9HXxtb4Nx+rMKuguJ/zxFqiZVv7a/B71fgzeYhSXOFsf58h
 0bIBC/tDKHSebSZaqXQV8ICry1f/waxJfAv8
X-Google-Smtp-Source: ABdhPJyZo8JZdotWZ2y8rEEWkKjhw1ML3Ca6jno2wYV3JREg/Gchl79CpfjSlQ0UfeIO1LKPTOu4wA==
X-Received: by 2002:a37:46c5:: with SMTP id t188mr8037260qka.47.1615473609093; 
 Thu, 11 Mar 2021 06:40:09 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/57] tcg/tci: Split out tci_args_l
Date: Thu, 11 Mar 2021 08:39:08 -0600
Message-Id: <20210311143958.562625-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index bdd2127ec8..6e9d482885 100644
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
@@ -417,9 +422,9 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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


