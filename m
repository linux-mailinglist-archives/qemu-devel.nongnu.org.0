Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E52643DC9A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 10:01:37 +0200 (CEST)
Received: from localhost ([::1]:43814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg0Lw-0001Lt-Ex
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 04:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mg0Ij-000053-TS
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 03:58:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mg0IQ-0007I1-Tb
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 03:58:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635407877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hcTcedq2iIbkOoRZQQ3OCJ/abe+lSE7IDZptQHTbL1Y=;
 b=a/RAzbZD3LWxzb9fAlsFTCfO9ykrDv7JcItWZKlbG+FI8rUzLQ2At/mtlnv4rFGEgTY9C1
 gC2gmEuVJxVNNqayDWeuyGbq3psVd4N55qoql7eLwyQxJGyBeWDj2FYm4mjCd9c4t7gBx2
 63J6rvHTiYXcL0B2o9vY4qA15hLU4uU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-VhFXITnYNVCke3fN3PbFcg-1; Thu, 28 Oct 2021 03:57:56 -0400
X-MC-Unique: VhFXITnYNVCke3fN3PbFcg-1
Received: by mail-wm1-f69.google.com with SMTP id
 g195-20020a1c20cc000000b0032e418cd7a9so262816wmg.4
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 00:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hcTcedq2iIbkOoRZQQ3OCJ/abe+lSE7IDZptQHTbL1Y=;
 b=1bPz/5F+go8oKVi+3zJ9RtDVJFEfRyGbyFvw6rhuY9fyjXcutPRQsP55RK1PQ8iuub
 CjT6QY+TPQQJjlcqPH6NlIMvfkigv6d9anB3Qlg9iJKT6LvqnUKQ9UwWwrgkl+P1qXyN
 bKb17npQsnFRVwI02IoHt8+2FcoynishBkUdk3l7taWQigp7fvwH23t+/sIeExrZswbo
 24L1QU88XvymMEzv918s5pGvVvx8rPV0bu/tt9LYc1WyLs6ZXCF7a+YLt8uA+fYgNdK6
 B8/JkIokddjAu+n1VJJ3Exe2NRYUZE/SSvqEQSESc6lER6lu4odbAqeUxBKu8nTuJi/7
 RgXw==
X-Gm-Message-State: AOAM531Ir7fOxlnYfDTzIRlHqrzEIzYZqMrMlfRQzUUDx/azuJc0Jl1y
 BV0Fr/RbD4j5rEMrHW78d/cEgVRHteDbMhWUHgq+XuZz32uNMRooMYzdxXwqVXMFyi9WMvSwZGq
 fbPVbdDLgdGBRitM=
X-Received: by 2002:a05:600c:2049:: with SMTP id
 p9mr9358122wmg.36.1635407874981; 
 Thu, 28 Oct 2021 00:57:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1j04TDgJDGETWkHhomaGjtEurem2DksGC5ReqGk2P0avF3B5Q0i3s6+qNFAuqnkjqkpeNTw==
X-Received: by 2002:a05:600c:2049:: with SMTP id
 p9mr9358105wmg.36.1635407874769; 
 Thu, 28 Oct 2021 00:57:54 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23b52.dip0.t-ipconnect.de. [79.242.59.82])
 by smtp.gmail.com with ESMTPSA id
 t15sm1782629wmi.24.2021.10.28.00.57.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 00:57:54 -0700 (PDT)
Message-ID: <0a61172e-0dd4-e740-68c9-d608fac32d4c@redhat.com>
Date: Thu, 28 Oct 2021 09:57:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v8 5/8] qmp: decode feature & status bits in virtio-status
To: Jonah Palmer <jonah.palmer@oracle.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <1635334909-31614-1-git-send-email-jonah.palmer@oracle.com>
 <1635334909-31614-6-git-send-email-jonah.palmer@oracle.com>
 <00c6f307-4bcc-d9f7-3abb-bde6615eadcd@redhat.com>
 <cabcfcef-7ba1-ea75-2cd8-cbe44ff02ab6@redhat.com>
 <06347f30-203c-2dad-77d7-5d3dccdd8b3f@oracle.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <06347f30-203c-2dad-77d7-5d3dccdd8b3f@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.036,
 DKIM_INVALID=0.1, DKIM_SIGNED=0.1, NICE_REPLY_A=-2.847, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, thuth@redhat.com, mathieu.poirier@linaro.org,
 qemu-block@nongnu.org, mst@redhat.com, armbru@redhat.com, pbonzini@redhat.com,
 qemu_oss@crudebyte.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, arei.gonglei@huawei.com, kraxel@redhat.com,
 stefanha@redhat.com, michael.roth@amd.com, si-wei.liu@oracle.com,
 marcandre.lureau@redhat.com, boris.ostrovsky@oracle.com,
 raphael.norwitz@nutanix.com, eblake@redhat.com, joao.m.martins@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.10.21 09:56, Jonah Palmer wrote:
> On 10/27/21 08:18, Laurent Vivier wrote:
>> On 27/10/2021 13:59, David Hildenbrand wrote:
>>> On 27.10.21 13:41, Jonah Palmer wrote:
>>>> From: Laurent Vivier <lvivier@redhat.com>
>>>>
>>>> Display feature names instead of bitmaps for host, guest, and
>>>> backend for VirtIODevice.
>>>>
>>>> Display status names instead of bitmaps for VirtIODevice.
>>>>
>>>> Display feature names instead of bitmaps for backend, protocol,
>>>> acked, and features (hdev->features) for vhost devices.
>>>>
>>>> Decode features according to device type. Decode status
>>>> according to configuration status bitmap (config_status_map).
>>>> Decode vhost user protocol features according to vhost user
>>>> protocol bitmap (vhost_user_protocol_map).
>>>>
>>>> Transport features are on the first line. Undecoded bits
>>>> (if any) are stored in a separate field. Vhost device field
>>>> wont show if there's no vhost active for a given VirtIODevice.
>>>>
>>>> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
>>>> ---
>>>>   hw/block/virtio-blk.c          |  28 ++
>>>>   hw/char/virtio-serial-bus.c    |  11 +
>>>>   hw/display/virtio-gpu-base.c   |  18 +-
>>>>   hw/input/virtio-input.c        |  11 +-
>>>>   hw/net/virtio-net.c            |  47 ++++
>>>>   hw/scsi/virtio-scsi.c          |  17 ++
>>>>   hw/virtio/vhost-user-fs.c      |  10 +
>>>>   hw/virtio/vhost-vsock-common.c |  10 +
>>>>   hw/virtio/virtio-balloon.c     |  14 +
>>>>   hw/virtio/virtio-crypto.c      |  10 +
>>>>   hw/virtio/virtio-iommu.c       |  14 +
>>>>   hw/virtio/virtio.c             | 273 ++++++++++++++++++-
>>>>   include/hw/virtio/vhost.h      |   3 +
>>>>   include/hw/virtio/virtio.h     |  17 ++
>>>>   qapi/virtio.json               | 577
>>>> ++++++++++++++++++++++++++++++++++++++---
>>>
>>> Any particular reason we're not handling virtio-mem?
>>>
>>> (there is only a single feature bit so far, a second one to be
>>> introduced soon)
>>>
>>
>> I think this is because the v1 of the series has been written in March
>> 2020 and it has not been update when virtio-mem has been added (June
>> 2020).
>>
>> Thanks,
>> Laurent
> 
> Oops, I think I just might've missed this device. I can add in support for virtio-mem
> in the next revision!

Cool, thanks! I consider the introspection interface very valuable!


-- 
Thanks,

David / dhildenb


