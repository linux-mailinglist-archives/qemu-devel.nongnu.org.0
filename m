Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBED3BAE5C
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 20:41:34 +0200 (CEST)
Received: from localhost ([::1]:38654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m073d-0001OJ-Kg
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 14:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m070Q-00022o-Ml
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:38:15 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m070P-0006Rk-AD
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:38:14 -0400
Received: by mail-wr1-x435.google.com with SMTP id t6so9320692wrm.9
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 11:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u7pq/plXZYF6CkchyohXlECRjOPB05y9Xo+CLcNMUW8=;
 b=sSZC9TLGxan2y/QPX2bBbBbZSO4oc5xvKtrMEiWZqfwSNP9sKgr+LNZj4L+oyPUYbn
 BVzO3iq8+tEZTLoKRuNDsziDtZTFc5+XfsyJh1kzvgHsKlhb3ikRG4kYu5ds4sVEhzGB
 BiFKZK8c4ooo1bNMgcCCqNL6Wi7NfOzsWWQ0euHBpTfLAxSbFkfNNDqdqoSRBsUK1Kna
 8qY+BEtieTBaArd6yZAtkSc5x9Wv8mDjMmmmgzF86mWuy15IN+zpzT9HK+ALY/bh8/OP
 MynxcW0I1p5Ozgl1pXOPSi7AVyMLctRPlWBcIojYcvnVzK4S8fc9xjAkJf+7ZIi/Bqk0
 YR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=u7pq/plXZYF6CkchyohXlECRjOPB05y9Xo+CLcNMUW8=;
 b=d80ts7GeUzG6vDyqWWvRzsGhVWIzkx0YEVQbw8FflIJgDqgC1dWzbsK2W5WEQzPDbj
 XHqMYEmMWGFwO3K1dgiy4h3SLP9gXLbMxwDdaU3aBIkheJ/86yPcOSnI4VN9vkM034Ht
 HrxKPGC6zdnvouFBrhXiyo0A8BxJzchfJ0t8civ1S9j/L9lSOxM26H5KjkHReM7npIYu
 R8tnI8Uwtasel+y9bgMiWIbqexKDJoZh1tn0NKOHd5UMdcybWP6z4iF0Z6lUPnceW4Bv
 3fBUvQA4BE1e3VzpAAgPUun4/6XbZ+tWv0eDG3jBgGCvEev6gB0U/lV/PZMck+L0SQV4
 jrxg==
X-Gm-Message-State: AOAM5328Ls6iEABormEA3rE+dKUNG/W9rHW7yHjBzWKDxOif0BseO94O
 2GspnpNw9IgYIAVRSXELMIYlrYj35Zs=
X-Google-Smtp-Source: ABdhPJzOQpL77PHdJ8VxjBmJjmAt5JMaEoMBT+hqlLRCBK+3o53JeakwzeFrMLfi3K6yxcKDrTmYhg==
X-Received: by 2002:a5d:52c1:: with SMTP id r1mr11546808wrv.294.1625423891850; 
 Sun, 04 Jul 2021 11:38:11 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id u15sm19186421wmq.48.2021.07.04.11.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 11:38:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/12] linux-user/mips: Handle TARGET_EWOULDBLOCK as
 TARGET_EAGAIN
Date: Sun,  4 Jul 2021 20:37:46 +0200
Message-Id: <20210704183755.655002-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210704183755.655002-1-f4bug@amsat.org>
References: <20210704183755.655002-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Helge Deller <deller@gmx.de>, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Taylor Simpson <tsimpson@quicinc.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Linux kernel defines EWOULDBLOCK as EAGAIN (since before v2.6.12-rc2).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/mips/target_syscall.h   | 2 ++
 linux-user/mips64/target_syscall.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/linux-user/mips/target_syscall.h b/linux-user/mips/target_syscall.h
index dd6fd7af8ea..3e558fdb4b4 100644
--- a/linux-user/mips/target_syscall.h
+++ b/linux-user/mips/target_syscall.h
@@ -21,6 +21,8 @@ struct target_pt_regs {
 };
 
 /* Target errno definitions taken from asm-mips/errno.h */
+#undef TARGET_EWOULDBLOCK
+#define TARGET_EWOULDBLOCK     TARGET_EAGAIN /* Operation would block */
 #undef TARGET_ENOMSG
 #define TARGET_ENOMSG          35      /* Identifier removed */
 #undef TARGET_EIDRM
diff --git a/linux-user/mips64/target_syscall.h b/linux-user/mips64/target_syscall.h
index 8594955eec2..c54374c5a29 100644
--- a/linux-user/mips64/target_syscall.h
+++ b/linux-user/mips64/target_syscall.h
@@ -18,6 +18,8 @@ struct target_pt_regs {
 };
 
 /* Target errno definitions taken from asm-mips/errno.h */
+#undef TARGET_EWOULDBLOCK
+#define TARGET_EWOULDBLOCK     TARGET_EAGAIN /* Operation would block */
 #undef TARGET_ENOMSG
 #define TARGET_ENOMSG          35      /* Identifier removed */
 #undef TARGET_EIDRM
-- 
2.31.1


