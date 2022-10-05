Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 967B05F52B4
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 12:36:37 +0200 (CEST)
Received: from localhost ([::1]:48758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og1lU-0007Ln-6H
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 06:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.zhadchenko@virtuozzo.com>)
 id 1og1db-0002f6-SC; Wed, 05 Oct 2022 06:28:27 -0400
Received: from mail-am7eur03on2124.outbound.protection.outlook.com
 ([40.107.105.124]:11219 helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.zhadchenko@virtuozzo.com>)
 id 1og1dX-0006xm-P9; Wed, 05 Oct 2022 06:28:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KV3RarfAKLCky1CimnS1zi9tG3sS+3Wta8WOKJxZ5lo5Wsvegsa+RBI8XU/jm1lsNT6dLU4rCRsIZyw6LOXSJzYL+wVRIx8DqPTihZXLHVpjclP75Ramx5rEiRdT220WYr6GFplbiNvF2q0reTzEVoO7n/ii6JptpSs0p1Zx4fTf+0IyHeOTbFCxpA9tHPJVTDqzWnG/3MLdT0Y3Gh27UNeWrwqvzVMMB2iAtVBwFwrpsY/5VPmcHmIC5z7eUH0XmVLfNs/mjmqCK0lIF5UlG7n0/QetiwNERDJ2gq7aegyY82urx9Zq8i6IlLbEGxSVHclbV56GDj6+3kFjove2xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LSGX3jD3vbb0eTgv2w8AyVQTFA/gyI5etleBE/Iubo=;
 b=VpJHWAnUWmuKJpju5GmPfov9YfPxzVwMmWJ2WOofC8IhcW9qNf6ixGl1vk5E5O/IYl5I38lzYwrmmF2quh5yvclqus5ZW2qyACIjiKOQmAmDol5i/pZ+U0MV3cxqKuLGzYgHpFZmxgOxBpYlzsAF14y0XgjaoNkTJhGVTIL22hrzpqD6VxKoShBg+cDR7eI4wuci8hXC6zjHypY7YaxlkyBNfCvjVWWvf4Jfl+14UpWwHioBA3z+iQ9yg4LCrLYbRo1xHntn7WaJC8eX7YMkIqg6icvSUpUJRAsQRDg+H8nKNLyjlJ3B1TsJfeRboy2YvlzH2TlfSw7xaVd7P8f+sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LSGX3jD3vbb0eTgv2w8AyVQTFA/gyI5etleBE/Iubo=;
 b=gCoQR19ym0K/BGOxz5OF7x7zCNGo0iceKSospLVwvEUNoTVLHA3D/3s/6W8tXfccRknDVHFq3jYd9iqRrqwmpYz8uFUaSX8HEolIB+eK7x1UPbZ4IiDFkw6uuXJo8J5Jtfnz1plJhCWuPeLkcy1T8Nyq6ryROf3M7yOdE8RTI5DwJxJp26hgJD4msmzMZ8WpnT/8gcU45ltTqAIwFQFyJbjPOHplwRKTpNzP1M2n0ZEtj5K7eVsOzwdtqYDErICTy743QmBqPrTh3xBrdhVyuTZfvu+VoPf+qFs0QeA9GSv93M/c/a5GKbHY9nsahjegb7kZEjE+oBsgU/8eN9Y9mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM8PR08MB5732.eurprd08.prod.outlook.com (2603:10a6:20b:1d4::16)
 by VE1PR08MB5661.eurprd08.prod.outlook.com (2603:10a6:800:1b3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Wed, 5 Oct
 2022 10:28:16 +0000
Received: from AM8PR08MB5732.eurprd08.prod.outlook.com
 ([fe80::f7fe:fb10:40ef:188d]) by AM8PR08MB5732.eurprd08.prod.outlook.com
 ([fe80::f7fe:fb10:40ef:188d%5]) with mapi id 15.20.5676.032; Wed, 5 Oct 2022
 10:28:16 +0000
Message-ID: <ae1a9e07-b457-7208-3bff-f53c5de9c3e8@virtuozzo.com>
Date: Wed, 5 Oct 2022 13:28:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [RFC patch 0/1] block: vhost-blk backend
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, kwolf@redhat.com,
 hreitz@redhat.com, mst@redhat.com, den@virtuozzo.com
References: <20220725205527.313973-1-andrey.zhadchenko@virtuozzo.com>
 <Yzx6xDCnpIQ0yOi5@fedora>
From: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
In-Reply-To: <Yzx6xDCnpIQ0yOi5@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::19) To AM8PR08MB5732.eurprd08.prod.outlook.com
 (2603:10a6:20b:1d4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR08MB5732:EE_|VE1PR08MB5661:EE_
X-MS-Office365-Filtering-Correlation-Id: 0af963a3-acf4-43ef-4f05-08daa6bc50a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 60RLRDP8VQPA9hzuPnUgd6qa5isHu1MkKNxfTjThyeJD34sBjsMpHxfCVomV6DhyiFVdDGU6Yi5ANwy1TEDyd0sco4eeMuFpoiyraaXQGkjtiggDE8e/80jF/klw7NjAH1GvKHKGBuVdXDK1IlUqascg7ePz/52JwcLvhgnsuYfPYG2TlHCLyf5ZRMFYU4rYrMnjY4iw8Pa52oYs7WFHVi5993VlqM2k8z4rXnXyCtA5YJXl9/zvs4bH1ZmycZnmXoDskPmJ3dikgzSjkwZohwi3ERsl+TV+XCWEgcbPwzw1JxfMO3r41adVd6WIzK+Ply2aMrgB6rwjDkpOxIYyvOP10oFsF8I5p9nIZVP9JOD5ztUOzSmFSlGYjsa4R9Lc11AJu6jlSy0bPaJ6FjilrGNsItZsI5H2Fo87h8nv9epvsi5JM0aHJ7VBN07pv6pnx4Oyw62pylWBNGOcaEOuBxki3LEJK4CYWgHF6p8JpRO7dLUYn1SunzGuZLYO83ZlyikcBhW28GhMmEgOyEeGBoQJPDZmAD0O7bz7pfiXybfcmBkWvk2zqHI3LvFswCPIUAO7HXcqKXTGPKkTrhoezNFAkfbPZ+85u7S3FZCZCSFihBEsyEUtkincv+rOtMQayM7z0weTTKJrxbRitTgIysgiLMAewhAkQJeoe6Bqm3JZ8IzVL6fgJ4sL2NLXWchAKxl0an3O3Vb5MeoYDogkMCyBUfnLQeBf6fj/IEAqzL9MO6XUvsYZSxCnkrg2gZtW7GRxDqpcNxg+Y+EQelxJ4Hj8xVZy7CmrBxdGu2BRPcyMZpHMA96S4LjDVZvGPF1Ocuxi6OPPFWkP7eDveD5R8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR08MB5732.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39840400004)(396003)(346002)(366004)(376002)(451199015)(83380400001)(86362001)(26005)(6916009)(6512007)(31696002)(316002)(2906002)(53546011)(966005)(478600001)(6486002)(6506007)(41300700001)(4326008)(66946007)(66556008)(8676002)(186003)(2616005)(5660300002)(44832011)(8936002)(38100700002)(66476007)(31686004)(107886003)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnFiTTNTc3VZcm54cW1WRSs4Y05YYlNvQldVS1FsaHhlMGV0ejFxd2lQTHQw?=
 =?utf-8?B?S203a3JTU1lxWDhTaERyRHNaMXNsa2FnUFR2dGtHbUJwNTNUeVJGekc4Tlkv?=
 =?utf-8?B?eTgzN2dQTEVCUWx6Z2gxVXN3cU8zcFNCTG5WNEtqYVhmdlIxVm9lVktYWnVu?=
 =?utf-8?B?M2VhYzBxSjYwdzF0Vlh2TUF5a3pMdUtSTDhPZ09VRWUzc2h5YXVkaUhNb29X?=
 =?utf-8?B?cTdpVDZTVGpjd1EwY1FKQldyVW1LM3NjVDNid25BaFEvQnIyNnVqck5NeUU5?=
 =?utf-8?B?RG1ZaTFYS3NTSTI2STJIdUkyRnFESG9kS2tZN2E5ZGZmc05rV2tPbkM3MWtm?=
 =?utf-8?B?UzhjQjhTVjRLU1paSGt6ZjZKT3dISjBhd040ancrYytaR0kreVlLeG9BZXRT?=
 =?utf-8?B?aFF2YXFPOFQ5czB1dTJxNFpoakZBcWNQa3h6cnVTc2ZlNnpuNE9qeWUwbHZy?=
 =?utf-8?B?NTVTMGhCZVlMaXhicUJReFJpRjllMzdLd1BHQjdsR1NEVFBzeGM2Uzl3T2h4?=
 =?utf-8?B?SWloMC9XZjZyZytVUEJVSGNuR1czVzFldGRCRDBUc0FWdFFOelBERFdDblVk?=
 =?utf-8?B?TFVCbEUvbnhBY1dtazdqdWdOMnRObjFXTWtSL3dtNS83TjF1ZlVQSEFBZWh2?=
 =?utf-8?B?RWtYUXhJNFhQby94am5YWmZhdWh0OElvc0R3TEZTblhIMWlES2tRSGdpRnpN?=
 =?utf-8?B?cUlhZkZwOVNHWXo0RTNpb1ZuNXExdk44eU1CZXBxQkd2OW9jeHZBZXc0cHNt?=
 =?utf-8?B?c3J0SThBbUM4Mi8yZGY3SUdxSWZkd2hHNHpHUm14TGxZd0dBVlhraFYwdVRw?=
 =?utf-8?B?TTlmN1piTGM5Wkl0b2VsNEFTdk5VSXg0L1gxQ0diOEdYKy9oOVJNNDBUME91?=
 =?utf-8?B?S1psckxScEZHUG5vczhMaGlZRXVwM2x0d1BNY1gxTTY3S012SnNHcFhiSkRZ?=
 =?utf-8?B?R09KNjZHZFMzdk9YSTUrVGtnZGFsWm5pUEtIa28vSWYvRGJVU2RxVlFZS1FJ?=
 =?utf-8?B?MWE2TGQvc2xINHpncnVaVW5iT3JvdGM5ZEVWVVNIcUVRcDMwenpZZkdBanlo?=
 =?utf-8?B?NU9ZWmN0YUUrZ1pFUzRDZ1R6WWpQS3FpYjBGQWZvUGdMelNPd3VCb21hVkxp?=
 =?utf-8?B?eDlrM0todXlrbkpvejB2WUZMV3NhTEJwNklFTXFud1RZMDFSZVVUa2JHKzV4?=
 =?utf-8?B?TlVvRU9vQ3hOOG1sSUNNOTdZYjdMTGF1YkxvNXJCU2NDaTQzQ0tGQml4WTA3?=
 =?utf-8?B?cDYybm45elhrcHowblZZU1gyOVJ5a1I2MnNhK1BzSGJUcVhveE5jNUZFSWEv?=
 =?utf-8?B?WUlLcFFNNkRkSDBabElCcXlBcUdkRGttU1crMkdOVzYwQytUYXVDTVA0QVl2?=
 =?utf-8?B?L0RnUU4xazhLTDBnb1J1NFB3eGpnMVBVSmlLSHRZSnVLcEd2dVV2TXRJNGxw?=
 =?utf-8?B?Z2ltTlFENm1yR0x6MG1WV1JyRlp6UVI3eUpFcXJNMlNBWHkyNUp5ZmtzQitY?=
 =?utf-8?B?SVVhYTN4Q0o1UjM4QndENmJzZnBXd3dOQlFHMXpzTHkwRllEcW9iSUIyOVlJ?=
 =?utf-8?B?OUx3R3ZwQTZQMXVTaTdLZjdDTVZWU29JcmRiS2lGeGFISXRCVnZKUFAvcTU1?=
 =?utf-8?B?aGZWWG9na1Z6T2xGa2N0WnZ5VEdKSWI3ajM1dUQ1dVh0enlyMTdSUnhiaGlx?=
 =?utf-8?B?ejRlUUtQQVIyRmsvYVNqSWdBdGh5YmlBYnNwTWVXaHN1bUJyUjBXd2IyZ0sw?=
 =?utf-8?B?T2xuV1QrZ2JiZjRLcmUwV1YzenlvZHdYMjV6dW96RjVIdTg0N2cyRkpmb2p0?=
 =?utf-8?B?Y3FNQTZ3OVU0c0Y5VS9CK1JhN3pjVnVaQWx4QXhWQlNSTVJXMTllakdlMHNC?=
 =?utf-8?B?WVZsOHFScEUvbm1VdzlHM1ZlbzRTTXhodE5LQXJzbGxoUzYxY1RnU3hFczAz?=
 =?utf-8?B?T3A5TWlzOUdMb2hiOVlBSi9CT29MTWx3T0lzY3ZGeGppYWsvWWNGZVVSaDds?=
 =?utf-8?B?ZXZBVDV4UWhOSVd4NFd5VmtXWHpyeUNOSjR4NTBESGVlczFuRHBJU0V1REpH?=
 =?utf-8?B?N0dSZnlkS1l4Z3hwcWliZzFQTWZmVXRhMGVpQzUwSVJhKzBJZEpyZjFOdE5V?=
 =?utf-8?B?WDZVNWI0blVsTFVIMytlckFyQm01L0lGQmR3bUZ0Z2NDMG9mRXpyQ1hNMkQ1?=
 =?utf-8?Q?/aIVMbpk8bl6GfMraPJpmlg=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af963a3-acf4-43ef-4f05-08daa6bc50a7
