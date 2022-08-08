Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1C558C87F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:42:43 +0200 (CEST)
Received: from localhost ([::1]:60006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL25g-0007Px-Vc
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oL1oc-0006js-Vd; Mon, 08 Aug 2022 08:25:09 -0400
Received: from mail-eopbgr50137.outbound.protection.outlook.com
 ([40.107.5.137]:24546 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oL1oa-0004Ui-Uj; Mon, 08 Aug 2022 08:25:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWhHz2rtQb4w+XabWtCYLepqkqDAKXcYYgjMRDsgQzYsptGzMAIhWCZuZOgznte0W1e2/7FVEplIgHxUivjauJzXR90yC+KgQdfhn3UuvlVYkrNNpLTKnnDs18Js8dDSxm5AqrvnYnRprF8Kla03GagFoIqKORyuRlQI+BMMhcTP2nul8UGns2ADw0L9FAS5xAnCAnmy30Nx6a+7x+0BTVxCzoVdGLAKLKcBVcouU351yjlEPDq73GDWj6edeBDiqr6Kp7bwYdGVPAGa6hwzzrXfrPgfVTMa13eYFkGqwcjp0j9rz9lBwekCQPKNGKxX/w1tnikYNsUG+L3qlYJ7aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzh41pk7oXBN6G/R8Q+7Rpo8vFmXRcXVvrw0FQj37Es=;
 b=mz/ZEd+PvXNFH72vP0EFqXCcMjaQm7zciCQpNoSJaeA07xOQkbjfhQCLs6Ti6uuAiQIdpMQpm8McSGjvnCH0XVM2pnzcg3pBbLOvPNlIMaKB2LpYCpAewmru1kkKXb5a3LZnqx+jmwwfsU2MUwYXB/VLv/GM2PPG/2VZ72v+CB3BvNTSPYYpEGhC5NDgc43M5Oq0Ve0Kt5t0Z3ZE2FZC+CwyMzVpwBoyuxAiybm5FZ/C6QaYo7CAkODvMz1s1+8J5WSZbBBH6V/uPEAKXx6v8+P8K2uqEABpTSMJ436c8RpQUK1DfHzvRbRRsbcJH0u3Nu1rH6EHHj4MjNQGDlMr2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzh41pk7oXBN6G/R8Q+7Rpo8vFmXRcXVvrw0FQj37Es=;
 b=zesRptkWW86DGl4FgeqtG+LHZlhHnNxky2dwRTbHRtPuOZYsRn+dTrZ+SpaWnk0FK09/7gFdp2pjc9Iqu4aMvFKaJKUr1jTLxG1vjPmltUINMmhZRVITusQm1avc9jN8cTxpUQdAZtKUGa+SxhO6jSpDXo1LLpNGDBJatwwzJ2KUqnANWmr2+FeT/WTPq+tICp7WU9SU0Y0IVcIaJAT8YYHKAATjvL3ZBAgANnmKhA6kthicAuysHjZYtJONXwqNDjIlu/i95pnJwXanwNatOgclLldghX8wzsNn1RLqCA0S3azclWPiYdVIqikz79a/h2XWB3u0mmjXhXa/fLQ5lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AS8PR08MB7207.eurprd08.prod.outlook.com (2603:10a6:20b:406::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 12:24:55 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%4]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 12:24:55 +0000
Message-ID: <fa6a4bb3-11ff-bd4a-715a-8a89edbc0a42@virtuozzo.com>
Date: Mon, 8 Aug 2022 14:24:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 8/9] parallels: Replace bdrv_co_pwrite_sync by
 bdrv_co_flush for BAT flushing
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220808120734.1168314-1-alexander.ivanov@virtuozzo.com>
 <20220808120734.1168314-9-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220808120734.1168314-9-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0154.eurprd08.prod.outlook.com
 (2603:10a6:800:d5::32) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08f51f81-cb1c-4cee-ff53-08da7939008c
X-MS-TrafficTypeDiagnostic: AS8PR08MB7207:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EtgOCWTaTrHUTOBPxISceeaWmy7MiFUIZB43WwtCS/jTSrBKr8cGvsDg6dTrBglygCLvwBuP/4smanT7VACW9cUfEZRw+O2mvGEFotHqaS8XGX3Yx5hOtchFDaYt9gfQBnU1jzomuvu7dWyRNSLAklRP17nPmTbk6smbyLZBvFqYxdIKAyk8AIzNqcngcsK6Ds6ws8+3T2rR/RxeQ7UhcH6ceqdY/vmUM5VdcydDUlCYMNPolo/flipDuJ/ZIk2zXDIp0KchgysZYOzWPY2Rs4ToZ88a2ZETm2CizDoSJ69LipZ/agtvJFhuPGtzbLmquwK3jyrqjlloJdkaAkS15lLlndhZsSQzrzrel2cJJEF3gPZyhscOGLWDK0Oi54ItdxonWY44Lhy14Ccs/zKpTxISVzkRCZ4U7KzS9dUPJNuugvSxu1gSh11nEstIBZ3PPzzXEfuc0wAYJgpBpxQ8v1D9RjKlQqNLD4s4HexUxdUjpNIejH+vjHaYATMeyK1ctiR8WD9k9q+c8A+bBpOSFQotuQlCAnNF6hi8KugPhz0lifNhBIHvtzrBQwCGHs2LsiDikJmLRGkpDkcClyD6W9EFNU+cnyFssEVVjntqHN8jp9bDT8Q2jzFZBF8ZoSl2o03xFmCzIq9WUW2P4INj/5QASyBiwpHhbZChbXDSekvEh0WX1QoqO8vJ9JVbgNDMqmQZHHgDYDlGLKFONVEIjli4wU+4EJS5S32QHWX1aWp7DfK9EZcWgfQ+f1ns8lp1dnZ/LTsgzNib/7MrlvDgsvtoCN9BNdx2jL1ksmBPtOTJjwGBmbB8myrz5eXzRuhbDMpTvSnQpvGkY286fhaMtsrHqFUnxWhxdC+s2Sw64vU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(376002)(136003)(346002)(396003)(366004)(41300700001)(53546011)(52116002)(6506007)(2906002)(2616005)(26005)(6512007)(38350700002)(86362001)(31696002)(38100700002)(83380400001)(8936002)(5660300002)(186003)(66556008)(8676002)(6486002)(66946007)(4326008)(31686004)(66476007)(36756003)(478600001)(316002)(4744005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHFvWnN3eVV5d3hhVllEMmV1MENvaEVvRnhNMlpCZng2emxSQmRiWWJFMU5x?=
 =?utf-8?B?NFFCZU4zSXIrVFRDSVZ1UlZKTzZHei91RU9sMFZubmYzK1lPdHF3am1pNkdT?=
 =?utf-8?B?L3Y5YUFaMUxjNDYzMzhSUWNCbXFleDNRenFZME5yM1RsMFBnOHhSMHh4amcr?=
 =?utf-8?B?ZkxmS2U0L1NlR0M3TmhMeEw0WWpwa0F6S0t3RFRKZjRQUzVkUTlnRm4yU29B?=
 =?utf-8?B?RGpQQmJSNGo3NGM2c0p0WjY4OHFkZk5VSkQrZEVOT2VkQmJvT08wZzNtVDB3?=
 =?utf-8?B?RElHd0dnOXByZjY0b0ZuTm5qZlVnMHcxRm5ISGJMYWwzWWd3QUtZeGpEMERQ?=
 =?utf-8?B?TkwzMnF3Z2lONlBSZ0toRGhWVW1ZNThRUVpQQ3pnN3ZqWU1jaUtTYUN3d2Iz?=
 =?utf-8?B?Umc2ZUtOWldFVUFkSW5HQXlVeGtlMDRMNTJlL3hUcmhmS1pieG1reDU3OWg2?=
 =?utf-8?B?Mk5SR0l4bHZVUlhoODhMY1AxYTRMZGdjMTErMHhjODhUM21Lbll4MzJ2VUN0?=
 =?utf-8?B?a3RIY2k4M0JqTDJDVGxRUGZodUsrWnNscjVwcDRaUnI0Q3FLZWhqOVlIa0hK?=
 =?utf-8?B?Wkk1Q0ZHQnZTVnZGbGJlcHYzdkdNSGMwMnJmUXFyb2RsYXdlL2F5RVNKRXVT?=
 =?utf-8?B?aGFDME5VdEJBUGdlUFpjeXVYN090eWdVZkRnMGtyeFA2UHRhNTVsQm1kUG83?=
 =?utf-8?B?d1Iza1kvZElEZ2xPSVU2YmZZTTh1ZUJNTXUzZTNjTVlMemh6TUNvZmNzRG03?=
 =?utf-8?B?c2U5eHhldlFKVER0YnZSOW1zRTUzb2hlNDkvTHU2SUZibWhIY3pxZXhMTjIw?=
 =?utf-8?B?U3ltSENmNnBPandLUE0zcVdmWUhxQ0VuODRzdDV3UDdROTJCZjhTdERWR0po?=
 =?utf-8?B?anJSYXR3ZWhiQU02UlhYYTYzZHBSSDRVYk5NV0svd0IyZEtUUWtNZmVnQWY4?=
 =?utf-8?B?ZFJJYlRmMjRuOHNYSGdUd2Q5d010amJGeUFxOE4zTWtGdVNMWWNTbUVpMUFr?=
 =?utf-8?B?SkZydGl2N2tRdHpucFVuNmZPSVIzRnVXZS9ud0VjeHYzVjFqOUt1cEs1RTNO?=
 =?utf-8?B?VnlxNjBNWDArYUkzZEFEdlRNQXIySlRxV0NQUmU1SnFybkhPMXRzTmM2NFJp?=
 =?utf-8?B?TVh4SUN0Ukh3Y2FEYUxmOUV3SDFmbEVBeExpcXROVWFIZ0lwTktxMndBekFN?=
 =?utf-8?B?UWc3TXRvTnZpYlBOMEVudW1wVk5iOHVTSmNkT05iUkNhQjNrZGU1VVFxZURm?=
 =?utf-8?B?Z2NEU1VNV0pyNnJISUlZRUJJbEFHbDNDVjJOamg0NDBmME5yMlJyQnRGNW9G?=
 =?utf-8?B?NGFxSTA0L3Y5dnFhMEg1WGZMNXhWalpBV1ZXS2VocWhKQWFLRUEyclI4elBQ?=
 =?utf-8?B?K2Z4NXVNZVBGSFVuS1Zqa3JzMnIzd3d4Q2M2Y1YzaGNMdEdUUE94Ym1SdWxM?=
 =?utf-8?B?UUpPRlBKWTdOMTAvTDViVTZYYTZMM3EyL0U4Vi9paUtvNmhLZC9STytQajB2?=
 =?utf-8?B?MlNyZ1h2NmFkVjZma3dFcTk2RVc3R2g0VGtlSHV5dFZzamJkeG5YNWZoMXFQ?=
 =?utf-8?B?OERVc0ZWUE1GKy90Z052WmdHYW1BSzA4aUdTQ3pla3NHMFZjYnBycG4xRnFM?=
 =?utf-8?B?MlB0MG1lSUh6LzFvMm81QWlEUXVwNVZ5TXF6SWJUZXUxd0FZQVR4MFhjTUh6?=
 =?utf-8?B?Q1ZJdFp1eVpMS1QzbHpubm5oclk1YU9VYy9NdjNJbjk0MWpVemRvWFZ6WWZv?=
 =?utf-8?B?M2ZLeVFObGk5QWhuOUI1MmFyWGFZOFhyNUFnRnhmT2hKVmJDbENQeERjOGxL?=
 =?utf-8?B?THpYR1Yrc1h4SDN4MTlNaVhqR3l3RERSeGl1aWgvZWlPckRSZGVPaXVESHJw?=
 =?utf-8?B?ci9mRmFiZjZISm43Y3pWUGpEL0NRSHZjSURLMjM5Yk96eEVHL1BzNmQzUStE?=
 =?utf-8?B?cG8zMnBMYzkrSWNFZ25SR0lmZWx5NVgycm5ucGFpZktUd21pbkpGZFNpMDdv?=
 =?utf-8?B?N1Z6cG5mQ3RnRkxuZ3NTamNmNS91bk4zQVl5QUhNMGc3VEducU1XMnVtWFFV?=
 =?utf-8?B?RTBBU2NpMkVlbE1qWEhQVDdOcUdCRk5ac2FRYjlTTWNFd2lWVm8yNmJSZ05u?=
 =?utf-8?Q?T5enyU/+NWm3Bl6lieSpCyP3K?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f51f81-cb1c-4cee-ff53-08da7939008c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 12:24:55.7714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mdi4D0YGkbjAVIibOSb37XATYoTIfwH2kk9FAwjP0dkfj9wGibzOA5fmv0+V7yB13TD+p5p19xkxOWRNq9MMWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7207
Received-SPF: pass client-ip=40.107.5.137; envelope-from=den@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

On 08.08.2022 14:07, Alexander Ivanov wrote:
> It's too costly to write all the BAT to the disk. Let the flush function
> write only dirty blocks.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 72cf7499c1..38b1482e81 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -469,7 +469,7 @@ static int parallels_check_outside_image(BlockDriverState *bs,
>       }
>   
>       if (flush_bat) {
> -        ret = bdrv_co_pwrite_sync(bs->file, 0, s->header_size, s->header, 0);
> +        ret = bdrv_co_flush(bs);
>           if (ret < 0) {
>               res->check_errors++;
>               return ret;
no-no-no, absolutely no.

Please drop ALL flush_bat dances. We do not need them once we have switched
to parallels_set_bat_entry. We do NOT need to track this anymore, this is
handled inside and thus flush should be made OUTSIDE of helpers in the
generic code of the parallels_co_check

