Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC5762F0FA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:21:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxWy-0001HX-7v; Fri, 18 Nov 2022 04:19:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxWt-0001EM-Sm
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:19:26 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxWp-0005w3-QG
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:19:23 -0500
Received: by mail-pg1-x532.google.com with SMTP id 6so4493426pgm.6
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gbukfi2lhvW+PuRANNKhuCpHW9NS0bt15N8zWXxqRno=;
 b=cspZu4R9G/AOykvKay12p6+YkI8KgGbsEPogDxLSet8fbj04DNVaRVZZkk8um9Xj68
 GZA4Co9/NwFLNbiVvsmaBthe2Baa2PSNx4dHNweUxTI+Z5soU4XycjFTad4WoScvHGoA
 yzGQ1THpKfb/4gxVoZiOqYE4WHpfBlVU2OAsacgqxNT/6ZTKkd7SH82bKLMQ0/waUeb6
 MJaW0LHTbkfyy3hvVeRmlfqN/qyaT/af66tdnfQcX1vMT8IdfKVSkORHuh7sy0nfcRaD
 OXbjenNtptA8fMB35/MJH6xqoW7EJfTTpmUK/vn+t7sy5NUsVmVoxqxg4BryRHTNLaUE
 kZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gbukfi2lhvW+PuRANNKhuCpHW9NS0bt15N8zWXxqRno=;
 b=KPEMvG4gr0C8WiKSap8c617COZtAvCDuSyoK/QfjS+2aRzSWQLwESghm8evnpoJZ6A
 5BXrI/BSg3UiiEcMF7Ksvbp8ptlPy6Noo8OUbiUtYq7pL51bkOGa8sxJcwUKJlI7xsnb
 7g0cQ8oTxCqE8N03Nv8jUJqht2vSV2G1rgjlIfT9bFNdLLapZ42PPirZrsks1bMCbSZQ
 MIzde3pAgnXizKoGuRwStMitBPvBePc7TIpPKwlI6cd5oupViNIr3P1pM0GHSO1quxBB
 zOsHdRWiZVLr4yoUca9g8H5ncuDt488EA4LBUY4J/TN+cPydyaxPxtmN+8UtZe/DXkKB
 mY7A==
X-Gm-Message-State: ANoB5pk/Q7SyZgUxlJ/9yeXa66FO07F1bL9InpXY4318wzikezWtwDV7
 viB9ndIDKTJmDg8R9z+SyV5h7N+ReR4oIg==
X-Google-Smtp-Source: AA0mqf5HBIaK6WYbohPawFwq06ntK/A4AwgbKOiZXlb3a+/i8SlMfURgYtcOY0vxE+HQoHHMr7JuDg==
X-Received: by 2002:a63:a54d:0:b0:46f:8466:745c with SMTP id
 r13-20020a63a54d000000b0046f8466745cmr5945622pgu.87.1668763146611; 
 Fri, 18 Nov 2022 01:19:06 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 a27-20020aa794bb000000b0056e8eb09d57sm2672305pfl.63.2022.11.18.01.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:19:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org
Subject: [PATCH for-8.0 3/7] target/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in
 ppc_maybe_interrupt
Date: Fri, 18 Nov 2022 01:18:54 -0800
Message-Id: <20221118091858.242569-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118091858.242569-1-richard.henderson@linaro.org>
References: <20221118091858.242569-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: qemu-ppc@nongnu.org
---
 target/ppc/excp_helper.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 94adcb766b..8591bb3f73 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -2163,22 +2163,13 @@ static int ppc_next_unmasked_interrupt(CPUPPCState *env)
 void ppc_maybe_interrupt(CPUPPCState *env)
 {
     CPUState *cs = env_cpu(env);
-    bool locked = false;
-
-    if (!qemu_mutex_iothread_locked()) {
-        locked = true;
-        qemu_mutex_lock_iothread();
-    }
+    QEMU_IOTHREAD_LOCK_GUARD();
 
     if (ppc_next_unmasked_interrupt(env)) {
         cpu_interrupt(cs, CPU_INTERRUPT_HARD);
     } else {
         cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
     }
-
-    if (locked) {
-        qemu_mutex_unlock_iothread();
-    }
 }
 
 #if defined(TARGET_PPC64)
-- 
2.34.1


