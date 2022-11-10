Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC02624289
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 13:46:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot6wB-0002t7-Ph; Thu, 10 Nov 2022 07:45:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot6vx-0002qm-7o
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 07:45:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot6vv-00028i-7d
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 07:45:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668084323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OVY42sqe2r7quUIQVcoKlSKUdEKDes0CbYO0SzjXPVE=;
 b=cL4O28ud+Xnsa6ihmpSlga8L+l8Fo/zM2hvMTk9dKsi38Y3zwbv8X9nEMizRF1CtRwEbg8
 p93z2JcSl/0zJsl7XXXexu5dqK4uR/qW3rUtmi6wNlMjQse9oB8HNAJWVAkeM40GK6UhXn
 xxossev1nmqfxxOYNs/5LnoWfpeSdco=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-530-KqC2RFrUNl2QuOUuY4uuPQ-1; Thu, 10 Nov 2022 07:45:22 -0500
X-MC-Unique: KqC2RFrUNl2QuOUuY4uuPQ-1
Received: by mail-pg1-f199.google.com with SMTP id
 186-20020a6300c3000000b004702c90a4bdso946200pga.9
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 04:45:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OVY42sqe2r7quUIQVcoKlSKUdEKDes0CbYO0SzjXPVE=;
 b=o0yiAlTIqHiadc2SB1I7azq2gij2BQKsAS11ii2wNiL0Ugh+GvpG3Cqd1t0+0n3y8q
 v+QTFLmX2R7be5inKz3L9aBxn+kiLgdR8mcpHsnF0xz67PLPEIa1jmpqMO28p+glwz1l
 /NipFZPhK7M59jQRvnBlmBaficM6jjhoO77dQ/MLzQUC2KXa7BzJqCcrC/LL2t0CrN7a
 ZqP7KMc1uLfAibpp1yoYgcPbtg670OIn9AAif1uXB1i4HKTg5wmG5EB+3LsbD8gbLX2W
 RGf94W5stTbMkC7+V06L0oVUa6BtKP8Jjecse3rEqqEs3+00xcEPgj9On8EBP2wO/1tl
 rILQ==
X-Gm-Message-State: ACrzQf0hGKJeSMSo2DHGa0Q+Za7HT8SLCYyLL2+60MOs31KAa1gw2VhJ
 Dlrw64X/z+VKKgoZPGN2nxnPPmFS5iCjjONTdYENhEJJY8jvZbrCnb8N8qcdo2wRY+8wbBdUiWz
 Lf3+SRnyG4k9hETs=
X-Received: by 2002:a63:5a14:0:b0:41d:c892:2e9 with SMTP id
 o20-20020a635a14000000b0041dc89202e9mr2445923pgb.457.1668084321289; 
 Thu, 10 Nov 2022 04:45:21 -0800 (PST)
X-Google-Smtp-Source: AMsMyM46XHBgqxwbR+IHv2n1U+635aT5aVVc5fE/Q0F+VxZTuogxUMCdxuZ0VPKyuHYBKxVqzjIulA==
X-Received: by 2002:a63:5a14:0:b0:41d:c892:2e9 with SMTP id
 o20-20020a635a14000000b0041dc89202e9mr2445904pgb.457.1668084320832; 
 Thu, 10 Nov 2022 04:45:20 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a170902710300b0017534ffd491sm11220703pll.163.2022.11.10.04.45.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 04:45:20 -0800 (PST)
Message-ID: <800d64b9-c01f-bb12-7db3-b0f559382d1f@redhat.com>
Date: Thu, 10 Nov 2022 13:45:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/3] net: Move the code to collect available NIC models to
 a separate function
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20221104125705.415923-1-thuth@redhat.com>
 <20221104125705.415923-2-thuth@redhat.com> <87sfiufyuu.fsf@linaro.org>
 <ecc705e7-28b4-c332-fea0-a3db61ecc95b@redhat.com>
