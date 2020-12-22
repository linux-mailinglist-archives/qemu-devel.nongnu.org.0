Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C182E1176
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 02:51:42 +0100 (CET)
Received: from localhost ([::1]:34476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krtJU-00073k-EM
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 20:51:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgreid@dylanreid.com>)
 id 1krrWH-0000pC-Ua
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 18:56:45 -0500
Received: from mail-dm6nam11olkn2099.outbound.protection.outlook.com
 ([40.92.19.99]:4736 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgreid@dylanreid.com>)
 id 1krrWE-0002Wj-7X
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 18:56:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNaSMfiOFX1bSKUwLQdvo5E0SQFFLz4gWryR/QwlUXq3TtNrOXfLVwqAjm/9GtPsDAsrxqTmuIbSSpkQGZ1oNijvtMslMK299srQhkH94ACynTk9mP79HZZ3pbtzaGDKs20DM8KvuRh6mPTqykK032bUj8/GAJhZ8bpoeJSkLnYFAL9JnibUshvGR3poFu9QaYox/hmyfRBoMKkr81qbqbRhMAcs8wbJYUT+mKqCBJ59s9PRe1gd9v9Up0TxG112xr/OH62MamwnPtMbyU6R4KUS05gLbFwOEJc9msU9TyImS2Ws1+EsEO8RgMCaXaFuEMbVOSp3NwhIDkGKe/uzJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74qPeGFTb3aEk6W25MXipI2KHCX+xLq+PmrjTnl1cMU=;
 b=NirMp+rRrgM/g3Er7yx2K+f0oWvLMPbZJhINKK6qNTt+hYfmkMUgFmR0w8Uroxb5y/mfxttuDPueYWBlnyaYyLxOvMZCLl7VoHP3vyDArhFFchZi3mK/kGJoW9Djg/dAVYnJshlX9xb3wE99ZVGwtFzndIyr1P/9Di39l28fdpIXT6njUpPMp63km+QieGfnnlNs81B8DJ5s/Zuw4Cn38QKQ9LOpriRShUhCS+qkKIFYARCNM2hWdWjkOZ83IINpG6Hur9Xt2ZrIdpMUyeqdYmkMR7ZwY6dfQuAKULT7Ldms4aS0OJHkXJWqNWHC4NRPBuaq0yEyfcO6sX85YBs0CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:fc4b::4c) by
 BN8NAM11HT169.eop-nam11.prod.protection.outlook.com (2a01:111:e400:fc4b::360)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Tue, 22 Dec
 2020 23:41:36 +0000
Received: from BYAPR08MB4648.namprd08.prod.outlook.com
 (2a01:111:e400:fc4b::52) by BN8NAM11FT032.mail.protection.outlook.com
 (2a01:111:e400:fc4b::344) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25 via Frontend
 Transport; Tue, 22 Dec 2020 23:41:36 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:54A92C2258124E7B9148912CD96C39EA2EF56FCC315A1C9086C5FA0E0775D8F2;
 UpperCasedChecksum:2A98A0DC8550B00298A594AB1ABA29100B130294E03A34B3DB729706A7921F43;
 SizeAsReceived:7305; Count:45
Received: from BYAPR08MB4648.namprd08.prod.outlook.com
 ([fe80::74f4:99e9:5170:d31f]) by BYAPR08MB4648.namprd08.prod.outlook.com
 ([fe80::74f4:99e9:5170:d31f%3]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 23:41:36 +0000
From: Dylan Reid <dgreid@dylanreid.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vhost-user: Check vhost features for CONFIGURE_MEM_SLOTS
Date: Tue, 22 Dec 2020 15:41:26 -0800
Message-ID: <BYAPR08MB464854F9582554185F3B36AFC8DF0@BYAPR08MB4648.namprd08.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [0BHOfffAD/COSw3LYlw3tkm42gSAXzML]
X-ClientProxiedBy: SJ0PR03CA0073.namprd03.prod.outlook.com
 (2603:10b6:a03:331::18) To BYAPR08MB4648.namprd08.prod.outlook.com
 (2603:10b6:a03:49::22)
X-Microsoft-Original-Message-ID: <20201222234126.366676-1-dgreid@dylanreid.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from dddc1.localdomain (73.222.83.91) by
 SJ0PR03CA0073.namprd03.prod.outlook.com (2603:10b6:a03:331::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Tue, 22 Dec 2020 23:41:35 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 20226f00-2e55-4f28-32cb-08d8a6d31efc
X-MS-TrafficTypeDiagnostic: BN8NAM11HT169:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E1/jEbZqdKtyoyya0gaPWtiCcaAgySdWo/7/GM2OpBtkeq133r3CYTX88sI3vyQZUytPGmvj33EJwJ1HxEB9lRAIL/fXYCmvIsbWZ9u9aWVsfheDftljTxFYzPYHGSfxS65o/f/Bpj7+2m4Z0xe6AOtqQBAl9fcsnCXxjbwgqAzWAA3U43iTonnm7Ktvt8X8ODwpgomVKXYeJVlO5JxcsRSMKs82Qc7Y15fqGYjEXFowkVrjZ6PL+cUhxfPXLdYq
X-MS-Exchange-AntiSpam-MessageData: JfVlVJer2qN+DlHUS9pVXAg2t9HZLOK3NIivG675dj7VtWSueu7UXBE1MEqFOHFGdpxFbS3uBOSYVo1oc/47MtwuHc2nha4l/RAriWwVX6jHNvg8M3jhKP1dLD/8h+fUh+OFIhZCoR2ntU0/KDrMBg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 23:41:35.9900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 20226f00-2e55-4f28-32cb-08d8a6d31efc
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8NAM11HT169
Received-SPF: none client-ip=40.92.19.99; envelope-from=dgreid@dylanreid.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, FORGED_SPF_HELO=1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 22 Dec 2020 20:49:09 -0500
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
Cc: Dylan Reid <dgreid@dylanreid.com>, raphael.norwitz@nutanix.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The `CONFIGURE_MEM_SLOTS` feature is specified by vhost, not by virtio.
Check the vhost flags for it being set.

I noticed this while testing a new vhost implementation that doesn't yet
support configuring memory slots and retested with dpdk's block example
as well.

Signed-off-by: Dylan Reid <dgreid@dylanreid.com>
---
 hw/virtio/vhost-user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 2fdd5daf74..faa0e133f2 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1860,7 +1860,7 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque)
         }
 
         /* get max memory regions if backend supports configurable RAM slots */
-        if (!virtio_has_feature(dev->protocol_features,
+        if (!virtio_has_feature(features,
                                 VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS)) {
             u->user->memory_slots = VHOST_MEMORY_BASELINE_NREGIONS;
         } else {
-- 
2.25.1


