Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F8E5FC1ED
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 10:24:19 +0200 (CEST)
Received: from localhost ([::1]:34736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiX2I-0006mw-KX
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 04:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oiWxT-000220-B7
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 04:19:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oiWxQ-0002FS-IB
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 04:19:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665562755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1H+4DWrJ9NLdgxI30afdrRPolBETFlmVa3laoe1pgCQ=;
 b=J9zwelO9Ayy5dLq7b8sODP3YwZA7+xSQrAPePIj47gi9B1IlC+WQQYUcUIXnPjyPzy5LvQ
 76HPTeSUM9o/y65fvnsl2oT9A8GqfqLQrojVA13Z8TPVwraW1vLFG5X0kbgq1zSGJxWnvq
 POkox0NYES9aisX+S6Xki7AhJfeptu0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-277-GL9TLcaVO_is_VZOfihfaA-1; Wed, 12 Oct 2022 04:19:14 -0400
X-MC-Unique: GL9TLcaVO_is_VZOfihfaA-1
Received: by mail-wm1-f71.google.com with SMTP id
 r81-20020a1c4454000000b003c41e9ae97dso774031wma.6
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 01:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1H+4DWrJ9NLdgxI30afdrRPolBETFlmVa3laoe1pgCQ=;
 b=LhdBMz3iWRE/3SDDxx2aR650HSaQHgjQ0uuX3FW7N6k1DYDJuJo7dN3QaX4chcIcF2
 us1nLkCeXyL+E37hK2DGfQ6MqN9cOVlqv1Ob2M8z3R3kDSHTVFQkF2RZvH8myXcacyV5
 6GbQ6j10o/hxCs1N7bi3Pa8ACaPY7/6C5bYwI8Lawp464BhJiiaMxFOCUyNzVPaKhg2X
 FoGBFlT5Ytfu8lSaD1/yyPCqweyBd2CW3bEybIYB1Gy0LV295d6VH8yWez/fgEGFbuTr
 P4JwwgmQPiXsRnXYZHezTT88XMEcKsFabjhzR1ZXBCrM76cUASlbZSynO+72xLfPi/jR
 9SIA==
X-Gm-Message-State: ACrzQf1t69VIRD6nRCj8Ms0sj4+VvNAWyO3FEgVGdmn9A4tVb030tmiv
 t9NviZIwZFYyeo/zHmTIXEhoFtYmecvjRsEqziEVujX7FCAwwrfN269uEZAd3xAJET0RvD+pc1k
 +veKDTUiyHYUQBS8=
X-Received: by 2002:a5d:64cd:0:b0:22e:2fc1:9511 with SMTP id
 f13-20020a5d64cd000000b0022e2fc19511mr16799187wri.415.1665562753170; 
 Wed, 12 Oct 2022 01:19:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4VtxA/QrxkKJ0H6Qye4Mt4F8QZ9NtP7Bhavxl0OLPT4Uc6cUKHRkJdsy0YB9dIrngGS3YRUA==
X-Received: by 2002:a5d:64cd:0:b0:22e:2fc1:9511 with SMTP id
 f13-20020a5d64cd000000b0022e2fc19511mr16799166wri.415.1665562752918; 
 Wed, 12 Oct 2022 01:19:12 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:3a00:4f2c:105b:3371:a623?
 (p200300cbc7043a004f2c105b3371a623.dip0.t-ipconnect.de.
 [2003:cb:c704:3a00:4f2c:105b:3371:a623])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a05600c4f5300b003a2e92edeccsm1092813wmq.46.2022.10.12.01.19.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Oct 2022 01:19:12 -0700 (PDT)
Message-ID: <ee441feb-3293-efe7-e273-3d28910a0b19@redhat.com>
Date: Wed, 12 Oct 2022 10:19:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 3/7] util: Introduce ThreadContext user-creatable object
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Michal Privoznik <mprivozn@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
References: <20221010091117.88603-1-david@redhat.com>
 <20221010091117.88603-4-david@redhat.com> <87czayj4ig.fsf@pond.sub.org>
 <e689f938-f95d-f34c-117d-da58315576fa@redhat.com>
 <874jw9fp0j.fsf@pond.sub.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <874jw9fp0j.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.934, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks Markus!

> I just tested again, and get the same result as you.  I figure my
> previous test was with the complete series.
> 
> PATCH 5 appears to make it work.  Suggest to say something like "The
> commit after next will make this work".

I'll phrase it like " We'll wire this up next to make it work."

[...]

>>> So, when a thread is created, its affinity comes from its thread context
>>> (if any).  When I later change the context's affinity, it does *not*
>>> affect existing threads, only future ones.  Correct?
>>
>> Yes, that's the current state.
> 
> Thanks!
> 

I'm adding

"Note that the CPU affinity of previously created threads will not get 
adjusted."

and

"In general, the interface behaves like pthread_setaffinity_np(): host 
CPU numbers that are currently not available are ignored; only host CPU 
numbers that are impossible with the current kernel will fail. If the 
list of host CPU numbers does not include a single CPU that is 
available, setting the CPU affinity will fail."

-- 
Thanks,

David / dhildenb


