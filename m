Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A826369263
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 14:48:40 +0200 (CEST)
Received: from localhost ([::1]:33892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZvEc-00085W-Mp
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 08:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZvD6-0007ZO-Tu; Fri, 23 Apr 2021 08:47:08 -0400
Received: from mail-eopbgr70114.outbound.protection.outlook.com
 ([40.107.7.114]:9168 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZvD3-0008Oc-S8; Fri, 23 Apr 2021 08:47:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sopb66rCEWecUd/yLYUuqQ41t9GVGgl1JaHfYuX/YnNKcPOc+gPUKvY6MMqm9v6vhWnPSi/lsU1HP3Cls1CIxI+mZ8VubdnPQq1PSzF9godFmzT5ayeM44GKkP7+ysI6Q3wRVBtJ2mBeb28sM4GV30k+HeRcjzeWoZhQOMGnNDIMzvEFqZchbnnoZu7At3HVAYRVttEPwHQq/PrkRho9ZcZxRvQRmVIrTeduUqUb+geDNkRvfmXqdDeYEZfxbM8oAMEHJuwO9wSoyhnKxSasXtabNyN4vY4jcMe4ail5IUwfGxd1SHhpivCjJL/JQzV+n1sEEVWoHIzatfKlE3eS3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXqSZ5WpNiUGBHNqYRzQThICrOomnovkXgx0W/fFcYE=;
 b=QcKsOPCjCKYTE0z9jdYVIEH7DovgdggBMUWySJL/xuWDdmYqbrXddLOi3jS5zaaSJ27EQh4Es5N1YS7ux7Vk1a+Evv3q4USanAc5R+6SeWB7PsqS8RDHPNfoljCb7pk96KHQTCQ03AeIbs5FkSqfieWfe6fBYZEfkuGy3utR25AgXcv6J9i74qIYZrTHOyjQIxOgiXBYsNvAMjyeOC3P9fwT8znDuYr4zGK9nDMfI0hZhwOutmgknT4Kg2OOTXgefudTKd5ArYoUzeO0PWuUkSg/eet6yJalZd60azsM7E24uRvoB+h113D5QH9SjQMb5X9JFPC0BbzXMrPaaLBaCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXqSZ5WpNiUGBHNqYRzQThICrOomnovkXgx0W/fFcYE=;
 b=boTofsgksBI4U2b0Y8TS4mMqViknBhGrbo69OKE5PG3QFFkMPKFPLUtwwN3drt4nreETtJtj1Qs+Ch7lbzU2Svz+rpMV5WI9t/ophAabuUcrxejJRyF/NKxPFonD6ZO93JyqjuPEAZwHJTJ418FOEjMo4CECXqJRWLTkD7A9QE0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3576.eurprd08.prod.outlook.com (2603:10a6:20b:4a::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Fri, 23 Apr
 2021 12:46:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Fri, 23 Apr 2021
 12:46:57 +0000
Subject: Re: [PATCH v3 01/36] tests/test-bdrv-graph-mod: add
 test_parallel_exclusive_write
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
 fam@euphon.net, stefanha@redhat.com, jsnow@redhat.com, mreitz@redhat.com
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
 <20210317143529.615584-2-vsementsov@virtuozzo.com>
 <YIK8qAw+HwhQgiEI@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <1631ec75-4301-1d84-b607-8c296b09d392@virtuozzo.com>
Date: Fri, 23 Apr 2021 15:46:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <YIK8qAw+HwhQgiEI@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: PR3P195CA0021.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 PR3P195CA0021.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Fri, 23 Apr 2021 12:46:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef167366-a290-4779-1e6b-08d90655e149
X-MS-TrafficTypeDiagnostic: AM6PR08MB3576:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3576824648255C631F3F1210C1459@AM6PR08MB3576.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HEpWsqb9UdZB8l9fK+NAyJgR8EA0DFT0mv0Cw2rgOAWCzNXY8I7b2Mctwhheqy2fhAhfRuoqxt6bSpBjoGaLkRW1FaWRZ7ZTGOKLXh6K9dukvAMzT9lJn55srrObklsshlFe0WU0sr7J6aAEkVNxYyFNDiwE1WlSp3CWIoKGUFB7ix6P54NK0M1XvPiOOv4eIT/0pcD7b8HAd/e0xXnzxLI0rHP42MENJQPkFwHM4f//DXOQGVzcs+ZV5N7Ark/6igxWHZNiR4WVir23I4jYY1cRNj1WMPwRTz9Fn+q+V3pDIuOrtKCxDB3Oydl9rt5b72988Zco8m1ja/VebjSqt92uTHUcDPpDFCzbPdxlS8ds2h0eATmJtl7aPw8kNBczp67ptZPOuDPrw/YhB4KGhQFZNpAPkCdU+ot6WwXT5WD7xiMW9OCM8yo9vJaEGp1Jro3Qpe+HzR5wpYOBxHlgC6KiLk0fERRjb+HV2A6fsd5rffFpoc3c+wFV4vBiN4nJYFy5fVH0vrYm7pvb1EIcjETzW970lsEdtBz8W0A/TPB4MW3cZt5TD+446cpMEpf3G5GG8OOfNDq5j6tV01hZylkZX7O3xFTU3eM5HzP33grNqzrQr/NK5WlOHeQtdBjTNXLIDysIRS6F3FKrIREyHnlxASsNF46iF63g/fgHaG9r1qZOpFNfuRriqYgX8iTrQ6GOCiJo4K00L7cm2Tp8PnxC8q8KRpNBTf363oEDo8WeZuaS3qrcSrSKn2SsIioP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(366004)(136003)(396003)(346002)(376002)(478600001)(36756003)(2616005)(316002)(86362001)(956004)(83380400001)(66476007)(4326008)(8936002)(186003)(66946007)(5660300002)(2906002)(16576012)(16526019)(38100700002)(66556008)(26005)(31696002)(38350700002)(8676002)(6486002)(31686004)(52116002)(6916009)(2004002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NDdiOHpJMEU2c2JxUHg0bFVJNGdMQmV4UE9qbjkwUk9DUnZJZE1za09Baitq?=
 =?utf-8?B?cjlkU01hZVZiMm90OHBEdWZOa3IrU0pNNXZTZllhNDYzaVFvSnVoOXdxdnNO?=
 =?utf-8?B?dlBEOUtob05NWUFlMGJoajM5NHRGRVB6dDUwcmtTRlJ4N3orT096VmtiMm5r?=
 =?utf-8?B?YnpVNi82ZEU5UWxBU1RDaFpQcXpEeGJFbmZWRzhvSzR4NEFvNmsxN0UvUlFt?=
 =?utf-8?B?Vi9GbkFUeTN3R1lZSTF6T2RoRDFsTUFNWlljSUtTTEdEc2xYSk54SDc5T1Vi?=
 =?utf-8?B?UGNsTU5ybmF5OUVYd0QwYmFnTzQ5VktNcVlLekZGTHNoOTdFTURZd28xeUVR?=
 =?utf-8?B?NEwwTlVUb1I4OUlqRnpQSnhmbVhtVU5kSlVFVTZHcDFnRWRUYWJaeXBBNVNZ?=
 =?utf-8?B?QW5INGhUV2tyUXdkZ05kdmRQWXovclNrSllUbVdsbFRHQ1pNTzNhTGlVdkZa?=
 =?utf-8?B?eDc2aE1Ua3V2dlFSVlRzWkpxdG1sLzlsSHVkT1VvY2VURkN0ZkUvQmQxbjRt?=
 =?utf-8?B?aXhzRXVhOG9mOWJRbElEbUxmVTNXL3NtOUl6Y1VrTHhCNUgvNStSRWhmemdX?=
 =?utf-8?B?K3dCYTByTjJQRHlRN0tWSy9odXJxaEVKNjVBd2V1cTBNQ0h0VnNOWXFQQnVn?=
 =?utf-8?B?b0tYOHNIcWJ5WU9xcnJYYjJKVi94VjRRdGt6S1N5QjNhY2NJNGhROFlKOHVT?=
 =?utf-8?B?MzdMTTBmNnhPamYyV0VaL3F2Y2kvTSsvRzVvVGJRekpsbEMvd3RoMFB1NmJl?=
 =?utf-8?B?S2FGU0o3WHFGdHA1cFdhbUtLdmwwbnk0dG9FL21zT0NBYTRUVStPRmNMWGYr?=
 =?utf-8?B?NXlyMkNxZ0l1QndFOGZUZlN3NFo1eEt5cUYxU1U4MlgvL3JQanFBN2F4MjVL?=
 =?utf-8?B?YXFBSTJMdnZUSEM0R0RaTzRObkpYcXF3MHNSRndwYkd6NktCVXptaHBQQ2sy?=
 =?utf-8?B?NE8xeWVadENiKzNVV0tMNUNlWHJhMnZwdzgvYzRpOTFtbmhqVkQ2UHdkY2FS?=
 =?utf-8?B?Y09oNUMrWFQwbXlsWFZaTCtRRktVcFlKd1o2VnZSa25URzVIMkdicm5yVUNE?=
 =?utf-8?B?dEI0TEFVZjZwTm9Day9VWXB1MFp1RE5SMmZjOGNtSXNmZlJFQi9UUExHeGJE?=
 =?utf-8?B?VXJhLzBCVVNCK2JZbnc2QXRZUy9YamNVSlE4VVZwVHRRS0x3TzZLQitvamhC?=
 =?utf-8?B?VjVqMU5PVXJGNGxEVlFUV01FZGs1SnVVZS9WSkdlKzZ2UVhXSkYyTmgrcGVl?=
 =?utf-8?B?N2JsZVNsWldjdjl2RzdnNlI5NDZyVVQ1NEZKUW13UXVFZm55UGlEam1iM0VI?=
 =?utf-8?B?dXdkamlSNERmMXpHVmRVUHkzUGZHSVZlV2IyOCt0cjZpRnUyaFJybTZkRmFD?=
 =?utf-8?B?SlRuTXNRcThjZ2EyL1QyMDhXckVmQkdGU1l0S21uOE9PRmhUSmNKU09saEx4?=
 =?utf-8?B?NWRobXhtWjdydUVEU1Z2YTRtbjRQUFZ2Z2d4SUZwSjkzN0U3MDE4bnA2VlE0?=
 =?utf-8?B?L25JTkEwSkt0NWUwU3lGNlFBTDVWTEFEcEdPMkh5bHMwb2VuYkJ1OGZFSFpL?=
 =?utf-8?B?NGpIdXR3K0dORmRESWVEYXljcVBWVW9UQ2cvUFVQUVVzQ1JrU1ZhVXpKQ1hs?=
 =?utf-8?B?Q21qbXFoUjlPOXdvQnFKMUo3UFJnOGNUVUltRlNhZWEwajUyQUYza3VKdTIv?=
 =?utf-8?B?SmxNYUdNa01VSHNuMFRWVDN4emR1bXNGVkVwOXRrSzNsekxnZ3g3N1NESDhx?=
 =?utf-8?Q?k1W1e5in1tW4vf/0lFKUAsNsY50Ss4Y1LJv/rVf?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef167366-a290-4779-1e6b-08d90655e149
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 12:46:57.2263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WDE5BgrGxyoszwFbPQA/OSwMLUINiPyiofBcDh/OoSL4ncRpoUkeTgeVtC3lf+HinMyPgXPr1wAFpRtKMWX+l8JOWzR9yna6e++iKaiRDZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3576
Received-SPF: pass client-ip=40.107.7.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

23.04.2021 15:25, Kevin Wolf wrote:
> Am 17.03.2021 um 15:34 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Add the test that shows that concept of ignore_children is incomplete.
>> Actually, when we want to update something, ignoring permission of some
>> existing BdrvChild, we should ignore also the propagated effect of this
>> child to the other children. But that's not done. Better approach
>> (update permissions on already updated graph) will be implemented
>> later.
>>
>> Now the test fails, so it's added with -d argument to not break make
>> check.
>>
>> Test fails with
>>
>>   "Conflicts with use by fl1 as 'backing', which does not allow 'write' on base"
>>
>> because when updating permissions we can ignore original top->fl1
>> BdrvChild. But we don't ignore exclusive write permission in fl1->base
>> BdrvChild, which is propagated. Correct thing to do is make graph
>> change first and then do permission update from the top node.
>>
>> To run test do
>>
>>    ./test-bdrv-graph-mod -d -p /bdrv-graph-mod/parallel-exclusive-write
>>
>> from <build-directory>/tests.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/unit/test-bdrv-graph-mod.c | 70 +++++++++++++++++++++++++++++++-
>>   1 file changed, 69 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
>> index c4f7d16039..4e4e83674a 100644
>> --- a/tests/unit/test-bdrv-graph-mod.c
>> +++ b/tests/unit/test-bdrv-graph-mod.c
>> @@ -1,7 +1,7 @@
>>   /*
>>    * Block node graph modifications tests
>>    *
>> - * Copyright (c) 2019 Virtuozzo International GmbH. All rights reserved.
>> + * Copyright (c) 2019-2021 Virtuozzo International GmbH. All rights reserved.
>>    *
>>    * This program is free software; you can redistribute it and/or modify
>>    * it under the terms of the GNU General Public License as published by
>> @@ -44,6 +44,21 @@ static BlockDriver bdrv_no_perm = {
>>       .bdrv_child_perm = no_perm_default_perms,
>>   };
>>   
>> +static void exclusive_write_perms(BlockDriverState *bs, BdrvChild *c,
>> +                                  BdrvChildRole role,
>> +                                  BlockReopenQueue *reopen_queue,
>> +                                  uint64_t perm, uint64_t shared,
>> +                                  uint64_t *nperm, uint64_t *nshared)
>> +{
>> +    *nperm = BLK_PERM_WRITE;
>> +    *nshared = BLK_PERM_ALL & ~BLK_PERM_WRITE;
>> +}
>> +
>> +static BlockDriver bdrv_exclusive_writer = {
>> +    .format_name = "exclusive-writer",
>> +    .bdrv_child_perm = exclusive_write_perms,
>> +};
>> +
>>   static BlockDriverState *no_perm_node(const char *name)
>>   {
>>       return bdrv_new_open_driver(&bdrv_no_perm, name, BDRV_O_RDWR, &error_abort);
>> @@ -55,6 +70,12 @@ static BlockDriverState *pass_through_node(const char *name)
>>                                   BDRV_O_RDWR, &error_abort);
>>   }
>>   
>> +static BlockDriverState *exclusive_writer_node(const char *name)
>> +{
>> +    return bdrv_new_open_driver(&bdrv_exclusive_writer, name,
>> +                                BDRV_O_RDWR, &error_abort);
>> +}
>> +
>>   /*
>>    * test_update_perm_tree
>>    *
>> @@ -185,8 +206,50 @@ static void test_should_update_child(void)
>>       blk_unref(root);
>>   }
>>   
>> +/*
>> + * test_parallel_exclusive_write
>> + *
>> + * Check that when we replace node, old permissions of the node being removed
>> + * doesn't break the replacement.
>> + */
>> +static void test_parallel_exclusive_write(void)
>> +{
>> +    BlockDriverState *top = exclusive_writer_node("top");
>> +    BlockDriverState *base = no_perm_node("base");
>> +    BlockDriverState *fl1 = pass_through_node("fl1");
>> +    BlockDriverState *fl2 = pass_through_node("fl2");
>> +
>> +    /*
>> +     * bdrv_attach_child() eats child bs reference, so we need two @base
>> +     * references for two filters:
>> +     */
>> +    bdrv_ref(base);
>> +
>> +    bdrv_attach_child(top, fl1, "backing", &child_of_bds, BDRV_CHILD_DATA,
>> +                      &error_abort);
>> +    bdrv_attach_child(fl1, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
>> +                      &error_abort);
>> +    bdrv_attach_child(fl2, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
>> +                      &error_abort);
>> +
>> +    bdrv_replace_node(fl1, fl2, &error_abort);
>> +
>> +    bdrv_unref(fl2); /* second reference was created by bdrv_replace_node() */
> 
> This line is new and I don't understand it.
> 
> Why does bdrv_replace_node() create new references? Shouldn't it just
> move all parents of fl2 to fl1, and when the refcount of fl2 drops to
> zero, it would be deleted?
> 

fl2 is second argument of bdrv_replace_node, it's @to. So all parents of fl1 moved to fl2. So, fl2 referenced by top. But our first reference that comes from pass_through_node() is still here as well.



-- 
Best regards,
Vladimir

