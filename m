Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB6C3F5A40
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:57:36 +0200 (CEST)
Received: from localhost ([::1]:55630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISFS-0003DM-Vv
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:57:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyd-0003my-4W; Tue, 24 Aug 2021 04:40:14 -0400
Received: from mail-eopbgr70137.outbound.protection.outlook.com
 ([40.107.7.137]:13025 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyb-0007eD-AE; Tue, 24 Aug 2021 04:40:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1i8bPasueBAozkrqOBs+P76g5KA1jyK7FjlKSs8yNXofyi62taita2iutYiAiyVJMMhl+pLqCXCwumQ44hKGCSWm2o/cLJ9YcdBnH3KB61uIdYRkcayE8WvAiHugKVZJ8nck+GSWlihy/8JlLJh4zqIGwva41wKddm2A+cC5r7LMJbrhPBqt6Glby7UhZ7MeG9BBrxKzExNWiOX59Jx4ZE1ANrrNaFTCKMC7YiT2/xZePFfjCCQwdqtkbfFm/x72v0zV/ddJdjUz3wlxUWm0kkEACUkVr0niA+OAc+FwHJQl/eCb+K0h1P54DQ7hZwLHjyrSw3Bu42M1Yioelv6ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=comyMmiZ22WDO4pGoXIo227PAq1jGSeS0rDCAQ6nEZg=;
 b=E6JB1ceZUNfC1LrvSqMQzNUjaPKGSXwIiDJvLlN9Huqoi0OMM9hcDsg4ieQlgRKz9KSAYdgfcW487GG2xuK5r3vZ7XsHPVhk1t9M4RHwRtMfmWxDF9QRQMlzwYZM0gv1QrfCKifYcdp3LDq9MGI6OjnjR+aWZdaxWwOtydZs1qH+AY5apxfG7M8tSodrloU1aUTmfAgls44mxqW0w500tiuB3sExxUdwSxvACGJo2iY/IW+1m51u5BJWPLnP4HczjRbWu7uPPn+0jBftA9UqCVvMPhX48l5blKefXzS6IvIu4njZTv6al1nrtmNl4iGzdA+8bqb9cTbryHi1EQMfdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=comyMmiZ22WDO4pGoXIo227PAq1jGSeS0rDCAQ6nEZg=;
 b=a/LbbNwwjuBaItvNIuRcfGSF7OsXpfEC7GG93t9c2dzX3AuRLNIyrX1O277JflZ1Q1PJZDL3+9+bf4O6RnAf3JsDbn5AMIAIeY4ahXqMA8OUDYMwi2jm6UxbzBwOYjm4vNQo5CMkoRPI8uig+dDwIaCqrYijGOGTfmnooyvnKUI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4088.eurprd08.prod.outlook.com (2603:10a6:20b:a9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.24; Tue, 24 Aug
 2021 08:39:58 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:39:58 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v8 29/34] iotests.py: hmp_qemu_io: support qdev
Date: Tue, 24 Aug 2021 11:38:51 +0300
Message-Id: <20210824083856.17408-30-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210824083856.17408-1-vsementsov@virtuozzo.com>
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0178.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR05CA0178.eurprd05.prod.outlook.com (2603:10a6:3:f8::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae7b6c0c-902a-46bd-19ba-08d966dac11d
X-MS-TrafficTypeDiagnostic: AM6PR08MB4088:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB408876B96EBD5E0069DC578DC1C59@AM6PR08MB4088.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lp4cusC2+H35F+YVQhl9RvSm4ybjxIT0bi99lV3xuVQM9Ncp4Z8BdJ1ZT8wDyAvJLBivvejm8iIzG/Pzbw8iM1QpdtXdmMHqDUUE50a9+RTHq86Y51096E/XS8yxv3hXfUVLVr+0WP1AXr4hhBGsVPMgxEBTN7zAcvLmI1R1+RclDzmU6+5hZh8xzBIu7LljTsxx6lfTsce11dEG2jlZjyzES66RDVr/h8M2pxoaZLJyRVNvmKZfYsN2Wn7QjNP/mEnUGXX/h5Xl8TzOUXtFuhvAFlAdQ7Wy01oZK6BGa3usCkEzBJx8UzKBdH7q5RXSG3WnAHUTYuxCVld5JnNvdJKKSB7dbSj1EM5Eh0ytOOL8FYUMXfd/9wAY0RE7d5fPIaafI9ovx6rzOsQXXxGZxO1+42BeSdoag32r0dIm+r+YEhsYFFXIhvm5Ffhcd4PkXTa68EJjIlDHLhuHFWSg0fFetn70rPBRqZwjkJqLDjLUXj732mqegJCqCoHTeOo/MzQktUrqrWyb3FTkLGTz90eKGoy25F4qFQ8Nf+uBjS2AfgbgEniSeYLJ1nw4jeU8RRRc2DuN9Jb5lvCX0KLg9tWbXgdVEgxtJHHweHi3TmheF3shj9qRywQwiJ3Y673anQDxvopkWjUxsVi/AHMC8+/58/vJpDNtnywf6jbeTX/MbSDE0J8I3kPUgIRh3P2rN5hQfkqnQorL6nTlcwt8fA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(376002)(366004)(396003)(136003)(346002)(1076003)(7416002)(83380400001)(4326008)(956004)(6486002)(38100700002)(38350700002)(8676002)(6512007)(2906002)(478600001)(186003)(66556008)(66476007)(6666004)(6506007)(52116002)(4744005)(26005)(8936002)(36756003)(2616005)(86362001)(6916009)(316002)(66946007)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N744B5xYS6kblJ4CwSM7PKvg6qAv8IKQ8WqQ+tf421z51CgnTibGL8G6egej?=
 =?us-ascii?Q?doWcsQqPTdmGMUJr8EmHHdEFM2mInRGFiR4onUBThxKxqPDScJh/kISGEscY?=
 =?us-ascii?Q?NDWNfb3eHBE3Kb/y4rQ/NFE/w7aADCEDtVjiw/CPzS2NDBlbqVZBcj32FxOy?=
 =?us-ascii?Q?Bixk8ElIGXAWr/qsgJk36RK3a0EEXBiq+Ey3kvHshK9ardQvRe/aKAoudpHt?=
 =?us-ascii?Q?mfo1yaNHoK11UntDdgMR7voYL3Z3YAUuhdppgOBfNMylAej5zj26ghH69Vn8?=
 =?us-ascii?Q?+O60wGEPXvkvplHDNAuxGpDJMgTf4ss8IOfkNwUK+98SfUqZVqcjDOCgLjYP?=
 =?us-ascii?Q?ybY50TSWCaTBijUKB00sbiTFM64yQlBAilzcZbV+jp1L3fVsAx8/9gY9E1EY?=
 =?us-ascii?Q?mNJblu5D+8vgcdXA4+Rn/cbivyvA/DBYQAG0Z1FYt5HYtt3yBVSXM+r7Vfga?=
 =?us-ascii?Q?kk2+tLRKj9vTeFX0ZQeHJAo1xfSgLNpXw3M0E/dTQEJrBtrlhfuAiRG4DVC6?=
 =?us-ascii?Q?pWa5Byat1Oaep/n0HAQ7XRhlNugizJYwKPAd2cbKWHtu4FTmPhMgkIOfEmg7?=
 =?us-ascii?Q?R9lrHd+82HnQ4qUOid8p/GSVw+O4sBvHX6eib9u+nD3xyJrIEa+nmHkU0zow?=
 =?us-ascii?Q?IBfLjQEtU7gQeDa8wWgSChBFoomGVYppd7/9Nnw36qOSFJH4n3eWuWgpqJB7?=
 =?us-ascii?Q?c3Qs94fk1kP8QXYTROGGJ18TJRg+z5YBJFXVz1/2dpPNnp0eZigGx6gOG+oL?=
 =?us-ascii?Q?kTXVjoxzQZeY8g2+KMpI8PsFR70d/EPdom/cJxheWxyhR7t4OUuOncxfhEJD?=
 =?us-ascii?Q?4mrn6va67JcblhED8pwcuRn3hhakRu1PBh4fNXx4IwN3J5VglNv8k4KPEA4q?=
 =?us-ascii?Q?odrU6sr4Grovn68g52mN2bUUfu2SRti/oOX1y/VY6nMsU265H4BUQ9roC62h?=
 =?us-ascii?Q?jHiZE7bJwuxR9/PP8CvWEdJg/Oqy9ROjuIWG9Jmoerrf7CfvBxgOeiXiTFxF?=
 =?us-ascii?Q?MMlXci+7lc3Hf6spVZEhM9Yzpxv61tQvCoYvPNBX0MIQgeo8zjvqWgayFrbt?=
 =?us-ascii?Q?8IkOUTe7UgkdR7VyCAUc/k2bYLf3jndBZd74IhSvPhskx3TBevz2awb1r3o6?=
 =?us-ascii?Q?VPEx27/4l+R4f7I1tQjwrancgvXk6Bghq0ZnXuPApkHsJa74OasO2uCfenhR?=
 =?us-ascii?Q?4PjgBe+NcDCKMuZTlUdw5/natPU7hfgund0laFLV4+MVfYqLE0w5F3GgvQdb?=
 =?us-ascii?Q?7YnFwAppv0WwqlgjsKsHcfs2xMm9Z8BtaxqQe+hsvMfBrMaSS+6Q7EN1kUUs?=
 =?us-ascii?Q?vmbXtw6t5HVGLf/gXn/6wSKa?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae7b6c0c-902a-46bd-19ba-08d966dac11d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:57.9863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N3UFbBc24W7XqiemNk8tcPLXVBK16sS0no5iVT+j6InZBfu9h8A3WSGcK4sDzXs65dASnKQrs01gCwKsc9f+PCglkPhtxmHu4k38zsSoW70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4088
Received-SPF: pass client-ip=40.107.7.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 89663dac06..77efcb0927 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -651,9 +651,10 @@ def resume_drive(self, drive: str) -> None:
         self.hmp(f'qemu-io {drive} "remove_break bp_{drive}"')
 
     def hmp_qemu_io(self, drive: str, cmd: str,
-                    use_log: bool = False) -> QMPMessage:
+                    use_log: bool = False, qdev: bool = False) -> QMPMessage:
         """Write to a given drive using an HMP command"""
-        return self.hmp(f'qemu-io {drive} "{cmd}"', use_log=use_log)
+        d = '-d ' if qdev else ''
+        return self.hmp(f'qemu-io {d}{drive} "{cmd}"', use_log=use_log)
 
     def flatten_qmp_object(self, obj, output=None, basestr=''):
         if output is None:
-- 
2.29.2


