Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2096E4949
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 15:05:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poOXN-0005cb-Vx; Mon, 17 Apr 2023 09:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1poOXJ-0005c2-AD
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 09:04:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1poOXH-0005uf-3Z
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 09:04:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681736685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YuuzdsHrTL7qHxLNBK6JBf4R+oAi3RLDVgN/ipnTuBI=;
 b=isYL3GXNFvLdNRpwM0fVZ9hlpLsxqrDiyh7R4Xb+slIf8lF9JltEn0a9ABH0Rd6yE6LqML
 6W9QqSqVFRre+86s1KsrWkIFvydUK0Rv06Y0eouJiI0gLAwSHfkhNZv268i2ZccSA1L4IH
 TysN5iTrMBtaX1J7Isz7w5vNXL78x3M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-3oOMCi0CM5SfmIbbvOmBuA-1; Mon, 17 Apr 2023 09:04:44 -0400
X-MC-Unique: 3oOMCi0CM5SfmIbbvOmBuA-1
Received: by mail-wm1-f70.google.com with SMTP id
 p34-20020a05600c1da200b003f175d06dfcso441933wms.2
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 06:04:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681736683; x=1684328683;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YuuzdsHrTL7qHxLNBK6JBf4R+oAi3RLDVgN/ipnTuBI=;
 b=FqrIV+ZMvG8UDxAimGQv8JX/mkjQG+618Y8pcAUOI+cZsZQ1maC+27/c+bJVQuRkW0
 34/JL3kUnKlAMySATfYxP+2rGde0x8Mq0/R/SYl8y1O7rY5eoKVjyJ3pKsVuCnTUb4wP
 QQoPRu+NHkSKgfkqPSSovKB0aSkpa0FPvmmBuEP937NV2j0dXLTmu8Z8i3zH1YCKz0ZY
 Zz0oWboxPf85nELdK9+OHeHmxH822TCNezMOrJgydsxSO+KLtLJj/9NKzRd6Y4Am8XOa
 P350YxyDrjoqfy9mGo+DebhWr/DHiU03aWPflBsfTnGHyqYabNIecjjJXypRJBdhXjwL
 KYiw==
X-Gm-Message-State: AAQBX9eZ1LT7tOIEGxJffqAvzx16NNwEPtAvS/1jL7cdFdg1eGsVfkYb
 2UWWh6bBMkGAshyK+4kzmwti+KPABljihzHM3FSwbj/JuDGWd0pRq9/mj5DALFplhQrf3IGZ8VK
 fvHyT98P6dpn9BuQ=
X-Received: by 2002:a7b:cb49:0:b0:3f0:8fb3:24ea with SMTP id
 v9-20020a7bcb49000000b003f08fb324eamr10676437wmj.9.1681736683293; 
 Mon, 17 Apr 2023 06:04:43 -0700 (PDT)
X-Google-Smtp-Source: AKy350YB8FrIHMum++PNVcGyI1V4F5lv4Mbq8gekLLuRMtpsxwvdNpzRnsQ4Ng9JwS4xXAZnUHYxCA==
X-Received: by 2002:a7b:cb49:0:b0:3f0:8fb3:24ea with SMTP id
 v9-20020a7bcb49000000b003f08fb324eamr10676420wmj.9.1681736682947; 
 Mon, 17 Apr 2023 06:04:42 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-194.web.vodafone.de.
 [109.43.177.194]) by smtp.gmail.com with ESMTPSA id
 x2-20020a05600c21c200b003f1739a0116sm2920088wmj.33.2023.04.17.06.04.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 06:04:42 -0700 (PDT)
Message-ID: <e07fc160-c147-6c00-41ca-bc106dd6220c@redhat.com>
Date: Mon, 17 Apr 2023 15:04:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PULL 70/73] hw/pxb-cxl: Support passthrough HDM Decoders unless
 overridden
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Fan Ni <fan.ni@samsung.com>, Ben Widawsky <ben.widawsky@intel.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <cover.1678237635.git.mst@redhat.com>
 <154070eaf6597c47f64c3ea917bcba62427ae61f.1678237635.git.mst@redhat.com>
 <CAFEAcA-+de+eeLCE4YsAw1O-Qyd_4W1Ra05mGDsU_-3a6d92qw@mail.gmail.com>
 <d98c9298-dd1c-e5d0-bc8c-4a9b6e61db36@redhat.com>
 <20230417072927-mutt-send-email-mst@kernel.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230417072927-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.284, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 17/04/2023 13.29, Michael S. Tsirkin wrote:
