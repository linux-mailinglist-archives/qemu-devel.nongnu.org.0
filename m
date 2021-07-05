Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5043B3BBA2E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:29:31 +0200 (CEST)
Received: from localhost ([::1]:36854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Kuw-0007ly-D6
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0KiG-0002YI-4s; Mon, 05 Jul 2021 05:16:24 -0400
Received: from mail-am6eur05on2098.outbound.protection.outlook.com
 ([40.107.22.98]:14496 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0KiE-00087O-Fj; Mon, 05 Jul 2021 05:16:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ewUxPf7WbgbT7L8ksRBJx26XqLHotPwc7IkarnE73QZuzW/WbqTRGq9jFAP6RctjzO/9flLkJO/mqDT1M+HAIbsV53K2Gf4lT6YBznDLsquI7UR2f/kyurDVHyF/Czoti1ndTV9chRtCUsyIV9uTG4I3dRp24BlOFIhWggC0IlmrU4tK7EG2RpkLPe2H4940HfQWlCp6tKjWcy+bT/FF2eO+xkJ5l8iNCTFEXIXYgAG1WtEXz9H+1uWeG4Tji813mJwaO9NtXI/EBa3TyMeW9ClOWsxuLQo1rGyqpzjPApv3FuFU3AeqPNOgzw8PzFuE1Pl9DVCp3tziAvEllGhB1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8z5pRLsQhvwoEXWI0qNxN7H+23lYIryUkTBdMG/Mts=;
 b=I3FdA9JIjIohuOE4kJIileG6Q/RGxsUoe/zhz3pcEhLdlQ0PypaS5KECo/YNXUyYJcfI0JjZ31HN/0ZRxfA3DugAYIZtVaE6KbxPpGXoWCn/Opu16ayzk03Bbm3K/k+1F+Kgz46WteKMxvDnQmf/PMqDJnQg2I11BZMZSZWroJYZ6eMGcaZT2lAXFGAJdvc8CbRTEHicbvogYGUTual0fQ2cNYr26E+VKnVEkpinGmmnpgZaRKKxX2uXLJEbhoGbp7Z7tCHJGKAwr6aq8a6/fUE/Jdbscd8acd2OmQsLYqRkLPdJGeiGMta2RkcM+1wdV+obLPL90XpnDoa3epTX0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8z5pRLsQhvwoEXWI0qNxN7H+23lYIryUkTBdMG/Mts=;
 b=JdQGI9cX8oBbsbFdexfOrIFdeMi3IObSsOIwALehlKfY77t3CE5LTFH/PdYEBhZn/shG6SOuSa3uMMWlXA7WfHfd6W2qijHxUyW7VtsqQ1JS45kTRnstk9yueDJRd23iWNDCj4xYy+BIKmVRhbIdLRM8ntro+BwQNFTeH66zD/w=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4533.eurprd08.prod.outlook.com (2603:10a6:20b:b5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.26; Mon, 5 Jul
 2021 09:16:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Mon, 5 Jul 2021
 09:16:18 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, jsnow@redhat.com
Subject: [PATCH 13/14] iotest 39: use _qcow2_dump_header
Date: Mon,  5 Jul 2021 12:15:48 +0300
Message-Id: <20210705091549.178335-14-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210705091549.178335-1-vsementsov@virtuozzo.com>
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR05CA0235.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR05CA0235.eurprd05.prod.outlook.com (2603:10a6:3:fb::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 09:16:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b1473ad-ff68-4be9-59ad-08d93f958bfd
X-MS-TrafficTypeDiagnostic: AM6PR08MB4533:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4533456E8547D1B099D0AD50C11C9@AM6PR08MB4533.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:47;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XAfDvHbIVhWeLdLJP1z1KwL8z8xGvrF+Kx0nPB9jqyHpA87/O+7jEyOn8r4uGroZP840GA7ZNU/YevLDj5TWyZBz6X+clKaTQyVw2R02ism7dWHA/G/plhghQzSbixtBBoecor0xxnDi6VMD7XC2ZOYSbL0uv4M3xepiVdGjX/LD5J40DJColRDHnKwhnQETmI92RUu2eBQPY/OpyOqFcLIkAsZG47+D1vZkmtGGGxX5ED+H8/IuQjmc6gI7u2HYfzBLxReN7PvbV7Ac96CjodlrzqdHArxsC3PoNJoZOldS4hAqyX1NqL7TWNZes83ry3c26rJzYZTjnvhHtIz4G6vysEMM7Aaca/nNN0AClBMJn76eMMxkTsAoCIJd3lUKwALvW0v5kB2VbdxwGmVLd7o5tHsTqxMMJnSIVC+sU5CI3wi0EpSFtpCIN4D3mq6WhIGDbuoIEvLZCLNbwWErbQRhr/50BjB9SHtkt4H/oj6pTqbFTSdE5tfpTLzxXVmotVrvxPc571SfrCfk+cqcJWswkPcPpFXB9nI5QowfHtQiI8TUXQDnMK91kHh/NtOtRYfWc5Cx4L5EMcpnVHrCbAXD4I1/WROaSalgkxu7q0D1FFPy7eZlK44iNHJGtF5w8MC1HsRiebma0NictT3BJ+wxQbyRZrgvupQfzq6v7/bSJuNBvUdd2PF6yRxDL4tUDrIx938rQVCJZqFTR/BaeKKkHIGa9cJxbQ0HsWKfZBc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(39830400003)(376002)(396003)(52116002)(6916009)(2616005)(5660300002)(66556008)(66476007)(83380400001)(316002)(86362001)(36756003)(956004)(6486002)(478600001)(6506007)(2906002)(4744005)(66946007)(1076003)(6666004)(8936002)(4326008)(186003)(38350700002)(38100700002)(16526019)(6512007)(26005)(8676002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WzcCEYcwk211XQLJZvxW1W9IF36Q22OsawG8Jf5h41OdnGpYdMdnHlzqvGiP?=
 =?us-ascii?Q?XBDsRVPTLWWURnSIWEbpnnrrQt/TRM7gl4JvecqvuHM941Q5wsYF9eIc2Om9?=
 =?us-ascii?Q?zPjgX4widWux+Nkezp6w5WjmRniyZJP86w7jjKIdZ5cHjexkUHEmnNJiUuil?=
 =?us-ascii?Q?63hcPVv8At3B4xpFJ4CymjqJ/FE2Pf4Qe5LtkACAE5Z80O65kxNfLETQlPEi?=
 =?us-ascii?Q?rcx5ByT9b1bfxtsniZsSDlp1srbMKHBnQaAFsRco5NjT7dEdOVe9MXdymoiQ?=
 =?us-ascii?Q?1s25pNaY8mYkmBvlBYD1p/dHUHKDjliDSQsGMXXPp9mMkkZcgfTNYLYlzXTq?=
 =?us-ascii?Q?2hHQCkw+bukubZb009i5xkySoj8ptAwOEqK/5Nz70Tmkk4GZW6Y2/XLG4mc5?=
 =?us-ascii?Q?Q2rJOay2799Lfvy/is6TWDORoip9kh29A9KbyPV38oss/c44mTd/uOmxn+2Y?=
 =?us-ascii?Q?MAin732HtiPn10MVm7WbSdwPeBMxXzFkv3TnBPLEQEZGjk20K9E88yBw9obn?=
 =?us-ascii?Q?UbMnIz+PvlDiE0Onesg0swtYEXFp4+MT/UFm6nAk+xthhPmYtCyxqe3e5Qjb?=
 =?us-ascii?Q?UScmwjRIquK5Iq3C13ME6vSR8cPXi8I7pJU93PYDKbVWp0uK1GDmEZyqAnVv?=
 =?us-ascii?Q?6/YzEqmOFjkesa+puvuQLe1YPRCkQ7MohdozlX2EZ4NxkTdtmTWJgx+4udSx?=
 =?us-ascii?Q?lwYEENtHNsjaFgOkVkxXVCR2HEZ5lfFmyrAyiDUv5GA2fzwc3jlC+4jIiCn2?=
 =?us-ascii?Q?Lmt2+BHnuN2e0r6GbJFsOZMYgAeuvVfWGwRuuLyuuDhhhlc68sC8xQYqdvN9?=
 =?us-ascii?Q?QnPbppkDxAKFR2wbOcYOW3uzF6Tk68rQwdD1rlXpoep2Ha0gNybLHU3O6CkL?=
 =?us-ascii?Q?EDUvojpWd+ks/3VvRIS23HzjEOYignv/TMssu7Y6TYkgz2taUq8oru8mhCwD?=
 =?us-ascii?Q?JxXTiRDV1FHQ+Dj6mJ3qOIpxekLw/xAMoCJJGQTORwFAwykTUgLo6cQpkksm?=
 =?us-ascii?Q?iDAaoMS8IOxwR/a6AEOkf5FDiRy3F6gOfLHewoXFyy64qvOg2daORY+iT6tz?=
 =?us-ascii?Q?4ntaDzvZKpQ30vCPbXXs9F5GAaQI7aaEo/OazMvm3dWPEFf4a85UCkLZ8AIM?=
 =?us-ascii?Q?bmXYYycCNMXJLncZkysPiBz4RI9Pw7eqlLE8BNwd77hfpVyKwIcUa3nnlttq?=
 =?us-ascii?Q?5kZqyOyECMDZJL5r73H8R7QNggVM5NlyMzvmQ8k4Ai89m0FT2AXrd3ZCzsqR?=
 =?us-ascii?Q?rHmG63138VQFyFP60qOchbWQ/gWSi6Ci4KZvbE6vA2MqvltXQByPyozyfs+h?=
 =?us-ascii?Q?55bwFYg0W+MvjzqQsge633Hd?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b1473ad-ff68-4be9-59ad-08d93f958bfd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 09:16:18.2612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FTN/ZMAyvTqc8e2iROH7WBoe89t7QBdEqrqR7Ej2YBoP1alwIaMHCFlwdkyKFIDyrnX6Nmzwhmu6fC/vwQNOQkKALXttwNGuFb36RIc/ntA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4533
Received-SPF: pass client-ip=40.107.22.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

_qcow2_dump_header has filter for compression type, so this change
makes test pass with IMGOPTS='compression_type=zstd'.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/039 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/039 b/tests/qemu-iotests/039
index 8e783a8380..00d379cde2 100755
--- a/tests/qemu-iotests/039
+++ b/tests/qemu-iotests/039
@@ -142,7 +142,7 @@ $QEMU_IMG commit "$TEST_IMG"
 
 # The dirty bit must not be set
 _qcow2_dump_header | grep incompatible_features
-$PYTHON qcow2.py "$TEST_IMG".base dump-header | grep incompatible_features
+_qcow2_dump_header "$TEST_IMG".base | grep incompatible_features
 
 _check_test_img
 TEST_IMG="$TEST_IMG".base _check_test_img
-- 
2.29.2


