Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3BB388762
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 08:12:54 +0200 (CEST)
Received: from localhost ([::1]:60180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljFRt-0004OL-Fv
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 02:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljFQw-0003au-Rl; Wed, 19 May 2021 02:11:55 -0400
Received: from mail-eopbgr80128.outbound.protection.outlook.com
 ([40.107.8.128]:10439 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljFQt-0005lN-9H; Wed, 19 May 2021 02:11:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZppKqRbsaAiotB2icVIWCHDhUXAS6NkkGXFXVVojuXe4Z7//F7wMyB1WMf4VEOkpidoWEdT5u/OT5dIAibe+BDKYGhyAGX+GZrzA3OQGj76PsBJt55AWaEF9dw7u5Lzg/Cs2WPPzYEGIQjcu6jsiKpO/J2+foAy/dEpzHv/JC62sAbB34BFspTK4tA2qm6UlFeSychR6khSqFS/WVOjmrRVwJTfUUW+XmvqJUU+wf/QG/pvYNG3/3dlCJkVKN8bwyAktPMvBETE7uy0xGBx7F2vLmJqsWt63/4r7sHyPGQ19YPKI9/rw2Op36KEZMEGVpu8vrlsYiGr1JpV7WRoA7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yqxflh2SxT1VzK+OxSThsVEXDUQ+LPSW60H9mPTtQbw=;
 b=HhZzHwYKHjlUwCBylWImYwn5BO+jmRIsxMgocdD30feiozfWvC+vRsqaurGgIegM7ypVWRSBPfdpR8M2k1jtT+xPXUEJectVffVfh+Y34SfuN0jp6qieoP1UbMfJc4gcP+sEgtalb3X9FPm80H5eMjV2yHe3sga/yNVNtfDVgnxCE3/LVKO+FrZqkWIL8+yPhaCCjOLG8xll/PADyzhrbGje7RuI6VGXhSrLXZnD21ygC4LwT7AjPVq+S/82PB/qSnRpPGTjxDJOUpHoCPGw/7lTGuvaoc9NnmTT1lNmnU+KxWDYv9kNDEmgYPCWog9zF58jOAraJN1+CV5IbT2Klg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yqxflh2SxT1VzK+OxSThsVEXDUQ+LPSW60H9mPTtQbw=;
 b=aPMnKKuaGHqao3eCTkuGX3iBAqh6WSFHtdeizV2qEZlC15GewevU6wWJsz3kEzbfOXdQhkAKy7isYEdg52QkNzwlWoyfYFQ2QX0yMiWtGPqiwsBnDQbhMfbS75/gUeBu8oGDm0KBgvhkOCc0OJnbOOEeyt0WGXQdcqyRlhK9I1w=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2611.eurprd08.prod.outlook.com (2603:10a6:203:a2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 06:11:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 06:11:47 +0000
Subject: Re: RFC: Qemu backup interface plans
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>,
 Nikolay Shirokovskiy <nshirokovskiy@virtuozzo.com>,
 Dmitry Mishin <dim@virtuozzo.com>, Igor Sukhih <igor@virtuozzo.com>,
 yur@virtuozzo.com, Peter Krempa <pkrempa@redhat.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>
References: <ad71ced7-d0f6-5d99-4678-7d0e2d3e2561@virtuozzo.com>
 <eba2f2c5-a867-91bc-64ab-08dcd67a295d@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e3853894-ec71-bdd4-adea-b61fceee4ba5@virtuozzo.com>
Date: Wed, 19 May 2021 09:11:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <eba2f2c5-a867-91bc-64ab-08dcd67a295d@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.218]
X-ClientProxiedBy: ZR0P278CA0025.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.218) by
 ZR0P278CA0025.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1c::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 06:11:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6907ff2b-623c-4c44-bb87-08d91a8cfb95
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2611:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB26113314ADC4B2CB1AFC576CC12B9@AM5PR0802MB2611.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XBGIsf35gBuXspyeJJyv+4OaYhpe+ResFz2Kil/1NsuYEzcGrT0UCPxjBAjlqRVhYzs4v6LjEyt4yaKSLJe0wGlfaJK+5HqZtAQB7Z2Hl8tMxSlUnESmyWdJDfdA6FIfKCnFHx2tfFjZDDBAuk+OtjuXBgnyCeI//JOWy220IW3Rgm5L+zT4jNXWrs/0L5QVd/DyKaBemeseDuiOT9yJQQSZECH8niMQ6KBA4XcWmy647fbN3H/3WrtS497ng6hFUJfNtcCJAUr3OTxGVoc/+8jVb9DJXL8lF6noqWHF90LK5+rSN5L0U/5Bi+LsW3K9JmlhI19co5IubQDmXkuXYFgRO9j9A76pnnV0MZVgcFLw3jZ7CjqXUJDw98Zbz8ys5WnYKpH8mpJJYMLRcA0yteZHKMzeQ+9PqwcywgZW5Jv+d7a2UtZX43swuYb7PDSvc87+xblTiF2/VoXwGqV8NwhoNRK+zK7FZU8LFrsvQdCj5Vrq+EvWYp+ZbgbD+uDrPrUjSdijkw9EjDdXb/WuvSryAGj+lnzTNQjdsOES+LX6iRKYgKy8V8PgseRxJSlhwAXFG9OEUqaAnSqQ1zlbZ2DngnP+/vKTkjJVoP81/2tCqnv8PeEThsjASERdeTl7NZUIA+3Q4X3NYQm41trW8mmB+8AdX830A/PnCbVa3ttd4YvGw9hAVOWZxTfB6n8WHneP+0FUNYqlEFJIeEnjY1RQd4XRrnlstSCiq5h+pAN8M4SeB/vc+WWrSFTf94U64qhy5Gex+SyT9ziS4vnyx6KF2z8Zo9oxq1xVfqAslj0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(376002)(396003)(39840400004)(38350700002)(38100700002)(83380400001)(5660300002)(30864003)(66476007)(966005)(26005)(478600001)(66946007)(4326008)(66556008)(31686004)(53546011)(52116002)(6486002)(54906003)(86362001)(8676002)(2906002)(8936002)(36756003)(31696002)(956004)(2616005)(16576012)(316002)(186003)(16526019)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UDgzbEhZZU54TDVLMjlBU01YVVllM2xlbW1GOGwwUEVaTENwL0xmV1d2OHgx?=
 =?utf-8?B?V0l2UFprUnJkV0JsVHBsVnAxOE9MUUJSbVl5b2lpbEgvWkRza0wyODFwemcv?=
 =?utf-8?B?SVZuVVFOd0ltTkgrSFN1a0h2cWlFMlZBYnMvaDJCNVJqLzlKUFdRUTJ4elgw?=
 =?utf-8?B?SWYxckp5NWo3SjBkRlZkQitxczJpQWQzMHZybkZaU040R2Rrb2NoV29RY1NB?=
 =?utf-8?B?YTQwSEhPSUE0RHhhbUJyNklDYVlrakl1UVg2Zk1TMDAzQlNWRmladjJ2eGFX?=
 =?utf-8?B?TXQ1bDZXVGw0RS9qVlBqQzZoSzhlQW9ZRHN1RWVlUndWbEt0LzNCeWxEWlVF?=
 =?utf-8?B?WHE4TVlCNDNWT0d0ZUdCOERYUjRSQmVIdVJuaHpBN0JoQzVEUHV3OHNQSHlS?=
 =?utf-8?B?R0xoMC8xdkh3cjhGOWZKSmVGajZqakJsRzNLckNOWGQ0eXFhZHBRUm5sVVlD?=
 =?utf-8?B?UUF2T2VwUUMyRmZrZVhJSE9vVDlBd3AzMk1CRFNmdGJ4QytZM3pmVGQ3a3hG?=
 =?utf-8?B?eVlYZEFsQThneVliTXNyWEIwOTZuZGZwdVdaUUY0dGVzbC9lSUExWjVXOGx0?=
 =?utf-8?B?bVRCRHhMb0hxVVY3SmNjSDcycUZycVRkZVIzMVVJT2J1MmkvbzJvbVgrcjBB?=
 =?utf-8?B?cU1DbXk1UDNkT1NvSjV2dmpyc3pGdERiSC84aEQ0dUgyME5meG1IVm1CQUk0?=
 =?utf-8?B?ZTNxS1BsMUE3YlNPMzFITUFPbERpeWx0cHArcjNraDhsaFFLSlIxbkp3cTEw?=
 =?utf-8?B?OW1qK3lXQWpUdS9xTXBuOG5mOWxSUEU0NnRTQlhUb2hsSUxjVkJScHYrNEtP?=
 =?utf-8?B?UTZucU5UVkh3R0QvMGc0Tkw1YzJ4MXk5T28rNytqOVhTUFg1MGlZa3RBbmNR?=
 =?utf-8?B?VmNKeXJWLzgwZVNSSDhOenc5bWZhZzBPM0ZvSmE5bno5M1k3OGhPZnBtMmdp?=
 =?utf-8?B?S1NyUTNiRnZaTzJVd1BpSXZxME80dUpsQlAvTG04TDNMNi9FdFBjaWludUZp?=
 =?utf-8?B?OThQUlRSNnlxMXpQR1Y0ZFdFemRjMzBZWmdOVmtkRTNNbWE2R0Z6Tm1kYm1Q?=
 =?utf-8?B?UXAvU01MSWo1N0VTYTlsck1XSC96Z25acXcyNHNyeXBEYXQ2SitoaTVQNEVu?=
 =?utf-8?B?dDN2VE52YnZuNGdyazJhR3JFVkJpL1dwT3NXeTNORllmMXBoTmRZZ2xFL3hS?=
 =?utf-8?B?bHIyVS9aZFhXUGZkc0JwVTJLM0tmNlpXTUJzTlB6SjNYQVVnMVpWQVhHclBw?=
 =?utf-8?B?NUxYdk9hRW1QTnpiUW8ySk1hNDRZQnR0ak9IZEpBWWVia2w4SThqRDB6Mjd0?=
 =?utf-8?B?NjRBVU9WSFVOdGpCeklvNkxTeThhRW8ybDlmWmFJRGJ2cUpXQ3MzejV1V0di?=
 =?utf-8?B?QXBsQ2JKdnBHZVNQY2JoZ2xLUk52WkNqZmcrS3VUbXdOcmQ2ZlIvcExHYVdu?=
 =?utf-8?B?eHlrQnpzUmlVNHZrb3BJdDFwek40MDVTOUFtV3VrUm1IZ3NyTFhKdStOTHIy?=
 =?utf-8?B?TFRPUzNYVTJveGtjcU9RdGJSQy9EWWYzUDhzWmlkYkZ6MEY5RlhPN3RpcEJL?=
 =?utf-8?B?T09jYTluaDhwaVNvRTFzSzc1L2N5VUdJOUFNRnFQM3A0MkZPRDF5ZVhhcm4x?=
 =?utf-8?B?VVFZR1VUZkM5b2MzVDhDRzJPZ2hhd2NkTUNUU2h6WWR2KzRMbXJLUjV5eGsw?=
 =?utf-8?B?MUwvSGNYam5DYWUxVEowbmZkZmExRGF3SDdweVBFRUcrUkhBK3ZJV1dwTDlJ?=
 =?utf-8?Q?TA7rs9eS6IiJS5ecJS6lDKDS4CMBy2K6JnUEF9k?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6907ff2b-623c-4c44-bb87-08d91a8cfb95
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 06:11:46.9816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yGEzJVHJ5FqKx9Gsly3cy4KxTEewLAEVzbilbpCu9rwsiQfEn2rjE+21qhlFeTq5vNth7ehVAFkAtS9vBcjNTZvYPJACI/X/XaR15jEBy0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2611
Received-SPF: pass client-ip=40.107.8.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

18.05.2021 19:39, Max Reitz wrote:
> Hi,
> 
> Your proposal sounds good to me in general.  Some small independent building blocks that seems to make sense to me.

Thanks! I hope it's not too difficult to read and understand my English.

> 
> 
> On 17.05.21 14:07, Vladimir Sementsov-Ogievskiy wrote:
> 
> [...]
> 
>> What we lack in this scheme:
>>
>> 1. handling dirty bitmap in backup-top filter: backup-top does copy-before-write operation on any guest write, when actually we are interested only in "dirty" regions for incremental backup
>>
>> Probable solution would allowing specifying bitmap for sync=none mode of backup, but I think what I propose below is better.
>>
>> 2. [actually it's a tricky part of 1]: possibility to not do copy-before-write operations for regions that was already copied to final backup. With normal Qemu backup job, this is achieved by the fact that block-copy state with its internal bitmap is shared between backup job and copy-before-write filter.
>>
>> 3. Not a real problem but fact: backup block-job does nothing in the scheme, the whole job is done by filter. So, it would be interesting to have a possibility to simply insert/remove the filter, and avoid block-job creation and managing at all for external backup. (and I'd like to send another RFC on how to insert/remove filters, let's not discuss it here).
>>
>>
>> Next. Think about internal backup. It has one drawback too:
>> 4. If target is remote with slow connection, copy-before-write operations will slow down guest writes appreciably.
>>
>> It may be solved with help of image fleecing: we create temporary qcow2 image, setup fleecing scheme, and instead of exporting temp image through NBD we start a second backup with source = temporary image and target would be real backup target (NBD for example).
> 
> How would a second backup work here?  Wouldn’t one want a mirror job to copy the data off to the real target?
> 
> (Because I see backup as something intrinsically synchronous, whereas mirror by default is rather lazy.)
> 
> [Note from future me where I read more below: I see you acknowledge that you’ll need to modify backup to do what you need here, i.e. not do any CBW operations.  So it’s effectively the same as a mirror that ignores new dirty areas.  Which could work without changing mirror if block-copy were to set BDRV_REQ_WRITE_UNCHANGED for the fleecing case, and bdrv_co_write_req_finish() would skip bdrv_set_dirty() for such writes.]

I just feel myself closer with backup block-job than with mirror :) Finally, yes, there is no real difference in interface. But in realization, I prefer to continue developing block-copy. I hope, finally all jobs and img-convert would work through block-copy.

(and I'll need BDRV_REQ_WRITE_UNCHANGED anyway for fleecing, so user can use mirror or backup)

> 
> I mean, still has the problem that the mirror job can’t tell the CBW filter which areas are already copied off and so don’t need to be preserved anymore, but...
> 
>> Still, with such solution there are same [1,2] problems, 3 becomes worse:
> 
> Not sure how 3 can become worse when you said above it isn’t a real problem (to which I agree).

It's my perfectionism :) Yes, it's still isn't a problem, but number of extra user-visible objects in architecture increases, which is not good I think.

> 
>> 5. We'll have two jobs and two automatically inserted filters, when actually one filter and one job are enough (as first job is needed only to insert a filter, second job doesn't need a filter at all).
>>
>> Note also, that this (starting two backup jobs to make push backup with fleecing) doesn't work now, op-blockers will be against. It's simple to fix (and in Virtuozzo we live with downstream-only patch, which allows push backup with fleecing, based on starting two backup jobs).. But I never send a patch, as I have better plan, which will solve all listed problems.
>>
>>
>> So, what I propose:
>>
>> 1. We make backup-top filter public, so that it could be inserted/removed where user wants through QMP (how to properly insert/remove filter I'll post another RFC, as backup-top is not the only filter that can be usefully inserted somewhere). For this first step I've sent a series today:
>>
>>    subject: [PATCH 00/21] block: publish backup-top filter
>>    id: <20210517064428.16223-1-vsementsov@virtuozzo.com>
>>    patchew: https://patchew.org/QEMU/20210517064428.16223-1-vsementsov@virtuozzo.com/
>>
>> (note, that one of things in this series is rename s/backup-top/copy-before-write/, still, I call it backup-top in this letter)
>>
>> This solves [3]. [4, 5] are solved partly: we still have one extra filter, created by backup block jobs, and also I didn't test does this work, probably some op-blockers or permissions should be tuned. So, let it be step 2:
>>
>> 2. Test, that we can start backup job with source = (target of backup-top filter), so that we have "push backup with fleecing". Make an option for backup to start without a filter, when we don't need copy-before-write operations, to not create extra superfluous filter.
> 
> OK, so the backup job is not really a backup job, but just anything that copies data.

Not quite. For backup without a filter we should protect source from changing, by unsharing WRITE permission on it.

I'll try to avoid adding an option. The logic should work like in commit job: if there are current writers on source we create filter. If there no writers, we just unshare writes and go without a filter. And for this copy-before-write filter should be able to do WRITE_UNCHANGED in case of fleecing.

> 
>> 3. Support bitmap in backup-top filter, to solve [1]
>>
>> 3.1 and make it possible to modify the bitmap externally, so that consumer of fleecing can say to backup-top filter: I've already copied these blocks, don't bother with copying them to temp image". This is to solve [2].
>>
>> Still, how consumer of fleecing will reset shared bitmap after copying blocks? I have the following idea: we make a "discard-bitmap-filter" filter driver, that own some bitmap and on discard request unset corresponding bits. Also, on read, if read from the region with unset bits the EINVAL returned immediately. This way both consumers (backup job and NBD client) are able to use this interface:
> 
> Sounds almost like a 'bitmap' protocol block driver that, given some dirty bitmap, basically just represents that bitmap as a block device. *shrug*
> 
> Anyway.  I think I’m wrong, it’s something very different, and that’s clear when I turn your proposal around:  What this “filter” would do primarily is to restrict access to its filtered node based on the bitmap given to it, i.e. only dirty areas can be read.  (I say “filter” because I’m not sure it’s a filter if it restricts the data that can be read.) Secondarily, the bitmap can be cleared by sending discards.

What rethink filters as "drivers that not contain any data, so filter can always be removed from the chain without loosing any data"? And allow filters to restrict access to data areas. Or even change the data (and raw format becomes filter).

Note that backup-top filter already may restrict access: if copy-before-write operation failed, the filter doesn't propagate write operation to file child but return an error to the guest.

> 
> You know what, that would allow implement backing files for formats that don’t support it.  Like, the overlay and the backing file are both children of a FIFO quorum node, where the overlay has the bitmap filter on top, and is the first child.  If writing to the bitmap filter then also marks the bitmap dirty there (which it logically should, I think)...  Don’t know if that’s good or not. :)

That's interesting. I've never heard of requesting such a feature still.. But it may influence how to call this filter. Maybe not discard-bitmap-fitler, but just bitmap-filter. And we can add different options to setup, how filter will handle requests.

For example, I need the following:

+-------+------------------+---------------------------+-------------------+
|       | read             | write                     | discard           |
+-------+------------------+---------------------------+-------------------+
| clear | EINVAL           | propagate to file         | EINVAL            |
|       |                  | mark dirty                |                   |
|       |                  | (or may be better EINVAL) |                   |
+-------+------------------+---------------------------+-------------------+
| dirty | propaget to file | propagate to file         | propagate to file |
|       |                  | (or may be better EINVAL) | mark clean        |
+-------+------------------+---------------------------+-------------------+

And to realize backing behavior:

+-------+----------------------+-------------------+--------------------+
|       | read                 | write             | discard            |
+-------+----------------------+-------------------+--------------------+
| clear | propagate to backing | propagate to file | maybe zeroize file |
|       |                      | mark dirty        | mark dirty         |
+-------+----------------------+-------------------+--------------------+
| dirty | propagete to file    | propagate to file | propagate to file  |
+-------+----------------------+-------------------+--------------------+

> 
>> Backup job can simply call discard on source, we can add an option for this.
> 
> Hm.  I would have expected the most straightforward solution would be to share the job’s (backup or mirror, doesn’t matter) dirty bitmap with the CBW node, so that the latter only copies what the former still considers dirty.  Is the bitmap filter really still necessary then?

Yes, I think the user given bitmap should be shared between all the consumers. Still, internal bitmaps of block-copy entities would be different:

For example, second block-copy which do copy to final target clears bits at start of operation, and may reset them to 1 if copy failed for that operation. If in a meantime guest write, copy-before-write filter should do block-copy, and it doesn't matter that in second block-copy bits are zero.

Or another: first block-copy (in copy-before-write filter) marks bits of its internal bitmap zero when cluster copied. But that bit has not relation to should second block-copy do copy of this cluster or not.

Now internal bitmap of block-copy just initialized from user given bitmap and then user given bitmap is unchanged (except for backup job finalization if options says to transactionally update user given bitmap, but I think this mode is not for our case). We'll need a possibility to modify user given bitmap so that it influence block-copy. So block-copy will have to consider both bitmaps and make AND of them.. Or something like this. We'll see, how I implement this :)

