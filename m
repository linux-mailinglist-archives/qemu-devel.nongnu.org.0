Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9092B406A75
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 13:05:22 +0200 (CEST)
Received: from localhost ([::1]:57668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOeLQ-0005Ml-Ui
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 07:05:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mOeHa-00034C-Dg; Fri, 10 Sep 2021 07:01:22 -0400
Received: from mail-vi1eur05on2100.outbound.protection.outlook.com
 ([40.107.21.100]:24609 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mOeHX-0004Ln-Io; Fri, 10 Sep 2021 07:01:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXbnAGPmQHXkkw2LFAdoHPQwvxP5dARcD2LaRQpGGUuZVv0IBCM8+eV6K9AbUCX3jtCjhXfUaw7+M5N+bXS0xEfgOiK89F2eb3Adl7mtj4mBAqge++Df66rxrw+vXos/i64NC566kcnhPjBn4wJtY8iCytroRVut5W3NOC2oufeDW/4Ulz962fKJZDZCghkzOkJ/xeZil6bmy8mU32ABfCol3Cm8Z2Dn11iO2QgQBqti11TpX25BYI6hIH5JzfQmq7NqGOCVIaSU0ksIcDrPXcxEiChtXWLf0BGJslSqzi0AfD26nkg0S00E/b5oiZBEUg/l5h54YwdzdCLGkJnxIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Bs4uBkmU7cbyd2xGB9j8BIRbgY0xEmKSJFz7alSOMYY=;
 b=ez+Vy4u+7uLEx3S9TYKa9bREtsBI6nJCKdcPC7KkjErXbNZwaA60QYiJ3mPJjWh45rcSuMgsPCjzHeGbi43ojO0sIr9OsQ7kfsYcagQmohKDZgCrjWWRAbV4rfxKx1ItkkolJb12nXMJGWMyymrCKakLw79uaYO4039WhnYW3cSEC1ib0ns1eVG4xZK9hNMEgc8YcUCEvJ31jZ7shCvtp/mqFHrSM25UfpS7p+1Spwr5i7hGxE562+3EgbTUrJ0ozJQ43m9+3ftKZxU+FhdQL1T7xhEHc757A9yL2g6Oal/xXwO94Br5/iJWP2NPjQ5YqeOiXYw7IjBTjGLeVYNV6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bs4uBkmU7cbyd2xGB9j8BIRbgY0xEmKSJFz7alSOMYY=;
 b=uEkU9t9z72PWINdHEb/AtcN6pdpK2upbbnBixRLPoIAv0NmqOrytJ5PBSpIq7ntB79m4TFZ74Df/XGtIEx8ectjxxVeNEFTywhgJ5+cjLs0gQd3VEznKk6nMSbZrhs1ZWZeJTndVzHO1peW2CmN/1q1rXjB1+av19DfgbZqkou4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2532.eurprd08.prod.outlook.com (2603:10a6:203:a1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 11:01:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 11:01:15 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH 0/2] fix crash if try to migrate during backup
Date: Fri, 10 Sep 2021 14:00:58 +0300
Message-Id: <20210910110100.31976-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0354.eurprd05.prod.outlook.com
 (2603:10a6:7:92::49) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0354.eurprd05.prod.outlook.com (2603:10a6:7:92::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 11:01:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5941b33-2e00-4109-a4e5-08d9744a4ec7
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2532:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2532D11F7A886C7DE9045143C1D69@AM5PR0802MB2532.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jCnqJITrBf5UiuIqEgzcluytrFcWAL8pq6TfgaWagCVZPbmeHNLe2IGahqt6Di603cSayBngeVb3a8WLHEXjAb+BQvUjPwfWMpsumD1YPcos43ryTwFhHiIUZw1fNM972/7SekoMGMdzHYN4F/dI8/o80rcJYSZaKU6H5Xds/SOGpSnec3EZB1tOR49/bvYPI94/llGrsSFkr2R09HszydzQLnVpTzjvfkJSpgFYGBkokrvnuL6wMqV+t8dFVgTXVi7IPPXCE4w+b0oPWrKyNhxZAajPNudXcRQRzkFN2CeevLkneT5tXDz/eqR380f/REJK7bI4X8x4vzwBHOC4vQajBPZ0YWJ9wmv9c2ctsZmMqMP/qtlHimCNKVt+vU0h8Y4YJWBDISG0G4ZhQ0oXzQObwtGZ7i3vyTLn97AzFiTpjJCs9I7a88DT46/79wuMlHi1elEshSGLxgjNG2XgmM/qLbN6cqLTHcEsL7zEOsbgXEtp9yQUSGbe9/jujCgsHctPJgAaZ/1nCEjLM6yHMRGyqRQTDfF507u6+c391FoXWjajFVC1MWVDMBW791uRmYBd0yey/DPTJk1QZbacsHV2sywjQ0tOgObFCt5/L3++gvWljh0f4TiPn+lwNh4Sx8XZsW1K40Fv71+xXmaKd7yUQ1rsN/aZCtvq3PP8W/YTUkw+EbmpzVP6HlEpfivw5W642LiVgFDAEFwCaQngIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39840400004)(136003)(396003)(83380400001)(186003)(66476007)(52116002)(36756003)(6486002)(4326008)(86362001)(2906002)(316002)(6506007)(8676002)(5660300002)(2616005)(8936002)(66946007)(956004)(66556008)(38100700002)(4744005)(1076003)(6512007)(26005)(478600001)(6666004)(6916009)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jM7lTnUVOZo3qrdYU7lWgkXdebcPgXYu9F4FZA6VYjOL78ojsqC8w6DK9bzr?=
 =?us-ascii?Q?YyGaW/2kBBkCUXSSY1gBEsTYaRuAnCCovXWxwvZT7LlASH6JAUwopg6dtxAX?=
 =?us-ascii?Q?igVnRElLdboouQ6diynpp81HWqatlFyg7fcYFy9fAxSAGHsxo5tjHD8ztLhn?=
 =?us-ascii?Q?Sb1TRtmc7sWzol986EMF7jPDd8vTfYiKkA297kNtRM/Tot3sm8S1TlCtp0Yb?=
 =?us-ascii?Q?j/fPkBEdizQAYKfyNWdBmzSRxAKwz+5s6nrgy4uFBVi+KqAchZS4WAB8TzxF?=
 =?us-ascii?Q?2VtFVp934wgAYgXchnV5vK41ojjWRDuPBeCI/HR5tEAnPU5L9UgEinLKnPFK?=
 =?us-ascii?Q?Njzq9kyTf1KeL3FihckZkTAQykzhQqO4IAn4ItQ5iQPkXWmj3YgkrXrgNxbH?=
 =?us-ascii?Q?f+xm0PYCBoqXsS9yT+Q0b9tRJYg8J0DGUsnbankdtqcwe9rSX2lxaY4zCb0T?=
 =?us-ascii?Q?8Znulk3PuzUPq3iPKsPNw2s/BU8SQlU18Vr/CYIrySrmToKShbA0fNU4mDQ9?=
 =?us-ascii?Q?15M7uKfVxmxmAtBWa1mJgkmNv5gbE00oLv8MNlmqxZyZa1oPQhU4a/zzOG5i?=
 =?us-ascii?Q?MH9TT6nSE0/RCEQs+j4YYy9QoUrTc0X+EZy27DNjZib5rQnJ4FtU10GOQnwE?=
 =?us-ascii?Q?HUYMztnceFhv5hBvRjfqyBcWFsMYPXIwyagWiH3t+TJeoQfqoYwsO78aIE65?=
 =?us-ascii?Q?asocgCjTZ5VdJAR3DMxovXKG0jElxrf5avHAvJR1dvUguO3DUAKPQMPanV7G?=
 =?us-ascii?Q?NtXnxLKgDhyoOKY/JjxdegUcr/RfvPrlcZx1mftKTzhuJ3PXjXF6Vrrxqbtk?=
 =?us-ascii?Q?uPfSMoLIAT5fcRKhbVJ9ECHAq5nifoKQ4UYky5odwcQPjRWBU5vYwVpNLcj8?=
 =?us-ascii?Q?UGJFEh2f5G2VtmEu3OsFzCaxGuFwIJN5DrVcKgYPPyUQh3Sm3ItpBXFYRaE9?=
 =?us-ascii?Q?sJ3SIrhxCC8jmwyqtZiWu5WblgMCq2+RBb2NZz2rIbMyrq/UbkNmooEYTUnC?=
 =?us-ascii?Q?JQYPSrl8Xz4s2WZcBKahfOJuJJQNNRQXvBZmQD9KlX1CHpBrC30pdmecGaE/?=
 =?us-ascii?Q?C+zCoQAeUIH7r0fJlOVenDLahVpoGxDYWqoeLF0jUaraXOqqdB7WzfV/0lvB?=
 =?us-ascii?Q?G/myhZqn83yRHTmUbRFPGxER5Pxyajmhw8OD5U8O+2+T89ffEVCIIR5UDIfF?=
 =?us-ascii?Q?EJ1emvzGeihkbDYRfNAbrHqDJKxpjKPvhydoedgJmrjM7fNQxY8C7DcVqw3I?=
 =?us-ascii?Q?vC39QzuD1kQLd7TysW+6RfsGq9Y8Pul+u+gVAIYIEA7lz0bGgnTxLPlcp4fe?=
 =?us-ascii?Q?VbEJT/Kz9I0lb3nzy2gp1ySj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5941b33-2e00-4109-a4e5-08d9744a4ec7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 11:01:15.1059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TK/evYAjQw5v0zYZ6Vr29iMvQhvMcEWnGmND0HUwSSO/XnoQukrc+yGnPQbrBYaAqliUyWAVLPX61bs9emLqGJym1h938ANAeOcbxZySdmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2532
Received-SPF: pass client-ip=40.107.21.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

We faced a crash and here is a fix. Look at the commits for details.

Vladimir Sementsov-Ogievskiy (2):
  tests: add migrate-during-backup
  block: bdrv_inactivate_recurse(): check for permissions and fix crash

 block.c                                       |  8 ++
 .../qemu-iotests/tests/migrate-during-backup  | 87 +++++++++++++++++++
 .../tests/migrate-during-backup.out           |  5 ++
 3 files changed, 100 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/migrate-during-backup
 create mode 100644 tests/qemu-iotests/tests/migrate-during-backup.out

-- 
2.29.2


