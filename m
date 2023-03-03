Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B0D6A8F7E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 03:59:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXvcy-0007eB-V3; Thu, 02 Mar 2023 21:58:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcv-0007cK-1C
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:33 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvct-0001uN-HG
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:32 -0500
Received: by mail-pj1-x102b.google.com with SMTP id y2so1154902pjg.3
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 18:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677812310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uL8gPV4GfBPCsX5yefLxqBJp76wGELs04Du3rKf0/lI=;
 b=O7ntNcklmYopitZn731XJ7vJ6QAWmgejTKbRD5kN6cYSifij1anxrJUNzD2xx3Hmfa
 3UmPRwhnaK0opiyWUwb5aUUftFrMCiAL3Yx2atzRE4sSLE2w6LFxnXHqBQHtd9FrXEtM
 D9ksXF1HOv3KOjSUNCj4UKECw5+mLX8nJbbB8jt5d/tmQWGm6h65MxsBpvbotYVR2ZVK
 yJqdxJk4whDGO1spbqk76pM7WPrBx+K5SP0ZY6QVCFo+b1YlSsg2LSEIRL8DQeSKe4Gn
 WOCERggmGMibmzx4zRHMcGlFqaKsSy7m3eF7dOUBvkE8jPGg/RbLzRSiOLkuS0H2eHOa
 H8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677812310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uL8gPV4GfBPCsX5yefLxqBJp76wGELs04Du3rKf0/lI=;
 b=xqEjvCAfPNXPhDWRD8zipx4YlsHk6F4iI9J4eL/HfPPpjk+Fe+SLZZ1kNd17ceG4mi
 PiasPCXPB4kJRFQSIxy6i4gKUQQFsFGdJi2X7jcolzybkElUXdIsgRoXK2+uOiP6ci2f
 kjFrOoVdri/QS/ajVeX8mt2NitEax6QgaHn6kSasJqaSpxsoa01HNvUD33l5fx9jyRIx
 /RWBfv5cP5kMLhaVqDOl80fkW61ZhFWJGkZrc2JC5QfjYgftk5h7xL6RSDnKiNRggOkL
 J62dxL0iCp7DC0vB77N+8+YGI16qhADjEOmaBqyRNqI3r2rvE7gfGSsNGYQ77TmBKix8
 YGNw==
X-Gm-Message-State: AO0yUKWEmBhIwUpzNi94FDmgHUMZqQ1xlYAnzO22ewXRAAHeLXMbZGDe
 JccUa4zIPB596yoRHLDHUXyDPdFh9fnyc/eYlno=
X-Google-Smtp-Source: AK7set+kKnQEErlL/AHk0MSwmZ8FFtZzCJwhUjLnAKmY9WF3f7MO5uTYZyvNWOVU0B1+pktFQJFCqA==
X-Received: by 2002:a17:903:24f:b0:19e:7a2c:78a7 with SMTP id
 j15-20020a170903024f00b0019e7a2c78a7mr550293plh.57.1677812310276; 
 Thu, 02 Mar 2023 18:58:30 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a17090301c400b001992e74d055sm372244plh.12.2023.03.02.18.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 18:58:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH v4.5 28/29] gdbstub: Build syscall.c once
Date: Thu,  2 Mar 2023 18:58:04 -0800
Message-Id: <20230303025805.625589-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303025805.625589-1-richard.henderson@linaro.org>
References: <20230303025805.625589-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

There is no longer anything target specific.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 gdbstub/syscalls.c  | 5 +----
 gdbstub/meson.build | 3 +--
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/gdbstub/syscalls.c b/gdbstub/syscalls.c
index b7d85c41c7..4391d124e2 100644
--- a/gdbstub/syscalls.c
+++ b/gdbstub/syscalls.c
@@ -2,9 +2,7 @@
  * GDB Syscall Handling
  *
  * GDB can execute syscalls on the guests behalf, currently used by
- * the various semihosting extensions. As this interfaces with a guest
- * ABI we need to build it per-guest (although in reality its a 32 or
- * 64 bit target_ulong that is the only difference).
+ * the various semihosting extensions.
  *
  * Copyright (c) 2003-2005 Fabrice Bellard
  * Copyright (c) 2023 Linaro Ltd
@@ -13,7 +11,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "cpu.h"
 #include "semihosting/semihost.h"
 #include "sysemu/runstate.h"
 #include "gdbstub/user.h"
diff --git a/gdbstub/meson.build b/gdbstub/meson.build
index d679c7ab86..bd5c5cd67d 100644
--- a/gdbstub/meson.build
+++ b/gdbstub/meson.build
@@ -31,8 +31,7 @@ user_ss.add(gdb_user)
 gdb_softmmu = declare_dependency(link_whole: libgdb_softmmu)
 softmmu_ss.add(gdb_softmmu)
 
-# These have to built to the target ABI
-specific_ss.add(files('syscalls.c'))
+common_ss.add(files('syscalls.c'))
 
 # The user-target is specialised by the guest
 specific_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user-target.c'))
-- 
2.34.1


