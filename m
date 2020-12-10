Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E032D58A5
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 11:57:07 +0100 (CET)
Received: from localhost ([::1]:48900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knJdC-0006dj-OY
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 05:57:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knJbE-0005iL-S3; Thu, 10 Dec 2020 05:55:04 -0500
Received: from mail-eopbgr60122.outbound.protection.outlook.com
 ([40.107.6.122]:31489 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knJbB-0005N0-GE; Thu, 10 Dec 2020 05:55:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqIc8siXyW7xW9I5QZ7IMY/tmrX+52XXCC9Mf6GyNAPNX2JK+3HslhkH4UbCy7LkSAyzwxFoF33KsMG8egmllsaCNYFa+zy58Hwxi8gH8b5JU/n1ocxFuGKVB59DgduoXcWkXxfuuGAlXuUY/qk2wxkLhKMQiaRWEDUCFBsJ0U4dqyz5suQ/MBuwpZW40XLSyoxZHI3+Tqs+XDZgnvhUuzbuyzxjoBdvTB2FG8JznoPoyxFhZiMTjW8fC5oqYDXX7Yw0MiL5qo9p6dkYOdj4Tgm2epQwX/Pdxl2PzVgjtQNzztild2bL3+lYNddh61LwuvgQ1l6nJbpVeGhKheNFrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rG3LHefP0l6wkRg3X8lxjatLxctwVR0IA0bRh8OWv3c=;
 b=FMZdOLa+v99CJbaamBOBq3OKF51kQoigcalIwnbZOmhc96I2ZltjqthIfKvBPeJwO6Or6FcIkrN0kuWmE8VB99csdicbius2kHgRAZZAEYHYtHRiY32zEsER/a2Jn/aYOJNyhI9/UPF5/JakkqaQsqoSyIOeTmLj1/QuNqRovu2YYVz8Wg92AswWNnJgYQ55AXveBwBQuM+1PmGBjPe9etSPr2YrRGZv9L0sAc2v4lJwbLdNp0bLhM+Lk+jREbewTawoN4a9e1astKO2LMyt10wgSI4kC9T3vTHkYZRQy2zJBuceHnWmPOnPd8f1P81lIbg5M0r3r/vi426yvTGXzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rG3LHefP0l6wkRg3X8lxjatLxctwVR0IA0bRh8OWv3c=;
 b=CDLF4rCyAsYva1lJu5M7LHBNjjlIvj9KfQ17UjTRceAiLnHUXukKUeHKt/2RPADbcEfBm649bCO2oTEC9piYM+E7S+xKdguXqgNa+GF0D/qNwCY/wkcHO3JfTTzy4UygM8rR+L37O1u9DJCEAZ1Hm9sh7WHB5zyJw4pFrvlM0a0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4536.eurprd08.prod.outlook.com (2603:10a6:20b:bf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Thu, 10 Dec
 2020 10:54:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.012; Thu, 10 Dec 2020
 10:54:57 +0000
Subject: Re: [PATCH v5 2/4] block: add bdrv_co_delete_file_noerr
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
References: <20201209203326.879381-1-mlevitsk@redhat.com>
 <20201209203326.879381-3-mlevitsk@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c6bcf0e0-c3b6-89d8-9587-a5e43a7ccee4@virtuozzo.com>
Date: Thu, 10 Dec 2020 13:54:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201209203326.879381-3-mlevitsk@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR02CA0205.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM0PR02CA0205.eurprd02.prod.outlook.com (2603:10a6:20b:28f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Thu, 10 Dec 2020 10:54:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a99f0647-9444-46d7-fffe-08d89cfa0887
X-MS-TrafficTypeDiagnostic: AM6PR08MB4536:
X-Microsoft-Antispam-PRVS: <AM6PR08MB45368CADD7A236379C5533E9C1CB0@AM6PR08MB4536.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: alnpV3WF7Vpv46ISLazXH4bnuv4paNTsEvv0ji1oELc1+hcwVFth8keW4rPapV7Ic/ORWW0cCafaig9ApxbcRGNABqjvx5okkjtcu4sGiqjGQXvJwwyZqueD0VnoG27WtfbHilc6Q1J396iyfbFBZ82LOH2AWt0zlIi2GTTX4OcKpWtxuHH05mJoDg6OgU0ytxr4Jn3HIzgt/0JE4L7/+3cl8Uo/687X/Ze59ZGNi5+XZrTOys0oEWGVfZy6adE2HB29YwHPVvRyT22K9RXccWLpCB0WFo3lpB5n4N7tvS4SiZCMLz99pNRVlIekVa03QbHQJRTIhsNFmOEVPoIEIqlb+8MJwNPjK9FcBGy7sHhpMO16o980fAdHl+ErE6WNGSFuFJmqfgowFpSW/CrU80COa6Q+fic2BmNgtFGzYzZ44KZMbdf1LXQRYxRGhuQn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(376002)(54906003)(2616005)(34490700003)(86362001)(16576012)(5660300002)(66476007)(6666004)(66946007)(4326008)(956004)(66556008)(26005)(31696002)(52116002)(36756003)(8676002)(31686004)(6486002)(186003)(8936002)(83380400001)(16526019)(2906002)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NGZ6RmdpajUwU0l5WXhIbUNDNVROelV2bDU3emg3K2FJZFE0MlRoV29hWlJM?=
 =?utf-8?B?NmdtUlRvb2RycnNKdTJ1MmZ6TGJtK3czVVRDN3EzU01JcDJCWVYxQmtXYlRJ?=
 =?utf-8?B?Zi9DRUwwV0p0cUZLY0VHa2xNSkY1eWd2L1FURVh1NVBRa1gvWWI2M0hhSlFT?=
 =?utf-8?B?YllLRkg5dUZsN0J6d0lCMFV5WHpBQU9JWjFmT29FQ1BNSzAyL2FhMlJNdmZ5?=
 =?utf-8?B?cXV0dGNnSzZDR04vU09nTjBCMWhFOFlFV0RUblVjWHFxZmFWc3owYUZxUUlp?=
 =?utf-8?B?eWtac0tiYVJvTG5VQko5T2RzWmx4TENIclFtUWdwYWVMeUlCQTAzdlFkU1p0?=
 =?utf-8?B?V3YvcFB3OGFPYkQ3S2pGUlNmRVNNV3ViQmJteVZWWWNua09GK2NEeE9kWFIr?=
 =?utf-8?B?b1REYk9YUjNocmVCNUJiQXRHamJ2SHJhNGJZZFg3emwxUDV6enp6UG9ZV1B3?=
 =?utf-8?B?Rk1TUDA4OGJCK0lvMEFQR0FNM2R2RjU1eU1QYzBmR3UzeUsrT2ZLUTh5Wkwz?=
 =?utf-8?B?bEdIRkFzM2k5cXg2bWtxaTFnNjVEM0QwV1czZ2VuUTlNY0RsTzkyMlpqK2Fh?=
 =?utf-8?B?ZVVFWjFNbm5sRlJlTm1nU0g2YmNtbmR0NFRzckttUllkTDk1eU9sU24yOWpu?=
 =?utf-8?B?Zk5ROUdtRzNVdVlnc2ZVUTZQaFFjZ1N2SWRjMDBPL1AzQ3hnOGM4aUJXbkdB?=
 =?utf-8?B?cTBaazRUd09EOXRlcUl0Sy9tRVB3YVJya2R2T1RsOXVZU0tzMGg3WHZqWE4z?=
 =?utf-8?B?Vk9nWkU4NWRZTndXNVlHZEFvSFFVVHRqMVlBUGtsZzk2NlJ5Mzd6RkN0bC93?=
 =?utf-8?B?dnpVQWlmaU85WC9PUUZ5ZlA1RGh0alVOVFVVZEtuUXVDTHY3dGE1OXNFcFRj?=
 =?utf-8?B?aTNHcllnNXI1cCtBMDNBMUZ2dUQ1Y2EvMGxsSWFzRC9uM0dZRzhQa29rY3dx?=
 =?utf-8?B?K0VGWmw5UEtGSThtUTlNYzNuZFlUbnEycWgyY1o3NDlMNjdEbzFUU1QzbHho?=
 =?utf-8?B?MVhKZy9WNG83UFRBUXRUK0VFS2dVb1JoYjdrM2lBU0xiRVgrT3NVbytmYWNN?=
 =?utf-8?B?OEJvUkR6MUhaTmxGY3RRb3BYSW1CZlQvTFo0a1V3UFdGR2VxSklkODZOdDMx?=
 =?utf-8?B?UGQ5MU9OTDVKaXlMTVRucHNvVTBvSGN6M0c2UlNRaVljYjJROWR2N2JPMEE4?=
 =?utf-8?B?S05MMDlsNzNQOVhDRWhDQ1p1WmsvQm1QY0tWaHBqYkoxKzhrVWhlSFBRZUVR?=
 =?utf-8?B?aDZSc1VrWDA2c1N2ZUNXaStNWGhDOXhMNUlEUUI3SmwxQ1VDOWx3aHYzMmJP?=
 =?utf-8?Q?mLblGrs1jwRe24XbvZ6Fej8eEws0q4ODNX?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 10:54:57.1155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: a99f0647-9444-46d7-fffe-08d89cfa0887
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5IjL4ypTAlJMnkAH59bHraXTWHhTt8LUzMpFog2G4Ij5Ap11dJofLmAkXo0X0SPDQ6ua84R131Mlekz1F8JmlNTyrnOw6IGPEPQWdT5i+RU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4536
Received-SPF: pass client-ip=40.107.6.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

09.12.2020 23:33, Maxim Levitsky wrote:
> This function wraps bdrv_co_delete_file for the common case of removing a file,
> which was just created by format driver, on an error condition.
> 
> It hides the -ENOTSUPP error, and reports all other errors otherwise.

I've looked at original commit added this logic, and didn't find exactly, why should we hide it..

> 
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> Reviewed-by: Alberto Garcia <berto@igalia.com>
> ---
>   block.c               | 24 ++++++++++++++++++++++++
>   include/block/block.h |  1 +
>   2 files changed, 25 insertions(+)
> 
> diff --git a/block.c b/block.c
> index f1cedac362..5d35ba2fb8 100644
> --- a/block.c
> +++ b/block.c
> @@ -704,6 +704,30 @@ int coroutine_fn bdrv_co_delete_file(BlockDriverState *bs, Error **errp)
>       return ret;
>   }
>   
> +void coroutine_fn bdrv_co_delete_file_noerr(BlockDriverState *bs)
> +{
> +    Error *local_err = NULL;
> +    int ret;
> +
> +    if (!bs) {
> +        return;
> +    }
> +
> +    ret = bdrv_co_delete_file(bs, &local_err);
> +    /*
> +     * ENOTSUP will happen if the block driver doesn't support
> +     * the 'bdrv_co_delete_file' interface. This is a predictable
> +     * scenario and shouldn't be reported back to the user.
> +     */

It's not predictable for user: user doesn't know internal processes and interfaces.

The problem: we've left extra file on failure scenario and can't remove it. We want to warn the user that there is a wrong file left. Why not to warn, when the removement is unsupported internally by the driver?

I think, it's better to report it in any case.

Another reason: less code and logic on failure case. Optimizing failure scenarios in different manner is seldom a good thing to do.

And finally: why to report the error at all? If we have errp parameter, it's better to add the info to it using error_append.. something like error_append(errp, " (also failed to remove unfinished file %s: %s)", file_name, error_get_pretty(local_err))


Probably I'm making mountains out of molehills. It should work, so take my r-b anyway:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


Side note: I'd not split patches 02 and 03: this way it would be simpler to see the code movement.

> +    if (ret == -ENOTSUP) {
> +        error_free(local_err);
> +    } else if (ret < 0) {
> +        error_report_err(local_err);
> +    }
> +}
> +
> +
> +

three empty lines..

>   /**
>    * Try to get @bs's logical and physical block size.
>    * On success, store them in @bsz struct and return 0.
> diff --git a/include/block/block.h b/include/block/block.h
> index c9d7c58765..af03022723 100644
> --- a/include/block/block.h
> +++ b/include/block/block.h
> @@ -428,6 +428,7 @@ int bdrv_freeze_backing_chain(BlockDriverState *bs, BlockDriverState *base,
>                                 Error **errp);
>   void bdrv_unfreeze_backing_chain(BlockDriverState *bs, BlockDriverState *base);
>   int coroutine_fn bdrv_co_delete_file(BlockDriverState *bs, Error **errp);
> +void coroutine_fn bdrv_co_delete_file_noerr(BlockDriverState *bs);
>   
>   
>   typedef struct BdrvCheckResult {
> 


-- 
Best regards,
Vladimir

