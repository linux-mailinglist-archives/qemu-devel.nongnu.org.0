Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F7E389FB0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:18:11 +0200 (CEST)
Received: from localhost ([::1]:39132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljdsg-0000QT-8t
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1ljdnC-0001zk-GU
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:12:30 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:9009
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1ljdn8-00024x-GZ
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:12:28 -0400
IronPort-Data: =?us-ascii?q?A9a23=3AdB4McagvQe+0WbeYYxR9PMXTX161WhIKZh0ujC4?=
 =?us-ascii?q?5NGQNrF6WrkUAzDMdX2mOOPvbZzbxKt10ao+x9BlVuMKGxtZnGVE5pXw8FHgiR?=
 =?us-ascii?q?ejtX4rAdhiqV8+xwmwvdGo+toNGLICowPkcFhcwnT/wdOi7xZVA/fvQHOOkVbe?=
 =?us-ascii?q?VYn4ZqTJME0/NtzoywobVvaY42bBVMyvV0T/Di5W31G2NglaYAUpIg063ky6Di?=
 =?us-ascii?q?dyp0N8uUvPSUtgQ1LPWvyF94JvyvshdJVOgKmVfNrbSq+ouUNiEEm3lExcFUrt?=
 =?us-ascii?q?Jk57wdAsEX7zTIROTzHFRXsBOgDAb/mprjPl9b6FaNC+7iB3Q9zx14NFMp5yxS?=
 =?us-ascii?q?wYgOIXCheYcTwJFVSp5OMWq/ZeeeSji6ZPLkRWun3zEhq8G4FsNFZQV//syDWx?=
 =?us-ascii?q?Q+PgwLjcLYRaeweWsz9qTRuZtgs4uNtXDJo4Tunh8izreCJ4OWI3CRbnH4dZwx?=
 =?us-ascii?q?jo8hslSW/3ZYqIkhZBHBPjbS0QXfA5JV9Rlx6H17kQTugZw8Dq9zZfbKUCKpOC?=
 =?us-ascii?q?p7IXQDQ=3D=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3ANvDN0K9OU5oApObO6yJuk+A8I+orL9Y04lQ7?=
 =?us-ascii?q?vn2YSXRuHPBw8Pre+sjztCWE8Qr5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQ?=
 =?us-ascii?q?iVxehZhOOIqVDd8m/Fh4pgPMxbEpSWZueeMbEDt7eZ3OCnKadc/PC3tLCvmfzF?=
 =?us-ascii?q?z2pgCSVja6Rb5Q9/DQqBe3cGPzVuNN4oEoaG/Mpbq36FcXQTVM6yAX4IRKztvN?=
 =?us-ascii?q?vO/aiWGyIuNlo27hWUlzO05PrfGxic5B0XVDRC2vMD3AH+4nTE2pk=3D?=
X-IronPort-AV: E=Sophos;i="5.82,313,1613404800"; d="scan'208";a="108507060"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 May 2021 16:12:25 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 1EF1E4D0C4C6;
 Thu, 20 May 2021 16:12:23 +0800 (CST)
Received: from G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 20 May 2021 16:12:19 +0800
Received: from FNSTPC.g08.fujitsu.local (10.167.226.45) by
 G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Thu, 20 May 2021 16:12:19 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH RESEND 2/4] migration/rdma: Fix rdma_addrinfo res leaks
Date: Thu, 20 May 2021 16:11:46 +0800
Message-ID: <20210520081148.17001-2-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520081148.17001-1-lizhijian@cn.fujitsu.com>
References: <20210520081148.17001-1-lizhijian@cn.fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: 1EF1E4D0C4C6.AE0AA
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




