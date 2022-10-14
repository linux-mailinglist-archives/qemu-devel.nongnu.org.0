Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A005FED35
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 13:32:54 +0200 (CEST)
Received: from localhost ([::1]:34228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojIvr-000160-Rm
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 07:32:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@fungible.com>)
 id 1ojImt-0003VT-6N
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 07:23:35 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:36701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@fungible.com>)
 id 1ojImp-0000Po-Pk
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 07:23:33 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 d7-20020a17090a2a4700b0020d268b1f02so7642155pjg.1
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 04:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fungible.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jLKw1HH8S34CbWDBBBhlBccMI3JKLgM/HcH+QKrNZIs=;
 b=WoYxjcOp2lHRVjHVZMYCkBvOYkWnEv77ZsZ0eR0JKCOv8lAQGBbQD58S0uxmUwtdL6
 3FgnS223zPMz/MhLV0+VrbA9UzWm+u2p4Wb5luiIxK4983krNLyfYyTfu0sPe6E18J3S
 uPerGO0s37Lddln0TuiXR7RTmZDoDCp1i/yIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jLKw1HH8S34CbWDBBBhlBccMI3JKLgM/HcH+QKrNZIs=;
 b=snkabfTig79vgarqb8aCpFgEJjeZiKeOkvDeiX/O0xRugbMiLr0tczEvNKOpbuxlan
 Az1plqArWn41R95Uc7a0jKq3gaDLOQR7xmFWM4k5gxgV95FGeTjdQtAnSwrhyf7Fc/GB
 iSc/uS89mctJzZhHC0vlRRGq/goGNRTatMs/xbt1Ev4PIADLiDbqxbBDqao5V4Etz+lG
 NWfhFjGH75kZB4NSRjPQJ6YmLTMeqayeTiS6DkIIARLF3FRUTeOSKE45Bbq52upoCg5I
 LykLJIYSXxOgzalOfQdyLMTryJGfkUv0VNkSYdRGaJw9QWf6rloaZW9/bpEEQ588KgQC
 qKWg==
X-Gm-Message-State: ACrzQf3josocqQWUfPBoDJFCAHuux5zKKvfzngjh+VHYC9BF81WK7AFj
 89PvY9feQJtUZJ6DpwL2GaeIj4Zl17cYZDYL
X-Google-Smtp-Source: AMsMyM5mYJi8HaSPTHNHcwbR5A67doN4CaVb0c7DigFEp/biclvHB+7gjqQAEu/Rhl5622XzvBs5RQ==
X-Received: by 2002:a17:903:41d1:b0:184:e955:abf4 with SMTP id
 u17-20020a17090341d100b00184e955abf4mr4893628ple.123.1665746609909; 
 Fri, 14 Oct 2022 04:23:29 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a170902e1c200b001807922f43bsm1471578pla.158.2022.10.14.04.23.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 14 Oct 2022 04:23:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@fungible.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Daney <david.daney@fungible.com>,
 Marcin Nowakowski <marcin.nowakowski@fungible.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@fungible.com>
Subject: [PATCH v2] disas/mips: Fix branch displacement for BEQZC and BNEZC
Date: Fri, 14 Oct 2022 13:23:22 +0200
Message-Id: <20221014112322.61119-1-philmd@fungible.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=philmd@fungible.com; helo=mail-pj1-x1029.google.com
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

From: David Daney <david.daney@fungible.com>

disas/mips.c got added in commit 6643d27ea0 ("MIPS disas support")
apparently based on binutils tag 'gdb_6_1-branchpoint' [1].
Back then, MIPSr6 was not supported (added in binutils commit
7361da2c952 during 2014 [2]).

Binutils codebase diverged so much over the last 18 years, it is
not possible to simply cherry-pick their changes, so fix it BEQZC /
BNEZC 21-bit signed branch displacement locally.

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=opcodes/mips-dis.c;hb=refs/tags/gdb_6_1-branchpoint
[2] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=7361da2c952

Fixes: 31837be3ee ("target-mips: add compact and CP1 branches")
Signed-off-by: David Daney <david.daney@fungible.com>
Reviewed-by: Marcin Nowakowski <marcin.nowakowski@fungible.com>
[PMD: Added commit description]
Signed-off-by: Philippe Mathieu-Daudé <philmd@fungible.com>
---
v2: Use sextract32 (rth)
---
 disas/mips.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/disas/mips.c b/disas/mips.c
index b9a5204304..5aacacb2c8 100644
--- a/disas/mips.c
+++ b/disas/mips.c
@@ -20,6 +20,7 @@ You should have received a copy of the GNU General Public License
 along with this program; if not, see <http://www.gnu.org/licenses/>.  */
 
 #include "qemu/osdep.h"
+#include "qemu/bitops.h"
 #include "disas/dis-asm.h"
 
 /* mips.h.  Mips opcode list for GDB, the GNU debugger.
@@ -1334,9 +1335,9 @@ const struct mips_opcode mips_builtin_opcodes[] =
 {"balc",    "+p",       0xe8000000, 0xfc000000, UBD|WR_31,            0, I32R6},
 {"bc",      "+p",       0xc8000000, 0xfc000000, UBD|WR_31,            0, I32R6},
 {"jic",     "t,o",      0xd8000000, 0xffe00000, UBD|RD_t,             0, I32R6},
-{"beqzc",   "s,+p",     0xd8000000, 0xfc000000, CBD|RD_s,             0, I32R6},
+{"beqzc",   "s,+q",     0xd8000000, 0xfc000000, CBD|RD_s,             0, I32R6},
 {"jialc",   "t,o",      0xf8000000, 0xffe00000, UBD|RD_t,             0, I32R6},
-{"bnezc",   "s,+p",     0xf8000000, 0xfc000000, CBD|RD_s,             0, I32R6},
+{"bnezc",   "s,+q",     0xf8000000, 0xfc000000, CBD|RD_s,             0, I32R6},
 {"beqzalc", "s,t,p",    0x20000000, 0xffe00000, CBD|RD_s|RD_t,        0, I32R6},
 {"bovc",    "s,t,p",    0x20000000, 0xfc000000, CBD|RD_s|RD_t,        0, I32R6},
 {"beqc",    "s,t,p",    0x20000000, 0xfc000000, CBD|RD_s|RD_t,        0, I32R6},
@@ -4462,6 +4463,13 @@ print_insn_args (const char *d,
                 (*info->print_address_func) (info->target, info);
                 break;
 
+            case 'q':
+                /* Sign extend the displacement with 21 bits.  */
+                delta = sextract32(l, OP_SH_DELTA, 21);
+                info->target = (delta << 2) + pc + INSNLEN;
+                (*info->print_address_func) (info->target, info);
+                break;
+
 	    case 't': /* Coprocessor 0 reg name */
 	      (*info->fprintf_func) (info->stream, "%s",
 				     mips_cp0_names[(l >> OP_SH_RT) &
-- 
2.37.3


