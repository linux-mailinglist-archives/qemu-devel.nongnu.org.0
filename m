Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B28325554
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 19:18:50 +0100 (CET)
Received: from localhost ([::1]:42876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFLDs-0004zU-RY
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 13:18:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFLBA-000445-0g; Thu, 25 Feb 2021 13:16:00 -0500
Received: from mail-eopbgr30097.outbound.protection.outlook.com
 ([40.107.3.97]:50190 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFLB6-0006il-0t; Thu, 25 Feb 2021 13:15:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9LeYVTBV9P0F5UT9kkfwnIGacJ1vjSeLKi5g1U0Hh64HEYt80y6vbgo+sKX+fGFxlYg06L7+N2kHDvj6VbPGLvE/JFliCgm7lmZDlBfJg+aesGu3ASe6iNoYMHF+KOJMAxezgUwYICn7tEWLGyugCkQK0DctacbP7jwsIzGCs+x+oLzc/S34A0+ij/2iIOrbSxp6tlv04WussTnQeHSgOVePcpp8S9Kc4WljWG1PfukRr+MKZCO+uSeUXkdM8c8oHzHjfSMn34DdvWXOvJw1dMKmQHLPcxI7wu/ypNgZJtwL/juwg0THWMlJJCJ4IrQj5Rq0Vd/wGQcxMgk6OwyIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egBlCZUmykjerUhpS3Dm76tM2duv7VU1fzqvzobcerA=;
 b=RsfnKs/aKGJGujvlkZipRGhmhkKNTaeviBvhXiJfdaAgvbolZ5FlhizKoUFK4gtJ9TWLJmz+WOYg9Iw6uBSiCd4/HcT4i2ChsqaU9dbinc/4KEgIgn4NTfCO/1rrK989Zl4VQnMCSUudKPbCrnUGhCi6Pvktr4wHWhB27HmegNYQKO74OD4kca7EX10WBWKqg/7yY261H6aC1ZB1Kuz1ALSE5EdhxpKZ1K3O2PrnhSP7oGTQvQ6j+lOxhi6MVc+s0JD9tfKr1oVNdI/1qyIU56CoE2q1e+niwZs9ziGb1ngm/k6jgKpyI/MnoTLCe5N0f88p7m6h+VtauFEVOCqNnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egBlCZUmykjerUhpS3Dm76tM2duv7VU1fzqvzobcerA=;
 b=QihomXeU1K8b0G9FF/2UYe/C/YO55I75uY9xzx44fzTCoZRGA/rptRVe9V0LssJ77HyNsB5jU8Ym/GdMT1mJFCR0hesD/EDeLqevkKNvPnnBQ2gRq/a03cemUEOoyHu2WsOND/yVy4n7M565RodQwR3b79mZa+OMMoBwxbjm/1o=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4342.eurprd08.prod.outlook.com (2603:10a6:20b:b4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.33; Thu, 25 Feb
 2021 18:15:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.034; Thu, 25 Feb 2021
 18:15:52 +0000
Subject: Re: [PATCH] nbd: server: Report holes for raw images
To: Nir Soffer <nirsof@gmail.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Nir Soffer <nsoffer@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
References: <20210219160752.1826830-1-nsoffer@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0066dd77-1fb8-ce67-c934-7d62f5482e65@virtuozzo.com>
Date: Thu, 25 Feb 2021 21:15:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210219160752.1826830-1-nsoffer@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.253]
X-ClientProxiedBy: HE1P192CA0004.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::14)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.253) by
 HE1P192CA0004.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Thu, 25 Feb 2021 18:15:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 860bc387-0ee1-4741-588b-08d8d9b96279
