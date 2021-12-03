Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E594677E2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 14:12:11 +0100 (CET)
Received: from localhost ([::1]:46150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt8ME-0004fr-DX
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 08:12:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8IL-0001be-Ql; Fri, 03 Dec 2021 08:08:11 -0500
Received: from mail-eopbgr00119.outbound.protection.outlook.com
 ([40.107.0.119]:27043 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8II-0006zE-Fy; Fri, 03 Dec 2021 08:08:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B66HXsjOl7tGr4bRoBV7R3EXNEPkhCHrFY60ZsBQwBTQRTFivpuhuIH5iRXAaGBGSEIexF46d5NQPsB5p46O0/b16CcLgzK87MJ9iTwVPFpWo26mdIpVRgX1Y8dih3NNhGFXZ8b5RkWDzYXO2dL7BJDGuc9LcLckFJVRt8Y9iLEWvZ3YxlLGMkhNHoq8nbBI9wfCM1wv5nwWmlRTKoe+aaceCrdU2NrgUKJGkDOaWDEAaOuU1nTUFQSG+VCiqNmGJlIeDR67vjQZW/P9Bpv1kcHtv69pISlytbzxB/+jZbAjGBsFpuKnCKXoIKQPvwJ8ck51vfgZznFd+zocpzTHFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrwUk6VEoVKzu1IZgvM3N1HnmBo2uJZArEcOHBdW7Bs=;
 b=lu+kQuiniLmZIZL1o+hN51CqP6MMCtNowDh0TmhwF1zKbzlC7/AFaGh+NHSntyEZcc7wCEHEpg8KeOBkYXG+SHKhpPURIWuw7ACx7kot8gH5CvFM4khDQSQZNutcGZA9Vf6Xkbu4hiheSFkF5bElU9IAOfNjBo5dGqTOnjjuM9qNDpyz39oF1Coit0Y7Et+so0wGIu2sTiuSKltZBNZ66k5pwSiLeGKpm+GzQkALW4EqTNk4KI7nnentaQQb6upT9RBNDb6I2XKd77GMAATY8L9F/SuK/FcC11UrFeBJBoeJF+UkLTsmtt6oldMTUrK9yQUriZUXYDZq2KPgYuvGtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrwUk6VEoVKzu1IZgvM3N1HnmBo2uJZArEcOHBdW7Bs=;
 b=AAy3DjjY0NekilkGYiXEsS4tlBFoYDU+kELf70e+5Uo7hFWd1mex4ikppuqQ5kB6Vafrifu/f22NeqE90SRI82EF40pzRQNAMBhfcNAHjmt0mNP1+LEvmdEFdBBBGzVFNOCRdu/2TfqGzqJ5q6TE2QRfyh5Ak+LrczvmiHG4+MM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6968.eurprd08.prod.outlook.com (2603:10a6:20b:417::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21; Fri, 3 Dec
 2021 13:08:03 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 13:08:03 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v4 00/19] iotests: support zstd
Date: Fri,  3 Dec 2021 14:07:18 +0100
Message-Id: <20211203130737.2924594-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P194CA0095.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::36) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM6P194CA0095.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 13:08:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91022ebd-580f-4e3d-c5ac-08d9b65df00f
X-MS-TrafficTypeDiagnostic: AM9PR08MB6968:
X-Microsoft-Antispam-PRVS: <AM9PR08MB696883B2E48116767096C942C16A9@AM9PR08MB6968.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:229;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5u6VjzuctX36hos1h2/pkgYRIGv3wGBBAhpLNirSR90Mz6ephwSshSccm2QdFF4zhICLUWr9vTEbcCJKC4mtgRup9/Z4UP+7o5mgs4MZhqhXhMrdzK7vvXpNvthi027dBrp6BXZL3P9HDrJOucoIc8sFosJVjuE4iKsvc/0cPtpCOot/+3ZJLS6AufZPGgDuQAp5j/Zb4rcH6Bt4A6XQQCXxpMgIUdyut3XKH13I8c7jHzNMjBS1YHaV6lxu4iLbrbGs9XdgShIYTkJN039qYTV3NV1xt6+XIo+GneCGjl4tAWrySf49yoSoIzUbppez+cFDv9L1FzlxprS68Do2QbIDIGFUU32SoIdfmOMhg9Xj2IZmS+oirQ9OMtBZIKNcnGwbDQF7XDvBRbVtJuC3lOlcEegHI1F9xmt2CEYlOBZeZgK/sQEfHJeUMVQV04QLWZyTZDfc89ZPuhusn3dFzu7LDqT63U9V5/5YtKD8xE8910h46Lg0iVqHh5aWMU+6M1CujxooZu7KlsMPkARbqU/KTwimAXQ6oX4kCHhyGkyWHdf5gHTh+srnt3j0YvGi/XWaF+/yirmS1odT7gPfFZA+ta4itisDNKYKU4FOzwQvS+NPJPouBJV7VPd7FuvCDjbpftJblqplcN3vYlQFAM7tHuXovNkONxzw8lxxb4H0P4ea8xUCyll2G+PZDPD0z9ZThFV2yD6asgXe4xOgMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(1076003)(6666004)(6486002)(8936002)(2616005)(52116002)(86362001)(316002)(6506007)(508600001)(956004)(6512007)(5660300002)(2906002)(4326008)(38350700002)(186003)(38100700002)(66556008)(66946007)(8676002)(66476007)(6916009)(83380400001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lLIUMuTZTqUTsE0cj5lfF47u4axXf3IZteYnMzzZg54pfko6lSDK9bZXNZPA?=
 =?us-ascii?Q?orWV3FIKJMMbbhjLOE9rW2ao4ZDw4/bce5m4OvkmQOCl3UzXO7xwRsxkQ6ax?=
 =?us-ascii?Q?WwW9UsBMI+dFaEDFl8jlaESOAfynYL0sxrvyxU+QiiLMG5GbFtW5J/fuh9R+?=
 =?us-ascii?Q?Hl0LTLF7TuOj6CozNAHTRQhRQIu5OCHKbyulqOKPYRq4v+64K7QI8fCiyUwL?=
 =?us-ascii?Q?Bu84+Z4pBg6TFp9cC9GUv9+A7RBBrdaLCgZiyjdTzuY0rm2x13IGrZGiplLd?=
 =?us-ascii?Q?G5sYda00A/E+4Y4qLV+1pESH64jcWi1BMkvIqBNA/KOVbIfkYOxijdO97qcV?=
 =?us-ascii?Q?6M8aCejcUqdU0V0A6mGQkHjwz6+tn19h+Ki0HjoMP52sFRFYVmfEGNimPbfb?=
 =?us-ascii?Q?RshmD20ttIDIQtGsTV2LPlZjT8hpjbDemH/e/1QW3I4VbnjI15aTN3wqbSHi?=
 =?us-ascii?Q?S05xi7vu3p/rkDV4OfwO6yVw/cDdlBf8qPrUwzWMYrmfKXNz5XfQC0Qkyu9s?=
 =?us-ascii?Q?QTkuEIpn4lr/EgaL705yiIAqbDPCsrJU5itos8N4sjvtAkn4n7x3bUj6tr9G?=
 =?us-ascii?Q?TmWm6ifDpQKjKfWxCxfK3i+HSHx9pLHkwuW0R6Pthrw0RETF6n/xHvKTlLwd?=
 =?us-ascii?Q?0+dRWIg2Mw1Ek6hihu+DsxO8D6Q6/2GC42s46X7HP+auLljDIIhGbojn72C8?=
 =?us-ascii?Q?VoEg6QnjcMgka/CgL9/f8R8EVFnw790nTB6JvduMivZF/hGRT/xBJA+GkMYC?=
 =?us-ascii?Q?RR+Fr1tMKtKUhD3rQMhvGFiOOsvqNDR/uMs6GnbfNC96sC6N6rVOPqpRm8yA?=
 =?us-ascii?Q?DZmB1JSBuiPAUXNNREBXZ8Pskg/vHgArQyyZaRrTSl0tHzzUBDC6/4Y1VzZY?=
 =?us-ascii?Q?TeBziTXNZtum7O0n8Kk7nz/2cAQy8oflkmwBOXUA1/BAiYgiWELXDk6CoELr?=
 =?us-ascii?Q?shpdZ7rAc9ENOTBNbcMLwrf+cnG+GGTGkZmUalYepBM8SM39ZcHaP/cY90jC?=
 =?us-ascii?Q?vmR9p213gO47LE9BXpaTtT1elKcr50smCBKkmWdAF4gX1csXXpd4ylS7CmI7?=
 =?us-ascii?Q?RTSQueSaDBMtIMnDLHDWgiUyYRS0rIAdJKWzeTYBrfzBib5c4cWDorJYM7n6?=
 =?us-ascii?Q?Qj9CZQtliz+BkY2oT9Dj9KkyfqPblb30uDWIyKzwfv1kTrIyV8FnN5J3WHFC?=
 =?us-ascii?Q?65wGXBHwiQF6HU1nfXc9tuQ1GfvNNpN01al24EALWrBKE0k8eUQQzQcYtEmi?=
 =?us-ascii?Q?AR+tHdTvhCNwhni0D8ZJi/WkMoc00XM4jza4g/07ZVHlhhaY/GLLnaYnQOKj?=
 =?us-ascii?Q?yeYi2W80jFu+/t3CcG9pwX6mLqk2M06ZlfQ8Vm8O2EPl84s9eTvrhkvSNMgj?=
 =?us-ascii?Q?QwjDdW87ohp8O/qDPeqCLTarWzhdGGVZVkeiZF3yO09DmMk76icveKGJ9XwC?=
 =?us-ascii?Q?DrXpWLL6m6m29/tAidNhivvnWLZRt/csZFFwbyj844qJfov3WUG9arrQZ/AF?=
 =?us-ascii?Q?ebmhQFxoHLn9//4DKFji02TfR291f/T7LoD4AjiWhjHUiaTUBZaqVB9r6bl8?=
 =?us-ascii?Q?B7gj4jQHBWZOXZGAmzMgdevkbj6cGFIkVfTCuS1nVf8YwD7lIisKuGQ+zpV7?=
 =?us-ascii?Q?nwoicum9O90m9KfV6sq6Y5V8+InUqxRa9Z/KfqpnjWlYDwvFEpJLUIeY7/oK?=
 =?us-ascii?Q?3QqUBGNCsUrPIFdnqi6t39RRG0g=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91022ebd-580f-4e3d-c5ac-08d9b65df00f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 13:08:03.1309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+qIt86vrYNzu7SnP4bUmgkC921fvZaiTlBX2VGm/pZ2CV6l5QAHNa0qbmjGTweWYmd6Gjpxxkdc15OARlO7A6OuWTeoV6oh61bSSwthTAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6968
Received-SPF: pass client-ip=40.107.0.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

These series makes tests pass with

   IMGOPTS='compression_type=zstd'

Also, python iotests start to support IMGOPTS (they didn't before).

v4: 18,19: new: add unsupported_imgopts as suggested by Hanna.

Vladimir Sementsov-Ogievskiy (19):
  iotests.py: img_info_log(): rename imgopts argument
  iotests.py: qemu_img*("create"): support
    IMGOPTS='compression_type=zstd'
  iotests: drop qemu_img_verbose() helper
  iotests.py: rewrite default luks support in qemu_img
  iotest 303: explicit compression type
  iotest 065: explicit compression type
  iotests.py: filter out successful output of qemu-img create
  iotests.py: filter compression type out
  iotest 302: use img_info_log() helper
  qcow2: simple case support for downgrading of qcow2 images with zstd
  iotests/common.rc: introduce _qcow2_dump_header helper
  iotests: massive use _qcow2_dump_header
  iotest 39: use _qcow2_dump_header
  iotests: bash tests: filter compression type
  iotests 60: more accurate set dirty bit in qcow2 header
  iotest 214: explicit compression type
  iotests: declare lack of support for compresion_type in IMGOPTS
  iotests.py: implement unsupported_imgopts
  iotests: specify some unsupported_imgopts for python iotests

 block/qcow2.c                                 | 58 ++++++++++-
 tests/qemu-iotests/031                        | 11 ++-
 tests/qemu-iotests/036                        |  6 +-
 tests/qemu-iotests/039                        | 22 ++---
 tests/qemu-iotests/044                        |  8 +-
 tests/qemu-iotests/044.out                    |  1 +
 tests/qemu-iotests/051                        |  5 +-
 tests/qemu-iotests/060                        | 22 ++---
 tests/qemu-iotests/060.out                    |  2 +-
 tests/qemu-iotests/061                        | 42 ++++----
 tests/qemu-iotests/061.out                    | 12 +--
 tests/qemu-iotests/065                        | 19 ++--
 tests/qemu-iotests/082.out                    | 14 +--
 tests/qemu-iotests/112                        |  3 +-
 tests/qemu-iotests/137                        |  2 +-
 tests/qemu-iotests/149.out                    | 21 ----
 tests/qemu-iotests/163                        |  3 +-
 tests/qemu-iotests/165                        |  3 +-
 tests/qemu-iotests/196                        |  3 +-
 tests/qemu-iotests/198.out                    |  4 +-
 tests/qemu-iotests/206.out                    | 10 +-
 tests/qemu-iotests/209                        |  7 +-
 tests/qemu-iotests/209.out                    |  2 +
 tests/qemu-iotests/210                        |  8 +-
 tests/qemu-iotests/214                        |  2 +-
 tests/qemu-iotests/237.out                    |  3 -
 tests/qemu-iotests/242                        |  3 +-
 tests/qemu-iotests/242.out                    | 10 +-
 tests/qemu-iotests/246                        |  3 +-
 tests/qemu-iotests/254                        |  3 +-
 tests/qemu-iotests/255.out                    |  4 -
 tests/qemu-iotests/260                        |  4 +-
 tests/qemu-iotests/274                        |  3 +-
 tests/qemu-iotests/274.out                    | 39 +-------
 tests/qemu-iotests/280.out                    |  1 -
 tests/qemu-iotests/281                        |  3 +-
 tests/qemu-iotests/287                        |  8 +-
 tests/qemu-iotests/290                        |  2 +-
 tests/qemu-iotests/296.out                    | 10 +-
 tests/qemu-iotests/302                        |  4 +-
 tests/qemu-iotests/302.out                    |  7 +-
 tests/qemu-iotests/303                        | 26 +++--
 tests/qemu-iotests/303.out                    | 30 +++++-
 tests/qemu-iotests/common.filter              |  8 ++
 tests/qemu-iotests/common.rc                  | 22 +++++
 tests/qemu-iotests/iotests.py                 | 99 +++++++++++++------
 .../tests/migrate-bitmaps-postcopy-test       |  3 +-
 tests/qemu-iotests/tests/migrate-bitmaps-test |  3 +-
 .../qemu-iotests/tests/migrate-during-backup  |  3 +-
 .../tests/remove-bitmap-from-backing          |  3 +-
 50 files changed, 358 insertions(+), 236 deletions(-)

-- 
2.31.1


