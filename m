Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DBB5B089C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 17:32:24 +0200 (CEST)
Received: from localhost ([::1]:38350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVx2N-000231-El
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 11:32:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oVwzA-0007ok-R6; Wed, 07 Sep 2022 11:29:04 -0400
Received: from mail-db3eur04on0719.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::719]:58596
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oVwz7-000063-RX; Wed, 07 Sep 2022 11:29:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8AsT+HFRcvPGPugQUs4GEobBTo65OdhuC7e0szeUUEslyR5JkFR1jYlTHxpt/xHEfFdet4ZVBYGp7yO7TNVGvMC0GFElrsLEGiR9xeWP2x/p0S/1Pk3tnhua0BtbTzsAYzKc/jOOieTHxX4jn52r3VDdidlm5sxMT+DOAqcaIGUUqAIgBnJ3JdKiVE0gEbdjk27LKD6a7R197kkSDYOfueHDlJg04rFaiUmSE8LCvie5YiZmpnS9KHh5C8o6NcpcBQV4PUNT366JlIDTGGYGf6eilZ+pwRJmKXx/9cGMcHlaBnig53PciYMVpF3JW4FVu0wIqvzv28pyHaYjUg/7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6zAcGmEWAONrqbuwHRJEHWtQnb5R4ZmT84xe/FrUpg=;
 b=QrsvcLQEXUpuLKZ6svEAnGDG9abobGdoYESI7/BLlGgKvB6VQmlMaz3z1F2OuEoCHa+j+4W8NNDfa5zx6J2RzVBKrCfnxco+Fwv5XcwggtY5iQCYHPGK5xvxT7eKGXPKJHHhtGXi2q49zdjJvieegBIYrjkefsM6KBnAnDy4szMBM2/0s+ma+rw5s2EJRVDhGgNX2/bFNnBNagAwHxgxSC4jsGD79o+kFvhvZ72uCIh2iDU1R3XwKrWWsy6jbc7wkyjr/VOI6N9pqw75P1tCyfKeC2PEr3dlXhhTPFnCWYjv9SYapyIiigU06kqZyyBmkeJgbhCrhN2mk1n0Di93VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6zAcGmEWAONrqbuwHRJEHWtQnb5R4ZmT84xe/FrUpg=;
 b=yi+sqqtheD8KQIa87epu6OrwGMF4TochdGzImuXFx5C2Ti8QlAo9G5MOVP4AuaWI395YD/F8lT6fDZVUFXcTnDeACiKrFYrOzCEUkhO7oWvs9sTPy8xK1f+ur0EIPmjntMJ7awkQyKa2cNPhpK2gqkfNHvwwA/vdhmtlsntdYtH7nbS46kj6HH+j0maB3RWV0gTan4FzxJuMmiAXx00OfQouagNUk/huZzrMMoVNDYreUnNhZwKZRvtC0ro07E2uF1eOeFqDPhczY5G/RNla3K2RXlXZA8ey/av3Yu4HM/+gugRPPYN3zHr71zvnq6OkeuMG8TWewMOl1tYHYSggWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DU0PR08MB9726.eurprd08.prod.outlook.com (2603:10a6:10:446::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 7 Sep
 2022 15:23:55 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::5593:9fae:255d:ee6]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::5593:9fae:255d:ee6%4]) with mapi id 15.20.5588.016; Wed, 7 Sep 2022
 15:23:55 +0000
Message-ID: <f818eb67-2a45-d84f-1064-efc3c554d368@virtuozzo.com>
Date: Wed, 7 Sep 2022 17:23:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/6] parallels: Incorrect data end calculation in
 parallels_open()
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220902085300.508078-1-alexander.ivanov@virtuozzo.com>
 <20220902085300.508078-2-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220902085300.508078-2-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0501CA0006.eurprd05.prod.outlook.com
 (2603:10a6:800:92::16) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3083e5a-21ba-4f68-2cf7-08da90e4fa3d
