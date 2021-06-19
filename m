Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6DD3AD96F
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 12:38:40 +0200 (CEST)
Received: from localhost ([::1]:35956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luYN5-0002UK-87
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 06:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luYLU-0001iX-PA; Sat, 19 Jun 2021 06:37:00 -0400
Received: from mail-eopbgr70123.outbound.protection.outlook.com
 ([40.107.7.123]:15108 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luYLS-0007ih-VN; Sat, 19 Jun 2021 06:37:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNax+ysSiNBSa0f61JMTYKIgMVdqvMHYknrLFxTRHGcVUtSklGq6uVd092rqlba4cU/ReE+bJ/TNJ/CSe5Gwad8X9VtbInhxAf5dv3cajWQdUjyEFxgW7vx/BjPQntWsHvr9d663kzOIOgW9PfZbsryFsYEL2PwLId6hRP1l4xNPSsXws0S6SapAfKhfP9q0K79PpSI6nTE2VgAKg/2PQiwrmD527BkhOlSgvg9woGEDoMK9O81dAmW1PmWz79wWnEcLqDGCNDTqBYOCaDgn8DB0skaSL2u0eKMCYDsNzmxW90y3V++0GQL7l3sL/W6w4t935YoxbzQ5/SbBYhfb2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6brtEVBYyUwJJwKNDFmhO+Vmw7JXEZ/Wb+Rnrd86EA=;
 b=npm1dY7pSDIqk9hrJeUB+Dl8FUSdVUBg0X00jmnF5FUmw2Nl5I+xK8/ENLYY/PK2Kzw23zI1HJNJdJMU+zeQ+FqUNHum2pUaEmOeR0BBfb9etEMdVplzAN66SgcqPHIZ7/O3Nn+RfAa6fqB5aJ9eVVuqJvTwwl1ugHokd1GWAehcnoYh3vJPsZ5Oje8PG07Wl62P8C9Da3kJp2ki3ZX1iQ2TTj7daKYO2EFN2Xbgku3OEBcdpvPAZUOHKsm7EDplQUToE/2lENI1ySFj6JV6EmAQGng8JzDwYeSVZ/xhn7FgVW9hIDAGJN7MbAl/5GQbKgFNBpAdHz/R7snpH+taqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6brtEVBYyUwJJwKNDFmhO+Vmw7JXEZ/Wb+Rnrd86EA=;
 b=jY7F5AxDyVgt0dMjQM1elDuFM3PcnFMBjJnMj9X6XW5d4DqN7qTEHEPfvjb61MljL3QoIXpOnrchiAz8GnI/FvUvdjs2PiO/8/mTCjkQe3+oXZoC4gb2RkzId8wAqOtw6yqnP3/43CqnLICSGVXRHIy7dtXaHdeM49+yR8EcRTw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1908.eurprd08.prod.outlook.com (2603:10a6:203:4b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Sat, 19 Jun
 2021 10:36:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.022; Sat, 19 Jun 2021
 10:36:55 +0000
Subject: Re: [PATCH 4/6] block/gluster: Do not force-cap *pnum
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210617155247.442150-1-mreitz@redhat.com>
 <20210617155247.442150-5-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <2142d5af-6ea0-8161-b183-23b502e2ca05@virtuozzo.com>
Date: Sat, 19 Jun 2021 13:36:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210617155247.442150-5-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR0802CA0008.eurprd08.prod.outlook.com
 (2603:10a6:3:bd::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR0802CA0008.eurprd08.prod.outlook.com (2603:10a6:3:bd::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Sat, 19 Jun 2021 10:36:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8d23db8-04dd-4a7f-bf17-08d9330e2891
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1908:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB190835132EAA1FBA5D47C042C10C9@AM5PR0801MB1908.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 59uN4Ryur0Owz0XHsREcgcIDmvI5T4OiMHaadzpDymKoGmlcQN9RZAXXORxRqjCwjk1iJfVVnwYP+ZTY1XFn4ym02AjLXJMB3HpKoFK9STgZQ1aPKl+9C/YSBjApmRDt162sOyx6E3mNelaS7ngvSn5/AEPcxJ0zMs1vLUbft/7yNUs+pYvQfJOwZYcuzH3awjyOFQSGH33uaDwp7TOIvJ+WVx9hY1F/4kph4DI3oI7ZDoX9gm1tC4ijSyqaMnHw4D9cr3Nd3WmNDyjqXHl92tkorbQJgDJEncO93OBIZj0qnCqeCTmjaNcs0jZ84FTalOQ3F70No6CYDHEFgsWvrPbdF0jFWyQod3lEWTWTJvdpugo0pYl1jXTm1/xIhNyxAbZNGKRbp5fVi2JOCCxA3gOTAPiAboOLGPojwf6dPdNhF6mF9PyPLQXND8erlfE3PBxlAMNEn+DDt6kBrpZmBENwtmiGtDQ2/SI+L9iYavuP/S6g/6hW/edVk0XQDWYuQUh69Kbvri4G6ktxn1FNwWi6fs83eSO70Ajn7Mw/9QpMhMW85IwLAFh3gv/v7GwHPGtMC+bu7n71iC4/WG2YTGRavj/b+4K5ew5jq5IrOgFwZgWHudzqPEIuVbPb+yXecJ6vQi4kNT/H+n407HCMvi3ifK8q8UCEiLYwZR7P57I4QTbrKxl1AhTLTkJ87cw8VT9/ryhUeU+CtASdOD5STAGgLv5bhvA0wPodzZNsruI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(346002)(376002)(366004)(396003)(136003)(5660300002)(16576012)(4326008)(316002)(52116002)(478600001)(2616005)(66946007)(31696002)(66556008)(66476007)(86362001)(956004)(6486002)(186003)(36756003)(31686004)(38100700002)(38350700002)(8936002)(16526019)(83380400001)(8676002)(2906002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVA0TmRzTVRyZWdTanltYitBL1l6QUhJVTlQVHp4enl4UXhIOXI2cWNTaHdR?=
 =?utf-8?B?S3VkN0M4RnpLa2pGUzN0NFdsZC93MkZIRGlWWUppTDhZQmRmbXBMbEFtZldt?=
 =?utf-8?B?NkxWcUNSZ01FTTlsdFM0M0RiZ1lINDZUNnc3WjJvd1MwVi9PUEt6TCtSZXN5?=
 =?utf-8?B?aEdQdy9LZ2dpWVlEbHNhZitiM05yUzRVWXg1anFRbjF1aXRrSHlrUGR2M0R0?=
 =?utf-8?B?d0c2dVFXSlVsa01sZnJ1MlNUQml5UzB5T1dGRjBSNnVIdVpQSkJqcG9pN1RC?=
 =?utf-8?B?NXF1QmlZS2tOT01ETTM5QVMxaHlPcGh0ZDZ4NDc1TzJueHRPQmRyd3h6bENE?=
 =?utf-8?B?SnJQNEYrTml4aHF6eENpbzVDUmNyUEkwVHFHNmZNSWh2MFdmSnJZdy9zWFZy?=
 =?utf-8?B?SU5kMWtVQitrT2dIRTl0Ump3akVxZDVFOTlYeG5DVGdTV1RTM0ZBdG1sT0Vo?=
 =?utf-8?B?Y0RleUZHTkJDR0ZBL1JSeVdwNmo0bUhFaE05N0prSVN6S3dxaHZieHd3WWw0?=
 =?utf-8?B?eWwxYmpxb08yNi9WVTZidDhBUW1BMGd0Z3F6WnRzN2JiQzViUEJROVEzQVZQ?=
 =?utf-8?B?RkZZa3NJVmVMZUJySk96UWdlS29HOHRTMmVmdS9nS2xRU1NOSTl0WFNUY1hj?=
 =?utf-8?B?MFRVbzdIK21FY0lpU2dkTDBLN3dkb2trTCtSeEVGM29VSksrOG43ZEFva2w2?=
 =?utf-8?B?NTVHcXVaRGhsMm5RT1pxM3k4djJtMWFtZ0VFL3VIcFZoT3Q2T3ZhQlhhNWZB?=
 =?utf-8?B?Mk5VZTZ2WDV1Sy9VbXRKSVQ1bzRIVm1oWDlVOVlOUmxoVkY3WnNCV3Nkbmcr?=
 =?utf-8?B?R0UwT0taeXJtYXhTOEkxai9aYWJLeTQ1RElmV2hyTXdaL0RaTjdpUmN2MHRr?=
 =?utf-8?B?RmhIUE9Jc2pCZDBHMjRMa0dJcUhYUlFkeE52Wm9zM2UxeTBUWi8zNG5YN2lk?=
 =?utf-8?B?K0JUUERrem9Balpoc1NreURaY1VjOXBVWFgxazdTQUMrMmdJcXJFVmZHd0tW?=
 =?utf-8?B?dFI5SnRMQkJyNVBmUXdQa2Ftdi92MGZrVm4xSCtzUU0wSkQ4bTBSc2tha1NS?=
 =?utf-8?B?VXVTdlVTUFdVc2x3Tmp4UjhQblZFeXdXaWd2cGloTldpMkp4TDR4VFJaSU8y?=
 =?utf-8?B?bDMwR1Z4MG1YZ2FCTTVRZHlHQnAwSmZBZk96eTlJbUxLYUNEM3owbXUweW1O?=
 =?utf-8?B?RGV4LzFhL0VzM05aUFhUT21EampSc2g1S0ZidzhlQlJUZzVjYk1GLzdXaERw?=
 =?utf-8?B?b2QrTmU1bkQvcmloWWdqTVMwaUNhQktPWFl1Z29uYUdqWjVQdUxPR0ZCd0Z4?=
 =?utf-8?B?WmNORFp6NGhBaW5kRkxNcUE3eEs4ZkNmQXU0VHl6cENXNGMza2g3WlBSQTI3?=
 =?utf-8?B?UTF6dnhCVVpWazluMlRXbW84VHZWWm0zKytDOGJ3c3A0QmdzaFFFekJjMDMv?=
 =?utf-8?B?bVBnNnk5d0F6NUU0eHF1aTdqRkVTY1dRRkk3NURISS91cWVaZjVWcThKeFo0?=
 =?utf-8?B?K25BNjVUUGNGc0JyY01aSVE5MkJoRjRmTWsyUWRocnF6MlQ1V3VFR1BicElq?=
 =?utf-8?B?c2VDdE1lME9QdEJkVjFvOG16aGRQaGNDMEF5VzNwVWIwVm5TVFZ2YXV1MGpr?=
 =?utf-8?B?dHhnUHNxTlpqc1QrM2QvVmh0RGJTVDhiV0d4YjBOdUluMGloWVBiTmI4dTBP?=
 =?utf-8?B?OGVXSmJQMXNvNDBZMStGUWlFK3ZGUUtJRnNSL2lHdGxOeVZCRFRuaGl2bzlN?=
 =?utf-8?Q?MSxMCFac1QFEYRZf+/FU7082RdBRl4f3AzoB5Vg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8d23db8-04dd-4a7f-bf17-08d9330e2891
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 10:36:55.4228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bDH+SEXHMo+vMaJu26YJhUg2Q1lHLzozIUFrtUYdEV2FYsT3kuoRowijDbFBHO6oDPmFAQdXbga+mH53Cdl/HSL6ZhKE1MyHGSyr4bGUwh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1908
Received-SPF: pass client-ip=40.107.7.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.202, RCVD_IN_DNSWL_NONE=-0.0001,
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

17.06.2021 18:52, Max Reitz wrote:
> bdrv_co_block_status() does it for us, we do not need to do it here.
> 
> The advantage of not capping *pnum is that bdrv_co_block_status() can
> cache larger data regions than requested by its caller.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


> ---
>   block/gluster.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/block/gluster.c b/block/gluster.c
> index e8ee14c8e9..8ef7bb18d5 100644
> --- a/block/gluster.c
> +++ b/block/gluster.c
> @@ -1461,7 +1461,8 @@ exit:
>    * the specified offset) that are known to be in the same
>    * allocated/unallocated state.
>    *
> - * 'bytes' is the max value 'pnum' should be set to.
> + * 'bytes' is a soft cap for 'pnum'.  If the information is free, 'pnum' may
> + * well exceed it.
>    *
>    * (Based on raw_co_block_status() from file-posix.c.)
>    */
> @@ -1500,12 +1501,12 @@ static int coroutine_fn qemu_gluster_co_block_status(BlockDriverState *bs,
>       } else if (data == offset) {
>           /* On a data extent, compute bytes to the end of the extent,
>            * possibly including a partial sector at EOF. */
> -        *pnum = MIN(bytes, hole - offset);
> +        *pnum = hole - offset;
>           ret = BDRV_BLOCK_DATA;

Interesting, isn't it a bug that we don't ROUND_UP *pnum to request_alignment here like it is done in file-posix ?

>       } else {
>           /* On a hole, compute bytes to the beginning of the next extent.  */
>           assert(hole == offset);
> -        *pnum = MIN(bytes, data - offset);
> +        *pnum = data - offset;
>           ret = BDRV_BLOCK_ZERO;
>       }
>   
> 


-- 
Best regards,
Vladimir

