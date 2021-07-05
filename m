Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D99EF3BBC4D
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 13:37:36 +0200 (CEST)
Received: from localhost ([::1]:46302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Mut-0006Wl-HV
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 07:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0Mtg-0005hL-GH; Mon, 05 Jul 2021 07:36:20 -0400
Received: from mail-vi1eur05on2113.outbound.protection.outlook.com
 ([40.107.21.113]:40929 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0MtX-0005vy-Tt; Mon, 05 Jul 2021 07:36:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYNz7AcoTGvlGNpUraSWaerH5h7FbVeC5yYtvRm2t3mryLaY/dk9kq+td62cPx3lKn2biw0VlfsdG3qAd0BCM7epXJqFqSK2fHMd6gHByi8MZChPToeu/qKOTzKKETonJRS8TsVtashcuQXzu1U72sU0YUmmzyZtRQXZ6pDhZpK4D68Mo56eZww7VPanfzhWP0t+YXovH/SmtqN5lAVzlmeJmUFyY5G/c+odGOhBhhy7/z9ZKX7GLrWqlPSIQp+AidmvdOgD6yheYomt2FA1EbNmksBd2umPV3Fh8fL6Xyl6ZK7iGKDFUrjPGvYo5QfZBhe1nuZkzUazanw9T8tUig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6a03qWigCJD3uByWU50sUs8lqiS8RuViN7CWq2CKIHE=;
 b=nUe4HHvsAm3Z3bDYBs4C+XoHEmR0rBtjPeVNQij8gXaMLNt+jwR10+eq4MsseG13PuDnGez28K/m4meCpg9kg9w8w3Hlr8U4/6ti27vg4hAGLPWXG/AvFavgKz0pVulj1Qo7Yk48X+Y8/h0aJCGkjOCcMmWl7omR5X7bGcLFjPdk8Yoeg9rpcSDd+ZVkoh3IWeLe9cdWltNN8RvVntGu9MIZ1yn8H1PRDuY8y0rpYItkfQ2bkvI1n48m7X8WvlNiGYt8Qj71x7WtWHPEZlVpt8SJk4gWNegoKvNITD8wkFzucREPzCyvmR7eMONwcrpRazLH3WQvvQY6zyA+Vv4Oog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6a03qWigCJD3uByWU50sUs8lqiS8RuViN7CWq2CKIHE=;
 b=b1vodzZTk+7ZBfX4CEKA/n1cYeZcqPKCr0HYYLCANXexLFgv8tSHEHKsxwPIYpVTgtTuf62cDz4fWfS5rZmVtNRXWPe49noJTB39SSEbTSgfiHNV+UO6NRyjlIYw2Dau7k++N/W2UnLLkytEGB3lSm6zH2MtHL/xXipixqIj88c=
Authentication-Results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3719.eurprd08.prod.outlook.com (2603:10a6:20b:83::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 11:36:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Mon, 5 Jul 2021
 11:36:06 +0000
Subject: Re: [RFC] block/mirror: fix file-system went to read-only after
 block-mirror
To: Jinhua Cao <caojinhua1@huawei.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Cc: jsnow@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 eric.fangyi@huawei.com
References: <20210624120635.54573-1-caojinhua1@huawei.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <02ebaaf7-5ce8-992b-46c7-d4f62c68182c@virtuozzo.com>
Date: Mon, 5 Jul 2021 14:36:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210624120635.54573-1-caojinhua1@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR3P195CA0021.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR3P195CA0021.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.21 via Frontend Transport; Mon, 5 Jul 2021 11:36:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8134c60a-f59c-475a-c81a-08d93fa91406
X-MS-TrafficTypeDiagnostic: AM6PR08MB3719:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3719D29A58355E525E715D12C11C9@AM6PR08MB3719.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bE2lOLe8CSyK1UElFDYCzokGV166zTIOVLBKWR8w206G8zv7lrQRSqoAxEt6O3kfBtkEIySBEn3VCpdaLnUU3JlXKTfbNnAgzyva5aLbse/nW4XiYdfhNa3r8Nw/EfpA4QwFOFAauQp+RA8k9ukt0WREEvzVy9KrAyaQ6B+6EIDo9DEwMENI6uFi0DX1RZvirboNc7zdu/n4VdTUM5nA8hzNtQZVHLv+sl0thNpa8GQJOICo4sara8LIYLY7977FEUPtJbS9LR+mNOr/O41zr1dS8wFO/Gsaf+PbW30iAOKpQLncMjTRD8dF1+PmUnWrOPWdeIPt/wbb1FsdkQa860lH87aAH8k9aioBkrUtZdxymT2yWC3d9kECm6S2HEypXjKU9/6i+d0Hdcmhdg8g0C8j3XbCg7DeFfSSVc8QQr4y8VwX/pBsHkGeOhROUf0r3Pgepiu2ZvFyvNMEmeS7/+w7OeKd+uo1Q2FXRpOVDLi7eNlv6W175l1znJx5JLX4PTKU+9khpJqmCjss2OXaf8JDq0lSeNpKeCn3PQIu1dStXFV2gxuEHyaFAK0PfWe58Mi6Ffak65noaQTGd6HCTgGikKl5iV70F/htPKmjvLZ9b1PTFc6lK9HyTI9fBQYRMZW/S2FXzemF7LqcslecRY/envOO/D802t44TAKdFO09kEZyr9JiL6BSBe8uAYTawiKynN2RkIhKgmgGQiZ5DTOzL0D8WPaNH6qiUEby4Rg6IQwncs6OobheF1GYXFSvz5Ny7Kxv2AgVtp23mBRSxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(39840400004)(136003)(376002)(5660300002)(86362001)(8936002)(956004)(2616005)(4326008)(26005)(83380400001)(31696002)(52116002)(16576012)(316002)(8676002)(6486002)(478600001)(38350700002)(66476007)(66946007)(38100700002)(31686004)(2906002)(36756003)(16526019)(66556008)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVdWZjFTSkVnU2lFeFkyOUtZQ0ZZbytDalBkRnNVTEdlaU05Q3BIVUdLZE9X?=
 =?utf-8?B?d3owV2Ezc1dEZVlrZ1Y2cjViSkNDdGVjTmNCbHRLN3BIWkNoZnFLQzJxdk9M?=
 =?utf-8?B?cHBYRmFyS2xXSHNtMXczbTZYMlFwVXdaSkZrRmIrTVY1UjNIN3p2TTVUanZE?=
 =?utf-8?B?YjR6b2cvTmhHeDYxamJScWtUSEdCOXFzU1MzTmRESkhWMnVXN0xZTWg1U240?=
 =?utf-8?B?bUxqL0JldTZIc0lpdVpMck1lOUlWOXkxQTVLMFRUZ29uWHNzdDBhN3ByNW0y?=
 =?utf-8?B?aUNtRjVGWXRQTS9nNCtQMFMrQVR5UGx1NWxTYXlqQm01emZDSG5vb240VWFR?=
 =?utf-8?B?WVBxYVBjZGdUZHhDYlV0VDhtMlVZcmdqUWJYdE5nSUdQQXNWL2g2cnFwYTNX?=
 =?utf-8?B?RTFWanFhU0NtWmRsYmVoMG9qQ1V0OWRwT2VrYlgyWDBPK1FyVnFRTEgvU2Zn?=
 =?utf-8?B?M0pHNVRSS3J3SjBOMHhTVnpyYzB5UFg2cEYxTXl2bEp1TjloK2kwOGlkY0pU?=
 =?utf-8?B?TGtRYmNLazZnTG5OK3ZNWlNzZjA0SFd2MTlzSzVYenNEY1Y2azZoT3dJaDFm?=
 =?utf-8?B?MW9SODdDTkJtRlhiNVg0blJrTDA2UDJKS29mZUZnSUlGcFBzamRIT1NESDF5?=
 =?utf-8?B?MEtGeTVLamRLdGFndEpJOXFTY0RpWUdCNUI3dzlTQWxJYXQrZnZ1ZDRXWURu?=
 =?utf-8?B?VytKdzdXanJrOVBmUEVQcmVjVmNVUVlGaUJ2RmFHQ05mckZTREtaa2dZMDd1?=
 =?utf-8?B?eWIySGRlcGVEWnBhZVZLMEhEZ2F3SExrOG1jZ2U1Njl0UldEUDJtcklIVmFJ?=
 =?utf-8?B?TFl4V3NwS3MvekNHc0l4azN2d01xbkk4ZEhKU3hNS2pmMk5lZzVvbU1HVUhO?=
 =?utf-8?B?dU9wUExRR0pyNTdIK1ErdEk4UWxjOFora1Rja01Xai9STUlFYnRDNG93bnI4?=
 =?utf-8?B?c2NLN0IyQ24yV3BiV3pTZ1BTZXRCTzhyYmc0NkpQS1ZvaldtT3RXd3VaZXFr?=
 =?utf-8?B?NXZtRG1NTEZNTFF4SnZMZFI4WHZmZjJiaE1JcTNXUGR5K1E1UjZLOHA5Ykxh?=
 =?utf-8?B?a05iNEl4QXJqMXZVeGR5NWRVbTZGS3dWME03bEVrcWhVVjM0MThwRHpZamFC?=
 =?utf-8?B?dTNKbWRNM0lVUzBqZ0hmNFpRTm93bG1Nd3lramh5dXpGUnNma0xhZFJqWXA2?=
 =?utf-8?B?QSs2M1luRG5yd0J4M2pwWngzbDFnejlSanhxNVRKaVhpU3doK3M3SldCWHZQ?=
 =?utf-8?B?dVNlYUhTV0poWkZHdjdMeEtFYm9YM2o4RVNBa1ZJS2dKeHlKWDBiSS9BMGFn?=
 =?utf-8?B?QlBvQStlWGYreG1yaDJaUmNNY2pYbDVjQ1ppcHoxTnJUQmwwWkNTMlUrYlJW?=
 =?utf-8?B?UDJJUGljMmxVZzZYK0x4ZzFXaGtpbHVPeHc4aVVSd0J6d3d4Ni9MNWxSdjF1?=
 =?utf-8?B?MFlvTlFqWFd3MGhrN3htR3VQUE5tNVJPN2VnOUEvcjMxT3lWcmNkMFRtamFx?=
 =?utf-8?B?MDBzUWI2QkxzUjY5UTIySnNXYXg0Um9PNDVuQ0hnNU5BOHBOS09qV1BVNkZj?=
 =?utf-8?B?RVk0ZVlGb1hjRWxTT085VDNjYVBIZlErNC9adkJyUnZaczRJTk1Sc3IzUG1x?=
 =?utf-8?B?Q3FQQnJNbFdJRTgwcmIxckhYWURkMkJFeFFpdWVINC9LSkhldTc0MGtnVjZ5?=
 =?utf-8?B?aXpkUjJuSGMySEhRSU1CSDVuQ2w1a1pLQURCamhpMWZmeGFYSmUzYUJWY0Za?=
 =?utf-8?Q?xgZUcqDT23uH8XwWKDaV13jCWBqWpObEpjUmoB7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8134c60a-f59c-475a-c81a-08d93fa91406
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 11:36:06.8832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TnrPBQI5/ze2ThEPJOb9zxUcG0M7VJP6RsfznuJgHj0Z5McPKnW84BFa66e7oMZKT6lubnWZkM4DlctWF/BeQqsCGe9mhi8piqPNy6cXz68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3719
Received-SPF: pass client-ip=40.107.21.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

24.06.2021 15:06, Jinhua Cao wrote:
> 1) Configure the VM disk as prdm.
> ...
> <disk type='block' device='lun'>
>    <driver name='qemu' type='raw' cache='none'/>
>    <source dev='/dev/disk/by-id/scsi-368886030000000ca50c1cd1563996917' index='1'/>
>    <backingStore/>
>    <target dev='sdb' bus='scsi'/>
>    <alias name='scsi0-0-0-1'/>
>    <address type='drive' controller='0' bus='0' target='0' unit='1'/>
> </disk>
> ...
> Mount the disk in guest and keep the disk writing data continuously during block-mirror,
> the file-system went to read-only after block-mirror.
> 
> 2) This commit 6cdbceb12cf[mirror: Add filter-node-name to blockdev-mirror] introduces
> mirror_top_bs which does not set default function for mirror_top_bs->drv->bdrv_co_ioctl.
> 
> 3) The function bdrv_co_ioctl in block/io.c will be called during block-mirror, in this
> function, the judgment is as follow:
> ---
>      if (!drv || (!drv->bdrv_aio_ioctl && !drv->bdrv_co_ioctl)) {
>          co.ret = -ENOTSUP;
>          goto out;
>      }
> ---
> The mirror_top_bs does not set drv->bdrv_aio_ioctl or drv->bdrv_co_ioctl which result this
> return -ENOTSUP. So the file-system went to read-only after block-mirror.
> 
> 4) This patch set a default function for mirror_top_bs->drv->bdrv_aio_ioctl, fix this problem.
> ---
>   block/mirror.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/block/mirror.c b/block/mirror.c
> index 019f6deaa5..63b788ec39 100644
> --- a/block/mirror.c
> +++ b/block/mirror.c
> @@ -1480,6 +1480,12 @@ static int coroutine_fn bdrv_mirror_top_flush(BlockDriverState *bs)
>       return bdrv_co_flush(bs->backing->bs);
>   }
>   
> +static int coroutine_fn bdrv_mirror_top_ioctl(BlockDriverState *bs,
> +    unsigned long int req, void *buf)
> +{
> +    return 0;
> +}

