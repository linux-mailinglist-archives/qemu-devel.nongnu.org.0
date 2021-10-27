Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E7143CC10
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 16:24:13 +0200 (CEST)
Received: from localhost ([::1]:35948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfjqe-0002h4-4E
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 10:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfj7S-0006AH-TC
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:37:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfj7Q-0001Js-KR
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:37:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635341847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ut7JFSM6pT1dCI/plvMy2BAlhUzvqJVXt8BhFqSqPVU=;
 b=bu9nVm4oBWGQNQx+m3aPlMxqyjnNnXjG+petxXcLeIUp6g2H7LKzKvqKD9POtajBocSfRE
 bzc04przVG+W/HM06xQ8uUTbqRPW5O6Rl41Aijfzs0LUy3UrHhkRcOPdeO76CKd80zXCp+
 N0vqTiAkmrx989e8mwCW0bKuXu7VyQE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-XKKspuCtOZumo_cf3xfv7Q-1; Wed, 27 Oct 2021 09:37:24 -0400
X-MC-Unique: XKKspuCtOZumo_cf3xfv7Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 i8-20020a5d6308000000b001742659b50eso255559wru.23
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 06:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ut7JFSM6pT1dCI/plvMy2BAlhUzvqJVXt8BhFqSqPVU=;
 b=LXjhWwBGIVpYrEdmVdhY45272SrRlvq1X3HOu0/EkqZ2qUXj7b2O2wxDWOcXixdm5M
 30gaHudH+eseSFEQx40ACXMY8fwHaAiQGmEhQJkl9qN/6OGwPZL8JbZbfpOUWpC0JfWZ
 lBXENfo88ehRO3e6zGQpw8b3LoIXFThDUltfdosJxPIKmvvBu0YVkivMlwvmoJCICzuG
 pXE9SFfX1ZVUsvhC9kJMPaLy+BdZX85/sWKxgEW0sanhg7T5Bm6eN0SQnYAFCS1cRTHb
 /e570UelcHzni0/+31GsEBof8lV+9yQYegNeaRNf2+gCqZfxUmwOGxihv7ObNDVA1gnK
 SPRA==
X-Gm-Message-State: AOAM533/FdqJisw63rh22HeXQmMz3Acrn+zPiG3EGQfUJVSTwhXSCiSq
 cFfvbJtowIqvZHpK5Yti3U4TXWNLyx/+PiOWwtoyPULlHYar3mzZipIc1va4SfTC7I+zx12NV0b
 3EK/99yKEfd2s/7A=
X-Received: by 2002:a05:6000:154b:: with SMTP id
 11mr40214381wry.422.1635341843365; 
 Wed, 27 Oct 2021 06:37:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSE64BO1997/KxNCx8CUwU8ijBlTBVBUYZasxWGQVPEl+UMA5zCI9OPkDTTnCzFDbSMFniRg==
X-Received: by 2002:a05:6000:154b:: with SMTP id
 11mr40214352wry.422.1635341843200; 
 Wed, 27 Oct 2021 06:37:23 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23d76.dip0.t-ipconnect.de. [79.242.61.118])
 by smtp.gmail.com with ESMTPSA id a4sm3300928wmb.39.2021.10.27.06.37.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 06:37:22 -0700 (PDT)
Message-ID: <a656bb15-0bf1-1738-c6de-6db31bc269c2@redhat.com>
Date: Wed, 27 Oct 2021 15:37:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v1 02/12] vhost: Return number of free memslots
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211027124531.57561-1-david@redhat.com>
 <20211027124531.57561-3-david@redhat.com>
 <4ce74e8f-080d-9a0d-1b5b-6f7a7203e2ab@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <4ce74e8f-080d-9a0d-1b5b-6f7a7203e2ab@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Hui Zhu <teawater@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27.10.21 15:36, Philippe Mathieu-Daudé wrote:
> On 10/27/21 14:45, David Hildenbrand wrote:
>> Let's return the number of free slots instead of only checking if there
>> is a free slot. Required to support memory devices that consume multiple
>> memslots.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>  hw/mem/memory-device.c    | 2 +-
>>  hw/virtio/vhost-stub.c    | 2 +-
>>  hw/virtio/vhost.c         | 4 ++--
>>  include/hw/virtio/vhost.h | 2 +-
>>  4 files changed, 5 insertions(+), 5 deletions(-)
> 
>> --- a/hw/virtio/vhost-stub.c
>> +++ b/hw/virtio/vhost-stub.c
>> @@ -2,7 +2,7 @@
>>  #include "hw/virtio/vhost.h"
>>  #include "hw/virtio/vhost-user.h"
>>  
>> -bool vhost_has_free_slot(void)
>> +unsigned int vhost_get_free_memslots(void)
>>  {
>>      return true;
> 
>        return 0;

Thanks, nice catch!

-- 
Thanks,

David / dhildenb


