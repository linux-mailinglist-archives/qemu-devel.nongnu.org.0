Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1D12E0E19
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 19:09:09 +0100 (CET)
Received: from localhost ([::1]:41696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krm5r-0005ej-R7
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 13:09:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1krm4E-0004u6-2f; Tue, 22 Dec 2020 13:07:26 -0500
Received: from mail-eopbgr80114.outbound.protection.outlook.com
 ([40.107.8.114]:23630 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1krm4B-00062g-EM; Tue, 22 Dec 2020 13:07:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HudkDw4Th7jCTw3qitX/tJ0jsgyMv/MsAvNDEeJIGo7Yvw1h3boUrbSeBVOrWMYLbXmYo5JTeuhBVd1nppbiM8LHHWLjcQueqCHMydZjn8PDsD2g8S4ivnXOB0jEc3lAd3S3tylG6em8eTQkcna2eUNm+HyRs3ANC7bxIycZQpJA6r2IYB9HTFmSkowez7b/QFyYd/PRCasNEvi6xRY4DjtgpbcuLl0AAq6QLuO7kj2g7r2DTKceWCLwfosWxMYJC1RyXRwBCMqwm66HYRe0NPGabIqrd+oFYzZk6F60r4NBe++fpAHmJioUaHP/DZoLEGYUuEHP2zqvLZ6iIMhRiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5JTJLRXAgXAgQ4VrBETw8yxOWfjJJA0hzclnYXbdk2U=;
 b=gUfqYcxWjj8PKpydFuQ3pLVWiCsxeaFuNiY80XtfqN8jupk8RLrquErRfizDJ0qYlPh7MTMmSli6CdpR195qLl1b/4jNUfaBhtbp1ufbJG2SrqLPFD+xwEsAV0RM18/xFY0lJrWydYn7p/HNxHT88PbdVD+xzm5JDhaAaF6UtKQzN3UtQWY8+qEbO11/ch9++1ZH/XBcC620Xr9xYhRWZ+XUffzcM4kHV8b8Ryv2SSFkEv+75rpdZ5AKSkco0gRTwF+1mMRTe7N+Ih/aOth7j6sF5fGcqDa5V63FUepD5KRmZ82oZZRhdA2PQ3rtQLUMcx2RQqz2KMJgKCb2Hi+TrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5JTJLRXAgXAgQ4VrBETw8yxOWfjJJA0hzclnYXbdk2U=;
 b=SlwsOw8XEMWpxzCLfNZLbUJ9rCeHL8BOdhawKd8Ze7LkjNE4RfDZ0vBahzCy4RVcjr7dQdOL+v+DsV2jJ8fy3dPjAtszt/9eJDCAVgRh81XW9j0QbhV6i201PmHrO/2VJMsis53ptALxy1Rf0K993dmdb5bk4W2uCn4CpOTO91c=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3957.eurprd08.prod.outlook.com (2603:10a6:20b:a2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.29; Tue, 22 Dec
 2020 18:07:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 18:07:19 +0000
Subject: Re: [PATCH v15 13/13] block: apply COR-filter to block-stream jobs
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20201216061703.70908-1-vsementsov@virtuozzo.com>
 <20201216061703.70908-14-vsementsov@virtuozzo.com>
 <fa2c8c5e-78b5-6d4a-6e23-aaec2249debb@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e1d9bfea-ff70-1a02-0422-d59ebf1dc011@virtuozzo.com>
Date: Tue, 22 Dec 2020 21:07:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <fa2c8c5e-78b5-6d4a-6e23-aaec2249debb@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM0PR03CA0052.eurprd03.prod.outlook.com (2603:10a6:208::29)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.92) by
 AM0PR03CA0052.eurprd03.prod.outlook.com (2603:10a6:208::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.29 via Frontend Transport; Tue, 22 Dec 2020 18:07:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1095c922-31e0-43f8-1c26-08d8a6a46c11
X-MS-TrafficTypeDiagnostic: AM6PR08MB3957:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3957C17BB14DBA40E702650CC1DF0@AM6PR08MB3957.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Eiih6qm4B7GYPSyKhmKaE6TpuwzuyThR5GgjQJKasO4LTKI6Ytr8Gj5ZrLI7P+aybLBFgJvheQq5mDTmYJJOw0Eh9fcmRgYZsbZZX7MnQwv9aZCd5VF4HZL6OwYDCTK1xZFnd9afTAFjbndVTl10ljAcCNmIaM5pUzy42sCjMZQ4IU7aXO1bpcvAVR7eZYVMoVvGbBr8yLiSaa8EejPeZvcw64GHRg/wC10gqihCfWIstv1q9nadFvPQknRCzSuMeJdBrhvDMgqCLchh6os8nfJB39F80rbJn+VMaS3Tzg5i5aGUqDmDsoKdRTFlxBXonHRz0OqvhbcTqpsLcVsjvKUXccEMgMTPMpFiLJco0T2wkRI5tUgzAhi1QUk6uzKNEeCKlzH3IiG6JvN6y3Xp07HTmdxfScFOff8YY0tOk2B0X/AoeYKR1M64lOnEEi+VfLzV3o88ss27aj60v5osXArUg/Q9slyMjIzg0TPliy8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(2906002)(8676002)(36756003)(186003)(52116002)(66476007)(53546011)(26005)(86362001)(16576012)(6486002)(66946007)(16526019)(4326008)(66556008)(83380400001)(107886003)(2616005)(498600001)(31696002)(5660300002)(956004)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VGRUd0VYSGRnZHpLa3BhUlloZ0l1ZGRyOFJsWmdPQUJMNVJSZTlUdHE2N0t6?=
 =?utf-8?B?RVJQRy9XcEUvK3hNZ3dvQ0x3MTBKZjN5aVRoR0hTSnVXWFNhOEFRWkVDb2lU?=
 =?utf-8?B?cmJCelRWTDY3OENMZ2V5d2tnUFVVeldVSXVsbENleUUrd2ZyYmxXVEFNM0Mx?=
 =?utf-8?B?dGNEMVp2NlNzcVhJd3NRZFhsVW8vY2ZQZmRYcUhzQzdTb0J2Y3d1WDFRbUVv?=
 =?utf-8?B?TXlQREZvNEpVZFdSdVFxaEFpTWNURTVhVDFHekVEUmdpMDFTU2xweThCWWhw?=
 =?utf-8?B?SjZObHoxVjM2a1pqbDVHd0RGSFFPUisyc0c4SkpKM3hnMkdrdENjSS9MSVZt?=
 =?utf-8?B?YVVCREUvVzAxSE8rK0pQN2lUUDNKMmE2cyt3OWFGUEtrcktBSk1GQTF2TzJQ?=
 =?utf-8?B?dGQ1L3hjd2Y1clMya2d2RkhNSDNWQWJPUDdrWk9HTm5pTXVGUHROSHRyMVp3?=
 =?utf-8?B?dXdlYkhMM3VSZ2R5bmtpSnBHLzZHZVVLR2FSQXd1NDZHUDdIRGlPMytnQ1I3?=
 =?utf-8?B?dnhXZyt4WHMvMjdBUW93QmdmNkhkSEZSNFcwWjlqa09aeHpxVkk0V0pvQnZV?=
 =?utf-8?B?M3d0UUkxdW1rSW5wT1I2ZDhPS2ZVWmtCczM4L2hncGxHTWVoS0R0ZTlNb0to?=
 =?utf-8?B?Q2RMcGZoUFFVbURGYU4rc2lOU0RYcm1hR1dqaEJIVlhGc3gyYm1xNnJSTzlF?=
 =?utf-8?B?QkJDdnlmQmxFVk5JWUZuNDlRd3psWjg1WDgrUWZJZTlhaDRUeUVLS21hZkVi?=
 =?utf-8?B?R0k4MFJtMmtMTjBhTFgvQ2pNalZwRzhIbzdJZFRIWnFxWlVPdDN3K1JTNm4r?=
 =?utf-8?B?YnV2YStYVG56SmdlUlA4ZjhHZ2FoSVB1all5L0FuODlhNnZSNThER2FTdHdZ?=
 =?utf-8?B?eElMNktIVzNVOU1PRkxoZTErR2xTVFh3VE1tU2NMbE85KzRnZEhoVjJFa0xx?=
 =?utf-8?B?eE9sbElpNHJ6T2pTUzBVWmNqQW5DTW5WVU5WSjVBNkdZbklnZy9XNkNyS2FI?=
 =?utf-8?B?MEJOSDdXTU4vYTBVUjAzbUhKNGRlU3h0ZHJMeno5c013ZCtpRFhwaC9ZOTAz?=
 =?utf-8?B?ODBYb2ZGQlVyUVpJWldXUHp0b216UmNiMU1YQVRnelk3VmN5bmYxaExTUHo5?=
 =?utf-8?B?MUZZQ1YvbW43MGZKRThCMmNqVkU5SDBZR1B4RndmSVVYTXFsZFBRaTZtUUFv?=
 =?utf-8?B?OVgvdkUrbDdCZ2pmOE01UFBSVUdzOERqZCt0YmZ1a2VsSFhGWk5TcGZlV05E?=
 =?utf-8?B?WERBWGlwYVBBL05PYnpSOEUxbkZPUFlVdlFGYUhqSGExS2Q1R1YxTnRKM2Fx?=
 =?utf-8?Q?3VxvqCdCFYEtDdI0vJ3FnHxXYI4e2LjKaL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 18:07:18.9299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 1095c922-31e0-43f8-1c26-08d8a6a46c11
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LlqFq44AyRMBKu2P38c0lNizozDcN/ENM8Q/NTdyYgM0jZk35Wof65R5Dw5zrVM/JOxEgWUdma7ZZgg7i/zI2X+0EnTVVT/KY+p0zrPslBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3957
Received-SPF: pass client-ip=40.107.8.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.521, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, den@openvz.org, andrey.shinkevich@virtuozzo.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

22.12.2020 19:20, Max Reitz wrote:
> On 16.12.20 07:17, Vladimir Sementsov-Ogievskiy wrote:
>> From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>>
>> This patch completes the series with the COR-filter applied to
>> block-stream operations.
>>
>> Adding the filter makes it possible in future implement discarding
>> copied regions in backing files during the block-stream job, to reduce
>> the disk overuse (we need control on permissions).
>>
>> Also, the filter now is smart enough to do copy-on-read with specified
>> base, so we have benefit on guest reads even when doing block-stream of
>> the part of the backing chain.
>>
>> Several iotests are slightly modified due to filter insertion.
>>
>> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/stream.c             | 105 ++++++++++++++++++++++---------------
>>   tests/qemu-iotests/030     |   8 +--
>>   tests/qemu-iotests/141.out |   2 +-
>>   tests/qemu-iotests/245     |  20 ++++---
>>   4 files changed, 80 insertions(+), 55 deletions(-)
>>
>> diff --git a/block/stream.c b/block/stream.c
>> index 626dfa2b22..1fa742b0db 100644
>> --- a/block/stream.c
>> +++ b/block/stream.c
> 
> [...]
> 
>> @@ -266,30 +251,62 @@ void stream_start(const char *job_id, BlockDriverState *bs,
> 
> [...]
> 
>>       /* Make sure that the image is opened in read-write mode */
>>       bs_read_only = bdrv_is_read_only(bs);
>>       if (bs_read_only) {
>> -        if (bdrv_reopen_set_read_only(bs, false, errp) != 0) {
>> -            bs_read_only = false;
>> -            goto fail;
>> +        int ret;
>> +        /* Hold the chain during reopen */
>> +        if (bdrv_freeze_backing_chain(bs, above_base, errp) < 0) {
>> +            return;
>> +        }
>> +
>> +        ret = bdrv_reopen_set_read_only(bs, false, errp);
>> +
>> +        /* failure, or cor-filter will hold the chain */
>> +        bdrv_unfreeze_backing_chain(bs, above_base);
>> +
>> +        if (ret < 0) {
> 
> Shouldn’t we keep the “bs_read_only = false;” here?
> 

No, as we don't goto fail. (pre-patch, we goto fail here, and don't want fail: code path to reopend back to RW (as reopening to RO is failed anyway (and we hope it's transactional enough)))

> (All the rest of this patch looks good.)
> 
> Max
> 
>> +            return;
>>           }
>>       }
> 


-- 
Best regards,
Vladimir

