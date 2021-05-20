Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4882838B22F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:48:13 +0200 (CEST)
Received: from localhost ([::1]:35218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjy8-0001DN-A2
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjaa-000899-1m; Thu, 20 May 2021 10:23:52 -0400
Received: from mail-eopbgr10124.outbound.protection.outlook.com
 ([40.107.1.124]:23109 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjaV-0006BI-EN; Thu, 20 May 2021 10:23:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKSSoYZbdQRIegGU8nmAvCgKWUfyccOez0eB+bL/gLobaAI1YhqwBC3PPeb0QBrQ2wj19/F1LiLSyXvXisVxzdZQF8bwyPFals0lWl7tYWQspn12qN/jyCZY7Oc9BRC24mMCpz1W+jlwxHs/f/UoYIc0y1bNcTEA9lBqri/chReyPteEX93sraVudCOZoX9E6wHutFSoEicM+TT8fI9Oo5Db4gmW8zEHj/V62BhMqYkg1KqkpaoPxn8QuIfcsxTBnwSyqVzT3bZQYtVW5EUvegsr5N8oBPg64raD7S5o4kgZcfI6PkGva7P4sZLDWHK8ORtrMjkOXP7hq8s1ASfZdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xua8XAz4MCcCVJWBiPpeHDsNmOh9r4Qg0CjpS9tc3A=;
 b=EM6F7ufiEKDPmAuYr/H4qU20OkaAk3izxcAr7G8uArcM1dLMLaQPBSBBWRmGo8muINbp0ENkTwOsh/DYYVlOQC8uJh6RBHN3PwUFrrmTa/LOTjsuKGTnNGd3Tf8spagK+DkRf8zEG2y7zrgPR9FY+a+pnmclqNfso6v6AY7COfxk0GEcu72Kb9+ne1B6o/ASdoY4nuwfcYAdEmQLv3fsRy4Owb4nwTsGnT8KieUoc/Ox8eIhcgi1lNrqZTKe+Z0TQFWDz4l3cibduHbX7dDFdV12A2oKa3/X6yGZcAuMRBNqCScdBQhm3DrBo7ltkQ0+Bc6DldvyyZh9jgUnXIFA7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xua8XAz4MCcCVJWBiPpeHDsNmOh9r4Qg0CjpS9tc3A=;
 b=DWembOmzu9h+EMaQhATuxMTyqXVPniFr+wT52VzVseP2uFAoNvOgVCAFwK78cyW04pG9n8lpfCXok7RmkBz8xVHQZzyptcK1Bd4u0Kl4wGL5ShppDOPMqSMDpoyfrrKe+aoBiOnAEPYQoZWEELU7vB0wtTFniPVBwDOY+RRdVi0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4072.eurprd08.prod.outlook.com (2603:10a6:20b:a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Thu, 20 May
 2021 14:23:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:23:37 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 32/33] iotests/image-fleecing: prepare for adding new
 test-case
Date: Thu, 20 May 2021 17:22:04 +0300
Message-Id: <20210520142205.607501-33-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210520142205.607501-1-vsementsov@virtuozzo.com>
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:23:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 594b6514-55ed-4931-a789-08d91b9aca9a
X-MS-TrafficTypeDiagnostic: AM6PR08MB4072:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4072530901D3503FD4DFB416C12A9@AM6PR08MB4072.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:478;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bf/nN9d8b7X5O3WxuojfCBz+MjYV0v8RbIR60PBGYwEuIc3+L7dfp3zZXGwnwlVYJZuIVug4Y3Azj72+MEyQQ+v/Vsr6vImhyQqPNz240RdrMWqhS5ycYSftbhdfvWpIW5kO9AP2baoUnl66FMuY8r52I0aNCbZuu97xt8IiWWL5NHAPkDwE/Cn+D83NN/hkvSBpmpI4YqK1Hz3OEcakBv6xXhf7/EFsqcu05of91/4HP0pAzhzs4eUFbfCUZsn+8tMJaOYj75o9cPQDRC+Kg33ESWd+/53OC67to4LtQCpXyKtx/d4sWAiN9pOG2G6DDQmRVehjDNnkbFo/GNyOkjQnw4BxCr3TEMMeRIV2Yw+GlOcY5b42VPQblbrSMkX2rBNyoaQ388ckOcjtP9DYou9Q42Knakgf23MqMPZUHSZJlPyX4DAaM08LEpmXPV3OUcO/1v27q1x/q5fr8DA5tgbBHha5r7C/EhhZEHgbTv+QyyOcZAoAPA4LbmM8njr/JPIIXAYXrf158XL3KhTI+sPS0ffBvIfkPqjx8/3CXLi/ndJYD6cw/qIQrOFVFtovuMkFtpHuWByIxTu9sRkyhlgEE2yfrRCAgLsAIxS5Zasw3Jpja/5N2yXp6p29W5iVbmj9kRuqjCQmzGeEO38oePpvt5E6+KM+XpZY7BzJhPLTjWLIP/MGqMI9WZrwRdCf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39850400004)(366004)(136003)(376002)(956004)(6916009)(16526019)(66556008)(66476007)(8676002)(2616005)(6512007)(66946007)(6666004)(107886003)(86362001)(7416002)(316002)(5660300002)(8936002)(83380400001)(2906002)(36756003)(38350700002)(186003)(1076003)(38100700002)(478600001)(6486002)(6506007)(26005)(52116002)(4326008)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?KvDaEm8UuIMHyFHORgFfwH8BE+hniofHbHFu9EIGgLVVU2gJp5N4Dce0014J?=
 =?us-ascii?Q?oJT4j4oLE54at3w0ozA5Ge8ugN9vUjO0PPposkDZfvI6EJefPvIXaQlmunsE?=
 =?us-ascii?Q?gEob8JdxGI7XgKLsP8a74HqxW8HFXqnO9bJPsVyo6FkC2puh/g62ct64ZsvV?=
 =?us-ascii?Q?bcj41zrxFZJ/qOXaZ4lAguH8nCY6be644wafqEFweZrcp53fAXQXz+ULNTuF?=
 =?us-ascii?Q?vHEFCPo3EL/p7psVKsJONu9EWKUaqnO0yDs7aVsZFXIFV+2M5psW59NsgSOM?=
 =?us-ascii?Q?nhe+4d1h3dN3md5wGU5F0KtlBpVZ3/3T3XvpKo05jlNZF1stxA4BD0zvh/+4?=
 =?us-ascii?Q?Ao4qtfPZobL6w3Vtm4mnG0lFtPKURM+Wd+F2Nj4MljmwJodc5rZ7aZazu2GD?=
 =?us-ascii?Q?C9pgumM1zEe8Dn44SYnYXzHUiygGdhJ4Lu2XW1sh5bGgoDYohK13r69Y0Di/?=
 =?us-ascii?Q?08M6EcAm2UjoE2PIbpa0qXiWGo9jrmOonS5LOD28npdT4OfDUU985OpIzBHS?=
 =?us-ascii?Q?w/m8POHisLajvlq98k5g9vyJIYR13iMu3CID+3dwxp2cAVrYJOOuiHasazu/?=
 =?us-ascii?Q?EZw29VJ/6OcH3VgsDIoDgsSCiFnd4eniZ++6jYNZ6+nRgc5xMlEja5mA8334?=
 =?us-ascii?Q?ShMWcvFXF7BRtUBSTWY+GYuywvpSnQX5BH+UEyJSNSJDJz1XNyfD3fk2XBcm?=
 =?us-ascii?Q?Mqxeqw0/vwG9wzi4e0L0IrBS0YZT3eHUyhrVTPVa0+KOvjrOVIHOgZ3TsHkP?=
 =?us-ascii?Q?YIjMp/pIFwOi6E6gkC8/vLpNcPK6n+0HfYq8TIPlx5udNRR/dGvQ+ijuiOkq?=
 =?us-ascii?Q?RLiV7ceMKzeUK4rd4fTbUMNIDvhbaLqzx5pfpUx+Xv+HeWpMxAb5Ov1tlvMm?=
 =?us-ascii?Q?x6Y8j2Zyvmm9ZlTP3FzptHCyrxG3le/rEH+Z2c0to4+3MVMKousMv1LjHUJf?=
 =?us-ascii?Q?bK6bD+iRsZURsVyaX2QzaOeobG+VBCB3pRqEaD1Icq3Rf/MduW0G/UY607eC?=
 =?us-ascii?Q?Fe1W+V/ivQuHVAz+8QyeYvuJcKTAZsreGbWLEy/ZQsafFDqVhIdL5wo7T1uw?=
 =?us-ascii?Q?Y/IOSG5C073SU9JQs27lYr2J2FsImNd9omfK/9VJZAYjiDz/2R603TUTfmwl?=
 =?us-ascii?Q?G9/GGltxLc0cOy2/LiWch2I/X48nzWs8BEoFb/b9lyjEGM6muQdIVr5P/Nv7?=
 =?us-ascii?Q?pFEa+Vo1QsKpGG7CQWVEFMeVOEE0E2PCON0+ZZNPjOK8kw+c5h7h2Gc8BLaE?=
 =?us-ascii?Q?BqnDF1IbAs1/5OopCq3vzK8B/VW7xhqgVwk3+mMyQMrknsTowqujv2O1Xyt/?=
 =?us-ascii?Q?eNE7830/TuUByQEZQLnI14v2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 594b6514-55ed-4931-a789-08d91b9aca9a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:23:08.9155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hzu4uPgSJG+TE3zBU+wMiH3vDe1ePP8CEchOdpEPWo7a36wRXB7rrpowRQjyUYewDlCI8pdh6WRMHsdVF7l6Dkb+7HySzkbW91nBKjKs4Js=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4072
Received-SPF: pass client-ip=40.107.1.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

We are going to add a test-case with some behavior modifications. So,
let's prepare a function to be reused.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/tests/image-fleecing | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index ec4ef5f3f6..e210c00d28 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -48,12 +48,7 @@ remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
              ('0xdc', '32M',       '32k'), # Left-end of partial-right [2]
              ('0xcd', '0x3ff0000', '64k')] # patterns[3]
 
-with iotests.FilePath('base.img') as base_img_path, \
-     iotests.FilePath('fleece.img') as fleece_img_path, \
-     iotests.FilePath('nbd.sock',
-                      base_dir=iotests.sock_dir) as nbd_sock_path, \
-     iotests.VM() as vm:
-
+def do_test(base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('--- Setting up images ---')
     log('')
 
@@ -163,3 +158,15 @@ with iotests.FilePath('base.img') as base_img_path, \
 
     log('')
     log('Done')
+
+
+def test():
+    with iotests.FilePath('base.img') as base_img_path, \
+         iotests.FilePath('fleece.img') as fleece_img_path, \
+         iotests.FilePath('nbd.sock',
+                          base_dir=iotests.sock_dir) as nbd_sock_path, \
+         iotests.VM() as vm:
+        do_test(base_img_path, fleece_img_path, nbd_sock_path, vm)
+
+
+test()
-- 
2.29.2


