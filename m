Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD9A3DFE7C
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:57:20 +0200 (CEST)
Received: from localhost ([::1]:42152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDeJ-0005h8-MU
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMv-0005fO-Kw; Wed, 04 Aug 2021 05:39:21 -0400
Received: from mail-db8eur05on2122.outbound.protection.outlook.com
 ([40.107.20.122]:30945 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMu-0006Wh-30; Wed, 04 Aug 2021 05:39:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ev9fv2vprLrdMoJ5tDb01mNoZgYRAxd9uEVXRwRXby+vX+G02mHHpS8z0IZUOYeLN9qySYT+Vgm/6eejZUyzkXIvtHE33uXPE4Pr1k/hrpmLk8H5zTP+38AdkFJDkUrWzrHwjv8PNdaiSMuBZC8WmqN0Ftm5wFKjzByO8tLYGurA8BY2pZaQpS54W+oVfJpZ0w7AIrFBKXgaVEktw17esK9Ng58fJqTOXxqKzzrcBAKhs6Xhj0pvwwa7UZegLAJCvznKUhLXGuGTSjZPTEs3/1OibseCWp6kU60qLbyyTmFhthMjOu+Lt2eCF94cl5DLMzh7s34viVCk+fXurwUfBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pm/DX8vEH9U0U4+GCtPJAxsZlteqTAW/fTB5aMXiQYE=;
 b=GeEShz4/lmzjJEhA0lAk9szJBezv4w8uc+MnZYu2CBEXaXr365BTsHPimFahDVrdQjId22rz4HZTCBu8NZxf67DKjnDy47X8IO5SidaCAjLDm0hP8EYtIdW68iv/aCaQDXbAyhhC7RixD6kj/VxEmON92ts+RHS/HtYENzfT5WbTY83TJULCvUwwaNxIMQOIG4NCRONmCGZG5xz4Zse2RWnjioHOfGYIrjkHbhwQco3nl5TkmljcwgG4ZbxUY2dXYjVhUOtt5FLWktdQxeQeN0ZT0xoawgHb+17/omFj0ca/e2QCZ6a0mXxa97yqVDBOE8n6zeFdVRNJzjmCwbxMXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pm/DX8vEH9U0U4+GCtPJAxsZlteqTAW/fTB5aMXiQYE=;
 b=v9DrLKFlWarorQ4A/vwWQXQu7sriWRYiq2oumqDxtLoioBr653GtEPsqcANivYIvIAgnp5KRZm+INL0V7vN7yozBZk2t1UolV4FGgTiku5zXBMdhpIfjF1rhAtouf/u7kcHFWWy3U6hPtTgrzyH+wBpyAd54kmSiQTU31ztp7DI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5336.eurprd08.prod.outlook.com (2603:10a6:20b:105::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 4 Aug
 2021 09:39:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:39:17 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 28/33] iotests: move 222 to tests/image-fleecing
Date: Wed,  4 Aug 2021 12:38:08 +0300
Message-Id: <20210804093813.20688-29-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804093813.20688-1-vsementsov@virtuozzo.com>
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:39:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 091db566-cc66-447e-9584-08d9572bba5f
X-MS-TrafficTypeDiagnostic: AM7PR08MB5336:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB53364659D4C219C22E2877B1C1F19@AM7PR08MB5336.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:497;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nnP0+9+cGDRRWZlwgP55fHXu1JyxCWC1L6G/WRoIEOAyoT3BxJfkFEK1LXQZedJox//TPQOSEgJYQGm6r6m1l3HnP1ZVAL0p3OMhHeJZgQC65EAzs1pFYNlCyLUR70IGxHATJfhlwKxxwxMG+1st0MI7tbU1gfE8hx+qIMLJH0kPiUdEY6DVWEjJ2yf4Yy1xS/QOWiuEtGLKv3RXuj1TKWcmgjiHOMe+9lKB6NfEquxPRIiyh8bWMP9XzaL4Qn70MRlrd/WM1gqbzSb31asrRL2A5xY46oLPClbV5ZeU1ocOLo+ca+z3lpzNlSjsk5+MmSs9qXsvbb9ml2nMX/pqPdqvhYBd6IgUgaw1BDc7EZkoN+5yMb2SfTsCpzVXmdc3uFjGjwBOunczvtsBlquWZplodRHQQb9KPwwHbzSpa9SlA6gi6H06UMR0n3F9UfVtkIqKI06KahJWEw8B2zNMi1VU9Po2xMi/1iaazbS28DA+comnZD7R1yUO0MFHW0Y4fqp5HLVly2UVa+4eRSxIOu7stN3H1DTK+RclPXR/mwp803fnRCD/hCefrFs6bfOIBz7bkS7X1SBgaf6g/VfjklKQppYq9PyVT70z/wr7QMnI37FZ7cA2HdIem8Brn0vW8XMK1/MjAeiXP6sIYKCMnYVL6tumgOmANw42YRGlHjEa6tv4kV1N5Q4NMdQBmkKw9gkHszmx1Ug34UQ5huUbQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(39840400004)(396003)(316002)(36756003)(956004)(7416002)(2616005)(186003)(6666004)(38350700002)(86362001)(6512007)(26005)(38100700002)(6486002)(4744005)(1076003)(52116002)(478600001)(83380400001)(2906002)(66946007)(66476007)(8936002)(4326008)(5660300002)(6506007)(66556008)(8676002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GbVWzwAdA0CmTzvQkAF1+/wsGqNgNnyHX7JDKGNMMEQbzT2ROXg6tSZp8wlU?=
 =?us-ascii?Q?qhGel7RQoNuTWNQje9IhN1trJxmcvEX/lw/xnGyoBZzM4yxuEF0M9JmyOsj0?=
 =?us-ascii?Q?LjIrWFQm9e3gbTprfglrMrd65lCuctHyL1v6nDZ1n4w342yXW2XQPef6WTR1?=
 =?us-ascii?Q?fe45Wdgf5FkojHly2vPWnc9XcnHPQ+PWpWouOYlh+ZGlkZPGQdPsMEQ20jqP?=
 =?us-ascii?Q?vmMjRB386bc3aEIwGk7WvuBGSit8HwbIlvaP2zqbc8r6h5ijIj9Bpqqybkn7?=
 =?us-ascii?Q?/iXK+qG2Sy9/wy3kJDp/1nvyIuXwFbC09QZrSHY1Baaw2tiuBA2PL8xCERYm?=
 =?us-ascii?Q?Xf1dJZ4syN9F6S0jpl9B/qX1pJcbEOqw0e6BmsZVbVVgyLjnPbM74+27DbHl?=
 =?us-ascii?Q?vCFlToB1J2WvRe8FXxIVbOM0vNGXUeY/yKWuSlspMiJ9RnxYxzBCG0kkqAd6?=
 =?us-ascii?Q?m9RRJAh3kppTZO/4ihrveK4MUdBKk4zsDgaTcModuIIwx8sfW5sLekGV3P6p?=
 =?us-ascii?Q?BTayCs8R4Kkl7ZBfWF8MfkKDQRH9r3zNTDlnakqXd6Eyc9f0Vmkoby/VWmdj?=
 =?us-ascii?Q?gFZWzQiXtLqkyt5VPSqXZEpy4w9P+KcfX7Ur81r3SjkvmkohtD6HKydT9gql?=
 =?us-ascii?Q?faXXNBepwgi93DLaUrX2S2TvYiB9Q/ONoZYi0fa3FiZ9UQcB/dL96/RduES6?=
 =?us-ascii?Q?pJLdU+I4ut+xsTemV4O7qPCXL/cY9pfEzIC/2PFZBvVKpPzyXyZ0sjFS/AuQ?=
 =?us-ascii?Q?YkozzJC7DGmnHHkZwlZJdpwSzS9uUJ2GLKFROnUX1zg20hwGxbE1lxxDeHEZ?=
 =?us-ascii?Q?zaeuHLQuuo4helCpiLTK0c6F6xusnQoZQcOEXeBRbbyvR60ChLN1/6C5XzcM?=
 =?us-ascii?Q?icqXt/7IBKQiO/upVtnTV4rFySiKYj0/KuWTDhO6Y10beeeVAuPUMK5kjcqB?=
 =?us-ascii?Q?BM9fRpy7BXf8DpYy89L76tTNumInulYMTNn4iYsIFzECQCDvnetQejqB9r04?=
 =?us-ascii?Q?eN4lTx48p9n9o3U9vqeDu3Q31g5eLqIDhjc2vndTJaWqvG97q+eR28dqmYy9?=
 =?us-ascii?Q?2g6lUrqJ8D7r5B3XjCRSjhiLP8sbIJWs1syE/+W4Hw6sJGr0dfHim+Iim4Y3?=
 =?us-ascii?Q?kS0HqDnkbJmnHAKXB32YlOZ8txE7UCaoaJydfOrW9VvfLp8Rs+FYZAbQwmDL?=
 =?us-ascii?Q?phCCZprMBMxHVl9Gk9ssmYZlwCiaibTjZJX0ONpQ3L0z0ZzPrT362pkdKsVR?=
 =?us-ascii?Q?WgTLHpYWaIXn2OTBAB0bsNhEQzEQjkkx4IO52NZ/H8p5MA92b00iT70Tl4Hj?=
 =?us-ascii?Q?J2s04TYy8k85BxyjgCGoSdx6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 091db566-cc66-447e-9584-08d9572bba5f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:39:17.3554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ihoG5jpzRRDehWJaN5PGXjXHk4A63iICBVoePx//D4SYjjyyPgvW5m+k4KksovXFWmegGgLrrCc5Ywu6NtHkr99lafVZHYGuXHzZtHGo7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5336
Received-SPF: pass client-ip=40.107.20.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Give a good name to test file.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/{222 => tests/image-fleecing}         | 0
 tests/qemu-iotests/{222.out => tests/image-fleecing.out} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename tests/qemu-iotests/{222 => tests/image-fleecing} (100%)
 rename tests/qemu-iotests/{222.out => tests/image-fleecing.out} (100%)

diff --git a/tests/qemu-iotests/222 b/tests/qemu-iotests/tests/image-fleecing
similarity index 100%
rename from tests/qemu-iotests/222
rename to tests/qemu-iotests/tests/image-fleecing
diff --git a/tests/qemu-iotests/222.out b/tests/qemu-iotests/tests/image-fleecing.out
similarity index 100%
rename from tests/qemu-iotests/222.out
rename to tests/qemu-iotests/tests/image-fleecing.out
-- 
2.29.2


