Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D6558B861
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Aug 2022 23:09:30 +0200 (CEST)
Received: from localhost ([::1]:38726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKR32-0007KR-Kq
	for lists+qemu-devel@lfdr.de; Sat, 06 Aug 2022 17:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oKR1d-0005pk-9S; Sat, 06 Aug 2022 17:08:01 -0400
Received: from mail-eopbgr80111.outbound.protection.outlook.com
 ([40.107.8.111]:31983 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oKR1a-0004SK-31; Sat, 06 Aug 2022 17:08:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgEOqejxsw6nWII00wvYM6coHZxKhRHe+jomPLkiyUCuP+CiRGwL7LU4q+3qU3XeUU512K4+PI1qYQMxN8QOIkM+0IT0EefjD3lR0JuMirrP6wxW/spVa7XJ+2/ZLL93u9SWe1d4Wx1YMBse9xalDOjzMHd8Q/bR3cfBSAk5hLsG4H0SgNGquT8rWBFSrg+rEroAfoVqJvx8UNQaBJJfyICKhCQ4opcdRBkNZtg3aIHkegOxwRO86zZf3jEJ31SV5vg6lklqNO45yQPDlZ3g6Oe3m5LM4nkFZ96IpU5W9Ovqk+Pdi6uy1NbNMWEBfzsNUPJwq+tCpYDwjNkUuHZbPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrOt9bh61hAMzW3vWEcEKUVMDRR25llcDds5yr5mxwo=;
 b=cHWj/drTuvQTHV1WaqZD+tpYfOr0Zm2xJF8II2oIpnUo7GEgrdoq7ynuzWpAXeiLT0LRoYJFKNAvS8u6tcDZ/mx96xD1yN6xh3/8FWzp4HXLMbGIlHEj2c0yyhfq61tQOcAgBAxOEcQze2S/LqINkGgcSCk8e79XgjjsNtca0JfbLC04YgfRZAIF4WWO+jObZDwUhPgrys8LDq3FMLkb+3sZwYD12hgSqy4j+BlarY2tfLvokRgjbizkJFSYBo7mDPOwPY6V77BmZjzQ9CS1OyxfI0LX/tr+e/1+8IuIyP7rcszBmPB4J/pjGpOpjahfKM10zsnZUp9XFu2wrpaWEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrOt9bh61hAMzW3vWEcEKUVMDRR25llcDds5yr5mxwo=;
 b=gKDUCeuybmYE8QvAYsGlWF+bqBwO/KrLrD0WoUheDpXuLIrTboEzTXM/pcemX+/OxdopxTnmHmGLhu7V+SVKhXoZN0sdVr62dGgn+Wyx1giAXczeO1mnfIbZf0AX7/dt3rry9V68oWeEbEELn0uiDEYQRR3cRgRCKE0ihb42eONzrQuC6bbROgf6bdp50rzhjoUZFcQv3bURxYtWoAXaE/XP9nMY/UtdBaOPn4bHYRw2Z4jaPbDOeiKrEXZtbYJfSjCP0yUppU51Gix9cw/QnyGoh5djfEyqgPVbf8+pgPRsAPV31zK5Uwxxd6hqm9jW+XdkbA+6qRgFupxJ4M+Zcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DB6PR0801MB1686.eurprd08.prod.outlook.com (2603:10a6:4:3b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Sat, 6 Aug
 2022 21:07:43 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%4]) with mapi id 15.20.5504.017; Sat, 6 Aug 2022
 21:07:43 +0000
Message-ID: <52d7a403-96af-611b-3372-58ed50e60cf2@virtuozzo.com>
Date: Sat, 6 Aug 2022 23:07:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/3] parallels: Add checking and repairing duplicate
 offsets in BAT
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 alexander.ivanov@virtuozzo.com, qemu-devel@nongnu.org
Cc: natalia.kuzmina@openvz.org, stefanha@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, qemu-block@nongnu.org
References: <20220805154752.799395-1-alexander.ivanov@virtuozzo.com>
 <20220805154752.799395-3-alexander.ivanov@virtuozzo.com>
 <8f2b2cad-d24a-e5e4-a8b1-3a8088788921@yandex-team.ru>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <8f2b2cad-d24a-e5e4-a8b1-3a8088788921@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0602CA0013.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::23) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ccd1d68-c330-408b-4f0a-08da77efb427
