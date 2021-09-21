Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D2D413195
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 12:30:05 +0200 (CEST)
Received: from localhost ([::1]:51024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSd2H-0002dv-CI
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 06:30:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSctj-0001iV-Ef; Tue, 21 Sep 2021 06:21:11 -0400
Received: from mail-eopbgr140125.outbound.protection.outlook.com
 ([40.107.14.125]:6053 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mScth-0002LA-NY; Tue, 21 Sep 2021 06:21:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sj8TkRhZDtlBIQ6Wt2Q2SzexBR7fayoMbViuJ0sLthmtFqhZNeEzjEATO+YXRPDZ8zAsdEx8xKjp3VrrlOw45QNcwuowlUsaZlqGtlQdaI0VH5KjYmA/NPh+uzHIHj2UvMCfJYNfhyBDDqL9T8BP7cgn6PxnIr/KZMygRKYm4hEoTnNJNWIyrsvscGIzYQ6sgp3daRN8pBDTBE1FAJKOoaqeV5spbsZZwvFrZErwBPIZ51bSsG2Ur8cJkWUYo818eBdIchxWpzVizAkedZE0aiGKg81D4Qfw7ZfJ3BXVVBOJAFHRxqNtDOccDaPbVSOdA8VAiSHGL3EvWEvOTV52mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=u9lySSfMpZdn6DCAK7M2drBdaju30zyu0LdPb9dS29I=;
 b=GBBdVN+XioyKSyfgwBqHPrlsVUHEL+3SJMH1YQ/nIPLoZaTZMPklQmfh3bRu5EEfL5cd7iC7Rbn6c0pOeLNLV6Hslu8yFOWU66FQMTKGh5yLGy7ELjCBWvKzlZyBzwh8mc2FWfqsiNu21v0gPXSFzRJf6vxFnt/0qstra0N1R0iC0P7T31XIK8r7GY8UP1avU0PurjK7m4yOgIEJJttRubMbVOEfmQr9qmtVo5xB+dHsX/1bo8QIM83pxrwt+PXJr9t07M5BDszzSohlg2rJQT/B2dC0MHhXukPIgp96i+XjGoNgwrnVLKif00IgbgkcoZ6g1T95vy6FmjpXNJvQlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9lySSfMpZdn6DCAK7M2drBdaju30zyu0LdPb9dS29I=;
 b=gtWWyWrJU7MWE4RfLthfS1rfQZoDSDvrAummU8Hg3lpkAsz0zRJUb1VkV2naITaUCs4sB1dSwFP2Nfu6YZX4J8/Xit7dZsb6nHTjetpxcXby4eCcJVJ3AVOQ6H+cCq7ca30Lt4hBD8TkqKWpZS8eiV+1VPGlcpZ4pxQNrMjLcdI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6631.eurprd08.prod.outlook.com (2603:10a6:20b:339::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Tue, 21 Sep
 2021 10:20:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.013; Tue, 21 Sep 2021
 10:20:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, kwolf@redhat.com,
 hreitz@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: [PULL 10/12] mirror: Stop active mirroring after force-cancel
Date: Tue, 21 Sep 2021 13:20:15 +0300
Message-Id: <20210921102017.273679-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210921102017.273679-1-vsementsov@virtuozzo.com>
References: <20210921102017.273679-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR06CA0127.eurprd06.prod.outlook.com
 (2603:10a6:7:16::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from localhost.localdomain (185.215.60.205) by
 HE1PR06CA0127.eurprd06.prod.outlook.com (2603:10a6:7:16::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Tue, 21 Sep 2021 10:20:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d9fdcf5-bd1f-43a1-5cd6-08d97ce9795b
X-MS-TrafficTypeDiagnostic: AS8PR08MB6631:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6631828458AF54E951AFC373C1A19@AS8PR08MB6631.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:404;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cTXO660xMbSaP0tUUkp5ofK/Ap7tmWg1IbKDE46f0oMNyM2fZy9kRY+TGrMm/LXjrzV1zgg233iwjbifrDv7ZeO3WlTtu0kc3ZK0HKcxhnofkd+fDcgZO4ZoXTNu+RH4S4qAa2NblVIIiRqU/sPvPT7zoLjpKEa6GjxYPOQpWpUUVPL8LfFK1HSUST2vknPj2800HbrMa9EvKYZh2b3TGrpZdixyqA1C9IN2wCLwKieGAf8PAwBihHTWTKwf4WSFE4zE032Fcc3xkMsF4KoeHeZCrX8lLS0sdSINSAsf+gR1vFQ7RRHEmq4+T2Y8z8h01ZBwyVeNRLg2QQ/TcuH4PpvygGioGTtuwiex7i2aH5opF8CzVa1xET1yXD3dLOfThwj13BbctjgjJCFajWyrzbPF68XmLTzgtKe3xIWTbZGZRxfk2vomkIVW4JnNeuT76ga5yFcTe+Ie7KBZvmnIBpyYxopvaSYPhHeCRzJ545gz2V5rila+O9t/CN+jilxNNPB9iEEScOSKckhI1cEZfkgkSvlD8W1nbOqzBh1oIEKkjBfFLDt3A30KQHEBRobQv+bBxBnk4AQOAgpaEZ7eIBn/9qJMmS9YkCvCbroa9eoozQ66lud2mo7kVE8Fo8Pcfwrv8sn9XNH4eYJVl1r27yHmvTzZvBx5jGyC04TeBWi+wP75TVADHvsKfVb//uLRqxAJYfzVD+oM0zzWzakM8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(38350700002)(38100700002)(186003)(86362001)(8676002)(316002)(4326008)(6916009)(8936002)(6512007)(6666004)(2906002)(26005)(52116002)(5660300002)(6506007)(83380400001)(6486002)(956004)(2616005)(66476007)(36756003)(66556008)(508600001)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QNRaBO0asHuG5XaDFBxwH52Syxx9dJkC0jkp/DehS9EYxiMZPD2dDz4OoqNT?=
 =?us-ascii?Q?5FaClZrdMRP716t4NlZoSMaY7PanB9BIYDfL19Knld/KaewWAF0sZPfZmCaI?=
 =?us-ascii?Q?/ZkWDkPchDlfmVla0cconGiFr1A3soJHVExB7rTpt4dYqItSgP806ffrrEL0?=
 =?us-ascii?Q?X674JtoWy9OjvXaHyhnENP2fg92bEa9q51Eafjy1D6n0JJ2Ce5gT0j2JoS1m?=
 =?us-ascii?Q?FwDqiiQBbcbAIFTq+KnfIo1lhshH45MXLBqTDBj1ZacLMSW9FFQ97e7svfRV?=
 =?us-ascii?Q?0ZweGnCP1Zy7h0Wer5wWETdUPUVp8QDn+CRnqlMcTWjapEh42jDYKUHo+mKw?=
 =?us-ascii?Q?F6F+yc7Kx7YIghezJk7R+EDiWzvYeryiabIk0pL4cN67G9YQk7b1ImYfJCGJ?=
 =?us-ascii?Q?G89ijGk9ghq1WDTrAGmM4G0sI40G2ACBuLzrLgQR8YtAVRccKCsGkkfZjGgo?=
 =?us-ascii?Q?T4IIkgub7QY8j/2kpE5JJHe98Rbzay4ltTQvWES3UgxgW+It+24H4607p0d8?=
 =?us-ascii?Q?d5MM1inu7KuOzykT34B3SI1ZOYHnsGZDT3BkWjhbneCfbjgbXuOX+WYE1dsG?=
 =?us-ascii?Q?jhY4FQB7itOyGKfQl1REUl8l1BFutk4gfkv4GNIpnHBoD4VOLN2h6wUbDq3T?=
 =?us-ascii?Q?cN7+NBesJPPo9upmHiaSJ7NuYkrZZGSAjJXiAhItjCoSAEDErrG5h2WUvI8E?=
 =?us-ascii?Q?NXIyMCvrpHJ892plkO17zKm0LeQp9JI/XNy7NexNxoc5CfVeTj383KyD7jPq?=
 =?us-ascii?Q?lzI/6aFKy7pD/3DBiKNG2bcGyF1YirkOcjpsAMR/i2mfpg3My73M9pKzcJhF?=
 =?us-ascii?Q?zAZ62e1weeIlbwTBmaTFkDIESy3/ET/rRaxCmhkRZxlkDWDCZWU6xV0vAW0g?=
 =?us-ascii?Q?m54LqotqQG0fPNSC5chWCcpiPDB6bt7cIC88Ja7/jdokiSdI3bf2sOqwIBWA?=
 =?us-ascii?Q?KYfh3oxpel94PUg4Fg7/QnYW20lYOn3EXtVzQ6AyFFY4fLLwjSXfcBhlckNF?=
 =?us-ascii?Q?fEKin5VDycaJuIewOKumnK7ctS6Z5XVcZcKvt8Zd43vgypEJnQ2hdwmNOVnN?=
 =?us-ascii?Q?EXz3JlqTJlt+ncIbcQIcZL2B0fz3BrXKO45pOK+axffR8BMmTRWI//GiEQep?=
 =?us-ascii?Q?+FJyuhHg0REY3XuLKxsfTld1yVNBkRmUeV0FSjNSD8MiHNMxESnH4yEcZYm+?=
 =?us-ascii?Q?8Ip3vFiEg7vpXIx6nkRMxJmf7sf2Dp5pSzqfRKAH6QDgkq7P/G6/QGDiKD9z?=
 =?us-ascii?Q?Pzy+HZOQjqTqze9WAb01C0K8l8Z1ZPAWoDtW4xhEgH3AK9hgNKfYm3S2ry5e?=
 =?us-ascii?Q?RShJN1dlOSoEAHZtepjQFuJe?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d9fdcf5-bd1f-43a1-5cd6-08d97ce9795b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 10:20:45.6264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QYjqTd+bGA1ZvFzLx7a7aJqC1WWIbYlC7vtQinkQgesceV0EmLsFPqmWZkOdSR0ldGVY3EHkOqRNtiT2wKtnK7HcBZ4INfRnyvq9g/Ib1Eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6631
Received-SPF: pass client-ip=40.107.14.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

From: Hanna Reitz <hreitz@redhat.com>

Once the mirror job is force-cancelled (job_is_cancelled() is true), we
should not generate new I/O requests.  This applies to active mirroring,
too, so stop it once the job is cancelled.

(We must still forward all I/O requests to the source, though, of
course, but those are not really I/O requests generated by the job, so
this is fine.)

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210907124245.143492-11-hreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/mirror.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/mirror.c b/block/mirror.c
index 1dbf648311..bbf5815fd7 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1425,6 +1425,7 @@ static int coroutine_fn bdrv_mirror_top_do_write(BlockDriverState *bs,
     bool copy_to_target;
 
     copy_to_target = s->job->ret >= 0 &&
+                     !job_is_cancelled(&s->job->common.job) &&
                      s->job->copy_mode == MIRROR_COPY_MODE_WRITE_BLOCKING;
 
     if (copy_to_target) {
@@ -1473,6 +1474,7 @@ static int coroutine_fn bdrv_mirror_top_pwritev(BlockDriverState *bs,
     bool copy_to_target;
 
     copy_to_target = s->job->ret >= 0 &&
+                     !job_is_cancelled(&s->job->common.job) &&
                      s->job->copy_mode == MIRROR_COPY_MODE_WRITE_BLOCKING;
 
     if (copy_to_target) {
-- 
2.29.2


