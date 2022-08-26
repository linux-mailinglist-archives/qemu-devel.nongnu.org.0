Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A795A2B82
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:46:11 +0200 (CEST)
Received: from localhost ([::1]:38172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRbX8-0006Sj-Kc
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oRbBG-0001bz-MU; Fri, 26 Aug 2022 11:23:35 -0400
Received: from mail-eopbgr80122.outbound.protection.outlook.com
 ([40.107.8.122]:24064 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oRbBB-000724-PX; Fri, 26 Aug 2022 11:23:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SAj5omHoI52Yz38DDkpTwyfBFxtxEWdUrEBoZOXcFzYqhs0Ucxs+7TGt60HhJqt/1/SMuST8HJtTUtLLUVKeYfhysImoux4nq2mvOOvxMRswV1rwBKrk4grBtPz2ERothGkMd2C1GM2H4iK+oYEkLuXJS3w5sdTTT1zJ94dL+IGZ5sq1S5JChW16Iy88Og0ui2FHc4TO1Ciarxr0IedrigX86upwOt5c6Fjn8dTADI2aOY9H6fPpDBqD70bDqN1/sOyy0ahFM/vUhr37glw5oC0iJJ2VZb9akNNBJf4CUgoO4jezs+vh/TeGw9zMMcajtnxzxseXQfzqROrE9z4ueg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFL2kvkgHJ1/ec85gogTzUuAcAn649N7XzoRLB5twGo=;
 b=RUpjaxNU0yYPNbmDvYoGvW99mC64TNtNgR0vjyG7PLfzF1MAqzBgL/rrdfYvoCDEyh7MsU6BPp+U/anwf41y3yA9qz8BCew4QwZ1cDMWX7viv+eAZamf3HSxqeCO2vkRwOi8r4UsYlflBhswPBPKexHhvH2ANkUTqEz5mv/GuUj0dUSAJpVlyQXTUdsiR6PTqeNCyeMob5qd2aq77E3vhZ5lt8qF0PYe3YFkgo/iXur4aLsAibarmnmZkarB1eYpogl+9Tvpklsb0zD+iUzYJza8k8if8jSUo1trk2uBBrQL4gyjdOdO3gAw7vXMMsPc6cqZQr8aK5YFlRdLd6KpIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFL2kvkgHJ1/ec85gogTzUuAcAn649N7XzoRLB5twGo=;
 b=jM9pLS5lTeLnAlRKR7j1EBlrkoITt3to04iQHRZBD6VDLmChvhSfuBFlgRMeABUY6jIFwd9Dhm9E7hlggQ2ZcBMVy3v2RNZMsgXChdWp5JaDXrRdDwd0MjjgAnTKTTO7Gl/KO9rN+a0pzckXATmUmL20aJAAy+xFjGOEerCyDbG0QCtKwDAKmXf59ZHhlup8RrxQny9q/KbPmpkONqcQdIMWO8AOBtzyUJGs4Zi34Kmz7n2rxf6brEYy/Mt27NtoaXvHNFkOASnqv6FpoBo3IzLISOUX7EeGtUpipqtu7gp+qi+WWcT2szAxmVeFoQkdHL/WZnEyYwehTT0Gqcb+mA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DB9PR08MB6681.eurprd08.prod.outlook.com (2603:10a6:10:2a4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 15:23:23 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%3]) with mapi id 15.20.5566.016; Fri, 26 Aug 2022
 15:23:23 +0000
Message-ID: <14ddecc4-e921-4f3b-6a83-b7bb9db4bf18@virtuozzo.com>
Date: Fri, 26 Aug 2022 17:23:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 11/10] parallels: Incorrect condition in out-of-image
 check
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
 <20220826142723.235636-1-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220826142723.235636-1-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P193CA0005.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:bd::15) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d16c2600-4e4a-443a-878d-08da8776ea4e
