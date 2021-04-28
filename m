Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3590936DEB6
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 20:02:29 +0200 (CEST)
Received: from localhost ([::1]:38518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lboW1-0008KM-VA
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 14:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lboU7-0007dJ-7h
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 14:00:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lboU2-0005UV-A0
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 14:00:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619632819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EMVrSVUeJ03GtwDNxpx9JJW5JiDaVadsLkXYOHdhk9U=;
 b=YJo+IAKMZzD1UsJeCGRdXu2aD19PDKc4+dbFcQvbK4T19y8R88XlMxIMpphIFTQ0fUoSh3
 7aSMIRPUlFE877mQx+EDDpDwcYMWMKLOsX+LO8FLALbSiNsPlDn8F4r9pUJMi83JqdQLER
 3eETYEn0uk9SSoP/S+vv8RHbKpCxnDU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-TNO-0_yoMTai6H4vbwb9kw-1; Wed, 28 Apr 2021 14:00:17 -0400
X-MC-Unique: TNO-0_yoMTai6H4vbwb9kw-1
Received: by mail-wr1-f69.google.com with SMTP id
 o14-20020a5d474e0000b029010298882dadso22674000wrs.2
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 11:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EMVrSVUeJ03GtwDNxpx9JJW5JiDaVadsLkXYOHdhk9U=;
 b=YU9stsDHMfnnwCTJDTqk3y30VGRkc9IV/aja468jGQn6yYh9ZVt8AUtBnX3GpJZvaj
 t60stlevClIhYu9Z3u3qSEPPkJwIRhjmGEUPllziN5NqZTNw23RWdoGrmFBXFXTfrTPt
 8Cn5o6DvHeuTpYP17AWS7sGBhY5vF8ERsu06QxIZKQDaq+z1Kuyx7W3XiEGfYMGw1Feb
 SWgv8JRZkVvrC/v4fkbWqoBmEjZqVgVvhrcqGuBMkZM0hOvIfbz3CMFveSE8gHIBkvOG
 +b5CETlAvhvugWv4xaXPY6dBsEYpgqueAm6xfN8ZiT8YhsGNnT7q9Ykvdr1dSMBR3Hsa
 1iFg==
X-Gm-Message-State: AOAM530ljhyiFEK4fPOoRIo4tvLP9h11o5FfABgjOKZnsepiy6zHAboO
 eicqDsM2FmC2TWAccV73isa7xpagRAycZhRkycDVNraBSRIIj3Vlf3T+IKlUqa2Tm3gqFDhJl3K
 L7ocQ9pPjEYAsUAc=
X-Received: by 2002:a5d:654c:: with SMTP id z12mr37681002wrv.12.1619632816695; 
 Wed, 28 Apr 2021 11:00:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzv7id/i/o8hG3hG6z9mjrAk955niLmINMcvCq666PqV2EyrHQGyz9CSGTkkE9IjdJbWn598w==
X-Received: by 2002:a5d:654c:: with SMTP id z12mr37680975wrv.12.1619632816473; 
 Wed, 28 Apr 2021 11:00:16 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id s64sm530100wmf.2.2021.04.28.11.00.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 11:00:16 -0700 (PDT)
Subject: Re: [PATCH 1/2] meson: Check for seccomp/cap-ng libraries if
 virtiofsd is enabled
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210428144813.417170-1-philmd@redhat.com>
 <20210428144813.417170-2-philmd@redhat.com>
 <15dbfc38-f0ba-65f1-382c-3ce5b961f108@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e2f18183-2b7d-f7c1-b1a2-e624950c7627@redhat.com>
Date: Wed, 28 Apr 2021 20:00:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <15dbfc38-f0ba-65f1-382c-3ce5b961f108@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 6:34 PM, Richard Henderson wrote:
> On 4/28/21 7:48 AM, Philippe Mathieu-Daudé wrote:
>>   seccomp = not_found
>> -if not get_option('seccomp').auto() or have_system or have_tools
>> +if not get_option('seccomp').auto() or have_system or have_tools or
>> not get_option('virtiofsd').auto()
>>     seccomp = dependency('libseccomp', version: '>=2.3.0',
>>                          required: get_option('seccomp'),
>>                          method: 'pkg-config', kwargs: static_kwargs)
> 
> This construct is wrong, both before and after, as I read it.
> 
> not get_option(foo).auto() is true for both enabled and disabled.  If
> disabled, why are we examining the dependency?  If auto, if we have all
> of the dependencies we want to enable the feature -- if we don't probe
> for the dependency, how can we enable it?
> 
> This error seems to be offset by the OR have_* tests, for which the
> logic also seems off.
> 
> I think the test should have been
> 
>   if (have_system or have_tools) and

Yes but virtiofsd is not a tool... It is a standalone binary.
Maybe have_system is the culprit here:

  have_system = have_system or target.endswith('-softmmu')

We should somewhere add:

  have_system = have_system or something('virtiofsd')

However I wonder if we aren't going to build many objects
that are irrelevant for virtiofsd.

>      (not get_option('seccomp').disabled() or
>       not get_option('virtiofsd').disabled())
> 
> Then we need to combine the required: argument, probably like
> 
>   required: get_option('seccomp').enabled() or
>             get_option('virtiofsd').enabled()
> 
> 
> r~
> 


