Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5FE37A528
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:53:34 +0200 (CEST)
Received: from localhost ([::1]:59026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgQ17-00082N-EE
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgPjN-0002Z3-2u
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:35:13 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgPjH-0006fJ-2E
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:35:08 -0400
Received: by mail-wr1-x432.google.com with SMTP id z17so522598wrq.7
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 03:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=epm+AOA/2FPMjdi+gBtLTE2X95XvzKCuJRYRL6L3lns=;
 b=G2GaxICAylIyvzWXDjhjQo5IgnpM4rQnfAPspRVv3goMmlMwE+FQhFnETUklrd86Ij
 dc+237MTKcQLDainuYPZqzvTKOQmGmeI/WBMX0LYv42vakGU4KVuUiJzGJsM4+CFR0Zk
 Ry52PrPLli7e6q5yV3NV++zby8d7ZH1xtkNgPsgT7f4bwKcpCaui+jhntjeOlXOY+M9A
 CRP1Ffmq2q7gofx76VIV0/JkA+7im9w3dvPKNi6KWGw4t137oOLbTSsmz3i8M4acLaxq
 nPr/9v/h5PzL7lcwJiYamjQUhk+WqpPv6sdPIVM62pfZd803u0cGvl4vTraD4moY9ZVz
 tCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=epm+AOA/2FPMjdi+gBtLTE2X95XvzKCuJRYRL6L3lns=;
 b=o/igMr9P/F23MyoupOedmGvZSMNs+LgHnHql5xfN45T4jbVLt6VEgBkXDaO3hSwYoH
 dhzh3YeXv4jDimgLJS+aDKCEACCTvwIXuRwZhdquSUat56S1esQTTCxYzh654mS/KZSr
 207EqY9AaS6NFqt2PuLT2a81kYtbtmZVLuSTXwxuaRWik71c6RLh0qpICRFMBdyZmBsB
 TJgsPZjuFe9aVOJ12pjuFnPQ29hgpk4eMG+vPKDSothmqQvj/JEnMO1KtnWEKM0UehlQ
 TstY3olgsPvqQxtdeygynM9fYsl6dBNcYcIgjHqEDfVlDw+ocqlNI3EenRilZjV4ayH0
 G+aw==
X-Gm-Message-State: AOAM533D1ddjvI5U+6sCp3xkFINnzawObPvtM1eKS0vp4zWpaHRM8QEi
 dMK9myCAeMTukb0jK5Vrl+6RtpaQHCLPRg==
X-Google-Smtp-Source: ABdhPJwVV0Is3/ay5ZqeJgdOkKvP7HliTxhs2ADI/sEGP5f0hd7ebTCpScz/rEDtLfCQFMfPvfdl4w==
X-Received: by 2002:a5d:4452:: with SMTP id x18mr37993540wrr.286.1620729304474; 
 Tue, 11 May 2021 03:35:04 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id j7sm23332470wmi.21.2021.05.11.03.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 03:35:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] Constify bitmask_transtbl fcntl/mmap flags_tlb[]
Date: Tue, 11 May 2021 12:35:02 +0200
Message-Id: <20210511103502.2875844-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Keep bitmask_transtbl in .rodata by marking the arrays const.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/syscall.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 95d79ddc437..64f486743a9 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -365,7 +365,7 @@ _syscall5(int, sys_statx, int, dirfd, const char *, pathname, int, flags,
 _syscall2(int, membarrier, int, cmd, int, flags)
 #endif
 
-static bitmask_transtbl fcntl_flags_tbl[] = {
+static const bitmask_transtbl fcntl_flags_tbl[] = {
   { TARGET_O_ACCMODE,   TARGET_O_WRONLY,    O_ACCMODE,   O_WRONLY,    },
   { TARGET_O_ACCMODE,   TARGET_O_RDWR,      O_ACCMODE,   O_RDWR,      },
   { TARGET_O_CREAT,     TARGET_O_CREAT,     O_CREAT,     O_CREAT,     },
@@ -6062,7 +6062,7 @@ static const StructEntry struct_termios_def = {
     .print = print_termios,
 };
 
-static bitmask_transtbl mmap_flags_tbl[] = {
+static const bitmask_transtbl mmap_flags_tbl[] = {
     { TARGET_MAP_SHARED, TARGET_MAP_SHARED, MAP_SHARED, MAP_SHARED },
     { TARGET_MAP_PRIVATE, TARGET_MAP_PRIVATE, MAP_PRIVATE, MAP_PRIVATE },
     { TARGET_MAP_FIXED, TARGET_MAP_FIXED, MAP_FIXED, MAP_FIXED },
-- 
2.26.3