X-MS-TrafficTypeDiagnostic: AM6PR08MB4342:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4342BFD6168E3FC217B8217DC19E9@AM6PR08MB4342.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4gt9LX6KSX0tAZsfc5JigU3elFjiLplmH2sb9/YbkFEvjp012qcVWsFP7ItQ07McrlLUJGpk4gO3T4Y2q5fEuLUd6CaidD3Q2aPlgf8yC41N6lizU3bSMLmKmFgBV/lN0HxTKSlsH9tMWkfkmfJjSJsLsiEerSBMW/jCwk2p82PrJcteSzOE/sdg7S5EdzwUWK+3tWBIBe9ycjzD+FHCcS78n0V3nWvV+RH+nTr4BPO+qRJZ5slvl3xECVScrIaiwJ4OEzNkrj2nKk2Ji0uG8xJMkY9GFu9RsEFMDH9zVrkDZr7jRU8pqlBDU3Tcfehubxiec6upHe6ISv/n4BiJ/IGK/Dkl9zwOh8hGbSVA6wbDsE7sNTxXwMzJFaE1G4dP3N1mWUfW+45HasXONu7wJRtztn8lhn/LNNM+FXcBP7UXQgvjmBDMIe9jp3Cq081CjNixUGmyTSOFsIlQN2T2L5A+ziX8o3WAo2Ic7lERyD9th5ut7isDg64U17zPe+VPv5En3VNauD48h5wlJNmblV2/jvwd4b3vRLZ0upmzfhQq6dRYI0lW/rIcmnxehbTHORbMumwlNXomWzSSyCLRZZaRr05pAOdpjHNhtEn4chw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39830400003)(136003)(376002)(366004)(346002)(4326008)(66946007)(83380400001)(2616005)(8676002)(86362001)(956004)(26005)(6486002)(316002)(31696002)(31686004)(16576012)(52116002)(54906003)(478600001)(66476007)(8936002)(36756003)(186003)(5660300002)(66556008)(2906002)(16526019)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aEk5cjN4Sjg4d3M5a25scS8zc0NDdTRLbjFkQTNzYTJjQnFWUHVwSjY4cnNK?=
 =?utf-8?B?SUtORnE5QjMvQ2QzZXhidVRtTm1ZVWtCQ0x2b2hWcHlxenhQWTFBaVBHZk1j?=
 =?utf-8?B?THhUc1p4OFpZUENtOGlYZzNSaGhFMWtVMXRIL3VJcGp2OGxuZXpWbWRaMG5J?=
 =?utf-8?B?WVAwcjR1STZrQVdmZ21OckN4Y0ptMzU0OUhkUzhJNmJib0VzVUlRbXR5dmFv?=
 =?utf-8?B?aDQvczNPUjhJWkNiSTA3S2RCaTZ5V2RJaTdpNFJIQktxcG05b3FYZ0VXVnkz?=
 =?utf-8?B?bW1rM0pDdGNTeUp6RWJ0bnp5bDFOVnNkZ081NS9SblV2RjdHSXBYa3JjUjYz?=
 =?utf-8?B?cUtTT0kvTEE3SXVYazdRajBEbXloT1hCbkdQdUdKUncrUFh0cUh0NzNZbTZr?=
 =?utf-8?B?WTRjL2tvenhvMDZsd1NhNXZxOVBSRDBpNE1ueGxyNkFFdEZicm1ZajZzTmZ4?=
 =?utf-8?B?U1c2NmlGcTVDMS96dkYvYXhhV1llR01CU2hlMzZNakg0elVSR0VwTHJLTTlR?=
 =?utf-8?B?bndYeW9BZHpSc2VVakovYzNVV3hQRWVDblNtd2hEUjVqTTFDVDNZZWtHdTVK?=
 =?utf-8?B?UEYyTFo5TzAvNVdhWW1LbUE0TW1iNzZYWHFoNHJUTXYxK2drRWZaREorWWtK?=
 =?utf-8?B?YWpKTUNYVGhvSXRSMGs0SERmZ09HWEM1YTkxT0tqNVBVbWRrbW5CdHlrL3VQ?=
 =?utf-8?B?MUcwT2I4RlliVnkrbUVhWG5yMXNqNUQrR0N0MmxmWFErNVZYK0t6b3NaU0V6?=
 =?utf-8?B?WWVBUFRXeG5kQTdIL2xCK1pUZ3NRVEF5b2p2Z3F4U3BEd2lrRnFqRDFOejdp?=
 =?utf-8?B?N2FVYmlmNm5rdkNnbjdOaVJJU0FyM1ZmdWxrL3NTUjlFczBZV1Z2SVZ0RVd5?=
 =?utf-8?B?aC9UbGNIaU5VdnhnVE1nQnNmanBSdG4vMFlzejJTYyttL0szOVFac250UUJm?=
 =?utf-8?B?TVMramE0WU44OWY1UFdadmtPai9XUnhlYUtUQ3VmNEpXZDVvRXhnV0VtR0NJ?=
 =?utf-8?B?VXZLOWloS2ROTFNCOVppOExxNm1ib0w3dnYrOXJ3V3pSOXI0SWJVOVV1QmxS?=
 =?utf-8?B?N2YxU3U3dHdEbmxkZ3dpNDVDZ1RqSzF2dFF0R0ZLalhETWpYYnB4RzRYU2NL?=
 =?utf-8?B?SzhJV3ZFRmEwbEM2WHpJZmJCanFDQjVWdHhnMkluNXFtbjlvdzUrSDNhNmZq?=
 =?utf-8?B?WlU3ZnRoL0haOTZyZkNWOExuSVIrd1MyalVONDE1V1RuWVFlVDNHQ1B0ait0?=
 =?utf-8?B?OXp4cndYNVZmcitJTlNmUXdiV1plaUpyMEszbDh2SmcvWHJrdGVzWnhadzFE?=
 =?utf-8?B?RHdnenF2bXVZMlpraWRCVHF3Y2JzWXc1S2lQcVI3czRDaDRGUFVwcUFGbVhV?=
 =?utf-8?B?NHg4anB4RlpnMTN2a2plZ25iTksxUUdIT3pid0F5TVNpenQ1UUI5STR5Sjl3?=
 =?utf-8?B?cDJyTG9leWVjVC9ybDh6bFhhLzYyZHo1bjY3SU90VEpmbEY2UFFpS0tFSHR4?=
 =?utf-8?B?WmhrQmpHRlo2OWdKa1ZGQkUxbU5QSk9FQWg3d3BNUURtL0hBTTU2a3IwMnlQ?=
 =?utf-8?B?RUh3TzJoWjdueVVhdlFReU5sVmZsaE5seFQ0cUxtQ05qb0p5eGw0QUQxZmM3?=
 =?utf-8?B?TTBhbkFSY3lnOGM5azJXYTcrQzliR0xTUWtSeHpYSXRpanNrWVNIVDlBVTFR?=
 =?utf-8?B?d1dmWWhXRmFEZ3dTMmNWS2MrMTlBRE42RU90SlUxNS9pY0pmTmg0RmQybmJU?=
 =?utf-8?Q?vYmmNmyk9kMp4rELhpgi9dD/+6zDYNJEUhRcuvK?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 860bc387-0ee1-4741-588b-08d8d9b96279
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 18:15:51.9591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AkCJ1KajZweG0MhNHHstL5olQ3xbesSSIU/OTZirJ6U+ayqE64Qk4TI8MKJkqT9usj6EZwWKbtyhVlKXyovrPwYI6VPazfajHWlb+YJTjpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4342
Received-SPF: pass client-ip=40.107.3.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_NONE=-0.0001,
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

