Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFCD591223
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 16:24:55 +0200 (CEST)
Received: from localhost ([::1]:37386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMVao-0007Ep-OT
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 10:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oMVVp-0000cd-QH; Fri, 12 Aug 2022 10:19:45 -0400
Received: from mail-vi1eur05on2128.outbound.protection.outlook.com
 ([40.107.21.128]:16353 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oMVVm-0004fP-FB; Fri, 12 Aug 2022 10:19:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADM8H+arRLTcBsEChX45NtwF3+emTo5fv4tu3KO9D8et53ctspzglMN+rQ/1S0JTLQtcIuvqCfedJvl4hYcl7DQoNVrU1ZW8/A9lzkf/SO0SWaXquveY+BhSngXfol77WTwdf7IWVlkEuvldnKmPJiztFM3IEfidR88ZySKD1RMEpaQiDM6/Gpk8MrxDBIONxJZMzmSjlASrGwofHR0KX/2EKtySJjt37mlPRTd9SuD7sXtAOi9g7ErUOhcUdmDWrLUGSzyZJFXf/dPSP0wL+d/Et8hEl+lO7XdPjGFmnxufGINA8EW5b2OB4scDQxUaVDBRjSjUZ1XqGEjWfLH58g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rm7sAW2zpicSYYTwrcXXAItJLNc/jj7nv8UhRTPjRU=;
 b=Cu9T9KESVZDcIVdXY7zxTuPLg0VEo2ts/eTBeTA6VxZH3QIgs8xKRCofJa/nvp665Di5MhTZAn5XdkOrrD6sLyZfHbv7QDCIDHb3des/mw2rhFT4G+mAt+fSf+al4VXGvqH68mgMhGrQ2a74fxXSblfgGESf6JSJ0TqdpiIHpiPbBzaUXsTuAZzT01SAbP+6w/h7IQPorPySY1kVkeKa2KclV67a2386zVDLBKFlDR1bFv6WDBcBmmb6ihECNhDuVEtQkQIIMD7tWVSLWW+7RMMurFaBsF+HTLG9y6XU3DLwoXlYMrqMlwodqcrFr374cvQ/jvlGRlKrUNlmursCaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rm7sAW2zpicSYYTwrcXXAItJLNc/jj7nv8UhRTPjRU=;
 b=y1NZXKy3Z5YBiGyu5brZ3RAeyC9YkndMMv8viKyHNmcjcPtv/fPH4KtYfBfOUIBKvFeUUU50UO3iH4Ut5H+1tyZXAJGOUHi9/pDwrPtPbXgMT+dYG6VjnLr/+FrO0Fhw/Y8DJluhT5yqLTu/Sw4c7vjg/uMshauuAIPwTyAG2IgdiYcanbg2bcpQiUYmdWer7ndzMZ6zd4bvXJfgdjKkM24qkV+1VW00Qt5cQ6z2vm7F2W2RT5lO8WAjcCdrhEJIpeIScCgi5f2pm8sOCubBoODTPimDuoBDwTc0kdvhReXH2Xx7OSnumtTSIUOuYJBX1Ee6GeUL+Je7Eq/j732Sfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DB7PR08MB3705.eurprd08.prod.outlook.com (2603:10a6:10:78::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Fri, 12 Aug
 2022 14:19:38 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%4]) with mapi id 15.20.5504.023; Fri, 12 Aug 2022
 14:19:38 +0000
Message-ID: <70e30936-7e94-2c00-7aea-f86e7adde27b@virtuozzo.com>
Date: Fri, 12 Aug 2022 16:19:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/8] parallels: Move BAT entry setting to a separate
 function
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220811150044.1704013-1-alexander.ivanov@virtuozzo.com>
 <20220811150044.1704013-3-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220811150044.1704013-3-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0006.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::19) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2541d91-b18c-4d17-a98c-08da7c6db094
