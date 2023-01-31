Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D8C683507
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 19:19:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMvD1-0000Gm-2a; Tue, 31 Jan 2023 13:18:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pMvCx-0000Fv-PT; Tue, 31 Jan 2023 13:18:15 -0500
Received: from mail-am7eur03on20718.outbound.protection.outlook.com
 ([2a01:111:f400:7eaf::718]
 helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pMvCv-000461-3O; Tue, 31 Jan 2023 13:18:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bpTeMWJivxQcxG8F3hBfi/j65PaGqrjL6oSajVRC0KHPadsXPwnKAKBKI1qBGo3aOzswBEXTN4TbQg8u4b0WxdyrB/QPyiU9K20pbbL/q3LwUxufpeOJlPiCJXiVYtqtcSCREW0XzHLStySMJ750PNNluN7hsnykr/1KENVFRbhS9VG4xODdf0Hem1xZjKVnSkz+bQt7EUyKbJH+lMfEq2nkh8OjmMKvRCQycyq9nNSrzTXEh3myPUBDDGBbgFySOT5KZO/1E6xfHad7c1u4HOFv2fNMf02x6GCoVbCmAScCLW3KicL62obmz0nzfXbtdnq/4YNb3t8xwWV/CLO6zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7j1cEOPY52lTHrTm0jk3N5PJMHF43EvU6BL4L1ruIM=;
 b=Rhl3gnDtzvTaqeeh2m3NlNv3ZLK9739r+qn3aTSjn4ES9oasXz2zaa2xYCYNK2jNXaUNezBAx/Km8tOUcO1n4DdCvdTW1UQ2w6JcTfo6XsLOESpAWppuiylSfyJOZ2cRWNGNTtUYK3hu4ezG8CfBIWnePKqS1PwVgiBbxp65n11OAs5NRaqhptBPwKxpGOuJ34nDt6PLMHlQ7aecTmoky68t6z7e2l0k2lOT3VOrhS3xHUJh2wx4gv2uLLmYx0IuOq/FEy0uDOYVJESDx0ntWTKdddeitmirI5QI+nl1uKHfBhex8loql/Tlq+8MG7vEJ23cGiL6kBMKaCWB46SZXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7j1cEOPY52lTHrTm0jk3N5PJMHF43EvU6BL4L1ruIM=;
 b=CgPDeWzd7oL2DCwP96zHXwz+CNZWY1SWr5KLWhDmzlI7qeetwRxdZdfRKudEiRgYZAu5gBsuQyTO9LH4eIODKEgrhBpA/xIggSSdy6FK52LrIF15l2dfgVnGZkj4XCvLsCTQYAevS/a89k9Nz4Ea2kzOJZGwGlzZ7ZOGwep88WIdLtrcXV90eGgj5jmlOVMykvr6oxDqm5p1osWdELSKQmwkei0pvQSN8xaasNXI7IJw+K3gyk+6LOwNdC09HSNV/03l1L0CyDTRmHJf8WC9h3ClwA9EZkFVYUZlfHT8rK7vNFppKZarI3CELNKDhaZWxJ1V26g96x/gKNEPHJFrog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AS4PR08MB7783.eurprd08.prod.outlook.com (2603:10a6:20b:517::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 18:18:08 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0%4]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 18:18:08 +0000
Message-ID: <926be172-1d8a-e896-c051-3c37d048771b@virtuozzo.com>
Date: Tue, 31 Jan 2023 19:18:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] block/mirror: add 'write-blocking-after-ready' copy mode
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Fiona Ebner <f.ebner@proxmox.com>, qemu-devel@nongnu.org
Cc: t.lamprecht@proxmox.com, jsnow@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, eblake@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, Alexander Ivanov <alexander.ivanov@virtuozzo.com>
References: <20221207132719.131227-1-f.ebner@proxmox.com>
 <c120932d-a1a7-5904-3f17-10a7c9ac69af@yandex-team.ru>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <c120932d-a1a7-5904-3f17-10a7c9ac69af@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0120.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::18) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|AS4PR08MB7783:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c00dd58-0c65-4877-4d65-08db03b780d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3TBjJt+n8y1XkoEZDAnRrEW/JtfHEVGPWIBnKrwoDj14f7bch9/SbH0qUqQ53p6UbBbj3kqB0lsSTRWhQJAeM1qi40BkRBazC9Gh30dXkjYrPEuVB2137Kp86LxHQhEO4KxeLQTzQa0dBkKPjckYk5m1I16BnPW5dEy5dTpe88PPJRsq+jp53iUlv7vD3IEb6POSwwM39DXjxjOIE6dVq5Pabgf35/guR/pdjQbWamI6E5X94/WAugotihSW0gDIoAkryX5Ugl3BiAJfZayyMjNQBZU8U7HZtMfSSxR1bD5/3qFbdZBEycqtHGoxiAIPRJEcHpQWbx0KVaG5POV1EqObeyyxdyo6dfkGUKo8LZ2U7hs/2zw2pnc+A7c5tJRKFOj+OAfhfthxcrVELkS4eZgL4aKIaumAylEYvKLC3o4iE3NQN5dmE8ZZpTlZLOW96r2eGcVmcK9eKCvubXPpku8q+0yQVm1GC1O4KSHFX8C11UPsz/pU43zQjISNXRtIN8jDFfeHyVDLxZq0wcVtUceXmHjfc3FvFtm6UdAFeNGZGLTUQqLOpK1wwz2OEA6Pv22a0N+Ba56zj2LAngcOstdARkVInlp8Z50h8L5zma7tBRxyIXZqpVQn7Sw2O75w3KVLBWEUx3XF1LZCoOzpqOk3jHTc3FBA2tBrX+9zD2XO0hUmS8krzyOeQBn0dp3hMNGVkmrPqJQIabphZtWELVI2C9O66Eq8cna/MkBrDJyBS9DBO28R7WgkjCfBcvf/HB6iHPKbgnfEgEumEl7cBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(366004)(346002)(39850400004)(376002)(136003)(451199018)(31686004)(36756003)(5660300002)(2906002)(7416002)(38100700002)(66899018)(86362001)(966005)(478600001)(6486002)(2616005)(6506007)(6512007)(26005)(186003)(53546011)(31696002)(110136005)(83380400001)(8676002)(4326008)(66476007)(66556008)(66946007)(8936002)(107886003)(316002)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVo3WmcvNllrOUlKUEFQSU9zK3loVXdUQmM4THlKd3U4WkFOamx6Nk1ubkc3?=
 =?utf-8?B?WlVCN3JVcUF5UzkrWjBFS081Ulh3NkZnVXdzWCtGN2E5UlUyVlN5OWFXVFE1?=
 =?utf-8?B?bXBjanEzT2h4RGJsV09mdXpkdzgyRVorVU5mODM1MENVaEFOUXlzQ0ljb3Nh?=
 =?utf-8?B?YVR3czk0NXJBbnJzQ0VNeXVuSU9qNGNGS083b2JHME5iVllsOExNR1Z0eFlR?=
 =?utf-8?B?ZmVKam1iQjFvQldLN0pVZWVodnVYNENHQStZaWdvOXEzRS82OXU5RUFRTWNx?=
 =?utf-8?B?dlhqZGsrUzB5MzJXbDR6dEtndS9Ub2YzdmJ3NVh3RnY2ZnFpOG9SS1JvUjMv?=
 =?utf-8?B?S0l2T3ZoTU8xWVVqcncyMVZBNnIzb0d4NWI4ZndWM3NSbHpmcC9UK0g5M3pF?=
 =?utf-8?B?YTZLSUVuRjZDbXN6aE54Y3BkK2txRHB0cGJSY1RWa1BiVU94VURnOGxPV2Rm?=
 =?utf-8?B?QTRnUkd5a0E2SENPeUEzeWpYaitwUk8rUUpIN3BSZFJlR0JacnZWVUIvUGlw?=
 =?utf-8?B?TVdQWnhKK04zR1A2L284ekhEb2VOK0ZCMkd4TmgrUEVDZ0xQem9RcWZkbURh?=
 =?utf-8?B?ZGRETEI2bE5FblBydVFydDBERE1IeEZhQ0pMYXZESTVScTNGcjFIZFZuNENC?=
 =?utf-8?B?V1pxa1lTZk1wNy9ZWnk2b1JPM0IrSGJYNTRGK1dyZUNMTTFLS3JVNzFvZEZ2?=
 =?utf-8?B?YlgxWU8vRjlKZzBRVU1RV1E5K2VkYW1BN3NDTTQxZjFGNTZaU0ZSVmR5Qzgz?=
 =?utf-8?B?TkJ4djMyM1AyVUUybjZ1OXpsaHEzc0s3M0EwanJZT3RBa2hnUWtLVjdyYlJW?=
 =?utf-8?B?aWNta0FCdmdtOS9vazZ6VXUwa1dGRXNHZGY3UGFIYy84cFlwN0ExQXpKemF3?=
 =?utf-8?B?SDhtSU1wb3RML0xsTUxtVC9RZFNpeXRVcjByRUFiWTA3OUpRVXZpbDd4bmpX?=
 =?utf-8?B?YU8rK3VETUU0YkVBRmdWMTRpT0tmaWFSaHdWQWpIbXNqeXlPTnhMVXRKVXZO?=
 =?utf-8?B?cnlRd2xJV21zMWVBcUptdDY5amJzT3pNTnZqUktMRkJkemNXM1BLYmpyUFMz?=
 =?utf-8?B?bkNFWnI4bmtxV1BGR2JtS2dvenVGQ0NHRndwZElMUWNiNTdUdVlIRENGeVpK?=
 =?utf-8?B?MTNQVFBwdnEvRFVTWlB6emlaMEVtalh3OHVnejk3VUhpYnJKek1abmVaTmRq?=
 =?utf-8?B?MXpROW14Z1ZONk1MYXpJMVMxMnlUTXNQc0RNZ0l6VndnMWFFdDhyN1V1Z3h3?=
 =?utf-8?B?V2o2VXlRYitsVytVT0ZTek5GZzVMdEY0WHFDWGhxMVVBYjl6UjNpOEU0NS9S?=
 =?utf-8?B?VHMveEFmaXNwd0dyKzRmRVA4cXQrUWhuMjEzY21hWlYwNDJWRFFSLzBsTmE4?=
 =?utf-8?B?MkpvTlZCeXkrMWZROGwxa0J0UGtTMnI4NmsreGJNalBTZmg4UGp6bFBjQ25h?=
 =?utf-8?B?RTZvbzFieTBDbTlrd3ptMERHbVNkTnB3M2MvNFRyQXV4cC9uL1JvS2NKTGFL?=
 =?utf-8?B?cXZSMG1UcUJyTDRCNUx5M3JqK05pdTVrWlVWeUNxVldaYTFWeHZONm02QkFZ?=
 =?utf-8?B?dHBqamhKRHIxMWJzcFpWcC9WK0hjVXVyTE1MNjhpcEFTN0NrYkNpVG03b3hE?=
 =?utf-8?B?TzVMSmZTbmU4a3VmRCtZd21kaE5YNkp6bS9RL0hZSElOYXVHS1c4Uzg1dUZV?=
 =?utf-8?B?K3NPVDhidXFYalRKS09pN1N3NUlYejEvNkhJWVVxRG1NZ0pUNnZMQ2VZSWxy?=
 =?utf-8?B?azEvaFBoSW84V1FrbmFKMWVjeVlEVjFkZklMd3F1T3doL2w3NVprWUsydC9v?=
 =?utf-8?B?VVNwQnNXVkZwWjFiNEY1TVZ3dm5JcFNhUUd0Mllvdkxya256WHpTTzJVMkU1?=
 =?utf-8?B?MitDOGV1bGhyMlo4ZVhhYkZjTnNGMkp4Vk43a3lJcTk3VjNZZDE2dEViOWhs?=
 =?utf-8?B?WUYxcHhIRHVoc2JITmorSlJOQ2IvZTRkWlMrMEQ4UTlHODFESzNVMWVYbzRK?=
 =?utf-8?B?VE9VMzFrdWJxY0VydEVpb2loblN5SVZIMTd2Mk5MUGJUcWhYeVhmekxXcURo?=
 =?utf-8?B?VENXdHJxd1pvdDdpb2dtaVlqQ1hZOW54MTYwQi8waUtoYXRkdnc0MS9Wd0E4?=
 =?utf-8?Q?JnAm/u42md14wXoyuOfgPlzc0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c00dd58-0c65-4877-4d65-08db03b780d1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 18:18:07.9405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OEDhPr40qjV5OeZmQthgwXeULKoZVAYMtizzBJjcVl/CfI3ST5YKbafwoz7iiPOkYJHz6DqRoWjGzNO7ki8kgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7783
