Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA3E390FB9
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 06:42:17 +0200 (CEST)
Received: from localhost ([::1]:59164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lllN1-0002s8-Oh
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 00:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mforney@mforney.org>)
 id 1lllKY-00022g-34
 for qemu-devel@nongnu.org; Wed, 26 May 2021 00:39:42 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:45590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mforney@mforney.org>)
 id 1lllKV-0003rI-VN
 for qemu-devel@nongnu.org; Wed, 26 May 2021 00:39:41 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 ne24-20020a17090b3758b029015f2dafecb0so189607pjb.4
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 21:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mforney-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v+oYnD+OHTr3QhVvSiqrGNyfP0PjI1edshzvs+UeqHE=;
 b=tCb5Xtzgvgi5FbLfMSlhOLX153NX/gL8iINfGXyxAKiO6v4RZvzYqw1Fml5WwIwX6H
 cYITTKz1EkvmMYoWb5AeRjjHIFDsrJj4vet5RrA3N78zXIt7CbT83hckNi9YXDeKpjrl
 3zOgryMj8ZOy4Ryzuax4jOqjtbTgxsw7yfqX5zXkzVvr5xMeymxjsilB0/XiKr3Tr45K
 1CISkudsUdf256dKrMrzFAeO9RD+BFV+EJvWiIrhw1PUxkmck0tDTLEjLWrC7btReDnA
 dnRPBSQTcyKEPEBwGY+bHPmGdu/kU3LpD58B+JFq16jgfhOSIce8sQdPPNvBSYnb4Zj3
 W6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v+oYnD+OHTr3QhVvSiqrGNyfP0PjI1edshzvs+UeqHE=;
 b=m2Cjp4MFuUv2yGHea97nmOAsgTtjdBLoLu5RAVCh6syj+WOubmEP1ARO1pJBmpmKUD
 jO7BDlOxZOyKkEh7UVnOI6JR0DsTs8ewk6uKjWDApwXlBvrYK8cL2xFtKh04iKCp8+T+
 dDuvGINkOP+zA9AUKl1eeQoDmyxP8IgoUQ97QJaN5aUBhnELFvzJnQPdLRS6u4SP+ldM
 +IWViBv4u7kvl0qM/MNG2vvSCSq7VlmvCzOc70ianMMT6KOFjUfIUHolYrV7ewHoxkkR
 Ewzoe0KAnitjMvNkfjav3TrW2uT9ODI3A66YAk1dkK8GbZCImZChF0a2jNCgZgWUDRlT
 trBQ==
X-Gm-Message-State: AOAM532Vs//CgIy2fcmrpIXH9i0thAU+WUswPzYTaqBQml/JJ2RBhhZq
 YyxDJKA4eIzgncJ9tDYkNmslew==
X-Google-Smtp-Source: ABdhPJw4mmu0RtmKqdmoPEa6FjT1KnGoYaps7aH5x4dTba6u8UbhIPYtQVQWvDnySweN20e255JG3Q==
X-Received: by 2002:a17:902:76ca:b029:fd:9325:fd7d with SMTP id
 j10-20020a17090276cab02900fd9325fd7dmr815513plt.64.1622003975424; 
 Tue, 25 May 2021 21:39:35 -0700 (PDT)
Received: from localhost ([2601:647:5180:4570:16dd:a9ff:fee7:6b79])
 by smtp.gmail.com with ESMTPSA id w2sm14061461pjq.5.2021.05.25.21.39.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 25 May 2021 21:39:34 -0700 (PDT)
From: Michael Forney <mforney@mforney.org>
To: Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH] linux-user: Remove unnecessary static assert involving
 __SIGRTMAX
Date: Tue, 25 May 2021 21:39:28 -0700
Message-Id: <20210526043928.9586-1-mforney@mforney.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=mforney@mforney.org; helo=mail-pj1-x1029.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since "linux-user: fix use of SIGRTMIN" (6bc024e7), qemu removed
use of __SIGRTMAX except for in this QEMU_BUILD_BUG_ON assert.
Presumably, this check is to ensure that the loop in signal_table_init
from SIGRTMIN to SIGRTMAX falls within the bounds of
host_to_target_signal_table (_NSIG).

However, _NSIG is already defined to be the one larger than the
largest signal supported by the system (as specified in the upcoming
POSIX revision[0]), so the check is unnecessary.

musl libc does not define __SIGRTMAX, so removing this check fixes
one of the last remaining errors when building qemu.

[0] https://www.austingroupbugs.net/view.php?id=741

Signed-off-by: Michael Forney <mforney@mforney.org>
---
If you prefer, I can send an alternate patch to leave the
QEMU_BUILD_BUG_ON, but guard it by #ifdef __SIGRTMAX.

 linux-user/signal.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 9016896dcd..6f62f2b528 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -38,7 +38,6 @@ static void host_signal_handler(int host_signum, siginfo_t *info,
  * Signal number 0 is reserved for use as kill(pid, 0), to test whether
  * a process exists without sending it a signal.
  */
-QEMU_BUILD_BUG_ON(__SIGRTMAX + 1 != _NSIG);
 static uint8_t host_to_target_signal_table[_NSIG] = {
     [SIGHUP] = TARGET_SIGHUP,
     [SIGINT] = TARGET_SIGINT,
-- 
2.31.1


