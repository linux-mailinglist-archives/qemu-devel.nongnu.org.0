Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDF12CE197
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 23:29:15 +0100 (CET)
Received: from localhost ([::1]:58722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkx69-0005Ok-M5
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 17:29:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kkx4Y-0003w7-SV; Thu, 03 Dec 2020 17:27:34 -0500
Received: from mail-eopbgr140112.outbound.protection.outlook.com
 ([40.107.14.112]:63621 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kkx4W-0000Cm-37; Thu, 03 Dec 2020 17:27:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qkz+fRDSH6Ih+yiyr6lr2fm28avNPs4vUUCSuYMKXWB0IEyu1jOTwe79Um8GLJwwcoIKGONYxw/XMiUhwGX/Ch5meb3FodN2SKtvgEXAr6WlMtPtW60fLW2+TkCkh4Yr9mpCBDinSrjb8NBbdmiC98Gkgr8U01CLVdMI/BmTh8T5Yx/1C1747lphEILacq2SHu9XazWHxvGWT+P5gwuq/QccxY5erYMGY0Y2gyfD9X36RLHoLzf4EADUpUvIBc6rmviiXxMECPTnmmI4wfN/KWp4RjJblkiysIB3WxRzHVlv3cCEibQ1NbzS01o8RBhbad8ofv/oYexwnoFD/d1jVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HiMBJhFcbitvowQbVWC+yIOGmfoM9tbvLND5PqrlYvY=;
 b=V/FJFpNfrx0ZH4lm+oW9Nfw8kGd1IiiO9XMF6+8Y7u0gkhPITXnJSjvYBZ7d5feVrUwNvdAHfFXLrzL1D4l98GOeWSg77Rv2F5K0pGE4zXPSAeRQmNEMceJRJQqynv0RlFcTnDdrLrRG/RCgxThOhqPQgR9co/ePljr6EM8ujFzcRMBoRLdJBZAD1ovRnmsNfypIRcURYlgjP3NRLd3hM/N/MdruQUx9UjeF8hlAOtA90kAdAw7+a/zjaGphF3UftRajPYnNEKSaZnztZE286OZXUbP1D8GF6sGe5bEd5rX/0AvimNq2uG2nR/NEz4nRPDpcnu8B+HEjj4w3GLgPKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HiMBJhFcbitvowQbVWC+yIOGmfoM9tbvLND5PqrlYvY=;
 b=iibRyazNjlphuwDdgmiJtDEOaHvn7AR+9nVYHEACMDk5sQNsDNZiZ7DVNFvNHZeyIzX4AYMhMkrsK83sftoTxVf+OsMpTDux9Zs6bpHfDLFk8O0sqwzAHboWHm0kai/Dl1wjzBH2MNoKORjRFUtfM2sPolKMfzN6BFUkzOH3SSE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5446.eurprd08.prod.outlook.com (2603:10a6:20b:107::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.20; Thu, 3 Dec
 2020 22:27:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3632.020; Thu, 3 Dec 2020
 22:27:28 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, eblake@redhat.com, berto@igalia.com,
 den@openvz.org, vsementsov@virtuozzo.com
Subject: [PATCH 0/4] block: prepare for 64bit
Date: Fri,  4 Dec 2020 01:27:09 +0300
Message-Id: <20201203222713.13507-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR07CA0036.eurprd07.prod.outlook.com
 (2603:10a6:205:1::49) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM4PR07CA0036.eurprd07.prod.outlook.com (2603:10a6:205:1::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.7 via Frontend Transport; Thu, 3 Dec 2020 22:27:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ec3c1d6-e50e-4906-f893-08d897da9de2
X-MS-TrafficTypeDiagnostic: AM7PR08MB5446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5446417250B0A113129577EAC1F20@AM7PR08MB5446.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ebm6FDaeyj1BT01cWnBH0nP8jbSqmm34XcStcCHzIHlhbApMe6ddh+rngGYCsmIdRu5/nR9L/Szwlfap5fBFrXDLawNIKR7eex+8LbKqAYavNwz6c0fb7ZyXWNxAtR/7LMA7Ro4HrxrK/GAqqUlq+yp5LRc6OomrUFsAcbMQTlXpUcrwyDafH6jvZTTf/rP28/o6RmBaQK1Sms71hdKsFU/d0I3whWW3DyqcNxMtCfNPJVIvRVbT2WvG51WkwdlUSGL1Yt5ivQrbQY1XAl1SxF8HPxp+glwhbx+dgmMmdb1rRABQCJY3lQtfV7J7dQnu/6yub1ZhJx/XMITehay0Pw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39840400004)(396003)(366004)(136003)(4326008)(2906002)(8936002)(6916009)(2616005)(36756003)(5660300002)(52116002)(6486002)(478600001)(66946007)(66556008)(66476007)(83380400001)(86362001)(1076003)(8676002)(6512007)(316002)(6506007)(6666004)(956004)(4744005)(26005)(186003)(16526019)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?unDqgde72hSUm6JAyPzy0xl3upagCg4BOftk3VRCISRTwwHYmKGr7t3TB6Wy?=
 =?us-ascii?Q?kNFVr1IS9IP7JcCvLo3jGcsMHggBUi0+7Au4kQXc1JGYzcVwXGwBtGQDfMl6?=
 =?us-ascii?Q?QpZ3W3oNBL+ZvA2XTtDdttWj2D3NreiEdjUWPEbLeL3g2/gvIjCTNAMNMTKw?=
 =?us-ascii?Q?+2xokD/XWAeKTofvhNxsQqxOUZpdMvJgNEL64O+koHOjIXy1LsA/IK5eFCAH?=
 =?us-ascii?Q?9fIFyQ9PhCcqXRiTF/Pq8vY90EoZyT+GA1qUSNfvzdZGt3vAaUFPDRvu73eW?=
 =?us-ascii?Q?HrMYY9q4Zq3fHee2Bzs4weudDjSl/yJt5RrL79tP5pMRlq05kOjKAvPi40XD?=
 =?us-ascii?Q?aQko2gEB5Msmn1exbKf/inGQCZJSnhFHkVpt13eCFja1sRVI0oBx/dYOylZL?=
 =?us-ascii?Q?AYVH5SR0bjiooZkAPRcDGHJyuQuCWBkOw22xpSn53OBI9JoarWH0esykaR7A?=
 =?us-ascii?Q?C4FNZF82aiQr5QCvezQdEa4U70i2mUmgtIuIyEeW5cXDj70a8KskYvZ+xtTw?=
 =?us-ascii?Q?o1A6e/D3sHOaIEGQvkZIBnHUaDChXtsBZycUOnlRfxcIbDzNe49Ipr4expky?=
 =?us-ascii?Q?5Gzg7HCsfuGKJCCRCTF9HRGFES0UVSaRz+kx+p2v6d6BRV6iBCtGIDGeESBo?=
 =?us-ascii?Q?KkGDqgzM+K9Fy/4Jh5Ryr1qssloTq+fMmmwY0YgN7J3FZfZ2WTA/lyl/s4pT?=
 =?us-ascii?Q?ll+wuFlrSReUsUfTZSDfyDYpzacmy2vuQBZuqkPCIRZIeKsd+df9+sT/Nkn9?=
 =?us-ascii?Q?kqMJvM68PSnJZai24DkZVnkDNxoikqZsAJJbyoYWHIwQ2xdH8M4dy8S2mv8j?=
 =?us-ascii?Q?R/5l3rQraLNvmnwIkXg+hqU5dY/QAOp3u+Iip76RcwA1nc3exAnxgk1TMe92?=
 =?us-ascii?Q?jq6LrbiuxmyLH8cenl8f08cgd6tY9d2ZD+/ixXugxQBnPAdnDg2I8GsYRCv0?=
 =?us-ascii?Q?onKskeJEZWw2pK6p1FloaPsgT+ry4ADe/A9MgjS+J3CMlImAjFVOrHj2otzi?=
 =?us-ascii?Q?BzPy?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec3c1d6-e50e-4906-f893-08d897da9de2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 22:27:28.2498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PtSPZlw3DaSSbOQUkYRzzgAlX8umBttDl30G8lyAAlbpXcOvpqY0X26U42EB0xjufpY/EkLgRZcvhTQ+2aVxaydHLmkXSUrBR5i0zq4JuZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5446
Received-SPF: pass client-ip=40.107.14.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi all!

This is a preparation series for v4 of "[PATCH v3 00/17] 64bit
block-layer".

The whole thing is in 04, and 01-03 are small preparations.

Vladimir Sementsov-Ogievskiy (4):
  block/file-posix: fix workaround in raw_do_pwrite_zeroes()
  block/io: bdrv_refresh_limits(): use ERRP_GUARD
  block/io: bdrv_check_byte_request(): drop bdrv_is_inserted()
  block: introduce BDRV_MAX_LENGTH

 include/block/block.h        | 10 ++++++
 include/block/block_int.h    |  8 +++++
 block.c                      | 17 ++++++++-
 block/file-posix.c           |  7 ++--
 block/io.c                   | 69 ++++++++++++++++++++++++++----------
 tests/test-write-threshold.c |  4 +++
 tests/qemu-iotests/206       |  2 +-
 tests/qemu-iotests/206.out   |  6 ++++
 8 files changed, 98 insertions(+), 25 deletions(-)

-- 
2.21.3


