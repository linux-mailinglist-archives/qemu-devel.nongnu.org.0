Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C6250CFDB
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Apr 2022 07:24:59 +0200 (CEST)
Received: from localhost ([::1]:39664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niUjx-0002my-S4
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 01:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1niUhv-0001CE-Vk; Sun, 24 Apr 2022 01:22:54 -0400
Received: from mail-sender.a4lg.com ([153.120.152.154]:53432
 helo=mail-sender-0.a4lg.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1niUht-0003o4-2e; Sun, 24 Apr 2022 01:22:51 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 4123A300089;
 Sun, 24 Apr 2022 05:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1650777757;
 bh=MlbxknYBnzNdP9QJ9P3dusDJgWvczPYNedvS4K4yjck=;
 h=From:To:Cc:Subject:Date:Message-Id:Mime-Version:
 Content-Transfer-Encoding;
 b=tQd6Rs8WL4cHWLp8sbSnNNJLXXNMx1apfZEv3uFQN5DdRCoQ5zsq31EnTGMtLIHBa
 HYGsS2wxfuX+4+lj5jwrwjkiMjrTpfKB0LCu2hfLGDRYGyDT9c7hEbyP/7+FZLDjgO
 Er7MLVebz6SZNUTlwPySrdnFXdCKmQRaKHoHajwE=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH 0/2] target/riscv: ISA string conversion fix and enhancement
Date: Sun, 24 Apr 2022 14:22:34 +0900
Message-Id: <cover.1650777360.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=153.120.152.154;
 envelope-from=research_trasio@irq.a4lg.com; helo=mail-sender-0.a4lg.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

There is two issues related to RISC-V ISA extension string
I want to be fixed before QEMU 7.1 release.



Issue 1 (workaround in PATCH 1):

Related: <https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg03726.html>

Generating long ISA extension string is definately a good thing to merge.
However, it includes two extensions with possibly invalid order:

-   Zhinx (IEEE754 binary16 arithmetic in GPR)
-   Zhinxmin (subset of Zhinx, conversion only)

This is because:

1.  Z* extensions are ordered with the second character by closely
    related extension category list
    (RISC-V ISA Manual draft: IMAFDQLCBKJTPV)
2.  ... but it doesn't have the character "H" yet

I raised this issue on RISC-V ISA Manual GitHub and being discussed:
<https://github.com/riscv/riscv-isa-manual/issues/837>

Considering software compatibility, "H" is likely placed after "V" (and
"N").  I kept single-letter "H" based on this assumption.

However, Zhinx and Zhinxmin extensions are not that important because
it's incompatible with F and D.  That's why I proposing to remove those
from ISA extension string generation for now.  If "H"-extension ordering
is determined, we can safely add Zhinx* extensions again.

Note that this patch does not remove extensions.  It just disables
putting Zhinx* extensions in a DeviceTree entry ("riscv,isa").

Of course, we can alternatively move Zhinx and Zhinxmin
before "Svinval" but after "Zve64f", assuming "H" comes after "V".
Let me know which might be better.



Issue 2 (fixed in PATCH 2):

Some operating systems does not correctly parse ISA extension string with
version numbers and multi-letter extensions.

On Linux, 5.18 is the first version to implement safe parser.
However, old Linux kernels are still confused by ISA extension strings
(generated by QEMU >= 7.1) containing multi-letter extensions.
Much worse, those multi-letter extensions are enabled by default:

1.  Zba
2.  Zbb
3.  Zbc
4.  Zbs

For instance, existence of "Zbc" can cause problems if we disable
compressed instructions ("C" extension).

As I searched through, I found this kind of issue on following OSes:

-   Linux (kernel version 5.17 or earlier)
-   FreeBSD (at least 14.0-CURRENT)
-   OpenBSD (at least current development version)

I propose a new CPU option "short-isa-string" (default: false), which
disables generating ISA extension string with multi-letter extensions.

Example:
    qemu-system-riscv64 ... \
        -cpu rv64,h=on,svnapot=on,svinval=on,short-isa-string=on \
        ...
    Without "short-isa-string=on", QEMU generates DeviceTree with
    following ISA extension string:
        rv64imafdch_zba_zbb_zbc_zbs_svinval_svnapot
    With it, QEMU generates following ISA extension string:
        rv64imafdch




Tsukasa OI (2):
  target/riscv: Tentatively remove Zhinx* from ISA extension string
  target/riscv: Add short-isa-string option

 target/riscv/cpu.c | 7 ++++---
 target/riscv/cpu.h | 2 ++
 2 files changed, 6 insertions(+), 3 deletions(-)


base-commit: 754f756cc4c6d9d14b7230c62b5bb20f9d655888
-- 
2.32.0


