Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3174B3C8950
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:05:38 +0200 (CEST)
Received: from localhost ([::1]:37884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3iKH-0005us-6Z
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3iEW-0005Ad-3J; Wed, 14 Jul 2021 12:59:40 -0400
Received: from mail-eopbgr10112.outbound.protection.outlook.com
 ([40.107.1.112]:36877 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3iES-0005As-UL; Wed, 14 Jul 2021 12:59:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJq4Z9cDq3rP5XwMpCmuJVyA55e+aBDcBR3dONusjauw7nvs48NF7ZTOOSpIkQhAwd7igOA1odRxnwDnYojrAbU1vpURrwBOuLXkJ8B2EYQ8j8SLSsMDHqOF8YqMMKNXLZsO5wX6oxpAQ9Y3DP4sG1iXXLqhUs33UmrEcEBV6n+/do3JTaB2UpV1cnbNUOmMppJ4nku0lhcUjaL8DzglNl3EG7t384oLTWS4TaCh8oqeE2M8LdLHQzvwwkuUUqGBhAhx+jcv56HM1qsqexFJmBKQpY4VEjVBjVdatBTIGksMy9NXdqrjgBYerkDyDwDP5xZlAZ0X7QEE0DCZ9h8Kog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFBHsR/ZrYaIosFd9DZ7qqE/BuHMnvGbMnnvu9ZpqE4=;
 b=asMAofU0aAgF1JuOuAq+B0sigzrys74kd7Ye/9t86Luv1wiYqR4yU4E5dwNoUYCweaHdBygbwyZIbzrrQbVji3SfLdUs/BVzqNnYNzJ5xDLXf4P37mOzsB4nsM0GpSt7agM5IswO76NlksfxZCRoor4J6ZpCc96oGVxXJm70EfgxC2ZKvPfb4t65uE5FKqas43zIcjGLH9RQjmTk9m6Pk9TvUYjXAJxtn+XlHK7BdJYICz3RqxmnKlb0sPogywUNg8cNeMliksrv1wEx+DNMYsGxXFqBlzbsFb0HfQC72MI+ortkVFOtpuoETDn5ExyMah0Y/e761Kxh6iOgIuooUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFBHsR/ZrYaIosFd9DZ7qqE/BuHMnvGbMnnvu9ZpqE4=;
 b=qWYsVFUs1nEfDZlIKfrdJXEkvX2y0mmIzUBLLn7Ba0p75XviJxOAi9VMg5nM4LtqU0aw0eGr+6Ltb3t/m1hXaoS0LHfWjwAjyPoEedBUIoNG//CfROpoKfNWo5heWmrfzoshf79zVplRJzewuOvQKSGOzwmySmOwhDkmTkKDZik=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5334.eurprd08.prod.outlook.com (2603:10a6:20b:10b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 16:59:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 16:59:31 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PATCH v5 0/5] block/nbd: drop connection_co
Date: Wed, 14 Jul 2021 19:59:11 +0300
Message-Id: <20210714165916.102363-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR08CA0077.eurprd08.prod.outlook.com
 (2603:10a6:7:2a::48) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR08CA0077.eurprd08.prod.outlook.com (2603:10a6:7:2a::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22 via Frontend Transport; Wed, 14 Jul 2021 16:59:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 328fe033-72bc-4908-9d00-08d946e8bf95
X-MS-TrafficTypeDiagnostic: AM7PR08MB5334:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB53340AC478326C4BF148ACFCC1139@AM7PR08MB5334.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MjHPUDduosipGBs9sb0AVOYSM0BEf0BpM7jokq3517yhDBHOx5eX0sHI0zwqHOHyDBVTas9Gf5+IeOgHwBpf++ekGjV83qPC9dMGgtW+snCPrZSB7SzDKvng1bT2RCyXH85oPWO8bRQWa69Nf9OItYvTF5uO+Mic9lA0oUuazEKMjQEclg9XrZp9iONUkqMTDQuGzQqZOHR2JEcqbubZVQYAZu/6H283y4RC1rsShjFcPMJMdsiEslyuWQ8zi0KYhZLo0dzmIj9h9PiMEDekKOXksWSB0/RY2RQPShtbSuR1I9eNaCkpvMM/83pBhv62rNknN/nULQo8iWm1o6Er7khrrgSgm+zyT5FeqF31vGc99PNoAIYc8i3tYdNIyQdhHL5cNzBx7oUz1kZTAvkkkjB9dlFMI2KVImHaFq9UBI/cehSgIpmpxx6N8/83N7hDYHjPLeOGOIfI1lZWu9bkaVoxXcKXYmIunO4P5aU0Ckk9a40ciECmxXuzOuf++ptoIpPKVTEv8GrJG1bmtpXysqncxHyLEaU5P+KNkBQnEppRBK7m3I17/lxi2UD9LmpYPE1Lm+kgD9wD+RzECpry1jlt1UvOvN3Ye6NGK9cmExrjeFndqYdprDXssdu/mCZixwz49ulEbYWt76KitaPvabNf0i/CgHReQXH308oQbUBpHRroQKs99tRruM0dWivfgRajmPdRjePgVb5uq4kp4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(136003)(376002)(39830400003)(36756003)(6486002)(316002)(478600001)(1076003)(4744005)(2616005)(8676002)(83380400001)(956004)(2906002)(66476007)(66946007)(26005)(186003)(38350700002)(38100700002)(6512007)(86362001)(52116002)(66556008)(6916009)(5660300002)(4326008)(6506007)(6666004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ndh5cjAh0qieO3FQp0Z/VXcgzFWvKOOGihrjBsQevJTXlhbYL2MT35LaHljx?=
 =?us-ascii?Q?r7cr4RNSr/tioija3Kx240wuFWrBVhtW5vioFcdW0dzwL2YybA7+xAY0eukL?=
 =?us-ascii?Q?9+wQBX+LexNodfeYSRmW3KYbG97Oa4oBu1ZFpqgv9uBWoFxGyIavAftq22dC?=
 =?us-ascii?Q?wT+dmfK6oZOOpniVBgck9HOPGSf/hYFyq/YCh1wvJy9Hk93t4Qsmh6NpE0IJ?=
 =?us-ascii?Q?tk5KyWPjHaU0+/6WRCpF94I1aVZBQRnt42f1pMoQjbQPOSfNtFpFT/qDywyX?=
 =?us-ascii?Q?vnFUR4Ron7cSC0L+MrXSvb9uIc+UwgHaPTXSlmJufhyBcVHkf5JN1RxcXgUn?=
 =?us-ascii?Q?k4uRTpnh07r04w61+GuX8kfgIH0c6eQK2FdyOtJE9NoZS7A2CdEuRlwqFnO3?=
 =?us-ascii?Q?QMgxdEXOQWMjWPMv9JDiacQQqfgXvi+6fbFutQJoUbNgyBp5zq+qBFytJ6fs?=
 =?us-ascii?Q?IhRUKoIx6NJ9X4AZkzs8NsLnedsgLiN+RvTeWsd2Kq8sTYyEuTx4S+LwiVRK?=
 =?us-ascii?Q?kAnOkPIDqwoXHg4Es6oB85PVnESsIhSAjbLjFx9jSfIDmQY3Sj1joBtUJsUG?=
 =?us-ascii?Q?6K+I3qEdQGe7vrse3dgHXv613FM85MdzkTNaR5tU7vNlEs2uPRMZ4HHGIclp?=
 =?us-ascii?Q?fBxvctCK7meliOGcf0Sw05rY/7PnnZudvUL5aQc7pXd2jFTzBYNWRLzzMiy5?=
 =?us-ascii?Q?iN1x75Y3FmThdiE7Y1NuYKNJYBRxBs8fwO1RlMaG7NYionTTaFixgJEXq/yD?=
 =?us-ascii?Q?Kp4x+jp0m3EUV1HDeUY7FlN92b23LIS8+cY2n3PfpBOMblSMAoPeIACppadX?=
 =?us-ascii?Q?n1AFC/g9I8uCoSM5mDB6spzznBJVjGcJcshR+yQT8MryrnymV1lAKlBsdtRr?=
 =?us-ascii?Q?DFefsjO/o9Ic+nnUPm7fmGRxFCGShd2xXuDS3RhzMuqmC378vpLuVQyq2OkY?=
 =?us-ascii?Q?0f1ui5raoJea2F/iXtLdkzN10mVc8RdogXZV9af4CchHO4hNxXlQO4yQOvAD?=
 =?us-ascii?Q?XW9ROlOQPr5FpfyNF/vg2qGvCWM09eEpu2aLzt3trioOmmgRr+4k+3u8zmTK?=
 =?us-ascii?Q?lCYhE4iTYail2MuvczDZuIYUlNFLoAyF5h1+vjzXXlAyqXhbdhUJZVIh5E8q?=
 =?us-ascii?Q?WsdjnDBoF8qGm7m1UYbHOtO0eXZCJ/bD9pjqkcBLgBncU0WunbFoMNVlV29a?=
 =?us-ascii?Q?EDnH4CfMXJNiIFw6uRBw/JKd9t78X3JQvIrXo5jDC6aU7hqM7Y+zL8CN5+oP?=
 =?us-ascii?Q?1WdEtHlSUYVylClTOpbkJAUAyM3cTXXp6QpBzfXFmILglg54kiYrGIwH+Suk?=
 =?us-ascii?Q?8IqVx5kzvTm7l2fEYOg+9Gcq?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 328fe033-72bc-4908-9d00-08d946e8bf95
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 16:59:31.1908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +gRSsZ5hbTDQPL8J3PFjQvptInz/cPpMWgK8QAZcFgmTpAcNEIoissq6G7dyFUile2MkkHGIBSnvHq9R2TQwtvAJiKK/xg24qYSkqVcZgLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5334
Received-SPF: pass client-ip=40.107.1.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

That's finally a new version of
  [PATCH v3 33/33] block/nbd: drop connection_co

(v4 was sent and merged without that last patch of v3)

I tried to do some things in separate patches, but still
"block/nbd: drop connection_co" is big and complicated.

Vladimir Sementsov-Ogievskiy (5):
  block/nbd: nbd_channel_error() shutdown channel unconditionally
  block/nbd: move nbd_recv_coroutines_wake_all() up
  block/nbd: refactor nbd_recv_coroutines_wake_all()
  block/nbd: drop connection_co
  block/nbd: check that received handle is valid

 block/nbd.c  | 412 +++++++++++++++------------------------------------
 nbd/client.c |   2 -
 2 files changed, 121 insertions(+), 293 deletions(-)

-- 
2.29.2


