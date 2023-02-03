Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7857A6897A8
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 12:23:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNu9i-000245-27; Fri, 03 Feb 2023 06:22:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.zhadchenko@virtuozzo.com>)
 id 1pNu9f-00023Q-Rw; Fri, 03 Feb 2023 06:22:56 -0500
Received: from mail-vi1eur05on20720.outbound.protection.outlook.com
 ([2a01:111:f400:7d00::720]
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.zhadchenko@virtuozzo.com>)
 id 1pNu9d-0005XK-Vm; Fri, 03 Feb 2023 06:22:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgDxrVUN7fUAnaMvWmhT1LaMlGnjCC+etZoFN7Q3ewKpHuROFt3vI8moX06/++iUIHIVyWLfiR1ffzYXRzKzTpF1SResxQb0zSD1GFRu0IL0MuH1K/yIU3d90V840tGplOsNuMxHyVXa61Rw0xA5eblb+KMeJeQYQVG33KKDS44iBJEJp078vY0V+EsYNnBNatyu5WEd7glTwOG7GHep3i6atBtp3zE/eQGCgphozNKyLux4q4rTbTxlduDr7KIU+nY/VWtEy9vfM1/vr0y8GApR6WhnViSDydeg3b53eGwvsjxkPQchjaUISbvT1Y8fK5K5rwmjRDGeD342AySUzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTt7nwKYFP3qPrlgiA2IFpbVIw7sYdJDWIKyQdhBvvM=;
 b=kgBl36lOx37EanNldRZ8T4Ey+y4FIB1DVPbrrh4SKMA6uJogWo56VQVYSCTDPvs7/jX9TvQMRXlmxPimMp3OywbMDhDikP4uptocJ2FlVLYI9NKL9M1hbXI9OGUJnLvCq+fcoXi4ac93smn+r58y3hfqT0GkLTm4YAgtLDCJQI50uPpxELadpD2HdcwZnGdgBmedKDnCnVBl4XZAxMrJToeLsNs3PBxQboScYI77bp+rJb1LJpvbyAbtAbfrCwzr6L+QZF7cX7LP/Pzg6X/Jtcxl2zTXgcNCkhfdxf5yQydg1eeRJlc3CInb6kxcNTZSVgRts++KIPA5mPi7zT4KkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTt7nwKYFP3qPrlgiA2IFpbVIw7sYdJDWIKyQdhBvvM=;
 b=EFHrtZzpC//EE5zEzUSsR0rwX/GmaMJbXdXBPNY/7BOy/29pDRyyBnOdq7rAVNLoCeutQH3qMAksY9IhuChUvFNXK5InTtG9eARVzQYUUKEVsVhAGnaFomolzn+AqAexYpLonu+V1Mzkl3nhhmrQRVak1OPTQmjOJTvfL2XibX1eKHVhPy4vaVeD8lpGQMgLFUZbzIwhG1pzpJog1X3KlWAof9vsXFCzSPr0/lbmZVhy4MJEdkRrwwGlRt6rVkF/zBrsVbz9ACtt3/znwDY8niOzsCytZm82NEov3dtysNw0dOerOkuP8XnJvOMcnHHnp55b+rtO4OcEsFaBygNIrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM8PR08MB5732.eurprd08.prod.outlook.com (2603:10a6:20b:1d4::16)
 by DU0PR08MB8020.eurprd08.prod.outlook.com (2603:10a6:10:3e7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29; Fri, 3 Feb
 2023 11:22:46 +0000
Received: from AM8PR08MB5732.eurprd08.prod.outlook.com
 ([fe80::d216:1e62:dc40:6ff1]) by AM8PR08MB5732.eurprd08.prod.outlook.com
 ([fe80::d216:1e62:dc40:6ff1%3]) with mapi id 15.20.6064.031; Fri, 3 Feb 2023
 11:22:46 +0000
Message-ID: <95e8349f-d0dc-1499-816a-4d0866a788d6@virtuozzo.com>
Date: Fri, 3 Feb 2023 14:22:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [PATCH] hbitmap: fix hbitmap_status() return value for first
 dirty bit case
Content-Language: en-US
From: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
To: Eric Blake <eblake@redhat.com>
Cc: vsementsov@yandex-team.ru, hreitz@redhat.com, jsnow@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20230202181523.423131-1-andrey.zhadchenko@virtuozzo.com>
 <20230202193944.63qcqpvklyoslode@redhat.com>
 <b03aa8ad-c917-b43f-443e-1fe7ee959b23@virtuozzo.com>
In-Reply-To: <b03aa8ad-c917-b43f-443e-1fe7ee959b23@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::17) To AM8PR08MB5732.eurprd08.prod.outlook.com
 (2603:10a6:20b:1d4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR08MB5732:EE_|DU0PR08MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: e57fa63d-fd18-4b59-2d0a-08db05d8f9cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9dl8lvUqXGzQCe6iBO7uqmbOjSnwTfjRgW8LDcWXb2itRqMoPCqqUq+BtWEEp9w8Bf37XVsi+QVMrrEmw+vA3vKUtzQ4BnPdPaPaKWOJGv0CqldBCi31LR6E0IU1/BcAhz1JdqxhiKWNr5l0u3ai4jDPxSZkQyG/18ehPT1jDHwfirWuJ2EeLez9c/xP04NtxXQeeU7o13p1MNy73qC5MXcXs41jHAWcspnE+QHjRKOqJ9BtsEH0+z0oRqb5ayo/frbcOVxrUnLRyOv8YGBOQFDLxeJtIQS43u/9TNe85RUEYyeuG/SuHsfx83ibN8WHbuLKvq0WUHiPPntpCYFU85wWCXszyMmfGgHI775Qq/47hDQsK5YZuw7BASacJzaU/rkvRjcd2mYqR0n3ODO3WW46TVxuM24gmJ3dzVVtOPmL9kEh4+N/z1n7mLE7TjtWy69d38WGtiPZbJmcKN4tRzpWmzE/UXjkbLof7nxC2CHbop53LxPIHecOQazIiJBkW5lnhtGUel42GFlzbn7WuGL1RAePLMr5FXO+U7XlsCNMy/eGRBJ+ANeVJ+buTiCAvsE/ayRS9Bnihnf/ToFT2jqpLSXj5AKjLgdhkVmWghsLD+Cmb612h7h9gkM0K+pVoQ7ysWhE7TCHCyosG2IYsMR56ELrmxIGxJWPrOYQxI/gh4sBzBXTAnqW0r1Jm0A9of8GD9VBcK8DPMJVB+Q+S3KtH5ry8/C46NonZngxiHhBuGLHSn6dcFHzGr4LuK5M
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR08MB5732.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(376002)(39850400004)(396003)(136003)(346002)(451199018)(31686004)(316002)(36756003)(86362001)(38100700002)(53546011)(83380400001)(186003)(6506007)(26005)(2616005)(6666004)(6512007)(8936002)(5660300002)(44832011)(478600001)(6486002)(31696002)(41300700001)(2906002)(66476007)(4326008)(66946007)(6916009)(66556008)(8676002)(14143004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmIvUjFxKzhKQ1R3TUdBMmFiQVdMMElkSW9ncmtKU2lPNm9jSFN2QzJBM0pq?=
 =?utf-8?B?TEhjMk5ibXpNOHA4L0NQeUNSUHQ0SkNKQWJqS1pUTHhkcmQxdFlrUXR4dkFh?=
 =?utf-8?B?RTB4VlRzZTBBMlltWDM3RjRPY1pyc3hkNlRyeVpJdHhlY1pLZ21rcVNsSmNC?=
 =?utf-8?B?YVRYQTIvZ245cjlaOStBYnlURWlNSHZqNXQxSkkyNU85WCtobUYzQ0ZFTkRW?=
 =?utf-8?B?Z1EvR2t1cUt4T0dzY0NUSjB2OUFxSmI3ZW5DbVN4RXd0czZ2OVQ4SXdZQTl4?=
 =?utf-8?B?Y0hkczd5NFRUc3NjdmVzb2FxZ0dnU0hiSDNVYjl0bGZnRVFQT2J4MjVUOFdv?=
 =?utf-8?B?WDN2TFUxRlpqUm5VM1ZRT1BxNDZpSzc5aE12Q21pUW9uQTlla1llRWpLNXFU?=
 =?utf-8?B?RzZEaFB4L3pEZytXK21yckxNTVhVRU41dmJZODZwZ1JOTjhIVEp5cHo1Uyti?=
 =?utf-8?B?b2VSVW9aWW9OTDl2QUhadFUxK2JUQ0Mrelo3aGRiazkwUVlwS0tkWFlrNlJ5?=
 =?utf-8?B?eDFuSDZLWUZaRTl6RzMvVExnbTN3d0p6WkNJS3Q1OHN3K0d0TVRwSFF3dFI0?=
 =?utf-8?B?bVZDc2E3UGRseHc0YUN2RVEyZkw4UEc1aStpWUNhTkZiYWhUMXZONzlGaW4y?=
 =?utf-8?B?R3laZDZzek8zVE5MdEhrd3J4UG9CTFo0Nys5L2xEVWRiUUpyaXpBY2hPMlZm?=
 =?utf-8?B?N1VuZVVuY2NwdFpLWjg2NEJHU2tDVWEweUUvSnF6cEg3TSt1eVhXVnZmTFlU?=
 =?utf-8?B?RXR4Zm5jWFNJVjViVlJvV1ZYZVpSZzJ4ZXFxR0oyTnBodVlkelpxY0FxTXgy?=
 =?utf-8?B?ZXliT2V1ZWZmQ1VUMm9ZTmxIZlF0N0lnYmVyVGJ5N3BQQVU4czhROFNnRjhv?=
 =?utf-8?B?bW9PaVRaL1plTUNHOFB2c0VjRUZacStiaWd3RnhTQkZOellnWVBxdjY4T3dw?=
 =?utf-8?B?Vld5SGxMUnV3VnRjVnE5MFlubTZmUWQrMHYyNEdhbFNKcmg0eGpTWEI1Ylpn?=
 =?utf-8?B?RlJsT296SG1oM3MvSnRlQXl3VEl6YnVraW5qTkFSMy80NVBhVEtJZjA2VFNr?=
 =?utf-8?B?d0JiNjRGZVUyVGdoNlgzV1hmVmdTZGpaZVFUVXF0OFN6TUVDOTVaTC8waWpU?=
 =?utf-8?B?VmlCc2V1V0xpOHFIRVdIc2c3SFlnRDVMSE04OHhMMHNqN0RsWUU0b0tyUVF5?=
 =?utf-8?B?eUQ0bE1mcDEvbmtMQ2xTa3JXNHhDWXpPQXF0WndjUnk4STgyYitVN3R0Y1la?=
 =?utf-8?B?cFRBOFFkWkwwc2NVY25pMzhneC9VZ1lMQ05wWmR1WjhIREhITHloWWt5RkJW?=
 =?utf-8?B?ZnE2bk5adHNpZjhwMTJjZVF2Y0crbkdTUG1wcGF1SkJnVHdUTzNiOS8vb082?=
 =?utf-8?B?U2lMRFM0bktUTkdtbldieDBHWGdiOTVsOHpoNHJlZm82em5OUHB5UzBZY3FY?=
 =?utf-8?B?Z1FTaFlzUExyOG5ZOWxBVmJDcGZLQi91WHI3emhmL2FxNFhaQ25TQ2dEVnJY?=
 =?utf-8?B?NDhkdmFBK0hqUzJLUnEzdGZ3clV5TlN2OVp0bWxEUWJVZTQvMFlIUU15dldr?=
 =?utf-8?B?RzFNZ0orYTd0WHhOL3lWbmEwOG9BUWdrVVFCN3RmL0Q4RTh1eE5SeXd0cndG?=
 =?utf-8?B?a25oUlNiZEpWT1QyWlhWZlRyN1RIWlRob3VXaHJNQTd3cllDTjJLUWpheUl6?=
 =?utf-8?B?cEM0UnU3VlhqWVBmTjR2YVV6OWw4dnEwZFlkVnpZa01GYllObFY3VmtvVU1v?=
 =?utf-8?B?Uk9UdGxMWXBYUWRBcFprZzJERldaN01Pd1d3eEVhbVpoY2FFS0NLVVB4SEdI?=
 =?utf-8?B?V2oxdFk3NzY1L1dMUDFJL28xUXpsMC9udzZiV01mY0xLNTJEK00rZnpJZUlH?=
 =?utf-8?B?VG9UVTUrRmxGNmU5VS80QmZxUWdkT1pGTlluMHBnYTRhZlZzdmRhL3ZRd2JX?=
 =?utf-8?B?dXpTUnoyTVQzS1ltTmpyZUNOVnUxUzVXQ1VWclBJQXd5N1dOaDhsTVd4MzBX?=
 =?utf-8?B?bkdCSE5kRjdGd1lkYittcWllN1RMRGpIZnNnRHJ5OFRXbWxVNzl5OHNSbGtP?=
 =?utf-8?B?REZ2SFFTdkJ2ZW03bFN3ZUpUOXFjZDJXRStUUTdLZ3M5MUJ4UDNXZzZXZmZB?=
 =?utf-8?B?ZDVkYUVwM2tMRTU2d0tRYjdmLzFQTHBRR0RCNlczQWtOUmZCazZkQlQxQmlp?=
 =?utf-8?Q?NKcWEwhWI+1a2/KknmxLuwY=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e57fa63d-fd18-4b59-2d0a-08db05d8f9cb
X-MS-Exchange-CrossTenant-AuthSource: AM8PR08MB5732.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 11:22:46.5911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e7b7j1mL4g69KkbbzXYLVsK6Eao/0fY2SmvOadSH4+oRdSmPkt/K0Qyw33+y3UgazsEnE5KemaIYYfT8+MKVNELWZrUT4ak3wspfALNtZEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8020
Received-SPF: pass client-ip=2a01:111:f400:7d00::720;
 envelope-from=andrey.zhadchenko@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 2/3/23 13:55, Andrey Zhadchenko wrote:
> 
> On 2/2/23 22:39, Eric Blake wrote:
>> On Thu, Feb 02, 2023 at 09:15:23PM +0300, Andrey Zhadchenko via wrote:
>>> The last return statement should return true, as we already evaluated 
>>> that
>>> start == next_dirty
>>>
>>> Also, fix hbitmap_status() description in header
>>>
>>> Cc: qemu-stable@nongnu.org
>>> Fixes: a6426475a75 ("block/dirty-bitmap: introduce 
>>> bdrv_dirty_bitmap_status()")
>>> Signed-off-by: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
>>> ---
>>>   include/qemu/hbitmap.h | 2 +-
>>>   util/hbitmap.c         | 2 +-
>>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> Eww, nasty bug; looks like copy-before-write is the only curernt
>> client of this interface.
> Also this only happens when copy-before-write is used in conjunction
> with snapshot-access (7.0+), so probably not many people is affected.
> 
>>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>>
>> Is there any way to enhance an iotest to add coverage for this code?
>>
> Looks like yes. copy-before-write uses bcs bitmaps, which is 64k.
> So changing existing test
> 
> diff --git a/tests/qemu-iotests/tests/image-fleecing 
> b/tests/qemu-iotests/tests/image-fleecing
> index f6e449d071..7eda9a2c6b 100755
> --- a/tests/qemu-iotests/tests/image-fleecing
> +++ b/tests/qemu-iotests/tests/image-fleecing
> @@ -34,23 +34,23 @@ iotests.script_initialize(
>       unsupported_imgopts=['compat']
>   )
> 
> -patterns = [('0x5d', '0',         '64k'),
> -            ('0xd5', '1M',        '64k'),
> -            ('0xdc', '32M',       '64k'),
> -            ('0xcd', '0x3ff0000', '64k')]  # 64M - 64K
> +patterns = [('0x5d', '0',         '128k'),
> +            ('0xd5', '1M',        '128k'),
> +            ('0xdc', '32M',       '128k'),
> +            ('0xcd', '0x3fe0000', '128k')]  # 64M - 128K
> 
> -overwrite = [('0xab', '0',         '64k'), # Full overwrite
> -             ('0xad', '0x00f8000', '64k'), # Partial-left (1M-32K)
> -             ('0x1d', '0x2008000', '64k'), # Partial-right (32M+32K)
> -             ('0xea', '0x3fe0000', '64k')] # Adjacent-left (64M - 128K)
> +overwrite = [('0xab', '0',         '128k'), # Full overwrite
> +             ('0xad', '0x00f0000', '128k'), # Partial-left (1M-64K)
> +             ('0x1d', '0x2010000', '128k'), # Partial-right (32M+64K)
> +             ('0xea', '0x3fc0000', '128k')] # Adjacent-left (64M - 256K)
> 
> -zeroes = [('0', '0x00f8000', '32k'), # Left-end of partial-left (1M-32K)
> -          ('0', '0x2010000', '32k'), # Right-end of partial-right 
> (32M+64K)
> -          ('0', '0x3fe0000', '64k')] # overwrite[3]
> +zeroes = [('0', '0x00f0000', '64k'), # Left-end of partial-left (1M-64K)
> +          ('0', '0x2020000', '64k'), # Right-end of partial-right 
> (32M+128K)
> +          ('0', '0x3fc0000', '128k')] # overwrite[3]
> 
> -remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
> -             ('0xdc', '32M',       '32k'), # Left-end of partial-right [2]
> -             ('0xcd', '0x3ff0000', '64k')] # patterns[3]
> +remainder = [('0xd5', '0x110000',  '64k'), # Right-end of partial-left [1]
> +             ('0xdc', '32M',       '64k'), # Left-end of partial-right [2]
> +             ('0xcd', '0x3fe0000', '128k')] # patterns[3]
> 
>   def do_test(vm, use_cbw, use_snapshot_access_filter, base_img_path,
>               fleece_img_path, nbd_sock_path=None,
> 
> 
>  From 64k chunks to 128k chunks (so at the read moment we have N bit 
> dirty and N+1 clean) produces the following for one of NBD test cases:
> 
> --- Setting up NBD Export ---
> 
> {"return": {}}
> {"return": {}}
> 
> --- Sanity Check ---
> 
> read -P0x5d 0 128k
> read -P0xd5 1M 128k
> read -P0xdc 32M 128k
> read -P0xcd 0x3fe0000 128k
> read -P0 0x00f0000 64k
> read failed: Invalid argument
> 
> read -P0 0x2020000 64k
> read failed: Invalid argument
> 
> read -P0 0x3fc0000 128k
> read failed: Invalid argument
> 
> 
> I am not good at qemi-io tool, I guess that EINVAL in that case means 
> qemu-io found out that image data does not follow requested pattern?
> 
> Also this does not trigger for non-nbd tests since backup job is 
> probably copying one cluster at a time.

Please disregard this.

This EINVALs are somewhat anticipated as they are also present in 
expected example image-fleecing.out (and applying my patch doesn't get 
rid of them)

I should think more about possible test cases

