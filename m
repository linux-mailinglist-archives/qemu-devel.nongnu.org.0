Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A647225D8F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jul 2020 13:40:09 +0200 (CEST)
Received: from localhost ([::1]:47632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxU9Q-0000vn-1E
	for lists+qemu-devel@lfdr.de; Mon, 20 Jul 2020 07:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jxU7M-0007Ek-U4; Mon, 20 Jul 2020 07:38:00 -0400
Received: from charlie.dont.surf ([128.199.63.193]:46806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jxU7J-00058c-Pj; Mon, 20 Jul 2020 07:38:00 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 34A01BF5BE;
 Mon, 20 Jul 2020 11:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=irrelevant.dk;
 s=default; t=1595245074;
 bh=QS5uBrENoJy7XphDGLMgUjDXhF4BDtOxlPzbV3xG0ws=;
 h=From:To:Cc:Subject:Date:From;
 b=v8vhCklFIa1jNKtylxbevJSPazH6OHhCrCfjuezRr8kOJDRMHqqsO/XVHjAvgOkjo
 Ey4L9LxzD6lQuHkz0Fs1FPpONvSkZl/0wfeAn6KW5WR5Ct5Y1ViMiRW6dGz0lh3wHw
 QRjC6CyUryJKVjTi5u5swv+zvZN2qVX9ztzS6afk+aFcHngSrZ1yZG6L++LJ6naKlR
 558DGy480IadlAhiAEb0/h8YbN/H5snyNp6LSSZ1EEHh0+IvfZY9XS2cDIvPXt6KYA
 IKtu7LNYDcWgVVAFdssb9k+pkSzXMRj85Y0Gud+0jny8VJUVtPI3VF9X8L9UdSDtaK
 kG1HyBAdREE2g==
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/16] hw/block/nvme: dma handling and address mapping cleanup
Date: Mon, 20 Jul 2020 13:37:32 +0200
Message-Id: <20200720113748.322965-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.27.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/20 07:37:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

This series consists of patches that refactors dma read/write and adds a=0D
number of address mapping helper functions.=0D
=0D
Based-on: <20200706061303.246057-1-its@irrelevant.dk>=0D
=0D
Klaus Jensen (16):=0D
  hw/block/nvme: memset preallocated requests structures=0D
  hw/block/nvme: add mapping helpers=0D
  hw/block/nvme: replace dma_acct with blk_acct equivalent=0D
  hw/block/nvme: remove redundant has_sg member=0D
  hw/block/nvme: refactor dma read/write=0D
  hw/block/nvme: pass request along for tracing=0D
  hw/block/nvme: add request mapping helper=0D
  hw/block/nvme: verify validity of prp lists in the cmb=0D
  hw/block/nvme: refactor request bounds checking=0D
  hw/block/nvme: add check for mdts=0D
  hw/block/nvme: be consistent about zeros vs zeroes=0D
  hw/block/nvme: refactor NvmeRequest clearing=0D
  hw/block/nvme: add a namespace reference in NvmeRequest=0D
  hw/block/nvme: consolidate qsg/iov clearing=0D
  hw/block/nvme: remove NvmeCmd parameter=0D
  hw/block/nvme: use preallocated qsg/iov in nvme_dma_prp=0D
=0D
 block/nvme.c          |   4 +-=0D
 hw/block/nvme.c       | 498 +++++++++++++++++++++++++++---------------=0D
 hw/block/nvme.h       |   4 +-=0D
 hw/block/trace-events |   4 +=0D
 include/block/nvme.h  |   4 +-=0D
 5 files changed, 331 insertions(+), 183 deletions(-)=0D
=0D
-- =0D
2.27.0=0D
=0D

