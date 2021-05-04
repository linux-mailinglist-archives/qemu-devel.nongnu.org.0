Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8CE372851
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 11:52:57 +0200 (CEST)
Received: from localhost ([::1]:49760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldrjc-00053Z-Am
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 05:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldrhK-0003tH-UZ; Tue, 04 May 2021 05:50:37 -0400
Received: from mail-vi1eur05on2070e.outbound.protection.outlook.com
 ([2a01:111:f400:7d00::70e]:63873
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldrhH-0004Fw-Db; Tue, 04 May 2021 05:50:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LegvY+EPsM5k5IgUtvcPZ7xKkzRvFKsT3w7Fr15LMCPG8aIh0kk7cEaX79+GPJvhxHgccorWEOMvnmGf8MPxMdHqOYHfzJCJKbS5QqwNPDmcgYmkNt72i2pLIFIaKwFwq8SGtoXIOTPv4x1Io7xk9uhRlKQ5juU0TJy36ty+MBmytBJW8pcJn4r8cCEnxBl3LGg6qsAye7DALK1KG2dsy94OX2QWKKMK6AkvCZHwHTu49a8faLFcG5+i3eNHi9gEOqi6w9UJTcgeZHXyPnlDkM5LaIAlbVmHtrqx3JpPqwYdqkPFlOxb4rR4jajSQsQLNMUc13MZdEZAe2lwDFUlXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1wHZM+oqp/gEqbsTANFztNXduX2ab3if6rbsNeKCuM=;
 b=n5RbHhfQPdPN711uxYiD0BBsiHhNV5+IcYi5B58hjCVaOr01QTA4iuxp8tq1Oq84jpsrxoSbG3jSmDX3VnphbLXlb6e2ErAOoQ5XDQXBIO3auT6SJYv91uf1RANuCoze8UlPL3xjt+3U0AxnBVd3ZLKMkp0mgNFJD1P8jYozO1uz17UKKikajKH0uQUSXZChrHD8DZ1X8dwTSooOwnLx7kVQ9jSGU1Dwxr6y6OLA/iShPiCs0jLfkrH3CK6NIhjY8lDCUTRKkIj6X80jCO0UbIWRjezAUuML2FartcmtyeJkLlYFaPNzKz6UpIUkEVhvYoDhN9hvGZXj0bcf8i94pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1wHZM+oqp/gEqbsTANFztNXduX2ab3if6rbsNeKCuM=;
 b=VzU7qu4Ucls0C+jaDIDqqobyBwPX4kJKw8rt6v4efML5xE61u2xyR0qmKh6PT+VsemHLT5iPDlTdXAJV7tprCZpbBIGG+vvBQF4zgGIiwtRmfm7P8YZKEsu7YTTCOtK9PrECxuAy3ze0SihjlGJI5PVbPneGdGxmVIurU+obBV8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6152.eurprd08.prod.outlook.com (2603:10a6:20b:298::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Tue, 4 May
 2021 09:45:24 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 09:45:24 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, berto@igalia.com
Subject: [PATCH v2 0/5] block permission updated follow-up
Date: Tue,  4 May 2021 12:45:05 +0300
Message-Id: <20210504094510.25032-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR02CA0107.eurprd02.prod.outlook.com
 (2603:10a6:7:29::36) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR02CA0107.eurprd02.prod.outlook.com (2603:10a6:7:29::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Tue, 4 May 2021 09:45:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24036462-369a-4603-25b6-08d90ee15751
X-MS-TrafficTypeDiagnostic: AS8PR08MB6152:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6152AAD6F3B0B8B6F3635077C15A9@AS8PR08MB6152.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CbMy1a5QE7SfvWd70GZRHqqCtgT2H0OaHqZqFEcF9Di7+9v3IUYGya1zZTiW1hP3XbrgkzGP4Uo5Wv7MFK6maMKPETEGzjJysFMfWUvc7Ope9A9Evjl++T4YnHHXc0Pq1w6B10uolX/G4hrIdBIBMk+mJoSGD/qSjzZktH79KfHvIcHrYv5CIttQu0rpdP3sfnzeTIdN2yHy1SaJVSJ4579JWpbA5OSNitxmIrlLh7cEU5/3ddTzbLDPHzNutOHSfhmTwnk5xZyRoH6QBXUrpBwVvkQccn6/6DU4jt3GwsjXjZS1KmTCRge2+R8+KcfOfzwM7lPhBdzqAcAm6bBrenfvU5SfcTuw43evM6GeQW5dZGdSizMIAN8gtB4PB71VY+QThPndDKJvG59R/FDuNdZPydtrejN4xOYD7UtcaOM2pO92iwKZ5rXEs2vE2h/AuTGdO9bWdh95R0uBcSJ+gwWV+AA0U8c3pTw5MGBD/kuvXepfn+gNY29bvk+ARSDbvttPMYvO1ktg5v9FTPq6a+P6nWwm4fNKt7P72T0JhR2E3SfxX4lQGEwvdRSVFuG8Yz5zLDTINvRWXREv8uuKxvqsUKWbA7ZUZGpvH7wkYAfONX6q3Iyqs+8oJv5Ep9GkB6b8UQAUu6P+ArhDrVdJ8s3QpYKx7WmhKscnOI2jmI186oaeLMHQ09s34z1T2KGP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(376002)(396003)(366004)(136003)(6512007)(52116002)(2616005)(4326008)(8936002)(2906002)(86362001)(6506007)(4744005)(5660300002)(6486002)(38100700002)(38350700002)(15650500001)(316002)(956004)(478600001)(16526019)(186003)(6916009)(8676002)(1076003)(66556008)(6666004)(66476007)(66946007)(83380400001)(36756003)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wPdUkB/pFT1Mc5ULRHxo3+15OgrKpMmiBJWOEYijAh4sXfmlJGZj2vlCPGbY?=
 =?us-ascii?Q?8b8XWJY1kDm/SL7FRD4IJMMZMnrl0l5guwYbE29Z4+a/juhrqRFpzDC3Mt/M?=
 =?us-ascii?Q?Lv+70a3LWkIFMA2Js2+cPRAaE0OW4s90vfEhT5l2JCo7SSHGyqcydE1+btrE?=
 =?us-ascii?Q?Xb3QpnUuRCmJwFr3+3fQciQSdYk5Vl04le4d6xbHO6NdvyAyvgN1q/mx7Kky?=
 =?us-ascii?Q?v4Q3r7jIfhThQU81aKe17VZOMoX4Viwzmau//OaqbVmCb0BA7M8AAsyTSMZP?=
 =?us-ascii?Q?WwTnbxpvbyMfkO6Q22pbbZ8RucOZkMvS3OA6EsLtMFjy3ZnTcf1yoyyh/2pB?=
 =?us-ascii?Q?e3FARetTIFdGpRIuvx9fs9UGPIl3POGUr0c6Gvmnv/v5MsArW16v7UARRO+R?=
 =?us-ascii?Q?AfB4r4SzN+PwOKof0tmCkgHTKPb8NXsh2MbZOcy2PEiIEbWfZV8NUDW+y5jP?=
 =?us-ascii?Q?IcS9NMtz55BlDHrLXFp+cSwUo55xDrp0L5NVoeVwx0+zzhK9LCZhbGByaFQF?=
 =?us-ascii?Q?pAGc0QReaFXHKGhHOq9P+czPnq628h3axLPRtAKxXup1i6OjHGoIr5CR3acE?=
 =?us-ascii?Q?NeV4nJNm8p8pROVnoawnkMFPtm1V4v9MOzfuthqldb2DpQ/+bw9CJeY0nnUY?=
 =?us-ascii?Q?U0H3jFsTyBslUKeB+6uoAZoaeFQjQXjg8bqfhvtqyAHIgU7jrD79ONicOG8I?=
 =?us-ascii?Q?gRyTP++YXmm1GnszdNkz1L9r1GoxXHaRyR1/6m6mhtJBRzMPi+vCMrQKIw4F?=
 =?us-ascii?Q?hXGNEsp28zQMk5ecnicDFQKJmWyloqCorg5wrqZgWD6OHq3DCiFnimEUPIF5?=
 =?us-ascii?Q?8YPXQNvZ/XlL8yHCaSIkUMgZ3zklrCPFwrGEALppVnzegikWk6albTaLKGBX?=
 =?us-ascii?Q?R4QiRg891QtOosHBcfXHyh7cApeBY5lpVo4Jzf5HxWuy8/1FXQddFLQ6qZTU?=
 =?us-ascii?Q?6+X6h58ncpKvuBIG/D2x+MGc6HWfpB5LW9pjkXPQKKlg8aiAYv4ksnKQMPZI?=
 =?us-ascii?Q?uHGEk6qc+h4/o/P/M+MpEcu/OilqIIarHLkhlxMjL3Cb6NC5tJsix3+x5hSW?=
 =?us-ascii?Q?rnc121iGGEWbu5vidSYJbrimeUtCJsIFZSQRDWZ+CzeEEYBYfm5rQf6j1jHH?=
 =?us-ascii?Q?okqsVZi+W0o8YQ3+wDMcosGi1A+ldK/7rreg5GL9Yw82F/kgkbo0JtRDoo55?=
 =?us-ascii?Q?oNpAvYB0lrnXhsCYeU6/qCM/0iwbrD3L5Q+yRKQa6rSMi8hyJiDhjK7n547Z?=
 =?us-ascii?Q?zPrkvO2u4XvlDGPNX6IiYxPqQ+0BLdVxiGvzdD5XorEXf7WMH95HnoDEk2os?=
 =?us-ascii?Q?o95vOX17uCZ8LEeYE25r4Iju?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24036462-369a-4603-25b6-08d90ee15751
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 09:45:24.7182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIOuIWB058njnCRFzj7OT+Bx9mAuE+sBF3p51ZUWyR5uBNmCNDhBWy4MrCeucZCaSt7tWR3izEGdQARVR/lIRvtOd/OuSVaZestLdEO4P3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6152
Received-SPF: pass client-ip=2a01:111:f400:7d00::70e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_PASS=-0.001,
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

v2: rebased on Kevin's "[PATCH 0/2] block: Fix Transaction leaks"
1: add assertions and drop extra declaration
2: add Alberto's r-b
3: improve commit message

Based-on: <20210503110555.24001-1-kwolf@redhat.com>

Vladimir Sementsov-Ogievskiy (5):
  block: document child argument of bdrv_attach_child_common()
  block-backend: improve blk_root_get_parent_desc()
  block: improve bdrv_child_get_parent_desc()
  block: simplify bdrv_child_user_desc()
  block: improve permission conflict error message

 block.c                               | 61 +++++++++++++++++----------
 block/block-backend.c                 |  9 ++--
 tests/qemu-iotests/283.out            |  2 +-
 tests/qemu-iotests/307.out            |  2 +-
 tests/qemu-iotests/tests/qsd-jobs.out |  2 +-
 5 files changed, 46 insertions(+), 30 deletions(-)

-- 
2.29.2


