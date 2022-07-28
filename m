Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 369FD583822
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 07:31:42 +0200 (CEST)
Received: from localhost ([::1]:59528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGw7Y-0000oy-Pu
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 01:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.zhadchenko@virtuozzo.com>)
 id 1oGw4n-0007S9-Eh; Thu, 28 Jul 2022 01:28:49 -0400
Received: from mail-dbaeur03on2097.outbound.protection.outlook.com
 ([40.107.104.97]:53089 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.zhadchenko@virtuozzo.com>)
 id 1oGw4k-0000Ya-Dq; Thu, 28 Jul 2022 01:28:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6kubXJBTshHW3toDaJRGwqoclqzLcdKLPdGInDgCTbIF+x++Q5l6yM1mNXcx+8UgguhcGfoz18mluDTefotnSCHAPDPeiWAA4NCkiM9tsQLhHaJzTd4L4B6ZAYIs7KHwM8GLH1nQtUlpKlXdZZ4tWU4BF8eUiOCBZ8dq2XO1EvK8Z9fstHnNfPEl6tV9YBNkQJz32hfg/dxfHX+U5zY1VSDJU/svHLSSvxr7hqtAlg+FgjdhQ0Ybtci2Xj6BmqbJO48sZ6RTKzAOyjBwiiueRRdy017ay6Qp+hA5MCbwuVVZpqzMzRwRBrCbomoq6BieOJTvAVR4WvPeWi+oKBO4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ApR2Ycpp6bEPUkqGn1znIZ0q3dIOFL1R3KD30wKtDJE=;
 b=hB+SSeciU5JltDpX9JAJOUwzarbkpUceV4GX3ZDWcCYRWWh0tSEg13sHpGd5+1HnxKBCwn/WhWAThMj1W8VRbwkdLt/mDx5aU4jYYqzbj0MYIpio+5zKj+hoLHjdf8D3PTrHlfqCc4WH+jRwk/BkF70bdfRDZTk+73tyetINI5y1RHbtCi62RaX9cmUCOinmlymdbDN5OtT8c6orqn9BizV9shv+ANtYD2c/134NhIPWiBx1c3THVwtoqMB4i3zhbKwQZqBt+20e33K+ogfRKLqUVIz/GHxMiG1iusv7vQEcW2bVAwRxS/3Kvv2pZOjflQnc+Uy3Wwb/x7jT8TLOdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApR2Ycpp6bEPUkqGn1znIZ0q3dIOFL1R3KD30wKtDJE=;
 b=y6JewQssaWm096pB1QEbvzdcUTa/4ZJmBb3lploaDjT3oxNfxlkHGf75BCQqqaJPah/f4Hx23iVbe/zrPXjHmCNSL14va4bg5c4aShHVwEhy4IsKU1svNhQ6b7jxFO3abMcwWv2rwcCgcenPVAC/XxYOXwFxL5n7vGRHI7ZwJr66aKf9FRoyJwmQVUYakYs7Juy3GGVWTW0V8JGfDVn33O6cMj8nRqeHIBJoIpeTmZ6qBSuytJVDSzWzixAbBzvBzVCimVQvPIWfTA7XSCrW4FeuaLVZgx71uBmC3YnYik3ShQLwSyafTB7CYqM/rkii4mSbqQkDjcK6OVsM4luwEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM8PR08MB5732.eurprd08.prod.outlook.com (2603:10a6:20b:1d4::16)
 by AM6PR08MB5220.eurprd08.prod.outlook.com (2603:10a6:20b:c3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.20; Thu, 28 Jul
 2022 05:28:40 +0000
Received: from AM8PR08MB5732.eurprd08.prod.outlook.com
 ([fe80::b480:6a4d:2d92:f863]) by AM8PR08MB5732.eurprd08.prod.outlook.com
 ([fe80::b480:6a4d:2d92:f863%2]) with mapi id 15.20.5482.010; Thu, 28 Jul 2022
 05:28:40 +0000
Message-ID: <de1bfd8f-c627-b936-ef5e-d71953236d96@virtuozzo.com>
Date: Thu, 28 Jul 2022 08:28:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC patch 0/1] block: vhost-blk backend
Content-Language: en-US
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 stefanha@redhat.com, den@virtuozzo.com
References: <20220725205527.313973-1-andrey.zhadchenko@virtuozzo.com>
 <20220726094740-mutt-send-email-mst@kernel.org>
 <94e5b188-8489-9f75-a481-015667bc0ba4@virtuozzo.com>
 <20220727130644.wspwadl5645gfdpr@sgarzare-redhat>
