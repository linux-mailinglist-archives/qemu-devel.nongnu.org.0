Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E4136D010
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 02:51:44 +0200 (CEST)
Received: from localhost ([::1]:56784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbYQY-0007Dn-PQ
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 20:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbYOl-0006mT-Sr; Tue, 27 Apr 2021 20:49:52 -0400
Received: from mail-eopbgr60136.outbound.protection.outlook.com
 ([40.107.6.136]:17564 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbYOf-0001XO-S2; Tue, 27 Apr 2021 20:49:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8Wev/kYHmLzlpCUIfBO0EZ2cfoDRqP7wxJnruNpKrFk12ZUKGpWg/d19TNmyqy7WTltNnZcyWMPlRZJ02/uyiusZ/xzQCabB0wI0ryLedxajYdGGx5DbxfrrehFe/Rq08/9j23Ar0JgKkmrf3XPigPyIfoGVMN/7bm3Os19aH2Lrxu7SiOMs1yIw3wD7KNVAXvl+oYadId5H0o2p55O94p6/R7cviDv3dvdfl4BtDZc3gscZarvZPkHdxK9L6JmP1UXkZa1YhbPmFi0yQV6WAxcMhMUI2BzSYL3dlVVN/bBERKIaqdM/cZTPEJ5VIyc2hFi9XkHOs4pnH5sPxp/tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYCe0H+DoSjqd+Qd2xDFy0J/GglCPe8ZL6TsST1BYgA=;
 b=Jl14wB01w7cnfdMgRZnsgrCV31ufNxV4mBc/wJNqj+NUJ2W69w25eSizPBGM9mfB2nJDfP3myzYiXUh5QrKvNpqx8bvMdHjnQR0iMjYwfE4I2sZ2YF+O8CyjFan6WBVSsd98fBmQ59VoaxjFdJgdTHVynbZJ4mZZba7K8856x+DYRUjvCRc4YmZUTmZ50IGPByM0Gg+5V5y/JS24Z82Gb/G3ddRRInWPQVv/RIH8lm1fQMimupqJmpeohrnrQFC5/UG9aWd+66j0WTKA2NvL0NSBxZiknSIJZQeV/lZ/sGy+AYfgd6aTRXzkGuG6+VbUT7llfqd9JQIGBhGmZ0MBWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYCe0H+DoSjqd+Qd2xDFy0J/GglCPe8ZL6TsST1BYgA=;
 b=MafoH3D0txr0XBauuLg3VwWRP0KRBtqKn1SK8V9EBtT7UuUNzMhVz3IuCvE+KTMMrLiBZr0aJpdZWKYvIuGnrfQYCVZ1wSXv+Wo7nuhSEJiZOK3JfPeayoeP7nSNB1D6RUUpwsV8dhAwhnHxMy1il1SpnK+I5VN0+LT+VqNdexY=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6760.eurprd08.prod.outlook.com (2603:10a6:20b:393::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25; Wed, 28 Apr
 2021 00:49:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 00:49:41 +0000
Subject: Re: [PATCH RFC C0/2] support allocation-map for
 block-dirty-bitmap-merge
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, eblake@redhat.com, pkrempa@redhat.com,
 nshirokovskiy@virtuozzo.com, den@openvz.org
References: <20210427111126.84307-1-vsementsov@virtuozzo.com>
 <0b7abd2d-f601-4224-1261-f939623d7687@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5d0a5a66-1b31-48e9-8590-765698fc0dae@virtuozzo.com>
Date: Wed, 28 Apr 2021 03:49:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <0b7abd2d-f601-4224-1261-f939623d7687@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: PR0P264CA0151.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 PR0P264CA0151.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 00:49:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2585751c-d2db-42f0-45d5-08d909df821c
X-MS-TrafficTypeDiagnostic: AS8PR08MB6760:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB67608DF714CAEF363A6B0702C1409@AS8PR08MB6760.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7EyPinaweIZ8MemPZ0x4fCWlD/41R98sH2cwxWxnUvglors68tfcjfQDFjwnPyZNTz+sSh6BftZVmadUoADU8Mox02enUwadnPRIbUZibH9l9yZnjITEOKSk+hFlOHA3DBgJcX8AxpyI620FWrqKALZdFM03medFcu4lZETHpRE4q6Zs+tt4oX/BYwkhZPAHjm/DidotHBsYxwZONdoSoMV1Eat+FhyQ/gPvBUPGngtzo8HY36mFU9pghleA0TeirE7V4hxviObGyte3BxZePhWZG4jKFBWkFP7cQpB6eL5q7B3fixSI89V5jUtaUzAaHE5J5l5JcttL7JSi5SvBW8p7IQbIs9A+MskLpZnjUVYqg+JpQw6XMC6uHIuM9NMiiIYadQv73NrJm6RVzoGqx2Yu4/f+u2Yjp2J5BypMthze5D9NlvYr4SCq9YqBYCmENncRwNxO+mAo3RWehj49MfEbKvEgwKQGVn9l3wZZ6/E9uhE6TrfHjsW9CLI9+qtrekFfFHG8KGnFcW8s5zJP0dpP+1TnAU2L6WUUIYFGIWrBOIAocOiSqm5mWymCgxjWXAscM32qeOAxkjCk+OMgUEVQBRYpqAQk02GsywEwAkNBlAFfemWcziB6ak0GvbWfLOJJ4bYJC/SWzzaV9bQJ0QDblJ2oMlmmXUbzxGb5ntr2YDozwKfoXD3aFXmoW1WOocKGQya5gASOKGXjnjvq4Ae3DZb2PPS6YqPmjRVf2FTPPLvi5mSgAtR5mkhc7wgcFAzcfr5T1IScxBGrf6FGCVkSfuJHaTc1IkTrnVRJ2kYKz/n7gdDUfaCon3F9RqpZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(346002)(376002)(39840400004)(38100700002)(38350700002)(478600001)(5660300002)(53546011)(26005)(2906002)(16526019)(8676002)(83380400001)(31696002)(6486002)(86362001)(36756003)(966005)(107886003)(52116002)(66946007)(956004)(2616005)(66556008)(66476007)(4326008)(31686004)(16576012)(316002)(186003)(8936002)(14143004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZGYvdXBBMlZtN3FXM0lWSGFuVUJTY2ljK3ZURmZpdU02WU0yOHJkUDVsMElG?=
 =?utf-8?B?SnNJTExXMWhMSFlRWnNzTTFyMVBzdWZQNGFOeDJhWlc0dFpiQVg3bzc0d1V0?=
 =?utf-8?B?NGVucksvT2NISENSTXJKQi9qUExnMlVzTUxDK0U2NzhCNWphdXZ6cU8wYk11?=
 =?utf-8?B?anRsdUVBOVNUUmY2RG9QdFNPeTdnT2JmNlpyLytTL0c1RHB5SzVnM3A1Qll4?=
 =?utf-8?B?VVBCTVBmQ3IrUXdNZGlJVSttbXdOUnRPTkNvaDYrUG0vY3NIUGIyZ05lNFBm?=
 =?utf-8?B?MS9ESlI1eGNNZ1E2MXpxM3hLUWR3WjZETy92aHA2S1NxamtrbkVZT1RKN3lU?=
 =?utf-8?B?TWVhRGwxbWl6TVJDanZhNFFTYnU4eExzMnpTZmVYNzRwV3BwYWRXWW9iRnJY?=
 =?utf-8?B?blI5d3lJVnNSaGkrcFlyUm9wWjAweXl4ZW1BR3hub0NNVVhEYlNqaXFBdlFp?=
 =?utf-8?B?aXdpcUVsa3pNL2pkQmJXSzdEMjV4YTFYYWVPczVBdmpkS1hPZ3B6RzNRY0JT?=
 =?utf-8?B?ZnJ1alNQeFdrL080RkVJVnRQQ2w3VngvbStMSVQ2Z0pHS05aai9RNWVzMUJQ?=
 =?utf-8?B?clpVdTU2alZxenp5bEdBT2lFOFo3VU12UXdKdk5reExjSXo2ekd4TExVQ1Vr?=
 =?utf-8?B?NzJ3N2lxTHBwM2ZUdjRONWFzTUttRFlVY3dUbmh4dEdvL3VCWVBoTml4eTl2?=
 =?utf-8?B?bmtIKzkwbGVFeTI0UDdBc3BsTC9UVlJQVDNlRURQQUJVOGpJT0Rram8xcnp3?=
 =?utf-8?B?WGlySGY3RjM4ODdQQTJQYkdnRmxXeUNESndWVE9wSjNqajV1aGlDTFJRd0w1?=
 =?utf-8?B?c0pFb2RuSEFDcXQySy9zcWhPa1E2Z3lWd3dkT3BkZmF2Unp0ZzNXU1ppYjIx?=
 =?utf-8?B?QWlQeXR1Q21vaitTZ2g4Q0hRd1FiZjk4RTB2WFU2ZkJZRnpXSWJRa0JudWls?=
 =?utf-8?B?Rlp1TjN4Z0M3aStmaUJJeHI3OWF3aDRCcVlpUHJkWjhCZlpkRVhLWDhNRmN1?=
 =?utf-8?B?ZGkzL2sxdFpORWkzZG9lZjEwUW5LMEtabjJLUXNqSkxrUTRrcURwQ0c3bWtI?=
 =?utf-8?B?NHNyR3VpNXI1OXFRRmVkMk55ckFsazhFRkxDN1hTOGU4WXJBNHlab2tEd1g2?=
 =?utf-8?B?b0ZXeGk0WGZTaTh5eTVwdWJXY2IwTjl1akdTWHJveDJWZmZ6SEFiU0poVHRn?=
 =?utf-8?B?NWp5cDNxK0xleHRCNzVGTGpoS3hjdjc5RC9mSndpeTdta1J1TmZrU3Rtbm1B?=
 =?utf-8?B?MmtnSktQUDB1OXFRYitzZERMNjRzQTN6UWZGaUpLTUtkeElZb0xjajhTSmQ2?=
 =?utf-8?B?MkhNN1lNOGdPZkhzaG5oeGU1TDR5TW1BVHdMUUNxeURZUEVhNytYQXZxMGxi?=
 =?utf-8?B?RmorZ2dGTU1LRk8zeHk0ajhaWlpOTHg5ZzlSOTUxR0JGVnhpdUpmL1RHRkk5?=
 =?utf-8?B?MVB2MUh0dW1TRSsycm5oYURaVGtSdzByaWhPRU96azVBWXhjdmZVcVNHRjdi?=
 =?utf-8?B?cHhZUHJUampuVjFwUjdhcWNOaUp0ZzlPdmlwbTh0MmFwblhLZll5a0ZqelVQ?=
 =?utf-8?B?UC9CZkZzdXNidGNkOGlHSCtFTExCNFB0ZzBLWWZwc1JRUFpqT3FjNkFLVEJH?=
 =?utf-8?B?U3Q3bFV6TjBmSzgwY0lhRDFuTzZjOXhLR1Znem5NM2o0VStHSzhGOVpnd0s5?=
 =?utf-8?B?bWV2ZlhkWlg2dFk3MzBhek1laGZteWVmYkZIUXJJR1pwMWtvNGV5ZUJTOFNz?=
 =?utf-8?Q?LUUUhDI1YAHaj9FL2AEpvzmuG921aqwhyKGyqu0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2585751c-d2db-42f0-45d5-08d909df821c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 00:49:41.6665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AFuMfi6h0nyDS9hCkao3vdww60TCUInqFIscSare6XwEJs4WH5uXt2rNcbjDcpfY7dO/H8ps5OMztrvVkQFoF2liZDvlo0QkpUk65SGH8/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6760
Received-SPF: pass client-ip=40.107.6.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

27.04.2021 21:24, John Snow wrote:
> On 4/27/21 7:11 AM, Vladimir Sementsov-Ogievskiy wrote:
>> Hi all!
>>
>> It's a simpler alternative for
>> "[PATCH v4 0/5] block: add block-dirty-bitmap-populate job"
>>    <20200902181831.2570048-1-eblake@redhat.com>
>>    https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg00978.html
>>    https://patchew.org/QEMU/20200902181831.2570048-1-eblake@redhat.com/
>>
>> Since we have "coroutine: true" feature for qmp commands, I think,
>> maybe we can merge allocation status to bitmap without bothering with
>> new block-job?
>>
>> It's an RFC:
>>
>> 1. Main question: is it OK as a simple blocking command, even in a
>> coroutine mode. It's a lot simpler, and it can be simply used in a
>> transaction with other bitmap commands.
>>
> 
> Hm, possibly... I did not follow the discussion of coroutine QMP commands closely to know what the qualifying criteria to use them are.
> 
> (Any wisdom for me here, Markus?)
> 
>> 2. Transaction support is not here now. Will add in future version, if
>> general approach is OK.
>>
> 
> That should be alright, I think. It means that the operation needs to succeed before the transaction returns success, though.
> 
> Depending on what else is in the transaction, do we run the risk of a deadlock if we need to wait for a coroutine to finish?
> 
>> 3. I just do bdrv_co_enter() / bdrv_co_leave() like it is done in the
>> only coroutine qmp command - block_resize(). I'm not sure how much is it
>> correct.
>>
> 
> See above concern!
> 
>> 4. I don't do any "drain". I think it's not needed, as intended usage
>> is to merge block-status to _active_ bitmap. So all concurrent
>> operations will just increase dirtyness of the bitmap and it is OK.
>>
> 
> That sounds fine for individual usage, but I can't convince myself it's safe for transactions.

qmp_transaction do drain itself.. Still, it's a bit strange that it does just drain and not drained section around the whole logic.

> 
>> 5. Probably we still need to create some BdrvChild to avoid node resize
>> during the loop of block-status querying.
>>
> 
> I'm less sure that it's OK to cause temporary graph changes during the course of a blocking QMP function... but maybe that's OK?
> 
> Peter Krempa is the expert to consult on that one.
> 
>> 6. Test is mostly copied from parallels-read-bitmap, I'll refactor it in
>> next version to avoid copy-paste.
>>
>> 7. Probably patch 01 is better be split into 2-3 patches.
>>
>> Vladimir Sementsov-Ogievskiy (2):
>>    qapi: block-dirty-bitmap-merge: support allocation maps
>>    iotests: add allocation-map-to-bitmap
>>
>>   qapi/block-core.json                          | 31 ++++++++-
>>   include/block/block_int.h                     |  4 ++
>>   block/dirty-bitmap.c                          | 42 ++++++++++++
>>   block/monitor/bitmap-qmp-cmds.c               | 55 +++++++++++++---
>>   .../tests/allocation-map-to-bitmap            | 64 +++++++++++++++++++
>>   .../tests/allocation-map-to-bitmap.out        |  9 +++
>>   6 files changed, 195 insertions(+), 10 deletions(-)
>>   create mode 100755 tests/qemu-iotests/tests/allocation-map-to-bitmap
>>   create mode 100644 tests/qemu-iotests/tests/allocation-map-to-bitmap.out
>>
> 


-- 
Best regards,
Vladimir

