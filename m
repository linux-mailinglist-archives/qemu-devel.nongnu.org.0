Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B07623FFD
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 11:37:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot4uh-0004Sc-HI; Thu, 10 Nov 2022 05:36:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot4uR-0004Pr-0v
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:35:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot4uP-0003iU-6k
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:35:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668076543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6hZGp1VAFcLK03jBBoEVfDzGSthi0Iv/q08I5lrM8e4=;
 b=aKuQmjOHReL0PvB+Se8PplK4gGrwCseezQWi7qmkCZnfdtjquL1DWXFaWzQ22/dHCgpfsW
 1z3kKb4XJTd9Oe9Gincqw0tbBvDkDqAz7g0/X6OZrtSOciHsstswnSzIAR28c/nPu8BH8B
 hqknK+JE5b5BZRvBL7m+8+gPpe9bBDw=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-37-yaXbF_bqP0WDNarmTVKEIQ-1; Thu, 10 Nov 2022 05:35:42 -0500
X-MC-Unique: yaXbF_bqP0WDNarmTVKEIQ-1
Received: by mail-pg1-f198.google.com with SMTP id
 p18-20020a63e652000000b0046b27534651so814731pgj.17
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 02:35:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6hZGp1VAFcLK03jBBoEVfDzGSthi0Iv/q08I5lrM8e4=;
 b=H6O5Jk+ZSR55TChpKGrpw/vxDE50aDJvunpG2YqlvitLCnZVjL4YnxXB39QA43S8tZ
 pFhKHRljGVvFQMHS+X4Q2nurgm5jlJo6BqqRvV9NDPYtwrU7jT/ni1/aufVPkiBsgade
 3PFznYpTw8xd2evfF1sCIhBieCQJNQG1ev4UdWK4r8mIc+KmYtCchOHrYjphGgQJxUJO
 BIuNLRdj8ahLSBgp2Gx9LV4MNLGH8axeZUeKzfXKpVGasLGWM9AgqTbvjHFBUGLEBGC9
 d64l+0hsye73zkDm0PWIQ/vhj90Zrb6AD/TpFNd1qasAfL1TS1mbdmNO5bD6rbNuJXtt
 QR6w==
X-Gm-Message-State: ACrzQf2pPwltcjgqJ9iszoRxkJnsW93T3PWKu2ZNrhusEbqugrjo5d0z
 8PLiqp/fHzQc9xS8uO/W5CWLng+HKKm/ZAUVo+LlXj6xDTUYsydNaiCwInzN7S4XEmlua48Q2iM
 lpYWQ0MMUQApi/Qg=
X-Received: by 2002:a63:f505:0:b0:46f:59af:c1f4 with SMTP id
 w5-20020a63f505000000b0046f59afc1f4mr2139153pgh.344.1668076541160; 
 Thu, 10 Nov 2022 02:35:41 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6rRjMKCrcSxs5k5uh9ebThbhdJJRhbeRZ5r1J6zfhy0n+iHsUehxE93cuYdKGZYRjoiFq90Q==
X-Received: by 2002:a63:f505:0:b0:46f:59af:c1f4 with SMTP id
 w5-20020a63f505000000b0046f59afc1f4mr2139135pgh.344.1668076540803; 
 Thu, 10 Nov 2022 02:35:40 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a17090a7e0300b002036006d65bsm2764666pjl.39.2022.11.10.02.35.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 02:35:40 -0800 (PST)
Message-ID: <ecc705e7-28b4-c332-fea0-a3db61ecc95b@redhat.com>
Date: Thu, 10 Nov 2022 11:35:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20221104125705.415923-1-thuth@redhat.com>
 <20221104125705.415923-2-thuth@redhat.com> <87sfiufyuu.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/3] net: Move the code to collect available NIC models to
 a separate function
