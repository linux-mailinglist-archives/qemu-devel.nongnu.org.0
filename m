Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9B03C18B8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:56:43 +0200 (CEST)
Received: from localhost ([::1]:43518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1YGQ-0003sW-O9
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1XTt-0007Ui-P4
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:06:33 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:36853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1XTs-00083i-AU
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:06:33 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 t14-20020a05600c198eb029020c8aac53d4so20478599wmq.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 10:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SAUPcCzIfJ2Pzg9QH/n+E/kHj+jWXIgKUz+S/8HUgVM=;
 b=gH+eX/KJPkR1FYsL58md912VDrKOux7AXR/29vRM/bNYTjK2XzGzdGFM/Xekd4rkvH
 bX77ucO9YuLBad6Njn4dp8fOsfV82XyEpE3tMtFmeXD1dJ7DF8Ih8bFd/4o+roEMExny
 6uuEfC8H4VmSYAxOBh6L9YD78WzGORLnpuMrmkV3wCckMuZjVaks728qopFX47ZRGy7l
 OKlcORzlplrR26CJlrZIcBYPvSNSnVsxvvQICJPJM27fSt4WJp0fzvxWTR2WkZ97POf4
 7wgWzlGrVIb1orEKhS7hNbNfZSA7nb5mRNMG272K92qDd+eLit0tvpt3YhBlpFE7piBo
 qZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SAUPcCzIfJ2Pzg9QH/n+E/kHj+jWXIgKUz+S/8HUgVM=;
 b=ZDC53juZ0qzDQNbdEgVZVqbDF4/BwnyTO5K418D7R8pw9VmLKwtRdkkefwD5avqoFS
 ymy0PxsBwW57AHSTqs6rhiAPxXG3TLHOgterJrpNTuPDMAw/m/G4PYDr8/4+EhpMgl9+
 cEoj6zOiFUHDZfBKwJedwaTXNKv6OMw0oA+n4ZrV8Hax6S90yu8n/GdxA4TK5zO1T1Rg
 yBXOPuTjlodehwSjePkQ4zZiyE31DwqKLUufCX/SNziD4K1YoTBBxF0clwZXoDXVvYB1
 qE68mv1n0C8gb7Yu5rOs9NlA9V7EAVP5k/ASDAWdmuL3AVVNF6dlLdV8Re5g1FCCXn4A
 SqPA==
X-Gm-Message-State: AOAM530ph20SDGgabDMur7mSqMETuvrbV6QhsheU7H84pldIhwACRScP
 l46mJkMQRI8EmzJrkee710J7pHzbPZo=
X-Google-Smtp-Source: ABdhPJwAfxazIV6R0NVgIfITZFnD/pNd+8UlpaTFfU6nMPtA5v5fwKxz87VWKACYWLNIIJMbYhTCyQ==
X-Received: by 2002:a7b:c096:: with SMTP id r22mr6566294wmh.186.1625763990790; 
 Thu, 08 Jul 2021 10:06:30 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id h13sm2823844wrs.68.2021.07.08.10.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 10:06:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 8/8] linux-user/syscall: Remove ERRNO_TABLE_SIZE check
Date: Thu,  8 Jul 2021 19:05:50 +0200
Message-Id: <20210708170550.1846343-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708170550.1846343-1-f4bug@amsat.org>
References: <20210708170550.1846343-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now than target_to_host_errno() always return an errno, we can
remove the unused and arbitrary ERRNO_TABLE_SIZE definition.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/syscall.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 94ec6f730b3..376629c6891 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -507,8 +507,6 @@ static inline int next_free_host_timer(void)
 }
 #endif
 
-#define ERRNO_TABLE_SIZE 1200
-
 static inline int host_to_target_errno(int host_errno)
 {
     switch (host_errno) {
@@ -548,9 +546,6 @@ const char *target_strerror(int err)
         return "Successful exit from sigreturn";
     }
 
-    if ((err >= ERRNO_TABLE_SIZE) || (err < 0)) {
-        return NULL;
-    }
     return strerror(target_to_host_errno(err));
 }
 
-- 
2.31.1


