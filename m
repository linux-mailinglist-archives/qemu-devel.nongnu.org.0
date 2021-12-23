Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6C747E629
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 17:09:19 +0100 (CET)
Received: from localhost ([::1]:56654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Qec-0005Yk-Ss
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 11:09:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXd-00050H-3d; Thu, 23 Dec 2021 11:02:05 -0500
Received: from mail-eopbgr150124.outbound.protection.outlook.com
 ([40.107.15.124]:2176 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXX-0005Js-AW; Thu, 23 Dec 2021 11:02:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PfGTzmOE8osx7nNg6xmMZU1XNhhqfn/ZpfXvVIlxaFjV9AN2c9J2dsTs+0+WZOJtTaJeQzTTqjqIFMwumEBZgPGa/RMIeMUpDdYj3+VaZxzMV2bcO5tmWxr/iLOLMQMNDw1fMLh5XBrjqDofdZ3kIUzflDq4byJ4RvAo16tcHizl/rGEG+ksiCgMsRTuT8Nkarw7duNbG5+9LB7E86CyGtTILveRrVQFUqRm3jW9pMZPb9XND9lFAcLJs2JxiRKfXE2v/Mej6Uyd67oem0NOUeVy9BJwP2zDkXrf6C0lphs11Bu+EVkOaFrEwxFu2YFw7fFml2EO5li7JHzlc/hs8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iviHaxCeICNDXvQoQp+62QeEV4OLkWgof7Mu68h0hio=;
 b=T6G3eBTaD3OJ9CUYE//i9maJycRjQRrvS1FrgUzarh6H3ofyId2OWhztrFlpVAH0v0+0wa57VG9t5GV62nUOoLc0rTRhhN6EBBqsxfyitaTObKTNlvriS3L9g6lLgFor/HkXdveAdXWwTPYp6Lrkpi7tAJnATTbQNWHVzL7uuRiw2LawPgz8eKyCY44ObW+vtdPRa9QzkkiOGkI0iN8XK0uTw5ALBhDfU8YXIX00Ow5p9t2XG6xOe2L2PeZesMy9q1KOanO8lC/Py7MHoTn/DGiD0JeFxujFwteUKfqVDmLbGt6JvrPazudsEp7cUlva3JmmFuJ4K0xNCRVrRyUnBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iviHaxCeICNDXvQoQp+62QeEV4OLkWgof7Mu68h0hio=;
 b=Nl0s14m1Rk52LjXSKIPfrnA9L2uvMSdfjatqn2jS7AAxMQDJkMGQcJnRgbfGhdQB6UH1Hz0HN/95nZ8Ons6DcLPGvAjTFgJqcqbjeqb1S0+FdIAZHSnrfQnNaGkuUk79ze73vm4XhXoFwEP5JNzAA6pARlZRyTFv7fOB/VVttKg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6148.eurprd08.prod.outlook.com (2603:10a6:20b:284::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 16:01:54 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 16:01:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v5 00/19] iotests: support zstd
Date: Thu, 23 Dec 2021 17:01:25 +0100
Message-Id: <20211223160144.1097696-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR0301CA0001.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::8) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6d2a09b-0aab-429d-e19a-08d9c62d89fc
X-MS-TrafficTypeDiagnostic: AM9PR08MB6148:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB6148AD1C2DDC7ABA91176DF4C17E9@AM9PR08MB6148.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A2TwRfn/F2Dufd+u1sPoA/sXSwhm75hU3FlB9nE1S+uoBFLv0U0hIMOwvJPNt3f6cA6Wb1Y0sEJCOZY3gkdjFIEdV4tAyNuTmwpNjGxRWuEybHZl8PP22/79KgToPukopx0n+i5giHAU3Q4h37S+31M39B6Iq6uDzfj508PPH3F+8f8G+6xz8/QloR07ulrlvpI6/tJitnnjRRcHm0cfhl4u3+jOvHtSWJ8udVEpNtOAi5CnInx1tO9sb4q1ysU+osom7ddieC07NV0htPw486YkXy+9DP5lvGxOFK63+whrfz+02JuQHMUYBzh/9mycra+zUXFWPtuBYQ1nKL9g3cNmX1BQiG/g/UJr7QTBQkpVyYT2CckyujgAxoP4dsD6uJm7Z7AY/KAxO9km6SBLTuTRI1/awPy4B1VABYIcAkZUtsi5D6ZirT2mHG/0KEDikLMq0zQJzAlJxmaQXPn281/wEZiBJRL6KuJ3imApiDOT7aOyJ5JUrzefN+tb0kvma4JkiEEu130j32gkClSM8kBwZZV4nBAcoj7soazG16JLrP08Vjc0I+m7iw/FPj3naypx9oITb12LK7D2PDR5g7/Uke8uXCSv34kWQ5fSlwzSKAZGtTqaKBkWEJxmWCue3WvusvZtFeAYSlHpLlz5ljsY+bk02STDxxQsj38oVprNR+1X68fqrPH0ZsBYBLG2id2+ZxDVG02LWBOrmRNGdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(5660300002)(8936002)(508600001)(38100700002)(66946007)(316002)(38350700002)(66476007)(66556008)(1076003)(2906002)(4326008)(6666004)(83380400001)(6506007)(2616005)(6916009)(26005)(6486002)(6512007)(86362001)(8676002)(52116002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SGumTMNTHhQId6lpjsFqsUyTeIZyqayBn0c+4eo4bcAJu3VabZ1ilPQGkhNG?=
 =?us-ascii?Q?ZGgZ/OKLCkawQk2aQkHVDSJJrFrs7VUnRUUkd2/OKoDV9i9lVjVK2QR3E/37?=
 =?us-ascii?Q?+TQI9sMR8it4tnFVSFwEgK6KRwqfpVPDtlTag0DU4phy1kRHxCOz+Lg4UD8E?=
 =?us-ascii?Q?eIr2HeHEqpjYCVO/ZAUzHz+NbnJAAIxV/NEgTxxvEa7t2/tNs6F22tKv9n66?=
 =?us-ascii?Q?N+UzlVli8iRMlRlFh04hAOm0ApWp9MKUkyI7Al4MKtJPOHPX4dFXoVNHxTYY?=
 =?us-ascii?Q?1NF9LC/VR+Ja8ORqyg0LhRh2viynF3xpoPYOOdfVEO0LJ8MLQk+p9JC4+GMa?=
 =?us-ascii?Q?HvrOIIwPx+w4tloL+434yJjyhtoC76GeNxqBwj2iDIc9whF9Kv5707mUec55?=
 =?us-ascii?Q?9OFj/9Loz98sAJD9cmSn8AF3IGixBOCdW9xhgfRpvyNZSJ8RGQhYjakZrHow?=
 =?us-ascii?Q?sYiGjtUl5uaFc9VIcL0rxC99hx6uVUqlx21Phh0oh96fMRBuxOeDhiLhe9d1?=
 =?us-ascii?Q?ZEHqobiViVSbb6wR39YpXDEB3keYP//JtEGxZ/fkix0K3DRFcb0YGEHiW41Q?=
 =?us-ascii?Q?33EAOdyeNLlzxfNk59n6eEBWknhp8RituYc3ranFPyEZkZeRTtEeqhsh3c8N?=
 =?us-ascii?Q?JE6/VI40WUxQ8ihxIteW5fLQAz55m4iSefY9MTwFjXLCWdV2p37DJIueIuGr?=
 =?us-ascii?Q?oLVGABMrt6FvsfL9FXmNfRuVZfzR6S584uXxX5srtI8fgyeco3n5LwcHuoJ1?=
 =?us-ascii?Q?KY0ZK0+oDEHrsVQwgJMFRjOZ0NRnlRXbgSzyxkcpwZJVZoZzgix0MI/KgSFB?=
 =?us-ascii?Q?Rh4WZFPHZNie5KacfC+SyeZElkYYLc/w31qlh2m+gIkYv5CT3f7d9L/0PQX2?=
 =?us-ascii?Q?QfUxJnslyig0nGNY7bjYdmY7k6TSRy5go+lJT/vPUMkrN/LmHx33JLcNer+o?=
 =?us-ascii?Q?9Yn4jum+2ZVvgDVBiyjPD17KE7zaL9MY2Bor4lK2y4SvEjZeoCqMfZjqUxCZ?=
 =?us-ascii?Q?HzuWPkJMWB8HEHIGL1rwMGQWPdzwLCT3RaZNDNR6uCyrPZ+S4bXVZ3cuYAfG?=
 =?us-ascii?Q?4ayosEs6Yac7R+sFw7sc1jnp3j7FNMAQ6Z5IX0vpjXG9AHK4CtRMnTJOmUF1?=
 =?us-ascii?Q?xO24j1G6Z+86QbGmx6Fkr+DlcdCHnH+82rkqPK4Sl+8IFu6BhjW/JQgQdAO7?=
 =?us-ascii?Q?bd2qbZj6FlOGICwMLECUyr3RSLt1aUbZ8WF7Sm6yPYqU2TpE9XM8ir6yzVPv?=
 =?us-ascii?Q?e72M8tojpvr44II704E4k42veY1ecCcCkAZ04spM1gilargcKJJ/PgowCJ73?=
 =?us-ascii?Q?uq0pMlw5bSKDYhkvh/iYdpx24jYO/50DH1DAurtQYvv2B91JHtO0jtghN70q?=
 =?us-ascii?Q?d6VJatzNgv98EmOiftYGRNMzKax6/aTz8adKXYLjedRtLExaCj7097nK1nVG?=
 =?us-ascii?Q?QwrCIinagA0fUCZjQHA0qLXZWybKSLOQWK9nHvDg4o0CaXgYn27YPwsrcTP7?=
 =?us-ascii?Q?FV1FunW97ZPQer3KYWpDiqRXwT0JovCbNLUdpjAMs0m3dgveDolB4tljxTKJ?=
 =?us-ascii?Q?6ORFVgED3PUsBzxShoeUyWsGhxS7wyr55YSwR/Eu5m84PBfg/oiEgv0QgI0L?=
 =?us-ascii?Q?JIKBLPesuxwbhVUzSzTdf8R+KGANgOfaxTt6AOTNZoYpf22/oqSVxLcsZy17?=
 =?us-ascii?Q?bYLWIA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d2a09b-0aab-429d-e19a-08d9c62d89fc
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 16:01:54.2558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J8nkqzt76oPIooPZjUVSF3jeZhxQbZEVLu3w9UGVn4hQfE/BvmhfXsQ6yY6XuUlnpyoodUuap8+iMzDY7o8tziCFPOWoQDRZo3wOqXL7AGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6148
Received-SPF: pass client-ip=40.107.15.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

v5: Move patches with unsupported_imgopts to the start of the series
02: add Hanna's r-b
03: - don't modify migrate-during-backup test
    - disably any 'compat' instead of just 'compat=0.10'

Vladimir Sementsov-Ogievskiy (19):
  iotests.py: img_info_log(): rename imgopts argument
  iotests.py: implement unsupported_imgopts
  iotests: specify some unsupported_imgopts for python iotests
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
 tests/qemu-iotests/260                        |  3 +-
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
 .../tests/remove-bitmap-from-backing          |  3 +-
 49 files changed, 356 insertions(+), 234 deletions(-)

-- 
2.31.1