In-Reply-To: <ecc705e7-28b4-c332-fea0-a3db61ecc95b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/11/2022 11.35, Thomas Huth wrote:
> On 07/11/2022 18.34, Alex Bennée wrote:
>>
>> Thomas Huth <thuth@redhat.com> writes:
>>
>>> The code that collects the available NIC models is not really specific
>>> to PCI anymore and will be required in the next patch, too, so let's
>>> move this into a new separate function in net.c instead.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   include/net/net.h |  1 +
>>>   hw/pci/pci.c      | 29 +----------------------------
>>>   net/net.c         | 36 ++++++++++++++++++++++++++++++++++++
>>>   3 files changed, 38 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/include/net/net.h b/include/net/net.h
>>> index 3db75ff841..c96cefb89a 100644
>>> --- a/include/net/net.h
>>> +++ b/include/net/net.h
>>> @@ -189,6 +189,7 @@ void qemu_set_vnet_hdr_len(NetClientState *nc, int len);
>>>   int qemu_set_vnet_le(NetClientState *nc, bool is_le);
>>>   int qemu_set_vnet_be(NetClientState *nc, bool is_be);
>>>   void qemu_macaddr_default_if_unset(MACAddr *macaddr);
>>> +GPtrArray *qemu_get_nic_models(const char *device_type);
>>>   int qemu_show_nic_models(const char *arg, const char *const *models);
>>>   void qemu_check_nic_model(NICInfo *nd, const char *model);
>>>   int qemu_find_nic_model(NICInfo *nd, const char * const *models,
>>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>>> index 2f450f6a72..2b7b343e82 100644
>>> --- a/hw/pci/pci.c
>>> +++ b/hw/pci/pci.c
>>> @@ -1964,7 +1964,6 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus 
>>> *rootbus,
>>>                                  const char *default_devaddr)
>>>   {
>>>       const char *devaddr = nd->devaddr ? nd->devaddr : default_devaddr;
>>> -    GSList *list;
>>>       GPtrArray *pci_nic_models;
>>>       PCIBus *bus;
>>>       PCIDevice *pci_dev;
>>> @@ -1979,33 +1978,7 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus 
>>> *rootbus,
>>>           nd->model = g_strdup("virtio-net-pci");
>>>       }
>>> -    list = object_class_get_list_sorted(TYPE_PCI_DEVICE, false);
>>> -    pci_nic_models = g_ptr_array_new();
>>> -    while (list) {
>>> -        DeviceClass *dc = OBJECT_CLASS_CHECK(DeviceClass, list->data,
>>> -                                             TYPE_DEVICE);
>>> -        GSList *next;
>>> -        if (test_bit(DEVICE_CATEGORY_NETWORK, dc->categories) &&
>>> -            dc->user_creatable) {
>>> -            const char *name = object_class_get_name(list->data);
>>> -            /*
>>> -             * A network device might also be something else than a NIC, 
>>> see
>>> -             * e.g. the "rocker" device. Thus we have to look for the 
>>> "netdev"
>>> -             * property, too. Unfortunately, some devices like 
>>> virtio-net only
>>> -             * create this property during instance_init, so we have to 
>>> create
>>> -             * a temporary instance here to be able to check it.
>>> -             */
>>> -            Object *obj = object_new_with_class(OBJECT_CLASS(dc));
>>> -            if (object_property_find(obj, "netdev")) {
>>> -                g_ptr_array_add(pci_nic_models, (gpointer)name);
>>> -            }
>>> -            object_unref(obj);
>>> -        }
>>> -        next = list->next;
>>> -        g_slist_free_1(list);
>>> -        list = next;
>>> -    }
>>> -    g_ptr_array_add(pci_nic_models, NULL);
>>> +    pci_nic_models = qemu_get_nic_models(TYPE_PCI_DEVICE);
>>>       if (qemu_show_nic_models(nd->model, (const char 
>>> **)pci_nic_models->pdata)) {
>>>           exit(0);
>>> diff --git a/net/net.c b/net/net.c
>>> index 840ad9dca5..c0516a8067 100644
>>> --- a/net/net.c
>>> +++ b/net/net.c
>>> @@ -899,6 +899,42 @@ static int nic_get_free_idx(void)
>>>       return -1;
>>>   }
>>> +GPtrArray *qemu_get_nic_models(const char *device_type)
>>> +{
>>> +    GPtrArray *nic_models;
>>> +    GSList *list;
>>> +
>>> +    list = object_class_get_list_sorted(device_type, false);
>>> +    nic_models = g_ptr_array_new();
>>> +    while (list) {
>>> +        DeviceClass *dc = OBJECT_CLASS_CHECK(DeviceClass, list->data,
>>> +                                             TYPE_DEVICE);
>>> +        GSList *next;
>>> +        if (test_bit(DEVICE_CATEGORY_NETWORK, dc->categories) &&
>>> +            dc->user_creatable) {
>>> +            const char *name = object_class_get_name(list->data);
>>> +            /*
>>> +             * A network device might also be something else than a NIC, 
>>> see
>>> +             * e.g. the "rocker" device. Thus we have to look for the 
>>> "netdev"
>>> +             * property, too. Unfortunately, some devices like 
>>> virtio-net only
>>> +             * create this property during instance_init, so we have to 
>>> create
>>> +             * a temporary instance here to be able to check it.
>>> +             */
>>> +            Object *obj = object_new_with_class(OBJECT_CLASS(dc));
>>> +            if (object_property_find(obj, "netdev")) {
>>> +                g_ptr_array_add(nic_models, (gpointer)name);
>>> +            }
>>> +            object_unref(obj);
>>> +        }
>>> +        next = list->next;
>>> +        g_slist_free_1(list);
>>> +        list = next;
>>> +    }
>>> +    g_ptr_array_add(nic_models, NULL);
>>> +
>>> +    return nic_models;
>>> +}
>>
>> Is it worth freeing as you go and playing the next/list dance when you
>> could just:
>>
>>    GPtrArray *qemu_get_nic_models(const char *device_type)
>>    {
>>        GPtrArray *nic_models = g_ptr_array_new();
>>        g_autoptr(GSList) list = object_class_get_list_sorted(device_type, 
>> false);
>>
>>        do {
>>            DeviceClass *dc = OBJECT_CLASS_CHECK(DeviceClass, list->data,
>>                                                 TYPE_DEVICE);
>>            if (test_bit(DEVICE_CATEGORY_NETWORK, dc->categories) &&
>>                dc->user_creatable) {
>>                const char *name = object_class_get_name(list->data);
>>                /*
>>                 * A network device might also be something else than a 
>> NIC, see
>>                 * e.g. the "rocker" device. Thus we have to look for the 
>> "netdev"
>>                 * property, too. Unfortunately, some devices like 
>> virtio-net only
>>                 * create this property during instance_init, so we have to 
>> create
>>                 * a temporary instance here to be able to check it.
>>                 */
>>                Object *obj = object_new_with_class(OBJECT_CLASS(dc));
>>                if (object_property_find(obj, "netdev")) {
>>                    g_ptr_array_add(nic_models, (gpointer)name);
>>                }
>>                object_unref(obj);
>>            }
>>        } while ((list = g_slist_next(list)));
>>        g_ptr_array_add(nic_models, NULL);
>>
>>        return nic_models;
>>    }
>>
>> I must admit I'm not super clear on the lifetimes
>> object_class_get_list_sorted but I assume the contents are static and we
>> only need the equivalent of g_slist_free.
> 
> Looks like it could work, too. I'll add a patch on top to change it.

Ok, now I've tried, and it does not work - valgrind compains about leaking 
memory here. The problem is: You have to keep the pointer to the list head 
around, by doing list = g_slist_next(list) you leave memory behind that 
cannot be freed anymore. Thus I'll drop this change for now, since keeping 
the pointer to the list head just for freeing it later is also ugly.

  Thomas