Received-SPF: pass client-ip=2a01:111:f400:7eaf::718;
 envelope-from=den@virtuozzo.com;
 helo=EUR03-AM7-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/31/23 18:44, Vladimir Sementsov-Ogievskiy wrote:
> + Den
>
> Den, I remember we thought about that, and probably had a solution?
>
> Another possible approach to get benefits from both modes is to switch 
> to blocking mode after first loop of copying. [*]
>
> Hmm. Thinking about proposed solution it seems, that [*] is better. 
> The main reason of "write-blocking" mode is to force convergence of 
> the mirror job. But you lose this thing if you postpone switching to 
> the moment when mirror becomes READY: we may never reach it.
>
>
>
> Or, may be we can selectively skip or block guest writes, to keep some 
> specified level of convergence?
>
> Or, we can start in "background" mode, track the speed of convergence 
> (like dirty-delta per minute), and switch to blocking if speed becomes 
> less than some threshold.
>

That is absolutely correct. It would be very kind to start with
asynchronous mirror and switch to the synchronous one after
specific amount of loops. This should be somehow measured.

Originally we have thought about switching after the one loop
(when basic background sending is done), but may be 2 iterations
(initial + first one) would be better.

Talking about this specific approach and our past experience
I should note that reaching completion point in the
asynchronous mode was a real pain and slow down for the guest.
We have intentionally switched at that time to the sync mode
for that purpose. Thus this patch is a "worst half-way" for
us.