X-MS-TrafficTypeDiagnostic: DB9PR08MB6681:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5HXhPiwS1nq1qMq+LqoqdLgYwFOk9Kg+cZ3zDHn43YkoBHNjyw90Ye0TPuRXoDNGcsb4WSfTOH6A536Md/yrOTHFcx13Ju6hUlZOcICjR8voiSLkMxdbppTsIw5bFJwtHb3O9oOCsMgj+KTkC/lxP61VnXYy+RE37GRcW7Dnq3lX7dUZAzvkBRQdPJJbUNJdONWlKpdTOr3v9k6uvAb+E+tqjE2jIWaUEQW63CqL1b3gc9YnGbKTk0MQkrfGgMs/UHyOrqpsvCQ6qU1UIWt0ihVpGWrG324jZ1Ym0kcpA4aaaaoEOLN5ZtQgXNQvJN1DlohqcTbXAo2M2UHNGTs8NAFpQR3GEi1tgP+GoyouzGKsoKDmbJ9J1XQuxvjuOdzk+qsYKYmE5aOK+ztZblAk3q+bX+MilcQlaWsEU4j7hKFkU3ql33Ey4QCslpRoOmuvmCyuSV3yWDRGQ9J9qvOyWsNo0MEZzWKQ8aapq3jy4BcrwSi0Fl/ylOke0zXQw4N80uwevSMXr9skq347zXt3ogiRM96K3s/7JZ8koFWg8YYgUNE1DdcpnviwG0CcPyUdo7YrJEu/U6fmCWRZ/SoKy+9qANfH2L8IT/lrjIp8eTS7MgUQKvgjJeAueKUAa7RanjfpQKmBOYBLZ9s7lgFwKKr1bMka2C+YQ3hIW34ECx2RMgQMFixO/MFfwDU7qDQ6TsGj7224CXy/jmWZBeB2BsNEp3ThbDoDp3Ch/K40S0D/iUpLRr9DXRGV/7n9gxU77cWn0Znlm650jwHiH2rF9sIZ2fKI9yaBvqUfqR+vFIxYJlcWCbQCPmVkVVMh63vI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(376002)(366004)(39850400004)(346002)(2906002)(186003)(66946007)(66556008)(8676002)(8936002)(4326008)(5660300002)(2616005)(316002)(66476007)(4744005)(31686004)(36756003)(26005)(6486002)(86362001)(6506007)(31696002)(6512007)(53546011)(52116002)(83380400001)(38350700002)(478600001)(41300700001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHpUUzVmeVZxSEJwOWl0bnFrUENYcU10ZDhtRmNwQVk4ZTdrMmJ1YTVZNFR2?=
 =?utf-8?B?ZGJrVUNLWmZQNm5sSHIwR2VGOXhEeTQ0Wnh6bXZZU1lxTklsQUlTWS9McFM4?=
 =?utf-8?B?U0hwWStpRTVhazZwQWg5U1ZQdmdmNW1UVzZUMmpLWUVmcVowYjc4M25jQkgy?=
 =?utf-8?B?UnAzb1BqWEVwWDJFclFuNUE3UFo0SlR4VzNVcmZoYUZaM1B3ZUQySmxwNlMv?=
 =?utf-8?B?TlhldmU0Y1kybUZDMktxSHlyU0xSQkdvN1c3TC83UG1pR3RRNnA3RDk3R1hD?=
 =?utf-8?B?WnVZaEMwdXJHQk0vRzN1ZVc1SkY0Z1RSczZqRFJCaU5zZ0RnenV0cXBEaFVo?=
 =?utf-8?B?aXRrMGg5d3M4Z3ZOWXJuWCtCVm9QR0JUTWhwSmZ6cWtGMThSTzlvdThHN0Iw?=
 =?utf-8?B?WWNnVnhYZjZhS0lzMlhhd0dSVTBQcE1ZYndLQXZMRmFIb1ByMXFQWGxYdDJH?=
 =?utf-8?B?YlljdHRCNC81RGJoYWtGbzJPcUFnejVtdE1EalMwaHFSQWVFbWc0ZFZsMHFo?=
 =?utf-8?B?QkhxTlFpL0JaeWlwVjgxdnc3enAyU3VxYUcwa09WSjlxdlc3Tm42Qm9WZkRE?=
 =?utf-8?B?NkRzdWx6ZWxZc3BVR1hlRFhaLzd4YVVyN3VlYnJhdll2eVd1d0U5WmZ3d24w?=
 =?utf-8?B?TnptQk1HQTN0VStHdEtXUUkveitveFVGSnViR0tkVmMrdHFwZjZhZ1RRSkdN?=
 =?utf-8?B?Q3ZidjBmdDR3MXE3eUM1dWt1NjhCeTZWd3J0Mk1rajdXYXI3Z2NFZWNPM0w0?=
 =?utf-8?B?TFFDb2JXSnBlVGhFWFNuSE50UHB2cFJEbHFPMUJYQldaZGpXMWRpVmlOZHdX?=
 =?utf-8?B?bGIzVjdNa1BGZllNTVdkUXVtcXVhN28wbE5HRkZuRTdrTVFteFFwK3hBeGdR?=
 =?utf-8?B?QytCR2ZsRkdielZWdVIvZTRQZzFvUkZFQVUra1lsVUNad0ptaEtZbThUSjhO?=
 =?utf-8?B?MzVaemJLbmRJL3NKdHJKTld6YWlzTDBKMkh1OVEwODBVOUkvWnNncExtblZK?=
 =?utf-8?B?S3V0M0pEWVl5NU5hRGFCU3hnRFVrQnVQdkNxbjhycFVnQnJkVmJDODI4MHZT?=
 =?utf-8?B?cDRhTzZSMUlEM09XM1VCZE1YRjZlc09ZajVjaFltb3VtU2FLcmxxQUpWOXlt?=
 =?utf-8?B?TUlISm1CS0hMb29UV3R1N0hPQkYyOVVSWTFtT1VVS3JsRUM4N20rOFBaNk02?=
 =?utf-8?B?YzArQ0xETGNtbUIwcEVldzh6dktHWlF2eXJqMmRHeS9GclB0WUttazVNRnl2?=
 =?utf-8?B?Yko5c0kxNy9hbDNIY1laSVVpR3BFUU4vWTNtQU9ESDYvK1pxQ0xrRHphOTNZ?=
 =?utf-8?B?eHIybyt2V2pJWlRrMVJ5YTcvRU5jbjBTaU1xdDVhVlBEZlUyZWZXR1RBZjlp?=
 =?utf-8?B?UGNubWZYMXV1UW8vTEsvNm01TXdOempOZ0c4SlphU0RtRWFkQ2N6Ri9yYU90?=
 =?utf-8?B?ZWp5dXZ0N3dvV3dXdzJDbVdaeFplT3ppUmQ3QWZnUCtybFZ4czRoTXk3RDg3?=
 =?utf-8?B?b3IvQnZneHZUTDRUVmJRVzNCM0VUZkx4QkpnOTk1ZS9CUlI4SlJQeE5yTnYz?=
 =?utf-8?B?dHhraUlXcWRWMmo3UERRTlh4M3BKeVlWa0wza3ZCTWQyOXNCaXU4OGQ1cEhQ?=
 =?utf-8?B?cFdneVhpRGtlMk8wU1NDTDg2d3Q2MnhPWUhoTVU0dWZSQjFRcFhzTWxkM3BU?=
 =?utf-8?B?eXhJWHBFVVFIcUFROG90aStWNGt2T1BHZmpldG5DMmJpN1RGbmpVQzJZVkUx?=
 =?utf-8?B?RUU5Z2tBRHNLR0p1c2s1NjNrOUcvSDJ5VmhSS0ZKMjFVL1RUSzZFUy9rVkM0?=
 =?utf-8?B?d0lKNkUyeUF6b0dkQWIxdVZKMEp3Qi9LQVh3ZWx4UTlNSjRqT0c3bDg2cHRG?=
 =?utf-8?B?UEVXYTFzYVZBb0ptcEZFaytCL2dLU3ZjTGFMMkp1SXhtQzI3NTE5T2dSeVdL?=
 =?utf-8?B?dnJBRU9Zd0NxTmk5QXU2c2hDaWE1V1dtd0tpdUtqOURHVUtUaHZ6eVl5bVYr?=
 =?utf-8?B?bWMvYzZyTmhaNDFURG44Y3cxMGZzcmZ6VUxucS9LZS93Y21VQzN3Zy9MMUNR?=
 =?utf-8?B?MGdQMEQzRG9RZm5LdVZYR0RFd2JKMk1wdko5Qm01N1J2dlVpSUlKVUNjZ05F?=
 =?utf-8?Q?QcE/hqZdmjQvEIimBQkbMX6F7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d16c2600-4e4a-443a-878d-08da8776ea4e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 15:23:23.4814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EUZSYnYEgjL1V6qkjcULNPwnnlp+INUng2RQFIzi4aADA5VxgAKMZTX4+3Y9wt7QOoyH64v3R/cN4C1ixT1T1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6681
Received-SPF: pass client-ip=40.107.8.122; envelope-from=den@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 26.08.2022 16:27, Alexander Ivanov wrote:
> All the offsets in the BAT must be lower than the file size.
> Fix the check condition for correct check.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 8943eccbf5..e6e8b9e369 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -455,7 +455,7 @@ static int parallels_check_outside_image(BlockDriverState *bs,
>       high_off = 0;
>       for (i = 0; i < s->bat_size; i++) {
>           off = bat2sect(s, i) << BDRV_SECTOR_BITS;
> -        if (off > size) {
> +        if (off >= size) {
>               fprintf(stderr, "%s cluster %u is outside image\n",
>                       fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
>               res->corruptions++;
Reviewed-by: Denis V. Lunev <den@openvz.org>

