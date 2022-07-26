Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E61B5814FF
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 16:20:46 +0200 (CEST)
Received: from localhost ([::1]:50520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGLQS-0007n8-9N
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 10:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oGLLv-0003eO-EJ; Tue, 26 Jul 2022 10:16:03 -0400
Received: from mail-vi1eur05on2096.outbound.protection.outlook.com
 ([40.107.21.96]:41761 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oGLLn-0003CV-Ik; Tue, 26 Jul 2022 10:16:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F6mcn/BIWToTQ6b/YH7VZnMwZuIlUdNN0at1HsWcohAemUK8Uj24lzEoSbv+ncuC0W/wsrvlavomps/U7GCOJ6h3+539K4nF9xYkh40hFZ8jwSn+Fqrd9xeYf+OkLXxpHU2t+x5ziMK0sfkNTaj3QhES4l3ka5bZkGrDZwHU0iZsoyKm527H11myPDbd8nmTQ9YZ7w2B4Qhqg94DIzR3w0LXW6LAJ0t8CHix9a4EPiwH2cWnPPd6AYZlk7C9RPszqpM54RACGbz2Sv9Fso7z8ooRrLD+ghtnPe2EJ386L6eznKfRyhasH7lY0uxEzAQ5oavKYpUMvNVkJMNAp/NJmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0moW3b/REzjvlR59PFoBvCGXjiAlPgk/YFoF5pKJ34=;
 b=iWtwYyIGVA29DN3VKrTdpq0rHCDt0JZMRqgupN4JE6wlttkLgPDXA/Orp2HuPycBOzAerTNbSEpCKBbNMGxiAHpbhw+WAI7lCr4PFFeSgdX6gw52Wm6VKC/5Fc5J8/Vv4rMXcrzeHKRgnkQPSA66chEaEJWdg6+XKriD/LKYV3MlQVZInGUmzHzjw2EbfPWjRM6oiWB/v2kTLE5HADRRE73ONB+GLWgu1qvrQ5SMlSbvPb5yqoMHD/B660R3VpIl3wzE4vRjPjThWtrjSRq2QPc7Vs+kJqWRP6ipD2YgehgDW8B5Fuy4CDu73taW6mnJ3/PrndcN1zMlaPgvUlMXbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0moW3b/REzjvlR59PFoBvCGXjiAlPgk/YFoF5pKJ34=;
 b=YotbAag5NE8ITWI1IAPUmpAE5+Y0GUobbENnMjAkwyJaoIwY5ZYpMIKfbCbVRopMk08g5wrzftGWlq0wAROUWS8MNZpceKjwbRL6c58hVZQZNWbNWvCVgKhoCDsLVAaYWpj0hl+B6NXFiC7DDyGmyzQbP4FOwn9Tn3TVulErvRdtBQsww0pAqR8ISM/FMxav863TR1LPMbKvE7TP9T3uM/aIrTZuXASjTKT/XURFYt52IvUVY3XYoxQHnXGpOPbW/XkR8VfD85fYdGjcbKthhtuyQo6nNsYE/AFpSVszKtgiJEYvl0j6vz+tVBayU1uvGA+oNvLoHSumw2mNqRx1Bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AM9PR08MB6770.eurprd08.prod.outlook.com (2603:10a6:20b:300::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Tue, 26 Jul
 2022 14:15:50 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%3]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 14:15:50 +0000
Message-ID: <94e5b188-8489-9f75-a481-015667bc0ba4@virtuozzo.com>
Date: Tue, 26 Jul 2022 16:15:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC patch 0/1] block: vhost-blk backend
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, kwolf@redhat.com,
 hreitz@redhat.com, stefanha@redhat.com
References: <20220725205527.313973-1-andrey.zhadchenko@virtuozzo.com>
 <20220726094740-mutt-send-email-mst@kernel.org>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220726094740-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0233.eurprd07.prod.outlook.com
 (2603:10a6:802:58::36) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbd070fb-3c7f-43c4-6df4-08da6f115782
X-MS-TrafficTypeDiagnostic: AM9PR08MB6770:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NO8zXcv9yvQVF6HNEIcPnKAJhA6njoR2Mnd1GH6HjJLMAHUAiFTYQaKNvdVDSvJxoz8/aAp+BLlYZs6weyv+KPgRIhSlHTPdHTB9S1yqItz7HmeyHsA62y0YRNTarVt5Wcor5jatpNffmhkaOZjTL4d7UJFtnn0x2+NX/xPYViW/Nhl661h8LZcd1mwEvWeNZpEQaRGtvb45wbzt9ICVNILt+dbP6JZ23KE60acjYq4n1sI2vqOmctG7mR+7lcFgnYKLbdmqxfEXzHhPx8tdRqO8cinj2Ree1G1VUG9T5h0HxaOgqumRNOCM1LT5JUUwAz6/icmZVb7kQwGVxcCCf4CGuk48ojFQhcKnQHOL9/2/PhjUmvlnAde6nzfosO1jEk3LlBJxArqoBSYiuTM9iHer2uzV8/uleth8QJ+PJjuKkDD/buKNXOqDyZd+8ChUG176/6llJ4lZD74IYAL4gpK3Xhlz+zt7IIv4CNXIcjeESIT5MJmLHeMFu13ul8AVhUldYb9EACBC5cfFUfX5RL5FIBAquLzjIvJgfXLbcbSxQNhS3/ZRjH6Hu7bzrxprRYZUjzAcHzjoyYSlIoyHrU/0szIJonIOoics7b7Oz7Q3o92NVAMcAUxnWt3+LG1/3RqEc4jFXF6M5rXF1VLydKo0NTAEA1KvJj63P6XokzZuAABGzEz+x+paJlqxXwz6Dg6XVBTvcrWVui6f0fPxUykPVMkrFHctU3Im8b+CtQ7JUHAA/B26f7ywb/BwAyk3u/8RHZ7kiSyXJv6swuvexHWyefwRERTQljlyKfeo0caZuZuDhsdjKB3zex3iMUR8mdH+dzzZV9pBUa56g4YeOsXfgJrFlO5p5d8HE7VONsaN2/0blk08vDBRmGU4Dn2SBj+UWDLiU9S8VXdyq490Pg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(136003)(39850400004)(366004)(376002)(186003)(2616005)(41300700001)(53546011)(52116002)(6506007)(5660300002)(26005)(6512007)(2906002)(83380400001)(6636002)(66946007)(4326008)(316002)(38100700002)(110136005)(31686004)(66556008)(66476007)(8676002)(38350700002)(6486002)(478600001)(966005)(8936002)(31696002)(86362001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVhWQzNoM01NeFdBajdpUkw3RDlBME5nbkNjSGRtOU1RdE5vMW9WZG5na0Mw?=
 =?utf-8?B?MEZOY292RU9NNjhESlJuSVFqT2RPYTdYZmt6VGdBaTFuOEVBeGtTK3pSQUVI?=
 =?utf-8?B?dlNLM2xKSDVrY1hYcDRxc2hDdHlJdFgva3pnYmpiamZ6cmUyWS9tTzc0eWtV?=
 =?utf-8?B?eUt1MFN2SGkvMzZ0N1ZBY0Vmd0tLK3NWRlpZUzMraGx6WXdxM3QvOXlSRXpR?=
 =?utf-8?B?VzhpWjRLaGxlZmJ2R213dE1hR2xEbkdWWnJXa3dtNmdFTm51cXJkZGY3NDBk?=
 =?utf-8?B?czRwN2VPazNZNjVzWGdWVjNDbmpyWVNTeE1PRWZjbFZZQjhIcGI5NktNM241?=
 =?utf-8?B?YlM5Z0doQml1RGtvdk5SRkM3L1BMWkdDZjZ2OGpVK01JWGhFcG5wby8rS3FV?=
 =?utf-8?B?ZWJ4MDlQTVFLc2xtMjNSWmY0M1hPQk0zTTBYWE03dkk4NEs0RXJYdWhxK05k?=
 =?utf-8?B?T0hSTzQ0R1huMExQblpmWVEwVmw5Ync2c0s0WTBOZU9wYXpKemVlQVdYYUhQ?=
 =?utf-8?B?T0R3dXBUeFZrM1JOeDVzRzBGQk14YS8yM21VUlg1aVJUV1FMVk9hUVJIYStJ?=
 =?utf-8?B?cFk3YlhWRlh0ZDFMWHRZY2dOWXFEUzJnL3BkTVJsN3B0MHRlMlpETEZldm5Q?=
 =?utf-8?B?NGYxK2JBWlZCZHdoVHFWS3VzeVBpLytvcVNCaUFNTUhUcDM5SzRqcHNhdWc0?=
 =?utf-8?B?Qy9ncDhub2VJY05kSG9QeUJFRnFWNjJTTndjZFJxbmNNTGluWCsrK25iazBH?=
 =?utf-8?B?OSs5S1luMmZpTFc2ZlB6MUE1SmROaG5VR0xFM2lJenJHK3RPMk1jaFQ0ZTlX?=
 =?utf-8?B?a1ZwNDZHTVlIa041YzdZeUoydUg0azVSYlg3cFZIWXJYK3FWTXFzK3JTYlRy?=
 =?utf-8?B?bzR6RkRXV2x5ZWlHc085end6bndwQXFncWRLSkRjOVMvdE0wazh2THAzQ1ox?=
 =?utf-8?B?ZWYrSlYxS3B5b0czamZFSTZvYi9sVXRqaXNONWJOU2JXcVhFd0U4UjhHZWdL?=
 =?utf-8?B?aDlDbkxQaCs1VUZIRUx5N1U1VGk4T1dDTGI1R0x0K0xOOWJEdHM2d1VNbE4x?=
 =?utf-8?B?MHlldG5nNVp3Vm11N1FhUUVwZHgxZ1p4Yi9pamNJMkxDb0VJT2JyOVQxZVF4?=
 =?utf-8?B?cFp2S09IWHRiZEdVMzFENWZKOHlEUU5VeW9NWFMxVTJpclVRd2Zka2gxT2Rx?=
 =?utf-8?B?MjJPUWVhWm1kbXltN2tHMXNuVVM3bmk1R0pjNTBhMXFYRWJZMzBWVEVGaWxk?=
 =?utf-8?B?d0NCZlBOdDdZZ2pOUGIvbUc4WmJ4K0kxZWo3aC9BMlhwVTdZYTFWZWFMRzN1?=
 =?utf-8?B?b3dEWXpiS0pXRUF5OUNyZkw0TWlOOXJxK1F5dGhwQWVTODF5VzMxeGtKdmpn?=
 =?utf-8?B?eUtITlNxekQzTUlUVXk3ZXRRcjRiOStOLzI4V3NRVGpXL28ySklwR1pLWDRk?=
 =?utf-8?B?RFJEMUpONTRRbDlnKysreXp5ZklMcnh5T0RkdUwyd3M4UFJ3bzB1UlFGUng1?=
 =?utf-8?B?TktpYmhudEdCdG1sV3ZLc2hzZUpXTE1WOVZEbDRuNXR0ZElHSXB6TTQ0NnJi?=
 =?utf-8?B?WjFIaFhtRkNJOHcvdnR5Sk95VUY2VjBFUDBpMEl6MlBrY2VuOSt5ZU05bUtx?=
 =?utf-8?B?VVFNR3Z1Q1RBVjZRZjB1ZDJ0Rm1Na0QrVXFabTA5a2ppQ25CQ3hzbTRydkpM?=
 =?utf-8?B?OGF5clY3UUNRY1NNcFNOZHVod0N6azRBNTZnMnN1czFUb0lYWUtGVkJlb2NT?=
 =?utf-8?B?TVlndHh5RVlLSCtMZUNWekkyUkZKM2RWRSsrN0hWMGp6THZtS1RESmVaa0x3?=
 =?utf-8?B?eHNlOEx1WmlVdmZGbGhGUVlTams5RTkzZ1EvNFpPVVQ3MWsxK1p1azh3YlhM?=
 =?utf-8?B?VDQ4Y2VNUDd2TTd5TXBwaWFKekhzTlZJTW92U1V4RWVnanJ4Y1k0U01ick1L?=
 =?utf-8?B?cWNwRDBFMnJCait5MlF2eWZ4ZTc3b1ZoNzJMRXlWTTZMRERWenYweU1vS3J1?=
 =?utf-8?B?Yk5pMy8vWkxaUEFJbDhYb0FIcHpuSk1GRlkxcHlUbW1HRWVMb3FOQ1FRWFZK?=
 =?utf-8?B?cVp1NGQ0SnNScFVML1NWVGFzcnpCWHFoZFl3cjczUzZKZjFOYUxMR0ZTSkt4?=
 =?utf-8?Q?t7zFDynEnc4WC1vpto7ZeZ3Fi?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd070fb-3c7f-43c4-6df4-08da6f115782
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 14:15:50.0901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ilZCOEzYo12d2iRoN7Te2TAeSwv9XY3CXNstIBPWDNMPs/EPLUC3PyexWZPKlQiGotSdaYjvjvc+0NphBPksA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6770
Received-SPF: pass client-ip=40.107.21.96; envelope-from=den@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

On 26.07.2022 15:51, Michael S. Tsirkin wrote:
> On Mon, Jul 25, 2022 at 11:55:26PM +0300, Andrey Zhadchenko wrote:
>> Although QEMU virtio-blk is quite fast, there is still some room for
>> improvements. Disk latency can be reduced if we handle virito-blk requests
>> in host kernel so we avoid a lot of syscalls and context switches.
>>
>> The biggest disadvantage of this vhost-blk flavor is raw format.
>> Luckily Kirill Thai proposed device mapper driver for QCOW2 format to attach
>> files as block devices: https://www.spinics.net/lists/kernel/msg4292965.html
> That one seems stalled. Do you plan to work on that too?
We have too. The difference in numbers, as you seen below is quite too
much. We have waited for this patch to be sent to keep pushing.

It should be noted that may be talk on OSS this year could also push a bit.

Den


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
>
>  From vhost/virtio side the patchset looks ok. But let's see what do
> block devs think about it.
>
>
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
>>
>> -- 
>> 2.31.1