X-MS-TrafficTypeDiagnostic: DU0PR08MB9726:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y9gtT5fQPLG9l+Sp6wJGI+GAJT4efCTfagwW5SPBEaUqCBxJ+WrAZPYEhoYyaq3rv+zzYB0Yb2yGP2z3e2mk/mPX3Pp2XDw0DiLCeXAS7oYDYo5Gjbt+J0j2KtbUXuHMW76GuUqo/4kZKaYGgOVbcqX1fg7zvLLwbW1uI49MQxiaeZRFSXvaUW0NGFcE6JKYmULQk3IYK4mrDKIVwX6LoZGZqUx/wFLrLpwmgReFliB3tuI418+lnrnv+JN5dqSenA/MQr7nwOPYRbWqK0BFtKuXJV6xUay+oxTs345MyRLZqooNwmpSWSi9VQUqHVyFcu7DdAmL7id2vOU4wO/Bd4DD86xKxReU7kEz2yjYlvDmogPtH96Xbxu9n9dFboG0CTXrvscS2PvVzjA5ZEGASbLOJ3gJeFTEjV/QVnYtZvZ+CcSn/amEaauPfLTUD/G7xlPoSzl0z3F2CMfyX9jDD2bCfTbalkzymjuakUahdN+bzD4qEYEHHn9cwwqR+P29bywU16E+5JVh+y2/1QT7jz0MV/+5v3rRzZmVwjowvqK6pJfdOXTePmtTEHvPLzLPtP+hKdz2YkXgrM2aYkI/yoSX19ShaSe7LEzbEjtOPq+TWc89/AHK36P+/8Yo+yI5TAHf7/AqOrTtsSpBHkQ8JL7NfWgD5ArgGAznUjWez34HOTIQXLLkf6mW2F3PbDI60iYzeWxbipBtfdAXM1wxFVx01MZiUyXE5QGcFVw3Yg3j+g26xTU5q8XMVXRL1+scqKvi/CrFB90drWxG/IcJkW4VP8QB9jRftCzZcWkFklmX29bAXONr+4HsstsTR8CuuKELx7oQcR6JCO1G5zXZNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(136003)(346002)(366004)(39850400004)(31696002)(38350700002)(38100700002)(316002)(5660300002)(8936002)(8676002)(4326008)(66946007)(2906002)(66556008)(66476007)(186003)(2616005)(41300700001)(83380400001)(6486002)(478600001)(53546011)(52116002)(6506007)(26005)(31686004)(6512007)(86362001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sm9XN253b1BZSjFtS0tYeUdMQm1IS3FJelFpWnJPbXUyN05qWVRCeFNBaDE4?=
 =?utf-8?B?QkVVUTVjakUyR1ZJbC94UkNZR0dFeENock00MFFlb1pnZUlDVHVudEFqc29z?=
 =?utf-8?B?eVBlbUFBZWd4aUZKTmNpaUNyME9QaUdjVEs0TFlLMUgxZFZ1aUwrZHNzSmVF?=
 =?utf-8?B?Qk1RMU0zTzBBUzN1R0pxYlovcEFwd3NsQThiSGoyWkF4MEZEYVI3bmRHQ2hw?=
 =?utf-8?B?RGlTRzYxdFhFcGFJRm9JeHlqVWREL0ZheGw0aUdzRVJoakdpZnNpM3M1dFIw?=
 =?utf-8?B?MUJWYTM1L09senUxQ0NTNVMyMC9hZE80OGlQTHdrQXVsUFJ1dGQyTkx2U0NI?=
 =?utf-8?B?U0pLZXNwMk1tWHp6UUMzZTkzUVhPcWg1QlFudkhtUXFYbjVRa0RlZU5GcUdB?=
 =?utf-8?B?bEowMEo0Y1pPSHlRcmJhNkEwVjUrZ0lrNU8rdnBuZXp6cUFqY1hJblJCeWc0?=
 =?utf-8?B?cWkzUDhSVXBWT2diNUtZWFlZMk5ndjJKaTU5NkxobTBZZGk0WGhYQy9DbjIw?=
 =?utf-8?B?Q3Z1M1h3TDY5d290d1NNeXBCdWdJVUM2Mk1ZSk5WZ29sYnQxY1dDTDU0UkQ4?=
 =?utf-8?B?UTBkYTZzK2tXNEs0b1BJRXJhM1dWcUUwNCtweDEzclNlYWNMVy9wdERtb1Z0?=
 =?utf-8?B?bnltOW5sK3hjcEhENVIrTFdzNTgwWjRPZVp2ZUdQS1RxL2MzRnlJdVUxUllx?=
 =?utf-8?B?RzlaZFNzNFNlNEdxMTM0Y0FaekRnVFpEM1Y4K0lXb3NFdGlER08wMEtJcHNO?=
 =?utf-8?B?Myt2dFhwNzUyMEs5ZFUxOEFXRUJvczRjekJKamxzK0hZM3hwd3V1SC9wSzJp?=
 =?utf-8?B?Qit4MHhjck1BaVdKbjhGK3Zock15NDlhRDRmUDJWNmd6NGZrbzUyUThmSFdI?=
 =?utf-8?B?VER1a0l3OXEzMDQ0S3BHT0pHZ2FmNTYxNm1ZY2FpU3NhaHI5MjQvZjdiM1Q2?=
 =?utf-8?B?MmowTmY2TEJqZ3hURFpPVnJHMllCQnVIWDlzbmNoRjB4RVZubXVPNjVlZFZF?=
 =?utf-8?B?ZUtZRlFacDNXSXdTMnFwVTYySWNocUFwUXJ1cjZuL0lRZUdYUGxXMUZ6NDk5?=
 =?utf-8?B?TDcwVnY4SVhaSk01T1NYdkxucmZ0RlRWMDVQVTZVQkhlbnlueUtkYndhdUxX?=
 =?utf-8?B?b0tGZHJKL2pRMUZBWjdwd0dWalNobFdnMHltcTBIdVdLY0J0dTkwOVBHbE9I?=
 =?utf-8?B?SVNUZmhFS3Jubm5MVURXN00zeDdKOHRQMVh1S2tKampnYWMxOEVSWEFoRVR2?=
 =?utf-8?B?YTkycFhmOHRDc1M1QzRPOVJrYkx0em1rQS91SXY3aFZuREdIbEo5NTZyTFBx?=
 =?utf-8?B?ZEhNVGJUZjREODBGVWRzaXQ3MXJQNUFqUDdLVUVwVDRNb3lqUW42UVo5NlZv?=
 =?utf-8?B?MkFzR2JFdFMwT3ZoeGI2N2VlL01jbjl1WTBnb1pLZVJ2SzN3alphdTBxc1Vv?=
 =?utf-8?B?ZS9lVnN0aVRkK3dKcTlxL3lDS1ptdXZuMmllUnJoU3g0ODlyQURIKzFwbHpJ?=
 =?utf-8?B?Y2duVkFYUTVLazZSakV2amFiSWloaHpKLys5TGFhd0VtcE9RNllpNVdZaEow?=
 =?utf-8?B?dS9lSFNvUWpVaUd0YSs3enR6VjEzYitaa0hYRlFwZ0dGbTRUZWVhdFhKWG8y?=
 =?utf-8?B?a25WR1MzWjhyYnprRUowZ2VuelpyVm9sQ084S3NNcVNYU3VRL1hkbmRiSmla?=
 =?utf-8?B?SXFjbEdZQnc4OWVWNUhoREQxb2tuUnlUdDlPdXlYM0w0cWk0OTNxbTJDbGhp?=
 =?utf-8?B?WlIvcTA2WDBtaG01T3VGQnR6Si9mcVNZQ1haMjdxN3U3Y0lLbmg2UUpiSU4x?=
 =?utf-8?B?UytPTzFlNkRZc1NVNWJVc0oxaUZlUWRjWk15NW5vY2Z3ZnZ6QjRxU01OTkRh?=
 =?utf-8?B?Z0JydlZiaFUrRlEzVWZqbW1mbEc1UGErUXU3NTU1RXJjWEJEMys3T0VZYXRn?=
 =?utf-8?B?UG1xeVU5bHhSY3M3RnFQRlJiaGRkbE50TUpTTlVxT0Q3WVRQNHZxUlhiME4w?=
 =?utf-8?B?M3VPOEozcmhUZVArSERETHRwWm1KN0NSUkg5ZDk4OVpjNlNPRlZKTFZUb0pF?=
 =?utf-8?B?YUNHdzBQY2pMbC9iSEI0dWZDMDdoWmZpUU5tMXVyS1JmUE9mNFViQnJzQWdJ?=
 =?utf-8?Q?M9FAdXlmzBV+oRaelfxtOj+iQ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3083e5a-21ba-4f68-2cf7-08da90e4fa3d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 15:23:55.3633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aGHb5E/7lDUgoilSUU2KeOfndqcZX5tiRyZBaU28DBhlF45gxyCbTPK+VWzoJVrc6z4VK9CoZ+LQU65jaJBOtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9726
Received-SPF: pass client-ip=2a01:111:f400:fe0c::719;
 envelope-from=den@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.199,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> The BDRVParallelsState structure contains data_end field that
> is measured in sectors.
> In parallels_open() initially this field is set by data_off field from
> parallels image header.
>
> According to the parallels format documentation,
> data_off field contains an offset, in sectors, from the start of the file
> to the start of the data area.
> For "WithoutFreeSpace" images: if data_off is zero,
> the offset is calculated as the end of the BAT table
> plus some padding to ensure sector size alignment.
>
> The parallels_open() function has code for handling zero value
> in data_off, but in the result data_end contains the offset in bytes.
>
> Replace the alignment to sector size by division by sector size
> and fix the comparision with s->header_size.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index e6e8b9e369..7b4e997ebd 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -863,9 +863,9 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>       }
>       s->data_end = le32_to_cpu(ph.data_off);
>       if (s->data_end == 0) {
> -        s->data_end = ROUND_UP(bat_entry_off(s->bat_size), BDRV_SECTOR_SIZE);
> +        s->data_end = DIV_ROUND_UP(size, BDRV_SECTOR_SIZE);
>       }
> -    if (s->data_end < s->header_size) {
> +    if (s->data_end < (s->header_size >> BDRV_SECTOR_BITS)) {
>           /* there is not enough unused space to fit to block align between BAT
>              and actual data. We can't avoid read-modify-write... */
>           s->header_size = size;
Reviewed-by: Denis V. Lunev <den@openvz.org>

Sidenote: if the image is truncated for more than BAT size and there is 
no data inside
the image, we would get memory corruption during BAT access. That should 
be addressed
separately.

