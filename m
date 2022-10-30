Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39399612D95
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:37:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGt9-00061I-T5; Sun, 30 Oct 2022 18:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGrX-0002Xm-D1
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:33:04 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGrV-00009M-D4
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:33:03 -0400
Received: by mail-wr1-x42a.google.com with SMTP id w14so13643482wru.8
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QXrzzSwjW9p/oLgYOQxN1n8Wdh2iZGdjqW5VzPc6Sa0=;
 b=QPw4hCFvgXMkARpqyqD9QFY10mRQ1fMODxR2AGyE73A/+A+RUnkRzzR/8bL4t8GThF
 jXEqwE2NNUXkQ3jGckW76mnk6Dpo/7C3rIP6sK6pD6WvGCCiPN8bgjXEjcMnAkoERjPr
 LFd0U2LcF39k36MtqHbGYNa02xPNVgSIGuuKTmurFJ8vbyUQFVdXDIEjfTLhw5SGd/iA
 cjdxYedgAtd5xx+49u5QHGGyUsET1H5ij/5A3TTOvc618g06egVhdPBrj8eWpWsxphWs
 zw7/aikcPjVbM96j+WjFCwd68IeEV+w4+NZCtHfyw0Wmw0T8pwYBJXxzUJPISw5uRFJK
 ePFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QXrzzSwjW9p/oLgYOQxN1n8Wdh2iZGdjqW5VzPc6Sa0=;
 b=7FoEFTIUE3V8w8L2Jf+h8H9iTCH9byhl8l2Kjh0hDgZtlmKggVGeBFeouXnOofVNpM
 JjhyKddeq2L2LiemBsSCGsvtlRC+Q765F1USPhIezxmBApOvOEuIcJTwGlVgkUNojB2L
 4vLp33uQEo3glyQp5r7Xwz/AkEdRZGih5FEVRGhIpHNq8x0crX2NWL0oK0RytrXpx5PD
 j9XIRYBEscgr9xEiGbcoukWw45JwXsBMWwIJZeBgKqI7lXYnDHM38yNXBDYHh5VHacFj
 G3YEGrciEj2qBrhO0TtHDoaG+DX9gAhBYcCUZWQ/LIFni+Vd59nzzh4O4oaSvZcIBNec
 eGRQ==
X-Gm-Message-State: ACrzQf0NRBp4RUX8C2HXhMiqhMdL6d8XWtjpY+5oUY4eDtJF1vtwQGCM
 X960FAgr/e1k9M2xbeZxfXtnBEvFozNi7g==
X-Google-Smtp-Source: AMsMyM5WNcJbmZ1ghK1vafqxfXqzLUtRk3UjDWjoo/2jhYbRzJ8KuvQ7OojJRN1ruSfHsJKfqBTclg==
X-Received: by 2002:adf:e7c8:0:b0:236:6a30:cb2e with SMTP id
 e8-20020adfe7c8000000b002366a30cb2emr6235457wrn.12.1667169179870; 
 Sun, 30 Oct 2022 15:32:59 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a056000025300b0022cdeba3f83sm5233529wrz.84.2022.10.30.15.32.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:32:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 David Daney <david.daney@fungible.com>,
 Marcin Nowakowski <marcin.nowakowski@fungible.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@fungible.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 39/55] disas/mips: Fix branch displacement for BEQZC and BNEZC
Date: Sun, 30 Oct 2022 23:28:25 +0100
Message-Id: <20221030222841.42377-40-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221014112322.61119-1-philmd@fungible.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


