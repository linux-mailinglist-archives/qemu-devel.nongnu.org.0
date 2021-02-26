Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A96CF325DEA
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 08:06:28 +0100 (CET)
Received: from localhost ([::1]:58244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFXCl-0002vk-NF
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 02:06:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFX9q-0000pO-EY; Fri, 26 Feb 2021 02:03:26 -0500
Received: from mail-eopbgr150092.outbound.protection.outlook.com
 ([40.107.15.92]:42470 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFX9n-0002C6-4f; Fri, 26 Feb 2021 02:03:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJaInMEyJr7PhpvvPz2L2WptU8OVTi9CGEFIFSJ5RX93LfcDnB5ty1PbDHchNXVath+MpuoY70A55RGobjHILXgM/AjQ87NJvhUWYNGLfWskdHhERTAG8ITsy8M014pdwK4aaKd5DqJbKW3/Zzw4kzH+dZjhpGTbsva3o3R4MPH2IGTid6P2OWWEUiDa2I0nmfkDFuB0DC3K4WAq+qYzuTTQm68aQx3SDJO6Swac+46iAkgzqJBxNuGLnUFZ5cP+BY8LX4ht16Vha9esSFBPczsYHOczDa7o8R3PGJtdEAoc3gLSMOPK0pwvcqmJZmBEg1qwD3RIaeAkcspiVObx+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06k73BjPpg6Z1V/sDI1onW3TDfKuudMipMdxusu7yYY=;
 b=GoMywJDyxJl+uYWrt+lghhSc25+T0gbqqOD3w1gIiVolAb6FFtDBzIjyaxwqd1Ng/yw13bS2pkyMt2ahfZPXhxwBCXPmWxkgnv8eM8vi7NEVnwD5LzKrlpcQfv5vlHhsYfYySwe2KOxqZGsAo4UllqfJIIYzvVDJ2lj22T/WVy4aim4PmilX0jb+dxSnH8C8BBlfxiylY8xOJyZMT/2pgzukK+GlDZk8QRytGfVchl/dgLZBAzTpRnfNPPh0OHiJi74X01RmWcHBCcHX2NyTmgXqnjkozTE4LXa8jfEKFL0+dwXZx0k+txRrn17l8C4Oe4ou6w8+XGspT5SOb57K8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06k73BjPpg6Z1V/sDI1onW3TDfKuudMipMdxusu7yYY=;
 b=KjvAYNGUIYwc7M6N8uMZlzfBPjI3+5wsHCxWupSlT7r8bIpQyv+xaIKynk/0wDTTDc8fxga6vhHFWObiFpJf5+vVtFFxeATy9Tu7cMDS3rTcAVuyWZs9ajA7fSIWY2EUadHcyRf0U/TNF3QCI9g1rhPVFDcC0DYOth4tFoQwuis=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4470.eurprd08.prod.outlook.com (2603:10a6:20b:b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Fri, 26 Feb
 2021 07:03:20 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.034; Fri, 26 Feb 2021
 07:03:20 +0000
Subject: Re: [PATCH] iotests: Fix up python style in 300
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: kwolf@redhat.com, pkrempa@redhat.com, jsnow@redhat.com,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
References: <20210215220518.1745469-1-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9a4a23dc-e7e3-a026-ad81-305fc958dd4b@virtuozzo.com>
Date: Fri, 26 Feb 2021 10:03:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210215220518.1745469-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.253]
X-ClientProxiedBy: HE1PR0202CA0030.eurprd02.prod.outlook.com
 (2603:10a6:3:e4::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.253) by
 HE1PR0202CA0030.eurprd02.prod.outlook.com (2603:10a6:3:e4::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Fri, 26 Feb 2021 07:03:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17bf5b8c-a5a5-4754-2a29-08d8da249945
X-MS-TrafficTypeDiagnostic: AM6PR08MB4470:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4470E54E49A0B0DF0BE1B8EAC19D9@AM6PR08MB4470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8AjqrsrLUXP1hZVE/RwI9k87G2DSC2oYU7i31azo8tJKGA3m/YAQEhZPbT9KbNWVSre4YDazjnAkcFQw3bdemQL91HBbng3ilGLuw6ELo6TlFIBtLgZ3LCfuRfUbVFVc00jfhE7k27YfVYStEfCsfk+ClrezhiuXn08LUzztKcGA5k/LJtDdflNI8MBQSOMywwwOfgpruT2wCP2g3LyBA+RqWi4/siIAdI84G3G4PMRXSDnA3X/jYjsR6TLfvwIhzDmwk4X0PaCQqNmrdyX0meoTi+kw0dvfuHeJVm/dXs9Yv5qlr30LmbHyd7Cu5JUvkH43FJLm7TlQkWg91u1nbl7Gjo5KMI6imioYeRasmwpufRKRcv58a3tN5ECCYjwe3DsTevhFvPZr5kB/Q0/B3Mgc34h/cQ6SEN6GjE3ohYHoz6rksdVN7q5CjE90AHv+YiqmNOVtGqETNBU02UzdVejQtkQwjT++DgWfV2QmJPv3CP+/5m+z0GgfUE2L6HNTHQcZKiE/rrOJVOT/cNtq8p8/3aQRM+X7bG0y0fIMKTGWdorF546evjB99Zz2NedsDCBF2RBqxAx5Pg9PlkT1LiMRPN7nMB2VcBIWKv3IyCY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(39840400004)(396003)(66476007)(316002)(66556008)(6486002)(2906002)(66946007)(16576012)(4326008)(52116002)(4744005)(36756003)(186003)(86362001)(31686004)(8936002)(16526019)(478600001)(5660300002)(8676002)(83380400001)(2616005)(956004)(31696002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UEZ1eDk3T285QzJqOEY0OVduVXdrTlliY1dZdFhyYzB3U25wUzBKSGpTT3lD?=
 =?utf-8?B?Q3pLNXFINm9EeUova2FwRS9MbjlPa0tpbWNCa0FqTklHRW1RakY1VUNpV25k?=
 =?utf-8?B?TzY5aFJMVVhFRG5XZUgxdXpLU3Z6aUNYL3c1QTlxQ1UzTGVvbVBhNldpYVBO?=
 =?utf-8?B?MFhoUXVpb21KRStkZkNyOU8vN290bWNIbFJQY2FKaUlPcDBrVmdYNTl4bWRk?=
 =?utf-8?B?TjZUdHV1Vi9MQWV6YVBGYkJCUHIxNmtZUkZPTWlEWGpESno0Y1d5OFV0T3pO?=
 =?utf-8?B?REFTbUxVZEhWYlBnRnllc0VXeFplSzVla3d5TlJwcGtJU01DeGZTcTRYRnRH?=
 =?utf-8?B?SkJVeXRMeGlvOGNUYnI2SWdkR3UzOWRSS3hTTlhsRVZJOG1FTk56bkVFRG1E?=
 =?utf-8?B?V29heWlpQWo5SG5hT3JSb1p0clJ0QUV5TDJFUkJrNlc5SUhiamw4dGxZRVZS?=
 =?utf-8?B?SXJpRGtJVVdCdHNaVEtJS0VseXNQVllmOU94czczOStxWVhGejlZYWpSckRR?=
 =?utf-8?B?UUJjSG1YVWhYVWZpQWtNaGszRm5TdThDT2c3Nm1CMy9hQ1ZWNFZFdmdQdlZj?=
 =?utf-8?B?dWhVVXArZ0RSMzE2L3VXbmVmSEZJUkkyb283R2VDMmFhL0RSd01QTENtVFB1?=
 =?utf-8?B?cDNTVWtsN2dqNGRWa1k5WDIvdldYOGdHMkJ2RWxIdFRUZ2ZsTW43VlRyQTR0?=
 =?utf-8?B?Rm0xU1g3SzhycGhHMHlwWGROeXlWNUhLQmhKd1VvMzQxaFY3V3Q4dDdLclZ5?=
 =?utf-8?B?TUExNGZZT3hJeVB4T3Z6MzFGNVpKTnBXS3kydkE2ZzNsTnN4OVdmWlFGUnJN?=
 =?utf-8?B?V1ZkYVpETFZMd0JSYWdJTVBXUERGcmR6V0Q0VzUrTUQ4Qk1iN0puZmVZWHdr?=
 =?utf-8?B?RU1xOGlqeVZvSmFBSkt4d2pOR1c2UCszekl5bVZUY3ZENzNzRmNjcGFVdmwz?=
 =?utf-8?B?SVdYN0QrVnIyV3dJKytaUmlMdE5IRVhPZlFESGw1bEptNEtPMGVMQUZzQnkx?=
 =?utf-8?B?ZWxvSmZZMGdoUzczMVFMZUM3d0w5NnVzdzY1RWtrZW5XcnN5bGpaZW1IMHlD?=
 =?utf-8?B?aTRtWms2Z0htN3h6QkcrT250SldFZlE2a0c5QkZMMFg5UmpKWE1FMlpBa1Zu?=
 =?utf-8?B?bWt6M3Rid3U1NFFnMnc3QTNnMXFueUh0OTFQWDVZUWlkdzAxTEN4bWtkWSs2?=
 =?utf-8?B?akU1NGRTVndQdVJ4RU00dmhXZ0VtZmVvVUlTR1hTUjNQYUY2c01CWk5hTzYr?=
 =?utf-8?B?MGxSQjFJeXY5YjRTYUdISXZGM0tzUUl5dnBKSTYrWE8vbUNtUWJpdjZsSWw0?=
 =?utf-8?B?d3h6QkZjZjhyNXIyZVdMaTQ5Tk1LbmxBNzhzL29Oek1mUWtkcjQrVE5wQUJy?=
 =?utf-8?B?VHU0bTdkQklqZzY0ZEYyYWttaVpENXkvdlYxNXJ2RDNwejZHaFFpa2dKRThC?=
 =?utf-8?B?UzJhNTBwaDJwejdTSThKd3FtaDdBSHBxT2FoNFJvYXlydkw1Ti9DNkNPdWVu?=
 =?utf-8?B?aU0xRERERmtNTFdTaTAzNEt0bkhpUk1sQzVqbjlUbGNGK3kwSzBhM2FTb2Zr?=
 =?utf-8?B?SFU4bmxRQlh2WVVabVZlRG85T1hqQzhGNXl5bGNtV2NXV2Zpd1R0SUF0REZR?=
 =?utf-8?B?QXlHbHBLQ1JTVFBrYjR0Q3AxaTMxV00wUVBYYUtCZXlRVis3TGpzTWhoTFdT?=
 =?utf-8?B?S2drZjdqUFJGL05FZjdjdTM3b0h3cHIxbE9LeXJlVGU3UDkzQnNURWY5WXhU?=
 =?utf-8?Q?WkHxndtB2dC2SvnssaJiMdqYcHiY9+LeO6hOo9n?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17bf5b8c-a5a5-4754-2a29-08d8da249945
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 07:03:20.3087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pHAQLkxGfOwFpH74QqBGW2DEU3y8waUk540poOf5rPpZSo6p5VRZwjGDdapUO+zvRwieFVX24KnMPh2uwL01RzxwFKLKK43Ajnb2Vky7Exs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4470
Received-SPF: pass client-ip=40.107.15.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7,
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

16.02.2021 01:05, Eric Blake wrote:
> Break some long lines, and relax our type hints to be more generic to
> any JSON, in order to more easily permit the additional JSON depth now
> possible in migration parameters.  Detected by iotest 297.
> 
> Fixes: ca4bfec41d56
>   (qemu-iotests: 300: Add test case for modifying persistence of bitmap)
> Reported-by: Kevin Wolf<kwolf@redhat.com>
> Signed-off-by: Eric Blake<eblake@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

