Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2C2389F7B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:10:04 +0200 (CEST)
Received: from localhost ([::1]:50482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljdkp-0005QK-0G
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1ljdhF-0001uO-A5
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:06:21 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:38226
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1ljdhD-0006M7-I0
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:06:21 -0400
IronPort-Data: =?us-ascii?q?A9a23=3ASWyCN60YerTRF/brHvbD5elzkn2cJEfYwER7XOP?=
 =?us-ascii?q?LsXnJhTsi3jxWmzMaCj3XOa3YMDOhLYsnady2pElVu5fTxtU2QQE+nZ1PZygU8?=
 =?us-ascii?q?JKaX7x1DatR0xu6d5SFFAQ+hyknQoGowPscEzmM/H9BDpC79SMljfzRF+KiYAL?=
 =?us-ascii?q?5EnsZqTFMGX5JZS1Ly7ZRbr5A2bBVMivV0T/Ai5S31GyNh1aYBlkpB5er83uDi?=
 =?us-ascii?q?hhdVAQw5TTSbdgT1LPXeuJ84Jg3fcldJFOgKmVY83LTegrN8F251juxExYFAdX?=
 =?us-ascii?q?jnKv5c1ERX/jZOg3mZnh+AvDk20Yd4HdplPtT2Pk0MC+7jx2NnsJxyddMvJqYR?=
 =?us-ascii?q?xorP7HXhaIWVBww/yRWZPUWpeeZfifv2SCU5wicG5f2+N13AUQreIEV5OtzKWd?=
 =?us-ascii?q?J8/MeNXYKdB/rr+65wbaxR/Nwrt4uIMniIMUUvXQI5SjEDPA6TJTKa7/H6d9Rw?=
 =?us-ascii?q?HE7gcUmIBp0T6L1chI2NFKZPUIJYQxRVfoDcC6TriGXW1VlRJi9/MLbO1Tu8TE?=
 =?us-ascii?q?=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3ACnQra62A9FRGhCQ0MuPhzAqjBI4kLtp133Aq?=
 =?us-ascii?q?2lEZdPU1SL39qynKppkmPHDP5gr5J0tLpTntAsi9qBDnhPtICOsqTNSftWDd0Q?=
 =?us-ascii?q?PGEGgI1/qB/9SPIU3D398Y/aJhXow7M9foEGV95PyQ3CCIV/om3/mLmZrFudvj?=
X-IronPort-AV: E=Sophos;i="5.82,313,1613404800"; d="scan'208";a="108506778"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 May 2021 16:06:17 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 508FB499D6C1;
 Thu, 20 May 2021 16:06:11 +0800 (CST)
Received: from G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 20 May 2021 16:06:12 +0800
Received: from FNSTPC.g08.fujitsu.local (10.167.226.45) by
 G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Thu, 20 May 2021 16:06:12 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH 2/4] migration/rdma: Fix rdma_addrinfo res leaks
Date: Thu, 20 May 2021 16:05:34 +0800
Message-ID: <20210520080536.16048-2-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520080536.16048-1-lizhijian@cn.fujitsu.com>
References: <20210520080536.16048-1-lizhijian@cn.fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: 508FB499D6C1.AE20A
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
Cc: qemu-devel@nongnu.org, Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

rdma_freeaddrinfo() is the reverse operation of rdma_getaddrinfo()

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 migration/rdma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/migration/rdma.c b/migration/rdma.c
index 7e7595faab..651534e825 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -987,10 +987,12 @@ static int qemu_rdma_resolve_host(RDMAContext *rdma, Error **errp)
         }
     }
 
+    rdma_freeaddrinfo(res);
     ERROR(errp, "could not resolve address %s", rdma->host);
     goto err_resolve_get_addr;
 
 route:
+    rdma_freeaddrinfo(res);
     qemu_rdma_dump_gid("source_resolve_addr", rdma->cm_id);
 
     ret = rdma_get_cm_event(rdma->channel, &cm_event);
@@ -2593,6 +2595,7 @@ static int qemu_rdma_dest_init(RDMAContext *rdma, Error **errp)
         break;
     }
 
+    rdma_freeaddrinfo(res);
     if (!e) {
         ERROR(errp, "Error: could not rdma_bind_addr!");
         goto err_dest_init_bind_addr;
-- 
2.30.2




