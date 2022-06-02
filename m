Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E31553C070
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 23:41:48 +0200 (CEST)
Received: from localhost ([::1]:40584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwsZe-0001aQ-7b
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 17:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1nwsXN-0008AJ-3R
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:39:25 -0400
Received: from mout-u-107.mailbox.org ([2001:67c:2050:101:465::107]:35906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1nwsXL-0006zw-FW
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:39:24 -0400
Received: from smtp2.mailbox.org (unknown [91.198.250.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4LDfY33szYz9sSr;
 Thu,  2 Jun 2022 23:39:19 +0200 (CEST)
From: Lev Kujawski <lkujaw@member.fsf.org>
To: qemu-devel@nongnu.org
Cc: Lev Kujawski <lkujaw@member.fsf.org>
Subject: [PATCH 0/1] IDE: Addressing slow PIO throughput
Date: Thu,  2 Jun 2022 21:39:03 +0000
Message-Id: <20220602213904.19533-1-lkujaw@member.fsf.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4LDfY33szYz9sSr
Received-SPF: pass client-ip=2001:67c:2050:101:465::107;
 envelope-from=lkujaw@member.fsf.org; helo=mout-u-107.mailbox.org
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Is there any mechanism within QEMU for an emulated device to handle
string IO instructions (e.g., insw) directly?

I have noticed that PIO transfers seem rather slow (~240 kb/s) when
running QEMU on my computer, despite using a raw block device (SSD),
aio=io_uring, and file.cache.direct=on.  The attached patch improves
the rate by about 50% for me, and I would appreciate feedback on
whether this holds for others as well.

Kind regards,
Lev Kujawski

Lev Kujawski (1):
  hw/ide/core: Accumulate PIO output within io_buffer prior to pwritev

 hw/ide/core.c             | 62 ++++++++++++++++++++++++---------------
 include/hw/ide/internal.h |  1 +
 2 files changed, 39 insertions(+), 24 deletions(-)

-- 
2.34.1


