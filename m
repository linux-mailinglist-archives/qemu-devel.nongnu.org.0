Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC73682FE8
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 15:57:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMqvR-00041a-6T; Tue, 31 Jan 2023 08:43:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pMqvP-00041N-9l; Tue, 31 Jan 2023 08:43:51 -0500
Received: from mail-db5eur02on2071b.outbound.protection.outlook.com
 ([2a01:111:f400:fe12::71b]
 helo=EUR02-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pMqvL-0006QU-Qj; Tue, 31 Jan 2023 08:43:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NziySaoqSz0oLye+Sv9LDnaUUfjiY2hWyznrhPSWc45NhSHxRtv0wV07r5kxJiBUOhfISjhMW4rOHSN6mB9Ff3LhItyHfbYi+jn0Z+spm0Jjsd8w74A6mGrd6nsXLI87EeXf2NXmOOl+01MR3BnxC9MWjh3l/EFfTWBsyDYgq+sxeIeQrSp1hNEHW3HbuhVHEpAAcubgSmcdd70qdQ8+KBWx+hA9QEnGbSTpcDhi4bVScMt9Y7NDQWnxfBCNTupdvXfH1wpedW+LfiOmfYHWTObxcKPCWxr2cgF3wfM7CXpLAD91BGL9ad4swZm9DjNOXRzIWS5xV6DHrV6OR1TQEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ARA/3HOykj6rgeC3+NtDvwmKU6kEZs3DL5zLHVoxz8=;
 b=SEr/zT1XTwaFO7FhK1D3GNWJp5v1n/Fbi5zDUdUPtKCTFBQDvkqygGwPFjQTsc8tWTbnDYZ9r8tLFFBbZu80BR040Soib2KMQe7VaGxi4LqdOntrvi1EO62loNCOQivyUyDJ6lg2DyIyvzdrNI5ybUr2L3P8LhGurKXVWfbNrL/qryy5isaUU3MrN5ABcgkwrZge1qN1AljzPsSH5Nv0qeKVCYgz1SJVP0uPh/8omEyivfll61BY8jimD2kf8c+BrZStNLR4O3cLOuLqK1D4IrUvbkzOTx10hVnHKOweneYaf6RxHS4IqQGsaAzjdp9BWy+fK/IGnhG3j8UMKJUXSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ARA/3HOykj6rgeC3+NtDvwmKU6kEZs3DL5zLHVoxz8=;
 b=Nf8F6ii4UVf864K12eWOC8Qq9L3EPRYSZxTDwKjtZzSP/yxlZ3+A/rTyui65fbh5oO2roQcR73TXTJ4p3NOfKd5qvk9Q5O5TgpfjXcl5IRzDuA7suoLvFTpnVxQguWR4MDI+Za4zoPxAOiiSYHgFbdvl3YFRcejiQK4Bxq4Itn1+bkwzkpVNrec1WeCwgCtBcpXUAyO27uEz0RIw/gAZTA5/8POY/2YDHbKCMzr9l4tbaCuhWRrMQNX3sy0OpMC6zxC6UeZqOdoaYsYZeEp4jhGi+HOHDX4mwXIzTDneYGd/6XJo9jqEibaNiglfnHh8RVMzvp5v6ca0Hhve1/s0Xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by PA4PR08MB6159.eurprd08.prod.outlook.com (2603:10a6:102:e8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 13:43:42 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0%4]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 13:43:42 +0000
Message-ID: <354ef2a8-70fe-1f69-7498-b7bbba73abe2@virtuozzo.com>
Date: Tue, 31 Jan 2023 14:43:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v9 03/12] parallels: Fix image_end_offset and data_end
 after out-of-image check
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20230131102736.2127945-1-alexander.ivanov@virtuozzo.com>
 <20230131102736.2127945-4-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20230131102736.2127945-4-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0104.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::33) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|PA4PR08MB6159:EE_
