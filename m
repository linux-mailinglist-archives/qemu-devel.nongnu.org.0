Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 791C33A1A10
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:47:27 +0200 (CEST)
Received: from localhost ([::1]:51844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr0QQ-0006e0-5f
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr0PT-0005xq-S6
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:46:27 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:40803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr0PS-00037Q-4n
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:46:27 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 mp5-20020a17090b1905b029016dd057935fso1621046pjb.5
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 08:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S4LQQdlXLHpR38GmfIIu9CcWmDHek0B55Z1B3PJ/AgM=;
 b=m5DpaeQs46j/b9WZpHRGZHVT4OK6v7MrYVQfYrymwlwbXMH5dAew7GWe7DXr2Pp9Jr
 t/n53zp7EqLFmArBbW0YZ2h+KdcbMNX17wLveVnuLsL1eGHlQYSNznJe0naTfSBCvgc9
 5fBNrqrTjqpSkoOJzXyqYrSaTNxM7h5hxdv21odaBKrFtrx7BsIiWvwkVh9IzqbrHaN/
 A1Fonb6yBeB0/WtuJjMNRb9pXu7RLREhcqDR9Xrl2tPH9fcNbXtTH7xRyq57S07ZOpB3
 UsxzDiHs3btDBPqGOGSSyqwg41ZYlKH0j2U2BmFXG9Lr1m5sA6Gkwo0Xkezj9GYrTcFv
 9Q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S4LQQdlXLHpR38GmfIIu9CcWmDHek0B55Z1B3PJ/AgM=;
 b=gIBM5B7lDEPzDN+y8YDxnTrD1MyemcxjlUNhLZFFJrIUa+Gr78So33fpxiXiObPDdj
 y9xhARh5QCIpQQxXKrpd5wOIT/yNEAwIwfv+Mif6LaBm2Xd7DgRUPmEuupxCi8/Guohh
 Vg0TEy8cP/8LWrKh/w8E/lWoD5QKDNGtRiMTsnjbOeczMneNy1AnXvfGUnaQVkkH1Z4R
 ZIaQCKxKNNgsqeypdsNmOXZBOmPqbFmwPg4knwRqwuH6ec3tEFlBeZSqlhNHWvnndPko
 EiOZgaHTvB/jw96EKnSZNcj+auh2Vp9/1IzrN1TEr+dAb/I+SVjbtSZlZQJPgh6Ef520
 I2ng==
X-Gm-Message-State: AOAM531hu0QdpaZzd3QgLMySMQb/7JVCiLUgYTtVtOqR5dbRMrlO2V48
 /hmnPOF3LQd4teMX3oKoa0NsPg+jLibllg==
X-Google-Smtp-Source: ABdhPJw8U/OJoWaani3ASzphmJ+fC3FNYj1WBSN1gpSCc0OySomSUAYiklX0BptiNSDfke6sL0EtqQ==
X-Received: by 2002:a17:90b:318:: with SMTP id
 ay24mr10693517pjb.150.1623253584040; 
 Wed, 09 Jun 2021 08:46:24 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 l201sm41227pfd.183.2021.06.09.08.46.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 08:46:23 -0700 (PDT)
Subject: Re: [PATCH 05/26] configure, meson: convert pam detection to meson
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
 <20210608112301.402434-6-pbonzini@redhat.com>
 <08135c0f-ce6b-53ad-be57-eba428fbfbf5@linaro.org>
 <YL/RJUcRTCzlLq2y@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c5386a2c-a3b4-0354-5cde-dcbecc587ca9@linaro.org>
Date: Wed, 9 Jun 2021 08:46:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YL/RJUcRTCzlLq2y@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/21 1:20 PM, Daniel P. Berrangé wrote:
> On Tue, Jun 08, 2021 at 12:45:51PM -0700, Richard Henderson wrote:
>> On 6/8/21 4:22 AM, Paolo Bonzini wrote:
>>> +pam = not_found
>>> +if not get_option('auth_pam').auto() or have_system
>>> +  pam = cc.find_library('pam', has_headers: ['security/pam_appl.h'],
>>
>> The condition doesn't look right.
>> Why are we looking for pam if --disable-pam-auth?
>>
>> Surely
>>
>>    if not get_option('auth_pam').disabled() and have_system
> 
> This isn't entirely obvious at first glance, but the line after
> the one you quote with the 'required' param makes it "do the
> right thing (tm)".
> 
> The 'auth_pam' option is a tri-state taking 'enabled', 'disabled'
> and 'auto', with 'auto' being the default state. When a tri-state
> value is passed as the value of the 'required' parameter, then
> 
>     required==enabled   is interpreted as 'required=true'
>     required==auto      is interpreted as 'required=false'
>     required==disabled  means the entire call is a no-op
> 
> So this logic:
> 
>   if not get_option('auth_pam').auto() or have_system
>      pam = cc.find_library('pam', has_headers: ['security/pam_appl.h'],
>                            required: get_option('auth_pam'),
> 			  ...)
> 
> Means
> 
>    => If 'auto' is set, then only look for the library if we're
>       building system emulators. In this case 'required:' will
>       evaluate to 'false', and so we'll gracefully degrade
>       if the library is missing.

If not have_system, there's no point in looking for pam *at all* regardless of 
get_option().

>    => If 'disabled' is set, then the 'find_library' call
>       will not look for anything, immediately return a
>       'not found' result and let the caller carry on.

This is not true.  If 'required: false', find_library *will* look for the 
library, but it will allow it to be missing.

 From the meson docs:

>     meson.get_compiler('c').find_library('m', required: false),
...
> The `required: false` means the build will continue when using another C library
> that does not separate the maths library. See [Add math library (-lm)
> portably](howtox.md#add-math-library-lm-portably).
So if auto, and not system, we will look for (and maybe find) pam.  But then... 
I guess through a complex sequence of events arrives at

   softmmu_ss.add(authz, blockdev, chardev, crypto, io, qmp)

So pam doesn't get included into the user-only binaries anyway, but, geez.


r~

