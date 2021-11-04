Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E08F1445614
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 16:12:18 +0100 (CET)
Received: from localhost ([::1]:60558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miePZ-0008Qs-RR
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 11:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mieME-0003XO-KA
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 11:08:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mieM8-0003Oq-3m
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 11:08:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636038522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J5E2jW+aoxCniJzsI0npZoYwRiorJ4P07/gyED+S9Rg=;
 b=Q2i4TooP0RZOESMRNYVpAaXljLjsmufD7fWIZYyEm/uQovHt71ISMh78GSTf0+IDVl6Ixb
 uAKQ7w+ecI4s3MD94EygmypxN/fgFSAEF51nEZ1J+yiV47LP+Ia8rFw+uRUH0kq0GojlLw
 kcZwVpIATfJP6skytSQTh64RCVTv484=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-fsbTiL0-MoaAqf3COQAkQg-1; Thu, 04 Nov 2021 11:08:41 -0400
X-MC-Unique: fsbTiL0-MoaAqf3COQAkQg-1
Received: by mail-wm1-f72.google.com with SMTP id
 j193-20020a1c23ca000000b003306ae8bfb7so2578394wmj.7
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 08:08:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=J5E2jW+aoxCniJzsI0npZoYwRiorJ4P07/gyED+S9Rg=;
 b=1PLboL996vymUhDw+d28eEi5h2H/7BxrR6TErxJ4lujag+WTwFQQ1pjHUYKytiuTI7
 UEgAiAEzYs3jVLPTmS350Ml/B+K1PCaCtaNaa5kNQhcQucaNkAfJs8IXrm7YpQIKtuRd
 r2JqyJU8RYT9lAWooiHJZYe9FfvnsrmFTjc+N6XULvB3BdI5NLNefDZE6Yd9PmIfbXy4
 Ts+47CWMJ1TPq8kq98A6bLzAcXVKnfq4BFatpiSTwfS3CqRCnm6Bfnx+JY+CzMkUSeAn
 D/Z3kjqTBtuI/XsKd7iVQLG4BWxi8Zu4xanrYm5ts1Lo5qiUUjoAo4sh+HQ45vXkZdl9
 GIsg==
X-Gm-Message-State: AOAM533iFv3Df84K8VUqiVj751trc0SB5dMhiqWg6oGRBnHijn/6OTE6
 JI574ZsL4lu6FI2CKa+SgvZ8FNdUxxpVaup42N5wUOy2eWTMCj1r2uSAfir9Z1VOyeoJ7Ju7VRH
 dTMpns91YV0RPFdU=
X-Received: by 2002:a5d:6dab:: with SMTP id u11mr1103635wrs.46.1636038520532; 
 Thu, 04 Nov 2021 08:08:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAUggOJosSlFuRG24ankYdmgPf3FViLWHdWd9DGEtR7m0+KWVSu1Vdm3yBt0Kcj08W9XQKZg==
X-Received: by 2002:a5d:6dab:: with SMTP id u11mr1103580wrs.46.1636038520216; 
 Thu, 04 Nov 2021 08:08:40 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23c9c.dip0.t-ipconnect.de. [79.242.60.156])
 by smtp.gmail.com with ESMTPSA id d16sm1964257wmb.37.2021.11.04.08.08.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 08:08:39 -0700 (PDT)
Message-ID: <f1798844-795a-e5c6-4781-8a6bd4c26b4a@redhat.com>
Date: Thu, 4 Nov 2021 16:08:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH v2 2/2] s390x: Implement the USER_SIGP_BUSY capability
To: Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>
References: <20211102201122.3188108-1-farman@linux.ibm.com>
 <20211102201122.3188108-3-farman@linux.ibm.com>
 <227c48c0-9736-020a-bf21-f70c850c9480@redhat.com>
 <9f76c37fc79d40a0bf031deafc7ef4c455c4d375.camel@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <9f76c37fc79d40a0bf031deafc7ef4c455c4d375.camel@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


>>
>> Can't we call s390_cpu_reset_sigp_busy() directly from
>> handle_sigp_single_dst(),
>> after the handle_sigp_single_dst() call?
> 
> Can I? Most of the orders in that routine are invoked via
> "run_on_cpu(CPU(dst_cpu), ..." dispatching them to other vcpus, so I
> presumed that was a stacked task. But of course, that doesn't make a
> lot of sense, since it's holding that sigp lock across the duration, so
> it must be a vcpu switch instead. Not sure what I was thinking at the
> time, so I'll give this a try.

These functions are all synchronous. See below.

> 
>>
>> IIRC we could clear it in case cpu->env.sigp_order wasn't set.
>> Otherwise,
>> we'll have to clear it once we clear cpu->env.sigp_order -- e.g., in
>> do_stop_interrupt(), but
>> also during s390_cpu_reset().
>>
>> We could have a helper function that sets cpu->env.sigp_order = 0 and
>> clears the busy indication.
>>
> 
> Agreed, this was some of the refactoring that I had in mind looking at
> this mindboggling patch.
> 
> I would love it if sigp_order weren't limited to the STOP and STOP AND
> STORE STATUS orders, but I hesitate to mess with that too much, for
> fear of ripples across the system.

The only reason for that is that these are the only two (asynchronous)
SIGP orders that can take forever to stop. You could have an endless
stream of program interrupts on such a CPU and the CPU will actually
never process the STOP interrupt. That's why only these are sticky --
because run_on_cpu() itself is synchronous.

Only for SIGP STOP*, run_on_cpu() can return and the order has not been
fully processed.

All other ones are processed completely "synchronously" in QEMU. (using
run_on_cpu(), but they are fully synchronous).

-- 
Thanks,

David / dhildenb


