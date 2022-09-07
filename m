Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B82555B09FC
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 18:20:58 +0200 (CEST)
Received: from localhost ([::1]:52476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVxnN-000191-Ht
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 12:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oVxhR-0005GC-4F; Wed, 07 Sep 2022 12:14:49 -0400
Received: from mail-eopbgr80091.outbound.protection.outlook.com
 ([40.107.8.91]:55872 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oVxhN-0007ib-Tr; Wed, 07 Sep 2022 12:14:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJCU3E36S0/3R5WdmunnrnAE+JLE5mfKstNOAMLMhlkCHkOhrnal/K/i/QgYszFeJr14YqQJDHPWF1jY1M+rrb50bZniEUtw0fos8X874OA35vd/jP/S4etwSafPdSuJfx6sgKCy44uUcjHm4h2df/Mllt8zPS02vrVcXlcudmsddZUIR3+jXyq/HBuJPVqTWKG653v2+PyTwjpqnlbNNO6Mu/v+MEJ9u2bbQoASq0CLW7mAbQr4TPRe89XO9eEAFhGaiVIEKaSF53slkU711YVbpAfye+F095rl1a7OmrNHHCg+Y6X91sUzxRm/QC85fMMu5yk3+ORlzyAzoG1HcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZK5RmMe1ug5D9UUwIxXcKAXh7TnvhQLQQe2TcMLWJA8=;
 b=EhFDb+tzQf6JgjI+p8pU+9k9A7fyQjugAn9n1rTRyhX03h5HZ/IZXKCAawNbXGlkbO9QiFSLZ+NNbSgtF0XZ7eBjYyjyz/0nddysL6b5wT2xmNnieFXnLl24bfjbXT2qBaDM0vta8hUxL0Kn+X7QsOlzTci3NDHahPt7S4zGL1kFSkF6w9YlhftnS1aEQey7m0IFg4mrwlCRpl+3RuSmXyurs9sBRqR++mbvilbDH4cERH0ykAVZQrM+ykXwMoKMEQzvYv+kMoBfqZCnR6+fB0/vvrjwAWrYnsvbI8nIzMPAkthgvBx+qfD/BJXbXgQMz1/ZJRf23SsB9RDcG66jXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZK5RmMe1ug5D9UUwIxXcKAXh7TnvhQLQQe2TcMLWJA8=;
 b=OKoGfFMlAwi8y4vwVxlq840m9LGvZ8/dsHECcxaiSRJCG9sHwaRJcdMJWe1XeyLOrtf5b6NbUgDWOkfBhJF5J1lagRMCus8Hn1eXqQ89bCYxkToNZf6IOM0jNmNQRTabxZj5qxjroxKwo7HXzipxNRzqJ9UtIusszp11PIOCLu3f7Q+y2J4MwqcihSqd4bAqOGXeHi9wsbUcYrtd+4rZv4fyo+j6zOgy2dQYVyADU65jQnXabQxHJIWKipCaF8eDFFRm/YY7toQC88mBt9qMiRFCfcpGm6mQi2TjlijMFWYC32aD007/uExtwrR2nwWogiOR1mQyhh00TpAKf+OjmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by PAXPR08MB6671.eurprd08.prod.outlook.com (2603:10a6:102:13b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Wed, 7 Sep
 2022 16:14:38 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::5593:9fae:255d:ee6]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::5593:9fae:255d:ee6%4]) with mapi id 15.20.5588.016; Wed, 7 Sep 2022
 16:14:38 +0000
Message-ID: <5ea9909e-3ffb-6e55-b43f-3dc4c7577a25@virtuozzo.com>
Date: Wed, 7 Sep 2022 18:14:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/6] parallels: Add checking and repairing duplicate
 offsets in BAT
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220902085300.508078-1-alexander.ivanov@virtuozzo.com>
 <20220902085300.508078-4-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220902085300.508078-4-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0109.eurprd08.prod.outlook.com
 (2603:10a6:800:d4::11) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a2c64dd-fb70-416c-ec75-08da90ec100f
