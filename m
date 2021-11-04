Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F09694454BC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:14:51 +0100 (CET)
Received: from localhost ([::1]:48062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1midVz-0006XN-47
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNg-0006St-B0
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:16 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:44930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNc-0000xM-R5
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:15 -0400
Received: by mail-io1-xd33.google.com with SMTP id f9so6915754ioo.11
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 07:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IOY3t4AaHZe80iw8hQcSliA4Md0iNA8hrA2Uy7U0qF8=;
 b=3wOxFoT9veo1eOphH18qdcn59J2C93hUkwM/NkU1yVgNIMH2qAFRtpwnF5W3YQa4xQ
 vWJJ+kD7mQ2F42CqeJknTFvU+ZJt/ymqRGK+XUSB81DslTjCdQmvvDy7gqR5R6T+MM3U
 xiKLRKOKIxlcUHpJxGV7FgSjn3LPDJEo3ph2RopzJmwcHTctrAIgXy+lP1xBdUKdwfUP
 i5Q6pwpASdWSaKAkJ1EAPxSXVikCsSs16HDHYPiZbx1TWJj06eJBsqLTp+4MUS1FTJI1
 ONEhWaO4l0yCmz0YqWcSqpl7uA1C+T2+hByJ6M3LbokrHZXwz05Jz+Y9lvHEOnE97Ctf
 7MEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IOY3t4AaHZe80iw8hQcSliA4Md0iNA8hrA2Uy7U0qF8=;
 b=SVXZC1w6sq2mE/L/Fp6f+t1KfNdcX8rDDhF6UOpwYV5Qs+elGNq2JPP5l5J77024uH
 bcb26IRu1EJfOZZaAvcjD34fBNvqeFcnxphjf8/zzi7AsScFllV1lU6/S+TrzC6JXUY+
 mym60e9358YnKuAgKzGmU2Vnywbe4UpjlnGWwc/uML3KgUZLGSHqogcHuHPrVJ1P+T4L
 mjAxFMoOFixk6Kfaco0e7uINrroUjLfJNNOT4LCpwbwR0pGOqHjFLByF5NH5KLJTeEp+
 YzUJZ7ZnYItoL5f0KUo9cxo1VleSsyT+BKn/Lhti9tlXNjfz2n8QRJafSAcuyZwcNFUv
 imFQ==
X-Gm-Message-State: AOAM533P1vF+YsGRCqCUN7q+QRb1Uls42ExL9qzZBNmkJRm7ykBL2kZA
 qbH3eO8U6du+MKY+3GyrHsDkueNgtYc7IQ==
X-Google-Smtp-Source: ABdhPJz3OvExpkbOPR4TkCNn4ZGaW4uxxc9sOSuGWBleIkgWm+C5x/RWznBF8q7O66uc1Ad0TFlbcA==
X-Received: by 2002:a05:6638:dcc:: with SMTP id
 m12mr3997759jaj.143.1636034771644; 
 Thu, 04 Nov 2021 07:06:11 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:11 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/29] bsd-user/arm/target_arch_cpu.h: Implement
 target_cpu_clone_regs
Date: Thu,  4 Nov 2021 08:05:12 -0600
Message-Id: <20211104140536.42573-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement target_cpu_clone_regs to clone the resister state on a fork.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 66215684d6..fa45d9335d 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -36,6 +36,14 @@ static inline void target_cpu_init(CPUARMState *env,
     }
 }
 
+static inline void target_cpu_clone_regs(CPUARMState *env, target_ulong newsp)
+{
+    if (newsp) {
+        env->regs[13] = newsp;
+    }
+    env->regs[0] = 0;
+}
+
 static inline void target_cpu_reset(CPUArchState *cpu)
 {
 }
-- 
2.33.0