X-MS-Exchange-CrossTenant-AuthSource: AM8PR08MB5732.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 10:28:16.4644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kYi3NFtfPxuX1S6cyzqthlF2WQgGDNSB6Gh0Dqm1bJ6aiUJBaw8iq6NFs6xS8KDTzUe+mv5Jsd7bl3iOYPkseJg5YzxTrvVevdM0v2EjIfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5661
Received-SPF: pass client-ip=40.107.105.124;
 envelope-from=andrey.zhadchenko@virtuozzo.com;
 helo=EUR03-AM7-obe.outbound.protection.outlook.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.449,
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



On 10/4/22 21:26, Stefan Hajnoczi wrote:
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
> 
>> QEMU drive options: cache=none
>> filesystem: xfs
> 
> Please post the full QEMU command-line so it's clear exactly what this
> is benchmarking.

The full command for vhost is this:
qemu-system-x86_64 \
-kernel bzImage -nographic -append "console=ttyS0 root=/dev/sdb rw 
systemd.unified_cgroup_hierarchy=0 nokaslr" \
-m 1024 -s --enable-kvm -smp $2 \
-drive id=main_drive,file=debian_sid.img,media=disk,format=raw \
-drive id=vhost_drive,file=$1,media=disk,format=raw,if=none \
-device vhost-blk-pci,drive=vhost_drive,num-threads=$3

