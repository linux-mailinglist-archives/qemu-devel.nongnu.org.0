Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC0D2D98B7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 14:26:55 +0100 (CET)
Received: from localhost ([::1]:60740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1konsL-0000r1-JO
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 08:26:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1konqc-0000Dv-BE
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 08:25:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1konqZ-0007Es-Gd
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 08:25:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607952301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yLrFUZ6xcMyM8dbFKEFop1xr0zZLhYNsc9KHd8kxwGg=;
 b=IJawySFJ6ABKz5AWj9+uC+R+I8fHd/Oml5BXra3J/w/CBPjGLgZfmRTF5D3AvGmTK2Qt17
 bJeSetM/KjzbuLxofIMbJ4Bs5Y6eyutOM1pZmt1ocOOsDW9afp/Hge006yQK0DsMfPpaw9
 NVH6VaFA8L8ix30iwmWy8iBRqROgIKo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-g0wov69GOE-jUvBqKB9pjw-1; Mon, 14 Dec 2020 08:25:00 -0500
X-MC-Unique: g0wov69GOE-jUvBqKB9pjw-1
Received: by mail-wm1-f69.google.com with SMTP id d16so2691346wmd.1
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 05:24:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yLrFUZ6xcMyM8dbFKEFop1xr0zZLhYNsc9KHd8kxwGg=;
 b=V6DeXQRjVSy8LH0Tdjkz23OjQmDL+NgRh//nSbOOk8otzhDDDqkOFssnlFzvwpjv6G
 iN5+uz6GkmywzPStKds+xIpYuPUye74xsqCv6HiOXtd7iCSEC1ftN2zSSm4dZeClKXYE
 A85F46Gw5cUN5uS5XZB54I7T5mEHyYsC37t78lGojRMDO0xsoI3QPenXMB+0C8j98X5y
 fFzk8MUx+t4HLpPXGDuAZR0W+ZVgkQLDL0PJJi6yTy4Fm2dVByMWfuvqFhsZ5oJiVV3A
 S/IHKHcSn1WZy2twQyKfSwnzuty+fYZEpcSRFU5QtRC+tYo+cg1yHM8uoQqf5lEbTDQm
 pGBw==
X-Gm-Message-State: AOAM5315XrLNjpMMVEVeXp7HrdrSyU/ngSIPSATFOsddZzCI1Yoh3pcF
 QP/89M58QWUvRilT5iIotli/i07io/K9RMyAyj5yHKTkZz1c7qYTE/1jww6vdDvxVk3exXePeIb
 BXYdG1XWAgpqLMUwfNaKwsrta/2o22uQ7+/ThkbOytE4IKzUToLvO61n6775DxrFivEg=
X-Received: by 2002:a5d:488d:: with SMTP id g13mr28654093wrq.274.1607952298605; 
 Mon, 14 Dec 2020 05:24:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZ0vFhu77XGqq4gtlixU7thx4R++rzMSra8u0BD17+v1c8wdRIc2NuslT1/DE8VpDvZSBKNQ==
X-Received: by 2002:a5d:488d:: with SMTP id g13mr28654064wrq.274.1607952298328; 
 Mon, 14 Dec 2020 05:24:58 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z3sm32033370wrn.59.2020.12.14.05.24.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 05:24:57 -0800 (PST)
Subject: Re: [PATCH 14/15] null-machine: do not create a default memdev
To: Igor Mammedov <imammedo@redhat.com>
References: <20201202081854.4126071-1-pbonzini@redhat.com>
 <20201202081854.4126071-15-pbonzini@redhat.com>
 <20201207174359.03b099ce@redhat.com>
 <4e36d013-d379-05e3-7803-eb4df9fbb0d3@redhat.com>
 <20201214125313.0e067fdf@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fbe7df51-0680-923d-e50a-f6b656b006f4@redhat.com>
Date: Mon, 14 Dec 2020 14:24:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201214125313.0e067fdf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/12/20 12:53, Igor Mammedov wrote:
> On Sat, 12 Dec 2020 00:24:25 +0100
> Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
>> On 07/12/20 17:43, Igor Mammedov wrote:
>>>>        mc->default_ram_size = 0;
>>>> -    mc->default_ram_id = "ram";
>>>> +    mc->default_ram_id = NULL;
>>> probably that will break:
>>>
>>>    QEMU -m X -M none
>>
>> No, it works.  "-m" is simply ignored, because the default memdev is
>> created here:
> you mean it doesn't explode.
> By default with current code memdev should not be created,
> but it is created if users asks for it with -m.

Oh ok, got it.  I'll leave this patch aside for now and later, when I 
get round to posting the ram_memdev_id cleanup, try to remember why I 
added it.

> I'm not sure that any RAM on null machine is of any use at all
> but the if we decide to get rid of it completely, then we need
> to clean up
>      /* RAM at address zero */
>      if (mch->ram) {
>          memory_region_add_subregion(get_system_memory(), 0, mch->ram);
>      }

This would still be needed because you _can_ get a non-null mch->ram 
(via "-M memdev") even if mc->default_ram_id == NULL.

Paolo

> and commit title/message should match what patch does and why.
> 
> 
>>       if (machine_class->default_ram_id && current_machine->ram_size &&
>>           numa_uses_legacy_mem() && !current_machine->ram_memdev_id) {
>>           create_default_memdev(current_machine, mem_path);
>>       }
>>
>> and is thus skipped for -M none.
>>
>> Paolo
>>
>>>
>>> maybe there is  a bug over there but
>>>       "mc->default_ram_size = 0"
>>> above, should result in
>>>       current_machine->ram_size == 0
>>> in case user hasn't provided "-m"
>>> and hence memdev shouldn't be created
>>>    
>>
> 


