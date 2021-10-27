Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E45E43CEF8
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:49:52 +0200 (CEST)
Received: from localhost ([::1]:55858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfm7b-0000MC-CV
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfl78-0006hS-MM
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:45:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfl77-0004CL-2R
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:45:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635349515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SIGkDHIUVkYP70eTHFjrm/6ZTOCdlcXs59fUFAQIFH4=;
 b=KeIUhgO9OZIFli1o85PS+5DI+X0nB6pcCBnc+SCfRuhB6+jBuRxFWnvYnLiKybqgjFNw4l
 FSO11zWL8shZZYhL1JI05RXf8YboaLFYHK9Nti1NkHAyBVo0N4edQgkA3RtZ3Q83OtMvZs
 wjSc02sVQxUY4NuDgrnBPKhkOV+JODg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-Qmg_xmqlP3mGi5pQpuomnQ-1; Wed, 27 Oct 2021 11:45:14 -0400
X-MC-Unique: Qmg_xmqlP3mGi5pQpuomnQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 a18-20020a1cf012000000b0032ca3eb2ac3so1366523wmb.0
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 08:45:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SIGkDHIUVkYP70eTHFjrm/6ZTOCdlcXs59fUFAQIFH4=;
 b=UtTgy6LcbFupS13wegXCXH003wq9uXReQWiHF+nfNlvbVQ5/j5McJApv5yAsKvPSP+
 JJps+aQt9pB6eUPfTyG7Huzv6ups657mUFRFQv1s9zvJ7uKWTnuFY696n6VEUEvgh5DQ
 II2svrseSJkZn7XBm4F5vyvtMOh2cJoE7h2yVVO0aXZMc7dpO1rD6ymqIrCyXAMtaPF3
 p+v9nwfh5VvM1aKLogJZzp48dglEOArVFbickqWPYt5XnBEzs0CLdVo++zzZrCWoUE+N
 07S7p8aI2m7o112OqGyt8+GbpvfHGqeRCWJllBEulIbnOaCOLtN4W1BPPE0gszhfVy6m
 pc+Q==
X-Gm-Message-State: AOAM530JUKWbz4H338EhUAOklFd0hZKnv3zNUnCkCysvwuS+V4EjP1O9
 U+Y+1+9NIjCi0XppcNkesvcLpflfibB846Bj2dryDI2zdjOYuheo0vmBQFN7DjXEIF6LZZkjnNu
 UrcTjOzyeEqnVj6o=
X-Received: by 2002:a7b:c8d0:: with SMTP id f16mr6422799wml.193.1635349513364; 
 Wed, 27 Oct 2021 08:45:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHTYW5hgWloBaFrBCq9K/FgnbelKLC8BS0fFuuZPYsub01BQvaMISk1qWWRLde3+jZig5qCw==
X-Received: by 2002:a7b:c8d0:: with SMTP id f16mr6422768wml.193.1635349513180; 
 Wed, 27 Oct 2021 08:45:13 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23d76.dip0.t-ipconnect.de. [79.242.61.118])
 by smtp.gmail.com with ESMTPSA id m125sm3608153wmm.44.2021.10.27.08.45.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 08:45:12 -0700 (PDT)
Message-ID: <1a01da70-fc6d-f0f0-bd75-8f0a3c2dff94@redhat.com>
Date: Wed, 27 Oct 2021 17:45:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v1 02/12] vhost: Return number of free memslots
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20211027124531.57561-1-david@redhat.com>
 <20211027124531.57561-3-david@redhat.com>
 <4ce74e8f-080d-9a0d-1b5b-6f7a7203e2ab@redhat.com>
 <7f1ee7ea-0100-a7ac-4322-316ccc75d85f@redhat.com>
 <8fc703aa-a256-fdef-36a5-6faad3da47d6@redhat.com>
 <20211027113245-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211027113245-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Hui Zhu <teawater@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27.10.21 17:33, Michael S. Tsirkin wrote:
> On Wed, Oct 27, 2021 at 04:11:38PM +0200, Philippe Mathieu-Daudé wrote:
>> On 10/27/21 16:04, David Hildenbrand wrote:
>>> On 27.10.21 15:36, Philippe Mathieu-Daudé wrote:
>>>> On 10/27/21 14:45, David Hildenbrand wrote:
>>>>> Let's return the number of free slots instead of only checking if there
>>>>> is a free slot. Required to support memory devices that consume multiple
>>>>> memslots.
>>>>>
>>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>>> ---
>>>>>  hw/mem/memory-device.c    | 2 +-
>>>>>  hw/virtio/vhost-stub.c    | 2 +-
>>>>>  hw/virtio/vhost.c         | 4 ++--
>>>>>  include/hw/virtio/vhost.h | 2 +-
>>>>>  4 files changed, 5 insertions(+), 5 deletions(-)
>>
>>>>> -bool vhost_has_free_slot(void)
>>>>> +unsigned int vhost_get_free_memslots(void)
>>>>>  {
>>>>>      return true;
>>>>
>>>>        return 0;
>>>
>>> Oh wait, no. This actually has to be
>>>
>>> "return ~0U;" (see real vhost_get_free_memslots())
>>>
>>> ... because there is no vhost and consequently no limit applies.
>>
>> Indeed.
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> confused. are you acking the theoretical patch with ~0 here?
> 

That's how I interpreted it.

-- 
Thanks,

David / dhildenb


