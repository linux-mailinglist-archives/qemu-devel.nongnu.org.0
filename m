Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA5DE74A5
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 16:13:49 +0100 (CET)
Received: from localhost ([::1]:45692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP6iJ-0006uy-9v
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 11:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44520)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iP6Ug-0007Se-RK
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 10:59:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iP6Uf-00041y-JZ
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 10:59:42 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:34939)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iP6Uf-00041L-Dd
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 10:59:41 -0400
Received: by mail-wm1-x32e.google.com with SMTP id x5so2243254wmi.0
 for <qemu-devel@nongnu.org>; Mon, 28 Oct 2019 07:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6YuVFd/F+N1dkaWyOwwHEzclPuT2QS3X/NJFdWUjnuU=;
 b=O8dspMjVrro945BmeIK63wSit7cFWEOoRSwhAA1wrskJj4URB+0maI0Gw+9R/lkxrj
 tVROvZb3rQSY5CWqw1wHj7wxDhQkgvexigXv81JGRq30s8rKnjV6FtKjbvnkMNg5Y2o0
 CGvrbIGcezt4wfsM1uCWv5RQBKWZMWz7Y3IY3Y++zMz93OgNV2tYbjCqXwYVK+7VVJUz
 /sBfmHLh2X1xzXy4beONe/nkkuXv5kwrrkVXL2HGCWnNOu9Tw+1P0v1tF/i4tRxjvfQw
 d7V8doelUSLBoqu4wZSxk9Y5Q1jHqr0qhi3chtD/D+PChd9VvCIjDwThhzWWQY0qXH1S
 cZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6YuVFd/F+N1dkaWyOwwHEzclPuT2QS3X/NJFdWUjnuU=;
 b=YTlxE3stc8m1k73ElsXk8C919iucMI4oSRxNoViZnJwRsbYZR9/sfaQqHXrx9coTtf
 wNkj4u4S4rMYUex1WIeNwm/j3u/wFIR6G0y+NyTVT8wQeiISMwwZhLx/epx0MFgeDR0B
 exI9Kf45+YwLx/rJq+k1By8+1CVYugavsKOgSNuwtpI4W609erCFS1ystNK508pKQ12Y
 XhlxZNO2R8SbX4plEYAOVR4qjcS7SHhU49YkFFkOJA2NpjRrIbtoKYY4Rv7q+9jWMpBk
 vgROX2ebxAz9vKpu5f+5bR6r3w0sbU5DMkXJAzG9c3Kge5Iejm/RfH98CxY7GOR89Wp2
 yRcQ==
X-Gm-Message-State: APjAAAVjY8owAyjPgcYP4izNN98j3lGYAOQkGbh6LHLnT8XG3a1LnHms
 utzE78Jngzet1bQdByectWwfjtG+cNMqww==
X-Google-Smtp-Source: APXvYqz6IkVJStdYfabcnMD1fLZoMn99txWiUbOBDtoS8981Z8vACiVxpI/yWuzgA2Duf5cJ1w4SyA==
X-Received: by 2002:a1c:544b:: with SMTP id p11mr416683wmi.46.1572274779476;
 Mon, 28 Oct 2019 07:59:39 -0700 (PDT)
Received: from localhost.localdomain (230.106.138.88.rev.sfr.net.
 [88.138.106.230])
 by smtp.gmail.com with ESMTPSA id 143sm14842876wmb.33.2019.10.28.07.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 07:59:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 01/12] tci: Add implementation for INDEX_op_ld16u_i64
Date: Mon, 28 Oct 2019 15:59:26 +0100
Message-Id: <20191028145937.10914-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191028145937.10914-1-richard.henderson@linaro.org>
References: <20191028145937.10914-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32e
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
Cc: peter.maydell@linaro.org, Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Weil <sw@weilnetz.de>

This fixes "make check-tcg" on a Debian x86_64 host.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Tested-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20190410194838.10123-1-sw@weilnetz.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tcg/tci.c b/tcg/tci.c
index 33edca1903..a6208653e8 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -127,6 +127,12 @@ static void tci_write_reg8(tcg_target_ulong *regs, TCGReg index, uint8_t value)
     tci_write_reg(regs, index, value);
 }
 
+static void
+tci_write_reg16(tcg_target_ulong *regs, TCGReg index, uint16_t value)
+{
+    tci_write_reg(regs, index, value);
+}
+
 static void
 tci_write_reg32(tcg_target_ulong *regs, TCGReg index, uint32_t value)
 {
@@ -585,6 +591,8 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             tci_write_reg8(regs, t0, *(uint8_t *)(t1 + t2));
             break;
         case INDEX_op_ld8s_i32:
+            TODO();
+            break;
         case INDEX_op_ld16u_i32:
             TODO();
             break;
@@ -854,7 +862,14 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             tci_write_reg8(regs, t0, *(uint8_t *)(t1 + t2));
             break;
         case INDEX_op_ld8s_i64:
+            TODO();
+            break;
         case INDEX_op_ld16u_i64:
+            t0 = *tb_ptr++;
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_s32(&tb_ptr);
+            tci_write_reg16(regs, t0, *(uint16_t *)(t1 + t2));
+            break;
         case INDEX_op_ld16s_i64:
             TODO();
             break;
-- 
2.17.1


