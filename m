Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D755BBC89
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 10:32:21 +0200 (CEST)
Received: from localhost ([::1]:51738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZpiu-0004yW-0E
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 04:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1oZpfq-0003Lh-D9
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 04:29:10 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:37667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1oZpfo-0003v7-Gd
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 04:29:09 -0400
Received: by mail-pf1-x430.google.com with SMTP id a80so16711938pfa.4
 for <qemu-devel@nongnu.org>; Sun, 18 Sep 2022 01:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=oF5jrzq09jc1ZnunLnisOmXL6et+cmuzWVeFPl2iPR0=;
 b=NdPToHFQfNukZg5Is0/iQpnX/NFmHEehoGcVGF8z60zdx/CC/f00g3i3brH+ZYoYg6
 3DNSyP7Mhb/5yAdYYIna9k3WaOKE7x+Sh1jbiXPeDf0OOfYCIjsduI4MnOE/UQkb0SkR
 eeHt4KqS5XEtm7LansjpF30gvOHb75s3eE/SPaolc7fXeNATtRyZKE/431d+I12rvtVW
 Y+IRrMwhYgxtoqn6/DJfWDYMxo3tyYC/jmZGUuTpmuVrzi7PXPtzlPLYjSBPeGQVKODg
 CjlDPyIru3hJF0X3YA3jq/8nJxMjAQfGntmNgKxSgWf9Bmp7LqUGAW/m9+Oftep33oGY
 UPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=oF5jrzq09jc1ZnunLnisOmXL6et+cmuzWVeFPl2iPR0=;
 b=kn/ta4Nk8UEfLU6iOnqgG0J9yu2foieNZ693n6/7ghfqutevyPpH4FIA+nFGadLMGP
 y3Pk05c/+rRda3i+jVScY142UBqJ35pSzx2mwqrqSj+U1h+vdsJMWHMRakKvmE7vP974
 8qzMBYSeViCSiVOw3mgz69Y2Ca6wqCOlM7t8+g0kTbFtISxtgxDMUjuAbLoT/HhHcPEL
 NyAzcbjeA3pIwcwRj3KthbcWkhNdamKu+ZBQYdqAXeLHypuPxkymr3AOq04VtPcoIW1s
 XyNNxROMC9ZrXXIaMY/Pvra0lwIiW0DEhgZY6lx/O5GSCzrenVnJMXDOgKu1mG6i1Pwn
 5btQ==
X-Gm-Message-State: ACrzQf1SY6z09gXN74+K86Muare4xHegjg0ZvXoudkbtGkp5xqYgeTSv
 CMiDe4YhCuxD5YEj+Ly1Uz9rdIzHjRt7bQ==
X-Google-Smtp-Source: AMsMyM4o9xXCgkCdiCi3uAMGjzqnOfGGJGPlbiBkTwtpKHGUaYZqQI7Hyn/LFSHlE4ygW00vKt2E8Q==
X-Received: by 2002:a05:6a00:8d0:b0:53b:2cbd:fab6 with SMTP id
 s16-20020a056a0008d000b0053b2cbdfab6mr13176343pfu.3.1663489746122; 
 Sun, 18 Sep 2022 01:29:06 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a1709026f0200b0017808db132bsm18113414plk.137.2022.09.18.01.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 01:29:05 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Jim Shu <jim.shu@sifive.com>, Tommy Wu <tommy.wu@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH] target/riscv: Check the correct exception cause in vector GDB
 stub
Date: Sun, 18 Sep 2022 16:32:44 +0800
Message-Id: <20220918083245.13028-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x430.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

After RISCVException enum is introduced, riscv_csrrw_debug() returns
RISCV_EXCP_NONE to indicate there's no error. RISC-V vector GDB stub
should check the result against RISCV_EXCP_NONE instead of value 0.
Otherwise, 'E14' packet would be incorrectly reported for vector CSRs
when using "info reg vector" GDB command.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Tommy Wu <tommy.wu@sifive.com>
---
 target/riscv/gdbstub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 9ed049c29e..118bd40f10 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -211,7 +211,7 @@ static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int n)
     target_ulong val = 0;
     int result = riscv_csrrw_debug(env, csrno, &val, 0, 0);
 
-    if (result == 0) {
+    if (result == RISCV_EXCP_NONE) {
         return gdb_get_regl(buf, val);
     }
 
@@ -238,7 +238,7 @@ static int riscv_gdb_set_vector(CPURISCVState *env, uint8_t *mem_buf, int n)
     target_ulong val = ldtul_p(mem_buf);
     int result = riscv_csrrw_debug(env, csrno, NULL, val, -1);
 
-    if (result == 0) {
+    if (result == RISCV_EXCP_NONE) {
         return sizeof(target_ulong);
     }
 
-- 
2.36.1


