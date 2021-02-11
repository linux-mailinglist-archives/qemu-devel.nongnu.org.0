Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3162E318760
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 10:52:29 +0100 (CET)
Received: from localhost ([::1]:36906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA8eA-0006d2-Qo
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 04:52:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lA8cb-00068v-SQ; Thu, 11 Feb 2021 04:50:50 -0500
Received: from mail-db8eur05on2134.outbound.protection.outlook.com
 ([40.107.20.134]:47646 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lA8cX-0004YB-Na; Thu, 11 Feb 2021 04:50:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lcLG+S6+I5J9o5sze3gfQGjuvooja1vEyMbwPXoYtuS+kxL17aKTlLNmPin3vMsRRt7yoUsFetAlk29PvPBl4nmM8aOIyP2YmVtO01vrsfozF5a/vEVbra1Ija83V4k+m2do9cQSjbfyjBn+3kfuY0/cj8Ptwu+dclJSaKPLNVmYJbcOeGLe3tb34lF+f881GP38wCPMDcORWOhs1lg9hi/Z31vTwuOtcSqIGszXvgzTLxVqPeTrIVSxy59VyNscVaGT0cG0ic43sNOU8tDL3gvToBr8WBD0PSs9cj3Layj4hxE1h4kB/50Z3SMUpDL59qiM1x7+cmZYiLvZ/RD3JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1I2OKpQbai1JYPzcu5pZY9fMV/pY/Is+H664jiP7lI=;
 b=QhKaPCEt1wsc2Cx0fAgun/mXWH05qqCYUhdGLntAlhzjWmys7XWhQfhMyK3Oktrn8I6z6EAkj+YGJJpJi2L0YzvJAlPrZAn6S1whek0McSz9CYF00SFu8vZR1002hCZ4ZFG3Rjjkn+DPdfcrdZHFWTxzJLvjhXX9Fx3xO3h+YSU6CAxGBqsKMF171UEBfMwbgD3zMLkgOClQ/9zd8AQ5p4LsNLGycgGyRG+72XpvBLuLkt9NptcIq7VfvAV1/HBlEdxD/d5qKMni8SKT6JTg/q9lGDsoSPH+10zUXmAarrJUtGvda/dYhSABfmQlawOtuNg8nVaGx1jfxaKB3SaIIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1I2OKpQbai1JYPzcu5pZY9fMV/pY/Is+H664jiP7lI=;
 b=g0EIZqR1soRlPa6Pr0ukOT1aADjEAE833X9tC1LaB0yVKtRnAAo5FXd+/QoFRG0ReSJg3JOwwiBSEcXU26ChhmYaUVNKRauTvXHvPISDDmCgceCL01MtqTtNjE375xIaJPuEaqc1oM6LsGZOtVHX6vncLE+FCYuTDEgvSp+u774=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1780.eurprd08.prod.outlook.com (2603:10a6:203:39::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.29; Thu, 11 Feb
 2021 09:50:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3846.025; Thu, 11 Feb 2021
 09:50:41 +0000
Subject: Re: [PATCH v2 36/36] block: refactor bdrv_node_check_perm()
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, mreitz@redhat.com, den@openvz.org
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-37-vsementsov@virtuozzo.com>
 <20210210150708.GG5144@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <73375283-eaea-2b9a-659e-22dd66569519@virtuozzo.com>
Date: Thu, 11 Feb 2021 12:50:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210210150708.GG5144@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.212]
X-ClientProxiedBy: AM0PR10CA0036.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.212) by
 AM0PR10CA0036.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27 via Frontend
 Transport; Thu, 11 Feb 2021 09:50:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 514a1674-9a17-4016-faf7-08d8ce727e4f
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1780:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB17801648F7CB599ED64A51ACC18C9@AM5PR0801MB1780.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nUce1iSOlqOxlCdoEt4/XAqLVIOFKo85SSpYofq2PWL/YblS9NuqV7eqDt+bXlI5FX1nHgNnOCDcST2KTQxgHnHgNCS8z7PiYKNcDCHMiR1Ft85sdGWyXx7IiinQv2ZG8r9grJ87J1KYsl0VfX7nq+Jwk04XcWKf7wB1B1owDAWcFpmqufMv3aPR8EY9TEvcDkoMbqf7ZPwRhqx+IArKnb8/xTdou7IrYNDxq/EbeWPdCLtwpOg5zhuMxKIGZzQojT310+8/KJnI0C1Ow9Df3h0ir36AmbyBgLH8FgWJcJh5Ph0eYTC6QO+N4EoCQZLfWvH7IEbeYt1G1ZL6m/Oy/fz0reL3JQDc0tm1/o9scog5yu4DpLr4QOaBy8+TZ2L/SPNBoLfz+3lWCxuBtjKiedV0srGD7RI4OsFhSmgFBIapXygv2YmnfmhEtdnh9JbhwrC3WdewWrmPyGibhw++PaLQ/JonItWobP7M6bwekIRQ7ODD6NGY1V1wG+wGYninuvKrmXFevBRsNI9w5ZvHiHBRf6D5wSda79iYkm7rr4PBTbBf9gNYusMK5sv3fCAXg6xLxE+L19NtwI6ulG1IQZLPY8kMvvBqJGfh5osyZ3U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(396003)(39840400004)(376002)(478600001)(316002)(31686004)(66946007)(66556008)(66476007)(5660300002)(52116002)(31696002)(2906002)(16576012)(6916009)(36756003)(16526019)(4326008)(186003)(2616005)(8676002)(107886003)(26005)(6666004)(83380400001)(8936002)(86362001)(956004)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UWNybFE3L1ZJNUtWeUdsSzVHTUJyejgwd2huU0FUa3k4Nk51U1M3OEZjYS9F?=
 =?utf-8?B?THROMXhuRm5NUVdzdFVuOHBjVjBlZW5uRG5ObW1OSEsvUG9Tdm9ZQ0RITVlq?=
 =?utf-8?B?THBFblA0U2I2RDRoYk8wYUVTeFNETURTN1d1WGYvWDRseGlSZmpPK2d0T3dE?=
 =?utf-8?B?UWFrYzRia2RFbHFsMmV2Nm9xd1hlNCs3eExEZmR6eE9tMVAyaldBdmRNNEJS?=
 =?utf-8?B?VVUvcUJWSWJ6QTZJUTMwSDZ0RFIyRW1nMEFmeU96UVc5RVRSRGJEaFRWV21p?=
 =?utf-8?B?eVhIbmJESUo0c0tqODZDTVo4cjlTeEE2bkdwVmNQaCsvakRCNVBlOGc4UUh3?=
 =?utf-8?B?N0dVVXBhcnpTbUtoWDVoWVIyYVZ0eVRINmQrZHJvRkUwN09rYXliOUFjRmxz?=
 =?utf-8?B?QXA1SlpJNVdVYXAxbTdseS83ZmlNUjNEdGVpSG9ma2w3QkRNa2NBRU9PWDBq?=
 =?utf-8?B?TlljNWI0empLbERHeFpMVlRXYWx6ZjdBS1AvOTEyVUY3dExScUFKWEttSE9B?=
 =?utf-8?B?bS9pdWcxZ3NXQ1NYazZaSjMyVmZBRjlYcGc5N0Q2YTlTbHVKaWNnK3JweU81?=
 =?utf-8?B?eEpRMXhhaEdjeWcvUEtuejZiVlUrS1MvT09HY2ttby9QeWVaRWFIUjg3R0ts?=
 =?utf-8?B?M3h3T0FLSTF4WUVHVTFLczEwR0VkS2YydktLakFUbE5kWVlLanhqdlNIODdr?=
 =?utf-8?B?YWI5enB2OEk0NnVkcWtqdEVPRU5kWXFna2N6SEhZL05HSmpKRWRsZmt4ZXd4?=
 =?utf-8?B?MTlEUDVVT0ZUWmpQWGg4QkdJc3ZqbWprSGZrNDJqZDR5VysvWnRGOEFKeFR0?=
 =?utf-8?B?a0NBODIrOFVBakdmdENCQXNlL3NOWm5BWm1jRnl0MVZ3MERrNmV4dy9nMjdG?=
 =?utf-8?B?YTA5SnJTaFJuTTlXeDJFMTdra0s3RmZ5c3pybGRjWG5vQ1VuekRhMXVpWUJ5?=
 =?utf-8?B?OTdTa1A1VG81V3htU2pTaHlNN2FWRUhBMXFFeEVHbTg2THFVeGVIZ2t1aFVU?=
 =?utf-8?B?NW9wbGhxRW5zVkZDY3h3R2R3ZEFKbEM0cXVPcWRBNXNRbkx2ZEMySVlCYnho?=
 =?utf-8?B?UjJjRHR0bHRBS3NrazhjUVJJaGk0U0JHOUlqL2lPb2kzenM5eXlRWVlCdFUz?=
 =?utf-8?B?eWtYV05mOTZyeUM3dWFUcngrQlFVSE1JYWRCVG5raU1NS2xNS2FLN3NNOUJn?=
 =?utf-8?B?YkZydFdpM2FCS1dpYkFWRisyTDFYNjJtbTlNS3duM1Zlb1J0dEttZWZOL1pU?=
 =?utf-8?B?TVFnZjRGVm15STdQZ2lCdU51VGI5SENLZVNlRVp2YmdDbnV2UXlpcVhEMG5t?=
 =?utf-8?B?S0V4TGxaYXhnczZEek5oVzNwYzZNWjVJYytGRHJmMU45MFlvclBnVm9md3Zs?=
 =?utf-8?B?T1Q0MlYvY2NTSTBlV3Nob2g4WHZDbnJiL0NrMnhPQ2RNZytaUDRBSG9rMHd4?=
 =?utf-8?B?TlBMNTRFNk43OWp0T3JwS0gvT29xcENHUFh1aUp5VW84dkNSYWRicWtXQ2k4?=
 =?utf-8?B?dGJ1RVNCbHBpMmlvN0Zlc2Q3WTdSakNHZ0w4d21uZnZ0NlQ1V1BxMGF3NFZL?=
 =?utf-8?B?cVVQNEJpZXBtcVBYeFEyMHcwYUhaRE5BdXd5b2FRelpmR3VJYWlFanpEVVh4?=
 =?utf-8?B?MmovUzViV2YrUlJnc2FXWnhxZUFIZEJ2UFlVbkhXWnRnOGdtdForNnVnaWV1?=
 =?utf-8?B?c1piVS9laEM4ZG5OUFpTR29JM0NYcCtScmZlZXVWR3hiamZoU01QRHNqemhs?=
 =?utf-8?Q?Su0Om2D5lXBqGXQRA8wDkzWNO2B8iI00aeliBxN?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 514a1674-9a17-4016-faf7-08d8ce727e4f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 09:50:41.5700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lAHkA5NkXoOgFGBpKnjYxedXPBedY+tYHTea/J0659woEkMIfgLFjYXPj3dWpgjtmVxfjZ0BpANQRymZM+QGH1a0EPi2Bo9OawnnwzUbQZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1780
Received-SPF: pass client-ip=40.107.20.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.211, RCVD_IN_DNSWL_NONE=-0.0001,
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

10.02.2021 18:07, Kevin Wolf wrote:
> Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Now, bdrv_node_check_perm() is called only with fresh cumulative
>> permissions, so its actually "refresh_perm".
>>
>> Move permission calculation to the function. Also, drop unreachable
>> error message.
>>
>> Add also Virtuozzo copyright, as big work is done at this point.
> 
> I guess we could add many copyright lines then... Maybe we should, I
> don't know.
> 
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block.c | 38 +++++++++-----------------------------
>>   1 file changed, 9 insertions(+), 29 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index 20b1cf59f7..576b145cbf 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -2,6 +2,7 @@
>>    * QEMU System Emulator block driver
>>    *
>>    * Copyright (c) 2003 Fabrice Bellard
>> + * Copyright (c) 2020 Virtuozzo International GmbH.
>>    *
>>    * Permission is hereby granted, free of charge, to any person obtaining a copy
>>    * of this software and associated documentation files (the "Software"), to deal
>> @@ -2204,23 +2205,15 @@ static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs,
>>       /* old_bs reference is transparently moved from @child to @s */
>>   }
>>   
>> -/*
>> - * Check whether permissions on this node can be changed in a way that
>> - * @cumulative_perms and @cumulative_shared_perms are the new cumulative
>> - * permissions of all its parents. This involves checking whether all necessary
>> - * permission changes to child nodes can be performed.
>> - *
>> - * A call to this function must always be followed by a call to bdrv_set_perm()
>> - * or bdrv_abort_perm_update().
>> - */
> 
> Would you mind updating the comment rather than removing it?
> 
>> -static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
>> -                                uint64_t cumulative_perms,
>> -                                uint64_t cumulative_shared_perms,
>> -                                GSList **tran, Error **errp)
>> +static int bdrv_node_refresh_perm(BlockDriverState *bs, BlockReopenQueue *q,
>> +                                  GSList **tran, Error **errp)
>>   {
>>       BlockDriver *drv = bs->drv;
>>       BdrvChild *c;
>>       int ret;
>> +    uint64_t cumulative_perms, cumulative_shared_perms;
>> +
>> +    bdrv_get_cumulative_perm(bs, &cumulative_perms, &cumulative_shared_perms);
>>   
>>       /* Write permissions never work with read-only images */
>>       if ((cumulative_perms & (BLK_PERM_WRITE | BLK_PERM_WRITE_UNCHANGED)) &&
>> @@ -2229,15 +2222,8 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
>>           if (!bdrv_is_writable_after_reopen(bs, NULL)) {
>>               error_setg(errp, "Block node is read-only");
>>           } else {
>> -            uint64_t current_perms, current_shared;
>> -            bdrv_get_cumulative_perm(bs, &current_perms, &current_shared);
>> -            if (current_perms & (BLK_PERM_WRITE | BLK_PERM_WRITE_UNCHANGED)) {
>> -                error_setg(errp, "Cannot make block node read-only, there is "
>> -                           "a writer on it");
>> -            } else {
>> -                error_setg(errp, "Cannot make block node read-only and create "
>> -                           "a writer on it");
>> -            }
>> +            error_setg(errp, "Cannot make block node read-only, there is "
>> +                       "a writer on it");
> 
> Hm, so if you want to add a new writer to an existing read-only node,
> this is the error message that you would get?
> 
> Now that we can't distinguish both cases any more, should we try to
> rephrase it so that it makes sense for both directions? Like "Read-only
> block node <node-name> cannot support read-write users"?
> 

OK.

> 
> Sorry for it taking so long, but I've now finally looked at all patches
> in this series. Please feel free to send v3 when you're ready.
> 
Thanks a lot for reviewing!

-- 
Best regards,
Vladimir

