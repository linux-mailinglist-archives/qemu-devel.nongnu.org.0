Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1598505D9B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 19:44:11 +0200 (CEST)
Received: from localhost ([::1]:37640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngVQ2-00070k-Hu
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 13:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1ngVLW-0004k5-Py
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 13:39:30 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:41340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1ngVLU-0006Zx-LF
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 13:39:30 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1ngVLO-000364-TE; Mon, 18 Apr 2022 18:39:22 +0100
From: Paul Brook <paul@nowt.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] AVX guest implementation
Date: Mon, 18 Apr 2022 18:39:00 +0100
Message-Id: <20220418173904.3746036-1-paul@nowt.org>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41c8:51:832:fcff:ff:fe00:46dd;
 envelope-from=paul@nowt.org; helo=nowt.default.pbrook.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Paul Brook <paul@nowt.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patch series to implement AXV/AVX2 guest support in TCG.

All the system level code for this (cpid, xsave, wider registers, etc)
already exists, we just need to implement the instruction translation.

The majority of the new 256-bit operations operate on each 128-bit
"lane" independently, so in theory we could use a single set of 128-bit
helpers to implement both widths piecemeal. However this would further
complicate the already over-long gen_sse function. Instead I chose to
generate a whole new set of 256 bit "ymm" helpers using the framework
already in place for 64/128 bit mm/xmm operations.

I've included the tests I used during development to the linux-user
testsuite, and also ran these manually inside a debian x86-64 guest.

Appologies for the big patch, but I can't think of a good way to split
the bulk of the instruction translation.

Paul Brook (4):
  Add AVX_EN hflag
  TCG support for AVX
  Enable all x86-64 cpu features in user mode
  AVX tests

 linux-user/x86_64/target_elf.h |    2 +-
 target/i386/cpu.c              |    8 +-
 target/i386/cpu.h              |    3 +
 target/i386/helper.c           |   12 +
 target/i386/helper.h           |    2 +
 target/i386/ops_sse.h          | 2606 +++++++++++++-----
 target/i386/ops_sse_header.h   |  364 ++-
 target/i386/tcg/fpu_helper.c   |    4 +
 target/i386/tcg/translate.c    | 1902 ++++++++++---
 tests/tcg/i386/Makefile.target |   10 +-
 tests/tcg/i386/README          |    9 +
 tests/tcg/i386/test-avx.c      |  347 +++
 tests/tcg/i386/test-avx.py     |  352 +++
 tests/tcg/i386/x86.csv         | 4658 ++++++++++++++++++++++++++++++++
 14 files changed, 8988 insertions(+), 1291 deletions(-)
 create mode 100644 tests/tcg/i386/test-avx.c
 create mode 100755 tests/tcg/i386/test-avx.py
 create mode 100644 tests/tcg/i386/x86.csv

-- 
2.35.2