(num-threads option for vhost-blk-pci was not used)

For virtio I used this:
qemu-system-x86_64 \
-kernel bzImage -nographic -append "console=ttyS0 root=/dev/sdb rw 
systemd.unified_cgroup_hierarchy=0 nokaslr" \
-m 1024 -s --enable-kvm -smp $2 \
-drive file=debian_sid.img,media=disk \
-drive file=$1,media=disk,if=virtio,cache=none,if=none,id=d1,aio=threads\
-device virtio-blk-pci,drive=d1

> 
> A preallocated raw image file is a good baseline with:
> 
>    --object iothread,id=iothread0 \
>    --blockdev file,filename=test.img,cache.direct=on,aio=native,node-name=drive0 >    --device virtio-blk-pci,drive=drive0,iothread=iothread0
The image I used was preallocated qcow2 image set up with dm-qcow2 
because this vhost-blk version directly uses bio interface and can't 
work with regular files.

> 
> (BTW QEMU's default vq size is 256 descriptors and the number of vqs is
> the number of vCPUs.)
> 
>>
>> SSD:
>>                 | randread, IOPS  | randwrite, IOPS |
>> Host           |      95.8k	 |	85.3k	   |
>> QEMU virtio    |      57.5k	 |	79.4k	   |

Adding iothread0 and using raw file instead of qcow2 + dm-qcow2 setup 
brings the numbers to
                   |      60.4k   |      84.3k      |

>> QEMU vhost-blk |      95.6k	 |	84.3k	   |
>>
>> RAMDISK (vq == vcpu):
> 
> With fio numjobs=vcpu here?

Yes

> 
>>                   | randread, IOPS | randwrite, IOPS |
>> virtio, 1vcpu    |	123k	  |	 129k       |
>> virtio, 2vcpu    |	253k (??) |	 250k (??)  |
> 
> QEMU's aio=threads (default) gets around the single IOThread. It beats
> aio=native for this reason in some cases. Were you using aio=native or
> aio=threads?

At some point of time I started to specify aio=threads (and before that 
I did not use this option). I am not sure when exactly. I will 
re-measure all cases for the next submission.

> 
>> virtio, 4vcpu    |	158k	  |	 154k       |
>> vhost-blk, 1vcpu |	110k	  |	 113k       |
>> vhost-blk, 2vcpu |	247k	  |	 252k       |

