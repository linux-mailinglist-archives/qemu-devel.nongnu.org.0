Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A75397627
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:10:16 +0200 (CEST)
Received: from localhost ([::1]:58498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo623-0000vH-Bs
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:10:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tS-0002K7-4n
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:22 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:38557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tQ-0002YO-2b
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:21 -0400
Received: by mail-il1-x136.google.com with SMTP id j30so13205598ila.5
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 08:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=96MdQtU0BSbNGcXy47ET9P+looUQf1bTMqbGZJ5cCdY=;
 b=Ww6ydKa+L3a61ZDvqJiGZ6MtF6JFr9nJZRckNrRPWsnKyNH1pB+BFIVJ35q7lNWC7W
 gM9NGbSfsn4TEGzHOhyydXZf94tq0YpxWAl2XgJkyyRJ7QPSvsAP+ElEisus56Ri9poS
 cDOjFpj7geu0MgcOJX2m369bnTMcubLR/ygcleN+PgYRuV21kXG9l9c7inb1pyp5vP1b
 9NKw+OPJuyX5e6pQHavM2aOKFPK9RX8RBMEA879Z+J9OvsWGuRkyWf4Wj9n3ryLASDTv
 Cy9i7ATAHQQhQYmy6T/iRlToQmZJPuitzhZvrqfeohLlan5PiMnMOFMn3FZttTv6c2IT
 7U5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=96MdQtU0BSbNGcXy47ET9P+looUQf1bTMqbGZJ5cCdY=;
 b=Uo1i4ytTSRjiAmHCbI1Yeu2sMkoHJV9uvGIeEavy3HCSRXvNFum7uV/VW6J6oG3AZz
 c/TXrX2FGi4gR1qMu8syCM7LNULypzq3igaG6gUQVL+U1L08zmfl5hNIhXc6XMNaCy8+
 ZrIzgqVVfwrh6TAcZIvp5BFQH2/5STprc7qDFfsHfp1mGdOiJH47Xm6vW2/3h+W9Q5ue
 zzUxWOIWorkhEf1osDjM3Kf+tul4zKyDP8JQsnlZ/CwH0j2pxAckyU7IHQnf7MjKik4z
 solh7ueaM/srPqExYCv5Rfx+H/n7VnqWKNpFra/VRJS91NuZJVrZLnVdvSNmYp+bG5gB
 9SjA==
X-Gm-Message-State: AOAM533LVspRPXtxDCOY75J923cxac62lVVOFxV33O6Ea6ghda2InSMf
 md9MmIo/R5u6tNjcOe0nc+IX2iDyAqB8db4P
X-Google-Smtp-Source: ABdhPJxp58uFiVCnaWOzbStxhqHdRs0w2h4+zG80umIK0RiuUE2FIeVRhnIaJpgCpajnzSyjXDTurQ==
X-Received: by 2002:a92:c268:: with SMTP id h8mr21067385ild.299.1622559679034; 
 Tue, 01 Jun 2021 08:01:19 -0700 (PDT)
Received: from localhost.localdomain
 ([2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f])
 by smtp.gmail.com with ESMTPSA id f8sm4109909ilj.37.2021.06.01.08.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:01:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 07/27] tcg: Add tcg_call_func
Date: Tue,  1 Jun 2021 08:00:46 -0700
Message-Id: <20210601150106.12761-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601150106.12761-1-richard.henderson@linaro.org>
References: <20210601150106.12761-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x136.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/internal.h | 5 +++++
 tcg/tcg.c      | 5 ++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/tcg/internal.h b/tcg/internal.h
index c2d5e9c42f..cd128e2a83 100644
--- a/tcg/internal.h
+++ b/tcg/internal.h
@@ -32,6 +32,11 @@ typedef struct TCGHelperInfo {
     unsigned typemask;
 } TCGHelperInfo;
 
+static inline void *tcg_call_func(TCGOp *op)
+{
+    return (void *)(uintptr_t)op->args[TCGOP_CALLO(op) + TCGOP_CALLI(op)];
+}
+
 static inline const TCGHelperInfo *tcg_call_info(TCGOp *op)
 {
     return (void *)(uintptr_t)op->args[TCGOP_CALLO(op) + TCGOP_CALLI(op) + 1];
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 6e5b70215a..205b2b7106 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2308,7 +2308,7 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
             }
         } else if (c == INDEX_op_call) {
             const TCGHelperInfo *info = tcg_call_info(op);
-            void *func;
+            void *func = tcg_call_func(op);
 
             /* variable number of arguments */
             nb_oargs = TCGOP_CALLO(op);
@@ -2322,7 +2322,6 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
              * Note that plugins have a template function for the info,
              * but the actual function pointer comes from the plugin.
              */
-            func = (void *)(uintptr_t)op->args[nb_oargs + nb_iargs];
             if (func == info->func) {
                 col += qemu_log("%s", info->name);
             } else {
@@ -4344,7 +4343,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
     int allocate_args;
     TCGRegSet allocated_regs;
 
-    func_addr = (tcg_insn_unit *)(intptr_t)op->args[nb_oargs + nb_iargs];
+    func_addr = tcg_call_func(op);
     flags = tcg_call_flags(op);
 
     nb_regs = ARRAY_SIZE(tcg_target_call_iarg_regs);
-- 
2.25.1


