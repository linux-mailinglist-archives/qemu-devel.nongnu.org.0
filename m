Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11254318697
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 10:00:21 +0100 (CET)
Received: from localhost ([::1]:55784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA7pk-0003zq-3d
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 04:00:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lA7m0-0002IV-Uj
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 03:56:29 -0500
Received: from mail.ispras.ru ([83.149.199.84]:56628)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lA7lq-0006a3-JH
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 03:56:26 -0500
Received: from [192.168.0.92] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id C21274076257;
 Thu, 11 Feb 2021 08:56:12 +0000 (UTC)
Subject: Re: [PATCH] virtio: disable ioeventfd for record/replay
To: Cornelia Huck <cohuck@redhat.com>
References: <161303249335.948571.16873882207700527766.stgit@pasha-ThinkPad-X280>
 <20210211094406.664520e6.cohuck@redhat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <ad446311-c5f9-9887-73d5-3c1f3707e5d1@ispras.ru>
Date: Thu, 11 Feb 2021 11:56:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210211094406.664520e6.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.211,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.02.2021 11:44, Cornelia Huck wrote:
> On Thu, 11 Feb 2021 11:34:53 +0300
> Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> wrote:
> 
>> virtio devices support separate iothreads waiting for
>> events from file descriptors. These are asynchronous
>> events that can't be recorded and replayed, therefore
>> this patch disables ioeventfd for all devices when
>> record or replay is enabled.
>>
>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>> ---
>>   hw/virtio/virtio-pci.c |    6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
>> index 094c36aa3e..76fbc111ea 100644
>> --- a/hw/virtio/virtio-pci.c
>> +++ b/hw/virtio/virtio-pci.c
>> @@ -37,6 +37,7 @@
>>   #include "qemu/range.h"
>>   #include "hw/virtio/virtio-bus.h"
>>   #include "qapi/visitor.h"
>> +#include "sysemu/replay.h"
>>   
>>   #define VIRTIO_PCI_REGION_SIZE(dev)     VIRTIO_PCI_CONFIG_OFF(msix_present(dev))
>>   
>> @@ -1746,6 +1747,11 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
>>           proxy->flags &= ~VIRTIO_PCI_FLAG_USE_IOEVENTFD;
>>       }
>>   
>> +    /* fd-based ioevents can't be synchronized in record/replay */
>> +    if (replay_mode != REPLAY_MODE_NONE) {
>> +        proxy->flags &= ~VIRTIO_PCI_FLAG_USE_IOEVENTFD;
>> +    }
>> +
>>       /*
>>        * virtio pci bar layout used by default.
>>        * subclasses can re-arrange things if needed.
>>
>>
> 
> I think you would need to do the same for any device using ioeventfd,
> no?

That's right.
It seems, that ioeventfd is used in virtio-ccw, virtio-mmio, and 
virtio-pci. The second one is related to KVM only, right?

And the first one should be updated too for replay.



