Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DDA5A4703
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 12:20:40 +0200 (CEST)
Received: from localhost ([::1]:41264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSbsl-00082m-CP
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 06:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSblQ-00014W-NP; Mon, 29 Aug 2022 06:13:04 -0400
Received: from mail-eopbgr80130.outbound.protection.outlook.com
 ([40.107.8.130]:50395 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSblO-0005zs-PN; Mon, 29 Aug 2022 06:13:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ol3r4StEo3pLFFwYP0cbXvcwhbmZYOEEq/pguE3B3H6tpEs16HBVbDUy8HZSsP//1RjI682heLZlslypEwrmbp8dlX0NyILVpo+aqZOw+0XpdWm7Y+VUMDCTxUZHMCEW1TH49c5/lLFiMsj5eannN/RFPNvkr2cckeboWlAhA4M6+YTAOsTQfYrWbJNH1M3WAen9YkDPSXU512ZvgNWv2Ew2uY+pWXTmQ8UtxG3H9zrQFymiB1OA0LZxnCXYnOxALugSqy2cHDW8jIbLHZhvUL8AMeXw8WMRLXKXxhVI5gWqB/+8SQEYnbK81btcQHiH2FgmtqNgC4XddPjal8a49Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYRFUpACEhkX+bXhxRNDhGyqPDgF7Ofp2pS31i/7POo=;
 b=clE34eexSJ1MiefhYomnlek7YZdMB5JhXUayFmp/CRWReRvZaPH8z6pN+RXJmCFmMCah9HzQXdu5bsn6ITWDT/irxd69fJprYq0bUVaIHPb91r4q+nwM/nGTnkjTp5P9j/IRjgnCck06QrQSHt28LotwUjmwIAY/sNB1gGK/xTTcjGljaMOJix0j6xI/589HDtGF/GgEFz44RYdrrZBkTH9KoHHbf5MhzSFIH8BWTL0gZWHSJpIsbpwTeqjPIapYG9YidiRj1b7Htc4EB+U0H5xzzNANb7dy7gCgsNnu8WhLr4eMIHM6Pjofkxqxp3f6DphebvIbkzTFgs9lyTf9wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYRFUpACEhkX+bXhxRNDhGyqPDgF7Ofp2pS31i/7POo=;
 b=wTn8vVcrZfwDasaM50Tztk22+XMVA5UsWf5uUY/uiwc8XsZEA028s6Sr1zvLuR8d6tFTR668iWysLpRALNMK8SFvM7ViUazddeZX7EFw0RiU8ztPpvXk8xabnD0K7S5WFP5C1VjkUhzBvsADUK5bFFToOc78kOFzO+GqMa8rNwroalEbyNXPbaoBx56G7KRpkGsw2UEQvh0BgwRujg3tyZwVmhNE/3FT6tIBngBqP510j6vMIy066j9WPijwmzeT3LfQrXugEIYD1MTrcbeCf9pYRvD7uJ+GuJshD7rq0foVuTAXdhvsNNfPHZipyCkgkAC9jfhNQ8iU7DeNjnNUug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB3023.eurprd08.prod.outlook.com (2603:10a6:803:4e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 10:12:56 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 10:12:56 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v7 03/10] parallels: Fix data_end after out-of-image check
Date: Mon, 29 Aug 2022 12:12:38 +0200
Message-Id: <20220829101246.343507-4-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829101246.343507-1-alexander.ivanov@virtuozzo.com>
References: <20220829101246.343507-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::14) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d012fb92-1fa0-477f-65e9-08da89a70a49
X-MS-TrafficTypeDiagnostic: VI1PR08MB3023:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H6NdlwZcREKvMgBPaJw12E0ShyYt4Ld8ckE9wQGJbflRQ5a7kVHdqtTM5fJpav5mjL7P0H63W8QSH/BwWIEjzME3UZjk4zrsBX0noLGQ4ta+9XNkNnSATmJXraoCmhxi5nMfPqhtqPK5lTOIIir5rmHjt7NQfh7B2PIS6tLH9iw9GFC1/N5u8llofUBupSaAODAaxn3K2Dj3NfGm8pDJPf8qJnRSjv4iv+1QPU9X6ihSD8UuDZDpxGx+C5wHqG25c51SRhGaYsnimY5yOktLCIYxtH95Egd2PiF2JIv7NuuBVfdhQgEshUZY0XnqZyI97s1pkI3gKJJN4IEyKxIABVusrZi0z41TXjToBfMF+TkkKwirQOdDwWoiA8O7Mm3Ha7e8qxfTxvVWWSzhlCaSccfcrNVG8wfhtmAvfWwL2wuvMkq8EJa6w3JZxKnOF3WAVQf8sgS8KiPjhXlq6qpE9X85tkjh3RTAuRDsjritIvZJoDg9LUi2otSS9O2Pk8Win8gineFxZgT8HaZf45f5Co8PaiKKT1rcOTH6OhDn6j6mo+G92BVOo3ETNkZaQEPMGnmEZfRUZJsRDSrd8LLabCvTMiaUvkPDVCQhh+tR8CGsa6ljkv1H7kZIy2nBgbyIHmEfqXWuNc1x/dGfKMbYmWD2f3qgxEpPSav/uogpqmnGaWCCNy7KWcek2VmApumbclMw5Q/R7I0cwvmKp7vIuhwf4sNzU9GMzmhCDQGkuO5j+FbBUIiSlDJxHzmibo0xxLMlL+dmNfnDzkljPszizw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(39840400004)(346002)(136003)(376002)(83380400001)(86362001)(1076003)(186003)(2616005)(38350700002)(44832011)(38100700002)(5660300002)(36756003)(4744005)(66946007)(4326008)(8676002)(66476007)(66556008)(8936002)(2906002)(6666004)(478600001)(41300700001)(6486002)(6512007)(6506007)(52116002)(26005)(316002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OXm02D3uwOTeGati7dk8AzD+f07YW3SN8kdJ4kZ7OXysYqEdbJXgXju+Nrpv?=
 =?us-ascii?Q?4aA8ZloN4iW0l8jNro0Ww6syuUQ2zLe8W8OOuTk7+3ijd3JKckYSySm/y5vo?=
 =?us-ascii?Q?U4Chbad1rJ71/6uyci9v4Jd9zRn7uVyreBbtF7NMMG2/Vz4ebhtvGaDYCF1j?=
 =?us-ascii?Q?dAYxnvoRqJTXh31Lf4S0qFr7UhzCfAcgWA4Jjb+j88oW8Xl5CBgmBNPOCnFg?=
 =?us-ascii?Q?shVXvWxKq3TV1Q4Y7r10KUxqi5xuEz4q7nc9fzD3J/hVs5dFfvPL0zsO0QaT?=
 =?us-ascii?Q?caClNWQMii6+DxBWv2gS0x8NwwxX19yaE/7Z8+vI+jSM1YcyM1ddw23ko14m?=
 =?us-ascii?Q?Mu//KfSl92krDkzjfNyH2bfH0uZLq2gLjV+aRFkSdnuNV6edlRuCbjX2rQ/5?=
 =?us-ascii?Q?JE2QF8Uyz76SqK6Makq+LNcifY2zKNAs4uGxtTTZR8nPyrkgIVugJkeupjsX?=
 =?us-ascii?Q?1TtAO/bLvBGQkJm0tJ46S+HgtCBO0BgEfEFDrqmFTvdMnKKZ9vlNZg+e78mk?=
 =?us-ascii?Q?yXcfT7CVizgEUlvz/ZFjJ1WzmmUNKWuE856NpTr1wmdcpc5TPIzi33T0Unc2?=
 =?us-ascii?Q?9I3Rl2V6h9TZtAxkgF84l4iaAVKkKBLt+u2cEemyyJztMsmMHNNHE6pMrFGX?=
 =?us-ascii?Q?k570oYRD+KW+2JTEA8b35Oi2zxFu7nTH70cR+b/YdL1qHiIGG1xkgMzIHRIp?=
 =?us-ascii?Q?zEEhKyFbUvQu0bkN9OQiFBOgoI6GoxXio9OYXesqO1LUuXDK9zwKPJsC7GZd?=
 =?us-ascii?Q?nri9wdyGOUIrBNmT8FYab8Di9wMFamGBv9/5bn+6BkKrNmxtNn/6SLl1Rv3G?=
 =?us-ascii?Q?lr3JEIi5/XJ0/Ejk5htEHxu0bqbk5nhFGfsLnleD73oq/gteiFe1h0BVAW8p?=
 =?us-ascii?Q?R2AdSAKPR1PTK4zBIRRfyyp+FkrwRx1yGbegK3wDzVsIy4DCCQz6Zbyegbay?=
 =?us-ascii?Q?f0NJdlsIIK0d5nzNjhmoz3th/XYt6anecl9VfMCjZy9+KCxi2anJL5KO3s4m?=
 =?us-ascii?Q?Opm15goNOm9nqmvtoHV7gWoHa7wDZz8jKlQ1xTFMlBHWM3XLdHln8B6PAS82?=
 =?us-ascii?Q?i3OGUVAtpYI3SYRc8qQTea9UHeiNhxiwyREzsh+zAxG1gHWv2XKOqhRtlky0?=
 =?us-ascii?Q?eUWMR/FxlAcJr4ZvZLalsF7F6XKi6QjbEENvoQg7J9XklIaJniRJ3e8jyEn6?=
 =?us-ascii?Q?3j7g1xaCODH08KoCPMjYhtxhRGdi9NpOSzQYb4q0bB7g7Xdwgr9dsjS1oiHe?=
 =?us-ascii?Q?9RDpHlUym32xWHxlydBnq1mfxzFAwzL7T2xekb0gKRWLJrQxmsL5V5Ekr53c?=
 =?us-ascii?Q?enaSKE3f+xc0XJ6o26OMy5jIQqEZcoZjF6PEn76tzM9rrgQrNskyzOhvXCgt?=
 =?us-ascii?Q?Tb8DYJGr3KMTTTD+PfQERur3X0FKpdIyct/G2nKpZal7CBEcl2KYWggKPFT6?=
 =?us-ascii?Q?50KUPAJGXK5DkEnOaxbPosZDkusPDpBhpeLUmCRGArI+Tw0EodI099xC1R8b?=
 =?us-ascii?Q?yx9VeCiCOwhQjGPGr8v8bIaD9UBtoQaggFQw2lMxYamQKVkTDO4ewYPC4nsn?=
 =?us-ascii?Q?xZQ1Ra2DnjVw6p3iXUkb0VY5i6pi+h6e2cy9r3AwApCvabBB9g1PDVxxuaRB?=
 =?us-ascii?Q?UeaGhhl/RuvWMKGfcG96ISE=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d012fb92-1fa0-477f-65e9-08da89a70a49
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 10:12:55.2722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k0h/gTIZ2k7i3h8iDlCBlgVoEkBI07P+xsi88rC4PTvOfeT/dIppy8w/9J5dctxCd2PxBuDEvYx9zsg68XnpLxrZulhGKauctDZitM0BXdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3023
Received-SPF: pass client-ip=40.107.8.130;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Set data_end to the end of the last cluster inside the image.
In such a way we can be sure that corrupted offsets in the BAT
can't affect on the image size.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/parallels.c b/block/parallels.c
index 7e8cdbbc3a..c1ff8bb5f0 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -514,6 +514,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         }
     }
 
+    s->data_end = res->image_end_offset >> BDRV_SECTOR_BITS;
+
 out:
     qemu_co_mutex_unlock(&s->lock);
     return ret;
-- 
2.34.1


