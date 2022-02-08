Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A39B4ADBA2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 15:54:50 +0100 (CET)
Received: from localhost ([::1]:37602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHRtI-0004J7-UQ
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 09:54:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nHQYm-0002tD-Lo
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 08:29:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nHQYi-0003gV-Tl
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 08:29:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644326967;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZaZu8AfbBcZe/3t05BoqCAaUNvWsAdCpXE3VLiaxKug=;
 b=PNMMpjpoMo7DIsGDIyY7FqJML+V6agJESQb2RXnzVdpmtHXIyNlJYch4rCa+K4Tq7RVeG6
 22MpQpEP2k8bHB9at5FG1OiLHH3hkx6AB6+sbFETwZuuCnvMUCspA8sVya8VnXVzQCATNg
 75J6BDTEoZ/5PqIxUdSaxmkbR7H+7wg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-_DFxy8D7Pxm3wA1W3lYMVQ-1; Tue, 08 Feb 2022 08:29:24 -0500
X-MC-Unique: _DFxy8D7Pxm3wA1W3lYMVQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 i8-20020a1c3b08000000b0037bb9f6feeeso1037996wma.5
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 05:29:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=ZaZu8AfbBcZe/3t05BoqCAaUNvWsAdCpXE3VLiaxKug=;
 b=hVaGR1fK0gjiIpoowZHjhAPUBEfFcycswX1hKMGFHibGev1ja5bo8Y62HqoErrXX+T
 Yc9AUfb/RLo07mLSd7h8JJZl26J3/hidgHNVx444rffXZ6zzORcI2vfv3r4cdPMz70qN
 3ls6URwuwkxRs51tUNtafNV3CrteBH2JqxVYUyIrrTnrCssjZxe24fvZRN1J7+h6ovXH
 x0iLlrvaqSL7MjOcgTcuPImVyeKrPmT0hRu3S70akjtiJOHFjf8W9HbdBpIBS0ltHsvd
 KIevzOYJi1hVrw9Bqv58teFpnymQH7HcpkcWM8vDc16VE4OlNQhYxp3dcP7wdeeujUZW
 DbVw==
X-Gm-Message-State: AOAM531qfI9fXETzYeVpODfFL9JVxkkA1CJqYy/Ieec+ado051xeaROI
 dKtUebMtGGq0Kw+evqn6a+MLdNZhSslNzUJDextt8AkkuEB+AMaax4O+5m8aErugAI5T/WurF8e
 tcVwZ5RHMmErXOhs=
X-Received: by 2002:adf:f54d:: with SMTP id j13mr3418152wrp.596.1644326963368; 
 Tue, 08 Feb 2022 05:29:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9NfLedD3Jt81GQynZ/2Rg3eXrePuGu/L4UZom7wuvMHg81Mzj2yPL4QH9toe9JiJQBr52ag==
X-Received: by 2002:adf:f54d:: with SMTP id j13mr3418139wrp.596.1644326963166; 
 Tue, 08 Feb 2022 05:29:23 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id r2sm4385933wrt.65.2022.02.08.05.29.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 05:29:22 -0800 (PST)
Subject: Re: [PATCH v2 3/4] virtio-iommu: Support bypass domain
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20220127142940.671333-1-jean-philippe@linaro.org>
 <20220127142940.671333-4-jean-philippe@linaro.org>
 <bf447d9b-c039-ccdc-f24f-ab8b56c1b196@redhat.com> <YfffLBO47Sh3uq1b@work-vm>
 <140a23d7-d128-1273-6f07-0883e13c4600@redhat.com> <YgJiWMcPp5OlCUWY@myrica>
 <YgJrc5USsfszKrTw@work-vm>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <ecfc42a0-15bf-3cde-2711-434fdb40f28d@redhat.com>
Date: Tue, 8 Feb 2022 14:29:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YgJrc5USsfszKrTw@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: lvivier@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 thuth@redhat.com, mst@redhat.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, Juan Quintela <quintela@redhat.com>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jean,

On 2/8/22 2:09 PM, Dr. David Alan Gilbert wrote:
> * Jean-Philippe Brucker (jean-philippe@linaro.org) wrote:
>> On Wed, Feb 02, 2022 at 02:21:37PM +0100, Eric Auger wrote:
>>>>>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>>>>>> index ec02029bb6..a112428c65 100644
>>>>>> --- a/hw/virtio/virtio-iommu.c
>>>>>> +++ b/hw/virtio/virtio-iommu.c
>>>>>> @@ -43,6 +43,7 @@
>>>>>>  
>>>>>>  typedef struct VirtIOIOMMUDomain {
>>>>>>      uint32_t id;
>>>>>> +    bool bypass;
>>>>> I am afraid this will break the migration if you don't change
>>>>> vmstate_domain.
>>>>>
>>>>> See static const VMStateDescription vmstate_domain.
>>>>> Also you need to migrate the new bypass field.
>>>>>
>>>>> Logically we should handle this with a vmstate subsection I think to
>>>>> handle migration of older devices. However I doubt the device has been
>>>>> used in production environment supporting migration so my guess is we
>>>>> may skip that burden and just add the missing field. Adding Juan, Dave &
>>>>> Peter for advices.
>>>> I'm not sure about users of this; if no one has used it then yeh; you
>>>> could bump up the version_id to make it a bit clearer.
>>> Thank you for your input. Yes to me it sounds OK to only bump the
>>> version_id while adding the new field.
>> Ok. Just to make sure we're on the same page, this means we don't support
>> migration from new->old or old->new instances, since the migration stream
>> doesn't carry a version ID for the virtio-iommu-device and domain
>> vmstates, as far as I understand. I also believe backward-incompatible
>> changes are fine this time around, though I don't have much visibility in
>> what's being used.
> I think the stream only has it for top level devices; I've not dug into
> this device.
Not sure I get what you meant:

vmstate_virtio_iommu has a version_id. Also vmstate_domain has one.

Thanks

Eric
>
> Dave
>
>> Thanks,
>> Jean
>>


