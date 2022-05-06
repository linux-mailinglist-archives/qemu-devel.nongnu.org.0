Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7765951D292
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 09:51:25 +0200 (CEST)
Received: from localhost ([::1]:39082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmskF-0007Pz-Nc
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 03:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nmsj1-0006eL-5Q
 for qemu-devel@nongnu.org; Fri, 06 May 2022 03:50:07 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:49459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nmsiy-0003TM-3b
 for qemu-devel@nongnu.org; Fri, 06 May 2022 03:50:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651823402;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Aal96kCfsW2df6LVwsjwzVExhovLi6zY09lpD1zJHA=;
 b=AZx/h1dTz0Wm8CeGWYUvqe83VkAK3qCjtVOsFc74I9jYu6X4jY0rLaNV4tcs97f6UE1YAV
 fQvmFxMpMgxP0r0RCdNWylo13AktuaR7L8il75ra0xQqG27HzJBFce5Xj9XegE96R9oxrN
 9QKjsJVJ9wMufgxPwqDVzJoDWc+gJl0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-TldZsBagMACx4Zpxzyp7jQ-1; Fri, 06 May 2022 03:50:01 -0400
X-MC-Unique: TldZsBagMACx4Zpxzyp7jQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 u26-20020adfb21a000000b0020ac48a9aa4so2280529wra.5
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 00:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9Aal96kCfsW2df6LVwsjwzVExhovLi6zY09lpD1zJHA=;
 b=ZasCmYc1Ti/CRn4+ZHQBBqx16eKhIrt9dswtPsBTz4FCFmGmopxUvBG7fqOhKdKIFY
 VCAowA5tZjpLx5SQPU+JWybAK9HkMmyWNBodU5hAAE8nxSC1vAI/+j0A67zzj1zEBd2D
 afOMAFWG+2AS/pz9p9KZlqKPMwZyS789zZjycP/VK5HtJwDp7+y7IRVhwj1yxfHcHn7J
 6UDuSU76ultFIP9HmQsa9Hm/p9v0sszMA5UIt7W3SSfta1KkOEG9QnwsWwSvy5qfMDnT
 DIIkqA7LV3et+f5ad7XhwqZph9LW5lbldUOWLyouxT+nkoYasSnxfNqxp4ocEeDAzUhA
 qFjw==
X-Gm-Message-State: AOAM531YAFxY1eBNmtV+NDz7UsIKVfynxc77RZW3wMza4STs4bwjNgI4
 symjwwANzI/Xz8LeX50O9o3Hzo71KjWJa0bh8eyBudJ6TybynoU61gEmAVeu+6BORipn14pongh
 UNM9joZ8FBauV8nQ=
X-Received: by 2002:a05:6000:1562:b0:20c:64fc:34f with SMTP id
 2-20020a056000156200b0020c64fc034fmr1618854wrz.132.1651823400515; 
 Fri, 06 May 2022 00:50:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEM1NhqJeWY8LqOqZw7MVKGFzO752p+3PYL7rD/roey1DpzuHYsjM2h6ziyNtjvOLod8IaUA==
X-Received: by 2002:a05:6000:1562:b0:20c:64fc:34f with SMTP id
 2-20020a056000156200b0020c64fc034fmr1618839wrz.132.1651823400234; 
 Fri, 06 May 2022 00:50:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1cf608000000b003942a244ed0sm3391877wmc.21.2022.05.06.00.49.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 00:49:59 -0700 (PDT)
Message-ID: <2b710806-cecc-aeb9-aca6-ae5a8ddaa136@redhat.com>
Date: Fri, 6 May 2022 09:49:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4] vfio/common: remove spurious tpm-crb-cmd misalignment
 warning
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 stefanb@linux.vnet.ibm.com, f4bug@amsat.org
References: <20220428134945.511829-1-eric.auger@redhat.com>
 <20220428141423.6e2da84c.alex.williamson@redhat.com>
 <019b265a-2489-c595-acd4-b1b5c1772707@redhat.com> <875ymj5d2z.fsf@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <875ymj5d2z.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.74; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Connie,

On 5/6/22 09:34, Cornelia Huck wrote:
> On Fri, May 06 2022, Eric Auger <eric.auger@redhat.com> wrote:
>
>> Hi Alex,
>>
>> On 4/28/22 22:14, Alex Williamson wrote:
>>> On Thu, 28 Apr 2022 15:49:45 +0200
>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>> +static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
>>>> +{
>>>> +    MemoryRegion *mr = section->mr;
>>>> +
>>>> +    if (!TPM_IS_CRB(mr->owner)) {
>>>> +        return false;
>>>> +    }
>>> It looks like this test is going to need to be wrapped in #ifdef
>>> CONFIG_TPM:
>> sorry for the delay. Your message fell though the cracks :-(
>>
>> if I put an '#ifdef CONFIG_TPM' I need to inverse the logic because by
>> default the function shall return false.
>>
>> solution #1
>>
>> #ifdef CONFIG_TPM  
>>  if (TPM_IS_CRB(mr->owner)) {
>>
>>     /* this is a known safe misaligned region, just trace for debug purpose */
>>     trace_vfio_known_safe_misalignment(memory_region_name(mr),
>>                                        section->offset_within_address_space,
>>                                        section->offset_within_region,
>>                                        qemu_real_host_page_size());
>>
>>     return true;
>>    }
>>
>> #endif
>> return false;
>>
>> This looks weird to me.
>>
>> +    if (!object_dynamic_cast(mr->owner, TYPE_TPM_CRB)) {
>> +        return false;
>> +    }
>>
>>
>> solution #2
>> replace !object_dynamic_cast(mr->owner, TYPE_TPM_CRB) by
>> !object_dynamic_cast(mr->owner, "tpm-crb")
>> and add a comment saying that we don't use TYPE_TPM_CRB on purpose
>>
>> solution #3
>> Move #define TPM_IS_CRB(chr) and related defined out of
>> #ifdef CONFIG_TPM hoping it does not have other side effects
>>
>> Thoughts?
>> Eric
> solution #4
>
> #ifndef CONFIG_TPM
> /* needed for an alignment check in non-tpm code */
> static inline Object *TPM_IS_CRB(Object *obj)
> {
>     return NULL;
> }
> #endif
>
> I think it would be good if we could hide the configuration details in
> the header.
>
Yep, I forgot to mention solution #3 also happened in include/sysemu/tpm.h.
Connie, either we add your stub function or we move the following out of
the #ifdef CONFIG_TPM. This should be harmless, no?
Stefan, any preference?

#define TYPE_TPM_TIS_ISA            "tpm-tis"
#define TYPE_TPM_TIS_SYSBUS         "tpm-tis-device"
#define TYPE_TPM_CRB                "tpm-crb"
#define TYPE_TPM_SPAPR              "tpm-spapr"

#define TPM_IS_TIS_ISA(chr)                         \
    object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_ISA)
#define TPM_IS_TIS_SYSBUS(chr)                      \
    object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_SYSBUS)
#define TPM_IS_CRB(chr)                             \
    object_dynamic_cast(OBJECT(chr), TYPE_TPM_CRB)
#define TPM_IS_SPAPR(chr)                           \
    object_dynamic_cast(OBJECT(chr), TYPE_TPM_SPAPR)

Eric




