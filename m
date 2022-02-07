Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6E84AC65F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 17:47:34 +0100 (CET)
Received: from localhost ([::1]:52652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH7Ar-0007ZA-PI
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 11:47:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71V-0001sX-Go; Mon, 07 Feb 2022 11:37:53 -0500
Received: from [2a01:111:f400:7e1b::716] (port=32353
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71R-0005Iz-Fg; Mon, 07 Feb 2022 11:37:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtXGjMGtlKlcSFhCTfgjTGFrwK+nB+UwQQyJOAqHv1yuhbhtA40B89C+s+57bOSyHBfy1Ak8Fo6ND38bl2uWKx0PtbaXkYI7rz4/aV+R+Lx9zzb0FlzZO1v5RrKCxgbatSOEBxUY6ViRR75nK2wmdN4BZQwPLI3JDjT2NGahwq2CZf9Y1kj//8PN5/xaWAyOU2h0dxykpCDG05whCnOgf9RFzEjTcTP4tUwWyAoa+oqLSG+IfAr9o3XJox9Qk86X7c+lFtvtNSUCP5WJzPGxI3LioE0zbyUkNygYtQJf/CXTPUKAKctn3wfJtZgwuiokDK1yZ8Dkx4lkqTBuIwo2nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3L+XFt4siR0RTI/YGnb3BjtujWYcBiI/rg4jIe7lY4=;
 b=d4NorO81w8gv5o9DYUp/FtEl88+UFjF/RRzJenLweiUQqi/QqhUJg7LyNsllOViFrMRX9psiGvXTThvEW229ItUCchDAJyJkTGAU0mSrq7qIwI9cCq9fK7+QPwsKKUdM7eV5pgFjmpmng0WYMPuMH34jqUaXNjauf+grw2o+xmxdpPWYDBHRrh39QUNvp2/Ed4b8a5jTOGoVeyPrD5zx6GAt0d8iJ8w05DIbeJDxvyzQDHUPVX8XytdXcjxzWRyLDsMUP64kLG9grg4uZpKXmcG2Q2dBEywfL9+LyBaePB4z0j/1y+5Jet3UflLAVq41ZzjYSYFYctbxHeNrmrQg3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3L+XFt4siR0RTI/YGnb3BjtujWYcBiI/rg4jIe7lY4=;
 b=B7X2zYn5GbHobPWG9RgVPn1uwwLj+tgDlCsurZufkQDf/OWgJ/ZYBe1ipPon47bu55/wJ0Dzei9iedfW7YxXRQSuCsUKOfdA7qesV2wiYPNWS+iNAehvZUUaRCW0PJJ/B5IOzMTy8qos6jCxHYTc6P6jhQpmTamEPjKi2Ml92lI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0802MB2288.eurprd08.prod.outlook.com (2603:10a6:800:a6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Mon, 7 Feb
 2022 16:37:38 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 16:37:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, ktkhai@virtuozzo.com, igor@virtuozzo.com
Subject: [PATCH 00/14] block: blockdev-del force=false
Date: Mon,  7 Feb 2022 17:37:14 +0100
Message-Id: <20220207163728.30362-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0126.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::31) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15396d07-821f-4454-8daf-08d9ea5826c6
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2288:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2288AFFAAE40EBA452A7A75CC12C9@VI1PR0802MB2288.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DzLVHkKA97rQm2axBd45yn8n1o5PhmkGfcWUK6CChwx23Gt2mZ9JZ1C7LA2wyit2tYmbqOO75g+YJclmZgC/0lrkFXV52awkEQ1ubNZMP2pAmV/lJqc2R1TjglPAPH6qzce7TNC3dA41JA0oGeqDkPX4K24kVdOj1rRiOdZD/V/PN8N9A4OPLkO8ifgZkE2XznEArjV9SYkWUjG0Y3KPRgyS15YlxHQa3cFQXIWlHj23hXDuIZITqh8DbosTIK1S/rrtfzb8+JCkN+PlGZF0dUXV2RUoFAHZeriLylr5JBXfQUQ0DXo7ph7lseD7HHoBMYnQHwfk9iyWfJZivAQLUdw31nWgkI0Ipp+QpkYTrwh0xFWcLtrxeVC9P48iuLWnTRryTlsWfoGXXu700UVkHXesCh/ZMnl78CBQ+dmsk1J6UzewUR0g+uFlgp57llFjzLjDMOIORsvK/7AJukm7BDG51bxyxt9HppxE/t3+k2f8D+r6XchySr3WuTrmpfwzONdV6HKntwWZAaBOY9xGK2daz/HA9rUnvVfFpi8rZeBV6+we022XekYbmv+0KmXuL7dwBtoCrNhU/Qr+uw8igQCobstxj9/e0b+RFPYRV/6O2D8+6hdGtjKU8zY0VXghlLaWEXOvt92BmwhWD4UrLsciMbSEpPYkZbVfMwQLv2hEhHEqK6xn5+F70ITErr/M/IthyneaCxJa76sg+nB/Blh7UZYVSAK10ULDaPxfHH/VKy9qt1upRDuosZUbIrHAFansdybgTz3PVEgopa0oxkMtkm85H5wJVpFqYaHFJMx5iY6d8qZQ0NhziBohixB1X5jJYuugNwxDo9SM1QHk1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(66946007)(66556008)(8936002)(8676002)(38100700002)(83380400001)(66476007)(5660300002)(6916009)(4326008)(2906002)(508600001)(966005)(26005)(1076003)(186003)(86362001)(6486002)(38350700002)(2616005)(107886003)(6512007)(6506007)(6666004)(316002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JcbSKiEjSHNRQtajg6RacqzUG9MaW1/VoRfQnoH4LLuSbnHjJbZuoKgwTQsG?=
 =?us-ascii?Q?sb6cGF/si+vfV9WEqEHYrFCrXeJe8/mWVDspaF6wpAIkdlr0sxdSyVyMBj64?=
 =?us-ascii?Q?ms0s+SKq9BV5DFCxecUfOa0hZn5O3cLrUdVLQ2abTicn3VVuHMDnpNKCDS2D?=
 =?us-ascii?Q?MiWamwvdav4J5LjwwBgENTFVnRDrN72lWSMn7YvsCrIQZ5pyArIOU90BlY64?=
 =?us-ascii?Q?Woa/DRMOwy2UKtnMkpZIHmf0Ws2BjiD9ofJD06ixWqdOMuK/MXclGqHKTRwE?=
 =?us-ascii?Q?6M7yFsNwtKuVi8EOwYmScx7Uc2rUmErk8DPVZhvqU67NYSWbA6S5ZRnY/SkW?=
 =?us-ascii?Q?dE2ZHdlBzZzpGJ5HtUOZ7+8bTDKWn2NYLMoxgoOOFJzbD1o//9lWkTy4Orrh?=
 =?us-ascii?Q?mPBK7ppfxXoCrMQmpD84UqbN2cQaGoxhPrCmsq0yx5rXlEV4LTfM2tR9fnpu?=
 =?us-ascii?Q?tSAZ+L5pIA7KbDCrI700i8Wt14+J/yHisf4VxEA7WzdTFwqx/rQ3H1Oalvpt?=
 =?us-ascii?Q?KkQ/OGMbyMHDBfsRa2djetLsis1Q2AfyiuMCXYHdMHyVBJN0CmaMle8E6aBo?=
 =?us-ascii?Q?0wHxtLSLyPlyTVSL0YOp1/BHaklFYbaQVweRyPwRIkSvRZtO0IQJDWvO5xFw?=
 =?us-ascii?Q?wxiblWp8w4Vr3Kjzq7DtxNOgIxuUp9KW80GYp7FRk8u42K42C+TlBOsgX6d8?=
 =?us-ascii?Q?czCSg39WD6+tRkVqxZri7U3m5HHxgaXe0pelFh/j0jgcPwPAYXeUQ8bh7mKV?=
 =?us-ascii?Q?xBubZHRAsKS/TxOnwlAJgZsfMrV2CoXG5Pg6YrNSwu1SQlWMJMHxgxU5vBkd?=
 =?us-ascii?Q?1wXk8pbTfzSbpkhl+TpTCXANNa+3bocLCs0paOdYHCPx6Mm/04znlJTuL+10?=
 =?us-ascii?Q?sEEtqAOsuGgKuk9cf08xohXxG4dQ1NK7gEeb97u6i8NXqREv9Zmb4E92HEcc?=
 =?us-ascii?Q?e6JLcdECqhFmPmTu4ZCAT9lkm5nAe275bXs9LNUW6HoS/27dhmi1Gif/zkDW?=
 =?us-ascii?Q?z8Ov7LcOtuvExLSVjx0tMmXrV2J2NyH6x/qQzmQQbf5L06Ywk/VRkeFqNVH4?=
 =?us-ascii?Q?JWUX8DdzzY5hfn18yH2QYXf0+BhrOtvdYPfgEwnLJwJrcGahNOJ5PyD3R6Dv?=
 =?us-ascii?Q?8VAPmshE/jb0oz2hhPPg8O0e3yRrktChGb6KM5VBnoIep8qdqtS2hHtVYCl+?=
 =?us-ascii?Q?B1hThL2sEayg7aPTwDHsThaLupdVBge/dSvyaxHPQShWcKtxGwLhnLhuTEoX?=
 =?us-ascii?Q?NpxunCb6ThnsEpxHdKlUxKCZCkfnZBppiCnU/Kglk1AAbTJb3rGGc3OJ5d1z?=
 =?us-ascii?Q?X2rRySW73p/8iJ8nzz8EK6NWGpcdsAbENZzcMcFg0CxPPkrvbP1EsArvM4Uv?=
 =?us-ascii?Q?yqbyhzmqblLR2cPqgrpwGa939rMwuTmp6WS+dxfjzgyFt5s+x4bKsZlH9dy1?=
 =?us-ascii?Q?IZBYLLjMnT2UEyyTAxKuZBegtyabNb8LEinXvmfAgQl7db56Rgbs6CC9pWi9?=
 =?us-ascii?Q?P16+VU97qkcF7bZ73xM4mEaBViodXcybvKkEFxlV4iiB8UaJoKGZ8ar24uJF?=
 =?us-ascii?Q?gN/9EhdQDJGzaL4DW5L/4VLUb5hkJU+eMRVMuCkuzxkaAIc6aArJhoTWIN2h?=
 =?us-ascii?Q?a5g1mPC3Tt7h0apQecyexNY01QPd/IudZWv2y7SJXsOpJCTVYjlHrbtjqIh8?=
 =?us-ascii?Q?c08SOA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15396d07-821f-4454-8daf-08d9ea5826c6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 16:37:37.9922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: egjThpfVld3auiPPk+T+mFQt1erRjIztoBUVNxo8/toPpudKA9L1/CrxwJDDK6zJlrP2isqaKu2EcO7hlbV0djhvQVYOQyAPVK99VTY+UGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2288
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::716
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::716;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Hi all!

Currently close-path in block layer can't fail. Neither bdrv_close() nor
.bdrv_close() handlers have return value. So, when something fails (for
example cached metadata flush) the only thing we can is to print an
error to log.

This behavior is OK on VM stop: we want to stop the running process and
if it can't save metadata, we can do nothing about it. We only rely
on disk format safety: dirty bit or something like this, which will
force some checks on next VM start.

Still there are cases when we _can_ reasonably handle failures on close:

Consider backup: if something failed when we close target qcow2 image,
correct thing to do is to reject the resulting image and consider the
whole backup failed. Still, current behavior is to ignore such failures
which probably leads to creating inconsistent backup images.

Another thing (that actually brings me to creating this series) is dirty
bitmap manipulation: assume we start Qemu (or qemu-storage-daemon) to do
some manipulations with bitmaps and prepare some new qcow2 image with
these bitmaps. Native way to store bitmaps is just to close qcow2 node,
so we either call blockdev-del or just terminate the process. But in
either case there is no way to get the result: is everything stored
correctly or something failed?

So, welcome the new series, that provide a new interface
blockdev-del(force=false) to either get a clean error or be sure that
everything (bitmaps, L2 caches, refcounts) correctly stored and flushed.

Intended usage:
 - blockdev-create / blockdev-add to add a qcow2 node
 - do some operations with it (for example backup job
   or bitmap manipulations)
 - blockdev-del(force=false)
    - If it fails
      - report the error to user
      - repeat the command with force=true (or just
        terminate Qemu process if no more operations to do),
      - _remove_ the prepared qcow2 image from FS
    - If it succeeds
      - Great, now we are sure that qcow2 image prepared as we want and
        correctly closed/saved/flushed. As well, node is removed and
        Qemu will not touch it anymore for sure. So, report success!

The series could be found here:
  git: https://src.openvz.org/scm/~vsementsov/qemu.git  tag  up-block-safe-remove-v1
  browse: https://src.openvz.org/users/vsementsov/repos/qemu/browse?at=refs%2Ftags%2Fup-block-safe-remove-v1

The series is based on my "[PATCH 00/14] block: cleanup backing and file handling"
Based-on: <20211203202553.3231580-1-vsementsov@virtuozzo.com>

Vladimir Sementsov-Ogievskiy (14):
  block: refactor bdrv_remove_file_or_backing_child to bdrv_remove_child
  block: drop bdrv_detach_child()
  block: bdrv_refresh_perms(): allow external tran
  block: add bdrv_try_set_aio_context_tran transaction action
  block: merge bdrv_delete and bdrv_close
  block: bdrv_delete(): drop unnecessary zeroing
  block: implemet bdrv_try_unref()
  qapi/block-core: add 'force' argument to blockdev-del
  qcow2: qcow2_inactivate(): use qcow2_flush_caches()
  qcow2: qcow2_inactivate(): don't call qcow2_mark_clean() when RO
  qcow2: refactor qcow2_inactivate
  qcow2: implement .bdrv_close_safe
  block/file-posix: implement .bdrv_close_safe
  iotests: add test for blockdev-del(force=false)

 qapi/block-core.json                          |   6 +-
 block/qcow2.h                                 |   6 +-
 include/block/block.h                         |   3 +
 include/block/block_int.h                     |   2 +
 block.c                                       | 438 +++++++++++++-----
 block/file-posix.c                            |  38 +-
 block/monitor/block-hmp-cmds.c                |   2 +-
 block/qcow2-bitmap.c                          |   2 +-
 block/qcow2-refcount.c                        |  22 +-
 block/qcow2.c                                 | 152 ++++--
 blockdev.c                                    |  17 +-
 hw/block/xen-block.c                          |   2 +-
 tests/qemu-iotests/026.out                    | 126 ++---
 tests/qemu-iotests/071.out                    |   3 +-
 tests/qemu-iotests/080.out                    |   4 +-
 .../tests/blockdev-del-close-failure          |  54 +++
 .../tests/blockdev-del-close-failure.out      |   4 +
 17 files changed, 611 insertions(+), 270 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/blockdev-del-close-failure
 create mode 100644 tests/qemu-iotests/tests/blockdev-del-close-failure.out

-- 
2.31.1


