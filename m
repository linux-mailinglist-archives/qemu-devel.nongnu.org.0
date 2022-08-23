Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EA859E4B6
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 15:54:20 +0200 (CEST)
Received: from localhost ([::1]:36070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQUMF-0007AN-2i
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 09:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQUJ1-0005WA-AO; Tue, 23 Aug 2022 09:50:59 -0400
Received: from mail-eopbgr60110.outbound.protection.outlook.com
 ([40.107.6.110]:21990 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQUIy-0002Mc-3I; Tue, 23 Aug 2022 09:50:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ee0lJyF/1OF4UDZePscqhs4VFwVkZiQToPklAgf0yLI7qc9ZX4W19QBUPlJVbr0TRN6VYMh67qpIzQNofugtaca9TQxJuSnbENGuXfgGSxsrWm290UiEKknV+i5c1XCzfqynDb2QHmt4T2bJq4OhjkyrS00awsoijPtlQ0tWtrA+jAEurK8dJbSRy8JmCW7jfQAvEdGdq5/JGQrZbG0ZK4OnRrPIRdzBGW9+m/SjGaRf3fuvw/qACYvtB2FzWa5kWp0lZC/lUrd40pJpUXii/MkvOAIsh2JZfYNcWC7+rXWaTUqzfy71O30HwUhXhBiAaM9cTMcwF9koauZ3xCqfvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5eSa0g8g3O2QawQhJq2NiINgVaEfWWyEoiFxqNyO4Y=;
 b=k1Ud2mrOUEZsDPBsmjlnDu7LKQr87iKXMVswuQ8xUCTs7pE7Zc8xTg9u+XRJEfZ1/imGQHDdAX9Vu0FKvoQrZUwu6JR2FhbnZY5THHYAkxYIGfoWNFkcYqoXGdVrm2Vd9tcLUUTY9rGf4f11CEkReQ3bkXVOxLzWHeMxCtc512OCz2ziSpcyqreDjJxLg/sA8Er3XFEH/Z/kR1aQL4SBdvIMmvHxniassTiWw0QePejm+llCX7DWRxLdvzvutMXbgI+6itTtH8qBTbARcS47/joF1SyW37jeyj2ow9YXhfFhKzL7U0CHjDDYqF52r9lpD6YlKAL3u1CdVOrzCgJoAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5eSa0g8g3O2QawQhJq2NiINgVaEfWWyEoiFxqNyO4Y=;
 b=RqNgyFEFV3Dj/jSbaacJziyPW0m/2zrMo5EvcuvIUF1Xa0HZNsWz7wH+GIKRyfirbqbgOgLzcdmGl8ZQAoOD78Ja5LdDwjCbrJB0aD34yfPk/UptpH4tbxGStTKSwAZrMvzU9kf66EdpF9g0ZmVhTzsot4rtStUn6k8brSIrpBkjvVs5U3AOETNYTAbtEroUENL3qQLmwFPbcjISNmNkcJ6FiVq5TgW8iGQdkQGLOLK4PBX4ewSDt3zLHTFPm3zfu1ErZ+vtJbMJfiPYZRBEX9BD+k6oZL3MxNU7G9a7EtANYN4XQl5DuOCH0T6K0vw8R2nNqnk+NKNQ3DbOXx9Uhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PA4PR08MB7433.eurprd08.prod.outlook.com (2603:10a6:102:2a4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Tue, 23 Aug
 2022 13:50:51 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%7]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 13:50:51 +0000
Message-ID: <01f17112-8e92-b833-a8ea-241b5fd1eaf8@virtuozzo.com>
Date: Tue, 23 Aug 2022 15:50:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 1/9] parallels: Out of image offset in BAT leads to
 image inflation
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Denis V. Lunev" <den@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com
References: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
 <20220822090517.2289697-2-alexander.ivanov@virtuozzo.com>
 <8a010bb8-82e3-8b74-8ce6-414d3638c7ad@yandex-team.ru>
 <c7c88a75-4e21-99ab-db91-bac5adc27f98@virtuozzo.com>
 <234ffa52-e067-b80c-dbfe-427e18013655@virtuozzo.com>
 <8411cd50-6fba-27ab-ee9c-42b69a0c1a1a@yandex-team.ru>
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
In-Reply-To: <8411cd50-6fba-27ab-ee9c-42b69a0c1a1a@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9P251CA0006.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:50f::11) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70638ebe-9ccc-4649-b2df-08da850e7db6
X-MS-TrafficTypeDiagnostic: PA4PR08MB7433:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mQ9IchScvldCps/hf2rBSlzdnBi4egyOG9tFMz7UprzZjEFgXUqWkVwaa4+Ck/y3M88ov6yhKrLDMfLx9xka8L6+N3+oBcgnewVOP+1c6f7j0JO5EElmCP+g7D4nU6duk8UFSX2lA5bZa+qeskEYzuXcGPp1/iRNakgeg5h6LBjHbhWUy6/oJPh8kDKgeeLAETWiayf5dWyGUYYevQaEvxjKoI2jsiAdlCUY78hQzVSDGa9u2vTaMbSE1mrJZpNTEFsuXu+5gfAw98HQFU+CieYD4XCoYWMcHFA4OwtL5FutitnkCJiRxiQjfXMu1QcMrDknaqb11crXzUSwvp2ijigzfeDAM3msVaQ2gw7N8ZBettO+Gcf9cX+15QHSVWvNe5dpZQncvYHdPiE40uszBCjDClEDvq3Li21qGhtVJJ+T7WkgM3oSxuouYoaWbCozuZBLezNjLaHg/2T6482LD7ZTo/yPI8X2SWAHb8bz9FERA13Jyx1NO8GvLY9Z7AN3Ae8jdyIpPpW2sZYJ/cDpDWSCS+WxeLOhV8iJTewW4El6Sf2otuIflpDdwyRVVX9+bPrR/FB7Ia74XgipL7XuSwCxdsSuyrZwVRdQA9hXvOZj/lrbFuU7N1WYGSmCQfak472kGW6pxIQ3lh5QmQ3ADPuNoETBVs6laPjFOFmsHtvEmqU07QeovDINfMHXKsA/MWZFZmRzKgKm26jASXgs+IEyj9eelfhCKPPbCYc8QbkFwhiizeWvR2y5NGQV25E1j0dIuFo1dlBaAuWAT4WPfrlZVglB54t7j8UzZu5hZQ5SWG6HawvFGZNMo/L9MV4mrNTigVfeO7fNS/8vNW+D9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(366004)(376002)(346002)(396003)(136003)(52116002)(2906002)(6512007)(83380400001)(26005)(2616005)(6506007)(186003)(53546011)(31696002)(86362001)(38100700002)(38350700002)(6486002)(66946007)(66556008)(41300700001)(44832011)(316002)(66476007)(5660300002)(478600001)(110136005)(36756003)(6666004)(31686004)(4326008)(8676002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUJ1TFdyRmt4US8ydHZaREgwNVhpVVNQTzFTK05PNlV1c244T3NUeVdWdXpa?=
 =?utf-8?B?b2JnUVBGV0ltVHZDREpVaXFEamp1RDV5bFJQMk90dk5NVEx1WUJJS2FPOGc0?=
 =?utf-8?B?cUNpdjk2Y2VBNE5JYUxmcDArYmM2dFpwS25QQS9oREpMRzgrTnFNZHBuRnBW?=
 =?utf-8?B?MUlKdkNvNGYxVTBoYVlpRDlaWGRmNmpMQUV6dUZYZWp0V1dBMXc0RTdPNGxB?=
 =?utf-8?B?ZXdKUW83RWN0ZlAyV09KWUZZaG50djBUemMwQmM1V2hKRy9YUUlnb2NYa2k0?=
 =?utf-8?B?Y2J2VEd5ZHo5U0FFYk1Ta0NVNzN1SHNwWkVhSGRGTjMxYWlwd25wY1ZHRkts?=
 =?utf-8?B?NFNocUtyQ0lMdFk2V0grR0lMaXN2b0lueVRkbjkvejZjaS9ENkFFVVdNWExy?=
 =?utf-8?B?SG5YQ0x1bUwzM3RDRS9CRjk5VkRsYXFmem5FVWVPbEFrVTZsOFFPc2oyc2Rv?=
 =?utf-8?B?cjY0cTdyM3YzamVkbVF3dGloSFJkVWIvOHgzdU9QeC9SOEZDcWx3dVlHcis3?=
 =?utf-8?B?dlJ0TFJ0VkdlNk9YQ0JjRHFyRm5LajZjYWhGeDR6c0YrWHVlelFiN0RXbTFU?=
 =?utf-8?B?RFQwR2JMclF0WG1hMHJvcXc0MDAyRHpHdi9zbGxpajJ3YkVYYytKR3F5OHJG?=
 =?utf-8?B?K2NLYW5pREpCcFlVcXNVOE1jMmdTbEtHMFBuVlZmRTlkK0dLS2ZodkI1cVda?=
 =?utf-8?B?TVZSaUNVSFVkKzZtT1hRRER3SnBoUjJIN3JwSW02cXlFclFsNjQ1U2g0V2Ro?=
 =?utf-8?B?eXNRbEtiVGVrMkJiWXdqNEp2eTdUVkI4V1RQQm95OWN1ZWJWL0lHaG1VMFh2?=
 =?utf-8?B?TTRqTTRFbVZidHp1bzV3ZDlsUGpvaW9pWDVqblVRNmVCSXM3a1N1WjNpNmlQ?=
 =?utf-8?B?KzlWLy8zWVFsaVNZTVVDRE1EV0pnZXQ0RExEOUd6dW9YT1p4SWVzbnl4bUJo?=
 =?utf-8?B?TW5PK3d4ZWJHb1R5VWNSdXd4ZzJzanFtcjcrR3BremQ0SzVGWEd1TTFDMkw4?=
 =?utf-8?B?Q1ZwdStTQVM5dmU0Y3F6ZWY4UklVMHA1RDNpN3FIUU8rM3dHM01RdGVTaG1l?=
 =?utf-8?B?dnVVODJjTXFYVXdRWWs0UXRWWUFKN1ZIMU5mcVVpeGJpSmQyaSsxbWpnZlFa?=
 =?utf-8?B?RUFJRE9OS2xDMXdDaEJkbVRxaWp5VzF3WXVWY0c3QURNZnBLeFdDT1lrQm84?=
 =?utf-8?B?NFI5WmpDWnZFZUhzaXdHeldqYmd3RDlONmRLMjBXVkkwSTFyKzFtQWFVV2xU?=
 =?utf-8?B?NnVPWDlNU2F1ZGRKalFpd1ViTDJLaVVobEJSd2xQOGxzQ1lqME9Gcmhka3Jk?=
 =?utf-8?B?S0JrYktFMUp6TXF0VEdBQlRWRFpTanIxQmRIYWF6bnF5YVo0K2V6WXo3WWh2?=
 =?utf-8?B?T1FsM05RamxBWWt2SVpWTFpzUmJBRzVYaGI5bU1uSlJwZTBobE9hOEFDMCs3?=
 =?utf-8?B?Q0pOQVByckY2Y1YybUcvczRFQktNRGhMRWZsMU96VTNCMXFpUlhVRjczUDVs?=
 =?utf-8?B?eUF4KzZxR2NpbG1nR0hWR3V4SzdGcVpyYm84elVqU082SUpkWjd2Z2o4N0pV?=
 =?utf-8?B?SzN2TnlUTnZCYlQrYWRSR3VUVDhxSXhLTk1PYVlXVkMzVFBzVHVRSjBJNzNQ?=
 =?utf-8?B?dE5RTFlKcmhPQjRBOVc2MWlmQ0dORURrSFBBTGdrM2k1YXh1RkVUY3dkT0Vu?=
 =?utf-8?B?dm5DOEVBNDFnR2JqZFkveFhJZVMyenFIK0RBRTFSNllPUXAycHpYQ0QvdUlL?=
 =?utf-8?B?cnBNZFB2SVRlUURyeVJoZStVOEJmT2dJWVhNc2daVW9UMjcrQy92aEt6NGZB?=
 =?utf-8?B?b1lLYnFFcFZjeWtXMGR6U283SWZrUWkydyt2T2JmWVRMU0xtWDdtcXdFdmFZ?=
 =?utf-8?B?R05wQlBuejV5enRRaWgxRFZoUm9SS3FkdW94VXdUTGdNSkNIZlVGUzljS2xk?=
 =?utf-8?B?b3VGYUdid2tmKzBCY3ljb3ZTQmxHeDJKVHNoVFhBQWRDMWwzais1dWRlZ2dY?=
 =?utf-8?B?MUJRNTRIelIzQkRnR1dFRURHSmltNnB4WXcwczhVM0hENjU0Y3VLT093Vnhw?=
 =?utf-8?B?K2hCSVJxYWVhcjU5ait3RDY3WWowRjRzQW90L2toRlJDekJGbTFmSFgwQmxl?=
 =?utf-8?B?K1BhR1gzbklxRWZyZEhGWmlUNXVDL28zeHYzZ2dBOWFTOXdXNzllcXUveTla?=
 =?utf-8?Q?+mdVJaNe3hsTB5dMIxPCrsk=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70638ebe-9ccc-4649-b2df-08da850e7db6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 13:50:51.3382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c7gpkVJEqazHw2gemmjdfVxpJnzJ8kPRpO/LiU0pzwIqLf9davNndQMWNKTcNYy5P1r2AeF9vfZ3TNHHvGtiP41E57d/kLU3xFd01EIipIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7433
Received-SPF: pass client-ip=40.107.6.110;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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


On 23.08.2022 11:58, Vladimir Sementsov-Ogievskiy wrote:
> On 8/23/22 12:20, Denis V. Lunev wrote:
>> On 23.08.2022 09:23, Alexander Ivanov wrote:
>>>
>>> On 23.08.2022 08:58, Vladimir Sementsov-Ogievskiy wrote:
>>>> On 8/22/22 12:05, Alexander Ivanov wrote:
>>>>> data_end field in BDRVParallelsState is set to the biggest offset 
>>>>> present
>>>>> in BAT. If this offset is outside of the image, any further write 
>>>>> will create
>>>>> the cluster at this offset and/or the image will be truncated to this
>>>>> offset on close. This is definitely not correct.
>>>>> Raise an error in parallels_open() if data_end points outside the 
>>>>> image and
>>>>> it is not a check (let the check to repaire the image).
>>>>>
>>>>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>>>>> ---
>>>>>   block/parallels.c | 14 ++++++++++++++
>>>>>   1 file changed, 14 insertions(+)
>>>>>
>>>>> diff --git a/block/parallels.c b/block/parallels.c
>>>>> index a229c06f25..c245ca35cd 100644
>>>>> --- a/block/parallels.c
>>>>> +++ b/block/parallels.c
>>>>> @@ -732,6 +732,7 @@ static int parallels_open(BlockDriverState 
>>>>> *bs, QDict *options, int flags,
>>>>>       BDRVParallelsState *s = bs->opaque;
>>>>>       ParallelsHeader ph;
>>>>>       int ret, size, i;
>>>>> +    int64_t file_size;
>>>>>       QemuOpts *opts = NULL;
>>>>>       Error *local_err = NULL;
>>>>>       char *buf;
>>>>> @@ -811,6 +812,19 @@ static int parallels_open(BlockDriverState 
>>>>> *bs, QDict *options, int flags,
>>>>>           }
>>>>>       }
>>>>>   +    file_size = bdrv_getlength(bs->file->bs);
>>>>> +    if (file_size < 0) {
>>>>> +        ret = file_size;
>>>>> +        goto fail;
>>>>> +    }
>>>>> +
>>>>> +    file_size >>= BDRV_SECTOR_BITS;
>>>>> +    if (s->data_end > file_size && !(flags & BDRV_O_CHECK)) {
>>>>> +        error_setg(errp, "parallels: Offset in BAT is out of 
>>>>> image");
>>>>> +        ret = -EINVAL;
>>>>> +        goto fail;
>>>>> +    }
>>>>
>>>> If image is unaligned to sector size, and image size is less than 
>>>> s->data_end, but the difference itself is less than sector, the 
>>>> error message would be misleading.
>>>>
>>>> Should we consider "file_size = DIV_ROUND_UP(file_size, 
>>>> BDRV_SECTOR_SIZE)" instead of "file_size >>= BDRV_SECTOR_BITS"?
>>>>
>>>> It's hardly possible to get such image on valid scenarios with Qemu 
>>>> (keeping in mind bdrv_truncate() call in parallels_close()). But it 
>>>> still may be possible to have such images produced by another 
>>>> software or by some failure path.
>>>>
>>> I think you are right, it would be better to align image size up to 
>>> sector size.
>>
>> I would say that we need to align not on sector size but on cluster 
>> size.
>> That would worth additional check.
>
> And not simply align, as data_offset is not necessarily aligned to 
> cluster size.
>
> Finally, what should we check?
>
> I suggest
>
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 6d4ed77f16..b882ea1200 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -725,6 +725,7 @@ static int parallels_open(BlockDriverState *bs, 
> QDict *options, int flags,
>      BDRVParallelsState *s = bs->opaque;
>      ParallelsHeader ph;
>      int ret, size, i;
> +    int64_t file_size;
>      QemuOpts *opts = NULL;
>      Error *local_err = NULL;
>      char *buf;
> @@ -735,6 +736,11 @@ static int parallels_open(BlockDriverState *bs, 
> QDict *options, int flags,
>          return -EINVAL;
>      }
>
> +    file_size = bdrv_getlength(bs->file->bs);
> +    if (file_size < 0) {
> +        return file_size;
> +    }
> +
>      ret = bdrv_pread(bs->file, 0, &ph, sizeof(ph));
>      if (ret < 0) {
>          goto fail;
> @@ -798,6 +804,13 @@ static int parallels_open(BlockDriverState *bs, 
> QDict *options, int flags,
>
>      for (i = 0; i < s->bat_size; i++) {
>          int64_t off = bat2sect(s, i);
> +        if (off >= file_size) {

Do we really want to compare file size with cluster offset, not with 
cluster end?

Also I would leave the comparison outside the loop, because I'm going to 
move highest offset calculation to a helper (there are two places with 
the same code).

> + error_setg(errp, "parallels: Offset %" PRIi64 " in BAT[%d] entry "
> +                       "is larger than file size (%" PRIi64 ")",
> +                       off, i, file_size);
> +            ret = -EINVAL;
> +            goto fail;
> +        }
>          if (off >= s->data_end) {
>              s->data_end = off + s->tracks;
>          }
>
>
>
> - better error message, and we check exactly what's written in the 
> spec (docs/interop/parallels.c):
>
>
>   Cluster offsets specified by BAT entries must meet the following 
> requirements:
>       [...]
>       - the value must be lower than the desired file size,
>
>
>

