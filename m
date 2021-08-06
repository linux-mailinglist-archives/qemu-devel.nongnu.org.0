Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 544A23E2CCC
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 16:36:50 +0200 (CEST)
Received: from localhost ([::1]:56010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC0xt-0002Fj-E2
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 10:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mC0x5-0001aK-01
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:35:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mC0x1-0000dK-N4
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:35:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628260554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xa6ufEo44Fs8CZ1IGA5/aEPNFtfkvQwp9r6mokl/87U=;
 b=fIYYnxtsIjah89Hx5Ku30QJ8QfoFfUYNKRRbbpSFouPmbYqTbwtdU9EK+/L3fF+tevGfyT
 M76juYNCXifxcDHJacwD5NnHMwVI2U2IRL9kyZQHGwudmFUgtjJraHGNuZEYuTeyYzXH53
 IBVvoP/b5UmV0mTGIbqz8eTPUp3CNPU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-fTMSddrJNMWUnU2fz-vJMA-1; Fri, 06 Aug 2021 10:35:46 -0400
X-MC-Unique: fTMSddrJNMWUnU2fz-vJMA-1
Received: by mail-wm1-f69.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so3880744wml.5
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 07:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Xa6ufEo44Fs8CZ1IGA5/aEPNFtfkvQwp9r6mokl/87U=;
 b=Sctwvxx7u96Ap77/zXc3MNY2OdTrec4h8rU4w+pjuht16A5GmCopB09zeYGGW77A97
 6FA/1IofTmsbYG+oBjvFPZtWFD4mcHOrQPIURvrE+Jqb2LQmTWwzV8cNIYsku95Kl+AX
 X3NqWIFRmd+DGFx5oHIRJnjxHIQ7+t9HnrcoxNEbOE5+ooCviWiqhfp98WFYLohbPlDA
 f9P9P5tPX49uECkbJWXgoA46LxZkreiSl8ePi2se+6EgKEYt2UyKWWuqrksLAPBtI3qk
 B2UzRNaXuTelBPjqroCBNkzuy1Ars+MNmmFDo9nqpgQG38y3n2RmuppjxLvPpx11lMCp
 ji2Q==
X-Gm-Message-State: AOAM533Fa1YkPuwUCccvwfO/msSMT/uUFutNyfB7vcq9iUzRFEIe6L7T
 zosPxbtNsUR5TRiLjMYlemqvAe1GI0x5Wey8bVvTg3kFhdYAETe0B5bprITtqAxMMuyaBsNWmRb
 NEygGzyYpY0LBt0s=
X-Received: by 2002:adf:f112:: with SMTP id r18mr10790474wro.160.1628260545691; 
 Fri, 06 Aug 2021 07:35:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7fquynbgoB/8tpsfahA4tBPkEWWi9z76unTp2LkL4RIL8jHwzGd0WDXOgiJZNCdcj+pdbPw==
X-Received: by 2002:adf:f112:: with SMTP id r18mr10790454wro.160.1628260545469; 
 Fri, 06 Aug 2021 07:35:45 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6104.dip0.t-ipconnect.de. [91.12.97.4])
 by smtp.gmail.com with ESMTPSA id j14sm9686217wrr.16.2021.08.06.07.35.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 07:35:45 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
References: <20210805143753.86520-1-david@redhat.com>
 <875ywizupc.fsf@redhat.com> <f699dbe2-1cbb-478a-3330-bd207da12055@redhat.com>
 <344ed7e5-f9a4-6754-32a5-72821e98f869@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1] s390x/ioinst: Fix wrong MSCH alignment check on little
 endian
Message-ID: <258ec4a1-b171-46ec-ef01-d49df3d4b254@redhat.com>
Date: Fri, 6 Aug 2021 16:35:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <344ed7e5-f9a4-6754-32a5-72821e98f869@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.619, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.08.21 16:17, Philippe Mathieu-Daudé wrote:
> On 8/6/21 1:30 PM, David Hildenbrand wrote:
>> On 06.08.21 13:19, Cornelia Huck wrote:
>>> On Thu, Aug 05 2021, David Hildenbrand <david@redhat.com> wrote:
>>>
>>>> schib->pmcw.chars is 32bit, not 16bit. This fixes the kvm-unit-tests
>>>> "css" test, which fails with:
>>>>
>>>>     FAIL: Channel Subsystem: measurement block format1: Unaligned MB
>>>> origin:
>>>>     Program interrupt: expected(21) == received(0)
>>>>
>>>> Because we end up not injecting an operand program exception.
>>>>
>>>> Fixes: a54b8ac340c2 ("css: SCHIB measurement block origin must be
>>>> aligned")
>>>> Cc: Halil Pasic <pasic@linux.ibm.com>
>>>> Cc: Cornelia Huck <cohuck@redhat.com>
>>>> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
>>>> Cc: Richard Henderson <richard.henderson@linaro.org>
>>>> Cc: Thomas Huth <thuth@redhat.com>
>>>> Cc: Pierre Morel <pmorel@linux.ibm.com>
>>>> Cc: qemu-s390x@nongnu.org
>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>> ---
>>>>    target/s390x/ioinst.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> Same question here: still -rc worthy, or not?
>>>
>>
>> It's been broken forever, this can also wait I guess.
> 
> But the commit referenced is recent:
> 
> commit a54b8ac340c20531daa89929c5ce7fed89fa401d
> Date:   Fri Feb 19 14:39:33 2021 +0100
> 
>      css: SCHIB measurement block origin must be aligned
> 

Well, okay yes :) I don't think it's very urgent though.

-- 
Thanks,

David / dhildenb


