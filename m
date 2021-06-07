Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 572DC39D445
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 07:16:16 +0200 (CEST)
Received: from localhost ([::1]:48452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq7cU-00066x-SC
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 01:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lq7bG-0005Aj-RG; Mon, 07 Jun 2021 01:14:59 -0400
Received: from mail-eopbgr00134.outbound.protection.outlook.com
 ([40.107.0.134]:19433 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lq7bD-0003P2-C2; Mon, 07 Jun 2021 01:14:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWj3vHUOUWpPgIzib7Pto5bbOGKuzCCiwaVoj97Zjdvq+NfhWuLbLDCLbPqAhN2GV7T7EhTzbxj7EJXwrL49tLUIotZzCh3rtJhUuUPw1i2bDxISJxeJw5TQcKORY4uIrteJxoZax21xuOn+yDqBk2eidSJz6vRuubP0J8dy2uJESXQ9kJ6OQykliOWVTvgkC5x+eVZU50d3nyn9Ab50PWAyyTGxSMlA8mGutABq2H8k6x8C8SF15sNHlhJn+KF9SKlJffagiOZeZdxtlV5S/dEnroQQpiUrmLImxg0D7N+Q9/sUATxyIfMnGEhs5mFiqA0i1rhnzmW/Bq5wt+K6Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3txOgyF6KaEK9zeY0zOOKweCN1t1HeIMtOZkejtZdLI=;
 b=inU108cCYmg7GnPocP4ziZndsOelEkUbNd2TzKixvFGAodvIkxKE17icKTUZw6RWUEERfRGVQ9TlmJxQqv7P1ZROEKMaD/cNv1zQDza4xhJfqehtKUGPBuPaV/u3VbcRUwWoYZF0E85e9Cs7X82HTKTC70ksguQEc9aUjYkSoi3hiEXKNdd8X6J6pnKxAsFJgJXDnu2/uWWi010WpFit6Px0Zvbfz95QLa5lHoe6Q4xUDxc4MgPoX6Wf3KXx4samC5UktiCMaWWqvqZJ6/wiIMvHwGG+YrGvrMV/OtTXJWl/L94jp3htVSgMCq6cOlv8cWonLm2g7zE8KbQ780FKjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3txOgyF6KaEK9zeY0zOOKweCN1t1HeIMtOZkejtZdLI=;
 b=Z3Ddnr75r8sLzp+NBxNtWPpLFBaywrztSw2lUGGyh0Zh7jW69ls9mfhBK43w+1bCmFNb+mdHB3T5oWXmUTzr2k4FnFAYeJRmtJICJubu7yLemlJS0g4xB+MnXcHM+FbujoogqdWJwzjC9TlGZ7NIqcWdz2DKNFdAZ4k1pcEbP3k=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6053.eurprd08.prod.outlook.com (2603:10a6:20b:292::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Mon, 7 Jun
 2021 05:14:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 05:14:46 +0000
Subject: Re: [RFC PATCH 00/11] hw/nvme: reimplement all multi-aio commands
 with custom aiocbs
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
References: <20210604065237.873228-1-its@irrelevant.dk>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6addc825-917e-e3b3-f2b3-af311beb6b00@virtuozzo.com>
Date: Mon, 7 Jun 2021 08:14:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210604065237.873228-1-its@irrelevant.dk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.227]
X-ClientProxiedBy: FR0P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::9) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.227) by
 FR0P281CA0042.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.9 via Frontend Transport; Mon, 7 Jun 2021 05:14:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2293c5b6-8f28-4f87-d603-08d929732ad0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6053:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6053F1E1396F7604105BEF6BC1389@AS8PR08MB6053.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TdpG/Fmsq3gXoBSzf9Yiev6JWINBzt+RIX4gcObx57fWlwPue2rV+rVEqsZSakDp8VtB/ynowOv2A8PeKJC0c+GfZScHAtYT9Ft6+9ua76cOIIpQONarzVgy7+jQEHUmqALWrdkFPY9GULD339rUt5e5sQpwzChkb83jtXKnZ+k//llEwaFlzhoXsI944EHWTHwGdKAqBCulKyMzRoTMcuhReTRGl+UeZrb3jvmt7xL73lVq7HG8WhbBhR9lnTTIzYkSdTJYFuVm9jxydDsSnKO3a0NVcbqhuXfXVleIEERNJbM41Et27CXqbsjZbSdsHL2mAyiQT6h+yFo3WVUEf9yTmesQ/lpMLav4Ra7I0ETvwRCC44MlTcUghrwjinzq3NcV3tQxwzoJJhtm0Eg/7ft/LakMR1R4cYJQBfe8PMXLj1qV7DoPnHNPSVkAoyCOUN1OiLrlEU1bWL98XQuFDZMuCaldmyotYw8PvNCyjz1PG5CKAnqA55WPLGBUEZzz1Svrv55JeZNQr2hpBxq9+GAktq2+inj4+OLxNQ/vxqtSmyb1psdJHMxM2lWza8MuetbA+9iA7YV9JzRZPD6ijkBiF2upCItGPPh/VNTW2MifKzjweO87mCPvhTMJMnvl1AIk9Y3spshAVOEGc1Yr4IWz249vZUvlPWsCfboQD+WjzKvMLlnWMdjpe1LszbIfZFaKdT1sGOY3me6a3ieV10F5wiErQiFedr2wYWABblQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(39830400003)(376002)(346002)(38350700002)(38100700002)(36756003)(5660300002)(66946007)(66476007)(6666004)(86362001)(6486002)(66556008)(31696002)(83380400001)(52116002)(4326008)(8936002)(54906003)(316002)(8676002)(16576012)(956004)(2616005)(16526019)(26005)(186003)(478600001)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M05SVHdwMlBNWFFjZ2gyek9iMjVQYmRnS2xPK3hvRExmZ3JrSnRueVFQVlZL?=
 =?utf-8?B?M3kvZWlONDJXQUtNSFBLOXpPY1IvVUFkOHAvWGFtbzFWMXRFK2ZOdW9Vd2xP?=
 =?utf-8?B?bnJ0UmZ5UFdHSEZCOTB5MVdzVkxUQzkvQUlJNkR6YUdPSCtDbCtXNEFEa0FZ?=
 =?utf-8?B?ZWdQUHRycDg2VU16VnpGSngvTXlqVXlicjBEclIwbnBHSVlwWUtRRDJ0R1Iv?=
 =?utf-8?B?bjJramtXMnNyelIybTJFbVZZYVk1NDNIdEYwVFdlcGRsaXFDdHM5ZnlNUTM5?=
 =?utf-8?B?U05lcCtTMCtJdDlENy9aQVhzYTVBUkFzSi9uMEJxeEJmcW1PQjhSSVhHMzgw?=
 =?utf-8?B?TW9hVzlEa2JmZEFuaTEzN2ptQVBXZkE0a3NxWWREd3NsV1QvbXhMY1o4cW5h?=
 =?utf-8?B?cURaUEhKZWo0TWgxTVlhbGFPYmZ1OEhvRTVCbkFlNW1QeGVqc3FCMG5RQUl0?=
 =?utf-8?B?NzYwSWZnejBTdzE1dkFpVFVGbURxN1o0YkNhaGV1THhjOG1ObmJqRmVOQU5D?=
 =?utf-8?B?bXZHT3pNVm9VK21rY2JhQ0k0N3R0aC9EY3ZyUmJaZjNZZ0J1NlFwRW44ek14?=
 =?utf-8?B?eFJscFlwdjQ0TlJkTlNCR2V2ajJPL3lzVENjQWNXZjg5cnpGbVZ4RVdxbjZW?=
 =?utf-8?B?eHpVOFptNUg3c1lFT0lWeGlxaDB2eVVsc0gyalFPQWhLL3NGY0FNYzd4Nll5?=
 =?utf-8?B?WEpBVmxoV1RxQjZlaHRpMmNaamNXb1VmYXRVZFU5bHdpbmMrRXpMY2ptd1JB?=
 =?utf-8?B?TDBkQ081QVc2ck1oUmFxZXlLeFZoNFlEdENDbVNGOTZIY3BPYjRqMWFBeFJX?=
 =?utf-8?B?OHhOcGV5MkNhZm9iT3dwRjFUNVRQQWl5SDhoZTZVemMxZ0NOOXcwYVVvNmJp?=
 =?utf-8?B?U0dDKzNweFo2a2pDdUVTdk5LdHFUbkdIMEJWWkE0VGVzZmlCS0hrN1prMUJx?=
 =?utf-8?B?U3FPT1FVelJXVGVmeWhLN1V1bEthSklwOWRGdk5EcktnY0dOYzRnTCtaMXBV?=
 =?utf-8?B?U05lSVA2M09FYVVPM1Y5TGttL2RLM3lJTUpPMzN4UXJ3bUVCYzFMQ3VXV2tX?=
 =?utf-8?B?NENEb3ZTaUZQbTZ5NGJyNG81SFpIUDV4Mk1aRTVkYkdIRGRWV1dkS1NqVXJF?=
 =?utf-8?B?K3hnZGFKdVRDWmZvZkdSeUlScks3STdPeFBsbS9Ray9GYm5hNjJEV2lId3pH?=
 =?utf-8?B?UElWVW1kcTBMRVg5OUVydFJ3U3RoNjJGb0VWMHd1cVZtOWZTbnlGcGN1ZW5q?=
 =?utf-8?B?ZkNkWXUrTEp3SDEvY1AxaG02VFl6MXNqVmpwd2xSNGhkRUFOaStNSlZnaFoz?=
 =?utf-8?B?ZmJKNFU0a3JPZGl6b0R4WFlPK21UejkvM2h1dG0yc2sxalBYWFlCL2ZBekRv?=
 =?utf-8?B?QXpOVEZMOGRhUnNuRUJ5OVVmazM5alJoY2pEc0F3dVh2anpkS3hXSGpReFNk?=
 =?utf-8?B?ci80cFZJQUFBVGFGUHdSaDVUY0gxcmpORUY3QUVNYjV2WWpiaTZ1Q0JRdWcz?=
 =?utf-8?B?TDk4RFQvcDdnL250V1gxS0h5bFpxbHNOUEhrTzUvYU1UcGl2dE41UUtQSmcy?=
 =?utf-8?B?NXdJN2JhWE1pZGlvRWUraUZsY2V4WnQyRDZxeHphRUJDUkhMOGtjU3AzK2JI?=
 =?utf-8?B?cnhsS3lqSXExSmRZa0htWEc2bDNEajdWVTliTE5oOG9OOWJyUUpsQUFCS2c4?=
 =?utf-8?B?aFpGdEhKRHF0R01meTkrNkgxdGlNNEpuUmpTWjBhNitJR2V5cTYydDh3Z2RD?=
 =?utf-8?Q?qn0i6L73f/ErX/dL3rPMGKjKu90GtWWdYUy1ujO?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2293c5b6-8f28-4f87-d603-08d929732ad0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 05:14:46.9228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HNZWza6mTdvqVTTg2DQ750Nkst1cSSIIG2haAGV6kncus02kcsAmZ9+wrOijafJ1Pl79cw9iT2Yu92Vg4JlRN3jF/4ShS3vqq5dPOsWFjS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6053
