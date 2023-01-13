Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9446699EC
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 15:19:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKlH-00006c-B0; Fri, 13 Jan 2023 09:10:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lingshan.zhu@intel.com>)
 id 1pGAh1-00044h-N1
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 22:25:23 -0500
Received: from mga01.intel.com ([192.55.52.88])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lingshan.zhu@intel.com>)
 id 1pGAgx-0001Vn-Ot
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 22:25:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673580319; x=1705116319;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=902b+dJEJbw7NaiqF0LBmqm33lJ0fwODg9mEVInmGlQ=;
 b=c9yjButqv9x00izbemF+F+7gTJ/pOKe7H/O0J04kBRZMhFVN+rkudyHj
 m+AD9KmDXONUnkZXJw1IIZNvVSQh995hOT+YQqSKtWz8hqF0eNZKHzWxf
 y4++Exb6hXd5/cI/BUecy7sVyBU71SADgDafyxSlMBYBV4t3C6AopWIIe
 ZOZGkBjdINs4DX4tPNERIIMX0ApEhtzsX0d4R3bIFcSyKt4v1JRqXW9cc
 TScLyWMW+Gt9qRdnEtGiODTtzoVmXL6S41icqT+goe26CS6tmY9CfILAx
 cXOT/Nk6EZc5fskak18lcQWqcRZK6927XBPgwzmrGpIkGQ1x6ach5ZlLa g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="351138498"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; d="scan'208";a="351138498"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 19:25:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="831939598"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; d="scan'208";a="831939598"
Received: from lingshan-mobl.ccr.corp.intel.com (HELO [10.249.168.97])
 ([10.249.168.97])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 19:25:06 -0800
Message-ID: <7438853f-8d5e-33fb-1e53-b4a0036f0b7d@intel.com>
Date: Fri, 13 Jan 2023 11:25:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [RFC v2 12/13] vdpa: preemptive kick at enable
To: Jason Wang <jasowang@redhat.com>, =?UTF-8?Q?Eugenio_P=c3=a9rez?=
 <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, si-wei.liu@oracle.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com,
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-13-eperezma@redhat.com>
 <CACGkMEt8cMM1UxVzxb0eHeaWSpR0ApvGzaF901vrM4m-uGMiPA@mail.gmail.com>
Content-Language: en-US
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <CACGkMEt8cMM1UxVzxb0eHeaWSpR0ApvGzaF901vrM4m-uGMiPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.88; envelope-from=lingshan.zhu@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 13 Jan 2023 09:10:14 -0500
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



On 1/13/2023 10:31 AM, Jason Wang wrote:
> On Fri, Jan 13, 2023 at 1:27 AM Eugenio Pérez <eperezma@redhat.com> wrote:
>> Spuriously kick the destination device's queue so it knows in case there
>> are new descriptors.
>>
>> RFC: This is somehow a gray area. The guest may have placed descriptors
>> in a virtqueue but not kicked it, so it might be surprised if the device
>> starts processing it.
> So I think this is kind of the work of the vDPA parent. For the parent
> that needs this trick, we should do it in the parent driver.
Agree, it looks easier implementing this in parent driver,
I can implement it in ifcvf set_vq_ready right now

Thanks
Zhu Lingshan
>
> Thanks
>
>> However, that information is not in the migration stream and it should
>> be an edge case anyhow, being resilient to parallel notifications from
>> the guest.
>>
>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>> ---
>>   hw/virtio/vhost-vdpa.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>> index 40b7e8706a..dff94355dd 100644
>> --- a/hw/virtio/vhost-vdpa.c
>> +++ b/hw/virtio/vhost-vdpa.c
>> @@ -732,11 +732,16 @@ static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev, int ready)
>>       }
>>       trace_vhost_vdpa_set_vring_ready(dev);
>>       for (i = 0; i < dev->nvqs; ++i) {
>> +        VirtQueue *vq;
>>           struct vhost_vring_state state = {
>>               .index = dev->vq_index + i,
>>               .num = 1,
>>           };
>>           vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
>> +
>> +        /* Preemptive kick */
>> +        vq = virtio_get_queue(dev->vdev, dev->vq_index + i);
>> +        event_notifier_set(virtio_queue_get_host_notifier(vq));
>>       }
>>       return 0;
>>   }
>> --
>> 2.31.1
>>


