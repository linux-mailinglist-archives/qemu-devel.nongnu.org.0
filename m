Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD0F5922AF
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Aug 2022 17:52:23 +0200 (CEST)
Received: from localhost ([::1]:40868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNFuY-0000ws-51
	for lists+qemu-devel@lfdr.de; Sun, 14 Aug 2022 11:52:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1oNFre-0006li-3R
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 11:49:23 -0400
Received: from mail.xen0n.name ([115.28.160.31]:54614
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1oNFrb-0006Dp-Ql
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 11:49:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1660488845; bh=CIS4wg3Xvmdf0sUqrXioCykANyS6UlMdzlH2sGfx74A=;
 h=From:To:Cc:Subject:Date:From;
 b=VjRoZ7ae4HTtang5iUaJCQJAZmHKudCXYdIxu7PrtEjaxVZYqW+P+NtQAO8vJPDoD
 MEfsPsWpD8b1nR6N0qVijwJ2hebWPcSqesJVFiBYL+gYzRwa3rQDd+ZGDOA8NIbpty
 pWDgxlXatebl9GntaaxlVrszA/WLm5xJzpNdqSvk=
Received: from ld50.lan (unknown [101.88.24.16])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 2990460074;
 Sun, 14 Aug 2022 22:54:02 +0800 (CST)
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Cc: WANG Xuerui <git@xen0n.name>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PATCH for-7.1 0/4] Last-minute LoongArch CPU model naming tweaks
Date: Sun, 14 Aug 2022 22:53:47 +0800
Message-Id: <20220814145351.1474753-1-git@xen0n.name>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=git@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Some people are already testing out the 7.1 RCs for the LoongArch
emulation, and have suggested improvements to the CPU model naming
scheme. While assessing the situation I also found the documentation
already out-of-date, in addition to being especially hard to read (for a
Chinese who could *not* understand Chinglish, though).

Sorry for being really late (I've mostly been focusing on my day job and
LLVM bringup work for LoongArch recently), but hopefully these changes
could still be integrated, because target/loongarch is fresh addition
for 7.1 nobody should have depended on its implementation details yet.
Anyway, since the "new world" ecosystem isn't expected to mature and
attract lots of users very soon, it could be acceptable to just punt
this to 7.2, and issue incompatible change notices as usual. I
personally would be fine with either.

WANG Xuerui (4):
  target/loongarch: Only allow short -cpu arguments without type name
    suffix
  target/loongarch: Trim type name suffix in -cpu help output
  target/loongarch: rename the TCG CPU "la464" to "qemu64-v1.00"
  docs, target/loongarch: Rewrite the LoongArch docs

 docs/system/loongarch/loongson3.rst | 41 ------------
 docs/system/loongarch/virt.rst      | 41 ++++++++++++
 hw/loongarch/virt.c                 | 14 +---
 target/loongarch/README             | 99 -----------------------------
 target/loongarch/README.md          | 75 ++++++++++++++++++++++
 target/loongarch/cpu.c              | 21 +++---
 6 files changed, 128 insertions(+), 163 deletions(-)
 delete mode 100644 docs/system/loongarch/loongson3.rst
 create mode 100644 docs/system/loongarch/virt.rst
 delete mode 100644 target/loongarch/README
 create mode 100644 target/loongarch/README.md

-- 
2.35.1


