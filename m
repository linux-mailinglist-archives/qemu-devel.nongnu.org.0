Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A783823D4
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 07:53:43 +0200 (CEST)
Received: from localhost ([::1]:55430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liWCD-0004nx-Sd
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 01:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liWBN-0003xu-J7; Mon, 17 May 2021 01:52:49 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:45031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liWBM-0002Rs-3S; Mon, 17 May 2021 01:52:49 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 y184-20020a1ce1c10000b02901769b409001so1407912wmg.3; 
 Sun, 16 May 2021 22:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FMnps2qubYYWD3YRuRkPtfN0t7AsJAs5vvzOFy1DvdY=;
 b=F/Y+ntKgjUt0RaOy0qIBz0Kl+eh7/LEsll+Q2/dymOn426vS6ef2AT9CIQtd9UvoDA
 wd8F13Z0JImKx8vOCwFMdD2J5g/VLXaX+2Ex/t1mFdyPgXtK7cPuh3CmRF2VI5KGjJgC
 3+C5wLCBVOEowa8lPRk5KP7Setfuy9cn2eJjkED9mQOLbWtMAGcBpe75BFfgvkaYjDt+
 R8TI8BmtEG6Jz3EdBDoox7nJPjh64aZxB4ocDV4EGUKDqCkxPZCY9rr1Ea56/Jt4QuSd
 qe5y+ZKVJyc/wpFLqRvgmBb+4uZa79Ff7C75TxWyxLfYRKQytB6S4nbNzyOaLrEsB/zD
 3pQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=FMnps2qubYYWD3YRuRkPtfN0t7AsJAs5vvzOFy1DvdY=;
 b=CK7kJm/KCBvPhOxPY2uIBBEKMK/OWTR5/SI/02tC9MiPdGESV3vvYnG+6OEHLSgSuj
 CSrhdgOYzJngCdExd9db49iMekpswVbWGxDSjOGNb8ZdGDSL+M7Z4886Wniehtirjttb
 Ny9t72CJhsOFWmuqNY3mxN3I60DhV86EMJxYBJ7KmgeoFXA84Xig1gdtYmS4r0RM0icr
 B81dD4DjtOU+CKaVqjMmtDeXgAzTs6x6AbSRSNkrl2kQRs5xX+9dxcDSuULLlM13SvbP
 J1VmoplsLmvcSKgS7C7bpYCTUXkh3MJ1i7uDPZ85kEUj6Mae9oDy0JY5ND1sHm/cRugR
 HgNA==
X-Gm-Message-State: AOAM533URuJOxyEQ7vgM5CpHYr5tNGmoRIo/KZaB2dkJdrjdlURdGswM
 0FVv2cdiovL7pRiuoxN2O8p6gjPGjyPDAA==
X-Google-Smtp-Source: ABdhPJyrNL5uOkz6yaezCYiRQWpTtA6wQPXm7mbZA0sdxyT0Lkm4Nvin8nn2l27sEp6RVzEyV6PdLA==
X-Received: by 2002:a05:600c:154f:: with SMTP id
 f15mr20495545wmg.81.1621230765739; 
 Sun, 16 May 2021 22:52:45 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id m6sm15551972wrp.29.2021.05.16.22.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 22:52:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] linux-user/syscall: Constify bitmask_transtbl fcntl/mmap
 flags_tlb[]
Date: Mon, 17 May 2021 07:52:43 +0200
Message-Id: <20210517055243.830491-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: qemu-trivial@nongnu.org, Bin Meng <bmeng.cn@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Keep bitmask_transtbl in .rodata by marking the arrays const.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
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


