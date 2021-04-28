Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3E336DF98
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 21:37:30 +0200 (CEST)
Received: from localhost ([::1]:52406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbq01-0007iA-NJ
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 15:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpxA-00062e-H7
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:32 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:46691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpww-0004h0-C7
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:30 -0400
Received: by mail-pl1-x635.google.com with SMTP id s20so17589415plr.13
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 12:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PRTcQMn0YPUCpUcreJVsTHoENIvP8EOBxAb8mB7Aw3E=;
 b=Wwi4WIolU4dwNPk4HObG5X5wv0In4rWTpOAw992om0JNn+LVUb8RblxunApMSTQE3Z
 SQDSSSIetrrIP5syZ/EUnZMGndbdlDMtCzeW/LvMHmpniTtmRMM+kPvTAi4i2u/4yQRb
 IQTzVrQH6DkmGaonzxPgKh8Kx16XbAsTuHBj05fqQ6qyEyfxe+JzOE3KSb7gVuvP9ahO
 RQqY2R/4VI8UYDMIExkQau0mS7MfDQPyvxTTb7Mx45YwWrftQrMDbfaD3gujJgYKTujR
 mogpYPYqxZxDiQ4d8c14Qt2M9KxDFwe50HKA0scQnbtsqrdkj17GxK4YVzhLz90Ua+27
 ttmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PRTcQMn0YPUCpUcreJVsTHoENIvP8EOBxAb8mB7Aw3E=;
 b=nT3gr/QX9rDp/eBUQx+AfQ/oNxOJUfdqZgB8WoLJYlmKpiTtFhJNGjrH+FpCH6aPsz
 yH4MhOzq16b31x4FQ1rmv4MNUkSYa/5pJF/atzBl0eoVwkLRfpU/340PfmlH1bz2XWKC
 8mdwOnQLL3B5T/nN/E0KjI7Vl898h4yCQ+3Mm89khnl6KTBm9XXfRyywAt7kbE3P8dvz
 VY3f3lIHhzS71VLlDKLZEZPnndqqBCmjnk+7JID66JqJiAUFaUwBhdy4pEnMYABLs1tL
 n1O9wwAXUJWUgB1Ic5hwBwiuRIjrvNNShQDQUjDHqXyfgT80XrTTWtJb2FtFkKeAiLGs
 oGzg==
X-Gm-Message-State: AOAM5303B4bW4okKi10gmsMXmT4+6qJ9UQmhQGpcdO2IZDsiM3Xgr85p
 /F713c0R/Spjh3tvXD8piAuWFuPm6qaE6A==
X-Google-Smtp-Source: ABdhPJzLMKeXtON45Bgrk83Wsk2HUP7kakwXp0E3BjLDbOMnj6MLGLj3HvyiCwGn7vQ61mctU1S+oQ==
X-Received: by 2002:a17:90a:8816:: with SMTP id
 s22mr5384598pjn.25.1619638457028; 
 Wed, 28 Apr 2021 12:34:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id h21sm403725pfo.211.2021.04.28.12.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 12:34:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/15] linux-user/s390x: Fix frame_addr corruption in
 setup_frame
Date: Wed, 28 Apr 2021 12:34:05 -0700
Message-Id: <20210428193408.233706-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428193408.233706-1-richard.henderson@linaro.org>
References: <20210428193408.233706-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: thuth@redhat.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 laurent@vivier.eu, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The original value of frame_addr is still required for
its use in the call to unlock_user_struct below.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/s390x/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index bc41b01c5d..81ba59b46a 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -168,7 +168,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     env->psw.addr = ka->_sa_handler;
 
     env->regs[2] = sig;
-    env->regs[3] = frame_addr += offsetof(typeof(*frame), sc);
+    env->regs[3] = frame_addr + offsetof(typeof(*frame), sc);
 
     /*
      * We forgot to include these in the sigcontext.
-- 
2.25.1


