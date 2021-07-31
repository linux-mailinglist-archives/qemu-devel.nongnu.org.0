Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26C63DC632
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Jul 2021 16:01:32 +0200 (CEST)
Received: from localhost ([::1]:57654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9pYR-0008BU-Gs
	for lists+qemu-devel@lfdr.de; Sat, 31 Jul 2021 10:01:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1m9pW7-0006l4-Pd
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 09:59:07 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:34144
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1m9pW5-00014z-Kz
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 09:59:07 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3At+wRWaO9TX9KOcBcTv2jsMiBIKoaSvp037BL?=
 =?us-ascii?q?7TEUdfUxSKGlfq+V8sjzqiWftN98YhAdcLO7Scy9qBHnhP1ICOAqVN/MYOCMgh?=
 =?us-ascii?q?rLEGgN1+vf6gylMyj/28oY7q14bpV5YeeaMXFKyer8/ym0euxN/OW6?=
X-IronPort-AV: E=Sophos;i="5.84,284,1620662400"; d="scan'208";a="112154384"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 31 Jul 2021 21:58:57 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 588824D0D499;
 Sat, 31 Jul 2021 21:58:52 +0800 (CST)
Received: from G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Sat, 31 Jul 2021 21:58:54 +0800
Received: from localhost.localdomain (10.167.225.141) by
 G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.23 via Frontend Transport; Sat, 31 Jul 2021 21:58:51 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>, <qemu-devel@nongnu.org>
Subject: [PATCH 0/2] enable fsdax rdma migration
Date: Sat, 31 Jul 2021 22:03:30 +0800
Message-ID: <20210731140332.8701-1-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: 588824D0D499.AD2E3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lizhijian@fujitsu.com
Received-SPF: neutral client-ip=183.91.158.132;
 envelope-from=lizhijian@fujitsu.com; helo=heian.cn.fujitsu.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.779 autolearn=ham autolearn_force=no
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
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Previous qemu face 2 problems when migrating a fsdax memory backend with
RDMA protocol.
(1) ibv_reg_mr failed with Operation not supported
(2) requester(source) side could receive RNR NAK.

For the (1), we can try to register memory region with ODP feature which
has already been implemented in some modern HCA hardware/drivers.
For the (2), IB provides advise API to prefetch pages in specific memory
region. It can help driver reduce the page fault on responder(destination)
side during RDMA_WRITE.

Li Zhijian (2):
  migration/rdma: Try to register On-Demand Paging memory region
  migration/rdma: advise prefetch write for ODP region

 migration/rdma.c       | 67 ++++++++++++++++++++++++++++++++++++------
 migration/trace-events |  2 ++
 2 files changed, 60 insertions(+), 9 deletions(-)

-- 
2.31.1