In-Reply-To: <87sfiufyuu.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 07/11/2022 18.34, Alex Bennée wrote:
> 
> Thomas Huth <thuth@redhat.com> writes:
> 
>> The code that collects the available NIC models is not really specific
>> to PCI anymore and will be required in the next patch, too, so let's
>> move this into a new separate function in net.c instead.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   include/net/net.h |  1 +
>>   hw/pci/pci.c      | 29 +----------------------------
>>   net/net.c         | 36 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 38 insertions(+), 28 deletions(-)
>>
>> diff --git a/include/net/net.h b/include/net/net.h
>> index 3db75ff841..c96cefb89a 100644
>> --- a/include/net/net.h
>> +++ b/include/net/net.h
>> @@ -189,6 +189,7 @@ void qemu_set_vnet_hdr_len(NetClientState *nc, int len);
>>   int qemu_set_vnet_le(NetClientState *nc, bool is_le);
>>   int qemu_set_vnet_be(NetClientState *nc, bool is_be);
>>   void qemu_macaddr_default_if_unset(MACAddr *macaddr);
>> +GPtrArray *qemu_get_nic_models(const char *device_type);
>>   int qemu_show_nic_models(const char *arg, const char *const *models);
>>   void qemu_check_nic_model(NICInfo *nd, const char *model);
>>   int qemu_find_nic_model(NICInfo *nd, const char * const *models,
>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>> index 2f450f6a72..2b7b343e82 100644
>> --- a/hw/pci/pci.c
>> +++ b/hw/pci/pci.c
>> @@ -1964,7 +1964,6 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
>>                                  const char *default_devaddr)
>>   {
>>       const char *devaddr = nd->devaddr ? nd->devaddr : default_devaddr;
>> -    GSList *list;
>>       GPtrArray *pci_nic_models;
>>       PCIBus *bus;
>>       PCIDevice *pci_dev;
>> @@ -1979,33 +1978,7 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
>>           nd->model = g_strdup("virtio-net-pci");
>>       }
>>   
>> -    list = object_class_get_list_sorted(TYPE_PCI_DEVICE, false);
>> -    pci_nic_models = g_ptr_array_new();
>> -    while (list) {
>> -        DeviceClass *dc = OBJECT_CLASS_CHECK(DeviceClass, list->data,
>> -                                             TYPE_DEVICE);
>> -        GSList *next;
>> -        if (test_bit(DEVICE_CATEGORY_NETWORK, dc->categories) &&
>> -            dc->user_creatable) {
>> -            const char *name = object_class_get_name(list->data);
>> -            /*
>> -             * A network device might also be something else than a NIC, see
>> -             * e.g. the "rocker" device. Thus we have to look for the "netdev"
>> -             * property, too. Unfortunately, some devices like virtio-net only
>> -             * create this property during instance_init, so we have to create
>> -             * a temporary instance here to be able to check it.
>> -             */
>> -            Object *obj = object_new_with_class(OBJECT_CLASS(dc));
>> -            if (object_property_find(obj, "netdev")) {
>> -                g_ptr_array_add(pci_nic_models, (gpointer)name);
>> -            }
>> -            object_unref(obj);
>> -        }
>> -        next = list->next;
>> -        g_slist_free_1(list);
>> -        list = next;
>> -    }
>> -    g_ptr_array_add(pci_nic_models, NULL);
>> +    pci_nic_models = qemu_get_nic_models(TYPE_PCI_DEVICE);
>>   
>>       if (qemu_show_nic_models(nd->model, (const char **)pci_nic_models->pdata)) {
>>           exit(0);
>> diff --git a/net/net.c b/net/net.c
>> index 840ad9dca5..c0516a8067 100644
>> --- a/net/net.c
>> +++ b/net/net.c
>> @@ -899,6 +899,42 @@ static int nic_get_free_idx(void)
>>       return -1;
>>   }
>>   
>> +GPtrArray *qemu_get_nic_models(const char *device_type)
>> +{
>> +    GPtrArray *nic_models;
>> +    GSList *list;
>> +
>> +    list = object_class_get_list_sorted(device_type, false);
>> +    nic_models = g_ptr_array_new();
>> +    while (list) {
>> +        DeviceClass *dc = OBJECT_CLASS_CHECK(DeviceClass, list->data,
>> +                                             TYPE_DEVICE);
>> +        GSList *next;
>> +        if (test_bit(DEVICE_CATEGORY_NETWORK, dc->categories) &&
>> +            dc->user_creatable) {
>> +            const char *name = object_class_get_name(list->data);
>> +            /*
>> +             * A network device might also be something else than a NIC, see
>> +             * e.g. the "rocker" device. Thus we have to look for the "netdev"
>> +             * property, too. Unfortunately, some devices like virtio-net only
>> +             * create this property during instance_init, so we have to create
>> +             * a temporary instance here to be able to check it.
>> +             */
>> +            Object *obj = object_new_with_class(OBJECT_CLASS(dc));
>> +            if (object_property_find(obj, "netdev")) {
>> +                g_ptr_array_add(nic_models, (gpointer)name);
>> +            }
>> +            object_unref(obj);
>> +        }
>> +        next = list->next;
>> +        g_slist_free_1(list);
>> +        list = next;
>> +    }
>> +    g_ptr_array_add(nic_models, NULL);
>> +
>> +    return nic_models;
>> +}
> 
> Is it worth freeing as you go and playing the next/list dance when you
> could just:
> 
>    GPtrArray *qemu_get_nic_models(const char *device_type)
>    {
>        GPtrArray *nic_models = g_ptr_array_new();
>        g_autoptr(GSList) list = object_class_get_list_sorted(device_type, false);
> 
>        do {
>            DeviceClass *dc = OBJECT_CLASS_CHECK(DeviceClass, list->data,
>                                                 TYPE_DEVICE);
>            if (test_bit(DEVICE_CATEGORY_NETWORK, dc->categories) &&
>                dc->user_creatable) {
>                const char *name = object_class_get_name(list->data);
>                /*
>                 * A network device might also be something else than a NIC, see
>                 * e.g. the "rocker" device. Thus we have to look for the "netdev"
>                 * property, too. Unfortunately, some devices like virtio-net only
>                 * create this property during instance_init, so we have to create
>                 * a temporary instance here to be able to check it.
>                 */
>                Object *obj = object_new_with_class(OBJECT_CLASS(dc));
>                if (object_property_find(obj, "netdev")) {
>                    g_ptr_array_add(nic_models, (gpointer)name);
>                }
>                object_unref(obj);
>            }
>        } while ((list = g_slist_next(list)));
>        g_ptr_array_add(nic_models, NULL);
> 
>        return nic_models;
>    }
> 
> I must admit I'm not super clear on the lifetimes
> object_class_get_list_sorted but I assume the contents are static and we
> only need the equivalent of g_slist_free.

Looks like it could work, too. I'll add a patch on top to change it.

  Thomas


