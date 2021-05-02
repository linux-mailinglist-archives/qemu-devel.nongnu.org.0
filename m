Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF7E37100F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 02:13:56 +0200 (CEST)
Received: from localhost ([::1]:37380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldMDj-0007xV-Rt
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 20:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLy5-0007jG-PE
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:46 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:52764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLy1-0000cf-9k
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:45 -0400
Received: by mail-pj1-x1034.google.com with SMTP id ge1so2085112pjb.2
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/Lw6h+zhYOb/AKJ1XNWDOgLJcyj6yKfNAsAjmmI79uM=;
 b=Ue87oc3SPFwZtLnF0PmVZ1TwpfrzlmhW082YQvfB+Akd5pMkoZcIF7nuFAoHarnMWU
 2tvfZOq5Xt1OS23m/d6XvtU6cUh9iBmSenKOJQN9M6SLV/K8EdT2vmgswZu+7Q8JcEuP
 +8xdJEoZi0Q9+HzRBXNbvX9HFlaXngsQRaYBF6cUvCS7y8BMZqlNrDCjb5yRstRU0NSc
 t5zXQUQdwsTPDHku/zPSkImkKYM6j0wcagVohkSNWwm6tnXhy/PE9yZUJ5idUuOkFe6x
 XY6zLoyfKEtHekofFtztwC8YY9dc3QDI396Sa5xhKZZXEWwbjgyTZJI+SMbNN/dGH7HT
 fyIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Lw6h+zhYOb/AKJ1XNWDOgLJcyj6yKfNAsAjmmI79uM=;
 b=L1ESPB4mM7ii4+u4h3jmn5ha4Ae33I+997pPm8FI3Oc3IqGv2Sq9mcrrN5y+A9W1Ze
 6xSXGLKrW4PD8Hw1rhYsWsls7XO+5lDymt6I14opDnaEcNOSXoFSk2BvAI319b8sl25n
 vTANQCQx3EGHpm4xyI9J3R1woYQOuVUC6xHI5uvxIH/2IgJI+p/fguneBqQ0ofe85rEB
 K+UUbZTUw2BYnBVfG+HvpTTCMjA6/HI5q3ixzuw0/+qFr90TfwCrLkkozBkoHPicvnpy
 h326E0D8eNQsn7pFNgh8OclnCRQykdnEIYXCo0GZcQwuLCc1JmA10I2y4ooR6YhIMJry
 BlPw==
X-Gm-Message-State: AOAM532jFavFfin+GG/PpjgZb6khwF8bz775TNIMibdYkFQJLR/T8YxY
 TYWTl8J5CzT7PvGqQMrG3yoRwycdZN51Rw==
X-Google-Smtp-Source: ABdhPJyQWsNyMqQRjMFAwGzVawYNLv0ja5Dxh8aqWiifHxuJA3FnHw/t93+h8NtWRGVnO/JmQFHe2w==
X-Received: by 2002:a17:90b:3706:: with SMTP id
 mg6mr27327363pjb.90.1619999859982; 
 Sun, 02 May 2021 16:57:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t184sm8098054pgt.32.2021.05.02.16.57.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:57:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 14/26] tcg/tci: Remove tci_write_reg
Date: Sun,  2 May 2021 16:57:15 -0700
Message-Id: <20210502235727.1979457-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502235727.1979457-1-richard.henderson@linaro.org>
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Inline it into its one caller, tci_write_reg64.
Drop the asserts that are redundant with tcg_read_r.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 5677c3544a..6900c3e891 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -36,20 +36,11 @@
 
 __thread uintptr_t tci_tb_ptr;
 
-static void
-tci_write_reg(tcg_target_ulong *regs, TCGReg index, tcg_target_ulong value)
-{
-    tci_assert(index < TCG_TARGET_NB_REGS);
-    tci_assert(index != TCG_AREG0);
-    tci_assert(index != TCG_REG_CALL_STACK);
-    regs[index] = value;
-}
-
 static void tci_write_reg64(tcg_target_ulong *regs, uint32_t high_index,
                             uint32_t low_index, uint64_t value)
 {
-    tci_write_reg(regs, low_index, value);
-    tci_write_reg(regs, high_index, value >> 32);
+    regs[low_index] = value;
+    regs[high_index] = value >> 32;
 }
 
 /* Create a 64 bit value from two 32 bit values. */
-- 
2.25.1


