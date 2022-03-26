Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D09064E7F32
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 06:50:25 +0100 (CET)
Received: from localhost ([::1]:50066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXzJg-0006by-Gc
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 01:50:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nXyZJ-0007AT-P6
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 01:02:30 -0400
Received: from mail-sender.a4lg.com ([153.120.152.154]:63828
 helo=mail-sender-0.a4lg.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nXyZH-0000K3-V1
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 01:02:29 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 23F60300089;
 Sat, 26 Mar 2022 05:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1648270932;
 bh=ugIKjbQycAYANOONi7tRgLDKqrvhDa/YMcFNPkXvi34=;
 h=From:To:Cc:Subject:Date:Message-Id:Mime-Version:
 Content-Transfer-Encoding;
 b=CHCoWtBoW45qxkFgVwEJ3DEG1Y66g0sbj5fLRHGE8Mcrr148R2u1MaPnJALdZlpeF
 010uwggsIhcWStSBD2AzVV7THTzs1xfnMBVOQxrHJrJX3esiagS14pRVbQxYSGHlF9
 /40wFPO9ccQ3i46pCdlej4wFETNC2KKyh3s512OQ=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Subject: [PATCH (PING) 0/1] target/riscv: misa to ISA string conversion fix
Date: Sat, 26 Mar 2022 14:01:44 +0900
Message-Id: <cover.1648270894.git.research_trasio@irq.a4lg.com>
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
X-Mailman-Approved-At: Sat, 26 Mar 2022 01:45:56 -0400
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
Cc: Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[This is the same patch as previous ones]
<https://lists.nongnu.org/archive/html/qemu-riscv/2022-02/msg00098.html>
 (qemu-riscv only)
<https://lists.nongnu.org/archive/html/qemu-riscv/2022-02/msg00097.html>
 (resent due to configuration error of my mail server; qemu-riscv only)

I hope this is applied before the QEMU 7.0 release.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>

S and U are misa bits but not extensions (instead, they are supported
privilege modes).  Thus, they should not be copied to the ISA string.

I am truly surprised that this patchset is the THIRD attempt to fix this
longstanding problem.

(1) August 2019: by Palmer Dabbelt
<https://lists.nongnu.org/archive/html/qemu-riscv/2019-08/msg00165.html>
<https://lists.nongnu.org/archive/html/qemu-riscv/2019-08/msg00141.html>
<https://lists.nongnu.org/archive/html/qemu-riscv/2019-08/msg00259.html>

(2) April 2021: by Emmanuel Blot
<https://lists.nongnu.org/archive/html/qemu-riscv/2021-04/msg00248.html>

(3) February 2022: by me (this patchset)

I feel this is urgent to eliminate this bug now considering it required
a workaround to RISC-V Linux kernel as I pointed out:
<http://lists.infradead.org/pipermail/linux-riscv/2022-February/012252.html>


Though my patchset is first developed independently, this submitted
version is influenced by (2) Emmanuel Blot's patchset.  Thanks to this,
constant "[n]" can now be variable "[]".

It also fixes an ordering issue where 'C' should be preceded by 'L'
(order: 'L' -> 'C') as per the RISC-V ISA Manual (version 20191213),
Table 27.1.

It clarifies the role of `riscv_exts'.  It's a single-letter extrension
ordering list.




Tsukasa OI (1):
  target/riscv: misa to ISA string conversion fix

 target/riscv/cpu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)


base-commit: f345abe36527a8b575482bb5a0616f43952bf1f4
-- 
2.32.0