I'm not very familiar with .bdrv_co_ioctl kitchen in Qemu, but intuitively this seems wrong to me: you do nothing and report success in this handler.

So, probably more correct would be at least call bdrv_co_ioctl() on bs->backing->bs, which is filtered child of mirror_top.

This raise another question: what exactly this ioctl does? If it changes the device like write operation, we should somehow handle it to update dirty bitmap, otherwise mirror will not work correctly. In this way, it seems correctly to not implement .bdrv_co_ioctl in mirror_top, and keep it returning ENOTSUP, as we really can't support it..

> +
>   static int coroutine_fn bdrv_mirror_top_pwrite_zeroes(BlockDriverState *bs,
>       int64_t offset, int bytes, BdrvRequestFlags flags)
>   {
> @@ -1555,6 +1561,7 @@ static BlockDriver bdrv_mirror_top = {
>       .bdrv_co_pwrite_zeroes      = bdrv_mirror_top_pwrite_zeroes,
>       .bdrv_co_pdiscard           = bdrv_mirror_top_pdiscard,
>       .bdrv_co_flush              = bdrv_mirror_top_flush,
> +    .bdrv_co_ioctl              = bdrv_mirror_top_ioctl,
>       .bdrv_refresh_filename      = bdrv_mirror_top_refresh_filename,
>       .bdrv_child_perm            = bdrv_mirror_top_child_perm,
>   
> 


-- 
Best regards,
Vladimir

