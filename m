Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5E643CF94
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 19:19:23 +0200 (CEST)
Received: from localhost ([::1]:39678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfmaA-0005zJ-Li
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 13:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfm9F-0005Fk-OJ
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:51:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfm9D-0007rq-8Y
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:51:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635353488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gy5cJnvtXii1KYg8kaPz4ztKoxko3IwoHdJfXjXNCAc=;
 b=ewq5zh8w2I8nsNmU8fp0O8mdjeg8NrnHFzSpRTKYy7T4Y19a7VibRL0Xb/ZTnEXJ3I0pOV
 8loXmRiC7ff2YnEtPu3Sj5TRROYPOqBRj35b1c8oSlMxLV0o7vt46kOfEEJqkDSvx4vVZp
 O7gfN8hV/7SA0ZJ3p/uu3P2+aqBNlPM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-0unSd3GoO2Ok3kjjVDsuYw-1; Wed, 27 Oct 2021 12:51:27 -0400
X-MC-Unique: 0unSd3GoO2Ok3kjjVDsuYw-1
Received: by mail-wm1-f69.google.com with SMTP id
 g9-20020a1c9d09000000b0032cc23db051so2056784wme.3
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 09:51:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=gy5cJnvtXii1KYg8kaPz4ztKoxko3IwoHdJfXjXNCAc=;
 b=Z/GM7mbEKjzeUMSbixpjvdiqlGepTOJDWWUlGTR0ZLzVUfbFISse/TTaQANH2a3Mv5
 3PICr+77mkFIsCIA0hqXUxskU7/YSyAke6kNAcXKmQRe3oYwoy7ZU3dA8gQCZQtCEXqH
 XsNdQjfe2OKYa3/8AbTfhAWQEAMUjWZgNE2Ms7wEOO+kx7zpcDE7jhuSt7IOy8X/gsfu
 Jg0PBYvYbQya4ZrQNdtq9ieInlMagPtSu7flXKx9ULhBiK142saRLc8hWlMWS3ozFNN6
 2adF78X0tPvLEHY+KeyCpURp/9Vou02l4Xe2fmLvkn0ZrxrRhWXNoOVq3Q29UQP0ewn0
 uWlA==
X-Gm-Message-State: AOAM530HMPypF5Ea5Ztwty5m52C9l4xWHzztK0xMZ0YIfTYtMkKbdmTn
 OuGLizyFFQngSHNtNuni4nm65CJuG9KEJ5uqKQBpGGkEjgvJkmTSKL9vlRLLng23rAsJlqdULDt
 gzU0USs2rlza4yuU=
X-Received: by 2002:a5d:530e:: with SMTP id e14mr42490462wrv.326.1635353486060; 
 Wed, 27 Oct 2021 09:51:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvOL9tcB4shi2C0GoOD7T7Et3/vAlnQm4M0rMtYahyCRUvvNXt2UK95E6yY2/83fDh2wAYXA==
X-Received: by 2002:a5d:530e:: with SMTP id e14mr42490425wrv.326.1635353485826; 
 Wed, 27 Oct 2021 09:51:25 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23d76.dip0.t-ipconnect.de. [79.242.61.118])
 by smtp.gmail.com with ESMTPSA id r1sm4339811wmr.36.2021.10.27.09.51.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 09:51:25 -0700 (PDT)
Message-ID: <747f8a27-5a06-7a82-803f-e5bbf2bbbd7b@redhat.com>
Date: Wed, 27 Oct 2021 18:51:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v1 02/12] vhost: Return number of free memslots
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20211027124531.57561-1-david@redhat.com>
 <20211027124531.57561-3-david@redhat.com>
 <4ce74e8f-080d-9a0d-1b5b-6f7a7203e2ab@redhat.com>
 <7f1ee7ea-0100-a7ac-4322-316ccc75d85f@redhat.com>
 <8fc703aa-a256-fdef-36a5-6faad3da47d6@redhat.com>
 <20211027113245-mutt-send-email-mst@kernel.org>
 <1a01da70-fc6d-f0f0-bd75-8f0a3c2dff94@redhat.com>
 <99dde5cf-2f96-18c9-a806-f72365f68f8c@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <99dde5cf-2f96-18c9-a806-f72365f68f8c@redhat.com>
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

On 27.10.21 18:11, Philippe Mathieu-Daudé wrote:
> On 10/27/21 17:45, David Hildenbrand wrote:
>> On 27.10.21 17:33, Michael S. Tsirkin wrote:
>>> On Wed, Oct 27, 2021 at 04:11:38PM +0200, Philippe Mathieu-Daudé wrote:
>>>> On 10/27/21 16:04, David Hildenbrand wrote:
>>>>> On 27.10.21 15:36, Philippe Mathieu-Daudé wrote:
>>>>>> On 10/27/21 14:45, David Hildenbrand wrote:
>>>>>>> Let's return the number of free slots instead of only checking if there
>>>>>>> is a free slot. Required to support memory devices that consume multiple
>>>>>>> memslots.
>>>>>>>
>>>>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>>>>> ---
>>>>>>>  hw/mem/memory-device.c    | 2 +-
>>>>>>>  hw/virtio/vhost-stub.c    | 2 +-
>>>>>>>  hw/virtio/vhost.c         | 4 ++--
>>>>>>>  include/hw/virtio/vhost.h | 2 +-
>>>>>>>  4 files changed, 5 insertions(+), 5 deletions(-)
>>>>
>>>>>>> -bool vhost_has_free_slot(void)
>>>>>>> +unsigned int vhost_get_free_memslots(void)
>>>>>>>  {
>>>>>>>      return true;
>>>>>>
>>>>>>        return 0;
>>>>>
>>>>> Oh wait, no. This actually has to be
>>>>>
>>>>> "return ~0U;" (see real vhost_get_free_memslots())
>>>>>
>>>>> ... because there is no vhost and consequently no limit applies.
>>>>
>>>> Indeed.
>>>>
>>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>
>>> confused. are you acking the theoretical patch with ~0 here?
>>>
>>
>> That's how I interpreted it.
> 
> ~0U doesn't seem harmful when comparing. However I haven't tested
> nor looked at the big picture. I wonder if vhost_has_free_slot()
> shouldn't take the Error* as argument and each implementation set
> the error message ("virtio/vhost support disabled" would be more
> explicit in the stub case). But I still don't understand why when
> built without virtio/vhost we return vhost_get_free_memslots() > 0.

For the same reason we faked infinite slots via
vhost_has_free_slot()->true for now. We call it unconditionally from
memory device code.

Sure, we could add a stub "vhost_available()-> false" (or
vhost_enabled() ?) instead and do

if (vhost_available())
	... vhost_get_free_memslots()

similar to how we have

if (kvm_enabled())
	... kvm_get_free_memslots()

Not sure if it's worth it, though.

-- 
Thanks,

David / dhildenb


