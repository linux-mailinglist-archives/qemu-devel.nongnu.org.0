Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9682C5F5413
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 13:55:33 +0200 (CEST)
Received: from localhost ([::1]:50888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og2zr-0000aG-IS
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 07:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.zhadchenko@virtuozzo.com>)
 id 1og2uo-0006lo-9T; Wed, 05 Oct 2022 07:50:29 -0400
Received: from mail-eopbgr80113.outbound.protection.outlook.com
 ([40.107.8.113]:47108 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.zhadchenko@virtuozzo.com>)
 id 1og2uj-00020P-BA; Wed, 05 Oct 2022 07:50:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmF29rdIPmAFmkEaA7Ziw3nDcsoZR1Y1xnMOzMel8preoWF/dbebRFElI/hzi9NGt1HDNt41cLEMpfzbsKZCtqfrFNGBqEKhOKccrYWNbZmPuq2vryO+hl0cB+A205zRqderMleARa5Db0j+BiRu8yIvzdh3lIaQGF1oB261UPj/rvKIp3qOMjOLHlG+eh1/KGADIgrA2yIqoUT7ujhOlJpg2qZzxyaBX0cGab9NWOCAWULvrY9Zvb68+z177LKvBpD4QIJXYBEEMv2CLpUVDX7UiGmROOykQoqP8ztAB6U4+jAm/fx2Bt9rtlzk2HXbCTmubsDfHj4R70AJorzzKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIQNs30zh3aTscMkWehyItoMBaTCAH8rI0t7tmuGJtk=;
 b=h5kw0fc7KH6F6pCOWP4+kx6sisnv3eIF7q2tnFqLAqvzg9FFT/o6OY9U6p+7t9Oa8eTh+lQZy4Uf3bWTCwtFntkrFAb8JYXxXoZVJpwqD5neQk5NLHSvGEiDpikGsd1sNvzd7uCD7yHKi0Sx8Yx75HLpiWMG05grWF0DurS8VxL6eT/M0vYzKoVecAFw3bWSj8++gq1/lu1IEP2lQAYemDeYoIO3ts5LJ3Fbq9Du7xOJYpMeAYFBm3wNgKFpVgfOOZHnpFMuNHgL38dEyOMP2tuzYqKT5rOW6AKnX7Xxn6ekP6fa4t30fHMnDSuuZJcvWOcgll7PFr/jgcq/GE1uqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIQNs30zh3aTscMkWehyItoMBaTCAH8rI0t7tmuGJtk=;
 b=dtIFGigKP+sVhYjQxhykvw1Ptqy15hpJaPyMBYtqJ63BmTFzVZqTCFRPT9FzCRj059BI+uqzlquF8x4j59gF1tI9PmcNYBb+vEJZBCASgWn9rGoHymFIFLi6MYIcT3xPfqKg3ALuZbS+Y7aHrMnsdaaVE3Y7hlONpsAmLGhFVDncIYWgoiTz2FXAUfb3ZfHURAgZJn7t9C8wKlG4XLu0fjodFohWyouFQp4NuSccTSduvVFgkBpD1mDp/GGyjMsk3YfkQB0ZENYNwweZEbfIcdsb5bv0JZz5cYHlOdcjcdDAMcsjzLRm09LyjSJ9Ag+F8780eAvx2ieXJVtFLu/DpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM8PR08MB5732.eurprd08.prod.outlook.com (2603:10a6:20b:1d4::16)
 by DB9PR08MB9540.eurprd08.prod.outlook.com (2603:10a6:10:451::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Wed, 5 Oct
 2022 11:50:08 +0000
Received: from AM8PR08MB5732.eurprd08.prod.outlook.com
 ([fe80::f7fe:fb10:40ef:188d]) by AM8PR08MB5732.eurprd08.prod.outlook.com
 ([fe80::f7fe:fb10:40ef:188d%5]) with mapi id 15.20.5676.032; Wed, 5 Oct 2022
 11:50:08 +0000
Message-ID: <cff288d8-b8b5-76ba-aa90-91ddbd2d95a8@virtuozzo.com>
Date: Wed, 5 Oct 2022 14:50:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [RFC patch 0/1] block: vhost-blk backend
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, kwolf@redhat.com,
 hreitz@redhat.com, mst@redhat.com, den@virtuozzo.com
References: <20220725205527.313973-1-andrey.zhadchenko@virtuozzo.com>
 <YzyC1Y+c+e4IVDRM@fedora>
From: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
In-Reply-To: <YzyC1Y+c+e4IVDRM@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0325.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::14) To AM8PR08MB5732.eurprd08.prod.outlook.com
 (2603:10a6:20b:1d4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR08MB5732:EE_|DB9PR08MB9540:EE_
X-MS-Office365-Filtering-Correlation-Id: b753d06a-6abd-4d60-f6d4-08daa6c7c067
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L/+GbGm6hRo1mAbGINap6mvSYaYPomAq+GVxxIVflohtfrge3IiAKNkUswPxEJ4u8mZcYrcMugyt6j1GkKbwMdrm31OYDE9TAiNU1uFaFERAjZ3xc+b79l6tUrg+BkLRgBoljg+VoSW5/EHtPrOWBIRKSe3zwdpgeD7NID/357yuYQjOyiod4BmE2Yy8r0YUh/cooqUs+I/rEJWHyS9EqnPsyP3RGZNsOIMBz6JGSviXjvth9IjaaytCQV30p9wb27DU9mKv4iJ/Xwj2J7Hng6B7vnc0Hk1GkUGWKpe0gsrssW/yvaDoXKt79jgQ8DBV8FHT0RaiVtF4s33pwU0D2qn5Bn8C4exSVnmp86UK5HsQgNmU42koR0DEngQfN89SerAj4RnHRNaYla8qANek7+p/IbaHWki5aR9Ewk3XeeT5D9o0l4Hcs5GuvsLGKzLBVtbIOj2dOgb3/3HgnTjcgh0nSfctDFbWVczKMLvisUrDowRCcGmt0AMyoSoRbpMlD4A3BzbajH4IRUH8PPFlXlE7WNf3hTRCO7u60B/Ovetb7nEEgNu71uyvLzEFvkC32gdrVWfvnQGNCSLQeZ3d9o0XSQHLCCiulDsIqTXKAIDX1jHytdTXdjc+xid20NjlfqjynwAm9b/IaynGCY4aKMXt6OrNuGFosf4RBfycumHccm3davdA2brLN7k5whonstQc4wM7T3kQjLiCrjXOtzOTZ4eZKeweuV2j3EXoEfQrvIdiw017MZ3blUZThXUm5gbDeEZXGJtQEEyVO0cQX2rlyR1KYIiqmtUKGXUFJNTDwiAslRDGI9KAd7F9WQGA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR08MB5732.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(346002)(396003)(39850400004)(136003)(451199015)(8676002)(4326008)(66476007)(83380400001)(66556008)(66946007)(26005)(5660300002)(86362001)(6512007)(107886003)(53546011)(6506007)(966005)(2616005)(8936002)(6486002)(41300700001)(2906002)(186003)(31696002)(478600001)(36756003)(44832011)(31686004)(316002)(6916009)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnBhWmxLNE1YM3JrUmtRY044SWxuU3FOdFRGT090cCtCNmFmekV0Y1BTUWhm?=
 =?utf-8?B?VWx6bWhsSGtzc0xZTk5GZWJQUi9wbDBVUXp6NUxvQTBpVjMxTS9aMHBxRG1L?=
 =?utf-8?B?OVU2MGxhL1FVdDZMbUw1YnNWb2lzOEZoWHdCS1AwK1RCMmFWTFlUZWw5VDAv?=
 =?utf-8?B?SzVkdkdrOG01NWJjMzdVTDdYZTFIVnhNbTRrOHJQOFlDem55cjdidXp6RmJ6?=
 =?utf-8?B?ZFVMOUhvRGRJMXFMNGVlUXZtWVpCR0RUSHpTZzR1NFA3MEhVZGhEVFN6R3dL?=
 =?utf-8?B?RE5hL0hTMGgwY0pBOW1xbVE1M2lLMmZmVlYrN0VEU0dVVUpmcksrS1dJSVpE?=
 =?utf-8?B?empWdlBLdDdDUTVTa1pHeGpXVk1HYkRVL0I3SGhKbXdUUjFsM3FyZW5Ybk4r?=
 =?utf-8?B?Y0N2bG1ERERlNVU5dk5iYjgveHFpUC82RUhoMzRSRWxkTVN1eDZRTXhoc08x?=
 =?utf-8?B?STg2dkRIUWMxYURCZUcxR3FQQW9DMnNvM1VnTGx1UGtydHBuMytQUnFwa3lx?=
 =?utf-8?B?NTBVUEVzdWpIOU9DSlV3OWxrcVlrbUNuL2NUSlhIN1pISzNRc2JESTEzRWdm?=
 =?utf-8?B?OUsrU2QxVXRGVlNLVTlvQVg5OXdaT0pOYmhiSDQ5NlhGSnp3UWFWOEFPelgy?=
 =?utf-8?B?TkV6UHRtM2xmNG14cnh4Z1B6RFdaV3k1N2dsNkY4MUtxaWZnWHdxS1dSNlBy?=
 =?utf-8?B?Y3V6L091SkdUd0g5R0p3S2g2Qi83eXhxUHdIVWRINUpJdW1FMkI5UTQwOExX?=
 =?utf-8?B?SlV2b3Y3ZGRjbWdNazB0R1FrUEI5ZU5OVDN6aFd0VmdaS1hDcHAvZVl4by9w?=
 =?utf-8?B?VFZxdVRTVTd1MTRpWFI5Vys1dFZIc09Yb2FRRkI1OU54RnFUYkNnbkNHK2U1?=
 =?utf-8?B?OE9rMHhYd05TTEVGMXJSSTBpVXhSMXphTWs4L0lGRlhOT2VBSlJ0OGhrdW11?=
 =?utf-8?B?R0NSbVhCcmQ5SGhEZ1FOTTBsVERyem9kc01VcUgrU0U1dDRFYUoyZWNPSTBC?=
 =?utf-8?B?Q2l1U1VrZkd2ajgvMUk0alUzWEpzb1V1bmxzTHo1QzNMVUxuNGtaeElyVEhU?=
 =?utf-8?B?UzM4WElpdWwvYjBveXlnTDd3bCthaUwzQktUd3locis0MTFEZUllRDlsMzR2?=
 =?utf-8?B?QXJKOVoweTB1bkowcDRyVXExTk4rUVRleGk3WEdrODVvcGVVK3dMaFVHZXlv?=
 =?utf-8?B?cTNqdHlwMmJ2aFhkOGdpWWJxTERpMHJmdjhaZGp0cTc3OVNlMU9zdWFZbmZy?=
 =?utf-8?B?WWhiMmh5WVNKbFlRYXhMNTZxdUhHWlZqNjFxNlMzOWNMNm9udDB6VjA0WXVj?=
 =?utf-8?B?NC8ydTV1anpRUmNtWElzb0t3U2dwU3Z0OVBIKzNTSTQ1TDhVaVZhOGJMTEZi?=
 =?utf-8?B?Rng2NnpSMWNkdkt3cTAwREtKMlVQc0JjUWRWS2lGU3BmMEdJZ0QvLzhQWHVh?=
 =?utf-8?B?djBHcFFicW4wUHZZK3BYOGhnRTk1K3U4a3E0bythL2Q5NDFpcmd1NVcwYlN0?=
 =?utf-8?B?dE1oUU5OQnJ2UjFLSFl3L1QrU2pyYTN3akY4cGliWkVPMDl0RmZrbkVHUm00?=
 =?utf-8?B?c2FiQ05hSFJobjducGNRRkQreFUrWUh1MHFFUmprcSt1amJXOHYydXBiNnNG?=
 =?utf-8?B?dEZsM0JDYm1KZ09YemdqRTRHazZ2VHMzWkM0eG54dVJuWTRubUlJQ2QvMk5X?=
 =?utf-8?B?RUkvMCtrdHhIbjVsZExqc3lrWjNBYVZmN1FsTWxEck5OaGxpcjM4S1pPem5r?=
 =?utf-8?B?WUJMYUxUVndLT1ozbTNCMW9ZbVBQc3VkeFVtOFZJQTNoNnhUM1lKN1dwYXRV?=
 =?utf-8?B?VUZrNDg0dG85UkN3VGJYVytYaFpMQ3A2V2dIb3RGekV2aHNvMmdoVHh5ekxm?=
 =?utf-8?B?R2JySzF1S0pOekJEbDVHU2J0RE9rTXhZaWtReXBiMlp3YzVJYWs5dE5TbEdD?=
 =?utf-8?B?V1h6MGw5WFdjVjRPSytGTVNLTkZtRXBKRXZlUGozNDBPRDhmcUZtb3NQL0lG?=
 =?utf-8?B?VTJGMHVSc0YyVjlzV2p0MTduYVJEeWhVU0JHVVB4QzJWQXFtNlZjbkVLZnJa?=
 =?utf-8?B?L1F5L2FJbElKM0JhaTBvN1ZJNVJ1c0lhemVORzJJRGRvVWdNS2FwclJMcloy?=
 =?utf-8?B?WTBCdElZVUtGdnR6cE1JVVFDbkg1TnRwV1JJaDR0US95V3hWdTEvV2paUGo2?=
 =?utf-8?Q?5NNZ0WjdxfE7JfKHxKkjxtk=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b753d06a-6abd-4d60-f6d4-08daa6c7c067
X-MS-Exchange-CrossTenant-AuthSource: AM8PR08MB5732.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 11:50:08.4025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SeWHPsY0JtvjgcY/MiHuy7iKPK7FXChx9sEdsBTXGcZKaXWN2HxPgZZ+6/8G/3GvNFTDzjUp1pP0cvV+njSlgIvnCeFSu3NmFxAXLEmNLso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9540
Received-SPF: pass client-ip=40.107.8.113;
 envelope-from=andrey.zhadchenko@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.435,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 10/4/22 22:00, Stefan Hajnoczi wrote:
> On Mon, Jul 25, 2022 at 11:55:26PM +0300, Andrey Zhadchenko wrote:
>> Although QEMU virtio-blk is quite fast, there is still some room for
>> improvements. Disk latency can be reduced if we handle virito-blk requests
>> in host kernel so we avoid a lot of syscalls and context switches.
>>
>> The biggest disadvantage of this vhost-blk flavor is raw format.
>> Luckily Kirill Thai proposed device mapper driver for QCOW2 format to attach
>> files as block devices: https://www.spinics.net/lists/kernel/msg4292965.html
>>
>> Also by using kernel modules we can bypass iothread limitation and finaly scale
>> block requests with cpus for high-performance devices. This is planned to be
>> implemented in next version.
>>
>> Linux kernel module part:
>> https://lore.kernel.org/kvm/20220725202753.298725-1-andrey.zhadchenko@virtuozzo.com/
>>
>> test setups and results:
>> fio --direct=1 --rw=randread  --bs=4k  --ioengine=libaio --iodepth=128
>> QEMU drive options: cache=none
>> filesystem: xfs
>>
>> SSD:
>>                 | randread, IOPS  | randwrite, IOPS |
>> Host           |      95.8k	 |	85.3k	   |
>> QEMU virtio    |      57.5k	 |	79.4k	   |
>> QEMU vhost-blk |      95.6k	 |	84.3k	   |
>>
>> RAMDISK (vq == vcpu):
>>                   | randread, IOPS | randwrite, IOPS |
>> virtio, 1vcpu    |	123k	  |	 129k       |
>> virtio, 2vcpu    |	253k (??) |	 250k (??)  |
>> virtio, 4vcpu    |	158k	  |	 154k       |
>> vhost-blk, 1vcpu |	110k	  |	 113k       |
>> vhost-blk, 2vcpu |	247k	  |	 252k       |
>> vhost-blk, 4vcpu |	576k	  |	 567k       |
>>
>> Andrey Zhadchenko (1):
>>    block: add vhost-blk backend
>>
>>   configure                     |  13 ++
>>   hw/block/Kconfig              |   5 +
>>   hw/block/meson.build          |   1 +
>>   hw/block/vhost-blk.c          | 395 ++++++++++++++++++++++++++++++++++
>>   hw/virtio/meson.build         |   1 +
>>   hw/virtio/vhost-blk-pci.c     | 102 +++++++++
>>   include/hw/virtio/vhost-blk.h |  44 ++++
>>   linux-headers/linux/vhost.h   |   3 +
>>   8 files changed, 564 insertions(+)
>>   create mode 100644 hw/block/vhost-blk.c
>>   create mode 100644 hw/virtio/vhost-blk-pci.c
>>   create mode 100644 include/hw/virtio/vhost-blk.h
> 
> vhost-blk has been tried several times in the past. That doesn't mean it
> cannot be merged this time, but past arguments should be addressed:
> 
> - What makes it necessary to move the code into the kernel? In the past
>    the performance results were not very convincing. The fastest
>    implementations actually tend to be userspace NVMe PCI drivers that
>    bypass the kernel! Bypassing the VFS and submitting block requests
>    directly was not a huge boost. The syscall/context switch argument
>    sounds okay but the numbers didn't really show that kernel block I/O
>    is much faster than userspace block I/O.
> 
>    I've asked for more details on the QEMU command-line to understand
>    what your numbers show. Maybe something has changed since previous
>    times when vhost-blk has been tried.
> 
>    The only argument I see is QEMU's current 1 IOThread per virtio-blk
>    device limitation, which is currently being worked on. If that's the
>    only reason for vhost-blk then is it worth doing all the work of
>    getting vhost-blk shipped (kernel, QEMU, and libvirt changes)? It
>    seems like a short-term solution.
> 
> - The security impact of bugs in kernel vhost-blk code is more serious
>    than bugs in a QEMU userspace process.
> 
> - The management stack needs to be changed to use vhost-blk whereas
>    QEMU can be optimized without affecting other layers.
> 
> Stefan

Indeed there was several vhost-blk attempts, but from what I found in 
mailing lists only the Asias attempt got some attention and discussion. 
Ramdisk performance results were great but ramdisk is more a benchmark 
than a real use. I didn't find out why Asias dropped his version except 
vague "He concluded performance results was not worth". The storage 
speed is very important for vhost-blk performance, as there is no point 
to cut cpu costs from 1ms to 0,1ms if the request need 50ms to proceed 
in the actual disk. I think that 10 years ago NVMI was non-existent and 
SSD + SATA was probably a lot faster than HDD but still not enough to 
utilize this technology.

The tests I did give me 60k IOPS randwrite for VM and 95k for host. And 
the vhost-blk is able to negate the difference even using only 1 
thread/vq/vcpu. And unlinke current QEMU single IOThread it can be 
easily scaled with number of cpus/vcpus. For sure this can be solved by 
liftimg IOThread limitations but this will probably be even more 
disastrous amount of changes (and adding vhost-blk won't break old setups!).

Probably the only undisputed advantage of vhost-blk is syscalls 
reduction. And again the benefit really depends on a storage speed, as 
it should be somehow comparable with syscalls time. Also I must note 
that this may be good for high-density servers with a lot of VMs. But 
for now I did not have the exact numbers which show how much time we are 
really winning for a single request at average.

Overall vhost-blk will only become better along with the increase of 
storage speed.

Also I must note that all arguments above apply to vdpa-blk. And unlike 
vhost-blk, which needs it's own QEMU code, vdpa-blk can be setup with 
generic virtio-vdpa QEMU code (I am not sure if it is merged yet but 
still). Although vdpa-blk have it's own problems for now.

