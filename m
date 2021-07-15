Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C6B3C9C95
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 12:22:07 +0200 (CEST)
Received: from localhost ([::1]:44084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3yVK-0004j0-TP
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 06:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3yU8-0003uQ-Rx; Thu, 15 Jul 2021 06:20:52 -0400
Received: from mail-eopbgr80105.outbound.protection.outlook.com
 ([40.107.8.105]:17842 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3yU4-00066w-9x; Thu, 15 Jul 2021 06:20:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OzhwQkOkmLS4KfOCKIEa6FOe1qa1VwfM5hEQDnfw/l1dvNxW+u6yJNaqmtoBDtKREtkXFtTUGE3qDdby2xK6F3meZ26yJt7XBXWMjWoxuH2Z6v41agFWZQP4eYfruUyGiqf9g1EjvDd6SBkCkzMi6QPjrK7bNCffZQakzjRGXXY8myyzeDIY2D1XOFw8fdwIletS/lV0tQg38B3c60HP1ILwpcnk+Czbwx9Gf2M2A+dAW3QZQ8naGL7v4i7Yx/VwmDmMLRBIa9wqQD1nYr150s0fTANQRD1n9qlLr/e0dFccFlx/AoLUVXIwMru799znKhN2o1RqYskVzic8p0wMEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzaI7wMQSR8o/652Y7hoTlzz/IBkXGtT0tQ1JGT02xs=;
 b=kHJVb1v0XLSMVd+e0orhymYH0xmrAPOBnPZCyoAm395to63i9uyET5+D8ssnQ43Dsc71gdnwEAKpI97KadLqqp9pHjt515AoRiNuGaJiLw8p0mnD64tyLr6tDQ1GZaWrlLK3reRnt/zsg/MXvDTP70J5peeO4H3ic0Wt/5LlqYRr0eNXlGdK74FzhFsGcDs+56GUkoehIBn98Vxxw6/phh6ljrMHuCFRw999HWZ78/9bbcZEpc+hAOjaWP3RBR9gM6fWb1MoxqtgFsdsY8W8+QhQZJ17/lR2DZzabaqBEOHA1iQr97N5KgvDMnDAvy9tjnr8KhJfv869N7wmNmykMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzaI7wMQSR8o/652Y7hoTlzz/IBkXGtT0tQ1JGT02xs=;
 b=p8ril4LbhYYvhBz/0vKv27ZkMUGuP8glvu4VghqAYkRLkz0BZyXBwQ9bVvZ0lz6zYdfBs85UAQp+zUDbdl2EWGuMpIpdftldaeSC4eplacO/F270cLWl+5JtXfFOz+qPA1EDS4cxVtVZIgEiTkCfoNjw5i4FEFTu3RuX+TGRJrY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3287.eurprd08.prod.outlook.com (2603:10a6:209:41::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Thu, 15 Jul
 2021 10:20:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4308.027; Thu, 15 Jul 2021
 10:20:44 +0000
Subject: Re: [PATCH v2 2/3] qemu-img: Fail fast on convert --bitmaps with
 inconsistent bitmap
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, kwolf@redhat.com, nsoffer@redhat.com,
 Max Reitz <mreitz@redhat.com>
References: <20210709153951.2801666-1-eblake@redhat.com>
 <20210709153951.2801666-3-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ff264787-24c0-1fae-e23d-49869d067aef@virtuozzo.com>
Date: Thu, 15 Jul 2021 13:20:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210709153951.2801666-3-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0217.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.193) by
 PR0P264CA0217.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 10:20:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ff7e6bb-a1ef-40fd-5dea-08d9477a3467
X-MS-TrafficTypeDiagnostic: AM6PR08MB3287:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3287A594C6F940299541E885C1129@AM6PR08MB3287.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:154;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q9gDTDvw/PSZCm1UdFkmhxCh2fzA5twWuYmuK5+j0pMvC4t9SibEhDRN7ZTISMJib0IKnqRRlngAXtVln1QEsHWUxFjrvVzM0DFg+TxL9OGr+QtH/8DCEya9FfztDRrrtVWvAhbpainHujqsExCGvwbF001vMLG3kdBnkwOJtf101BXxZS0pG6bqR7aU7D6jqnlpHfUzromtv23YIlAzP9LKXbmfhVkqRQmltap6G45PfjAuks4kC+aW4vCjtzCcUoOY6jMIV7JIu2TlgNOdOV7uK6tdH1hVbu5A/MdY6kLHqXYxF/rzbltqGSxt3ozJQecdOjcfQnDHP9yE0gDozFpLE4GcG73uUW0k4H2IPuCsTsua57Dxd2dvrc7SJgHEi4nHebwDsi8CMXgkKWy1cu2yNJVzs3JrexWFioYJZ8GAVLZNlrzFeiFgGfxezM6Df+mAOy79895zsvVJQxBnfC7XCScu02HkBJLoFr4cxoWvztTHlg05uag+MLVBouAyHngvf00TkdrZkmV6UtDrYQBcSY4KjcgyFho1/crwd5UA3xDbdwCmByhvzBtFA42jX9tFFrBmQbF+MCZI8UajqDoaoTmoq9d8HFMcSBqf2v0tBTPAnHzcoDvmimTmB6Pkn37IMBTQId67dHcZBea1bhk6cxHo2l7GWGPCb5Frd6RyxFht4d8Bkd40z7Ub62DP5P5Kd6irl6UDi12uOORhp8WQ2yx2RbQIyNgKlIAAoKR/HQZ+sli/UWp5DXTp+LNvZeJUEGGSRMKpOekeQJ9r7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(2906002)(8936002)(498600001)(52116002)(8676002)(66946007)(956004)(66556008)(2616005)(31686004)(38100700002)(5660300002)(26005)(31696002)(86362001)(186003)(6486002)(36756003)(16576012)(4326008)(66476007)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3l5cTRGOTJzMjl4d09pemRLNXhFWENNZnVzTFJ6NFZzOFNOZjRaalA1T3BT?=
 =?utf-8?B?VERHVnR5TVF6dnNzaUVIc2pYZXROSktoM0RsTVZBdm00em10Y0tSczBsejJD?=
 =?utf-8?B?c0p3dXhQMU1NTEN6dmR0bGR4cGd4c25yUFhDS1gxWHJnU1FCK3k2d2lNVmpH?=
 =?utf-8?B?aVBxWHl2czE4N1BYbTQ0Mm9PdHRRRndkUFVPS2FJaEhSdzVNaFd1RzRVN01a?=
 =?utf-8?B?SzZHV3c0bTdKVVpGa1A4UVFpWlptWGtCdW5Bc2JFUUx5MlBZRlJyU3N3OTJE?=
 =?utf-8?B?V0xzTkJwR2dPMGlIeUY1SEF3UEFPT2VXMUExNG5JWkhobUNFVU91aHFwY2I1?=
 =?utf-8?B?Qm1sdVBTYzN2R213ZnBVWm1NNmlLdDVPaDFrcmxGaktqTERWWmNMY2EwRmZ0?=
 =?utf-8?B?MUh1RTFabFU0alBwWm91MklIUUtlUnhQWWdkbW9ET045amNpT3c2NkVQS1lZ?=
 =?utf-8?B?ck8xVkFRR3Uvb2ZaMXN1QXJGazJEK0t1V1NMWmtXajRXdGZsOURsWVhzZlov?=
 =?utf-8?B?REVhL01kSUdidk16OWVMUWNmRzk4NitaQ1pFWGRmWEpYWUFHcC8xWVFIL1Zn?=
 =?utf-8?B?Y2lnZDIxdWdCMEUvNTVhK09raHVyR3pXU2hGbm1sK0l0NlpGYVhkaVRKVm5p?=
 =?utf-8?B?QXpneFZabXM0TnF6TWs5ODVNb1lXQ3ZDYWZ4Y0tiTXU4Mi8vRHpCTktwRGc4?=
 =?utf-8?B?RGdldmF4M3FLMGQxSllvRCt6UHBGVnpaNDdEOUlUYVpoalRkSHcxdXViSEZW?=
 =?utf-8?B?QXh1eHQvamsyRzZrcDdLeUJYMTZFZXhVTE5iQTA2Z1pGdU9KeVM0RXN3OXdU?=
 =?utf-8?B?T1Q4M1JMdUFGejA3K0pmSUVWVEdJT3FHRlgwS20yY2hzVVFlMEVZNnAva21Y?=
 =?utf-8?B?dVVLVjMrMFQrZlpRaDlJQkEvS1QvemlZUmh5RVJDWG1seDZ2UVhlQ2ZFZi9N?=
 =?utf-8?B?MXBHaFBxRTc0UDFGME1VcUVIR1NQOVdOR1ZySDBtSjBUaFpjUGhCNWFMVmZL?=
 =?utf-8?B?NDFiazFha1pYZU1iUnQvRDVmNkdMSXgwcmJuSUo5VEI4Mk5wK0NkdHFKZUZY?=
 =?utf-8?B?ZzM2dnRydXVzSmJNSG5aRCs4S2N2aUs1UlZFOHpvTEl1RmJRNncxV1lDNW5r?=
 =?utf-8?B?bCtKbnJQck1YcWdkOGEraEVlaWZhRjlVbi9iUysyanZmcExLeWdwbFJvcDlo?=
 =?utf-8?B?ZGFta0wvbnF1WlU1YnN1N2dmQ2VBa0NBYk9kY3Rpc0RIbS9JQjFSWFlzV3Ez?=
 =?utf-8?B?akNFS0lRVUdpSHhRc3RtMEVsU1R3Z2JDcHNVR3NoVVJKdUQyRDdzdjhaaTRs?=
 =?utf-8?B?VW13a2t5NTVoTGJBa1BsRy94S2Z3RUVWUEhGS2FCYStEbDhabmc5VzVvWlFx?=
 =?utf-8?B?eXdua29wc1Ayc08wWHFVcXBHVTJtc3hWcjVRS0lhM2dZK3NwUklOZjhGSXFM?=
 =?utf-8?B?QitJUkdXWXRlZXZUdm8zNmc0QVIxRS9xVWVlRnFnMTF4dW1jNE5qYitqOGdn?=
 =?utf-8?B?RUFMVWR2SjFvNWV5dU1oam1BOExCK09PTk9kRi9NQUVkUmVOSVRWTEhDUGZz?=
 =?utf-8?B?NUZ0cHNPTlBoZGdzNzFJU2p5QTVFZ3RIL24wR3hmSC9Ec3VtcmJZT3VnekVF?=
 =?utf-8?B?dHRscDNDa2dtZFBFSVZ6OXFaTmoyemRuMGhQbnhIVmRMVUNBS3BkNWRaT01O?=
 =?utf-8?B?cnJjR1I0L2lQaFRtSlJtVGZoRldEcDdWWHcwMVdPR2dzeWlPVU10SFBNNGtO?=
 =?utf-8?Q?f+jB8YHjyWty+kEhaN+phV41XZ4ljitQ9OIL9zZ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff7e6bb-a1ef-40fd-5dea-08d9477a3467
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 10:20:44.1970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tRsbuE5IHyugiKRMqtZK30n0deofiEM1anYZwzZgwBalxMUl7wj3lXM+nR4Cn7/XvbMbaTQJCSZPX19EDnsoXCJizTJGyi8H7pQjak/ZlWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3287
Received-SPF: pass client-ip=40.107.8.105;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

09.07.2021 18:39, Eric Blake wrote:
> Waiting until the end of the convert operation (a potentially
> time-consuming task) to finally detect that we can't copy a bitmap is
> bad, comparing to failing fast up front.  Furthermore, this prevents
> us from leaving a file behind with a bitmap that is not marked as
> inconsistent even though it does not have sane contents.
> 
> This fixes the problems exposed in the previous patch to the iotest.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>

I'm OK as is (still some notes below):

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


> ---
>   qemu-img.c                                    | 30 +++++++++++++++++--
>   tests/qemu-iotests/tests/qemu-img-bitmaps     |  2 --
>   tests/qemu-iotests/tests/qemu-img-bitmaps.out | 20 ++-----------
>   3 files changed, 29 insertions(+), 23 deletions(-)
> 
> diff --git a/qemu-img.c b/qemu-img.c
> index 7956a8996512..e84b3c530155 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -2101,6 +2101,30 @@ static int convert_do_copy(ImgConvertState *s)
>       return s->ret;
>   }
> 
> +/* Check that bitmaps can be copied, or output an error */
> +static int convert_check_bitmaps(BlockDriverState *src)
> +{
> +    BdrvDirtyBitmap *bm;
> +
> +    if (!bdrv_supports_persistent_dirty_bitmap(src)) {
> +        error_report("Source lacks bitmap support");
> +        return -1;
> +    }
> +    FOR_EACH_DIRTY_BITMAP(src, bm) {
> +        const char *name;
> +
> +        if (!bdrv_dirty_bitmap_get_persistence(bm)) {

hmm it should be impossible in context of qemu-img... Still, not sure that we need an assertion instead.. Who knows, may be we'll use some intermediate non-persistent bitmap during convert.

> +            continue;
> +        }
> +        name = bdrv_dirty_bitmap_name(bm);

Nitpicking: a bit strange that you care to not initialize name before previous check (as it's not needed), but initialize here, before next check, when name is needed only if bitmap is inconsistent.

> +        if (bdrv_dirty_bitmap_inconsistent(bm)) {

You can define and intialize name here.. Or inside error_report(..);

> +            error_report("Cannot copy inconsistent bitmap '%s'", name);
> +            return -1;
> +        }
> +    }
> +    return 0;
> +}
> +
>   static int convert_copy_bitmaps(BlockDriverState *src, BlockDriverState *dst)
>   {
>       BdrvDirtyBitmap *bm;
> @@ -2127,6 +2151,7 @@ static int convert_copy_bitmaps(BlockDriverState *src, BlockDriverState *dst)
>                                 &err);
>           if (err) {
>               error_reportf_err(err, "Failed to populate bitmap %s: ", name);
> +            qmp_block_dirty_bitmap_remove(dst->node_name, name, NULL);

Good change, but not covered by commit message

>               return -1;
>           }
>       }
> @@ -2552,9 +2577,8 @@ static int img_convert(int argc, char **argv)
>               ret = -1;
>               goto out;
>           }
> -        if (!bdrv_supports_persistent_dirty_bitmap(blk_bs(s.src[0]))) {
> -            error_report("Source lacks bitmap support");
> -            ret = -1;
> +        ret = convert_check_bitmaps(blk_bs(s.src[0]));
> +        if (ret < 0) {
>               goto out;
>           }
>       }
> diff --git a/tests/qemu-iotests/tests/qemu-img-bitmaps b/tests/qemu-iotests/tests/qemu-img-bitmaps
> index 2f51651d0ce5..3fde95907515 100755
> --- a/tests/qemu-iotests/tests/qemu-img-bitmaps
> +++ b/tests/qemu-iotests/tests/qemu-img-bitmaps
> @@ -141,8 +141,6 @@ $QEMU_IMG bitmap --remove "$TEST_IMG" b1
>   _img_info --format-specific | _filter_irrelevant_img_info
>   $QEMU_IMG convert --bitmaps -O qcow2 "$TEST_IMG" "$TEST_IMG.copy" &&
>       echo "unexpected success"
> -# Bug - even though we failed at conversion, we left a file around with
> -# a bitmap marked as not corrupt
>   TEST_IMG=$TEST_IMG.copy _img_info --format-specific \
>       | _filter_irrelevant_img_info
> 
> diff --git a/tests/qemu-iotests/tests/qemu-img-bitmaps.out b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
> index b762362075d1..546aaa404bba 100644
> --- a/tests/qemu-iotests/tests/qemu-img-bitmaps.out
> +++ b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
> @@ -143,22 +143,6 @@ Format specific information:
>               name: b4
>               granularity: 65536
>       corrupt: false
> -qemu-img: Failed to populate bitmap b0: Bitmap 'b0' is inconsistent and cannot be used
> -Try block-dirty-bitmap-remove to delete this bitmap from disk
> -image: TEST_DIR/t.IMGFMT.copy
> -file format: IMGFMT
> -virtual size: 10 MiB (10485760 bytes)
> -cluster_size: 65536
> -Format specific information:
> -    bitmaps:
> -        [0]:
> -            flags:
> -            name: b0
> -            granularity: 65536
> -        [1]:
> -            flags:
> -                [0]: auto
> -            name: b4
> -            granularity: 65536
> -    corrupt: false
> +qemu-img: Cannot copy inconsistent bitmap 'b0'
> +qemu-img: Could not open 'TEST_DIR/t.IMGFMT.copy': Could not open 'TEST_DIR/t.IMGFMT.copy': No such file or directory
>   *** done
> 


-- 
Best regards,
Vladimir

