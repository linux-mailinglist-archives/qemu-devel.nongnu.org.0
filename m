Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7770742A934
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:16:58 +0200 (CEST)
Received: from localhost ([::1]:39846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKSW-0001I4-TX
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1maKPP-0007Ds-L1; Tue, 12 Oct 2021 12:13:44 -0400
Received: from mail-vi1eur05on2137.outbound.protection.outlook.com
 ([40.107.21.137]:34400 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1maKPG-00013l-LN; Tue, 12 Oct 2021 12:13:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=etBSBPPQaR+v0e4WTEb5qWOHVoJH7gaFE1AXRs+53AFVsJTXZtIeLpbIwOiWqhRS0yMBiLyKaAe+d8MM+k0pb5Zh5sMm3WKbJX8v13gEXSv8Y4mzQXJFtePLXMQqAaNf3lF/FznWanccTjUmoCe+3WTgWZ/HRvr2rzY09HpyFNBJCulk/HDATpJieX5aeOhYEpy2XCQYVDwr3hnM9qTcU27cJx8mRaXLyQ9et05tsLxReHVXmQH+LGeJEECs/fo2B/6oHp6i9VYQc48gnbzYmbNXnUrHJhnTCjd1glb6F0/P1w1R7DdD6p2yWzkMbtKO27oJ7s+Qv0W6LEUbkLprDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9e70jHAGyjat7m7KmZ0ZhvRhdEj/GSDTKW91APgUVE=;
 b=Vvq+xgt+nKOVlYvquIIY4nRVe6vW6NBjJnVXZX8k/8BQ9HN5aUQJCm1XCRiWpN3m2yVi+G0jd130IApKWyjqI11ZrnTBi7KM+6nc2c4U2Jh9dCffCStnjBansKl4NGLdQ10bzW/tkA6G8hD0XP3+CYs18fSk0UM9PvPiju9n+wDHI/TAW+hdr5sCil2sg1yvXmNAD2GxwCbsiJCr0k/dJiw4xUYS3eMGS3u5k3+o8tEAHy2Ul5pFUkw/Q9rPbRfzKrWF1aglejI8RN5SzU+WMf/MOwSBsW5iUZbWlihWM0cc/ERRGgqxF09hUpCAI/OyxN/ZXTb10BkYy6ApTPBMgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9e70jHAGyjat7m7KmZ0ZhvRhdEj/GSDTKW91APgUVE=;
 b=relWuPtBAFxYejmzN/+Yj+LydqlOSfVgnu8Wr6UgDDEU4Vt/c9vrx5XyEoeCVi7wpjTQ/i9UdrMalVkuKOyKFtmWtqKChUMP17POOP4kqeDoiwB3EatzX2MnWF7zgs/2hmWjut40HXijVmBTKEUEpwjQBwN5LvRr4i82yEy58vI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5032.eurprd08.prod.outlook.com (2603:10a6:20b:ea::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Tue, 12 Oct
 2021 16:13:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 16:13:25 +0000
Message-ID: <b251f39d-d727-311e-e6e4-f84c360cb3af@virtuozzo.com>
Date: Tue, 12 Oct 2021 19:13:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 10/12] block-backend: convert blk_aio_ functions to
 int64_t bytes paramter
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, crosa@redhat.com,
 ehabkost@redhat.com, hreitz@redhat.com, kwolf@redhat.com, stefanha@redhat.com
References: <20211006131718.214235-1-vsementsov@virtuozzo.com>
 <20211006131718.214235-11-vsementsov@virtuozzo.com>
 <20211006202925.x56o344sxsgbkrvh@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211006202925.x56o344sxsgbkrvh@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0007.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.43) by
 AS8PR04CA0007.eurprd04.prod.outlook.com (2603:10a6:20b:310::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 12 Oct 2021 16:13:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c2ccd23-480c-4d82-358b-08d98d9b37db
X-MS-TrafficTypeDiagnostic: AM6PR08MB5032:
X-Microsoft-Antispam-PRVS: <AM6PR08MB50328AA79D723526327FCFF0C1B69@AM6PR08MB5032.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JTR+V8owFXsJtAxLMijMfQrzuql+0gi/fhKO4DuLUOPDmQsPYLHoiKXCjrjlykOZCD+V5bRbmiEz/U7QZjCwL0+ccitWO3cN3XFgutZwgSChqbdsVWUcZdd2mVVoWD2U5Xsn50FQ9RXemAYkhITw7kgFPZxD6H9nTLAF3qXO23t/Fs4uyiRsATYZ8jlum6ykZdzuQEjePhXIq67dUDKxF3h/NAd5F0dF7+JWpinJuOEwST8Cew57v/kmNaSXcm1LTmkFu5YZjfrrqgVnlpPKTDysYihfIFUv5rQZQ1YFtJd2b0UeLEz9x4U0fJqJIAofDNNcqtbSf1vxZ2VD7F9ERzz6Kwl2NJ4a97GdpWiRokL1kZmOU5OXC5XJVU+SIVNaVHpmCenDvrzHCqobT+JQcEhxjyEVTi2NNEmUKguaPzTnGkMEVbg17TnkxRZs/2QAhlw+oVLpzPH7Ec3WqFiVhPO4f9BH6/VlW3vcWWgFdwOp0yh5W316D8MK5h5NsvbA0jBMzhL1cAz65BylbfSNwdI1b27io/9l+WteN3IuRCj6fy4tv9F97zfp/RGUvNnF3sm7GC3o8l7Covp0m8OxhnbVbpNQDZTmg/qo0qb3Dshd2210kUez8P5CNBFPgblNzic4QGXoQn2ePYQN4r/Pl6pT5V7C2phQ9dYjhdV0B/C6NVFHA0T4G5Z1CBA2nLx6a6oxts6k345ABQ6+eNUmuXr3eBp0L2plXQUklo559xgAl9lex5FiGDa36sWcyDuQLCav37AW+R3F/5HbYQc8Og==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(508600001)(316002)(6486002)(38350700002)(6916009)(5660300002)(83380400001)(186003)(66946007)(8936002)(86362001)(26005)(16576012)(31686004)(2616005)(956004)(8676002)(2906002)(31696002)(4326008)(66476007)(66556008)(36756003)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TStYSTZWSUZnQ2s3SzNiRG4wQ2k5dW5LREdhVXViYk9YS0lmNGR2a2ExbG5p?=
 =?utf-8?B?RUEzOHF0OE9zSWRyMTAwZGFJNFRaS1NmcnAxYVAva3d2Z1lWQkNrangxUmw4?=
 =?utf-8?B?c1pUaHVKaGFqWGZDUVVGUCtJdDREQXVOTXE5ZmIzVm5WeHVEendiVHl3UVRi?=
 =?utf-8?B?OFNtK3hLTzlRWUdtbkZKa2VHWFV2OXBnUmZZbHlvU2s4Y3RMSURRdms0Z3Zu?=
 =?utf-8?B?d0xrVFZETkdXRDNFVmJwWSs1VEgvYzFxY0ZKai9KN0NNb2taNHhBVHpkVVJX?=
 =?utf-8?B?Z1ErMkpVUStJTVViUDhlWExTY2pqR3hJN3dIdWoyeXJ6Qk1aK3VRTkxYRU5p?=
 =?utf-8?B?YWpUMmhKVzdINjdKWW5sN1paQkwyWElXUDhkYi9sbE42WjlvYXlzNFVmeFJT?=
 =?utf-8?B?QndGN2dOeEFMZ1paUDE3eFNCMUFlZmJ5YmZhUWVncGJKTXFjOEowbUNlV292?=
 =?utf-8?B?VGZQRDlKaGs5a2VRWE5aY1FuNXJLZHFMZGY2ZUU5c1kwbzN0OTdzVHdzQUxp?=
 =?utf-8?B?SFJQWDJYREFoSmtmSFAvTG1NMElxemJtZXBKZXVPcU93R1JpTU5qaW1sME5M?=
 =?utf-8?B?ZjYvRmx2RlNjSzhhNWxLeG1hY3lERWt4QzJNcTh3VTlySVNNd1hlWTZNdndU?=
 =?utf-8?B?TkcxRHk1SDlrOXlaMERkVlQ5U29FWFIzZXBBdVJhUnFXclcxTFMxRC8yMW16?=
 =?utf-8?B?cnhMTGV2QWZvSWZ0VUtOb3kwajVZajhmUWNUS2pYL0FYV3BoMFNRTVlkYlVr?=
 =?utf-8?B?SHp5RmZJdnVBMTFzbFh1VFFCczQ0T2VXRlYzeFNpcG4vU3E5TGhtMkhKSXVK?=
 =?utf-8?B?My9QeUZ1QU9ReFhManVkS1RMcmtLYzZnaWdwZzdXUHczaWhCOFFLY2diOUYr?=
 =?utf-8?B?MWxvdWxTOG9XMzlrRGNlWU5qZTdSYUFTQlh6dUlIT2l3aEFucDZXMXZqNkZo?=
 =?utf-8?B?WDJhU1MyK1BWOGhwMFNTUnB3V2s2ZlE2d2JTNEdkUWxhc0R0Wml4SGRNZGYr?=
 =?utf-8?B?bGIzYk93WTZRM2JCWUY3ZzU4dTk5clhaRjNnNGtEaFg3VHAyZ3UxWGxqeGh5?=
 =?utf-8?B?MjdNVnBrTGY5aUhqdmRCeHJLakRCeWNaUTA3MEU0L0dMM1RYVTFaZFBQUTdV?=
 =?utf-8?B?UUxUWlAzSG5HdHRwY0FMRGYrNE1DMllxNTNTMHRQd0E0QmhEeWNITGhZblZO?=
 =?utf-8?B?MjBWaEZQVTRleDBieTVvSXMrcHRhRkJ5QnJRTmNHL28vWTRBNXF4Y1prSEFh?=
 =?utf-8?B?anBvT05TRjVvUi9iUllmbW5EdlpTcFczeTFZVTJVczNUekxNSG16d2lBRGRr?=
 =?utf-8?B?c2M0NjROUEdzbHFZMVExZ0N1VC9OTFE2TU1Vb29weVNzT28yMEJTOFJWU1BR?=
 =?utf-8?B?bWpjaHcyaHo0OUY0TzFjYktadkJianJSUVRtOU45S0hLano0SmR1WWFVU3JW?=
 =?utf-8?B?dm1rL0V0T0xNS3Nlb0NVYzlLN01NWHlnMGdUUUtRdE5EUnRINzZXNFFVZzhu?=
 =?utf-8?B?VnRaRzF3TDNVcENQZmNvRnkyN3ZaS2V4akRJcVFXQ2pNYncrTnpwUUpJNS9X?=
 =?utf-8?B?QmpodUE5bzVHbkRsTzloSVlrdDcraFFFOTJlcmRQUllJdjJ6TDZvRWFwS1k3?=
 =?utf-8?B?TFlCRDlLZy85U1lRNm01aiswUVMvRHQzM2YrRUk2clFMMW5jQ0lBQ1gzVjBO?=
 =?utf-8?B?TTQzNXJxOXdsTUQrNHdLS3N6Yjlpa3dLa21RV0YzWktuR0Uzb0lSZDE1V3Z4?=
 =?utf-8?Q?YmOwq2LfhOp6WUd5Pw8RG8Jh6DughYZPXoCoxs6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c2ccd23-480c-4d82-358b-08d98d9b37db
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 16:13:24.9959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4D8nww0fsub8dM6QwJFecl2sHwLXMt7wUSL85WPQXH0oYLjHj3knlXLq6BoSN1tUq9o7rG5vAfY8G+1XTaYBzj7Qes6zM97fnfKCN9ms/Iw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5032
Received-SPF: pass client-ip=40.107.21.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

10/6/21 23:29, Eric Blake wrote:
> On Wed, Oct 06, 2021 at 03:17:16PM +0200, Vladimir Sementsov-Ogievskiy wrote:
>> 1. Convert bytes in BlkAioEmAIOCB:
>>    aio->bytes is only passed to already int64_t interfaces, and set in
>>    blk_aio_prwv, which is updated here.
>>
>> 2. For all updated functions parameter type becomes wider so callers
>>     are safe.
>>
>> 3. In blk_aio_prwv we only store bytes to BlkAioEmAIOCB, which is
>>     updated here.
>>
>> 4. Other updated functions are wrappers on blk_aio_prwv.
>>
>> Note that blk_aio_preadv and blk_aio_pwritev become safer: before this
>> commit, it's theoretically possible to pass qiov with size exceeding
>> INT_MAX, which than converted to int argument of blk_aio_prwv. Now it's
>> converted to int64_t which is a lot better. Still add assertions.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   include/sysemu/block-backend.h |  4 ++--
>>   block/block-backend.c          | 13 ++++++++-----
>>   2 files changed, 10 insertions(+), 7 deletions(-)
>>
>> @@ -1530,6 +1531,7 @@ BlockAIOCB *blk_aio_preadv(BlockBackend *blk, int64_t offset,
>>                              QEMUIOVector *qiov, BdrvRequestFlags flags,
>>                              BlockCompletionFunc *cb, void *opaque)
>>   {
>> +    assert(qiov->size <= INT64_MAX);
> 
> I hope this doesn't cause 32-bit compilers to warn about an
> always-true expression; but if it does, we'll figure something out.
> That's not enough for me to ask for you to respin this, though, so:
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 

So, here we need

assert((uint64_t)qiov->size <= INT64_MAX);

as in recent fix by Hanna.

Eric, will you stage this as continuation of 64bit series, or do we wait for Kevin or Hanna, or for me resending it with this small fix and your wording fixes?

-- 
Best regards,
Vladimir

