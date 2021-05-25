Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C3638FC53
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 10:11:29 +0200 (CEST)
Received: from localhost ([::1]:47186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llS9w-0008FP-PB
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 04:11:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1llS5K-0002sk-Ek
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:06:42 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:26027
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1llS5F-0003F0-3Y
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:06:42 -0400
IronPort-Data: =?us-ascii?q?A9a23=3AF6Lh5KAXyF/9sBVW/xPhw5YqxClBgxIJ4g17XOL?=
 =?us-ascii?q?fU1K+0Tp3gzBTnGJLD23SP62LYWunKt91O9nlo0IBuZ+Ax9UxeLYW3SszFioV8?=
 =?us-ascii?q?6IpJjg4wn/YZnrUdouaJK5ex512huLocYZkFBcwmj/3auK49SQmifnTLlbBILW?=
 =?us-ascii?q?s1h5ZFFYMpBgJ2UoLd94R2uaEsPDha++/kYqaT/73ZDdJ7wVJ3lc8sMpvnv/AU?=
 =?us-ascii?q?MPa41v0tnRmDRxCUcS3e3M9VPrzLonpR5f0rxU9IwK0ewrD5OnREmLx9BFrBM6?=
 =?us-ascii?q?nk6rgbwsBRbu60Qqm0yIQAvb9xEMZ4HFaPqUTbZLwbW9TiieJntJwwdNlu4GyS?=
 =?us-ascii?q?BsyI+vHn+F1vxxwSnkuYv0bouacSZS4mYnJp6HcSFP1zvBzSU07I4Ac0uBwB25?=
 =?us-ascii?q?I6LofMj9lRhyMhua8zainYvNhisQqMI/gO4Z3kmh9zDfFAPIvaYrOT6XD+ZlT2?=
 =?us-ascii?q?zJYuyzkNZ4yfOJAMXw2MkuGOEYJZz8q5FsFtL/ArhHCn/dw8Tp5fZYK3lU=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AktWICaNuvYYz/cBcTiWjsMiBIKoaSvp037Eq?=
 =?us-ascii?q?v3oedfUzSL3/qynOpoVj6faaslYssR0b9exofZPwJE80lqQFhrX5X43SPzUO0V?=
 =?us-ascii?q?HAROoJgLcKgQeQfxEWndQ96U4PScdD4aXLfDpHZNjBkXSFOudl0N+a67qpmOub?=
 =?us-ascii?q?639sSDthY6Zm4xwRMHfhLmRGABlBGYEiFIeRou5Opz+bc3wRacihQlYfWeyrna?=
 =?us-ascii?q?ywqLvWJQ4BGwU86BSDyReh6LvBGRCe2RsEFxNjqI1SiVT4rw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.82,327,1613404800"; d="scan'208";a="108785213"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 25 May 2021 16:06:32 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id E14644C369E5;
 Tue, 25 May 2021 16:06:27 +0800 (CST)
Received: from G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 25 May 2021 16:06:26 +0800
Received: from FNSTPC.g08.fujitsu.local (10.167.226.45) by
 G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Tue, 25 May 2021 16:06:26 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH v2 2/4] migration/rdma: Fix rdma_addrinfo res leaks
Date: Tue, 25 May 2021 16:05:50 +0800
Message-ID: <20210525080552.28259-2-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210525080552.28259-1-lizhijian@cn.fujitsu.com>
References: <20210525080552.28259-1-lizhijian@cn.fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: E14644C369E5.AE0D6
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
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/rdma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/migration/rdma.c b/migration/rdma.c
index 7e7595faabf..651534e8255 100644
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