> On Mon, Apr 17, 2023 at 01:22:51PM +0200, Thomas Huth wrote:
>> On 11/04/2023 12.26, Peter Maydell wrote:
>>> On Wed, 8 Mar 2023 at 01:14, Michael S. Tsirkin <mst@redhat.com> wrote:
>>>>
>>>> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>>>
>>>> The CXL r3.0 specification allows for there to be no HDM decoders on CXL
>>>> Host Bridges if they have only a single root port. Instead, all accesses
>>>> directed to the host bridge (as specified in CXL Fixed Memory Windows)
>>>> are assumed to be routed to the single root port.
>>>
>>> Hi; in issue https://gitlab.com/qemu-project/qemu/-/issues/1586
>>> it's been pointed out that this commit causes an assertion
>>> failure during 'make check' if you configure with
>>> --enable-qom-cast-debug. You can repro by doing that and running:
>>>
>>>    qemu-system-i386 -display none -machine q35,cxl=on -device pxb-cxl,bus=pcie.0
...
>>> The problem is here:
>>>
>>>> -static void pxb_dev_reset(DeviceState *dev)
>>>> +static void pxb_cxl_dev_reset(DeviceState *dev)
>>>
>>> This function is called from  pxb_cxl_dev_realize(),
>>> which is the realize function for TYPE_PXB_CXL_DEVICE.
>>> That type's parent is TYPE_PCI_DEVICE.
>>>
>>>>    {
>>>>        CXLHost *cxl = PXB_CXL_DEV(dev)->cxl.cxl_host_bridge;
>>>>        CXLComponentState *cxl_cstate = &cxl->cxl_cstate;
>>>> +    PCIHostState *hb = PCI_HOST_BRIDGE(cxl);
>>>>        uint32_t *reg_state = cxl_cstate->crb.cache_mem_registers;
>>>>        uint32_t *write_msk = cxl_cstate->crb.cache_mem_regs_write_mask;
>>>> +    int dsp_count = 0;
>>>>
>>>>        cxl_component_register_init_common(reg_state, write_msk, CXL2_ROOT_PORT);
>>>> -    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, TARGET_COUNT, 8);
>>>> +    /*
>>>> +     * The CXL specification allows for host bridges with no HDM decoders
>>>> +     * if they only have a single root port.
>>>> +     */
>>>> +    if (!PXB_DEV(dev)->hdm_for_passthrough) {
>>>
>>> However, here we try to cast the device pointer to PXB_DEV.
>>> That is not permitted because dev is not of type TYPE_PXB_DEVICE
>>> (either directly or as a parent class). So if you have the QOM
>>> debugging enabled then the attempt to cast causes an assertion
>>> failure.
>>>
>>>> +        dsp_count = pcie_count_ds_ports(hb->bus);
>>>> +    }
>>>> +    /* Initial reset will have 0 dsp so wait until > 0 */
>>>> +    if (dsp_count == 1) {
>>>> +        cxl->passthrough = true;
>>>> +        /* Set Capability ID in header to NONE */
>>>> +        ARRAY_FIELD_DP32(reg_state, CXL_HDM_CAPABILITY_HEADER, ID, 0);
>>>> +    } else {
>>>> +        ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, TARGET_COUNT,
>>>> +                         8);
>>>> +    }
>>>>    }
>>>
>>> What was the intention here with the type hierarchy?
>>> Should TYPE_PXB_CXL_DEVICE be a subclass of TYPE_PXB_DEVICE,
>>> or should the cxl-related functions not be trying to treat
>>> it as a PXB device ?
>>
>> Maybe we should simply revert the commit for the time being (once the 8.1
>> cycle begins), 'til this has properly been solved, so we can enable
>> qom-debug by default again?
> 
> Can you post a revert?

Sure, done here now:
https://lore.kernel.org/qemu-devel/20230417130037.236747-2-thuth@redhat.com/

  Thomas


