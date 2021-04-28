Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1AD36D08D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 04:30:46 +0200 (CEST)
Received: from localhost ([::1]:45958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbZyQ-0002eU-1f
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 22:30:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lbZw6-00029H-Jr; Tue, 27 Apr 2021 22:28:22 -0400
Received: from mail-mw2nam12on2125.outbound.protection.outlook.com
 ([40.107.244.125]:12903 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lbZw3-00036V-EQ; Tue, 27 Apr 2021 22:28:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ILfSIbyiG1RhX9f3kd1OkNynV3VRzNUre2xqp6QS+xsjgDMtWCe6I6il0KwLIrffT8EWf4yu2L4EIBus2HhGg8nqYZMZ+xaLfIjrIa4TnFJNEcTgVLVZ84uwoDdkzR0dAIhyZVBkcTkiQX6pCBLdEYfji/zkuCJnAlI2MCo4UfAiM88otOCgVFcQgQigRcyLinSWgBAMJz9VyQzt0wJIn7F/BDO5g7y5lDvoMZ8mRGgTLUXnXMtczYcErPa8T0S1XnsrLH8OZiQ1q6nQCe0lc4Khd0kF6t+WFlEAllKTK11isAVCZORQ+dwH/HiFFL7GK1iO/DOI7aXlCPWQRvKf0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONMzyKYlHo7FeYLpdGGvwR2qISymD6L2csLge/vTpEs=;
 b=HI5+mA+TxOb2CaIYgzoDbMhpwUrqoC9tpJinpepQ2kTsGhwTlUp8mglhunQWEVRZA+QHFPT8h/XT0OpSTTkKRVi3B+3Yowp62A5cVbNqXeWHyd5woXS9hz0EJdkHfXz2v8LsgK7XPWz6W5z+uw+g29yhwvwafV2UZxQJ2LPwoIjZZo4crg/F7QTFxzRgu+LrSyWHkOSDpI1g+wr7urQtaqHW2htZyfIrbT7ZQEUjOwrSorw7V8F5sorQNiKGViZUrH3Yay2KPa/NYhNDcTVkW9wvPb2o/QwYUPF5wPjnNmEY33tLmOT9eapbw7Mzt4PIHP7Jvghf/Af0Sk16aAnQ8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONMzyKYlHo7FeYLpdGGvwR2qISymD6L2csLge/vTpEs=;
 b=8UTa0wq2WIlrku4ya2v3L+PhvRExaM6cphFlxxsPNJBHwusTE3h7zC5yG16pQAWddFMJFDInZ6hhPChP1x+yCBw/C8ynWJixGLlXtmuo+8Ze1uu2EZ7xKK1JXqMWEB2a1irQSPOuYRt7D5U31A0Ewa6VYxS2OnjiPkGy5USYSaQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5514.namprd03.prod.outlook.com (2603:10b6:806:b0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24; Wed, 28 Apr
 2021 02:28:15 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::c0e9:c756:fca4:f971]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::c0e9:c756:fca4:f971%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 02:28:15 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] floppy: remove dead code related to formatting
Date: Tue, 27 Apr 2021 22:28:03 -0400
Message-Id: <20210428022803.606814-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR01CA0050.prod.exchangelabs.com (2603:10b6:208:23f::19)
 To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR01CA0050.prod.exchangelabs.com (2603:10b6:208:23f::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.25 via Frontend Transport; Wed, 28 Apr 2021 02:28:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff8ed8c5-a1ac-49d7-3943-08d909ed46c9
X-MS-TrafficTypeDiagnostic: SA0PR03MB5514:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB55140E3186CC0C342BD9D292BA409@SA0PR03MB5514.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: URKVZTzOD8s1xyHbyjjCOV3JHDy7IDq9UCaiOSs6JugaNpHfD/aIJXOqvqlZW1cRC0qt7WWCNKWJcKjon/Qna/XD8Cdt0cMo9vOjKpF3wR6/4ANxWkOmPofLKU+mn3K8X8h+xJ5R5MKhKaonC5zXav8nDwIJf6cgh+ECLQPa0rU8zLbAk2EMW//7x5Dia7GTGEBoFixcYp7+7wPcCrvbkE8nJfYmyeAJ6aB3E/ysVu+JHoYOqJ/Xls9UR/9vkDAhW4vHdOTs/XcjhsBJceCMm7+2VQRjkbzBEwuqw2a+3kqh+JY8cx1FZ6rLO7BBL6JUOHqZV9vfLLG4xEYDucC24q58br9YlZDxTPghuQ1F6U8st26YxiLVwk/Gcz8diu8Ca2nmOJjj6xYCDj9LEDOBnzWk77l9KMrK8VsRBOXnabdmuw8fQAwTZmpLCVLF5ApOOju8yjE7T8GJqzjb702rBPDfiSRBhcuK138eQPF0KwGClkUHjujcLtX48QUaeb70az17rKkuiLWwtznHFFnEFzCPu5wG8BAKP2AyctkCD3mZWDxn/N4T6kBUHOOIhPV5/nyYi03sU3ZUWnAO4NI/Mj7nYY/SLxHf0tyLRrNg7BNV+5uglQ8CeEEYgk5ISYXzWPhsXGRiqn4ZBYo0PyFN0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(4326008)(6916009)(83380400001)(86362001)(8676002)(6512007)(52116002)(6506007)(2906002)(6486002)(36756003)(26005)(66476007)(478600001)(186003)(5660300002)(38350700002)(38100700002)(16526019)(1076003)(54906003)(2616005)(956004)(6666004)(75432002)(66946007)(316002)(786003)(8936002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MnBWNzl6UFlCaFRSZ2c0cEQybTRVK29jalpJRFEwd0xld0xaVjN2NlBIWUN6?=
 =?utf-8?B?ZThYbFZMQmVveTNVY0pEUDV3cXJrdHdXUXRLdmNNWS9aOVBTWXJha0thcGZx?=
 =?utf-8?B?aldRZ1MvNk1PSW1iTmQzNlFCTlpzNUN2NzBFMStHVFg3WlZjeSt4WFcrMURG?=
 =?utf-8?B?WmJ3U0RPN1NZeEEydnR6K1BIQVVUUzg3azEzNHVKdm5tcURhTUhqNVNFd2NL?=
 =?utf-8?B?VEM3YlA0UVEvZXE4dXJFRDR2Ym5kdGt3bWlOL2pjR1c2c0NXTWp3WUZ6Q2Nz?=
 =?utf-8?B?blpqRjU5R2xmM1IrSlkxdGZ3djVpV1RTRWFLN3ZnSUZ0cU1WWDRZdGRWcXpN?=
 =?utf-8?B?dDdITWFlSnArWXN1Szk1a3g2QkJMZVhhc1lYUmtORUkzNWxKdnN1L3JsdEdi?=
 =?utf-8?B?TVFJbHlGZ1lhamVGejdZWGRTcFFyZE45OWhTWVFmSnB2TXE2NGxXWUtDYkM1?=
 =?utf-8?B?bDNBQUFtNW80eGtuSW01NDJIMFFlVlVWemlpc292L1U1TzJudU03ZDJYcTVo?=
 =?utf-8?B?MVpFK0M2Z1R0L1l2dCtoQjRTNTJ2WjF4SnFCOHlzcEtEd2FwT21DUEZvY2NN?=
 =?utf-8?B?YjJidmlHL0wrQlBpMkJrcXNLZk11TlJwVjU0S3Q5RHVQMUJDUEJOUXhhVlJy?=
 =?utf-8?B?VlRVRHJ4M25tYkVnTERZL1Q0a2lYR3dXMTR1ZWtVei9oeGxpOW5GcHp0L0N3?=
 =?utf-8?B?UldDLzU0R3BYay9NSXBKZTV5ai9qNkhSYUgvekdoT2RpZ01PQjBtR1VZWmU3?=
 =?utf-8?B?bnBKVTJpMk1xMlhrbWo2bksrbUtVM2xBY25VdU9QYTFlMWh2OWFXMTE5WHRo?=
 =?utf-8?B?ZzloVDRNNFlPbU54ejhwOUxuTDV3L0ZUbHFEb05FQUNIVUFCV2VqbHZyVGdB?=
 =?utf-8?B?VVVZc0ZiSXZFMVpLenducjRDQkhKeVo0eStFMmhJenBlekc3VmtuRGJlVVZl?=
 =?utf-8?B?REJKNS9aeEsxSGZBM0FzZWl6QTZwOHlSL2d1Y3BYV0p0SDZnNDJKQXprSTN1?=
 =?utf-8?B?RGFSUlBwdmVSRmpBeVY0K0duNTJ5M3REbUZOa3hSMGxJYXRrT0tiQUFaR01X?=
 =?utf-8?B?Tzg3SDVYWEZ0V2hqdFN4cFhubzF2Umd3cEh6Q1lzSDFyUS9qRFlpbkhaQ0w2?=
 =?utf-8?B?QlB0NFlza21HeTZtT0k5RnJ1YTc3WmVRNk93SC9WUFZYUm1ieitiL0FENG54?=
 =?utf-8?B?alRzVGF4eSt1WlRETUE2bVNYVHBhS0gwcXU0c3pERDIvUFBmU1UzQUUxMnpz?=
 =?utf-8?B?UEFZUmNpaDd3bU9yNnE0cW0xTURJUzBNdnRSbUtna2ZteVo3Y2d3VnRmWm5q?=
 =?utf-8?B?aU1ob3lHMk4wTEI5Z3J4aitpWWx4clB5bStiOGxScTlOSFJ0MGlDY0w4Znk1?=
 =?utf-8?B?TStTaVpSYitiUDE0bFYvVk12MGVrNVFabXZzaFhMSHE0T2FvZjdLZ2s4clR2?=
 =?utf-8?B?QXNCYzFIcE1RZ0xxUlozcGdvRFpUREthQlhTaElEUkVtTXk2SGxPaEZDZ2Jo?=
 =?utf-8?B?MTl6eTMxL0p4RHZTSEhWMmNEZHM3NWNTb3dXRW5sL3ZCa3ByVEhOdU96UnBE?=
 =?utf-8?B?NWlpOUtML25xOGg5SmNvbWpaRVB4b1hjSHBqQlpxemx5Tm9QRmNYYjZveHBl?=
 =?utf-8?B?L2l4NmFmM3huYUpqb1pCNllHSE9EMzZxclJRMHU1WnFrckx0SHVyTmlkQ3VF?=
 =?utf-8?B?SWdRdzd2ak42d2d6MkpHelhydjJ6OGhjcGk0M2dsazd5UnBKcTk2THdaZVZZ?=
 =?utf-8?Q?NQLKIShdGrkkwHWFofUuln2uNLcYDGBBVBhnDYH?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: ff8ed8c5-a1ac-49d7-3943-08d909ed46c9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 02:28:15.1516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t+gKEpGz4CAYAnMmoTR1M9fM0QyKXS4rOE/SFoH6mLgrlKN62M+RZ2MyLIYXxtYX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5514
Received-SPF: pass client-ip=40.107.244.125; envelope-from=alxndr@bu.edu;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:Floppy" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

fdctrl_format_sector was added in
baca51faff ("updated floppy driver: formatting code, disk geometry auto detect (Jocelyn Mayer)")

The single callsite is guarded by a check:
fdctrl->data_state & FD_STATE_FORMAT

However, the only place where the FD_STATE_FORMAT flag is set (in
fdctrl_handle_format_track) is closely followed by the same flag being
unset, with no possibility to call fdctrl_format_sector in between.

This removes fdctrl_format_sector, the unncessary setting/unsetting
of the FD_STATE_FORMAT flag, and the fdctrl_handle_format_track function
(which is just a stub).

Suggested-by: Hervé Poussineau <hpoussin@reactos.org>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---

I ran through tests/qtest/fdc-test, and ran fdformat on a dummy disk -
nothing exploded, but since I don't use floppies very often, more eyes
definitely won't hurt. In particular, I'm not sure about the
fdctrl_handle_format_track delete - that function has side-effects on
both FDrive and FDCtrl, and it is certainly reachable. If deleting the
whole thing seems wrong, I'll roll-back that change, and we can just
remove the unreachable code..

 hw/block/fdc.c | 97 --------------------------------------------------
 1 file changed, 97 deletions(-)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index a825c2acba..d851d23cc0 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -657,7 +657,6 @@ enum {
 
 enum {
     FD_STATE_MULTI  = 0x01,	/* multi track flag */
-    FD_STATE_FORMAT = 0x02,	/* format flag */
 };
 
 enum {
@@ -826,7 +825,6 @@ enum {
 };
 
 #define FD_MULTI_TRACK(state) ((state) & FD_STATE_MULTI)
-#define FD_FORMAT_CMD(state) ((state) & FD_STATE_FORMAT)
 
 struct FDCtrl {
     MemoryRegion iomem;
@@ -1942,67 +1940,6 @@ static uint32_t fdctrl_read_data(FDCtrl *fdctrl)
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
@@ -2110,34 +2047,6 @@ static void fdctrl_handle_readid(FDCtrl *fdctrl, int direction)
              (NANOSECONDS_PER_SECOND / 50));
 }
 
-static void fdctrl_handle_format_track(FDCtrl *fdctrl, int direction)
-{
-    FDrive *cur_drv;
-
-    SET_CUR_DRV(fdctrl, fdctrl->fifo[1] & FD_DOR_SELMASK);
-    cur_drv = get_cur_drv(fdctrl);
-    fdctrl->data_state |= FD_STATE_FORMAT;
-    if (fdctrl->fifo[0] & 0x80)
-        fdctrl->data_state |= FD_STATE_MULTI;
-    else
-        fdctrl->data_state &= ~FD_STATE_MULTI;
-    cur_drv->bps =
-        fdctrl->fifo[2] > 7 ? 16384 : 128 << fdctrl->fifo[2];
-#if 0
-    cur_drv->last_sect =
-        cur_drv->flags & FDISK_DBL_SIDES ? fdctrl->fifo[3] :
-        fdctrl->fifo[3] / 2;
-#else
-    cur_drv->last_sect = fdctrl->fifo[3];
-#endif
-    /* TODO: implement format using DMA expected by the Bochs BIOS
-     * and Linux fdformat (read 3 bytes per sector via DMA and fill
-     * the sector with the specified fill byte
-     */
-    fdctrl->data_state &= ~FD_STATE_FORMAT;
-    fdctrl_stop_transfer(fdctrl, 0x00, 0x00, 0x00);
-}
-
 static void fdctrl_handle_specify(FDCtrl *fdctrl, int direction)
 {
     fdctrl->timer0 = (fdctrl->fifo[1] >> 4) & 0xF;
@@ -2330,7 +2239,6 @@ static const FDCtrlCommand handlers[] = {
     { FD_CMD_SEEK, 0xff, "SEEK", 2, fdctrl_handle_seek },
     { FD_CMD_SENSE_INTERRUPT_STATUS, 0xff, "SENSE INTERRUPT STATUS", 0, fdctrl_handle_sense_interrupt_status },
     { FD_CMD_RECALIBRATE, 0xff, "RECALIBRATE", 1, fdctrl_handle_recalibrate },
-    { FD_CMD_FORMAT_TRACK, 0xbf, "FORMAT TRACK", 5, fdctrl_handle_format_track },
     { FD_CMD_READ_TRACK, 0xbf, "READ TRACK", 8, fdctrl_start_transfer, FD_DIR_READ },
     { FD_CMD_RESTORE, 0xff, "RESTORE", 17, fdctrl_handle_restore }, /* part of READ DELETED DATA */
     { FD_CMD_SAVE, 0xff, "SAVE", 0, fdctrl_handle_save }, /* part of READ DELETED DATA */
@@ -2448,11 +2356,6 @@ static void fdctrl_write_data(FDCtrl *fdctrl, uint32_t value)
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
2.28.0