19.02.2021 19:07, Nir Soffer wrote:
> When querying image extents for raw image, qemu-nbd reports holes as
> zero:
> 
> $ qemu-nbd -t -r -f raw empty-6g.raw
> 
> $ qemu-img map --output json nbd://localhost
> [{ "start": 0, "length": 6442450944, "depth": 0, "zero": true, "data": true, "offset": 0}]
> 
> $ qemu-img map --output json empty-6g.raw
> [{ "start": 0, "length": 6442450944, "depth": 0, "zero": true, "data": false, "offset": 0}]
> 
> Turns out that qemu-img map reports a hole based on BDRV_BLOCK_DATA, but
> nbd server reports a hole based on BDRV_BLOCK_ALLOCATED.
> 
> The NBD protocol says:
> 
>      NBD_STATE_HOLE (bit 0): if set, the block represents a hole (and
>      future writes to that area may cause fragmentation or encounter an
>      NBD_ENOSPC error); if clear, the block is allocated or the server
>      could not otherwise determine its status.

So, it makes sense to repot HOLE for lseek holes on raw files (as write may increase disk usage) and for qcow2 ZERO clusters: again, writing will lead to allocation of NORMAL cluster.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> 
> qemu-img manual says:
> 
>      whether the sectors contain actual data or not (boolean field data;
>      if false, the sectors are either unallocated or stored as
>      optimized all-zero clusters);
> 
> To me, data=false looks compatible with NBD_STATE_HOLE. From user point
> of view, getting same results from qemu-nbd and qemu-img is more
> important than being more correct about allocation status.
> 
> Changing nbd server to report holes using BDRV_BLOCK_DATA makes qemu-nbd
> results compatible with qemu-img map:
> 
> $ qemu-img map --output json nbd://localhost
> [{ "start": 0, "length": 6442450944, "depth": 0, "zero": true, "data": false, "offset": 0}]
> 
> Signed-off-by: Nir Soffer <nsoffer@redhat.com>
> ---
>   nbd/server.c               | 4 ++--
>   tests/qemu-iotests/241.out | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/nbd/server.c b/nbd/server.c
> index 7229f487d2..86a44a9b41 100644
> --- a/nbd/server.c
> +++ b/nbd/server.c
> @@ -2087,8 +2087,8 @@ static int blockstatus_to_extents(BlockDriverState *bs, uint64_t offset,
>               return ret;
>           }
>   
> -        flags = (ret & BDRV_BLOCK_ALLOCATED ? 0 : NBD_STATE_HOLE) |
> -                (ret & BDRV_BLOCK_ZERO      ? NBD_STATE_ZERO : 0);
> +        flags = (ret & BDRV_BLOCK_DATA ? 0 : NBD_STATE_HOLE) |
> +                (ret & BDRV_BLOCK_ZERO ? NBD_STATE_ZERO : 0);
>   
>           if (nbd_extent_array_add(ea, num, flags) < 0) {
>               return 0;
> diff --git a/tests/qemu-iotests/241.out b/tests/qemu-iotests/241.out
> index 75f9f465e5..3f8c173cc8 100644
> --- a/tests/qemu-iotests/241.out
> +++ b/tests/qemu-iotests/241.out
> @@ -5,7 +5,7 @@ QA output created by 241
>     size:  1024
>     min block: 1
>   [{ "start": 0, "length": 1000, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
> -{ "start": 1000, "length": 24, "depth": 0, "zero": true, "data": true, "offset": OFFSET}]
> +{ "start": 1000, "length": 24, "depth": 0, "zero": true, "data": false, "offset": OFFSET}]
>   1 KiB (0x400) bytes     allocated at offset 0 bytes (0x0)
>   
>   === Exporting unaligned raw image, forced server sector alignment ===
> @@ -23,6 +23,6 @@ WARNING: Image format was not specified for 'TEST_DIR/t.raw' and probing guessed
>     size:  1024
>     min block: 1
>   [{ "start": 0, "length": 1000, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
> -{ "start": 1000, "length": 24, "depth": 0, "zero": true, "data": true, "offset": OFFSET}]
> +{ "start": 1000, "length": 24, "depth": 0, "zero": true, "data": false, "offset": OFFSET}]
>   1 KiB (0x400) bytes     allocated at offset 0 bytes (0x0)
>   *** done
> 


-- 
Best regards,
Vladimir

