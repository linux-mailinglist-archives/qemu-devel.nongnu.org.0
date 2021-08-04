Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FBA3DFEF1
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 12:05:56 +0200 (CEST)
Received: from localhost ([::1]:43216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDmd-00008O-3B
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 06:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDk8-0005Cv-EQ; Wed, 04 Aug 2021 06:03:20 -0400
Received: from mail-eopbgr10103.outbound.protection.outlook.com
 ([40.107.1.103]:53230 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDk6-0000CG-38; Wed, 04 Aug 2021 06:03:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6pSfkH357mevZfYpiLdhhx6SFFDHcOur8Zo0k/JdYUcPa0zBcs2wAN3MaijHyUvEzxgDa/tdfpMEboj2z7AZNcBjOhs0ALUMDfgPUdYteSqzrFUxwytRq9UTaca2a8hm33rUKO7cUCMG56WQ8PbXu/7mQnaO7Q3LCP2jvNbwa2a1UayYZZwz/Gvzx92pG/LYRxIpaRHHcpQQo2P/DVMnL7fsID17arYE7PYX9CHYsGX1BBP4QW2uNfzBudb5O+X0hnFSw+zWKHf3sqrA3wWaYFsol4rsg9b+QzXN8yU3TZMLje3pzRurXjmA/lG4Dhy/MmPHYxDTyfWFF3nvesOBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWWsTJA4mSpeKvWuuRZm1/QbFEy6QuhIlF6Em6k/H4g=;
 b=B9JeWB6ymlfpmM+rTJ0F5APKI3Q/fg1rF308+dv8vM2EKq8/qxrlSBMxdjA4CtB0zgJguSu5sd9Yxr3Oi+Y9wADOljjlOA7uCHV0DlyAmgXzzEOE8dSJPv9wBOLbwplTpumzsgspvh6qQsqaln8csbpaDfJ8PDQmXdBUVUL4TJzd8RSZoQG2yvAKNzP/WexMVt8UwZmynUqG6EeuoqO+7YiSigvWG/Lh87mQhBUdOH8uPdcWgQlWItayNu2MRLf1rhvckwPDaRqP9fk0Z87duGtUwzis9WvxoLVRRgCXdFX2lODyrW+DwXmUthnLjoDp1ywXt9mTZDTfcXweaT7c3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWWsTJA4mSpeKvWuuRZm1/QbFEy6QuhIlF6Em6k/H4g=;
 b=gUnznIHA+yvqmsUarhuttSpwvY0zFDbY3ZZSlrTLr8o5W+2JRmFyHQu8dIDZAUIlH9IBa+9ZElfCwAgofbDnbs7/H7r7r/fPumK2Nmd40Or4LI+lPmh+l8m0h0yAJbmC4xTXvIFVwbuLGZVAt8GzCUy9XScKghS1tvT51mhNI3w=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6102.eurprd08.prod.outlook.com (2603:10a6:20b:23d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Wed, 4 Aug
 2021 10:03:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 10:03:14 +0000
Subject: Re: [PATCH v2 for-6.2 0/6] push backup with fleecing
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 xiechanglong.d@gmail.com, wencongyang2@huawei.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
References: <20210721140424.163701-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <52b34ad4-cce6-9cfe-b785-5a83096b6ca0@virtuozzo.com>
Date: Wed, 4 Aug 2021 13:03:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210721140424.163701-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0277.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.211) by
 PR0P264CA0277.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 10:03:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfa84a68-184f-4013-9da5-08d9572f1346
X-MS-TrafficTypeDiagnostic: AS8PR08MB6102:
X-Microsoft-Antispam-PRVS: <AS8PR08MB61027B9BDF678A5A6F31E35DC1F19@AS8PR08MB6102.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6RHzx/a2pk44nialMOndthU6bmEAos5Lsz/bv8Z3B6pgdsOpnNSbAXObtPtGaHGpCkIluNJpgsQwxN3+o+of+TlIkEqLGK6C3a4CwAEpN26+FcegO7dupS4RPhydNKiX3yclFmybbBKgbu/WVVZOK46XVb4x/LEEoDssuMKVVeHC2NpUXLfG1V55agKaXt042qw3LGsRgFdAkDk+KLWRPBKt39IBJ/+MJ88Hm6CXgbh1wWmLpijzdiK2ZKOOAICrCVuWvsdQsMPlic5puz8B+5XGCRPQ9y/EshXqlovEHugTWhtUTyxLjnBWX5cDR4v4y33imUgSDhIhoAQkMRlLFOVTgrGMDecN4QZWf52+g9Shwmrx8DKSnfEysqsy7RehdVG2eEwhCqvjFCEGC9x+wGfXfLEVMDltCQCGr7yGEeav5ofi2bjt+qDSSOpOZw5LG7FI5NQrjPQwLAD8WE8DqvanMHdbVeuhQmTXsjcC3mU2bMF7YgPvXs6m4+60BWjCvzYCRjqUdxU/rivEL9uYT3hawBSzZX4k6whepRAYSA5kI8x+vEEtRyxm0sOlJbrbZQNMeYP3SV5ltxoqwhvdHhab+lM1c+medEtf1mFgEY4N9m4qGRoqQdzEA+zytNLqAzjqh9whQPuPpIufLWYS0liHXyXOoExIx70nw/7vaejkkkhuvUk4/Him74Mj4XQk/UAf/VSfWp6vFIkPKyp5ax33v7k2iSGOYPdDgVduEp2ytdfdWWB3bwW7bFF2zd9DiwNQakzWbm5Y2mcdR+gTuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39840400004)(366004)(346002)(136003)(186003)(6916009)(86362001)(36756003)(52116002)(4326008)(2616005)(956004)(2906002)(31696002)(66476007)(31686004)(26005)(66556008)(8936002)(66946007)(83380400001)(38100700002)(8676002)(38350700002)(478600001)(5660300002)(6486002)(16576012)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1R2NDFtN0w4cTJkdEhWbjJGaEUzOTRpZFlGSEhKMHZDSitJaEFvcXNvRisr?=
 =?utf-8?B?SnNaQjl3RnVOei82TkY0aHpvTHpkZkZra3lYRU1lVzVMTjlkbjc4RzFjUGQz?=
 =?utf-8?B?MGk2QVBWZTJpNUhHbmZqKzRPUC92WEpuang3MU9SS2VuUVdzalJLRmMyaFBE?=
 =?utf-8?B?SGluWmhDZXBQaFlCUlJEb1RLSTlOdllRMTdOaTFJblloTTJLcm5xME9QWFF2?=
 =?utf-8?B?SkViK041Y3ZFcFdETksvVmRwL3hmUzRHVXNZNnFvRlgyTGFXUDkyYytxbjJl?=
 =?utf-8?B?YmNhM3lyYjUyK2tydE4zZllqZ1FPQmVqa1hzd2tCKzJmOHl4M1UxRGZra0JT?=
 =?utf-8?B?SUI3eXNic2ZQa0lPc2RndGpxQ1dJOEZNWStKalQwZDRzaDBURWw5eUg2SnJj?=
 =?utf-8?B?SVorOWwrZmUxVmJtR21SaTRwV0tDbmppajl5QjJ4dm5iblNkOHNWZUlzMWtR?=
 =?utf-8?B?K3krMEdhOUxNZkdUY2hReDZyUjVQck1xMFdUb1JOc1hIZWJ0bFFrek05THN1?=
 =?utf-8?B?R09XMEpZcmRnN1JETnRaSnVWblhOYmd6cnd5UnZVblAzOVErRDFqOVArakts?=
 =?utf-8?B?VTNOYmFiUDZnY2ZqcDcwV2MzanpRQTVlckJZS21WcjNGRFZZRm40ZC9zK0hJ?=
 =?utf-8?B?eDdEWnV6b2gvOHE1UG14RllhSW4wSnhKbWtENVRlUWpUQW1NMDNVOXVFRVJB?=
 =?utf-8?B?SkdrYUswMDhpTU1WbEI0ak5KL2J6Y2crZC9PUG0raUgvNnN3NzFNNDl0cVBU?=
 =?utf-8?B?dHdaRTdjRTRuendDTXduUytmeUxYU01BQ09iN3hRNitidFZPeDlTdWxGa3Ri?=
 =?utf-8?B?SGxTbXpxRmFQYzVwSm0rQm9GWUFOYlc0aU1pYVhNczlKWlZDL2dCbXpHVm9O?=
 =?utf-8?B?YUZpeTN5UmdwY1F4Mk8wbkNZRFdsTHRDN1pkekFqU3BUV3RVY1dFMTBwNlFs?=
 =?utf-8?B?UnhNako3K1FaUHlVblJZdmd3VVBYZ080YkJvY0N2K1JmSTZ5ZHpuQTdRdVhI?=
 =?utf-8?B?ZHdveVZYTmFVTXJMWEVoVjdQejhIUXpOOC83UjI5T0NsNDhxbXRYaUo2akdP?=
 =?utf-8?B?SitVd0I3Ui93Rk1sWXE4aVhhdzV4RGh1bERVd3hWYm9NN1BsajdWS1RTQ0pJ?=
 =?utf-8?B?bUNXM1U5ZVgrRFJPQlBDQ0RzeE9nZVgzQnVHMnBCSkhTbTNNQytWRFoycTRr?=
 =?utf-8?B?WkExL2plZ1RiMmk4d2ZmSnpFa0ZpUHNXK0liZGNxanlrb2U0NU00UjdBVWJz?=
 =?utf-8?B?UUNoWmVDbjdNN0VodTVyY0VZMHRRc250aFExbXJCNm9tNURIVWlHOWQrbUdU?=
 =?utf-8?B?L3lDYXRiN29VYklUL1VHaTh2UkFqMjY3Rzlxb0ZTTDVwUU1xdzBSMnRWbmZp?=
 =?utf-8?B?K1ZCcjMxeFF3bHBtMnoxWWNNUThlVG44KzJLZTNSbmhKTWlsUVp0b0ZZK01p?=
 =?utf-8?B?WlBpOUkzVVpScjFsZ2xuU2lTT2dzOHhuWVFrdnN3YWZ5Ny81Q05xVzY1NHU4?=
 =?utf-8?B?RFUvN1NTT3lpMmRuR1R2NGd1V0lKSzJVaitlcWkxZVZxblVPdFh0Y0sybzJP?=
 =?utf-8?B?VWtXQzcvWEsySmVEUjdWa0twSVJCSHZOU2lsa3IxcndmbXlPZ09CVWUzeGtp?=
 =?utf-8?B?UU1hcXNDUGRCUk10ZzVGMzdLaXRSWkl2cVJYc2xyc0xrVjhaakZXYTdVVXN1?=
 =?utf-8?B?TGI4cXNzWFJzYmRGVk8zcW9pSmhqbWtndENuakZmR0Q5QTFlSG9YQVQzL3la?=
 =?utf-8?Q?O1ttr0wf6ZOAJAeB005S0kjFBLfxE8JVsaOYXHb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa84a68-184f-4013-9da5-08d9572f1346
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 10:03:14.8886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhCm1vdnx8nXkU3oM7mQSCL6U+/dJvoYDcUwneuY1IQI1FPcOtYWzOpTS4X9U8/Ceu77Rqq5CsQak6/iGs2Wes85fOEL7aIyMGZ6iRN7JfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6102
Received-SPF: pass client-ip=40.107.1.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

Consider that as RFC.

I'm preparing an alternative and more efficient fleecing scheme, based on special block driver, not on backing link.

So, this will be rebased, and probably some permission-related difficulties may be avoided.

21.07.2021 17:04, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> Here is push-backup with fleecing. What is it:
> 
> 1. Make fleecing scheme
> 
> guest blk
>    |
>    |root
>    v
> copy-before-write filter  -------> temp qcow2
>    |                                  |
>    |file                              | backing
>    V                                  |
> active disk <-------------------------
> 
> 2. Start backup job from temp qcow2 to final remote target (NBD or
>     something)
> 
> Benefit in comparison with simple backup job: for remote final target
> write operations are not very fast. And guest have to wait for
> copy-before-write operations. With fleecing scheme target for
> copy-before-write operations is local qcow2 file with faster access than
> actual backup target. So, guest is less disturbed by copy-before-write
> operations.
> 
> Based-on: <20210721100555.45594-1-vsementsov@virtuozzo.com>
>     ([PATCH v6 00/33] block: publish backup-top filter)
> 
> v2:
> 01: changed to simply check s->target->perm
> 06: make explicit immutable-source parameter instead of auto-detecting
> 
> Vladimir Sementsov-Ogievskiy (6):
>    block/block-copy: use write-unchanged for fleecing scheme
>    block/copy-before-write: require BLK_PERM_WRITE_UNCHANGED for fleecing
>    block: share writes on backing child of fleecing node
>    block: blk_root(): return non-const pointer
>    qapi: backup: add immutable-source paramter
>    iotests/image-fleecing: test push backup with fleecing
> 
>   qapi/block-core.json                        |  12 ++-
>   block/copy-before-write.h                   |   1 +
>   include/block/block_int.h                   |   1 +
>   include/sysemu/block-backend.h              |   2 +-
>   block.c                                     |   3 +-
>   block/backup.c                              |  71 ++++++++++++-
>   block/block-backend.c                       |   2 +-
>   block/block-copy.c                          |  18 +++-
>   block/copy-before-write.c                   |  48 ++++++++-
>   block/replication.c                         |   2 +-
>   blockdev.c                                  |   1 +
>   tests/qemu-iotests/tests/image-fleecing     | 105 +++++++++++++++-----
>   tests/qemu-iotests/tests/image-fleecing.out |  61 ++++++++++++
>   13 files changed, 287 insertions(+), 40 deletions(-)
> 


-- 
Best regards,
Vladimir

