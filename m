Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A2A433D4F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 19:24:10 +0200 (CEST)
Received: from localhost ([::1]:60858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcsqO-0001hO-V0
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 13:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEo-0008V6-Km
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:18 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:43540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEi-0000Fp-FM
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:18 -0400
Received: by mail-il1-x12e.google.com with SMTP id a8so19027368ilj.10
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 09:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IDO/iMrHSL96Jgd116O7Jd5T/GkhrcIYIW3UiDUp82Q=;
 b=3ZQirVZ6/Pp7OzzlCke8locNyDYbhCGPPF0VoPF+c4J6P0EP5QRu32+T1B9+eFjuFB
 cPu0dZk+wmDMg9xGpw60Eo465zhlcmAIXM5Nk9mvgO/iCJ6qpNmDxAd+70JH8GErFkjh
 t5o22/Mq387Z91pQtSmFVHVuS/Ivzd5qjI+NG9+w/rUImmamPsP9FJ6xnnCyxP11+clD
 /Kug+XpNpCEkwBl+Nn6NTuSwQs/HieEEIJRVup8D43aJbS8g+MYWotvNkZBfAmSqR6K0
 USxWTgVgAPZXxM5vPn33xTp+bYFvyuVDUopM5FzGro+mEnrQNey1HTA6RDBaSR6k+n/i
 jPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IDO/iMrHSL96Jgd116O7Jd5T/GkhrcIYIW3UiDUp82Q=;
 b=xSmrTD80NmjiigDlWAlsSXkhdXNR3/k9hkH1y0u+5yLth0W23SbDhW8kco2VapWser
 KCsc5b2xTKgP4KxGiQHAj5seqASllPHYDIa9fZRG16F8rQUgjT1p+9G9EmfJwsHafkzV
 TUZU0Iihuz4t6uCUbUldE09avhS4BzTEWh//bbzDUCPTN9YFc/R2n8isnjMm2PbM74//
 JsXPvJNQMPzd8LPA4PXxilRzAZ7iVfbmcgmjTExLIJQookwwRHpZpA95OwJkh8VG/tuQ
 VDIW8l29gXQXnIhhEEfyDs5pKtWm2pl2bQiqc3kAuG/VjMFZ4HiRLBB2l/7w+SFpnJlu
 FCXg==
X-Gm-Message-State: AOAM530/tIcfaXmSRA+m2iLvBN7zGyBTnZLk/q08nefd5sN0tRqv8zZb
 qelLP/gWZnKl8AZnJ+91/e98ojKQUMSEIg==
X-Google-Smtp-Source: ABdhPJwUBcbVyL884XT3TaviAH5gOGMadjafs/nCJUku29Ti5jq2SZn40cYAjbG/bnzJnZi60Y10Tw==
X-Received: by 2002:a92:cda3:: with SMTP id g3mr18155177ild.103.1634661910717; 
 Tue, 19 Oct 2021 09:45:10 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:10 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/24] bsd-user/arm/target_arch_cpu.h: Implement
 target_cpu_clone_regs
Date: Tue, 19 Oct 2021 10:44:28 -0600
Message-Id: <20211019164447.16359-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement target_cpu_clone_regs to clone the resister state on a fork.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_cpu.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 0f3538196d..c71ec000b3 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -35,6 +35,14 @@ static inline void target_cpu_init(CPUARMState *env,
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
2.32.0


