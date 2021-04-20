Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6124E36564E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 12:38:47 +0200 (CEST)
Received: from localhost ([::1]:45174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYnmI-0002H6-BO
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 06:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lYnjv-0000AC-DL
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:36:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lYnjp-0003gv-VL
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:36:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618914972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ORKwLvdQIydEPHzqT2Bf7TQG4Zb+GTSjIBEHqGMc1o=;
 b=UYqcfbNka8o1RTa2AciZZbY7aY1OHEjj5iy6CaQjqxqPiTf6sGOJXvAaQnXfZWQwqIGl5v
 WN5Zg6nwk6Msi75g71pLdEW4FeREoFJI6JtrAMZ72D5juMNrLbSa9ZhrvFayUohm2Ad46t
 fReDizfP+E2q7Afgnc/B9X9VxdLwocM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-MzXoYL45MryHMafKxVGiHw-1; Tue, 20 Apr 2021 06:36:08 -0400
X-MC-Unique: MzXoYL45MryHMafKxVGiHw-1
Received: by mail-wm1-f70.google.com with SMTP id
 v65-20020a1cde440000b029012853a35ee7so4696346wmg.2
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 03:36:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=6ORKwLvdQIydEPHzqT2Bf7TQG4Zb+GTSjIBEHqGMc1o=;
 b=VPCEUGFo2B5Fx7oooKncNfbqlKzV+q0a2q4se/xMPLwb3uL9qWUH5eIKhnuIWDERLk
 sXRvbYvgOife0wtjPs5UlkuPYmH/jDmgxMByWXpmE7mgiXHT0YZxJu8fe5V+ViSlb0nu
 +7Yo9SWEAMfiEdOREnr1k7He8uW7vhwho1VofdPRbZG4FRpU/NKR8C2RokmSStAu0YdK
 aABCGRtbJSCjb7JWHaNMorlr4SdgU7RCDaiS2Pb4q+o2Xcj++6JNun8R+Q7sFV4YtteO
 sWtq23flqSvpVnLH1KQyEwxAgnXZxC+mERkL+soqEtReGY8sXJ4Jip8J4s1AzxMGV8pO
 rkcg==
X-Gm-Message-State: AOAM5319jc3JhsQRn8I4srG9kkcJ4tv3zZvOW9tvRR5DSsqjx/sL96HU
 zkpeV5VTQrxtfPgwgOyK9ux4QdY8mTV18LOPOHSdxLm386WVCAox4Rx4etJylhtdtU7Ja+NFCee
 m6RcdB5nnEwMzIXE=
X-Received: by 2002:adf:f44e:: with SMTP id f14mr20047501wrp.254.1618914967176; 
 Tue, 20 Apr 2021 03:36:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyx6HpbbW1eg0r27BkJbEfQKubmGx4CtpUpSMLoOtg08Aj+uO0w6EGnOOzLRpeYZRh5VUn1Sg==
X-Received: by 2002:adf:f44e:: with SMTP id f14mr20047454wrp.254.1618914966936; 
 Tue, 20 Apr 2021 03:36:06 -0700 (PDT)
Received: from [192.168.3.132] (p4ff2390a.dip0.t-ipconnect.de. [79.242.57.10])
 by smtp.gmail.com with ESMTPSA id
 s21sm2827816wmc.10.2021.04.20.03.36.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 03:36:06 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210413091421.7707-1-david@redhat.com>
 <20210413091421.7707-5-david@redhat.com>
 <83201a21-7f05-88dd-abc7-59576bce2fe9@redhat.com>
 <6ab168bd-113c-6fcb-658a-70f71aca4ab0@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v5 04/14] softmmu/memory: Pass ram_flags to
 qemu_ram_alloc_from_fd()
Message-ID: <063387fa-0123-5260-dfb5-caf482dfcd05@redhat.com>
Date: Tue, 20 Apr 2021 12:36:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <6ab168bd-113c-6fcb-658a-70f71aca4ab0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.04.21 12:18, Philippe Mathieu-Daudé wrote:
> Hi David,
> 
> On 4/20/21 11:52 AM, Philippe Mathieu-Daudé wrote:
>> On 4/13/21 11:14 AM, David Hildenbrand wrote:
>>> Let's pass in ram flags just like we do with qemu_ram_alloc_from_file(),
>>> to clean up and prepare for more flags.
>>>
>>> Simplify the documentation of passed ram flags: Looking at our
>>> documentation of RAM_SHARED and RAM_PMEM is sufficient, no need to be
>>> repetitive.
>>>
>>> Reviewed-by: Peter Xu <peterx@redhat.com>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>> ---
>>>   backends/hostmem-memfd.c | 7 ++++---
>>>   hw/misc/ivshmem.c        | 5 ++---
>>>   include/exec/memory.h    | 9 +++------
>>>   include/exec/ram_addr.h  | 6 +-----
>>>   softmmu/memory.c         | 7 +++----
>>>   5 files changed, 13 insertions(+), 21 deletions(-)
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
> 
> Actually it would be clearer to define the 0 value, maybe:
> 
> #define RAM_NOFLAG     (0 << 0)
> 

This will also turn some code into

ram_flags = backend->share ? RAM_SHARED : RAM_NOFLAG;
ram_flags |= backend->reserve ? RAM_NOFLAG : RAM_NORESERVE;


Looking at other flag users, I barely see any such usage. 
XKB_CONTEXT_NO_FLAGS, ALLOC_NO_FLAGS, and MEM_AFFINITY_NOFLAGS seem to 
be the only ones. That's why I tend to not do it unless there are strong 
opinions.

Thanks!

-- 
Thanks,

David / dhildenb