> 
> Oh, I see, discarding also helps to save disk space.  Makes sense then.

Note also, that I want the fleecing scheme to work in the same way for push-backup-with-fleecing and for pull-backup, so that user will implement it once. Of course, block-copy could have simpler options than adding a filter and additional discard logic. But for external backup it seems the most straightforward solution. So, let's just reuse it for push-backup-with-fleecing.

> 
>> External backup tool will send TRIM request after reading some region. This way disk space will be freed and no extra copy-before-write operations will be done. I also have a side idea that we can implement READ_ONCE flag, so that READ and TRIM can be done in one NBD command. But this works only for clients that don't want to implement any kind of retrying.
> 
> [...]
> 
>> This way data from copy-before-write filter goes first to ram-cache, and backup job could read it from ram. ram-cache will automatically flush data to temp qcow2 image, when ram-usage limit is reached. We'll also need a way to say backup-job that it should first read clusters that are cached in ram, and only then other clusters. So, we'll have a priory for clusters to be copied by block-copy:
>> 1. clusters in ram-cache
>> 2. clusters not in temp img (to avoid copy-before-write operations in future)
>> 3. clusters in temp img.
>>
>> This will be a kind of block_status() thing, that allows a block driver to give recommendations on sequence of reading to be effective.
> 
> You mean block_status should give that recommendation?  Is that really necessary?  I think this is a rather special case, so block-copy could figure that out itself.  All it needs to do is for any dirty area determine how deep in the backing chain it is: Is it in the ram-cache, is it in temp image, or is it below both?  It should be able to figure that out with the *file information that block_status returns.

No, I don't propose to extend block_status(), it should be separate interface

> 
>> Not also, that there is another benefit of such thing: we'll implement this callback in qcow2 driver, so that backup will read clusters not in guest cluster order, but in host cluster order, to read more sequentially, which should bring better performance on rotating disks.
> 
> I’m not exactly sure how you envision this to work, but block_status also already gives you the host offset in *map.
> 

But block-status doesn't give a possibility to read sequentially. For this, user should call block-status several times until the whole disk covered, then sort the segments by host offset. I wonder, could it be implemented as some iterator, like

read_iter = bdrv_get_sequential_read_iter(source)

while (extents = bdrv_read_next(read_iter)):
   for ext in extents:
     start_writing_task(target, ext.offset, ext.bytes, ext.qiov)

where bdrv_read_next will read guest data in host-cluster-sequence..


-- 
Best regards,
Vladimir

