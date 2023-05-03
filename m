Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9FB6F51A0
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:33:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6tN-0003jX-P8; Wed, 03 May 2023 03:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tI-0003Ja-JW
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:08 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tF-0005a3-Pf
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:08 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f1950f5628so46361455e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098824; x=1685690824;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cSo1+AMJGaRkyGN2dhJQ1AhgSMEAPlcpn7H2/sgsup0=;
 b=rQ6vElbYCoTWpU+k1Ws1wjoC/yA5VSTGqR+Ip0DmJM0O7vQKBev2QY00x03xm4C7mR
 caR40XgiKkq9o2a6WPuiZPsVttpD2ngqwd2oh48h2961Nvoj/O5tmOOATbxgd8lOF1LW
 o4Btwe3/xS6Y/OApbQ0PxNVkuG+yYSpZ5FoCnqfdGluuv9Eo27dXcwOlhFD9AG4B6499
 3Sua0UHzK8sczrPxcRDyP+R6RTUihjfiB2yJlY84ZgC7E6U7Lw9nSMmhj8ha4/rcyhv+
 oRTrlabjhpgNPof/0vmsGMxzNswojvL2tDBxSwF6v8DnlsKxboPn0hexGFHRBSrqTnxC
 0xqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098824; x=1685690824;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cSo1+AMJGaRkyGN2dhJQ1AhgSMEAPlcpn7H2/sgsup0=;
 b=iUDQrEnuRn2lLvpWH7ZJ/FCcFW0i2jBRT/sLL4Y1F4E7s5NjxkV0zK5t113OliRs4J
 HMNqj+6ToJRYXDQhzrdSJ7Q14njvHunb71zjuIV5RCPE9rsFo/iKbl+T1aOd1R8rLkBL
 23SCn6oWZf/JPnlhLkKlSv/gZIyA05PcyEXugiZfvsWEXRGCrh5tS5/5m+ZO7v172GF1
 DE1WIClqj0wr0bFMc4t08oe1CD8/mbA9YOdPF2/fkZpnkfOvcjyAdQ/uNvUo2q30ByC1
 Y3U77Bv33+RPW6lYAm7mUBMLmnpUm0gmVhrn/6hvHz8xuSDqDWd0380qnZtEuAhK/PU1
 T7ig==
X-Gm-Message-State: AC+VfDwHuIkEcXy238H83WJwigpByqhDTM0MeoBumtJw3Xrmw+IlECIl
 XKAMFtxm3VWCW8c8lfWdlzOwJGNPGfqp4Yuqz8nw6A==
X-Google-Smtp-Source: ACHHUZ4XOlx9Z8fixz//Afh/k7D/dSgxBwSme14wxGnSYtfY8+Def2bVRNVfN1yWp7uEsrYcB6Bz8w==
X-Received: by 2002:a7b:ca56:0:b0:3f1:6ec5:3105 with SMTP id
 m22-20020a7bca56000000b003f16ec53105mr13776990wml.20.1683098824304; 
 Wed, 03 May 2023 00:27:04 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 41/84] target/arm: Fix test of TCG_OVERSIZED_GUEST
Date: Wed,  3 May 2023 08:22:48 +0100
Message-Id: <20230503072331.1747057-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The symbol is always defined, even if to 0.
We wanted to test for TCG_OVERSIZED_GUEST == 0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index bd75da8dbc..7b7ce65c7a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -393,6 +393,7 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
                              uint64_t new_val, S1Translate *ptw,
                              ARMMMUFaultInfo *fi)
 {
+#ifdef TARGET_AARCH64
     uint64_t cur_val;
     void *host = ptw->out_host;
 
@@ -448,7 +449,7 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
      * we know that TCG_OVERSIZED_GUEST is set, which means that we are
      * running in round-robin mode and could only race with dma i/o.
      */
-#ifndef TCG_OVERSIZED_GUEST
+#if !TCG_OVERSIZED_GUEST
 # error "Unexpected configuration"
 #endif
     bool locked = qemu_mutex_iothread_locked();
@@ -472,6 +473,10 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
 #endif
 
     return cur_val;
+#else
+    /* AArch32 does not have FEAT_HADFS. */
+    g_assert_not_reached();
+#endif
 }
 
 static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
-- 
2.34.1


