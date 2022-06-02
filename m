Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4284553B5B3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 11:08:01 +0200 (CEST)
Received: from localhost ([::1]:35080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwgoC-0003Sb-2q
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 05:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nwgez-00013Y-1L
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 04:58:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nwgev-0003qQ-0O
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 04:58:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654160303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QHHhZPNEReae7uDrhQQaxzJlyFyuq/ZiBPU6wUE3JoY=;
 b=QMfYXhrzm9ToTwAFaPmGEmU++DeIkhUP7dWYh75H1NpsNqWs/NLbLCskMnDMZPu4EtT1hy
 VLIm9DRKobLZY8W9CLDELZYLtwPQEPJ7JgO4o1M3HrOqn51VSmjl6J7Amp8bzPqWIYdG74
 TQT7EIWGACvqo7sJq1K33T4jTZOJNAA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-QjF3EjqCPvOEq8NEboYyXQ-1; Thu, 02 Jun 2022 04:58:22 -0400
X-MC-Unique: QjF3EjqCPvOEq8NEboYyXQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 o23-20020a05600c511700b0039743cd8093so2512741wms.6
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 01:58:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=QHHhZPNEReae7uDrhQQaxzJlyFyuq/ZiBPU6wUE3JoY=;
 b=xpvcmz4XSxiuxydmXZLtZoxHN+U5l4P3MVa77HgK0wHDY/SLwVp9JQoSQw9KCvWNKz
 DcNvSa/VvMRUNX1wbKaxQytGs4ytizHZmFrQwNBzg2y5jvEVGQjjuQbo1SyY8Y2ddIDM
 GUi+ndP7xDD0H/qiVbH9EJrvr99M3L6PhQtnrcWDRapoRuznkC+YUUFcNVjn6b8dO9se
 AQvowlLkOJmXiWbdhP9TpELiFlNNpSDxwh/d99aOFELhyzeRZfPxfs1YW9s/3oDdkYQZ
 b7tFrpbMWJw/EOM9PW0oXa4cc/vmZ+hyUV5wZx2oXh/SnavO7HLZxCElpzuteDRRXhTn
 PxSw==
X-Gm-Message-State: AOAM531+rob0u/h1cjr3cuWRNdF/M/eKSZu7nCkOfyzwRBftFvT1sI0Q
 BijBIw2OGVNpLc16pq2aAG6161zAsT9sqYi/bhXhB7S6FHjB/0k3nFAOYq/6vtZFw7RJTHclSnG
 m23wpZ8ZUwNCM3VA=
X-Received: by 2002:a05:600c:acf:b0:397:345f:fe10 with SMTP id
 c15-20020a05600c0acf00b00397345ffe10mr3049086wmr.15.1654160301614; 
 Thu, 02 Jun 2022 01:58:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdOrk/aoRIsHEpwlQyKBAnrpDrHsiQ/QLl3k6m7jmIlUh2rzkCgQv5CFQ2NrmYI4xHgZF2FQ==
X-Received: by 2002:a05:600c:acf:b0:397:345f:fe10 with SMTP id
 c15-20020a05600c0acf00b00397345ffe10mr3049039wmr.15.1654160301152; 
 Thu, 02 Jun 2022 01:58:21 -0700 (PDT)
Received: from [192.168.178.20] (p57a1a7d6.dip0.t-ipconnect.de.
 [87.161.167.214]) by smtp.gmail.com with ESMTPSA id
 b11-20020a5d4d8b000000b0020c7ec0fdf4sm4226808wru.117.2022.06.02.01.58.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 01:58:19 -0700 (PDT)
Message-ID: <0fec9818-bce1-936c-3f6d-488715d9df8c@redhat.com>
Date: Thu, 2 Jun 2022 10:58:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: alex.williamson@redhat.com, schnelle@linux.ibm.com, cohuck@redhat.com,
 thuth@redhat.com, farman@linux.ibm.com, pmorel@linux.ibm.com,
 richard.henderson@linaro.org, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com, mst@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20220524190305.140717-1-mjrosato@linux.ibm.com>
 <20220524190305.140717-3-mjrosato@linux.ibm.com>
 <5b19dd64-d6be-0371-da63-0dd0b78a3a5c@redhat.com>
 <6030c7e6-479d-660c-9198-1c65c74735a1@linux.ibm.com>
 <f8d128d2-e58a-e0a0-ff8a-7ff2b2ffa31e@redhat.com>
 <535b79a5-372d-9bca-d7c7-bac263277230@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v6 2/8] target/s390x: add zpci-interp to cpu models
In-Reply-To: <535b79a5-372d-9bca-d7c7-bac263277230@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

>> That's exactly my point:
>>
>> sigpif and pfmfi are actually vsie features. I'd have expected that
>> zpcii would be a vsie feature as well.
>>
>> If interpretation is really more an implementation detail in the
>> hypervisor to implement zpci, than an actual guest feature (meaning, the
>> guest is able to observe it as if it were a real CPU feature), then we
>> most probably want some other way to toggle it (maybe via the machine?).
>>
>> Example: KVM uses SIGP interpretation based on availability. However, we
>> don't toggle it via sigpif. sigpif actually tells the guest that it can
>> use the SIGP interpretation facility along with vsie.
>>
>> You mention "CLP instructions will look different", I'm not sure if that
>> should actually be handled via the CPU model. From my gut feeling, zpcii
>> should actually be the vsie zpcii support to be implemented in the future.
>>
> 
> Well, what I meant was that the CLP response data looks different, 
> primarily because when interpretation is enabled the guest would get 
> passthrough of the function handle (which in turn has bits turned off 
> that force hypervisor intercepts) rather than one that QEMU fabricated.

Okay, so more some kind of "the device behaves seems to behave slightly
different".

> 
> As far as a machine option, well we still need a mechanism by which 
> userspace can decide whether it's OK to enable interpretation in the 
> first place.  I guess we can take advantage of the fact that the 
> capability associated with the ioctl interface can indicate both that 
> the kernel interface is available + all of the necessary hardware 
> facilities are available to that host kernel.

Yes.

> 
> So I guess we could use that to make a decision to default a machine 
> setting based upon that (yes if everything is available, no if not).

Right, in theory we could enable interpretation whenever possible
(kernel indicates support, including HW support).

In practice, it would be nice to be able to disable zpci interpretation
for debugging purposes.

One option is to simply glue it to compat machines. So selecting an
older compat machine will disable it.

Another option is a e.g., machine property, which can be used to
force-disable it (e.g., zpcii-disabled) and let the property always
default to false.

Third option would simply combine both, making compat machines make
zpcii-disable result in "true".

> 
>>
>> So I wonder if we could simply always enable zPCI interpretation if
>> HW+kernel support is around and we're on a new compat machine? I there
>> is a way that migration could break (from old kernel to new kernel),
>> we'd have to think about alternatives.
> 
> zpci devices are currently marked unmigratable, so if you want to 
> migrate you need to detach all of them first anyway today.

Okay. So it might be reasonable in the future to simply check on source
and migration if zpcii is in the same state if zpci devices are attached
to the VM. If not, simply fail migration -- in sane enironments, we'd
never get a mismatch.

-- 
Thanks,

David / dhildenb


