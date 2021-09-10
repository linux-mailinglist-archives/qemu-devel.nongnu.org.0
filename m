Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4C9407225
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 21:53:47 +0200 (CEST)
Received: from localhost ([::1]:35034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOman-0003RT-WA
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 15:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mOmYy-0002h9-Cf
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 15:51:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mOmYu-000221-5V
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 15:51:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631303506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xKu7yupIc3SJR/EYbXiqnXMO8rMLJd2qHieNeyGPvag=;
 b=Tb+aZhPWnggKqOPVbd4Wn9Dx9E87wnjmpsH/Ugq2izyVBhwMOh4aZxT/lPql0xLlz3wH4L
 AkEpKgJJlG6OZ+v9B09w0GyP7vZJPPQgDn3y5SM3Rvcw18kwcOsJ9h09EQbF5tKo3rXruq
 3GERHewAaNT5eIFeW2sdHjPc62+sorU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-0NOuExJoN4Sl9SZD3j6snw-1; Fri, 10 Sep 2021 15:51:44 -0400
X-MC-Unique: 0NOuExJoN4Sl9SZD3j6snw-1
Received: by mail-wm1-f70.google.com with SMTP id
 m10-20020a7bcf2a000000b00301f07cdca5so601831wmg.9
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 12:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xKu7yupIc3SJR/EYbXiqnXMO8rMLJd2qHieNeyGPvag=;
 b=rALVwsSUWZOGrfO//XEHZ5nYkBlh7Y/gN5Uw1i1IqOwhgXhkqXMV1ssar9D4l19zMU
 C4wH88dCTTxu9WOQ6NxGI4PrQLZRfUcBw3jnEP/JdEXpyVG4ZizktyAeku3eDj2BQlcy
 kkKDyQJA1EvEEgPi3o3am1T6Qy0YtiBeZ4moB6DSvzwD0JSvtXJ8kJaF3hTUzKtbs235
 G7251Eq85XYN6okUdBZ5ce5BWCYcybWunz1OxI7a7JbR/xHBWDAaG+6Wu28uYkTnCXr8
 2g5NtmUamoQ0IzHnvguzg6mQvv84jcp0XLabP3E95+AUKLz5XXJliVpoYZ9CuDbpuHpz
 vf5g==
X-Gm-Message-State: AOAM530GnfbSIFuYqtvjPc6ULJ0ZHeuB78Jsw2w+hVtg7l4p9Wo9sQH8
 tvQZQLFcWTfn4/1OiIeJUfeUkTZIhl3PJ27b2zi3jmUw3MFmzqTmeod+NX8fpQA0DC30CK4Ddto
 gMSpOmRPyDrbp0bw=
X-Received: by 2002:a7b:c316:: with SMTP id k22mr10097598wmj.56.1631303503731; 
 Fri, 10 Sep 2021 12:51:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVPLwCwRP1Dkhd3EOZ8fLPVif95n6MjzWAImoIe0xgu16Pj+W5oHu0Hf3QVg+D5VHwl1japg==
X-Received: by 2002:a7b:c316:: with SMTP id k22mr10097586wmj.56.1631303503474; 
 Fri, 10 Sep 2021 12:51:43 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id t18sm5342281wrp.97.2021.09.10.12.51.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 12:51:42 -0700 (PDT)
Subject: Re: [PATCH v4 22/33] hostmem-epc: Add the reset interface for EPC
 backend reset
To: Sean Christopherson <seanjc@google.com>
References: <20210719112136.57018-1-yang.zhong@intel.com>
 <20210719112136.57018-23-yang.zhong@intel.com>
 <dc8394c5-52a1-573f-36d3-de8bc43973d3@redhat.com>
 <YTt7H9ifqjeOQztl@google.com>
 <b940de84-7eac-59de-7b15-15060c31de52@redhat.com>
 <YTuXJUjR8noe34h6@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cfcf6570-79c2-f351-d651-2cb25f691165@redhat.com>
Date: Fri, 10 Sep 2021 21:51:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTuXJUjR8noe34h6@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Yang Zhong <yang.zhong@intel.com>, jarkko@kernel.org, eblake@redhat.com,
 qemu-devel@nongnu.org, kai.huang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/09/21 19:34, Sean Christopherson wrote:
> On Fri, Sep 10, 2021, Paolo Bonzini wrote:
>> On 10/09/21 17:34, Sean Christopherson wrote:
>>> The only other option that comes to mind is a dedicated ioctl().
>>
>> If it is not too restrictive to do it for the whole mapping at once,
>> that would be fine.
> 
> Oooh, rats.  That reminds me of a complication.  If QEMU creates multiple EPC
> sections, e.g. for a vNUMA setup, resetting each section individually will fail
> if the guest did an unclean RESET and a given enclaves has EPC pages from multiple
> sections.  E.g. an SECS in vEPC[X] can have children in vEPC[0..N-1], and all
> those children need to be removed before the SECS can be removed.  Yay SGX!
> 
> There are two options: 1) QEMU has to handle "failure", or 2) the kernel provides
> an ioctl() that takes multiple vEPC fds and handles the SECS dependencies.  #1 is
> probably the least awful option.  For #2, in addition to the kernel having to deal
> with multiple fds, it would also need a second list_head object in each page so
> that it could track which pages failed to be removed.  Using the existing list_head
> would work for now, but it won't work if/when an EPC cgroup is added.
> 
> Note, for #1, QEMU would have to potentially do three passes.
> 
>    1. Remove child pages for a given vEPC.
>    2. Remove SECS for a given vEPC that were pinned by children in the same vEPC.
>    3. Remove SECS for all vEPC that were pinned by children in different vEPC.

It's also possible that QEMU handles failure, but the kernel does two 
passes; then QEMU can just do two passes.  The kernel will overall do 
four passes, but:

1) the second (SECS pinned by children in the same vEPC) would be 
cheaper than a full second pass

2) the fourth would actually do nothing, because there would be no pages 
failing the EREMOV'al.

A hypothetical other SGX client that only uses one vEPC will do the 
right thing with a single pass.

Paolo


