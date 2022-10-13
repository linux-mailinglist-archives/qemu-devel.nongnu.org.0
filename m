Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A6D5FDD30
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 17:28:56 +0200 (CEST)
Received: from localhost ([::1]:38916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj08l-0003j0-14
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 11:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@fungible.com>)
 id 1oizZz-0007M9-HJ
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 10:53:02 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:33685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@fungible.com>)
 id 1oizZx-0005xb-QD
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 10:52:59 -0400
Received: by mail-pg1-x52f.google.com with SMTP id f193so1799498pgc.0
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 07:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fungible.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kzhl50aOlvlc9AFhnRtfvrWWr51z7zvPwDaFRmiAhpg=;
 b=h54qwv9NXzfqDs3LUFiXDN5od9beqyBFGaPXVHhSQxOCsWGGKiQCpFh2esdiU8Thxj
 BFZj2Pb07fJeB02Cr/5GH/88LZAva3nvnS2qq9m9nbI6v6nuyz3TIWKPdi7TwaEq8iS6
 k8xKzHf4zV2YNV+w7QbMGu93sPbppWsfhqylM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kzhl50aOlvlc9AFhnRtfvrWWr51z7zvPwDaFRmiAhpg=;
 b=zo6gTPoRKMIz78x++vCvNkW+HVX7W/ZOMYmhOBvVKyjMofNt7sDPIRWsBfHEguNNMs
 tl7Wktr3uL3yxvkdZ2yd7YyBbBAlCxA7FdVSFGlcyWf3z2tEjbaRb0UB3KNV96OdhRKJ
 oce1CESFg92hAtmnq//aun666tReeDp6gBfrbwC3tFhX2kTr24VrP7IV3BPzNlgHL2+q
 TOWBuLahWmKq3pAi4yi5QZajgsE22WQj/zQjgcdKGiEexdQgiMGAKmr3HaDOVbRNCcAb
 AhRQtssnvkcGP/vB22Y1vjDL+gU0eq4z0Igzot4Tj+vg+aKq+Y304odbnHDkQwD9gbiv
 gUSQ==
X-Gm-Message-State: ACrzQf1QXDtBESyA7fZkfAd2KEXps3sreTSuIf1VR4jMIoaqLT+YRydm
 9c3osn7qOpwfGYn/EC8ObBCZoZBUpgq3piKK
X-Google-Smtp-Source: AMsMyM4XEISF71i0ZsbjIct0I/4P7jbuMzctASIRA2HP8VZ9sfRkhP8aoelB7EVV/Lx2htPW2eMAJg==
X-Received: by 2002:a63:2b4b:0:b0:440:2963:5863 with SMTP id
 r72-20020a632b4b000000b0044029635863mr252574pgr.28.1665672775730; 
 Thu, 13 Oct 2022 07:52:55 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y17-20020aa793d1000000b0053e6d352ae4sm2118015pff.24.2022.10.13.07.52.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Oct 2022 07:52:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@fungible.com>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Daney <david.daney@fungible.com>,
 Marcin Nowakowski <marcin.nowakowski@fungible.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@fungible.com>
Subject: [PATCH] disas/mips: Fix branch displacement for BEQZC and BNEZC
Date: Thu, 13 Oct 2022 16:52:46 +0200
Message-Id: <20221013145246.4922-1-philmd@fungible.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=philmd@fungible.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 13 Oct 2022 11:26:31 -0400
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
 disas/mips.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/disas/mips.c b/disas/mips.c
index b9a5204304..68640b96d2 100644
--- a/disas/mips.c
+++ b/disas/mips.c
@@ -1334,9 +1334,9 @@ const struct mips_opcode mips_builtin_opcodes[] =
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
@@ -4462,6 +4462,16 @@ print_insn_args (const char *d,
                 (*info->print_address_func) (info->target, info);
                 break;
 
+            case 'q':
+                /* Sign extend the displacement with 21 bits.  */
+                delta = l & 0x1FFFFF;
+                if (delta & 0x100000) {
+                    delta |= ~0x1FFFFF;
+                }
+                info->target = (delta << 2) + pc + INSNLEN;
+                (*info->print_address_func) (info->target, info);
+                break;
+
 	    case 't': /* Coprocessor 0 reg name */
 	      (*info->fprintf_func) (info->stream, "%s",
 				     mips_cp0_names[(l >> OP_SH_RT) &
-- 
2.37.3


