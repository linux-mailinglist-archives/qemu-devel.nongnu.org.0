Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D10F82C157E
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:16:11 +0100 (CET)
Received: from localhost ([::1]:50558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khIFu-0005b8-TK
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:16:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khICt-0003vg-Fw; Mon, 23 Nov 2020 15:13:03 -0500
Received: from mail-am6eur05on2106.outbound.protection.outlook.com
 ([40.107.22.106]:21121 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khICr-0007NS-KE; Mon, 23 Nov 2020 15:13:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+18s+I7FxT/Mb21xcAzOrlHFoFR5x1I+tXmogkHexb7HKX41B7Kwmj091OXoc0ohh8mD44F6tyWqsKKi1UrKanmzeDeEy9ebv5FU3VsVUVVDy1sy9S/k8XfP166t7Z5LXB3Ps7C0tk28Mr9QgoNVjoS41vCSDMyynyuiq7z8vSe9KaETIm0SuKKy28f9xw7lPLZOSIC/VhEiR22/Upu3BFMi7dE+o6rh2JAFyD26ohXxc9gEHkEbov3MuqNKdtbPNDmLdAHMilgdv56JwbETF2tR2mcHZvBh0IBGGvm3ZWgzE6KL3Q3frb7b0U67Vzq1hv95AHHAMif/U2oNzehYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhvF4ktTDTUOtmlo8SyG3lrw7VrpYcNC4hi6c834yOE=;
 b=JvSHPl79pTzIw7UxP3MGviO5oUiwQvxTduS9qB1oDLoxoq/gifpOq4PweUKVsZIK+RbSsa9eBWULW/vsywYo7JzkU8uVH7aV5Nsiduug9OBEqV6setHR5DEi4EYUecSoh17KHmp44BsXCVLQn0O57LQA3g9ip1KYDokf8P19TZow9FrmwhodWUIKOXkHFsbQ5r09tEiRI3thvI7aIfNr29V4Egogr7/JYkAM/sbzIddJJKl6bEYA7wvg2IyfNzAN5f2SePMmAAq/EEGPMMuzqr8TPQBIu1/CaqexXFuZCc84/OLv+R+iQ9XB5URcoeEGI59D7+aHq/2SG22jgRsp2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhvF4ktTDTUOtmlo8SyG3lrw7VrpYcNC4hi6c834yOE=;
 b=jPE5TF17tRN/1HmVhpBG13Iq/2dUeQmzDxlXC9wpnLCqC8tRV12wBZReufDj3DFPZ/7GZ4Hh+r4tO9pan6hVqIo8EoCc4S+EIGHF+jrvoqdDd+0Oxy7ZOkhjFMF7fGy1uR81aIO9qn16vMIGftb85DOru7yoWdmS6e6nr1ZXWx4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4690.eurprd08.prod.outlook.com (2603:10a6:20b:cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:12:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:12:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH 2/2] block: assert that permission commit sets same permissions
Date: Mon, 23 Nov 2020 23:12:13 +0300
Message-Id: <20201123201233.9534-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201123201233.9534-1-vsementsov@virtuozzo.com>
References: <20201123201233.9534-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.115]
X-ClientProxiedBy: AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.115) by
 AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.21 via Frontend Transport; Mon, 23 Nov 2020 20:12:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f60617d3-041f-4b99-8b26-08d88fec2764
