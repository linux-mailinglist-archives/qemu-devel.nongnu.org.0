Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F96820D5D0
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 21:52:24 +0200 (CEST)
Received: from localhost ([::1]:33520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpzpH-0000SV-7Q
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 15:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jpznR-00075C-Rd; Mon, 29 Jun 2020 15:50:29 -0400
Received: from charlie.dont.surf ([128.199.63.193]:46088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jpznO-0005uK-U6; Mon, 29 Jun 2020 15:50:29 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id D49D2BF450;
 Mon, 29 Jun 2020 19:50:23 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH 00/17] hw/block/nvme: AIO and address mapping refactoring
Date: Mon, 29 Jun 2020 21:50:00 +0200
Message-Id: <20200629195017.1217056-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 14:26:53
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

This series is based on "[PATCH 00/17] hw/block/nvme: bump to v1.3" and
mostly consists of patches that refactors and clean up dma/cmb address
mappings.

The "hw/block/nvme: allow multiple aios per command" patch does what it
says on the tin and is in preparation for metadata, dulbe, write
uncorrectable and any upcoming feature that requires additional
persistent state to be modified per command in an asynchronous manner.

Based-on: <20200629182642.1170387-1-its@irrelevant.dk>
([PATCH 00/17] hw/block/nvme: bump to v1.3)

Klaus Jensen (17):
  hw/block/nvme: memset preallocated requests structures
  hw/block/nvme: add mapping helpers
  hw/block/nvme: replace dma_acct with blk_acct equivalent
  hw/block/nvme: remove redundant has_sg member
  hw/block/nvme: refactor dma read/write
  hw/block/nvme: pass request along for tracing
  hw/block/nvme: add request mapping helper
  hw/block/nvme: verify validity of prp lists in the cmb
  hw/block/nvme: refactor request bounds checking
  hw/block/nvme: add check for mdts
  hw/block/nvme: be consistent about zeros vs zeroes
  hw/block/nvme: refactor NvmeRequest clearing
  hw/block/nvme: consolidate qsg/iov clearing
  hw/block/nvme: remove NvmeCmd parameter
  hw/block/nvme: allow multiple aios per command
  hw/block/nvme: add nvme_check_rw helper
  hw/block/nvme: use preallocated qsg/iov in nvme_dma_prp

 block/nvme.c          |   4 +-
 hw/block/nvme.c       | 834 ++++++++++++++++++++++++++++++------------
 hw/block/nvme.h       | 104 +++++-
 hw/block/trace-events |   7 +
 include/block/nvme.h  |   4 +-
 5 files changed, 699 insertions(+), 254 deletions(-)

-- 
2.27.0