Frankly speaking I would say that this switch could be considered
NOT QEMU job and we should just send a notification (event) for the
completion of the each iteration and management software should
take a decision to switch from async mode to the sync one.

Under such a condition we should have a command to perform mode
switch. This seems more QEMU/QAPI way :)

>
> On 07.12.22 16:27, Fiona Ebner wrote:
>> The new copy mode starts out in 'background' mode and switches to
>> 'write-blocking' mode once the job transitions to ready.
>>
>> Before switching to active mode and indicating that the drives are
>> actively synced, it is necessary to have seen and handled all guest
>> I/O. This is done by checking the dirty bitmap inside a drained
>> section. Transitioning to ready is also only done at the same time.
>>
>> The new mode is useful for management applications using drive-mirror
>> in combination with migration. Currently, migration doesn't check on
>> mirror jobs before inactivating the blockdrives, so it's necessary to
>> either:
>> 1) use the 'pause-before-switchover' migration capability and complete
>>     mirror jobs before actually switching over.
>> 2) use 'write-blocking' copy mode for the drive mirrors.
>>
>> The downside with 1) is longer downtime for the guest, while the
>> downside with 2) is that guest write speed is limited by the
>> synchronous writes to the mirror target. The newly introduced copy
>> mode reduces the time that limit is in effect.
>
> Do you mean that in (2) we don't use pause-before-switchover? So, we 
> have to wait for mirror-ready before starting the migration? What's 
> the benefit of it? Or what I miss?
>
you will have zero dirty data from block level and thus you need
to send only dirty memory (without disk). That is pretty much
correct.