X-MS-TrafficTypeDiagnostic: AM6PR08MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4690533F9707E22AC9AB4CB3C1FC0@AM6PR08MB4690.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:165;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sjZ9L0zUVEQNyKpCKa6jU476D58b5GdGVUDlNdJAoMGsajS/snncK03+OZLs9qkbh5mluivkVg/xDcBsCxXXZu1LlTzfmQh/wGwgheDt8fN1iwqleghH10JEwjSSXJS4fKBW91jEqiF+9QZn1p2+LJ5bHEOSsw4rmJOlcGE/QUNWPuFgkazNNBNQq48ZZ0F1dv/ikwAA14GD8rzBuFrlwb9tUUgR8f9Qvak+Ryf5bOzeMf9ZXcNRghMYhsyYRb5dTastk02TDPasGRAN9BYOSNxDG8gmuaRyiT/J3j2aVtrGtW54F8juYDsxxgSHYHrP6oI/ALJrLepIr9yIH5oKqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39830400003)(376002)(366004)(5660300002)(6512007)(6666004)(1076003)(52116002)(6486002)(16526019)(26005)(83380400001)(186003)(6506007)(86362001)(2906002)(6916009)(4326008)(8936002)(66946007)(478600001)(107886003)(66556008)(8676002)(956004)(2616005)(316002)(36756003)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: gs5YpFHFxkjeCXkLtXwb/I2yZW7bjmF8Sm8kKfaDkiXrevnPMVm//q4aaTWWE0p3t+4nLbrs9FAS27Swq9Br+P8ZvILNTNHmRNyUnLNeCrM5XEG/QiFORv/XUsJsvHT90IWVTp6oDW61Sb8PTZHXkUY4ZVJwKKhJvOmN5i4IZHAs9EeUc6oiApJNiDJJYXdE/BzIz2HnMRPoLqeJ24mlJdSYiPjaVbq+fefZ0umtst/Ew/ySq+2wz3eiXuvmsHlra075z1YSGUgTarwUx7Nt5W8ofmNjyN+wCytLotSce7fYNdOZJh3ehc4BHdMdDOaUfebVSUiKsBO3h5vl9BWYsKn9l51NaajSbxsWhk6UCFIebzo5pWkCHGPRQINHgciA8dllLt9cr3Qf69ierGL1cG97gZyrUzZB5qQxmEX98AcpA/tjyoHn1cJP8G7bIzB+xOlsCWtYOzR56dqkYmiN9ozAMz6AM4+coY2rTFAWe78k2XQCCNXOoaC4VwWVgm/Ry6n8odwZz97xbeJUraNjcCRojVW4TaDdA3NyBIvwlOpD4zWVIBa3DszA3oOeLzVGyXmN+3O0SgvQw9Bv29F2dcSR52KSSl/wrysq/gj8t7jpbW4wJGXCVTZLjK33Ho8DU7ZwkXcViZ7lOiFetQQW8LtiMn0UJwNX+Tj0htY0EPFcnFWSuh8H88Vws8XaN+xyIPNOsm4nhVMYDQjqxqijRt2CJ2AQs5XIe198SUHFDmm9e04/rOOwMb43cmMxC7+7mf78WkuRPlptr9YQHieJITbGd2yPDzKI43vEcymBVxNBF1sh0GQ8+T3DsKH2BJ/Hcb/PuETfnMHi5BSvGknTjYu0dxImbFqdhW+Ye957spEbs7UPSmyqk271igZ5EQ+uljuVSzoEZ7zz8ucqpmFHRw==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f60617d3-041f-4b99-8b26-08d88fec2764
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:12:51.1657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DX8+1E6f4W2GBIp0TPLtdwGPk6upP++ahxBV+vzu7zIkZSCDUO/kEngJshv2gbGMhLE1bgjmVGcUaJC0yL+roBF+lHnuAwtW68IMTAkkQtg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4690
Received-SPF: pass client-ip=40.107.22.106;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On permission update commit we must set same permissions as on _check_.
Let's add assertions. Next step may be to drop permission parameters
from _set_.

Note that prior to previous commit, fixing bdrv_drop_intermediate(),
new assertion in bdrv_child_set_perm() crashes on iotests 30 and 40.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index bd9f4e534b..0f4da59a6c 100644
--- a/block.c
+++ b/block.c
@@ -2105,9 +2105,10 @@ static void bdrv_abort_perm_update(BlockDriverState *bs)
     }
 }
 
-static void bdrv_set_perm(BlockDriverState *bs, uint64_t cumulative_perms,
-                          uint64_t cumulative_shared_perms)
+static void bdrv_set_perm(BlockDriverState *bs, uint64_t _cumulative_perms,
+                          uint64_t _cumulative_shared_perms)
 {
+    uint64_t cumulative_perms, cumulative_shared_perms;
     BlockDriver *drv = bs->drv;
     BdrvChild *c;
 
@@ -2115,6 +2116,10 @@ static void bdrv_set_perm(BlockDriverState *bs, uint64_t cumulative_perms,
         return;
     }
 
+    bdrv_get_cumulative_perm(bs, &cumulative_perms, &cumulative_shared_perms);
+    assert(_cumulative_perms == cumulative_perms);
+    assert(_cumulative_shared_perms == cumulative_shared_perms);
+
     /* Update this node */
     if (drv->bdrv_set_perm) {
         drv->bdrv_set_perm(bs, cumulative_perms, cumulative_shared_perms);
@@ -2301,6 +2306,8 @@ static void bdrv_child_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared)
 
     c->has_backup_perm = false;
 
+    assert(c->perm == perm);
+    assert(c->shared_perm == shared);
     c->perm = perm;
     c->shared_perm = shared;
 
-- 
2.21.3


