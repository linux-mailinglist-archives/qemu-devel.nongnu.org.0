Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74550466B2F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 21:51:12 +0100 (CET)
Received: from localhost ([::1]:37760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mst2t-0002fL-9a
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 15:51:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mst0t-00005j-Ss
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 15:49:08 -0500
Received: from [2607:f8b0:4864:20::52d] (port=35377
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mst0s-0005TG-1C
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 15:49:07 -0500
Received: by mail-pg1-x52d.google.com with SMTP id j11so944480pgs.2
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 12:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0fNsQKzzBZbMkBXxBO24tuTvZHmRZOZnsAlV3uXSDeo=;
 b=jBytbe8bMMFoNaZXIYk3XfiE1gM/pyEGmB5lmgNrS6Uddr6MvZAe63s9QY1bfrFkWm
 d6cq0dNB0x4t2xFFo4ZjVAl8p3lyOyTSGgMrsBaF36ZwUn5kTEaXveKhNHXHVezhzf4L
 EHofr990PF6KQ0tJCxFJmh1tdLg5uRNjpzJmwHAC5Kzj9606wDoW2Mp1VOpcRzYpZLjc
 d0pxxtb6qpz1HwlLVFpKFIA1zH4OLD7mJcjLT7YeL53dmpm4Fe247nw698XHS7q3UOCw
 lASaIDVdvYeVslvNajAOFwcDxZsyrnSdS4Y5pLzqD2iKdGkkgrhc325zg827TZONdV2O
 aq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0fNsQKzzBZbMkBXxBO24tuTvZHmRZOZnsAlV3uXSDeo=;
 b=ELMvTrNnVf4JF6SH0Aciv0iqahv+Ito/9v05xN1sn2DMw1CdmEcjYENU4NC4n8exDp
 uuT6lL0AE8Ts8Lt9DEGNnXr7MqkPEyzGDqlBPUEcXd5rJWWLBLW7SSZ2UwCvTp90z7Ap
 0TtKMrlfUT0PwAq6YJRtpPNyoPWnGgWud/5R+b1l1uFkDoMp/2CIv6nr4oIEeE3v8r4T
 aov0jrw7qRFJxkLdT/KdFzGeajn91PaygPyR377vGNsZ7UaPX9K47jou7F//NcGJ6wgJ
 00C4laYjRaFTv44D92/+3K5FnQE9sidAJyWa1JFN+BNE28sSsC/kVCTlMGN6oV5L5iF0
 x2RQ==
X-Gm-Message-State: AOAM5336Y2IVgwkUpMn9FemjfR66IyfosmhUpstuHyWNvT5aH8Ga7LE2
 0l971Plo3Pzo0OsBOc4/55M+338efF3vpQ==
X-Google-Smtp-Source: ABdhPJwfzzJmklY3kDF3lUzdm38lfu9e128iimbTCo3xvhSLgFFR5WEp0a0Gld/v7nrPECof/jQapg==
X-Received: by 2002:a05:6a00:807:b0:49f:d6ab:590c with SMTP id
 m7-20020a056a00080700b0049fd6ab590cmr14979052pfk.32.1638478144559; 
 Thu, 02 Dec 2021 12:49:04 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id pi17sm3721391pjb.34.2021.12.02.12.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 12:49:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/15] linux-user/m68k: Handle EXCP_TRAP1 through
 EXCP_TRAP15
Date: Thu,  2 Dec 2021 12:48:49 -0800
Message-Id: <20211202204900.50973-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202204900.50973-1-richard.henderson@linaro.org>
References: <20211202204900.50973-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are raised by guest instructions, and should not
fall through into the default abort case.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/m68k/cpu_loop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 396f98bd6c..0de11fb9bf 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -45,6 +45,7 @@ void cpu_loop(CPUM68KState *env)
         case EXCP_ILLEGAL:
         case EXCP_LINEA:
         case EXCP_LINEF:
+        case EXCP_TRAP0 + 1 ... EXCP_TRAP0 + 14:
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->pc);
             break;
         case EXCP_CHK:
@@ -77,6 +78,7 @@ void cpu_loop(CPUM68KState *env)
             /* just indicate that signals should be handled asap */
             break;
         case EXCP_DEBUG:
+        case EXCP_TRAP15:
             force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
             break;
         case EXCP_ATOMIC:
-- 
2.25.1


