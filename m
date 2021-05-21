Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CE238CCB6
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 19:51:43 +0200 (CEST)
Received: from localhost ([::1]:54464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk9JG-0008QG-3r
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 13:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lk9HN-0005ay-Rv; Fri, 21 May 2021 13:49:46 -0400
Received: from mail-eopbgr80131.outbound.protection.outlook.com
 ([40.107.8.131]:27182 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lk9HL-000645-5d; Fri, 21 May 2021 13:49:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eysmzSr7OqXviEGVf8QUnEgkKV5NwEX8OshtIU+AAfmg9OQnnDYthL7cQ9TvjMVLCeyHmUeBaczsRTNMggolm9nRm9NbIvxQmUcFQcRoOSyhyIOe+P1lipPFQFzsQcJ1J5XKC3T5pmX3jckU8zGdov2xwI6PamCRLDvFZhVkWdJfwYt3mmqqvXUCgWRv3YfztObND9U5RKwnXaFRKqLc2UQL62Hog5auYXFG9mlQ8zcyaueytgUg+wbWxY3yMlV7JIwbskdKE9TKB+yv2fzUyy5yd+EhFN/PhP7T/SPHmhi5pDgtQvAsQHWIqS1MK/ggZoNu1fJFbwSmC8HCJGO0TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bivdEjSYZlZ80iWxeFkCOv+P0L+q3HkuOSBCwg4+hy8=;
 b=jyHgbyTjdBdXopq408CPF9jAWS6KLWekKzWw4EZoMMB8eH0rR7xhrhXlf/lEZOYow6XcMc9iiwD0TSU7iGUE/4MuUuagbq4tjuyphLQCN9QFQ/z7X51CwrOrEkbbMzwoRN+jaN3dBRTKnrG0EupWLkmbd4RbT4MDZ6wQjwjy0GigiCAy7tf80s4ciZ/Lfg99sUfyee6iOTaUvpDC6AwZEztYzNj0bMIzQCrPPbi+YXRkkncZOTTXdTnPdLSc85C+5sGyGXmk56IUGvvmAW4gsSNdhy4mXWCyFbuKrrseYbPt0KkBplbxA/reKq86XD5vgl0zWB5TKIkXxA9sJp3ybQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bivdEjSYZlZ80iWxeFkCOv+P0L+q3HkuOSBCwg4+hy8=;
 b=ZTsW9ox7x6L3/Viri/YlMHOb9+eKf7qIRoA/zg6BGB3VQ+PY0D8/j8EcLYcYgK63WuKy66oa+uli2BhUUQJzBhLrqhyua+WcjghDTIqsTw7bMp71mzNYmNhpBSGoUBmdzucuzhXcgxNiqDQKKvYdQWVPIggAcDylr6Ql42P6epU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5911.eurprd08.prod.outlook.com (2603:10a6:20b:292::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Fri, 21 May
 2021 17:49:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.025; Fri, 21 May 2021
 17:49:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH 0/6] push backup with fleecing
Date: Fri, 21 May 2021 20:49:19 +0300
Message-Id: <20210521174925.62781-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1PR09CA0083.eurprd09.prod.outlook.com
 (2603:10a6:7:3d::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1PR09CA0083.eurprd09.prod.outlook.com (2603:10a6:7:3d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Fri, 21 May 2021 17:49:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a46245d-7d30-41ec-f8f3-08d91c80ce65
X-MS-TrafficTypeDiagnostic: AS8PR08MB5911:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5911C6DC9D6E0AA07D749314C1299@AS8PR08MB5911.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9FfaJrnbl+piIriex6cMoruKq25hfBk17XGe65z5zBUK1zODQPsH4TL6X9VPL2v/jkfMV4wD28U0P1dTUcApc2INEO+VHbqZbpooydCuGxdur2lwHZEQbh+GCpxzKBbU5K7bCWm9uKthRUcLG9PRkOTAmOnX0R8IubTiGVza6VAbiHHnGaIm1H21BgE1gvqMscRDfswAcM7AdBvSLW3OKfIpkMjTPFxp7Adp+EuzHESYhYSKeDX3FgJruSM+ZWspk9k31CyUG6i0Pd5dzVyTSgsZNVlnWC3rMiBxEFBam7wv2Rd/VH3znStJDJ62gktJ6XdRSERvMW/suwaXnSNq5iltoa/RvAhvSyGxTF7BkhO9Se67ih5arrLafQ+ma7BsXBp3pKR1EH8FEL+jbIc7KaGiPtBPCZ0t4cE4hCDQ78ZatGxEmTGxbDP7ZhGVJQUvzeBwiz/dGUtYztetlNNa2M3ndRZzOypMoIQuimmJW73REvbScqavk/b91F4RRrQpBd/HBtbvmfnKgdDM6Ua8Q6gFqEyCtOf0MuBvSh/70cCK+eJDoF5zIIIMDQQTKy4c4sZcKKAdCP63O7ApgrOVGJxt5FSEZV2EXXRQBOsPFDXS3GAal6pCzF7VaT5C76TkgqNGjFCWb7D/g4c4qbLc7I3rJwoYjBRV5tzHLok4XAZSj6oFqDzCo8DC9M+79lhb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39840400004)(6506007)(38100700002)(38350700002)(6916009)(6666004)(86362001)(52116002)(478600001)(36756003)(316002)(2616005)(956004)(4326008)(8676002)(5660300002)(1076003)(26005)(83380400001)(6512007)(8936002)(66476007)(66946007)(66556008)(186003)(2906002)(16526019)(6486002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/DTTuHtc6oGn6tTsgjNpuReIZajNRDT34sgZP4ixPStYqbPrU8DqS0F1wOLA?=
 =?us-ascii?Q?qnOPA7OiE4J2J42Wp7gb/cDJCExVA4pbaZunSPpOImbZO/Is5AH9eOVpQ5ZH?=
 =?us-ascii?Q?PMdau1+8qtRgC2w4QLvIlLe/XjUItBqWQTKjfM2dkCGuDVqmG7sSyc4QWueI?=
 =?us-ascii?Q?ewTUPaXpKU8Y7tuRtaNJoNxj5+SXEUUmk9tsOLw5jQkEXLJ3/V2xBjcZ95Uw?=
 =?us-ascii?Q?AUkD4TnUlNwkVPTFCiCrhfx5ItzzZD2qbJg+DnRAxVykrqUkf//dI7aw4Lgj?=
 =?us-ascii?Q?nrXgnZmgIXmdK3yczIXniD9R+/2R176AMY7HlTJ7IFbVqKoHt1QtJNZmJ+hW?=
 =?us-ascii?Q?3FttBugtKw17/UwceM93lwN5zBcE8Nnm6GxmgH2g5s+hqc3ju47J79KOeJs+?=
 =?us-ascii?Q?fWMybybqPrywFEIg3DMHPtJwcXerwmWmOnbXq0i12sy2nxsiKzj32B36Ql5A?=
 =?us-ascii?Q?CZQ1WiHiv92CubYU/EQyj+7+Qw0Qr69EZVgSMB8d5iJhjKT++3hzCL5P/Qdq?=
 =?us-ascii?Q?oF77pUSp5COr9xclrbYGiPW65B7oRNsN1ANNY7UThe2HDR+c352PIm+e47gX?=
 =?us-ascii?Q?zK/tcUizRMwNlVDiQVPe/PeLN3ozSiiOv0Ggas9by4SfuaMrPlqrcF/JQMWc?=
 =?us-ascii?Q?LfKwM2aUWVxkezkp3oqWeERHyifwAesMva69w+gueLorXMOqbaURQGwjyb1n?=
 =?us-ascii?Q?X4PH9xblau50NutF1SnhjgvhQi6AhvGCtxRipVMt4oCuFL/0Q6chqMa5clFu?=
 =?us-ascii?Q?vUIPNCqSolUN1TBvWtOOc7O6AsZFxg3o/pLGKMtoa7V8rTN3x7nol4N8o+fE?=
 =?us-ascii?Q?jcVXp+bx3L4oe779UldqsPhK5od4L7ljI2IotM/+uC2u60v5ymmH0D9L4736?=
 =?us-ascii?Q?wwNBqetBEPTLRI833hQcM3VvPJKqBR7Ez9eZyXN17JTbGz0JFLNpIPV2uP/S?=
 =?us-ascii?Q?gsFr682Ew4BFeB8Hubj4ijIT4eCDd326640UXlfDMe9zDptvdRwFbPohYE4D?=
 =?us-ascii?Q?Z6G+5bJHjHH/+qISnV8i3vFVqFoo7LgVU3aYlXHVETv3sNJvMW2XI2SwGCQ7?=
 =?us-ascii?Q?NQl361hj2uAiQIxctJrQmDTacAIms4MTg+5IHEp2NBLr6O9gpsoZNXD6FgtY?=
 =?us-ascii?Q?s/1KLpTCSAm1RZcfgLENS6n4aPTgoWhqhi1SbGkVjN9a7+ONG+mwfzW0L1J5?=
 =?us-ascii?Q?3nfcbP6HlS6Le2nQxfaIbm9xEJ1W1pUJkBl6UPH/5rj2a3cuzMeDWTx3c6MJ?=
 =?us-ascii?Q?sSfCXTnT5yB6omAVbZHMKsP1U4+QrPh0cJhwHB31fEvaCilrRVqyRfXoZNCd?=
 =?us-ascii?Q?2GPE/WtcIA96M/V0aNULM1y/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a46245d-7d30-41ec-f8f3-08d91c80ce65
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 17:49:39.5579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pKTm8xjYZr5MnW8gHXipvhlh8g5R3PSPZFlLdV4bO55i0c22+4Wx2bQCASZJkHF/hAEfgs0MbaXhtl3A5HIZ4ymNUe3Fd5Xxi5MIqSyilFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5911
Received-SPF: pass client-ip=40.107.8.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Hi all!

Here is push-backup with fleecing. What is it:

1. Make fleecing scheme

guest blk
  |
  |root
  v
copy-before-write filter  -------> temp qcow2
  |                                  |
  |file                              | backing
  V                                  |
active disk <-------------------------

2. Start backup job from temp qcow2 to final remote target (NBD or
   something)

Benefit in comparison with simple backup job: for remote final target
write operations are not very fast. And guest have to wait for
copy-before-write operations. With fleecing scheme target for
copy-before-write operations is local qcow2 file with faster access than
actual backup target. So, guest is less disturbed by copy-before-write
operations.

Based-on: <20210520142205.607501-1-vsementsov@virtuozzo.com>
  ([PATCH v2 00/33] block: publish backup-top filter)

Vladimir Sementsov-Ogievskiy (6):
  block/block-copy: use write-unchanged for fleecing scheme
  block/copy-before-write: require BLK_PERM_WRITE_UNCHANGED for fleecing
  block: share writes on backing child of fleecing node
  block: blk_root(): return non-const pointer
  block/backup: don't insert filter if no writers
  iotests/image-fleecing: test push backup with fleecing

 block/copy-before-write.h                   |   1 +
 include/sysemu/block-backend.h              |   2 +-
 block.c                                     |   3 +-
 block/backup.c                              |  55 ++++++++++-
 block/block-backend.c                       |   2 +-
 block/block-copy.c                          |  14 ++-
 block/copy-before-write.c                   |  48 ++++++++-
 tests/qemu-iotests/tests/image-fleecing     | 104 +++++++++++++++-----
 tests/qemu-iotests/tests/image-fleecing.out |  60 +++++++++++
 9 files changed, 252 insertions(+), 37 deletions(-)

-- 
2.29.2


