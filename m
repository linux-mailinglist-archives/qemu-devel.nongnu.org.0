Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7C83F7263
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 11:56:28 +0200 (CEST)
Received: from localhost ([::1]:34052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIpdz-0005TC-Ot
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 05:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIpcd-0004Z0-R6; Wed, 25 Aug 2021 05:55:03 -0400
Received: from mail-eopbgr20128.outbound.protection.outlook.com
 ([40.107.2.128]:62336 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIpcZ-0002E2-Qf; Wed, 25 Aug 2021 05:55:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QIt5CNFuw/t/RjilPokRd9GaMhEpksCw96svmIUWr5jBXLspItI3T/6TjFsdo994R/mGh01FBvY68AwIC3KOODEDNVbRTOB2oUoIUkn+spw7jM7818W8J1rdoWjm7pv1jlZnHojUkfjGfJv2yx1ia/yghffe5k4mHq15bqShyRaU37+D5n8Tah0XG03PeodtRhanxs2KoNRVusQNq1SAt38PQflT0tKM+xqftEGKEyvBMhQGV0S10N5qzlQKUvI4DpZGPT7JBaw2merzuxhBmmgNcZNc0FmXqs/Vz3AzWOFVuHByTw54MsRldzGIgsEge2EHc4cwqVpqeeJmH2vHQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmpHdHm3jFlFdnwk8u/CpqoUyJFfOK3/cb7TmARTiyQ=;
 b=m/iGYJEPGBJSMxytD3y0lWr6jTrXEIXW901kOImGEzEZ/IbeUIAD15z7YM8XjJFUKmhkGlimpfAxdDvaaWUBO24hrBDM2DY6xoR5YjeQJyUsz1kbJy7/wEJcoN5o7c4PFMMslwKOYpUp/y3Ppgz5CI86gzU7fnUuBj7k5VmUCL0aHZyJuec6W0Xm46CpmuYQ+mJZDH3+gctMNj+395cgybjOn5dMaIyv3PEDPxno2sfqnItR2gwRAzSdGiOEIEm3pn1qxZPvfrWJCXc5D1fAboPbWPQbELcSe6A8CQnh0nvp7wEtvKdOk7CQcOeP0K0tNcpy2knmrZ7zc/9w5mN57Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmpHdHm3jFlFdnwk8u/CpqoUyJFfOK3/cb7TmARTiyQ=;
 b=aFguuVXGiJhIGXJR+BwTd0xhRilDE4mjDgT9MK0r3kLlMxFFL/IQzZj/Ut+ftOUFvkZ4asALWWCWRbUqbIQ3hlWJpZ/I8asN3tFM0dUa32Eun1jooq9NnsmI8M82lfS1m4Emd/9Kb04Rscb6IMorvTN8lFAao5nfzeK0w1Rfrq4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3446.eurprd08.prod.outlook.com (2603:10a6:20b:45::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.24; Wed, 25 Aug
 2021 09:54:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Wed, 25 Aug 2021
 09:54:54 +0000
Subject: Re: [PATCH v3 2/6] block: block-status cache for data regions
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20210812084148.14458-1-hreitz@redhat.com>
 <20210812084148.14458-3-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6bac72ce-2257-8d97-57d9-f70c1a7891df@virtuozzo.com>
Date: Wed, 25 Aug 2021 12:54:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210812084148.14458-3-hreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P189CA0001.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::6) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.249) by
 AM8P189CA0001.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Wed, 25 Aug 2021 09:54:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff9b652e-92ee-46d8-a1f2-08d967ae6392
X-MS-TrafficTypeDiagnostic: AM6PR08MB3446:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3446D7D2FF3F594D2EF4D448C1C69@AM6PR08MB3446.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uy0HQwGqlGhEV0e0iR/GwXPxJG71rdl3WW35QBQpI0s2FPpCCldX2IzD1+7cSVvS4nAeOauSnAYG1jMf+jKOxgmkxlpRQU2wKZ0XOPzvKV/fcDS0ayXV9EybdoJIUmFi7IAn931es0rpyrrm79TnFuwY65T9/DjWQ0hW2PC4Gczn0wbuOcdcybuRxvQ5NgXeg/gmXVCSRUSTbCxiGRpNAX9DCEtX6KOux68miFismSNaskX9RPziR6LbojuPZDz++dcl/fBFX/O0tIsA5u3WSRjdS66zLPXE8tkoHrjiic7wy9I0GmsOTkTuW/nFNIj8QyJBQYhDG0/Yb56m1XGdae8l39j1z8cm+2CPMUfkFAanSGck0qsZXmIe8ch1sEhPaESDgWvUjriMJqvCuoB+00LqrAxQ0B7+5rOcululvbuSyljrmJWofQ21VV9gSfAzGL4W+MimOThEnYk6HiY7Gnt1YxHhigDJLqLsyWPMrpTZFw6+DfFiAgKdOyhIJsspSd603j9wN2MITsznBFY8nZXlAwf/cqC/DRhnz+2781hkFPyWxrezDzDCX7PAvVqmiPxPT1hBtTFQU+SD8qNDcASgevQpnxRrzGgomSU9jRSIGxc5KFUqI4jbtPkKnaKjgUq/Zzw4y9v6GcklmRdL8R5X+rWbOL9lOo3Eojh7bXu7soFRB8fRo574VIWnS2ugtBKXuxMtAhXdMhRLJsozMakrL06pRuYm/3N+9T8DKgIVQtiULlgj7AA602MswTBDtI2r+YO/8nK3yv78O7mPELPdtKPGZpL9Y6YYZWSAiqgGY94X7jPJxYRE1RyYCR5pNAvscR43O76mb9Iyum9WBtiCNZ1a5zk9jwwsQJ4cpcNdC8q1YXr/Sx1ZaDemtAp+NvgwjPYrWYwe8inR2JuhkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(136003)(376002)(366004)(396003)(38100700002)(38350700002)(16576012)(31696002)(66476007)(4326008)(86362001)(66946007)(36756003)(2906002)(31686004)(316002)(52116002)(8936002)(26005)(478600001)(966005)(5660300002)(8676002)(186003)(83380400001)(956004)(2616005)(6486002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3lrUUtjZDVIVGNEczNodmZuenc4NEptdlUvVGUzZUZXU3o1MTdmdi9jK0NH?=
 =?utf-8?B?TklDN21IUnZ6MDgzRmFRZUNqRmR1eWR1OUYwMlNIUVk1MzZ3WnBxbU9VZU1O?=
 =?utf-8?B?N1V1ZldjemJaS1VxU0FrRmVyV0t5NWZpNDVWbXBBTWIvbXAwYkhEdHB4Sy9I?=
 =?utf-8?B?dXJ6ZGE2S2Q1bitqWUJGYXNOWjg4cjFhSDd0clI0QUx0SnFkRUlhQm9qUHJy?=
 =?utf-8?B?RVhlNVBrcjhUYVVIdFZxdmxwbmRoblI3OVV3aW15QmhweTV3U3oxYkJNTk9P?=
 =?utf-8?B?ZTdVd2ZaMlllekgvWHl5V3Njb2hOQ0FzTVRpQ25zYXhMaEdXZ1FNVEYzTFl6?=
 =?utf-8?B?NUtmU1lnWlFtaUFpb1RET1NqZzZWYk16em5vU2R5V2lkaWY4OE9xZDBaNTN5?=
 =?utf-8?B?bGlBTHhtWk0zK3ljZDk1MkoySDZvckh3cHdLRmhlTXdzRmsrcStkNnQxcnVF?=
 =?utf-8?B?ajNBOGxFMTA1ZE1LcTNmbXUwN0NSb3ZVZjdhUzZCU3JxN1FraVlRTWlsbHgv?=
 =?utf-8?B?SFpJdXJsYzJmdDVBMmpPTVVMM1hsTDF5ejc5YVZ4UE51RlZTZi9EMmlIUDMx?=
 =?utf-8?B?R0R0cHJTS0l3NWdLS2ErMzEveEJlVTM2VnV1NEh2MUROZG9KMVFNaE5Ld2tW?=
 =?utf-8?B?c3FNSzRKTUlmU2JFdkZZWWMwSmpsMkRtSEhrVllPbzBnYm1LTEdFZFMxSGht?=
 =?utf-8?B?QzN2cFhkYXFja2owdjZQZDdFRDJYMm9xMkJ1U1pVTm9BcXRNcERWUXJLVmxj?=
 =?utf-8?B?UU4wSkt3WmtHeWd5NWFSK3JZUVhNMDdrU0ozNHBiMWo5YklWLyt0QjZheDRB?=
 =?utf-8?B?QTlreGNGUlF1U0NiYUZtUXRXTi9ScmhDSzBHQnFzWVU0cytNQXFlZUhkNDI5?=
 =?utf-8?B?MzNwY0VGLzhKSGtDeGtPU2FOeWxHcnEwS1VGeWk3ejF2c0U1eTRhcGIvVUJV?=
 =?utf-8?B?bG51S0ZoQlB6V2l6dW1iY3l1R0UzdHBMZzg1bUJtNzZvVnNYZ3h1RlpBakhi?=
 =?utf-8?B?eDJsMVdPcWN1UkhmUG4rYVZpV21SMmFvVGxsYU5nY1lOUXBXNWF0bEdEZ2VI?=
 =?utf-8?B?K2JLSldoNGdPWVJ6U1VuMTBmdFpqbzJkWTlmQ0tWZmZLQityT1RlWWhQOUdi?=
 =?utf-8?B?bmhJZ2Z4R1kzeVZuUzNNQ2wyKzhHOGM2T0dnN2MzWnU0WEtxdEEwWCs0Tmll?=
 =?utf-8?B?eXpidHJYdW9YSjJ2MzV6MG5JZFNEVysrSCtXV1JqMGxwaTg2RWJmK3RJUFRF?=
 =?utf-8?B?R0V5MlQxb1NRU0s4S2IzQnBmZnZLemtJR0UzYjIyOENpUGszS29adEtkWjhD?=
 =?utf-8?B?SVg2eGRGeUlFVVloa3NZS29VeEh6bUJWdG5VU2FtbGUycWJqYzMrbkFCS0lV?=
 =?utf-8?B?SUI4cld4aE1MZjQ4czZqZU1ZdmFzaUExdjlNQ0dzUHRVL3h4Q29INXNMbHBr?=
 =?utf-8?B?RWtWMHVKeEg4ZnV5M1hUS0dsZGNmVElRb3Y4Yk5SaU1SUVE5V3ZZeVVaak5y?=
 =?utf-8?B?azFFblRnRHRYUFgzcGZzWnNxZnN1NHhTdHl5T0duQ21QcFZDOEFXakRqLzI4?=
 =?utf-8?B?SHdlRWpoWGpsSGQvSWlQTXM5aGZ0M3EzTEg1VmZNQTVueWQ2TUgxb01oaE9U?=
 =?utf-8?B?RldFbHhqRHkvcUJLNnYrYmhFUHN4UXIvU1hjYktwMFcybUh5WkRrdDdhSHJY?=
 =?utf-8?B?RnQ4SHV1aVdscVRuTWxWV3ZKS0VNdmFDeHdkQ3pRY01CZ1RYdGl5TWJpdzl6?=
 =?utf-8?Q?M04wNoRhYS6qbPlqfIGmx788+vl+tmCuUhWaTT1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff9b652e-92ee-46d8-a1f2-08d967ae6392
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 09:54:54.4062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FcIqjohrWbANug+ba84bApIKbZyn7VlB2uCVht1QDzoAgchaLTdRE7n7YfIfPtvXlBUdNrUFPdrM586sbr+EH9ZhF9gQpy1zkpDTOJ3Ej9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3446
Received-SPF: pass client-ip=40.107.2.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.305, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

12.08.2021 11:41, Hanna Reitz wrote:
> As we have attempted before
> (https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg06451.html,
> "file-posix: Cache lseek result for data regions";
> https://lists.nongnu.org/archive/html/qemu-block/2021-02/msg00934.html,
> "file-posix: Cache next hole"), this patch seeks to reduce the number of
> SEEK_DATA/HOLE operations the file-posix driver has to perform.  The
> main difference is that this time it is implemented as part of the
> general block layer code.
> 
> The problem we face is that on some filesystems or in some
> circumstances, SEEK_DATA/HOLE is unreasonably slow.  Given the
> implementation is outside of qemu, there is little we can do about its
> performance.
> 
> We have already introduced the want_zero parameter to
> bdrv_co_block_status() to reduce the number of SEEK_DATA/HOLE calls
> unless we really want zero information; but sometimes we do want that
> information, because for files that consist largely of zero areas,
> special-casing those areas can give large performance boosts.  So the
> real problem is with files that consist largely of data, so that
> inquiring the block status does not gain us much performance, but where
> such an inquiry itself takes a lot of time.
> 
> To address this, we want to cache data regions.  Most of the time, when
> bad performance is reported, it is in places where the image is iterated
> over from start to end (qemu-img convert or the mirror job), so a simple
> yet effective solution is to cache only the current data region.
> 
> (Note that only caching data regions but not zero regions means that
> returning false information from the cache is not catastrophic: Treating
> zeroes as data is fine.  While we try to invalidate the cache on zero
> writes and discards, such incongruences may still occur when there are
> other processes writing to the image.)
> 
> We only use the cache for nodes without children (i.e. protocol nodes),
> because that is where the problem is: Drivers that rely on block-status
> implementations outside of qemu (e.g. SEEK_DATA/HOLE).
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/307
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>   include/block/block_int.h | 50 ++++++++++++++++++++++++

[..]

> +            /*
> +             * Note that checking QLIST_EMPTY(&bs->children) is also done when
> +             * the cache is queried above.  Technically, we do not need to check
> +             * it here; the worst that can happen is that we fill the cache for
> +             * non-protocol nodes, and then it is never used.  However, filling
> +             * the cache requires an RCU update, so double check here to avoid
> +             * such an update if possible.
> +             */
> +            if (ret == (BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID) &&
> +                QLIST_EMPTY(&bs->children))
> +            {
> +                /*
> +                 * When a protocol driver reports BLOCK_OFFSET_VALID, the
> +                 * returned local_map value must be the same as the offset we
> +                 * have passed (aligned_offset).
> +                 * Assert this, because we follow this rule when reading from
> +                 * the cache (see the `local_map = aligned_offset` assignment
> +                 * above), and the result the cache delivers must be the same
> +                 * as the driver would deliver.
> +                 */
> +                assert(local_map == aligned_offset);

maybe, also assert(local_file == bs);

as well, we may check only BDRV_BLOCK_DATA flag above and
assert BDRV_BLOCK_OFFSET_VALID here

anyway:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

