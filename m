Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EE7442EDC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 14:10:55 +0100 (CET)
Received: from localhost ([::1]:35172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhtZ0-0004qO-8B
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 09:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mht6T-00079R-Pk; Tue, 02 Nov 2021 08:41:27 -0400
Received: from mail-eopbgr60118.outbound.protection.outlook.com
 ([40.107.6.118]:57469 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mht6Q-0007EB-RS; Tue, 02 Nov 2021 08:41:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fiUrQqIyeGi5XG7tObV+e2zy9GujBelxtq8vh1cdcBwnLmcav5/x+3WkyFaYFOp38dq0yplTRqnCj5OwGz+WQzzilnokpa8onTtvWs31efPiPFmF3UZIUzhiDChWqPN3W7HaH38Aac7aYGbJAk+ubiCWDnbGPXATMRfnf8K4IXBY0HYgZHWBhUKHLKimkcW4zK/i9bz7//A9VIdByJRuz0GNI2/FPnZN6l0rfE3GpTlt5WD02pM6v0kunACytFZkMJPEB2s/X+DT59ac9wo/MH+hUa8DXPV8E15OBmLTUSU75Kcqk36fK4zxiAnPykkGm2R3MqfxpN76l1LiRsIfvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LeTPX1NCKxNySMDXLF0WGB91NSAFufBElLPFZFEuvG4=;
 b=DRN2yoyZ9oOR0zRa4vH79cZCNKYs8nazl2eQi7MrkSo6CN8fwMws5XikSNSXimYwkfSX4lTnwvT9622PUMzz+t0hF5b7Si2DVpmDo+9rG2xM0tC285TbA7hcDUBU3G26NgoCKaLdE/Cug7Ylzx/mxosy/7uuKn3NiNVl3S2L/7K+fLTAgStnVFD16h3Dz1I3cLL7i1G2EtFEOIxS+/reVlUK9hGNlRyk4qV9iFt42xC6XXfGJsMKuVBsCy293slDJmRyLPVcIHlRQLtDWDyWOiDD/kFfN2wPF5/4dCt+4LDgiRGE+HvBMnmxu7g/OAPWPaE2r9oGuxPdrSZtW/Es+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LeTPX1NCKxNySMDXLF0WGB91NSAFufBElLPFZFEuvG4=;
 b=dVHELUBh1rHaSJqpG3ANRd4qeOYL5yv+4O6ySIof9vTKn2GOrXhuq5vaUH9uGL0h5fRKTkJP7fa752MNVopS+kRpXlQYfsltwTHnCCXuTkakf+ZWj2ar12a+74R7fu9I0yHleFT15DKTwOQztyUfBgi8PmpCyexbqF2fz4szBKo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4471.eurprd08.prod.outlook.com (2603:10a6:20b:b9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Tue, 2 Nov
 2021 12:41:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 12:41:19 +0000
Message-ID: <a19af72b-3b81-7181-15ed-2bbaa50779fd@virtuozzo.com>
Date: Tue, 2 Nov 2021 15:41:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH 11/15] jobs: remove aiocontext locks since the
 functions are under BQL
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20211029163914.4044794-1-eesposit@redhat.com>
 <20211029163914.4044794-12-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211029163914.4044794-12-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0101CA0001.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.243) by
 AM5PR0101CA0001.eurprd01.prod.exchangelabs.com (2603:10a6:206:16::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Tue, 2 Nov 2021 12:41:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57b6a523-2342-4955-b54f-08d99dfe1198
X-MS-TrafficTypeDiagnostic: AM6PR08MB4471:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4471B7E69D0D02D1C068C8A8C18B9@AM6PR08MB4471.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wc174Zyy5//zsmQ1l8qIKxd5KpbXt0nPRLhVDglLw6KRLfHeM84cvouZZ6HJHKM49ZPtRQrZ6IO8RkTEcEoqQoqE7UnvwlzL9yI24lVnEbWfXvaghnWEUIcnW1QAqVnOnKpyTAMafXQaes8ZgLfU7j7n8z7ZdkKa1uBxq2ZZX414z1x0d9MrIs67E6gfFuR0t8qVzZisCXvSN02MYQHi2QyKbSIyVbzjijLYSE7mAcgRfkmuBORfa1GLklO/nBgUPTAFToaPZajZviJd+nPQ9GfyhDT+vwIeS/JyUj4eS1kfc9rUUhE1iZqzZCu6kobv9YtFn110LoC0cOSA1Uq/MWm7qgdaZ49S26gVlY+q6Xjoi5TFUC7ttyyzDtn4vfMzz7nBusbZafjezuviuLtkkD60JoadxceJTfor8DmeL0dcGdvfnx9z3pBZblHEZyvGgLxb5OKoMyRkPrMTSMMNfpxF01tpO3LXJgjp8gVsg1b6KqXOQHZwr35zCMhy9WJp7qFT5VM6gRx6khAqvd6uqPBHgoQdeSdX2OdPhNlDRMR7gkfVIbINwZtwGx4kkm+DbJklBuw1s50BgVUY0QdU/eXei9wdmMBZ+wHeRlrIa7d1zVQRrMpbkfe8s8XIP3jD12NjTVsElQ64MoDjdxNG12sL0vpZ2HdPh86y5+pl9J7fV4Djz4KK1dy6SCPbnvxGjbLazFGMhsGmQfFPdoch/Eb+x9PQue46WwTvLPGApyY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(6486002)(2616005)(66556008)(83380400001)(4326008)(31686004)(956004)(8936002)(8676002)(186003)(38100700002)(38350700002)(66476007)(86362001)(5660300002)(316002)(31696002)(7416002)(26005)(16576012)(2906002)(508600001)(36756003)(54906003)(52116002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGRRdWRuczRJU2xHN29tejJwUTVtOGdidWZOM0d4NWhvNWJOZEs3UWJubUF2?=
 =?utf-8?B?REJnbGd6YWNXbTNaaVQ2TmxmUEx4TUZlSmFTU25GUUZWUXBSMUFrK1JVdnlQ?=
 =?utf-8?B?UEJSU3NkWlExQ25jZG84NWxoZy9WelR6ZE0xMFZ3dGFtbnpDNkNTTjBJeFIz?=
 =?utf-8?B?MVhYYjdNaTBtUlozU3hOY09CSlZEREtPN1dtNGh4RFkwM09lUk9ZSVQ5anJk?=
 =?utf-8?B?bVFuZWRMeXkyaEhOSFFBRkJpczNnbldtU0Y4c0U3S3J0d2dVZUU3YTFuaTl6?=
 =?utf-8?B?MDljd2FMaUd0KzZFY1lVcjNFSDg2RUU2aFhmR3NWMjFGVDQ5NVVNeXQ3WWlu?=
 =?utf-8?B?QlRpdUhsYmFiTUxTb1NhTml2cGFiMVRKVmcxZHdTNXJnN0dBcXRkRjBKRXla?=
 =?utf-8?B?RWxCUmF5Sk1kckc2NExJU3hJV2l1bzlRRzN4eHRwdEhTMk5LTjdjaVUxa1VW?=
 =?utf-8?B?UENqTS9ERDJLZmlqb2l6bCtYTC9WejNRNEQ5bTRROHc4RE9XdiszaVFRaDVB?=
 =?utf-8?B?UllSUjBaOXRXY0lVVmI4OE5PVjdyYysydXFWdXdNTTJGcTBEUnFSekRqTTgx?=
 =?utf-8?B?ZDlUWWFXRStzV280M2pXdkRmM3NYRHd2eWZVTmR4RGkxSHJ1SjArMXFiN2NH?=
 =?utf-8?B?SjdvRE15K2NHQS9HeVd4aVIxd3VDbzR2ZHVlTjZMekFLNGt0TWFPTXFsMXBQ?=
 =?utf-8?B?aENoR29OZkdURC9ITUlLdUpMelgxbEoxeXVGclhZZWV6NG9BandkMkhSUHNK?=
 =?utf-8?B?WC9FV3NqTUNPaDk1WjdDSFFYN2ptNFQ1bzI1bk5JVERYWndLb2l6bUU5cUUr?=
 =?utf-8?B?NFpRN2QyU1duODlBZXdxRFpBNGtuRWRzZWRYVUl0NTlLYzhCWjYrRXB6YlhT?=
 =?utf-8?B?VjM2OXpBdlhVV2tHODBmalNJUFJGLzdmMnJ1L3JWTXRiR1d2TW5saW9PdENF?=
 =?utf-8?B?NUlKOFQ5M1lQM0JUWDRrSU95RWw5RmYxZDhzUzFTTENyVFJJY0c4alUyanNN?=
 =?utf-8?B?R01rTkpBaEhBU1kvZlorVFR3Ylh1NEU3TnJGaXFTLy9WRXJKZlNiZ2s5NlJC?=
 =?utf-8?B?VVRsYjhab2x2OUdjc2s0eUt3NzFPYnJEUXZWVVM5bnZmUExKNjlSOWx4ME1o?=
 =?utf-8?B?NlBNU1RxUk5NM0RHNzdNQXIwR3ZmK2lqemUrNUtMZkYydDVzY0paWTBnREF3?=
 =?utf-8?B?QXFYVytCaHpMQUJqTkQzWXBOcFNMR1hJYzRBTGlPNDhjeXFzVVlwNzFHa2p3?=
 =?utf-8?B?cVd3TVhUK0QzeitqL2Q5ZktkWFBQZTlQUzdoblVNRDNKRUJVSHN4dTJrczM5?=
 =?utf-8?B?VVJENzBHZW9WNm5UQ2luQmZuS0R0TElwdFJnRkVsQmFyWHNrSmtyZms3Wlpz?=
 =?utf-8?B?NWVjdWgyMmludzh4ZG5lckpxQnFPaktxRXIwcTZGd1hMK0JYTFZIMG9xRXpS?=
 =?utf-8?B?VVFtU0VKT1AwWFNpZ0laN21IVjVXb0RHa3Z0UFNzek5lcVlQdldsWVJObjhM?=
 =?utf-8?B?VjMrNDJRSWRieCtMMDczZ1RIR3hFQ2J5Q3R0cUNQdy9vZmh6SzdGb3Y0SkpW?=
 =?utf-8?B?QlBkdTBqNkZyb295aGFxcHRpR2p6R1ZKMkg5a0NCbDVjeEhFc05xNmJyTUd5?=
 =?utf-8?B?WHUrMzJqNmJTc0JMang5RW9WNFVqZ0ltZVVGcXFDRjE5YzRySFAyanF0ZU1Q?=
 =?utf-8?B?U3RnUG8rajhqdDI1bitJSFh0eWhJeHlnbVdWOC9COEhIVGpxMEN1QlJEQnRi?=
 =?utf-8?B?eHQ1TUZ0NEI1eWt1MkNBR3JKcXo5VlQ3YnVRa2s2SE1XMkMvRStoZTgwL2lG?=
 =?utf-8?B?WU9oSi9GZ215L2hGZ1hGd1JuV1lCWnJ6OHo0alY2U1dOTGoxd0hNaVVUV01S?=
 =?utf-8?B?blJJSHNKNkZsZmxXT2NSblh0ZG5zaUhXNTNMQU9HY3hSd2NFUlRrcHQ1bXRK?=
 =?utf-8?B?MUdxS2dTRHZJOWNEQmUveGUvU0ljcnZHS1lKOXltQ0FlMDVYSnhyVTYvaGJK?=
 =?utf-8?B?Z2VHeE1MNGdPWG8wQ1EyY1NkTUV5QTJpZmVVUEVSZEIzYlNSQStXdkp6YnMx?=
 =?utf-8?B?VjZMaUxReFhtVTJ6a0kzZk1FMGJvZzJwZXpwdDB4QkovUDVrSGJvSEZkU280?=
 =?utf-8?B?eGQxSm1TZG0zbXBIc3ZZbHJ0QnViZThhVzdwdFlIQ3V2cDYvaUpzWTY3U0Vl?=
 =?utf-8?B?U085NGFrc1hjK3pyOFM4Ui90UmwzbVFhOUFOWG14aWYxeDlsbC90Yndnek9J?=
 =?utf-8?B?cDM1K1lhbm9SZ0xuM1Y0M3Z4WGlRPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b6a523-2342-4955-b54f-08d99dfe1198
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 12:41:19.3912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X3vVcQc3W6ItCxEcX0fKvHGaJ1QoIF5/SCKGNEHlDDPlqBda/8nqw4To+bxTgiaclyOWBhbMvSXNE10NxRMbnQ4jwVDkuSUJqEKCT+FqSAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4471
Received-SPF: pass client-ip=40.107.6.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_NONE=-0.0001,
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

Hmm. subject looks like it's safe to remove aiocontext locks from any qmp command?

For example, commit 91005a495e228eb added aiocontext locks back to qmp bitmap add/remove commands because otherwise they crashed.

So, I'm not sure that being under BQL is enough to drop aiocontext locking..


29.10.2021 19:39, Emanuele Giuseppe Esposito wrote:
> In preparation to the job_lock/unlock patch, remove these
> aiocontext locks.
> The main reason these two locks are removed here is because
> they are inside a loop iterating on the jobs list. Once the
> job_lock is added, it will have to protect the whole loop,
> wrapping also the aiocontext acquire/release.
> 
> We don't want this, as job_lock can only be *wrapped by*
> the aiocontext lock, and not vice-versa, to avoid deadlocks.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   blockdev.c | 4 ----
>   job-qmp.c  | 4 ----
>   2 files changed, 8 deletions(-)
> 
> diff --git a/blockdev.c b/blockdev.c
> index d9bf842a81..67b55eec11 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -3719,15 +3719,11 @@ BlockJobInfoList *qmp_query_block_jobs(Error **errp)
>   
>       for (job = block_job_next(NULL); job; job = block_job_next(job)) {
>           BlockJobInfo *value;
> -        AioContext *aio_context;
>   
>           if (block_job_is_internal(job)) {
>               continue;
>           }
> -        aio_context = blk_get_aio_context(job->blk);
> -        aio_context_acquire(aio_context);
>           value = block_job_query(job, errp);
> -        aio_context_release(aio_context);
>           if (!value) {
>               qapi_free_BlockJobInfoList(head);
>               return NULL;
> diff --git a/job-qmp.c b/job-qmp.c
> index 829a28aa70..a6774aaaa5 100644
> --- a/job-qmp.c
> +++ b/job-qmp.c
> @@ -173,15 +173,11 @@ JobInfoList *qmp_query_jobs(Error **errp)
>   
>       for (job = job_next(NULL); job; job = job_next(job)) {
>           JobInfo *value;
> -        AioContext *aio_context;
>   
>           if (job_is_internal(job)) {
>               continue;
>           }
> -        aio_context = job->aio_context;
> -        aio_context_acquire(aio_context);
>           value = job_query_single(job, errp);
> -        aio_context_release(aio_context);
>           if (!value) {
>               qapi_free_JobInfoList(head);
>               return NULL;
> 


-- 
Best regards,
Vladimir