X-MS-TrafficTypeDiagnostic: DB7PR08MB3705:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6A1/b3QBo74YEONcJ4dft+NDwyGG8d6xlk5NqSeFALNZWHpv/eKK0mbFvPhjlLbCCrqNcxAIK0KbQBB0lh6EMBCr4YTKwDYg3nxDnChwRqysKjQNizCVudmwIgiDHjR6SU990LDv5+6/UVlPXdN7wb7BtlbJz4g2/OD83ui0x3ZCXZTXfQpHE7IdrkxIFRtKydePwWQT21FZbTGrf1Cc65gSB3kv/Wcjra4wMuRSjNgt5T8kVpxSya36nh7HEkWhsvurlI/IppyU6Vhe30xRBgDds3ADpe2X/uIMQYF/0bPVXPMrm+9YCIiJDbQmSLsVS8gTF4aG7hZ1cYCDsTUmXJ/8erSnomicdXCsEdOUZb2oJQxM69qTIqXy+wCzun0L7mAOA+c+bH3A4OqJMxJVcURRXsFPppW673o/Dgyaj8QJCxvFXIqlCljBQejS8M1plybINHrZSasntroYKk9ZeiZxvROxoG2h477ipoWJdsQgPcXueE7V2owOx3bo5yXwIL5HkLrgUwPHoGXw/LSnxD7WvYsU/nByv474I6CVW93FOrxZcPfAA166sVQ+uLGLthj5o82jTDMdiORsoVU83NT+08FRWLQaunhz3a2v6uhc3L/3wqqeQ4w2s5inFbiPlplRdvwTL7Z3wED5P/t0myQz/fSL48a7MJ1OoyyAVcp8rzs81nRhGqkWWFr6jmgZwqdtsKzs+6IdXmAzMXcrR1BkLAAap9QToDpRdAhmZsDN1EQ3fZVhaejPNdK2WLzhZVkH+Am7N8iGbg83hbaP7lZeGFbdNOQlYWrhzKgWm7d1XyE9lYFVXW9H2ifTOkuJfoigNfZC6leeZTTR+3t05WmVLeexyE3Dh2eH/3ODHLk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39840400004)(396003)(136003)(346002)(366004)(376002)(53546011)(316002)(52116002)(478600001)(6486002)(26005)(6512007)(5660300002)(186003)(83380400001)(41300700001)(36756003)(2616005)(31686004)(6506007)(8676002)(2906002)(66476007)(66946007)(4326008)(31696002)(86362001)(8936002)(66556008)(38100700002)(38350700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZERwSmhsMVFyYXNZd1dGcXkyWkhxQ3JOd3dvY1A4eGFtZDh3cWhxUFY1UGdi?=
 =?utf-8?B?YzlzaHUrL2FXK2VXejlNSC9ySk1mL3NGdURnYk1QeWF3VXMzNkxSeW1ueXhO?=
 =?utf-8?B?Wm9oeTBBL0xkVWdRMmN1eVVNNDUzYm00ckl2cUtaZ2s5dnBVRWNKZXBpQ2Nr?=
 =?utf-8?B?L3NVbnJoVU85bWFpQXNRN0tyeWJIK0p5S1ltYW1jYktaUVVLeG14aGRnemoz?=
 =?utf-8?B?QlpTMEIyUmVMNUpWaXl1cUZ5cTNyRUIzOG5venVzSXh0bU9ydW1wcU5XcktL?=
 =?utf-8?B?SCsyUXB1M0l0RC9Fd0xlMmJmOXptTUpBdnpieThOL2VHaVg2TWZNc2U0MVVh?=
 =?utf-8?B?MXE0NFBPMlJwbDhFSmQyYVRQVDl0MnVYU0xESzJVK2dNM0VwTWhwTG9aMnhH?=
 =?utf-8?B?VHFUZ2hVaHRsMzU0WlhET055OU1PK1pMbm00d0NPdStZcEJzdktpQ1UvOGxv?=
 =?utf-8?B?Y2ZvQU1UL3hDNkppN3JFajNzU1FBWHQyVjF3cFVYbmRneGdieTRuSGcyM043?=
 =?utf-8?B?LzU0cUM5RzczWnFYN0w4bUFLelpXaTdiRWEzd2NYZHFiOGx2bEVDMFkrMGZa?=
 =?utf-8?B?MnZZbmhLV1JOVXJmS01OWWFKM25PMWZMM2s1dC80TGw2SWVpT0d6MjJuYlBH?=
 =?utf-8?B?N1Yrb1pXUTVEd3ZVMmpNTEo2YlR3WWovbmZBQ0ptN0tWdEdmVndmbkZ0NGVW?=
 =?utf-8?B?RlUvdll5OTdoVi9VcVZsZExCZFJjV0lLUnBjTzBISWJwSWRJSjBEU3RCaE5o?=
 =?utf-8?B?ZUhlSGxiTUZKREJCUytyeVNvcEEvRXZ0MlQzVkFiOEtLbVJIWEw4MUZYaFdn?=
 =?utf-8?B?M05YVnRxWEdlNWNWVXlaTHFaZzVITEVCekptNGZQWFB3bnBJcHdyTW96ODdP?=
 =?utf-8?B?YW5aWU5BbTJuRzNFUC9vTlRoSTk2eDkrWThRSU5ON1VqYXVaTWhTUUIzM1BF?=
 =?utf-8?B?OTFXb0FXcitGeWZWUWRxb3NJVjFnbEg5RWFwVDExY0NNUlFOb0xKSkl0MUFX?=
 =?utf-8?B?K3FmS21TMEFkeVlwK2tEODgza215M0E4RGM2bjZwL0lYZnZzb1grVXBxQWFK?=
 =?utf-8?B?a3ZhbGF3NnJrUlVQNDRrQWkzeWpHc0JJa3BZRVpRYU9OcjZBNXZSR3pJRWFn?=
 =?utf-8?B?RjJUZXU3ZHUxOEpCQ0x2ajlDcFpsYndjWnZiNnFsMkVveWVnS0d6eGpuZ1Jh?=
 =?utf-8?B?Mlhtb1YxTVZZb0U3Vlg0R3M5WnZRYnlwczBJVTJqWEN4bktLQ0JIUGdubkFT?=
 =?utf-8?B?bjJTdExyKzRoeHJFNVBJT2lCdkt1TlhQTW81RHBBdUZ6cERwbjdEMjdKVnZR?=
 =?utf-8?B?U0NZa09iODI2d1RVLzNwZ0lHK2o2SlU2R1d0ZzB4QnBERkh6S05KMmtTL3VM?=
 =?utf-8?B?RVIxakF6cHMyOWEySUdTY3o3UVNMRnVEeVVSd2pvdFFSeGlSbVFyQmhGZSs0?=
 =?utf-8?B?ZHdBcHhKSGx3ZUdkM1UvV0hZNU51SjZXY0tvYUloOWh3Rm5IcDExMmYrQzdX?=
 =?utf-8?B?dW1vSjVlZmdDT3RsR2gyMjZzOHdTVW50YmpzQVE5UGJVS2xqT2gwUHpGY2dh?=
 =?utf-8?B?dHBEVWpRVXlmaGg2OEdySmVZR1VFa08xeWk0eFpkUXBOcW5TUmpaZC9RaUoz?=
 =?utf-8?B?MXpMSTI3VVJhSlNJbHlrOHA2Yk5GZW8rNkpPa2Q5UjBKZGo3WENtRTFSbU5l?=
 =?utf-8?B?TUFuUWJOYWpSQi9QZFUrWEswVnNiWlpQWUhyZjdodkp4a0ZQSlRMTWRYUisr?=
 =?utf-8?B?WjV0QWlMRWxBS2d4bzlKZC85SFFWckdJZ25CbG1nVnowNXpLUllhcmtDRVIr?=
 =?utf-8?B?V01KamFZYy9MWnNVcnRad1VLNVJnanlsYWE1QThHNVlScDNTZGRxRnd4cGJp?=
 =?utf-8?B?QmhWNzdnZ2tqcnR2dnlQaXZrZDc4ODhqZ0YvLzdyNjRTS3JBT2lMeGJSYnJz?=
 =?utf-8?B?WjFadFBMQ3JUNU5ZSTAzTzY1ZHJsYXJOUXF0WVNZQTAyMEd4RmF4SEVsK2RR?=
 =?utf-8?B?MnZmYjVmY3JoVkVjN1pjRlBMYlJGRmdMQml6OGVjSFgvZzlReVBuSHRFOHlw?=
 =?utf-8?B?dEI4bjMwbGxRb1IrKzd3UzJBRVZuK2Q4dW1BMWNNcHNzcC9sTW1TT3RNK0JC?=
 =?utf-8?Q?9xi2vAZFL3We/DkyDemOBgd4v?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2541d91-b18c-4d17-a98c-08da7c6db094
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 14:19:38.3096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aw8tFVzprD/yR8FtysteLIB1tEd9U3hGB4joAWTgYtGws11pGzavQgosDhgCwFDe++iOJXDD9ln6BJnuASteXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3705
Received-SPF: pass client-ip=40.107.21.128; envelope-from=den@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

On 11.08.2022 17:00, Alexander Ivanov wrote:
> Will need to set BAT entry in multiple places.
> Move the code of settings entries and marking relevant blocks dirty
> to a separate helper parallels_set_bat_entry.
The comment and the patch text is ambiguous.
You say that we need to set BAT in multiple places
but patch changes one place only. I think that it would
be better to say like the following:

"parallels: create parallels_set_bat_entry_helper() to assign BAT value

This helper will be reused in next patches during parallels_co_check
rework to simplify its code"

> v2: A new patch - a part of a splitted patch.
Same note about version tracking

With above taken into account:
Reviewed-by: Denis V. Lunev <den@openvz.org>

> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index a76cf9d993..7f68f3cbc9 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -165,6 +165,13 @@ static int64_t block_status(BDRVParallelsState *s, int64_t sector_num,
>       return start_off;
>   }
>   
> +static void parallels_set_bat_entry(BDRVParallelsState *s,
> +                                    uint32_t index, uint32_t offset)
> +{
> +    s->bat_bitmap[index] = offset;
> +    bitmap_set(s->bat_dirty_bmap, bat_entry_off(index) / s->bat_dirty_block, 1);
> +}
> +
>   static int64_t allocate_clusters(BlockDriverState *bs, int64_t sector_num,
>                                    int nb_sectors, int *pnum)
>   {
> @@ -250,10 +257,9 @@ static int64_t allocate_clusters(BlockDriverState *bs, int64_t sector_num,
>       }
>   
>       for (i = 0; i < to_allocate; i++) {
> -        s->bat_bitmap[idx + i] = cpu_to_le32(s->data_end / s->off_multiplier);
> +        parallels_set_bat_entry(s, idx + i,
> +                                cpu_to_le32(s->data_end / s->off_multiplier));
>           s->data_end += s->tracks;
> -        bitmap_set(s->bat_dirty_bmap,
> -                   bat_entry_off(idx + i) / s->bat_dirty_block, 1);
>       }
>   
>       return bat2sect(s, idx) + sector_num % s->tracks;