From: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
In-Reply-To: <20220727130644.wspwadl5645gfdpr@sgarzare-redhat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::17) To AM8PR08MB5732.eurprd08.prod.outlook.com
 (2603:10a6:20b:1d4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4bd6240-46ab-4dc4-2c72-08da705a0778
X-MS-TrafficTypeDiagnostic: AM6PR08MB5220:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iuoBYINy86QEiTN9iGJI3B5ppA3nIOdwDWvGk1kvRxqQuV6NSurs0351m5LJ8/pCq3O6aoHETHsVLGYkUjauTOhZn6+itx/b7AttBDEdULT1rL2db67YFdpOPv82SMIIC/Wi29Gu4TF7DbRTXrIr0+8LREN/Wg8phRGjqVxDPg9e9qPw1UI4GgehxEB2EeLPGj/VKY6KcWmno/RMmslx/aWGDa4XMPdr9ygywIRTPqL5wHN+WSghn2P7uvxMd3W/qATJ+PTuWL7/Jn6SO8LkUVuYWB34BvQW6OvgEnYboTmHsGkvrWSKJdHovraMDyM+FOxeGRa7NRu8OjV6U2RLA/6WNE2pSYAfrMuhWddGvtJPRxDAUeLit0ZMD40LfyKnUNdeNMBNbWAjN2QeM8Or+8QxG4YV4gU/iKPtR6WSGvYMcibgdSzF+q9kppRdH4btcdaltQr+YZfeA7LXeZlXmbtONoMhViWyx8fIUy7jhkPj+0kRM8+vTUpcg7XKBJy7ygH/MEV/5b1VMmavWHzoXMaokYjvsqVh9TlsLLm1LOlz8GdkWwrhWNwbTYKZ73pN+FcC6BFNnqm3gYdV7tqvRKcI/ikK3cGODXtfL5BlAEfnYD0M1BYFyj2LtXZh42fwzni8Il58TMyLngwMygX8JdwT7nE4d4OsvW/3xWMvHL3cC1wR1fAnlmU11+VokT4ud9GmSpvYZFWG40Tx3EyK3n6QC2b++BOn8BpPppU9iOGNKwNrCm9Fr/4z+Bpke/U00MC+hwXHgX2I4k+Ey3HNeySgqsT9UOkGh5PrADqicVbLXokwYpH/An9UST1HGmiP8WwTP7KlCbB+Af7wQPMk9dDTo4oT4JVn2ztakG5EtYY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR08MB5732.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(39850400004)(376002)(346002)(366004)(2616005)(107886003)(316002)(83380400001)(8936002)(2906002)(38100700002)(41300700001)(6486002)(31686004)(36756003)(5660300002)(478600001)(966005)(6666004)(53546011)(6916009)(6512007)(26005)(8676002)(86362001)(31696002)(66476007)(44832011)(4326008)(66946007)(6506007)(186003)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QW1kbm5SSnVlU002VEw1d1hoUnNEMEN2Y1dFcnlUUHhWRnk2ZDZOUFhXemJS?=
 =?utf-8?B?cDY0MmRNVm1OWmtYOVZpSW05MnIzenJ1UVhFY0RkVkRjbU1ZakhIdU9XODFZ?=
 =?utf-8?B?VmVlTitVUUkzUXlNYkkrRkl6dk9lL3lmZU40V1VVc2tidXdxK2RYMXZSQWdt?=
 =?utf-8?B?YnpQYkZpMGNKQUdrRVVONzF6SDI0aFVPWEdUNTJDcTVYdnhqY2MvSmY5UHZQ?=
 =?utf-8?B?blZLUExLWFpGeEg5Ungzb1ErUHRkQS9ZOFM5eVVZQmxtdmhISUExK3BkTEZ3?=
 =?utf-8?B?L3oxQ3NNQTVLRlhEeElxOXg0Z0hrMXQwekdFQXo4NWNhb2VaWllXT2dCUFBC?=
 =?utf-8?B?RVR4dmhERS81L2dKendFRFJjakFnZ0x5cnlYZXNKRVRsTG9qKzQ5L0lNTjJT?=
 =?utf-8?B?SXc1NHZGUmMzRVRVVDdXWHUyNGh6cFJKMy9FY09OZmtSSHFZcUc5YmVCQldp?=
 =?utf-8?B?TCt6ai91ZHFUdHRIbkViOFFZOUdaWGNGNDBJTHE0Ulc3QXBZdElXQjlZTXdn?=
 =?utf-8?B?MVhRclhqM1JtN25BclRrd2R5MFpOYUdua2ZSVkNiR1BabDFuZjdBU2FDZS94?=
 =?utf-8?B?d2xlWTRZV0EwYllUeHZGL2N5WGNBSW9rYnFBeVdicVgrVDl3Q2NiN3RxY2Y1?=
 =?utf-8?B?RnlIYUFCTFYxeFo0NEFsNXh1c0xTeTJVZVgrRmRoSkkwdXNmbXdxSFlaWUl2?=
 =?utf-8?B?YTNhdmR0R3NKS1ZWbFYwT3B0VTlkVitlajBNRVJEUHlYa2VaME5CRXNraXVl?=
 =?utf-8?B?SjNlRkNOMFlQNlFKQVJxVDl1cTEweFNJYkJLaG0xemNaa1lmWklRYUtCV2xV?=
 =?utf-8?B?SVFURmNXV2JZVWQ0SmQrU2IzNGJCejM0Tk9NMk4zV2J6M3NOcUZUSWVBNFhC?=
 =?utf-8?B?UnVLNGt6ZytuSmdOTlIwU0dGSW9ucVV1b2NRMVRxVzhzRWxRdFdLNk8xZm9B?=
 =?utf-8?B?WGEwWVMrTmswNzFLT0hvMlcxTUdLK0VKSHNjZEVuRkl6d3VxK1R2dUdxWXV1?=
 =?utf-8?B?K3l4MFQwb0JWbit4c1JUM240WG52dkRZTjR2c2IwWXZUSUZTQkEwa01zeUNa?=
 =?utf-8?B?bStzU280SUdkMXFka1BXMkFiV3lLTzA5bmVONUpJVkx4Y3YwTVF6YzBTaHN5?=
 =?utf-8?B?ZXo3OFNpc3hKdGtXR3lCVjV4VVVrbndqY1lRUzNnK2R3eVArM240YU9WYnMw?=
 =?utf-8?B?ZmREcnRNR1E1TmV4c3IrR2RwUEdyNSs0L1ZSY2JPMnE4SytXMDVwTzA4UVM2?=
 =?utf-8?B?U3BCWFRpeExOUU53d1lWQUxsNkhJMjUxMlRPZHcwU2RJN3Q5eWF5VEo0cHBy?=
 =?utf-8?B?N1haUGxOcG1PZmZkR1J5djdWRGpFT2hiUlRCTVYweFpYZlRQVCtSRlZxMkZS?=
 =?utf-8?B?QWZHZEdhMkx6OFRiV2VWcjVyNCtlT0dTNjVBcHUxZnRlcm92bnM4azRpVExT?=
 =?utf-8?B?OXZna2NGT3k4ckdHQ3FPcTBzVldGc3VUK1M2QVArdmhVTWJqZXJraEkxbGxZ?=
 =?utf-8?B?MTFON1Zua1FBOWRFUElZMEh5Ry9xa1ZONDN4dXh6U1pyNlJOQVBFTzBoTk4w?=
 =?utf-8?B?b2FpSU01VEhPSUo0ZHZIdEdjcU5UbkRaSEFMZ2FvTkRscjZKZG1Ea0NTUkxy?=
 =?utf-8?B?QTV3cmM1T09YRFNXV0gxT3crcXhsaklHMnpKVjBva2xQY0h6S2daakhQcDJY?=
 =?utf-8?B?YXZvSHFqNVYvaDlqMDdKalhhelZrTXNST2c0UkVON1FKRjlmVEdEMHRzbFUx?=
 =?utf-8?B?bUhwVzBNQXR5NnRMVjdFdEg3UTh2NUg4RDBpWG42S3BnazRPazROekJ0dk5z?=
 =?utf-8?B?RXF4bXQzcG1iRVgrQVRlNVExampEb0NSTEdBNEE4dmxoeXhYZ1hZbUUzYUgw?=
 =?utf-8?B?bkcwOGFNbjhiTEpTRVZTUFVycUpOajhRZFRGUktoQlJZU29mSjJpRWxGL1Ny?=
 =?utf-8?B?Rzc0UzRnUjFDeGlpc0xyTEdPV0tTS0JTb243QnJjUVZUK2k4Ky94WUNEZ1pw?=
 =?utf-8?B?VllYMS9CWnFrYlhIVG1WaENtU1RBTktjb0hEUmhHQlJNZGIwL0xyWkpXYkMr?=
 =?utf-8?B?NnhPa3F4Vkc4Rk1zQUNNK2NET2kvTXgvWDZVN0czaEJDY1JjSERsdVEzTjgr?=
 =?utf-8?B?UFFxaVRWKytJdWg4MkcxTlZJazBhK0E5VUxpY1E0VGNzWHNXd0U5aGRCRTZK?=
 =?utf-8?Q?dKlHswMXacjCpiiDYgVJ0k0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4bd6240-46ab-4dc4-2c72-08da705a0778
X-MS-Exchange-CrossTenant-AuthSource: AM8PR08MB5732.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 05:28:40.2280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NlFoGWJ9mp08Y0dpJbFI++0lhYVVUqH7sa/h+ldxaEZuEJ3j2rGE2Xdw8vzXLyV7mbuXIZwKnOSVzyEqdlbpZEZ6mqnGa+SKQasL1M9Upkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5220
Received-SPF: pass client-ip=40.107.104.97;
 envelope-from=andrey.zhadchenko@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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


On 7/27/22 16:06, Stefano Garzarella wrote:
> On Tue, Jul 26, 2022 at 04:15:48PM +0200, Denis V. Lunev wrote:
>> On 26.07.2022 15:51, Michael S. Tsirkin wrote:
>>> On Mon, Jul 25, 2022 at 11:55:26PM +0300, Andrey Zhadchenko wrote:
>>>> Although QEMU virtio-blk is quite fast, there is still some room for
>>>> improvements. Disk latency can be reduced if we handle virito-blk 
>>>> requests
>>>> in host kernel so we avoid a lot of syscalls and context switches.
>>>>
>>>> The biggest disadvantage of this vhost-blk flavor is raw format.
>>>> Luckily Kirill Thai proposed device mapper driver for QCOW2 format 
>>>> to attach
>>>> files as block devices: 
>>>> https://www.spinics.net/lists/kernel/msg4292965.html
>>> That one seems stalled. Do you plan to work on that too?
>> We have too. The difference in numbers, as you seen below is quite too
>> much. We have waited for this patch to be sent to keep pushing.
>>
>> It should be noted that may be talk on OSS this year could also push a 
>> bit.
> 
> Cool, the results are similar of what I saw when I compared vhost-blk 
> and io_uring passthrough with NVMe (Slide 7 here: [1]).
> 
> About QEMU block layer support, we recently started to work on libblkio 
> [2]. Stefan also sent an RFC [3] to implement the QEMU BlockDriver.
> Currently it supports virtio-blk devices using vhost-vdpa and vhost-user.
> We could add support for vhost (kernel) as well, though, we were 
> thinking of leveraging vDPA to implement in-kernel software device as well.
> 
> That way we could reuse a lot of the code to support both hardware and 
> software accelerators.
> 
> In the talk [1] I describe the idea a little bit, and a few months ago I 
> did a PoC (unsubmitted RFC) to see if it was feasible and the numbers 
> were in line with vhost-blk.
> 
> Do you think we could join forces and just have an in-kernel vdpa-blk 
> software device?

This seems worth trying. Why double the efforts to do the same. Yet I 
would like to play a bit with your vdpa-blk PoC beforehand. Can you send 
it to me with some instructions how to run it?

> 
> Of course we could have both vhost-blk and vdpa-blk, but with vDPA 
> perhaps we can have one software stack to maintain for both HW and 
> software accelerators.
> 
> Thanks,
> Stefano
> 
> [1] 
> https://kvmforum2021.sched.com/event/ke3a/vdpa-blk-unified-hardware-and-software-offload-for-virtio-blk-stefano-garzarella-red-hat 
> 
> [2] https://gitlab.com/libblkio/libblkio
> [3] 
> https://lore.kernel.org/qemu-devel/20220708041737.1768521-1-stefanha@redhat.com/ 
> 
> 

