Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 748E213A5B7
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 11:15:57 +0100 (CET)
Received: from localhost ([::1]:36252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irJEq-00072i-Ca
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 05:15:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39210)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shihpo.hung@sifive.com>) id 1irJDd-0006Cn-53
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 05:14:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shihpo.hung@sifive.com>) id 1irJDc-0003dc-0G
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 05:14:40 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:34332)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <shihpo.hung@sifive.com>)
 id 1irJDb-0003dG-QE
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 05:14:39 -0500
Received: by mail-pl1-x642.google.com with SMTP id g9so2842398plq.1
 for <qemu-devel@nongnu.org>; Tue, 14 Jan 2020 02:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=tc5NOPgz2xar/Gl6+wWPRxY4XwTZyUDfHwvy1JBVetU=;
 b=FoRibO4f++e4ymtJlUHD5qTV5gX4l3NVPfwd0gVqFZRTPkAB9lQ4SdEGzXuqFBLOZ4
 MYmD76BlqyJ2MiKJWyCKiyM2MVtyI34SZ/KQZYkj6eXBosqAMoZvF++cWOqymjhMSl63
 e4I4Wd44cghgVDC3MJVK/lxahJqGpyFgg6CX1jlho+ZEF3OVMOGH64CMUn4fNyuQ4nhE
 57FqNLkxwAWyxzsf5ByrwVv7Od1Li/qoW46td71TDdUn6OsKMHmq4bgiMRAqMQF67tvA
 rzbccFMpUEXVcFcct7avkjecE9aeXd8/61BI+vYfJzO2/7jLKDfD/sDn7dAgflciCeEE
 hygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=tc5NOPgz2xar/Gl6+wWPRxY4XwTZyUDfHwvy1JBVetU=;
 b=EE7O5/txlD/iZRzwOamaMDOVbVyOIyv/CoQgiz0EmCLqeAs+RIZPHMKOqANZnCOCgI
 C9Va0rjMwLrkLwkS5p+d+kk5Asoisn1cB+4V3DCrFUwgFNt2uQaupZGkAyTgqJfpMmoR
 3bf5WhmIiXT/9l8TXi/6PedInkQ1yNmhvNjUDjxdCk2D13WDrzlBkFZF/8ffXyj1Nu3J
 n/VoFrpk7yofWnzYZ8/L4dDjeGgmGrqxThx3ZOQK/rsZ1hJgYQjx0WJs2kZMeL2zDAi8
 jC+h4xFvFmQI7gM7LtEfEcsybnHdJVhtAeAtGy35XlIm007fQ10Bs0LF1dDtP9ZFxXmq
 V9Ow==
X-Gm-Message-State: APjAAAV3pMau33tPqet9SSZwfRgK1XycRGjqgDMbJwrz/fWwDYno7Ju3
 dQmfWNifZVuG+Ee7pGhFuMklMg==
X-Google-Smtp-Source: APXvYqzItJNZE28Ys9TqeZFCQCHE6i5D/xT2SUp23x4A2v3pbdsQslJ7AebUOlUvSLFJQe+qzjkwMA==
X-Received: by 2002:a17:90a:c691:: with SMTP id
 n17mr28225537pjt.41.1578996878512; 
 Tue, 14 Jan 2020 02:14:38 -0800 (PST)
Received: from gamma04.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id k23sm16158583pgg.7.2020.01.14.02.14.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 14 Jan 2020 02:14:37 -0800 (PST)
From: shihpo.hung@sifive.com
To: qemu-riscv@nongnu.org
Subject: [PATCH v2 1/3] target/riscv: Fix tb->flags FS status
Date: Tue, 14 Jan 2020 02:13:58 -0800
Message-Id: <1578996840-14863-1-git-send-email-shihpo.hung@sifive.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, ShihPo Hung <shihpo.hung@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It was found that running libquantum on riscv-linux qemu produced an
incorrect result. After investigation, FP registers are not saved
during context switch due to incorrect mstatus.FS.

In current implementation tb->flags merges all non-disabled state to
dirty. This means the code in mark_fs_dirty in translate.c that
handles initial and clean states is unreachable.

This patch fixes it and is successfully tested with:
  libquantum

Thanks to Richard for pointing out the actual bug.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: ShihPo Hung <shihpo.hung@sifive.com>
---
 target/riscv/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e59343e..f0ff57e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -295,7 +295,7 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 #else
     *flags = cpu_mmu_index(env, 0);
     if (riscv_cpu_fp_enabled(env)) {
-        *flags |= TB_FLAGS_MSTATUS_FS;
+        *flags |= env->mstatus & MSTATUS_FS;
     }
 #endif
 }
-- 
2.7.4