X-MS-TrafficTypeDiagnostic: DB6PR0801MB1686:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fSmCv12mIHsbVMOt+SQp4lVoAHhGq8/yMA7eYcNbignxgHSSZiV/XhGu/E0G1yvVeCS4GLrZOTLCYJyEYyBlu6wCZBdrHnuNzfz6P/6N63t+0jkBsIJgjYplcQ1Qc9y8RVTrRkxjO3TCmUy7VYyQ2PLoCWWUiKg9KM6kUFZ8T8tWmv70XZUzHJRjA+WYRSexNSupUY0vyCK9g1x9h3xuY/mA2dp8JE5sYMHJT4l/H0xdqIrP0HCKd/WGftUB3WVbvGosMxjmWAu3nmnCGfZovARaX0Ij7pWBJ42zo0MKOY2xdDDBWGeJNpq1nIsFs0ttDt1YPCFG9/6wDRzajmE1iXJ9pquO05YUiScKv75uDHfDe9kvMJ9fPQKeGUWYvf6bNTga0R7BtBrH1ZsDsQUBRbN3wWyUSzqE7OzftJGR3SrrrB23viTptBF4Op3XXT3SRPIVjKcj3/TbyKPJ22lzWYFriM/4cWp+PWLh5tEAVWLQgxRSN8CjNDbmgDYfSN2o8x8UBHQtlzWmyGubCiKjfxa3GhfI/d8wGYI5J40xg8FMqcqsTKBWCMwF3Uj6qlNf7JkK3CnUpigoByLWM7uWzPf2ot+QfiPR8T6R8M2bVhtfhLzB+Dl9fX4Er5SOMedFO2c6wNauML8ZT45ZgExzqMofG/IAuwpug9izYgLK/G+IDlwCvlRa/qc+eJb4X64vIvv8gmaiEDA/QEi1YkN+aMOWL6Qh0pmqoUm+ZadBuNc6JkOWtYSxM2I/1pHl70fZNgM70FF4+3vYCyR/dyCb2unrSHoASQrzD48SPxguL76fxmkrbD0nXzpcsVlZnG/6dlUw4y6kC2nhMewv+mPfhplk7u3Vl68vu9xrafV1d7B5cC7pU6Hd4PsS22FFZEXR+zxYb+I4w3v+iquPVo8C7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(39830400003)(136003)(396003)(366004)(316002)(6486002)(478600001)(2906002)(66476007)(66556008)(8676002)(66946007)(4326008)(5660300002)(8936002)(38350700002)(38100700002)(31686004)(31696002)(86362001)(36756003)(41300700001)(6512007)(186003)(2616005)(26005)(52116002)(6506007)(83380400001)(53546011)(239114007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGhkL09vOGVrLzJQNmFVRFg1Yy9sWmZFcHM0RnFVMzRLdlR6Y010c2lwQTZM?=
 =?utf-8?B?Y3EzVU01K2dLSjVBelVBa0xvVjNEKzBiWnpZcXdzNE05VlN2d2hGTTlsWHIw?=
 =?utf-8?B?a0ZEOW1TQzMrREFBWmRURldQSVFqQ1ZxY0d4dkg4eXI2KzlKYmg1WVhDb05n?=
 =?utf-8?B?dUU2ZmNEQmFHeDBhdDNtdnVUUWZIMVUvSzJNSzZiQ05xcDRrcTU3cTlhRFpK?=
 =?utf-8?B?NjNmcGxMNXZUNUk1TDJMc3NGZVJIQ3pBU0JPN0FoclZNYW5zYnp0RW5NbEtW?=
 =?utf-8?B?VGdsd2kzeFF1Smt1VjVuRFU5bWpZazB0d0NJMXMwcTBMOStpQWVzUkRiVStC?=
 =?utf-8?B?S1VmUEVCVlJyUEdsQm83K04zUE5OVENWOGhEdSttNStpSnBadVJvUys2eXhN?=
 =?utf-8?B?dWVyVmtHcWxCUGdjVHVob05jRmVhSzZ6cTVaeWp2N3RqZXJ4dGxnUVBwZitR?=
 =?utf-8?B?Smlyd09oNm1ScU5xK3l6UjJwdEo3aU53NzR3Z05xRllLMnZzYnBIdzVLVHlE?=
 =?utf-8?B?dGYxTXBlbUlPcEUrNjYvcFFIbEVUOUVSSEVmMlp5WUJ6U0ZucnQ3dzQ3aCtV?=
 =?utf-8?B?RkxCTjVlYWEzd3Bhb2pzaTY5akxGaXEyeUJLbFhXQ2JiblFGajFobU9Dbmxw?=
 =?utf-8?B?Z1F3OWhObGtUYjA3TkNNdHV3UzhyV0JTRjVpNmh3dy9veWZWQURyKzdLY3Bo?=
 =?utf-8?B?dkNzSVB4a0k2NHFlQU9SajRPMHJwRHRYNmc4Rk5HaGJxNXJUUGV3ZlZNRHRX?=
 =?utf-8?B?KzB5UVRTcC8xQ2lRUlZoODE3bEtNZ24remVJQXI5a1VZN2NZUDdtd3gxSy9H?=
 =?utf-8?B?bkYzclF0YVovVWlrZVdHSlZlSWgyUE4yMjVnWW5MZm9zNWRYS1cvOFpmL1ls?=
 =?utf-8?B?QnloK2s1R01oREtKZmtkZjBYa2Z1ZTNSZWE5Q3lEQ0VESHF5QXVmaC9kKzFG?=
 =?utf-8?B?UnlCaS9tUnlLblllK3NOL0NzTHhNQ0d3ZkxpSUVXdHkrZDVscGFGdjZwODZj?=
 =?utf-8?B?QUlISXROR085cDBtODRlWVM3NThiYzVxdkdhTXJnZGVWRGV2TDl6a0k0QUJ1?=
 =?utf-8?B?ZFVEcGszY1FsUGxiTzlBNkllTmtKZjhpcm1RQWxsVG1oNFFLOW5xZUtBRVps?=
 =?utf-8?B?NkR0ellLbXNRY3hMN0FPODg1ZS9oU3A0WW9MaGhhS1J6cFE2c1hVcjdycTF1?=
 =?utf-8?B?Mlg3TEpuVWRNSzRETUJFeFhwK0NUU0swZUxKdTlSc1NFdU1qUi81Z1IwK0RP?=
 =?utf-8?B?aWNmd1R4VWZweVhPT2hSQ3VtUVlWcWpSeUs0L3FlSDRlN1haYldNcDQ2TFNz?=
 =?utf-8?B?bkxTOUQ0SWwxRFZkSFA1MzdLOEdYbEpxQk9zaW90OW5wczhzaDFWVENSMmFs?=
 =?utf-8?B?L003Z24wK1M5eFBIaG5lZGp6K2hkSmN0VjFWY1NQdzNSa005M1laZTNrR0N1?=
 =?utf-8?B?MXBWQmIvaXVpYUdkM2JwZENYMU9pb2pHZTlHTUdVTXlialFtL1hsTXptTkZK?=
 =?utf-8?B?MUNwdUY2UXBPZG40R1hxTkhyU1gxeGR4OE5aRTQ3TGsrRXRkOEFHRmFFak05?=
 =?utf-8?B?TWlBWjJLVGZiakVQditmYVFHZTVRWnBiaVIyalQvYzl3bWF1SzdzeVNXSzA2?=
 =?utf-8?B?V29FU0JyVlhCajNqZUFGbmdtM01GL0hRNjAzODNzS2JxNFlwNmVEd1ZRNlc3?=
 =?utf-8?B?azE5a0dhdTRPdkpsM2hNdFpTQk00ZnUxUU1waWlTYmpua3VLaDNMUlVuc2dk?=
 =?utf-8?B?V25lbU9GdzVqZyt2eldiYUY3azExNVZtV3gxeUVXaG5aYVR2VXBBOFhUbUU1?=
 =?utf-8?B?bE8wekhJVHh5QW9vUW4xR3E3WkpNM3J3UEM1Y3dEemt1aUs3bGE3S3VJbVRm?=
 =?utf-8?B?V3RHQmpiQVdNQkYzVElnNVV4SE9aaTl6WTFOV1lOcGhxaExqMTArVXZkWVJ5?=
 =?utf-8?B?eXQ3TGZuUTlVRXBaak1mYzNGeklBMlNpZXB4Q3Y2dW8xRE5SSFJWcmtHYkx1?=
 =?utf-8?B?VzBxK1llMmxLZW1Yc3JNTzh2UGJIV0FmYS9Md2kydXFIc21nY2V0MzIvQTRv?=
 =?utf-8?B?UC9QVlhhbCtHY1ZqdGQ2NDAyZVkwWEpoblVac3NxTDRGV0dsdHNLeUh4ME9N?=
 =?utf-8?Q?eocKSbXUfrpRdDy4Zjq2kULkf?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ccd1d68-c330-408b-4f0a-08da77efb427
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2022 21:07:43.1116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aR2xzARmHAONhG2z5p5MiAXALgIQtzXJLXxK7PhpSXA/xGUM7uIUAaQexQWNYiLXQ+zORslizOB5ntvw8eZ/Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1686
Received-SPF: pass client-ip=40.107.8.111; envelope-from=den@virtuozzo.com;
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

On 06.08.2022 22:45, Vladimir Sementsov-Ogievskiy wrote:
> On 8/5/22 18:47, alexander.ivanov@virtuozzo.com wrote:
>> From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>>
>> There could be corruptions in the image file:
>> two guest memory areas refer to the same host cluster.
>
> Is that written in parallels spec (docs/interop/parallels.txt)?
>
> Hmm yes: "- the value must be unique among all BAT entries".
>
>>
>> If a duplicate offset is found fix it by copying the content
>> of the referred cluster to a new allocated cluster and
>> replace one of the two referring entries by the new cluster offset.
>>
>> Signed-off-by: Natalia Kuzmina <natalia.kuzmina@openvz.org>
>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>> ---
>>   block/parallels.c | 135 ++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 135 insertions(+)
>>
>> diff --git a/block/parallels.c b/block/parallels.c
>> index a0eb7ec3c3..73264b4bd1 100644
>> --- a/block/parallels.c
>> +++ b/block/parallels.c
>> @@ -64,6 +64,11 @@ static QEnumLookup prealloc_mode_lookup = {
>>   #define PARALLELS_OPT_PREALLOC_MODE     "prealloc-mode"
>>   #define PARALLELS_OPT_PREALLOC_SIZE     "prealloc-size"
>>   +#define REVERSED_BAT_UNTOUCHED  0xFFFFFFFF
>> +
>> +#define HOST_CLUSTER_INDEX(s, off) \
>> +    ((off - ((s->header->data_off) << BDRV_SECTOR_BITS)) / 
>> (s->cluster_size))
>
> Let it be a static function, not a macro.
>
>> +
>>   static QemuOptsList parallels_runtime_opts = {
>>       .name = "parallels",
>>       .head = QTAILQ_HEAD_INITIALIZER(parallels_runtime_opts.head),
>> @@ -559,6 +564,131 @@ static int check_leak(BlockDriverState *bs,
>>       return 0;
>>   }
>>   +static int check_duplicate(BlockDriverState *bs,
>> +                           BdrvCheckResult *res,
>> +                           BdrvCheckMode fix)
>> +{
>> +    BDRVParallelsState *s = bs->opaque;
>> +    QEMUIOVector qiov;
>> +    int64_t off, high_off, size, sector_num;
>> +    uint32_t i, idx_host;
>> +    int ret = 0, n;
>> +    g_autofree uint32_t *reversed_bat = NULL;
>> +    g_autofree int64_t *cluster_buf = NULL;
>> +    bool sync_and_truncate = false;
>> +
>> +    /*
>> +     * Make a reversed BAT.
>> +     * Each cluster in the host file could represent only one cluster
>> +     * from the guest point of view. Reversed BAT provides mapping 
>> of that type.
>> +     * Initially the table is filled with REVERSED_BAT_UNTOUCHED 
>> values.
>> +     */
>> +    reversed_bat = g_malloc(s->bat_size * sizeof(uint32_t));
>
> Hmm. Why size of reversed_bat equal to bat_size? Couldn't host file 
> size be larger than that?
>
> Seems that we want calculate the highest offset first, and then 
> allocate corresponding table.
>
> Also, here we probably allocate too much memory. Better use 
> g_try_malloc and clean error-out instead of crash.
>

This is incorrect. reversed_bat has __different__ size than BAT.
Technically we should take into account real file length and
use it as a size. Even if all blocks are allocated, the size of
the file is __greater__ than size of the payload by BAT + header
sizes.

But this is even trickier. The length could grow once we
copy duplicated clusters.

Also we are fucked up a bit with this way a little bit. We can have
first cluster just after the BAT (not aligned to cluster) or
with a padding, i.e. aligned to cluster size. This means that
data_off could be zero and non-zero.

I have missed this 3 times already :(

>> +    for (i = 0; i < s->bat_size; i++) {
>> +        reversed_bat[i] = REVERSED_BAT_UNTOUCHED;
>> +    }
>> +
>> +    cluster_buf = g_malloc(s->cluster_size);
>> +    qemu_iovec_init(&qiov, 0);
>> +    qemu_iovec_add(&qiov, cluster_buf, s->cluster_size);
>> +
>> +    high_off = 0;
>> +    for (i = 0; i < s->bat_size; i++) {
>> +        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
>> +        if (off == 0) {
>> +            continue;
>> +        }
>> +
>> +        if (off > high_off) {
>> +            high_off = off;
>> +        }
>> +
>> +        idx_host = HOST_CLUSTER_INDEX(s, off);
>> +        if (idx_host >= s->bat_size) {
>> +            res->check_errors++;
>
> As I understand, check_errors is mostly for IO errors during the check.
>
> If it's incorrect for parallels format to have such cluster, we want 
> res->corruptions++ here instead.
>
> But is it really incorrect, what the spec say?
>
Common sense says that if BAT points outside of the real
host file that cluster is really not existing and should be
read as zeroes. This is what and how we are fixing here.


>> +            goto out;
>> +        }
>> +
>> +        if (reversed_bat[idx_host] != REVERSED_BAT_UNTOUCHED) {
>> +            /*
>> +             * We have alreade written a guest cluster index for this
>
> already
>
>> +             * host cluster. It means there is a duplicated offset 
>> in BAT.
>> +             */
>> +            fprintf(stderr,
>> +                    "%s BAT offset in entry %u duplicates offset in 
>> entry %u\n",
>> +                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR",
>> +                    i, reversed_bat[idx_host]);
>> +            res->corruptions++;
>> +
>> +            if (fix & BDRV_FIX_ERRORS) {
>> +                /*
>> +                 * Write zero to the current BAT entry, allocate a 
>> new cluster
>> +                 * for the relevant guest offset and copy the host 
>> cluster
>> +                 * to the new allocated cluster.
>> +                 * In this way mwe will have two identical clusters 
>> and two
>> +                 * BAT entries with the offsets of these clusters.
>> +                 */
>> +                s->bat_bitmap[i] = 0;
>
> I don't understand that. So you just remove that guest cluster. 
> Shouldn't we instead set it to new allocated off?
>
we will write it again below and new offset will be allocated
properly within alloc_cluster()

>> +
>> +                sector_num = bat2sect(s, reversed_bat[idx_host]);
>> +                ret = bdrv_pread(bs->file, sector_num << 
>> BDRV_SECTOR_BITS,
>> +                                 s->cluster_size, cluster_buf, 0);
>> +                if (ret < 0) {
>> +                    res->check_errors++;
>> +                    goto out;
>> +                }
>> +
>> +                sector_num = (i * s->cluster_size) >> BDRV_SECTOR_BITS;
>> +                off = allocate_clusters(bs, sector_num, s->tracks, &n);
>
> you probably want to update high_off here
>
statistics should be calculated after all fixes. That should be more 
correct.


>> +                if (off < 0) {
>> +                    res->check_errors++;
>> +                    ret = off;
>> +                    goto out;
>> +                }
>> +                off <<= BDRV_SECTOR_BITS;
>> +
>> +                ret = bdrv_co_pwritev(bs->file, off, 
>> s->cluster_size, &qiov, 0);
>> +                if (ret < 0) {
>> +                    res->check_errors++;
>> +                    goto out;
>> +                }
>> +
>> +                /* off is new and we should repair idx_host 
>> accordingly. */
>> +                idx_host = HOST_CLUSTER_INDEX(s, off);
>> +                res->corruptions_fixed++;
>> +                sync_and_truncate = true;
>> +            }
>> +        }
>> +        reversed_bat[idx_host] = i;
>> +    }
>> +
>> +    if (sync_and_truncate) {
>> +        ret = sync_header(bs, res);
>> +        if (ret < 0) {
>> +            goto out;
>> +        }
>> +
>> +        size = bdrv_getlength(bs->file->bs);
>> +        if (size < 0) {
>> +            res->check_errors++;
>> +            ret = size;
>> +            goto out;
>> +        }
>> +
>> +        res->image_end_offset = high_off + s->cluster_size;
>> +        if (size > res->image_end_offset) {
>> +            ret = truncate_file(bs, res->image_end_offset);
>
> that's already done in check_leak, why we need it again?
>
>> +            if (ret < 0) {
>> +                goto out;
>> +            }
>> +        }
>> +    }
>> +
>> +out:
>> +    qemu_iovec_destroy(&qiov);
>> +    return ret;
>> +}
>> +
>>   static void collect_statistics(BlockDriverState *bs, 
>> BdrvCheckResult *res)
>>   {
>>       BDRVParallelsState *s = bs->opaque;
>> @@ -598,6 +728,11 @@ static int coroutine_fn 
>> parallels_co_check(BlockDriverState *bs,
>>           goto out;
>>       }
>>   +    ret = check_duplicate(bs, res, fix);
>> +    if (ret != 0) {
>> +        goto out;
>> +    }
>> +
>>       collect_statistics(bs, res);
>>     out:
>
>


