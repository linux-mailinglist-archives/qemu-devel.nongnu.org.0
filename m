Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F8D2CF6AB
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 23:19:10 +0100 (CET)
Received: from localhost ([::1]:38294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klJPx-0003rU-Lh
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 17:19:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klJFj-0003SZ-19; Fri, 04 Dec 2020 17:08:35 -0500
Received: from mail-vi1eur05on2136.outbound.protection.outlook.com
 ([40.107.21.136]:31968 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klJFh-00027F-1w; Fri, 04 Dec 2020 17:08:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DK/w1JrZ0eADHwLGgHhbWWB8epVNz8FLQoQ583CAxWVOh3wSjFipNWCUJK2Q9lJO2crSO7jFJu6uf3hK/K55HXPb064VE8Tt1gNrg+R/ZpH4oVm2aGPFAnGMVG+YwArL8Hgi/oXCXdmhxhtZqkx1OpIPCQpls+4SdrOV26uoWnbKe8HOvaQkpkQXUJb8p2Xh+5AmiDNQX5BZXTOx+9aMnjqxCC4UTOdg21Da05Tu+616Gz/pXeefVTrWnRFep2l6UHUD9Yj1nZFJb7c7avJ5c8Zk4pQqYtiIJHvu/W0mlMC27KiAj1XfYL8spgNWWtKx/FyKfQ9G2MzxzCef/UF+1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+t1IXKor3ol4iALhRk16dDwM+gNXXBALrC/kgwHZQU=;
 b=NSZCym6fNCZ1330ptx+Z9M1w1pW66nwAWHLJWorph/xEGHgl5KT0hXRUFSvlh6huFN4f97gisSjzbcIPIx/iDuY9BEHIPd+W03BQV5ZvHoi9rWmqLx9NrXfpSaTlxWek2yNi3Nk0CjKUUY5V4GibtNL26fVyEdSE1jTeMV7IwruN76mAt61RDoQ/WV7GAr9K0xuxBuvDFs8BoyQpkgXZwcpGJSom+q2Y9iTHDgKG59NqPnGG989SrnGO6UF1UIbhsBCLO7zQReYko5CNuMIAOJF5/vfE+Ndx2XDXbV/K26AumBFiQTzB510svLPpNSN5k1VK10pj1KnphujfbYpvSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+t1IXKor3ol4iALhRk16dDwM+gNXXBALrC/kgwHZQU=;
 b=Mt7noRAE9gVDaz+WcmzG2RU6bnLyIRZws2R22j3lezjgGXUcLmlENdTgwcL2jN51ykA4/zahwMk9PQ4ZDPGB2i1S3olkI5bG50trLyCS/uHqP6WTfjkHi3AvVsDoSH3azykbmwG1PElxbSQQ1kwlh7UhgndiutT/g4FX7EPmiHk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4072.eurprd08.prod.outlook.com (2603:10a6:20b:a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 4 Dec
 2020 22:08:20 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3632.021; Fri, 4 Dec 2020
 22:08:20 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 jsnow@redhat.com, fam@euphon.net, stefanha@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, andrey.shinkevich@virtuozzo.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v14 07/13] block: include supported_read_flags into BDS
 structure
Date: Sat,  5 Dec 2020 01:07:52 +0300
Message-Id: <20201204220758.2879-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201204220758.2879-1-vsementsov@virtuozzo.com>
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0701CA0003.eurprd07.prod.outlook.com
 (2603:10a6:200:42::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM4PR0701CA0003.eurprd07.prod.outlook.com (2603:10a6:200:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7 via Frontend
 Transport; Fri, 4 Dec 2020 22:08:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac4c9500-675c-4bf5-2378-08d898a11c22
X-MS-TrafficTypeDiagnostic: AM6PR08MB4072:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4072BAB1D28BEF23321E853FC1F10@AM6PR08MB4072.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JxKLKFnumOxHTncoslo9rIZal+bKlYEmIy1CdnXzP2zvw/lZiFjo1HU0ypeRsP5ZtlxtO3iVWjYVYHfrK12W8QJQMZ6PwfMc3GnS6QM6RAcvqrSuizRMHnSVW+XuEGzRpmRa42vmNoE2aEmkybwq/yduTj2gF90kMiDx3g5O+xUCfUpo23dskxBQScYnMpRlHYpNQMQyBL/UhXZJtrZcTYH1D0MJ73VJi4o3OPYLH3kkm7hFGgv9NMKkDxPOuFjG+sEEvoVPW+A9SgbmBoTCyMpgRwxlIRudRPHkCdlBvcwOo1ZZu6R7iXge4nbC0vDKLCYiAlggB36ZeIegfj53Pg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39840400004)(136003)(396003)(8936002)(2906002)(6916009)(52116002)(316002)(478600001)(6512007)(6506007)(83380400001)(2616005)(8676002)(6486002)(956004)(5660300002)(6666004)(107886003)(66946007)(1076003)(66556008)(186003)(36756003)(86362001)(16526019)(4326008)(26005)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?cg9NsVzVWUEpA0TAG7K0tXsZAtkvzukSf+Dea3vuZLVLRfd51Td2i2/JvVXO?=
 =?us-ascii?Q?my7UN7U8/7E+c+70JOCzl+pJg7mNATFsMFNvooOuTU4sBKfVXJ0j8LmreHuC?=
 =?us-ascii?Q?fqYZlBo9egGzhwLxZKst3p2Uw/+yQaxE5BYGArIyH8tz+mBdcuHVWtkd5YDr?=
 =?us-ascii?Q?1kv80idseg/yXCPXcH/5KTSV3hTK9bMXKeVUm5sF3AtY6DFK1h1jFa9KpnvZ?=
 =?us-ascii?Q?6hLKfDopOWr2fKOoojj3pKnSNSi70grwQ13jt4lM5Z6iQixt5dt46jVMN3xw?=
 =?us-ascii?Q?Cq6EvWq1e6HcPBAo8ytNRxe5lGOclWbfR9/Wmyqcv+AOSGCySV0CtYa0FSGz?=
 =?us-ascii?Q?9KmBC+YoXKpg0VqJpzpcIPaWxpSJNcn5lGjfgVRJluxZ2iNsbaWrqsh5OHn6?=
 =?us-ascii?Q?AMFZEabvGvSiDStouVZQBkna9A5oLfzLcozhzAn7JLbxkfEuRVLOQQX9TWAP?=
 =?us-ascii?Q?h6hQOTAoApUjKe1Gd+QF+foxQmAVAVE3uV+RWI/a/R2zrSvzBQzb8Hh90xHt?=
 =?us-ascii?Q?2NbbpP4j1NaAsYwdUjsFnpCvWG6yMpCentTPhieFrVH+bm8RNL291Q4SA3go?=
 =?us-ascii?Q?dJGxuPwunuuK5/Gf8M2lvbO4a80yIPVb0O4MTBt0AtGfd+epobavCU6qJnG1?=
 =?us-ascii?Q?3jSL31AReYGIGl+S7xKCDWbI+nOFJV27xUi0lzYwyUWbUPQCEKDrEEkN9MZv?=
 =?us-ascii?Q?ANkvZpQVZUevXaqFlVZyxdbilVfhMSbQm1cRFWevdANXWMBh2qGDqf/2MPGr?=
 =?us-ascii?Q?vx6mv9IUjhPdA1HI0dBBqsfCnPjt/Wl7XKWljtHlhQhN84aYMffIF1BOFjdA?=
 =?us-ascii?Q?yiRItfL5lar2C5XL1wbatMNRPPjvV4zzVNtu37aPonhznOVCQb9OkRTK1vkX?=
 =?us-ascii?Q?B5Bokuy3RCqThNowhU3cnwlM7up/uAiuBC/M+M23obAiViN9L5eSf6x4cfjP?=
 =?us-ascii?Q?0SxaXIqwJI8GTv0slbSG/B/Ng3eltErq+MSCmO2HuQV/HGMsqlycPZuk+cSC?=
 =?us-ascii?Q?++1o?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac4c9500-675c-4bf5-2378-08d898a11c22
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 22:08:20.3494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v35OZzro4fFQseN1iRoDg1LhBFN0rt2APWK03ws3gy45uOywCv0WPLg6l++AhtvC98LhrVVXJ1UDRCmfYb9I1MZ/B2RM2rGuqB8cpQCHST0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4072
Received-SPF: pass client-ip=40.107.21.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

Add the new member supported_read_flags to the BlockDriverState
structure. It will control the flags set for copy-on-read operations.
Make the block generic layer evaluate supported read flags before they
go to a block driver.

Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h |  4 ++++
 block/io.c                | 12 ++++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index c05fa1eb6b..247e166ab6 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -873,6 +873,10 @@ struct BlockDriverState {
     /* I/O Limits */
     BlockLimits bl;
 
+    /*
+     * Flags honored during pread
+     */
+    unsigned int supported_read_flags;
     /* Flags honored during pwrite (so far: BDRV_REQ_FUA,
      * BDRV_REQ_WRITE_UNCHANGED).
      * If a driver does not support BDRV_REQ_WRITE_UNCHANGED, those
diff --git a/block/io.c b/block/io.c
index ec5e152bb7..e28b11c42b 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1405,6 +1405,9 @@ static int coroutine_fn bdrv_aligned_preadv(BdrvChild *child,
     if (flags & BDRV_REQ_COPY_ON_READ) {
         int64_t pnum;
 
+        /* The flag BDRV_REQ_COPY_ON_READ has reached its addressee */
+        flags &= ~BDRV_REQ_COPY_ON_READ;
+
         ret = bdrv_is_allocated(bs, offset, bytes, &pnum);
         if (ret < 0) {
             goto out;
@@ -1426,9 +1429,13 @@ static int coroutine_fn bdrv_aligned_preadv(BdrvChild *child,
         goto out;
     }
 
+    if (flags & ~bs->supported_read_flags) {
+        abort();
+    }
+
     max_bytes = ROUND_UP(MAX(0, total_bytes - offset), align);
     if (bytes <= max_bytes && bytes <= max_transfer) {
-        ret = bdrv_driver_preadv(bs, offset, bytes, qiov, qiov_offset, 0);
+        ret = bdrv_driver_preadv(bs, offset, bytes, qiov, qiov_offset, flags);
         goto out;
     }
 
@@ -1441,7 +1448,8 @@ static int coroutine_fn bdrv_aligned_preadv(BdrvChild *child,
 
             ret = bdrv_driver_preadv(bs, offset + bytes - bytes_remaining,
                                      num, qiov,
-                                     qiov_offset + bytes - bytes_remaining, 0);
+                                     qiov_offset + bytes - bytes_remaining,
+                                     flags);
             max_bytes -= num;
         } else {
             num = bytes_remaining;
-- 
2.21.3


