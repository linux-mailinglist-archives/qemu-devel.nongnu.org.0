Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A630B3A1BB9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 19:24:52 +0200 (CEST)
Received: from localhost ([::1]:43486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr1wh-0000hu-Fp
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 13:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lr1vC-0008Gn-Ns; Wed, 09 Jun 2021 13:23:18 -0400
Received: from mail-eopbgr140128.outbound.protection.outlook.com
 ([40.107.14.128]:20294 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lr1v8-0007uK-0c; Wed, 09 Jun 2021 13:23:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZBMkDHfJdPXSfdQA6w2c1NqRuPhVIg0ZGLOZg3GkjEUxPjWySk4GbNx8koZA+XW42HtM/Q8mt+KITEhR/N9GeS1VY//zJJwXQXzFjoGoSKEAZxBgDdNr2t8Ochnk0huDXHFS3h5pB92XWEtibb24sUtRO+zOZxtyGnJgA3TVV2dKmjEVwUhSLfcEP6d+70VLo87EMENiQo10bwTv2pI5f/BkyabxvxLs79rr68SBzwV8a/xKBwxVJ4SfyVIkBHXNvTMARN6rgkFTN6J5voczstuaqaf8C6+MsHZAyqBNoaSlT1QeweiaA1FfXiEMvSg/w2olVbX4Rrif+uljW4tqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yMZ3EpbcW3efUOgVHYlkTlaoYk5NWTDreMaKaaWx8I=;
 b=VNo4afOOuGUC3j9NeOavqA3jyEi2RYPyD1E17k8XvzS+vj1up4BUdzaL3t8r3UgiJcUzvXMWtGLtBfHOewITNBLIg+/UJ8T0+Xs1oFCnuA8eflnotBBeR766A9RHebiN6conVQ8w0rlyq1WSCGggFVaunww+hxw90PrxTrdm55nlS7MTo5qcMYRcEviqUo8pXGuoTdYq6uOnRjWzpaXW76b97OC+3eHVRoG6PLwsHVobfyl4EKqfwHb4BfgL0PGLl2kRPl3Eqj/cIg+5LEsFXxxCRqJkUJT/HAee1eKuK5e06VXpVisdLcc+qgLCbB2fbRgryltN0lKt3JkECoPJBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yMZ3EpbcW3efUOgVHYlkTlaoYk5NWTDreMaKaaWx8I=;
 b=qLFBjh2OUXd9vhBKqEyoGDlm6LHAgGc0axZ2KxjPGx1ce34tNEpqTaVrBCCN7F01T6REldq3ccoUY0LOjolMXmWjOViJ+HPjWp2L/Xl6Vf74ahE5ZGTi58KZMLaUxT64+Jmn46HQPC15T3YpjlKuSfmcSsClWmJufqN8y70vFp4=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3894.eurprd08.prod.outlook.com (2603:10a6:20b:90::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 17:23:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 17:23:09 +0000
Subject: Re: [PATCH v3 19/33] block/nbd: split nbd_handle_updated_info out of
 nbd_client_handshake()
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-20-vsementsov@virtuozzo.com>
 <20210603162939.a3bulyj2wlj4oavp@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5ef44900-ba5d-f29f-ffa4-990dc12adf5d@virtuozzo.com>
Date: Wed, 9 Jun 2021 20:23:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210603162939.a3bulyj2wlj4oavp@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: FRYP281CA0012.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::22)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 FRYP281CA0012.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.9 via Frontend Transport; Wed, 9 Jun 2021 17:23:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a23f14ed-87b8-48ec-d5dd-08d92b6b4062
X-MS-TrafficTypeDiagnostic: AM6PR08MB3894:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB38942CED3D298A094CC0042CC1369@AM6PR08MB3894.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QGVRD6zK+iJ2H42OS/zCeYwfueEMjY0UWLNuRWeR51+PPbgBFTzTakC5XCWZ7N40B600cBgtADWnlJ9IZY6rqCTFtJxcYlW0zp8ljqbWjpHP1COgFhFmDcOrcSOfnHWZx+GhmQ6aqqlzvZ2zeLRJPT9kcLb2gvEemx0NHQJAuzFCz/C6thHG2cjaRetRJ2XJSlXV0GzhschLenfh8xICvSdGjII9tWBisAVdzUIXSNWUKFnTPbnGZVxBIjfjYvKEsZhj7PZrog9p3WyduBgQ6kdW8kmVQpiyliX/lYceQGWs0Tm0YChRQsDQBiwLQVMq9xyB6iOPPMMzB+LR7djjHucFoqxYolAmxsZctISf3rB8XOxj8xPC3naFVITvA96mA8kk5RE6mNl6uyAmi8qsnBJrZYhZNagxffX+knM/BCHTAtYCd5acb3sYq87pKSisEpc0hr0Kr7/DOa24/eFT48cTlC7TlIpqk5hdp7ouakBTV6Ani0B9I3uunMpQmE9erMS72gOsziR6xhEmuhCskE4VNmnOi+dj9o2oCfNysc3fgfS6tiCQ28Xsbx+E1S4H+9luSEbGSa3tyTOB+gvn05dWd09GLrmZDNbREMGBDQ04iO2K9h332m5Bw29HxGrbsYCE7C0kJYO4SsM+qEKmwBrwd+DUCnXQ+ZSV43f4nOe4TScI3Hq84ZwqnOnKVE57d02k6MmUYi1aYsJwmkcyIt4XYXUzdMChx8qHG2QafiI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(39840400004)(396003)(83380400001)(52116002)(956004)(2906002)(186003)(66556008)(66946007)(16526019)(2616005)(6486002)(31696002)(26005)(107886003)(66476007)(31686004)(8676002)(38350700002)(36756003)(16576012)(86362001)(4326008)(6916009)(478600001)(5660300002)(38100700002)(316002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Nlg2UjJLK0tKQ2laOXFGRDhIamliVDdxVloyS2dXOEdDQm9CZzJEMWV5VGls?=
 =?utf-8?B?MzZDdWtJRWJhb21raEg1VmlyRmZMK1B4aHhPMXFFNjlUTGV1RzZZSTlncXcv?=
 =?utf-8?B?aFM3Zi92NWNwblhEMGVzRVVlVUw5c3JHTVBYc2ZlT09GWStQWTJEd29NTE9v?=
 =?utf-8?B?UG1UKzlUSlhvS2R6eDFQUTVJTk5iWlhyU0cxUmlhN0o1S3ZrTGp2bXdraXpT?=
 =?utf-8?B?YkUrSHd6bWlzNEkzNFJidXhTWE9aWUpJVTNHT045QlhLcUg4TjVzMWQvZlFJ?=
 =?utf-8?B?M3JFbEFVK1E0bW9WYnY0Nng1dGc5NTJSeDZ3TFduWkhIc01JTjlWLzRTVWxP?=
 =?utf-8?B?RmsyVHdFNUlKdEJaM1Zob3pBM1AvV3QvTlM1VmdnU25HVVFFLzhRZ0NkUlE0?=
 =?utf-8?B?eVBwNWFwRUlnVlhjTXloSk82SGVZTGlzNjRKbG85S2dqVUVDdXptS21RTDJs?=
 =?utf-8?B?Qk9sbkR3UFVlaHM3K3J4S0w1czlBQzJXMFdobFdwaVhub2NVTEtpT1QxdFpy?=
 =?utf-8?B?QXFxZWNhWWdUK1NGMnRjd0o0eGVZbExad2Nhczc5UXBUVHRQa0hGK0wwdU4w?=
 =?utf-8?B?WTlERStqWGRlN2RSNDlnTzlLKzJ4Q2Z2bVJLN1VlZmc5NkF0TnF6Q25UVFVw?=
 =?utf-8?B?MFhGQzFKS2E0bG9PQnJmZlZLNTBpSThwY3B2bXBCcFp4c2VrbjZvTmNVZkRY?=
 =?utf-8?B?ZjhINmdKdGZNL0lncC8zM3JzRGcyVnBqVmh6Q29SWE1qdVBaS3hwdW02WE1N?=
 =?utf-8?B?aVFHYXJrZmc5ZEFkOXpZdXI2VEhrdXpTUHNWdGJSbEdQS29OK3IvU1R0U2VY?=
 =?utf-8?B?dkEvS3QwWlM4SGZJeTVHc1Q4aFluOVRHMW5ScHlHdmlkSXZrSkp5QmFhWklO?=
 =?utf-8?B?YmdVK2pPUi9FU3FPQVJsa1VqbVc4akM1ZmFhL0lqUStpOE1ndm5BZW9qNTJk?=
 =?utf-8?B?UzYrNFlzalpEdWhKeUF5SzR4VnZUWmxVRmxab0xNNHU3YmFzd2dNR0wyMUcw?=
 =?utf-8?B?OXRRWjhpUlBmRDRKenh5TWR5UjE2WldmNTBFeUlQRE9aN3hqZWtwbnZkMzhz?=
 =?utf-8?B?WjBYNnZZVjRVeVlobVpNWmFVOVNaeHV4NHNjN211Q3dvODIxaEdDWTRrbzV3?=
 =?utf-8?B?QURGdjhRL3NuamRGVGwxM21jdGtFUWowSHh6WitpRWdXQVVmVFZQVXBGWWQ4?=
 =?utf-8?B?OUR0U2t5dEZEVUdBbVFXNTN2a1lwQlJyQXg0bHY2bzdQUlVMNGFtVGxRMTFx?=
 =?utf-8?B?eEk2STFUaytrdkpMU2taelliSGFhSGVlQUFBaFFsNllMWU1wV05IeVFQWnhv?=
 =?utf-8?B?TVBReDQvK28wOXF0a1IxSkxqQUhxemV6amZFN2xGeXJNWm1zZXcyTnpOZ3pk?=
 =?utf-8?B?R1l6QTgrekZGM2ZhczJ2dHl6RnQ0bjhGbkVyL3JYWVlxc2pMRjFyek00emNr?=
 =?utf-8?B?c1RKS1FNZm15N0krTGNqRzNpdklQMmhvaDM0NXI5aUVWOUM5YWNVdVJLWitN?=
 =?utf-8?B?ckp1U1lrUGI3c3l3WVNMc1lpUDV0SDFLcFY0LzNwbUk1YkpObW95MXNmUU9U?=
 =?utf-8?B?WWluaklMc0JQZkZiZWZSVjk1V3JZc3htWVl5Ky8ySGdDRWVZTFJpZjB4eStv?=
 =?utf-8?B?SGNQVUVmcFUxYW9odzZiWVlmY0oyZDkxSGNTTEdmVlkxQVhDWis0YjU2TWN0?=
 =?utf-8?B?Tk5HdWFHUmVLV3Z0eDJRbTFKRkMrU3ROeC9LQ2p4bmZieWNucGRaTEpJNmdw?=
 =?utf-8?Q?3zikKtZ6Kl54s+s8ToWPrRpmiYh+3VtRttr0tQc?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a23f14ed-87b8-48ec-d5dd-08d92b6b4062
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 17:23:09.2265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ZBHSVt9E0EEp89kwWEAWV7fmx8PUIAbRdKKgxSjJlkoVM9xc/KCjTCutaK1Htdv4GxS6+BoHIDcvBRaVp1+6wDjIg0uJ0dYuW7QLmre9P0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3894
Received-SPF: pass client-ip=40.107.14.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

03.06.2021 19:29, Eric Blake wrote:
> On Fri, Apr 16, 2021 at 11:08:57AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> To be reused in the following patch.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/nbd.c | 99 ++++++++++++++++++++++++++++++-----------------------
>>   1 file changed, 57 insertions(+), 42 deletions(-)
>>
>> diff --git a/block/nbd.c b/block/nbd.c
>> index 5e63caaf4b..03ffe95231 100644
>> --- a/block/nbd.c
>> +++ b/block/nbd.c
>> @@ -318,6 +318,50 @@ static bool nbd_client_connecting_wait(BDRVNBDState *s)
>>       return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
>>   }
>>   
>> +/*
>> + * Check s->info updated by negotiation process.
> 
> The parameter name is bs, not s; so this comment is a bit confusing...
> 
>> + * Update @bs correspondingly to new options.
>> + */
>> +static int nbd_handle_updated_info(BlockDriverState *bs, Error **errp)
>> +{
>> +    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
> 
> ...until here.  Maybe rewrite the entire comment as:
> 
> Update @bs with information learned during a completed negotiation
> process.  Return failure if the server's advertised options are
> incompatible with the client's needs.
> 
>> +    int ret;
>> +
>> +    if (s->x_dirty_bitmap) {
>> +        if (!s->info.base_allocation) {
>> +            error_setg(errp, "requested x-dirty-bitmap %s not found",
>> +                       s->x_dirty_bitmap);
>> +            return -EINVAL;
>> +        }
>> +        if (strcmp(s->x_dirty_bitmap, "qemu:allocation-depth") == 0) {
>> +            s->alloc_depth = true;
>> +        }
>> +    }
>> +
>> +    if (s->info.flags & NBD_FLAG_READ_ONLY) {
>> +        ret = bdrv_apply_auto_read_only(bs, "NBD export is read-only", errp);
>> +        if (ret < 0) {
>> +            return ret;
>> +        }
>> +    }
>> +
>> +    if (s->info.flags & NBD_FLAG_SEND_FUA) {
>> +        bs->supported_write_flags = BDRV_REQ_FUA;
>> +        bs->supported_zero_flags |= BDRV_REQ_FUA;
> 
> Code motion, so it is correct, but it looks odd to use = for one
> assignment and |= for the other.  Using |= in both places would be
> more consistent.

Actually I see bugs here:

1. we should do =, not |=, as on reconnect info changes, so we should reset supported flags.

2. in-fligth requests that are in retying loops are not prepared to flags changing. I afraid, that some malicious server may even do some bad thing

Still, let's fix it after these series. To avoid more conflicts.

> 
>> +    }
>> +
>> +    if (s->info.flags & NBD_FLAG_SEND_WRITE_ZEROES) {
>> +        bs->supported_zero_flags |= BDRV_REQ_MAY_UNMAP;
>> +        if (s->info.flags & NBD_FLAG_SEND_FAST_ZERO) {
>> +            bs->supported_zero_flags |= BDRV_REQ_NO_FALLBACK;
>> +        }
>> +    }
>> +
>> +    trace_nbd_client_handshake_success(s->export);
>> +
>> +    return 0;
>> +}
>> +
>>   static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>>   {
>>       int ret;
>> @@ -1579,49 +1623,13 @@ static int nbd_client_handshake(BlockDriverState *bs, Error **errp)
> 
> As updating the comment doesn't affect code correctness,
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 


-- 
Best regards,
Vladimir

