Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 274E23DBA9A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 16:30:55 +0200 (CEST)
Received: from localhost ([::1]:55022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9TXJ-000443-LA
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 10:30:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m9TW1-0003Aq-Hi; Fri, 30 Jul 2021 10:29:33 -0400
Received: from mail-eopbgr140122.outbound.protection.outlook.com
 ([40.107.14.122]:5957 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m9TVy-00029p-9y; Fri, 30 Jul 2021 10:29:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9EmXoaeDrxHcnukVaWYkqnRtSisTzy1vJ6P0kKAbYO0dG7CxFLb8rqbW1fpkhrI0G81RRgJ9as5mSab8gIu0h1BYMPHeIpOlilL8WcNrSj9TcadlVd/4UIDdBEX4IcSx3UOVCXswRy0rcUiMNLpbGFjcyxzhbTABpPsHCA0Tcn34ALAfC+4X0eEA4J1Sdem3CrDl6p985IShHPhHcdwxAjMywB1/NotMkCQ+EA2ViKzQ0u6IsZ0Fs09Xj4ZPsbrdI8zxniZ0qLn2iNVHumZsppsDppkclno6IS0zfTYbq3czilutMT/W0nS+JgQhr8iWfbxnfxSepLvybuyGqQy7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIwHARxFON1cn3zXOYuRMgQ3XWybhHKu/bILTzPVVuY=;
 b=XHwSRNoE/Ip4s1UZE8s1rO7BlG/AGJkJK+cP239twAe42O0RahCDzyRVVbE8zF9M7Hp1CYO/0T+7Stan597FG0ixZmOHaGzuZys+B5ewYR1x7Oo9mvWauIVLVX90hacJ095C8Kl6C7Fq4gjkqZDaIcoGLrJXtbpE5sMNCfeIi6BYo2YMpURM95MLwpDNsOn3diz6I37i8GXKktygDk08b0y0yUB8CWgLZLKYRioXLRAQ95npBjD6p5FvpRdgQtL8h2KhcKcQ09KgeF6COske8EuguFkOcdNWerdRFn3WfBd8ILtn02hRs4PJKMLt8yWAxNBAqDc9h6AIQwEu8sBtyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIwHARxFON1cn3zXOYuRMgQ3XWybhHKu/bILTzPVVuY=;
 b=P3w5Qa2E+0/d+xkSC9FNKp5nRKrjBUNUFqIYGKW5k/7aGoBdr0D7ga3BVMByCtE+u4jPaCy5cC8nDL4JW4H9cpsqAof/nk50/p8xM0kogJZaGca4pYZsJ//JR4xdC8UrbTfWUL7k0IV8rHaKOuv9cuFjtX0ER17WzgzZ/EXsboY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6533.eurprd08.prod.outlook.com (2603:10a6:20b:33e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 30 Jul
 2021 14:29:24 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.025; Fri, 30 Jul 2021
 14:29:24 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 vsementsov@virtuozzo.com, qemu-devel@nongnu.org, pbonzini@redhat.com
Subject: [RFC] qemu_cleanup: do vm_shutdown() before bdrv_drain_all_begin()
Date: Fri, 30 Jul 2021 17:29:07 +0300
Message-Id: <20210730142907.18626-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0218.eurprd05.prod.outlook.com
 (2603:10a6:3:fa::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR05CA0218.eurprd05.prod.outlook.com (2603:10a6:3:fa::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Fri, 30 Jul 2021 14:29:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9ee84cc-731c-434e-62e2-08d953666d6d
X-MS-TrafficTypeDiagnostic: AS8PR08MB6533:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB65332A9FBBFE2F1E9911DC79C1EC9@AS8PR08MB6533.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GT1HpOgvfJhCag08PzG0fX2Gz+rp/y33HkpvgjsYZXbxqJz5Sd040fFS0mo6XAIBiZuhc2UiLXUpwtgZd09ME5gB8I+aREJY15uNVa03/bsn099Mnu1VtmzMQS0nEuQtPATzOwKT3vuOX+u+1qoYJtzI3AulMTbyid+8dqvdY/DGMOzsJD6DjkGsMmUgtnqlVNytgtYFsSIigNaW/i9rR9OJ6ccwSO5VK6viJ+xN4YLzsLIbwHOKLRzorkP1MppQqQ2MCALMUcbwdjJofD+WxoX3A8AL+5E4Jc13fxCMpyLtRd+Fau/NYaoyhzK4lkBhbcivK/HB5BjGOpFU7gz424h5Cgj1Zw4BO1GvcqUuFTTMdsgLGv9NGtduTCJS3fn039EHkIj3yRi4XdUKKt6h+6YY5gNr+gYp791XfbnBn08GOhaGIJVjDqL0zB9HCvCdG+Q2arG3gDkhL3znv1nqzh3BC5l6fqRlbdkADHB65XJDEw/zND03KEoIYJcN8Xj2D5SWyICX3vusSGRoWmGI9tfQqv+3Sh9FS3NO0lun6CyOOtFBi8Mp88jw25EZsaSZSAq+mVgiQLT9Vyvko0lntBKLymxkgm5RVHAbLEppRUW4me87bjVLvXizta0OCUIknPMXblzPItgb+OJ5O2TqFrYCA5VSpDDx5eaJLWy9KkBidrOnFtoVF9n2C1mrqFzs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39830400003)(136003)(396003)(346002)(376002)(956004)(2616005)(86362001)(26005)(8936002)(8676002)(52116002)(38100700002)(1076003)(6506007)(36756003)(38350700002)(83380400001)(4326008)(6666004)(5660300002)(2906002)(316002)(478600001)(6486002)(66476007)(66556008)(6916009)(6512007)(66946007)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pzTH6b/uzR1ScrZBqqfzu5TbUJypSbWMTSvdj8xNU5hIyNXQN2G4OoAIPbtY?=
 =?us-ascii?Q?bfyVJG15/Ueo98gWpCZYz2Kso+XwfDcyeK3uSKHE7HmhvwwVT+BgMil8LEyv?=
 =?us-ascii?Q?LkV9+9+hEE9Wc8lioLPmlLfnekLZKbyz86OWZMIEBPqHcOS2BF0JJBiTAWJD?=
 =?us-ascii?Q?izlapqg9bdqL2CjdCbbXAZVS1qO+W1uuvQlX5qspk+heiWDbT5j0fMqr2w5F?=
 =?us-ascii?Q?Ma1C7o/77mSoCTurof6ZaOdsIVYy6ISEN6DPCRJXyWwh/ky3Vow0XtLr/cll?=
 =?us-ascii?Q?3mBYTO1hn1XyeoNqmA2R4vs80vNCyAqNjQ9kaAhP/LqY+vwIzP72P5/Fb2/t?=
 =?us-ascii?Q?fakNfZQ9PUT/Tu1qMN6G7ToY1u14yjxd5gOaMmWvApQ3xe09d8hbifqkB1hL?=
 =?us-ascii?Q?fKwp5eEhKMkCYb6rT/pYIYL9nzaRUH5ybqSIAIYtdSrbIoyPIyehD+HRDr5O?=
 =?us-ascii?Q?0a3LoutlHl7Sou4WttfcLPwwJSQzwmQxoiuHYxaWPBtVryd/G5cRqO4/t0em?=
 =?us-ascii?Q?pO9/fWaFynXwjkNR0JmuMxCXiSuzTnmB7fjdL7Me7HSosPVPHp8ZxQfaOfvi?=
 =?us-ascii?Q?DWesEFDp8aoXXEF1Nx1enwLtheorRb3BHy1wWs+7Z2IBMItpBTCoCC4Au/G0?=
 =?us-ascii?Q?qb9KZHc0rIc8bSpVSwpJFXvkYuqFf9UtIlH8alecDVpuZ9PORKWVa+aag2fG?=
 =?us-ascii?Q?bw81myZ0q/GZoRqMdd3+ZP4MxzVK/HA8qy/UoK1sseWet6kf0OcSa24o/TPj?=
 =?us-ascii?Q?kec6uIQjws2Q7jLMbJqt3DnFSe+HnkBEsNUH1WK04et/pV1pf0uKnvNS6otE?=
 =?us-ascii?Q?tYtFbq8YcNt8qCNp90qTZrt8Cz7uXTX9wHzYTyT6ryAzTq8Ij44nnnpbN/tQ?=
 =?us-ascii?Q?T8LPAgwd1fSW3GbuS0CBp4DYFlEbAJdvUu7616NBZbGXUCDMEdJOZgG5Jz0H?=
 =?us-ascii?Q?ezuu9ZlVpApzy8l4y7a2cc4fYhk14rKAnuX348Cdcb9+bYR9kDexM0znCmMY?=
 =?us-ascii?Q?teFP7DkUvZKK6q5jy5plvnYwUY1tlhTIIDnoUr66vFKsqoWjRL0byUKRuQQQ?=
 =?us-ascii?Q?UlSw+KteyDIxve0QTIaGi02iRA8p70a85BjLzPWLWYbYo2pzy9iowv1uf/mN?=
 =?us-ascii?Q?ENynNBKADcit04WGMPlTDfj6db4anUmS/RnbDOtgTxu0ZCtObklptFGC6QB8?=
 =?us-ascii?Q?hnuw4yZ2pEY3O1BfJdiFV4SG/GXoQEDg7jfg73w+lD9VoRW4oaQLxzul+H9o?=
 =?us-ascii?Q?ppaEco5SedVxQPtavb7zIIPSttip8VrhLKl3Ck7f823HwTDSUA0XYR2Z3BH1?=
 =?us-ascii?Q?pzv20Ff0ryBu6WN6LSpTDYh4?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ee84cc-731c-434e-62e2-08d953666d6d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 14:29:24.1323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OEpXT+SwT1nKtvgGtjLKc0+ORvC/vQVy8YQ+UbybBT+5J7/VhzRfMhlLKKdRo49e028c1nuvjHlx30nw8Bi2idCKQJ8hWgD0y8szklTFAHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6533
Received-SPF: pass client-ip=40.107.14.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

That doesn't seem good to stop handling io when guest is still running.
For example it leads to the following:

After bdrv_drain_all_begin(), during vm_shutdown() scsi_dma_writev()
calls blk_aio_pwritev(). As we are in drained section the request waits
in blk_wait_while_drained().

Next, during bdrv_close_all() bs is removed from blk, and blk drain
finishes. So, the request is resumed, and fails with -ENOMEDIUM.
Corresponding BLOCK_IO_ERROR event is sent and takes place in libvirt
log. That doesn't seem good.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

Hi all!

In our product (v5.2 based) we faced -ENOMEDIUM BLOCK_IO_ERROR events
during qemu termination (by SIGTERM). I don't have a reproducer for
master. Still the problem seems possible.

Ideas of how to reproduce it are welcome.

Also, I thought that issuing blk_ requests from SCSI is not possible
during drained section, and logic with blk_wait_while_drained() was
introduced for IDE..  Which code is responsible for not issuing SCSI
requests during drained sections? May be it is racy.. Or it may be our
downstream problem, I don't know :(

 softmmu/runstate.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 10d9b7365a..1966d773f3 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -797,21 +797,18 @@ void qemu_cleanup(void)
      */
     blk_exp_close_all();
 
+    /* No more vcpu or device emulation activity beyond this point */
+    vm_shutdown();
+    replay_finish();
+
     /*
      * We must cancel all block jobs while the block layer is drained,
      * or cancelling will be affected by throttling and thus may block
      * for an extended period of time.
-     * vm_shutdown() will bdrv_drain_all(), so we may as well include
-     * it in the drained section.
      * We do not need to end this section, because we do not want any
      * requests happening from here on anyway.
      */
     bdrv_drain_all_begin();
-
-    /* No more vcpu or device emulation activity beyond this point */
-    vm_shutdown();
-    replay_finish();
-
     job_cancel_sync_all();
     bdrv_close_all();
 
-- 
2.29.2