X-MS-TrafficTypeDiagnostic: PAXPR08MB6671:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UERA20kHvO0yh+OYHR2sI5xX1FscAGItO3B1Ga6sqYb3l0Q8e9hS1xksW20rJjHnhpMHe+PmkSQfW0+1XuzxCLUhBBsFbugyigTPQrUl1LytILJk2hu5SgSFQUlXAIX6Q7C5/czYUEVQunKpl8z+5ivkQCuLrDnuAyROb/1ueaBuOQIT3bIRZWvO+3TTxaQdAIGHGjBBrlRo9q4L8pjpQs5YfgKzTSZw+PM3bw6HQf2cIk44L4OYurNCWgfXeyC25INAh1dcMJ6oCxl1HDxoQAF6v8wIVkJPBMzq/UHiU9jYOh8SeEUnb/Ez6wqvgaeX5iXbw71TnzpXVuWeZVcIQlq4cAdb9rq/Y++QIjpqDya54G+31XhsUgfgxxJPWRUTkrgtSuUPwLezykxOGkBeCVDUEI2JLOzd2G/V8hkdHfLgo1yB3jcuEnTlzBOWFXEWwdcS8UYVGxjH0rZZCL2Y2Ne42EaIRYOQdmjQdoRsonfcTsYJTAIa2/JyeOFgKXEhE9V2Az6cWliJ/E6tztitWr75isWGSGdb4QBRzxuRgn4jU/7X+Z2lAaZULSHjC+YMTUjybTyB4d3wCuiYrEts6gxz6cZj+NjvBFAu6ZeJACNSR9+eKVJdOboI8ePwy5mbXgJH1Us+QtTGbkjYEUg3O8qdT3lHtAsR6wbIYSSJ0MVRQtq+oKlSPvr0QQWmpexu0ryK0cgKPneVkrM08Q6dZttxdxndPxluCp2Q+B9UdZhDI36DdvHQHZUZYjsudtuWmQ3zfGCM3Rno4mkftnM49JCebbHDTR83KQKyfuQNDO9ls22CoVMH0mf5Aq2e7WtAVPn/1VA0vMwR/WbPCyWohw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(366004)(396003)(346002)(39850400004)(6506007)(86362001)(6486002)(4326008)(8676002)(52116002)(66946007)(186003)(31696002)(66476007)(66556008)(53546011)(478600001)(41300700001)(2616005)(8936002)(5660300002)(2906002)(316002)(31686004)(36756003)(83380400001)(6512007)(26005)(38350700002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVJaNFlLNHpBanIwNlFJNjlvQ3BxSkFQNTB1UFhWZjBoOGdFNWxwa042cVZl?=
 =?utf-8?B?Z0VXR2d3aEJRWXNseW14Q2lWZFJiZGtnOFNzU0ZkSXFvUGR1UUZlNVMyV2xM?=
 =?utf-8?B?MGYxNTJ2cWhRbGl5eXQxanBFSjcvK2Ixc2tiR3dRbFM4Wk1vdk9zZlFpMkkx?=
 =?utf-8?B?WW5Xd04zY0xzTklJSlVMcVBhVURoV3NDMVNZVFFhanZUYUEzQndvM3o5a0Mx?=
 =?utf-8?B?NjZIeTU4S2cxVGpoNGluYVNQazdaaGJaY3ZZcGlmTmZIaVJ6UlJOeXZaUGFt?=
 =?utf-8?B?Z3JHbVBIOThlSDhQU09DNU56M2R5a3dBMndoTzdKalJTbTdmRWR2REhScWp4?=
 =?utf-8?B?RVIvbzd1eWRSV1I4RUtTS1BueHBScUwwdDhKOU1raVMyRVorSldLVllmei9Q?=
 =?utf-8?B?OG9zeFdaOXRaMzlCVDhzYnBvbmVxMGxITFhiTVNtaFdDall4UGdaZEVyYmVz?=
 =?utf-8?B?Yllic1NwdmRPSXhWTFcwYlVoVkNNN3hZZTZ6Ymp1RUUwMFlWYW54TmVvRGVp?=
 =?utf-8?B?L2dBU1lmcmNTYzBCTEhLL1AyK0lqM1RvZC93dWVtZkU0NnpsWmlrWGFBaUZn?=
 =?utf-8?B?VFVXQzZkZjJNOTk1THhyUDBGRGFwN1p2MlRCcnExRzE1WG05Qlo3ZkRzaUFs?=
 =?utf-8?B?Y0diR2NCZmkrUUY0WnRWUUJmdVNsemJiZTZpdEJ0UGZjOG01TWZUcGprTkJv?=
 =?utf-8?B?NDdrSnlHZlhGSGRRQk05U0ZwQ2Y3UmZYcXpjckNoS0szU2ROdEdYK2dkbnli?=
 =?utf-8?B?QnNmdldPT1I2YzFBVi9YdVJ6ckxKeWdQUHhxVTQ4RWJXamlIVE1DU2NKV0U5?=
 =?utf-8?B?ZjFWT21BaWRJeEtoV0hMdUdId1BkdnVVTk5idDUrZDRrMzlsSmRQVVN1SFVx?=
 =?utf-8?B?YnFwb0RXZjVjcHgyemVTQ2FPMkJ6cUxDbmhTb3NRd0ZQOWxQckJKNWFDbmha?=
 =?utf-8?B?T0tVdHdrMnl0eDZnaDFMQjE4KzlGc0MzeExRQWdlTjZnWkVQaUFNWWVrKzZI?=
 =?utf-8?B?REZzNXM1b1RXYU1CaXh3Z3RQL2I4U1dtTHpieWt0SWZ1ajEwSENOMlFiUG8x?=
 =?utf-8?B?RkEyRDUyVER3ZjJ3UCthVHNBS1VmUlVtamJ4ZjU0WWh0dHVBcVl0NmRqMEdI?=
 =?utf-8?B?a2dKbktBSFJaRzdSQzl5Y2dTL1VyZzA5Tjh3d0FpNWxpMEgvNHh2bXgxUXFM?=
 =?utf-8?B?TXNoMDJSZXNCRVZtbTd2aGFCRHh6OXBIbjJ3K3VPM0FTNFZvWkk0UWU4RlRr?=
 =?utf-8?B?K0xFQ3krWWRGRUZKNWlxaW9hd1ZnK2U1aUNsUWJZSG03aVQrWWRka1dKOWJD?=
 =?utf-8?B?ZmtTclUwUDJyOFhpdWkraGJIMWg2UWRCR0NieHlWVXNBUG5iN3BVUFJZVzgz?=
 =?utf-8?B?cGNZMnBNd2xFTzhsY0d6RXpLTDJNYytoS3NtUHQ4UEtBVVNzaW1pblhjRDg3?=
 =?utf-8?B?K0h6WWpyMjZRUmExUVRnOERnZ2dzSU1pYklCd1pBNkJ0NFpLbjNrcm5EdzUv?=
 =?utf-8?B?Ymkya1pmS3FVMHRFRVMrM0VYNXhNYWw5d2RKbjQ2MUxONDNRRWd3bUttYlYx?=
 =?utf-8?B?cDl3d2t1aFNBdW9NQ1BmL2F3TW9xRFNVR3ZXd2lvQXdOSFJtQnhXbEVRU0NX?=
 =?utf-8?B?bVhlM2I0OFhObXY0WCtxSVgzNWZ3T0MrMFFFbEJ4QXhmRlFzdEozSzhFekFs?=
 =?utf-8?B?dk02UTVNcG1ycXQ4VElPbnNPcjdMU1I5VXZSTGYzdTJyMXJXOW5PUHNEZnpC?=
 =?utf-8?B?bTFrcWpOdDQzN3QyMGx3YUtyOU1JaThrZWFzblVCZHIrRXdncmdxUWFCSUJJ?=
 =?utf-8?B?SDBYVTNsVnRuM29LdTdDbjRIdEZraXliSkduVTBhY1hMY0t6VkNSSXN4NkUx?=
 =?utf-8?B?Rk5ERWtVUHFWYW9iRTVBNGFLU0Q4QWVCNHVsNStHZ1lwejZFa3orOGJidkU4?=
 =?utf-8?B?bW1DSDdiZU44WUxpdU9BaXVaMDJFVFVWUytQd3k0T0d3VGxVOXpqTExqR3Nm?=
 =?utf-8?B?cm83QXJyS2tnSXdHYWQ1and2Z2tCNGVXcU03VGlUOVAzSFJseklWOU5Cam1H?=
 =?utf-8?B?bldjdVVob01ENTVKbzZhQ284K05OK2Q2dDltYnByanJUY3d2TnVuQndGRlBQ?=
 =?utf-8?Q?kMYlvFHVRM1TlnuGMr6/BHFZw?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a2c64dd-fb70-416c-ec75-08da90ec100f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 16:14:38.3288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Rs4hnC6yQKAoJWbX6l5erME2ux1Ya2EP7TtFNU3ySda/l6Wtz+xVlnMFy5UbsqrMGj2/01iMh/hnVqaYT2LCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6671
Received-SPF: pass client-ip=40.107.8.91; envelope-from=den@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 9/2/22 10:52, Alexander Ivanov wrote:
> Cluster offsets must be unique among all BAT entries.
> Find duplicate offsets in the BAT.
>
> If a duplicated offset is found fix it by copying the content
> of the relevant cluster to a new allocated cluster and
> set the new cluster offset to the duplicated entry.
>
> Add host_cluster_index() helper to deduplicate the code.
> Add highest_offset() helper. It will be used for code deduplication
> in the next patch.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 136 ++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 136 insertions(+)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index dbcaf5d310..339ce45634 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -136,6 +136,26 @@ static int cluster_remainder(BDRVParallelsState *s, int64_t sector_num,
>       return MIN(nb_sectors, ret);
>   }
>   
> +static uint32_t host_cluster_index(BDRVParallelsState *s, int64_t off)
> +{
> +    off -= s->header->data_off << BDRV_SECTOR_BITS;
> +    return off / s->cluster_size;
not properly aligned cluster is a problem by itself
This is possible for older image format and I believe that
we should run "leak check" even for it and note that
in "not aligned" case one should call 'qemu-img convert"
and copy what can be saved. The error is really hard to
recover.

> +}
> +
> +static int64_t highest_offset(BDRVParallelsState *s)
> +{
> +    int64_t off, high_off = 0;
> +    int i;
> +
> +    for (i = 0; i < s->bat_size; i++) {
> +        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
> +        if (off > high_off) {
> +            high_off = off;
> +        }
> +    }
> +    return high_off;
> +}
> +
>   static int64_t block_status(BDRVParallelsState *s, int64_t sector_num,
>                               int nb_sectors, int *pnum)
>   {
> @@ -547,6 +567,114 @@ static int parallels_check_leak(BlockDriverState *bs,
>       return 0;
>   }
>   
> +static int parallels_check_duplicate(BlockDriverState *bs,
> +                                     BdrvCheckResult *res,
> +                                     BdrvCheckMode fix)
> +{
> +    BDRVParallelsState *s = bs->opaque;
> +    QEMUIOVector qiov;
> +    int64_t off, high_off, sector;
> +    unsigned long *bitmap;
> +    uint32_t i, bitmap_size, cluster_index;
> +    int n, ret = 0;
> +    uint64_t *buf = NULL;
> +    bool new_allocations = false;
> +
> +    high_off = highest_offset(s);
> +    if (high_off == 0) {
> +        return 0;
> +    }
> +
> +    /*
> +     * Create a bitmap of used clusters.
> +     * If a bit is set, there is a BAT entry pointing to this cluster.
> +     * Loop through the BAT entrues, check bits relevant to an entry offset.
s/entrues/entries/
> +     * If bit is set, this entry is duplicated. Otherwise set the bit.
> +     */
> +    bitmap_size = host_cluster_index(s, high_off) + 1;
> +    bitmap = bitmap_new(bitmap_size);
this is wrong de-facto. once you deduplicate, you will have clusters
outside the bitmap. We should use MAX(high_off, virtual_size(bds))
OK, may be this is correct, see my note below, but that's needs
a comment.

> +
> +    buf = g_malloc(s->cluster_size);
nope-nope. you should use memalign as you could have
O_DIRECT IO later on with this buffer

> +    qemu_iovec_init(&qiov, 0);
> +    qemu_iovec_add(&qiov, buf, s->cluster_size);
> +
> +    for (i = 0; i < s->bat_size; i++) {
> +        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
> +        if (off == 0) {
> +            continue;
> +        }
> +
> +        cluster_index = host_cluster_index(s, off);
> +        if (test_bit(cluster_index, bitmap)) {
> +            /* this cluster duplicates another one */
> +            fprintf(stderr,
> +                    "%s duplicate offset in BAT entry %u\n",
> +                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
> +
> +            res->corruptions++;
> +
> +            if (fix & BDRV_FIX_ERRORS) {
> +                /*
> +                 * Reset the entry and allocate a new cluster
> +                 * for the relevant guest offset. In this way we let
> +                 * the lower layer to place the new cluster properly.
> +                 * Copy the original cluster to the allocated one.
> +                 */
> +                parallels_set_bat_entry(s, i, 0);
> +
> +                ret = bdrv_pread(bs->file, off, s->cluster_size, buf, 0);
I believe that we are for sure in co-routine context thus
bdrv_co_pread would be better


> +                if (ret < 0) {
> +                    res->check_errors++;
> +                    goto out;
> +                }
> +
> +                sector = (i * s->cluster_size) >> BDRV_SECTOR_BITS;
> +                off = allocate_clusters(bs, sector, s->tracks, &n);
no way. Please do not keep bytes and sectors in the same variable
That makes code unreadable

> +                if (off < 0) {
> +                    res->check_errors++;
> +                    ret = off;
> +                    goto out;
> +                }
> +                off <<= BDRV_SECTOR_BITS;
> +                if (off > high_off) {
> +                    high_off = off;
> +                }
> +
> +                ret = bdrv_co_pwritev(bs->file, off, s->cluster_size, &qiov, 0);
> +                if (ret < 0) {
> +                    res->check_errors++;
> +                    goto out;
> +                }
> +
> +                new_allocations = true;
> +                res->corruptions_fixed++;
We are not setting the bit for the new cluster offset and that requires
a note, that all out of image clusters are already cleared and we
could safely use this position.

Anyway, this is potentially not enough. allocate_cluster() in the
further iterations will reuse holed offsets inside the image and
this potentially puts us into the trouble. This should be noted.

> +            }
> +
> +        } else {
> +            bitmap_set(bitmap, cluster_index, 1);
> +        }
> +    }
> +
> +    if (new_allocations) {
> +        /*
> +         * When new clusters are allocated, file size increases
> +         * by 128 Mb blocks. We need to truncate the file to the
> +         * right size.
> +         */
> +        ret = parallels_handle_leak(bs, res, high_off, true);
> +        if (ret < 0) {
> +            res->check_errors++;
> +            goto out;
> +        }
> +    }
This is redundant I believe. parallels_close should do the job well.
More over, we will have leak detector triggered and thus false
error printed.


> +
> +out:
> +    qemu_iovec_destroy(&qiov);
> +    g_free(buf);
> +    g_free(bitmap);
> +    return ret;
> +}
> +
>   static void parallels_collect_statistics(BlockDriverState *bs,
>                                            BdrvCheckResult *res,
>                                            BdrvCheckMode fix)
> @@ -595,6 +723,14 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>               return ret;
>           }
>   
> +        /* This checks only for "WithouFreSpacExt" format */
> +        if (!memcmp(s->header->magic, HEADER_MAGIC2, 16)) {
That is I am seriously against. Why only newer format supported?

> +            ret = parallels_check_duplicate(bs, res, fix);
> +            if (ret < 0) {
> +                return ret;
> +            }
> +        }
> +
>           parallels_collect_statistics(bs, res, fix);
>       }
>   


