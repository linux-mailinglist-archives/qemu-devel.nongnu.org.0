Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A146A4396
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:02:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe4t-00019k-SS; Mon, 27 Feb 2023 09:02:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe4B-0000eB-ST
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:29 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe48-0007Y0-J3
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:23 -0500
Received: by mail-wr1-x433.google.com with SMTP id h14so6337939wru.4
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0HDhvD5xSaakovM1bRp/U074mbpNZA16y8F0RLm3wAY=;
 b=Sj5jP/yTdFoAkecfQvfdeh42lr2ulSkySYpL4tAaIIlNACzRcUykV1ASZBZqDliQsf
 GHCGGG/HrYAmoRmAlt0UQlmlyNNKsoEM4ohmGjbNZcBpc7yqcdkMtJc3HFSZquwwjyg7
 +Mj7UkKZqQCuiXtVBwFDfBUoMzTGLYPIvc4VCWysJ1vYXsMkq7onRFA8WzGds5AAzzOZ
 F9ebpGjxIFkoSfqhhtT2kz2S12oUnl4HmxeDTkqCbrfeLbswvPUxg4weh6s7Brl+koHa
 aS5XlsiWN50I49gkh0Pw/XJL/I3Np+8uGgim/0aPfhw7qo69ft1c7L5mswG412+DNAKD
 70lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0HDhvD5xSaakovM1bRp/U074mbpNZA16y8F0RLm3wAY=;
 b=YnbZP67SYrUBqxgk0+lkvirRioLvfUoB0RfPg3gN0eAEAVdZ2tL3g3ohz1aAeMTT0x
 oEua9uhj+wGVl+VKmEtFVJSXqO9y3LxQ342JEsB4ufn3lgdWfNLEGEVW0ycwPinfqORm
 EUx1Al/05W4KKu5LJDY6fodCwRViQFKGWE0lMQDmY+Opik4Oi63TFSPKeF1Goi6cYscx
 eKq/6kHpc3Lx6fdlRnBJleig4JHSOwECUNS9dRbhU+fPodAyjBx8pLs9EgDqj9LxomZZ
 jqeV/MXShc0djPtAdioiho6IwOpAkQUVPs2Xe7f6XxjCVb33lLCPmZLTj8url0/OkGBC
 F5Gg==
X-Gm-Message-State: AO0yUKVRd0Shulb46yukkK49t5KyYM0mTqMkjQRTcz8aRgOHL/Uc9iAY
 EpwhORka6NyC+C4jPuusipQskIKUqCEkwoc2
X-Google-Smtp-Source: AK7set9TB2RCvG1J81PlhLgZxPH/Z/hWvpzqgwsBr78sKlPEyuCFIn3DhiGbZFK4xX47JL5s18v0kQ==
X-Received: by 2002:adf:f386:0:b0:2c7:995f:3030 with SMTP id
 m6-20020adff386000000b002c7995f3030mr7859613wro.60.1677506478827; 
 Mon, 27 Feb 2023 06:01:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a5d4249000000b002c5598c14acsm7158514wrr.6.2023.02.27.06.01.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 06:01:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/25] target/arm: Don't access TCG code when debugging with KVM
Date: Mon, 27 Feb 2023 14:00:47 +0000
Message-Id: <20230227140102.3712344-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227140102.3712344-1-peter.maydell@linaro.org>
References: <20230227140102.3712344-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Fabiano Rosas <farosas@suse.de>

When TCG is disabled this part of the code should not be reachable, so
wrap it with an ifdef for now.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2b125fff446..be0cc6bc15f 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -254,6 +254,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         ptw->out_host = NULL;
         ptw->out_rw = false;
     } else {
+#ifdef CONFIG_TCG
         CPUTLBEntryFull *full;
         int flags;
 
@@ -270,6 +271,9 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         ptw->out_rw = full->prot & PAGE_WRITE;
         pte_attrs = full->pte_attrs;
         pte_secure = full->attrs.secure;
+#else
+        g_assert_not_reached();
+#endif
     }
 
     if (regime_is_stage2(s2_mmu_idx)) {
-- 
2.34.1