X-MS-Office365-Filtering-Correlation-Id: 13369613-d35a-45cb-6dc7-08db03912a4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 47AEn6MW3Y+qBYUOJU/621/GQ9e8Lw7wjmXyZXpzJfLYD0nyE7JjS/Kq5CJXWlsag7kZ2272lIXyv1VxQXqDwEUpPbjLadPPWdywJs8IHjWL2svVzo+yML2S/gxjp7OEkO94kDuhZyJY5Jj7Zh0sBg2m4TgS/wcvsmdz9JTgtD6d4a1n+7qsDZ6s8cJKWQs1ZbhawOq3apTYMeoRUCkzwps+TLVNdWuqBxA1yrgbzJ+AEycVS4NJDoXLmFe9bXwOaWlDw/Dv9QOFC3S3DrP+Xd9W6sIsST3ETdNS46363PGzL59UVAu/gkbGiJrCVNoaHW5y8rA/B7tUP3gLnUWRtzli+JPV/XgrFJl3kz7zF9RRTjM3r5hsMNiGnnxQ9YunHZ5cQpWx5aYEWjdclu+LlCMZA03P7oTNcLd/fiPcosUVOoZqnlVdKSZnQtVkQGzbwcI4nvcYERyCXC11bEvqmfmgqotP/XD08hqMgbcBMVliowTVVwOYtl0SpboX8R97ZnJ1EQnsW0nN08oAL1PYehaQDh47aYJA2z3ufpBzvjkhq+uPgtrnTmGKGSS9qvp3NSyRsgwfJIRJpCh1hpsVv+fZpM2ePxYf9OORaIj7/g5CmnYgDraF592UkLpXtpjPHeui6lvKLOuo/btsJnSBYJWo5EivEXXZZZsbbGAVQ6MGuev37K7ZLhyT1ZOf6XQzft8V1f8yYfn715AX4DwsAYqyD5dUxG22KGXrOsloilU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39850400004)(136003)(346002)(376002)(396003)(366004)(451199018)(66556008)(38100700002)(4326008)(66946007)(66476007)(2616005)(8676002)(86362001)(31686004)(41300700001)(83380400001)(8936002)(316002)(6512007)(31696002)(53546011)(5660300002)(26005)(186003)(6486002)(6506007)(2906002)(478600001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0NNR2JRK2xtSWtlbHpqOGN0STk3d05qdmx6RmFWTjdDYmpmZUc5RnY3M2sx?=
 =?utf-8?B?YWozS21zS085eW1pMVduUXQ2eU52T1ZablpiYU44UmF1K0xlN01lK0NnUHpI?=
 =?utf-8?B?OFcycFMwQ2h3clRReWM4YUF5eVl5TVI3WVBLR2NERm04MjlhZ1NBUGFLb3F4?=
 =?utf-8?B?TzFBalc2dFNObUZuQkhHRzRwdEJRcGYvbStZWnVzWXRSdzdCV2dVNFJFYU8r?=
 =?utf-8?B?Y2ZSRkxNOXVibC9RRGo1Y1VZN2doK0lmMm45blYvdm43V3RrYlB4RURVMElz?=
 =?utf-8?B?WkVFalRkMUJJK2xZdm51Y1BWWmVsNS9MUCtyQ1FGb1RQblgvZk9tQ0l6c0Rs?=
 =?utf-8?B?T1V5UVFqZ2VoY1k4RVVXWkl5NndMeE5LVTJ3V3VvSzBiZUM5WjZ1ZnZReHp3?=
 =?utf-8?B?YXBqbEZzcWVVT3ZGMWFWTTI1YTF1Q2twRUZVZFFEQjh6K2lHcFhXdThMMnZs?=
 =?utf-8?B?RFRjQzBJdzE4UDRpRDA4Yno0cjM3UjBIODVFaC91Y1c4MHYwL2V0eHhzWUVZ?=
 =?utf-8?B?UVF0UjZMTDFYa0pIWHl6OHI0R2JBK0dnQStRU2VuOHYyWUQ0aW9sa2NIS2Zv?=
 =?utf-8?B?VjRiT21xUnViVEg1b1JaSlQyeEMvaGdsK1VtU04rTzBibVlRYVp3WDh1aktN?=
 =?utf-8?B?UytadWJsNXRlNmt4YjBRTG5WdjdCMjV6Njg3U0xzN01VZEgySFRBakZDZzhn?=
 =?utf-8?B?TFI1bXhJc1BDOExPUWhTNmdsQUs1ZmV5ZjRjd2tXQWRxLzJwWTI5M3BHV2s3?=
 =?utf-8?B?NS9iQ0NjOVB0dzZua3YrMnM4a1pkOGdyUUQvNXdpN3FrSHMxOVNyQlROVUZF?=
 =?utf-8?B?WTVYRUV4aGFGT0JWaEpsY0NHUkFHNDREMDlBd0tTcE9PeHovZGk3cUVZcEJo?=
 =?utf-8?B?dEpidWt6OEhGTmNFVEJFWGhGM2xkWUJjMndHZGlCVHNRSDgyNS84KzQ3N3cw?=
 =?utf-8?B?aVhtMWNYcGRmb3RCNmo1QUhpdEMzYVZVdzJYVUdhQy9Cbmc3K0dBNjdlb0Y1?=
 =?utf-8?B?T1ZFRjV5Rk1sS1JUc3BVQmpGRFhDaHZLVFlkZjljWWdjNTZiRmd1czhxWmNR?=
 =?utf-8?B?cGhXMWNFeTdBWEZReUxTR3Y2OVJtK0xKMDBOVXVFeS9aVTIzeDlPenFFOVVv?=
 =?utf-8?B?UzRuQjFDSXNsbEp3MWc3dk9aVVVCdTVFRXFIK0VweWhTZERFd0dPK0NxbUZr?=
 =?utf-8?B?VTdQNW4vTTRvR1NScHdycmozSGwya3FWQUs4amNZVGtzL2h2TWU5MUFZTEUv?=
 =?utf-8?B?Zk1LK1lhNEFJblhmQTMydjBKWnNyQTlKMEVTd2kyL1ZBZU9PRC8zVHR6cEFW?=
 =?utf-8?B?TlFTQjhMNWVTb0tFSlErMkw0b3pkYjlTOWZzUDRqRlp2MDJrYW1CSG5JaFJk?=
 =?utf-8?B?VERkb2dnaG1ucFhFRyt4MFhlNlAxZktvRVN0R3cwVElqSU02VFQrck11Qnhx?=
 =?utf-8?B?enNudEQ2b0Q2QVJncDcvYmY1dm9aWmJKaTNTY3VkRXVzRFRSamxGQzNIMGJI?=
 =?utf-8?B?TWVDSGh4d0FTY1I4TE1CRWY1UjVDZEdOUVVXL3hEcFI1eE5VTzVZMVRVdnlx?=
 =?utf-8?B?SkFuejFPMzMySUhrSEwrQVhrRVdidW1UYmlQQS9ZUzRYK1UxdzJ6WWtHOHk0?=
 =?utf-8?B?S21VZDVzVGE5VlNZakhsaUYrRGhpVGtpY0RnMGxETEg5STlXTWNGdTRkTDBW?=
 =?utf-8?B?SkFlOHYvd0RwdW0xbHQ3THJLRTZoRFJwWGpJYm5wdndRb1JOaEpqZ3Q5clFk?=
 =?utf-8?B?UHVhTzFMajRoejFTRWZNajJRYS9iVnhuZTBhSTViWXBvbWhZaU0yYUk0RGJR?=
 =?utf-8?B?Rldralp5ZEMwS1RONHJ2d1Y3R1RpWlJSK0RGQzZvKzUxKytiQlRJdHN6N1Vv?=
 =?utf-8?B?LzZCbStuTVhUNjhISmJjRGMvQTVTa3ZKQTNwV0ZwVlVZSFNTa1pVcE1WdU50?=
 =?utf-8?B?SnFNWldRVGhvcW9OY1NmUjJ4OHVjVUVQZkplWXd4dGxiVzRMdGMvbkg3ZzBu?=
 =?utf-8?B?bGZtOUloV0tVWGQrS2pJcmUzSkRwQzFTRHpNT1RwQUsrTFRSQnpDOHk3Q2lM?=
 =?utf-8?B?V2czYUlCWSs0TU5TTmZwRFRydHBTM3NGdjdWZDRmYnlORzNNSlZmVnZ4UGFp?=
 =?utf-8?Q?TykPGb8/gRfQIDEdtSBdhWQOS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13369613-d35a-45cb-6dc7-08db03912a4b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 13:43:41.9503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ppidq96vDJY/G1VpL9ZUDN/Q8WQMRqOvu3uMcIjIvbfikrrTfK8pHXflHS7s6u42jyo4BooEbAcLb7/BWY8tpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6159
Received-SPF: pass client-ip=2a01:111:f400:fe12::71b;
 envelope-from=den@virtuozzo.com;
 helo=EUR02-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/31/23 11:27, Alexander Ivanov wrote:
> Set data_end to the end of the last cluster inside the image. In such a
> way we can be sure that corrupted offsets in the BAT can't affect on the
> image size. If there are no allocated clusters set image_end_offset by
> data_end.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 436b36bbd9..2ed7cca249 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -488,7 +488,13 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>           }
>       }
>   
> -    res->image_end_offset = high_off + s->cluster_size;
> +    if (high_off == 0) {
> +        res->image_end_offset = s->data_end << BDRV_SECTOR_BITS;
> +    } else {
> +        res->image_end_offset = high_off + s->cluster_size;
> +        s->data_end = res->image_end_offset >> BDRV_SECTOR_BITS;
> +    }
> +
>       if (size > res->image_end_offset) {
>           int64_t count;
>           count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
Reviewed-by: Denis V. Lunev <den@openvz.org>

