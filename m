Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4582EFB89
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 00:04:07 +0100 (CET)
Received: from localhost ([::1]:46510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky0ne-00022T-LO
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 18:04:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1ky0lp-0000jy-6W; Fri, 08 Jan 2021 18:02:13 -0500
Received: from mail-bn8nam11on2117.outbound.protection.outlook.com
 ([40.107.236.117]:47436 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1ky0lm-0004UI-W8; Fri, 08 Jan 2021 18:02:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/2us4XPs+LcEjbRSwe8EQ3x0aAmQK95Lctol7IS2/CDXd2N1fsVgqcY7I7MpLNMJTqmoQ0uekABRjQ1sk9m44ScB/o3rpXJcziDAsnsFUPCD3EJ8tmaNTYccXj8E6yY8KtSCK4A73ZVtDYgP4kcr5Ymp/FWePdYYcCXOZ2SpeMFvSWjLthmNxE2XhViqCLay/qioJZNudoz+vI36XyBjgxefV2AN78czV+bv6ijs4kXFOYFqCV6NE2qqOs9cLMh7TeiYEh973FLDakWOGzYnt11NMT9uL0fvl6u0O5VwUjZhFpY1lx8IjRPjDkCH/Da0P93hsAkIx9Wt3g2fa9Qug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8da5vMr8AHG+d3uorcsEs76sPVXeXrUN/SX+YL1hLs=;
 b=CFXMLwZRN/Vh/67i1LBw3PCdYjhVo2TKeuWx/XVFm9rDWU/B42RGg6J/WQeOERhoodTj8Op0CcJsKqxPUKxWg2iyrnrNO+tlVnz2rO4F4vTEkJE1RD6orOlZuEknG1Zi/hfqiRVcRQFnn0DaeXwIR+do4UQJVo4ma6Rh74kZjkp//qQQ6FZWRrT/CBfFkP4RCO71n72paNOcy0yrovZzyUZXeWecmHBYnYcllUaCY6/8vFalfCAKqMEg0T1/bdbNcffWDlzlhKqC7r1cSIceAHl0tSwqLZsrfXNrQgZWI2G2nt5LzAwKmwWay6Y+8d6oCUiFCzkjbcLQT6LnzqOnFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8da5vMr8AHG+d3uorcsEs76sPVXeXrUN/SX+YL1hLs=;
 b=7xKEu9OOrFwtnCb/TrfI75oOoKyDdBCIdJa8c0DuMhu/AMYhvkOTHVUVCiv9pFlpZ3V7iJX7rJVsUwW6n7THWKJcpEfEOe0erl1kJu5l0g5G735EqUzSMGKorgCVEFnUgCbSohm0PZsA9tteCN7O4DpAzumosgGevU2nzdTg4so=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4480.namprd03.prod.outlook.com (2603:10b6:805:103::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.22; Fri, 8 Jan
 2021 23:01:49 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 23:01:49 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH] floppy: remove unused function fdctrl_format_sector
Date: Fri,  8 Jan 2021 18:01:37 -0500
Message-Id: <20210108230137.8860-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [128.197.127.33]
X-ClientProxiedBy: MN2PR08CA0011.namprd08.prod.outlook.com
 (2603:10b6:208:239::16) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mozz.bu.edu (128.197.127.33) by
 MN2PR08CA0011.namprd08.prod.outlook.com (2603:10b6:208:239::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Fri, 8 Jan 2021 23:01:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40e28ebc-1d16-45a1-ffef-08d8b4296191
X-MS-TrafficTypeDiagnostic: SN6PR03MB4480:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4480492FC46851ED06C5DF27BAAE0@SN6PR03MB4480.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a/vcH3XVGSImj5ty4zs1jt7frbGI0UCoXRl14f2QMIe+SNphsXvjHKx6cIqVQTjdbko0YdDT1MVpnDB/2BZOI7DBsgCkFCLIOFCaT1Z5f7ccdlx/vhu/OzAykMYBkMFUT6hMLvW0NnRcXEHfheP4qL0hrKPuRt37lUaI1+aVr6XTHleqv61zpJkvWE2G9ewz/0duQOq7Kldkx/sUp0mY8aSV511dgvM0fL+pObqoSBJZoqVx3ZlZHXM2CiAu7o2EqZeaP+3Qt0SFRsr/X2aBiOD+soqh7hVSwfdpAY/5OiGkNZgdXGHgwblf1NIMA7j0JBI4L6W7owY4bxoGcbozDTnWnlU1Sar4P/weDFvmcxvRCNYeVQBwQUmSUumTHA6v0IMD+o+fX6lRQn/VRk7Q+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(376002)(396003)(39860400002)(36756003)(26005)(6666004)(2616005)(786003)(8676002)(316002)(4326008)(66556008)(8936002)(86362001)(2906002)(7696005)(75432002)(54906003)(52116002)(6486002)(956004)(66946007)(16526019)(5660300002)(478600001)(186003)(1076003)(6916009)(66476007)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?id4ShmyufQOI0SGOT3aDji/ffVC+zraB7Nr8NoIyKnoU1V6yljpRPjjIOUrZ?=
 =?us-ascii?Q?yth399Sw1BOmwnv1sSASP2wq1deibleEj5Qx4FD+7f0hEYo1n0gPP28WxwVu?=
 =?us-ascii?Q?UB8V6RQNCk52CwEWfPeisyrasyBMs97/e6jGBMSgK1dj9NoTrPwZ2VCY/ePh?=
 =?us-ascii?Q?/t52Bf5gJNob96AH2yIEX+E2hQcar/aiKOSBO/dDYptEoBVLIku1VffRkX+C?=
 =?us-ascii?Q?QEXMwd7l4XUgozjCyb56R3iqZ1z6zxVTIuyea4WAb7rLqJJMlbcjfpx4OMPz?=
 =?us-ascii?Q?zyT6BtGwCntz53301U2+uUBRWkha/ZyFK+5DtgabZ56k9J/sPtMG3JYXLUiE?=
 =?us-ascii?Q?OrsK/93QYxshNBLswejouOq6IXLmxmCtZumk7qaWRxUVDbxj+Utk/Ho30u3k?=
 =?us-ascii?Q?7gp2tunzn/VuJTrqp6v7cf73jhrCeOeQuzeEjIXSJqWj2caeq5gg0ujEhGvj?=
 =?us-ascii?Q?J5c4bE45ovPiQn3fPPNau7JWGgGF8kcOkXumUnix9PdDjsw8LvhQzq3hIGIA?=
 =?us-ascii?Q?yCiBUL2BQxZbnhPOdEEBBHtips3qNuFLvWgQpD4zYzMlUgyuiONQwFwVFFYR?=
 =?us-ascii?Q?L2ZaMsIJjiFWY+iGuEAohJw5TTmxJaGC5AZecHizL3RJV0A/AfH0uAz2iRTq?=
 =?us-ascii?Q?GBJhf3YW4Nt7UJzrf1gfG5XAmWVmA60pCeaYo4VFOHmXPOwLv4/DKrIMyTtN?=
 =?us-ascii?Q?7Ws6DUegzTKRRY9EAE6y1srVcJblFQltNaCe/bnLe4gu0pQRiuM9tPUiZ9zk?=
 =?us-ascii?Q?Afeii2e9dtlH6cIgJqZhwYVQKeZIEXSTCwiByBFHHb8CCdl8PbgIkwi+nUPx?=
 =?us-ascii?Q?H77rgNukZhHR0U5F63NSAk7CkHfmmrySkdiZ3tYXcZUepZPYYoWeoA7pFgvn?=
 =?us-ascii?Q?nbFWubtQ4lQ17x2HEJRn3yhkA9HTjbdvZo8MurflMCcHaJgFAskI7OYPzxPk?=
 =?us-ascii?Q?NOt9XerYVZ8Hz/ZLiqtTh3qFM/9VNCxXRgYoxjfsOvlz2ezrS0EkyUUGkPGJ?=
 =?us-ascii?Q?M2iv?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 23:01:49.5372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e28ebc-1d16-45a1-ffef-08d8b4296191
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FMaJ2aXvV4vC4bG8YcYE4vXb2SzUm5Y/Gps5A/F0eKGn4UuiFdbJ3P0Hs1Sl/vfI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4480
Received-SPF: pass client-ip=40.107.236.117; envelope-from=alxndr@bu.edu;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.998,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 John Snow <jsnow@redhat.com>, "open list:Floppy" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

fdctrl_format_sector was added in
baca51faff ("updated floppy driver: formatting code, disk geometry auto detect (Jocelyn Mayer)")

The single callsite is guarded by a check:
fdctrl->data_state & FD_STATE_FORMAT

However, the only place where the FD_STATE_FORMAT flag is set (in
fdctrl_handle_format_track) is closely followed by the same flag being
unset, with no possibility to call fdctrl_format_sector in between.

This removes fdctrl_format_sector and the unncessary setting/unsetting
of the FD_STATE_FORMAT flag.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 hw/block/fdc.c | 68 --------------------------------------------------
 1 file changed, 68 deletions(-)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 3636874432..837dd819ea 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -1952,67 +1952,6 @@ static uint32_t fdctrl_read_data(FDCtrl *fdctrl)
     return retval;
 }
 
-static void fdctrl_format_sector(FDCtrl *fdctrl)
-{
-    FDrive *cur_drv;
-    uint8_t kh, kt, ks;
-
-    SET_CUR_DRV(fdctrl, fdctrl->fifo[1] & FD_DOR_SELMASK);
-    cur_drv = get_cur_drv(fdctrl);
-    kt = fdctrl->fifo[6];
-    kh = fdctrl->fifo[7];
-    ks = fdctrl->fifo[8];
-    FLOPPY_DPRINTF("format sector at %d %d %02x %02x (%d)\n",
-                   GET_CUR_DRV(fdctrl), kh, kt, ks,
-                   fd_sector_calc(kh, kt, ks, cur_drv->last_sect,
-                                  NUM_SIDES(cur_drv)));
-    switch (fd_seek(cur_drv, kh, kt, ks, fdctrl->config & FD_CONFIG_EIS)) {
-    case 2:
-        /* sect too big */
-        fdctrl_stop_transfer(fdctrl, FD_SR0_ABNTERM, 0x00, 0x00);
-        fdctrl->fifo[3] = kt;
-        fdctrl->fifo[4] = kh;
-        fdctrl->fifo[5] = ks;
-        return;
-    case 3:
-        /* track too big */
-        fdctrl_stop_transfer(fdctrl, FD_SR0_ABNTERM, FD_SR1_EC, 0x00);
-        fdctrl->fifo[3] = kt;
-        fdctrl->fifo[4] = kh;
-        fdctrl->fifo[5] = ks;
-        return;
-    case 4:
-        /* No seek enabled */
-        fdctrl_stop_transfer(fdctrl, FD_SR0_ABNTERM, 0x00, 0x00);
-        fdctrl->fifo[3] = kt;
-        fdctrl->fifo[4] = kh;
-        fdctrl->fifo[5] = ks;
-        return;
-    case 1:
-        fdctrl->status0 |= FD_SR0_SEEK;
-        break;
-    default:
-        break;
-    }
-    memset(fdctrl->fifo, 0, FD_SECTOR_LEN);
-    if (cur_drv->blk == NULL ||
-        blk_pwrite(cur_drv->blk, fd_offset(cur_drv), fdctrl->fifo,
-                   BDRV_SECTOR_SIZE, 0) < 0) {
-        FLOPPY_DPRINTF("error formatting sector %d\n", fd_sector(cur_drv));
-        fdctrl_stop_transfer(fdctrl, FD_SR0_ABNTERM | FD_SR0_SEEK, 0x00, 0x00);
-    } else {
-        if (cur_drv->sect == cur_drv->last_sect) {
-            fdctrl->data_state &= ~FD_STATE_FORMAT;
-            /* Last sector done */
-            fdctrl_stop_transfer(fdctrl, 0x00, 0x00, 0x00);
-        } else {
-            /* More to do */
-            fdctrl->data_pos = 0;
-            fdctrl->data_len = 4;
-        }
-    }
-}
-
 static void fdctrl_handle_lock(FDCtrl *fdctrl, int direction)
 {
     fdctrl->lock = (fdctrl->fifo[0] & 0x80) ? 1 : 0;
@@ -2126,7 +2065,6 @@ static void fdctrl_handle_format_track(FDCtrl *fdctrl, int direction)
 
     SET_CUR_DRV(fdctrl, fdctrl->fifo[1] & FD_DOR_SELMASK);
     cur_drv = get_cur_drv(fdctrl);
-    fdctrl->data_state |= FD_STATE_FORMAT;
     if (fdctrl->fifo[0] & 0x80)
         fdctrl->data_state |= FD_STATE_MULTI;
     else
@@ -2144,7 +2082,6 @@ static void fdctrl_handle_format_track(FDCtrl *fdctrl, int direction)
      * and Linux fdformat (read 3 bytes per sector via DMA and fill
      * the sector with the specified fill byte
      */
-    fdctrl->data_state &= ~FD_STATE_FORMAT;
     fdctrl_stop_transfer(fdctrl, 0x00, 0x00, 0x00);
 }
 
@@ -2458,11 +2395,6 @@ static void fdctrl_write_data(FDCtrl *fdctrl, uint32_t value)
             /* We have all parameters now, execute the command */
             fdctrl->phase = FD_PHASE_EXECUTION;
 
-            if (fdctrl->data_state & FD_STATE_FORMAT) {
-                fdctrl_format_sector(fdctrl);
-                break;
-            }
-
             cmd = get_command(fdctrl->fifo[0]);
             FLOPPY_DPRINTF("Calling handler for '%s'\n", cmd->name);
             cmd->handler(fdctrl, cmd->direction);
-- 
2.27.0


