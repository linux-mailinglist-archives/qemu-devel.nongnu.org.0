Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E11E043CF0A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:51:25 +0200 (CEST)
Received: from localhost ([::1]:59058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfm97-0002YX-0y
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mflWt-00025u-DN
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:11:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mflWm-0001Tr-Qh
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:11:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635351107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tp8pI/NX9R97ElgvFrMxoiR0pIFpk3lkgyhZal5vqeg=;
 b=P/LVBvrw2T8wopg3f4vSEiHWY2etNEJNnSWMyszWaVduCs2l+A9++nrQpd7vVFNpKdQ9ne
 nh8bfJEL5MmPm3EPVhlBcpcJifrRwGIwazMmhGj37EP0G4gQyThr1c2xq6cJPhuntMnj1r
 Hy+rET5zgKcxMrOHQkwaKP/0Fi9/V8U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-E8JUzJAdOTaNpsEjCRA9hg-1; Wed, 27 Oct 2021 12:11:45 -0400
X-MC-Unique: E8JUzJAdOTaNpsEjCRA9hg-1
Received: by mail-wr1-f69.google.com with SMTP id
 f1-20020a5d64c1000000b001611832aefeso849065wri.17
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 09:11:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Tp8pI/NX9R97ElgvFrMxoiR0pIFpk3lkgyhZal5vqeg=;
 b=ctitJTV2yw8DvvMer+xF6bBZC7/5yQZ3Xiyu9uHdh2fG2d3LPkspqV971F6Re+j6PJ
 9q4eab9gV6BwLsYcTE6XvdfIN7UkqZ0V4XqRt8HJ52KNjCZfNoYRnwdFXo4neQClBlK1
 kKTqq7VMppkZprlZC6l3V/nWK4JWkrXhOPxIMcnvM72l3lEkvMOgxPQ7CvQNjkm0jYev
 VodY9VVBBQsTUV09bTo9B9PY1zzaCqyeEXygTP7TTNoTrPHkMaVSQmGUAUzFpdhFdLEw
 IXnGKkN3IglUisf1nhbN4y6uytaUWSFXhtwYrY/Htm2YQf0rcdXq+c//r3hbV3ROTDnK
 ykaQ==
X-Gm-Message-State: AOAM531qynDJ4W7undOrByXeWNVZ3hPisMJAFkzEK/ogGCltJLl4dOYr
 VihHIg4zB44pFb5Lvi70aGEaVVZ5mwR3n2n4zIFENxmJOrLNglOn0ZxTGpWI6QtinpBdhfhhM1q
 sfC7S6D7JWFqTgi0=
X-Received: by 2002:a5d:47c5:: with SMTP id o5mr12831792wrc.195.1635351104146; 
 Wed, 27 Oct 2021 09:11:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpOLW7jV+/HatJTkMLZ6kOwq0FymModjxXnE+UfPNLOc8xkzUcru8/8mr4YXejMngGEKv0Wg==
X-Received: by 2002:a5d:47c5:: with SMTP id o5mr12831751wrc.195.1635351103961; 
 Wed, 27 Oct 2021 09:11:43 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id r10sm296226wrl.92.2021.10.27.09.11.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 09:11:43 -0700 (PDT)
Message-ID: <99dde5cf-2f96-18c9-a806-f72365f68f8c@redhat.com>
Date: Wed, 27 Oct 2021 18:11:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 02/12] vhost: Return number of free memslots
To: David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20211027124531.57561-1-david@redhat.com>
 <20211027124531.57561-3-david@redhat.com>
 <4ce74e8f-080d-9a0d-1b5b-6f7a7203e2ab@redhat.com>
 <7f1ee7ea-0100-a7ac-4322-316ccc75d85f@redhat.com>
 <8fc703aa-a256-fdef-36a5-6faad3da47d6@redhat.com>
 <20211027113245-mutt-send-email-mst@kernel.org>
 <1a01da70-fc6d-f0f0-bd75-8f0a3c2dff94@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <1a01da70-fc6d-f0f0-bd75-8f0a3c2dff94@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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

On 10/27/21 17:45, David Hildenbrand wrote:
> On 27.10.21 17:33, Michael S. Tsirkin wrote:
>> On Wed, Oct 27, 2021 at 04:11:38PM +0200, Philippe Mathieu-Daudé wrote:
>>> On 10/27/21 16:04, David Hildenbrand wrote:
>>>> On 27.10.21 15:36, Philippe Mathieu-Daudé wrote:
>>>>> On 10/27/21 14:45, David Hildenbrand wrote:
>>>>>> Let's return the number of free slots instead of only checking if there
>>>>>> is a free slot. Required to support memory devices that consume multiple
>>>>>> memslots.
>>>>>>
>>>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>>>> ---
>>>>>>  hw/mem/memory-device.c    | 2 +-
>>>>>>  hw/virtio/vhost-stub.c    | 2 +-
>>>>>>  hw/virtio/vhost.c         | 4 ++--
>>>>>>  include/hw/virtio/vhost.h | 2 +-
>>>>>>  4 files changed, 5 insertions(+), 5 deletions(-)
>>>
>>>>>> -bool vhost_has_free_slot(void)
>>>>>> +unsigned int vhost_get_free_memslots(void)
>>>>>>  {
>>>>>>      return true;
>>>>>
>>>>>        return 0;
>>>>
>>>> Oh wait, no. This actually has to be
>>>>
>>>> "return ~0U;" (see real vhost_get_free_memslots())
>>>>
>>>> ... because there is no vhost and consequently no limit applies.
>>>
>>> Indeed.
>>>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> confused. are you acking the theoretical patch with ~0 here?
>>
> 
> That's how I interpreted it.

~0U doesn't seem harmful when comparing. However I haven't tested
nor looked at the big picture. I wonder if vhost_has_free_slot()
shouldn't take the Error* as argument and each implementation set
the error message ("virtio/vhost support disabled" would be more
explicit in the stub case). But I still don't understand why when
built without virtio/vhost we return vhost_get_free_memslots() > 0.