>>
>> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
>> ---
>>
>> See [0] for a bit more context. While the new copy mode doesn't
>> fundamentally improve the downside of 2) (especially when multiple
>> drives are mirrored), it would still improve things a little. And I
>> guess when trying to keep downtime short, guest write speed needs to
>> be limited at /some/ point (always in the context of migration with
>> drive-mirror of course). Ideally, that could go hand-in-hand with
>> migration convergence, but that would require some larger changes to
>> implement and introduce more coupling.
>>
>> [0] 
>> https://lists.nongnu.org/archive/html/qemu-devel/2022-09/msg04886.html
>>
>>   block/mirror.c       | 29 +++++++++++++++++++++++++++--
>>   qapi/block-core.json |  5 ++++-
>>   2 files changed, 31 insertions(+), 3 deletions(-)
>>
>> diff --git a/block/mirror.c b/block/mirror.c
>> index 251adc5ae0..e21b4e5e77 100644
>> --- a/block/mirror.c
>> +++ b/block/mirror.c
>> @@ -60,6 +60,7 @@ typedef struct MirrorBlockJob {
>>       /* Set when the target is synced (dirty bitmap is clean, nothing
>>        * in flight) and the job is running in active mode */
>>       bool actively_synced;
>> +    bool in_active_mode;
>>       bool should_complete;
>>       int64_t granularity;
>>       size_t buf_size;
>> @@ -1035,10 +1036,31 @@ static int coroutine_fn mirror_run(Job *job, 
>> Error **errp)
>>           if (s->in_flight == 0 && cnt == 0) {
>>               trace_mirror_before_flush(s);
>>               if (!job_is_ready(&s->common.job)) {
>> +                if (s->copy_mode ==
>> + MIRROR_COPY_MODE_WRITE_BLOCKING_AFTER_READY) {
>> +                    /*
>> +                     * Pause guest I/O to check if we can switch to 
>> active mode.
>> +                     * To set actively_synced to true below, it is 
>> necessary to
>> +                     * have seen and synced all guest I/O.
>> +                     */
>> +                    s->in_drain = true;
>> +                    bdrv_drained_begin(bs);
>> +                    if (bdrv_get_dirty_count(s->dirty_bitmap) > 0) {
>> +                        bdrv_drained_end(bs);
>> +                        s->in_drain = false;
>> +                        continue;
>> +                    }
>> +                    s->in_active_mode = true;
>> + bdrv_disable_dirty_bitmap(s->dirty_bitmap);
>> +                    bdrv_drained_end(bs);
>> +                    s->in_drain = false;
>> +                }
>
> I doubt, do we really need the drained section?

Frankly speaking I do not like this. I'd better would not
rely on the enable/disable of the whole bitmap but encode
mode into MirrorOp and mark blocks dirty only for those
operations for which in_active_mode was set at the
operation start.

That seems much more natural.

>
> Why can't we simply set s->in_active_mode here and don't care?
>
> I think bdrv_get_dirty_count(s->dirty_bitmap) can't become > 0 here, 
> as cnt is zero, we are in context of bs and we don't have yield point. 
> (ok, we have one in drained_begin(), but what I think we can simply 
> drop drained section here).
>
>> +
>>                   if (mirror_flush(s) < 0) {
>>                       /* Go check s->ret.  */
>>                       continue;
>>                   }
>> +
>>                   /* We're out of the streaming phase.  From now on, 
>> if the job
>>                    * is cancelled we will actually complete all 
>> pending I/O and
>>                    * report completion.  This way, block-job-cancel 
>> will leave
>> @@ -1443,7 +1465,7 @@ static int coroutine_fn 
>> bdrv_mirror_top_do_write(BlockDriverState *bs,
>>       if (s->job) {
>>           copy_to_target = s->job->ret >= 0 &&
>> !job_is_cancelled(&s->job->common.job) &&
>> -                         s->job->copy_mode == 
>> MIRROR_COPY_MODE_WRITE_BLOCKING;
>> +                         s->job->in_active_mode;
>>       }
>>         if (copy_to_target) {
>> @@ -1494,7 +1516,7 @@ static int coroutine_fn 
>> bdrv_mirror_top_pwritev(BlockDriverState *bs,
>>       if (s->job) {
>>           copy_to_target = s->job->ret >= 0 &&
>> !job_is_cancelled(&s->job->common.job) &&
>> -                         s->job->copy_mode == 
>> MIRROR_COPY_MODE_WRITE_BLOCKING;
>> +                         s->job->in_active_mode;
>>       }
>>         if (copy_to_target) {
>> @@ -1792,7 +1814,10 @@ static BlockJob *mirror_start_job(
>>           goto fail;
>>       }
>>       if (s->copy_mode == MIRROR_COPY_MODE_WRITE_BLOCKING) {
>> +        s->in_active_mode = true;
>>           bdrv_disable_dirty_bitmap(s->dirty_bitmap);
>> +    } else {
>> +        s->in_active_mode = false;
>>       }
>>         ret = block_job_add_bdrv(&s->common, "source", bs, 0,
>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>> index 95ac4fa634..2a983ed78d 100644
>> --- a/qapi/block-core.json
>> +++ b/qapi/block-core.json
>> @@ -1200,10 +1200,13 @@
>>   #                  addition, data is copied in background just like in
>>   #                  @background mode.
>>   #
>> +# @write-blocking-after-ready: starts out in @background mode and 
>> switches to
>> +#                              @write-blocking when transitioning to 
>> ready.
>
> You should add also (Since: 8.0) label
>
>> +#
>>   # Since: 3.0
>>   ##
>>   { 'enum': 'MirrorCopyMode',
>> -  'data': ['background', 'write-blocking'] }
>> +  'data': ['background', 'write-blocking', 
>> 'write-blocking-after-ready'] }
>>     ##
>>   # @BlockJobInfo:
>