Received-SPF: pass client-ip=40.107.0.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

04.06.2021 09:52, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> This series reimplements flush, dsm, copy, zone reset and format nvm to
> allow cancellation. I posted an RFC back in March ("hw/block/nvme:
> convert ad-hoc aio tracking to aiocb") and I've applied some feedback
> from Stefan and reimplemented the remaining commands.
> 
> The basic idea is to define custom AIOCBs for these commands. The custom
> AIOCB takes care of issuing all the "nested" AIOs one by one instead of
> blindly sending them off simultaneously without tracking the returned
> aiocbs.

I'm not familiar with nvme. But intuitively, isn't it less efficient to send mutltiple commands one-by-one? Overall, wouldn't it be slower? In block layer we mostly do opposite transition: instead of doing IO operations one-by-one, run them simultaneously to make a non-empty queue on a device.. Even on one device. This way overall performance is increased.

If you need to store nested AIOCBs, you may store them in a list for example, and cancel in a loop, keeping simultaneous start for all flushes.. If you send two flushes on two different disks, what's the reason to wait for first flush finish before issuing the second?

> 
> I've kept the RFC since I'm still new to using the block layer like
> this. I was hoping that Stefan could find some time to look over this -
> this is a huge series, so I don't expect non-nvme folks to spend a large
> amount of time on it, but I would really like feedback on my approach in
> the reimplementation of flush and format.

If I understand your code correctly, you do stat next io operation from call-back of a previous. It works, and it is similar to haw mirror block-job was operating some time ago (still it maintained several in-flight requests simultaneously, but I'm about using _aio_ functions). Still, now mirror doesn't use _aio_ functions like this.

Better approach to call several io functions of block layer one-by-one is creating a coroutine. You may just add a coroutine function, that does all your linear logic as you want, without any callbacks like:

nvme_co_flush()
{
    for (...) {
       blk_co_flush();
    }
}

(and you'll need qemu_coroutine_create() and qemu_coroutine_enter() to start a coroutine).

Still, I'm not sure that moving from simultaneous issuing several IO commands to sequential is good idea..
And this way you of course can't use blk_aio_canel.. This leads to my last doubt:

One more thing I don't understand after fast look at the series: how cancelation works? It seems to me, that you just call cancel on nested AIOCBs, produced by blk_<io_functions>, but no one of them implement cancel.. I see only four implementations of .cancel_async callback in the whole Qemu code: in iscsi, in ide/core.c, in dma-helpers.c and in thread-pool.c.. Seems no one is related to blk_aio_flush() and other blk_* functions you call in the series. Or, what I miss?


> Those commands are special in
> that may issue AIOs to multiple namespaces and thus, to multiple block
> backends. Since this device does not support iothreads, I've opted for
> simply always returning the main loop aio context, but I wonder if this
> is acceptable or not. It might be the case that this should contain an
> assert of some kind, in case someone starts adding iothread support.
> 
> Klaus Jensen (11):
>    hw/nvme: reimplement flush to allow cancellation
>    hw/nvme: add nvme_block_status_all helper
>    hw/nvme: reimplement dsm to allow cancellation
>    hw/nvme: save reftag when generating pi
>    hw/nvme: remove assert from nvme_get_zone_by_slba
>    hw/nvme: use prinfo directly in nvme_check_prinfo and nvme_dif_check
>    hw/nvme: add dw0/1 to the req completion trace event
>    hw/nvme: reimplement the copy command to allow aio cancellation
>    hw/nvme: reimplement zone reset to allow cancellation
>    hw/nvme: reimplement format nvm to allow cancellation
>    Partially revert "hw/block/nvme: drain namespaces on sq deletion"
> 
>   hw/nvme/nvme.h       |   10 +-
>   include/block/nvme.h |    8 +
>   hw/nvme/ctrl.c       | 1861 ++++++++++++++++++++++++------------------
>   hw/nvme/dif.c        |   64 +-
>   hw/nvme/trace-events |   21 +-
>   5 files changed, 1102 insertions(+), 862 deletions(-)
> 


-- 
Best regards,
Vladimir

