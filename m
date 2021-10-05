Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6E942336D
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 00:22:50 +0200 (CEST)
Received: from localhost ([::1]:34822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXspl-0003Nj-HC
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 18:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXsoN-0002hp-4m
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 18:21:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXsoH-000442-0b
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 18:21:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633472476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DFs/+Vn5VN+/wSs+7IACFGOzN8bPSVX78Iqrou8kB8U=;
 b=JsKXsudyL+mWBplYLyk8d1CQ5mbjsJcLR+2MjkoRO175ffQTBysmmNwhYSY2MZ978gzFgB
 tAPnemowBiKh/jY4yE72NcgiXeWGUEhEyIFkU3GOebFcQKvMXWl4H1UE2vqj8lmTDluHGG
 NQteBB7RKUXq6JW/Ai1ncbwPqj2ubnM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-YVe-5AVGMAaaLUbtYM0PcA-1; Tue, 05 Oct 2021 18:21:14 -0400
X-MC-Unique: YVe-5AVGMAaaLUbtYM0PcA-1
Received: by mail-ed1-f71.google.com with SMTP id
 y15-20020a50ce0f000000b003dab997cf7dso682122edi.9
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 15:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DFs/+Vn5VN+/wSs+7IACFGOzN8bPSVX78Iqrou8kB8U=;
 b=YssRbYN75nN0rphNYnoFQW7TU43VWI1G1KpBWTlCkjqeZkaT2uOnvRQVtlOOtWguZr
 kPSVAbF3YfFiCmWhGzyphgdnRTCDoDAcQUElzGQqEc9ExwZJVLynsd8ezAvagznd5YWh
 HyXPZhhFTJf71A+LYiGy6CydCnLZEJS4dgBw3nedRvC+4R2Ab92Vw1wkhw4CIRKWlbTe
 g22ko2RODBeKANtuf31n2vLZ/motM7t34IRkm9VUVXH8GliGWzc0Hkah7pIam9oPy/cy
 4n2/yJLFwQ6jIrXsVuTwXV7qNXeWMChNhJHHwRzUF7RalFbWon7wUOWQhevmPM7/2kpf
 NgRw==
X-Gm-Message-State: AOAM531s+Va9XZGir3+hbqzEVyNSioEX9oUARAV95yQdtJUQgdR4/B92
 IcWMOoKIARG3zUY36NlSVYLnKghhmTo0vb8VvbYDhQqfKc7pWlWAz3Acr1FsqwehgjGnqrz0iXf
 rLFu3yJ/Z08r/jkM=
X-Received: by 2002:a17:906:5010:: with SMTP id
 s16mr27812519ejj.245.1633472473048; 
 Tue, 05 Oct 2021 15:21:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDHdS66RgucX33CHJ1dt4k/1hKx6qI/sHvd6UU0AcChBglxDbW2QZkRpVIVqw3mUu62hcuag==
X-Received: by 2002:a17:906:5010:: with SMTP id
 s16mr27812502ejj.245.1633472472851; 
 Tue, 05 Oct 2021 15:21:12 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id s21sm6429313eji.3.2021.10.05.15.21.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 15:21:12 -0700 (PDT)
Message-ID: <2726414d-1952-eb1e-3e74-f12fb0a9a669@redhat.com>
Date: Wed, 6 Oct 2021 00:21:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH] meson.build: don't include libbpf in the common
 source set
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20211005182443.2954499-1-alex.bennee@linaro.org>
 <236eb940-67bd-c1a0-3fa5-d0449c3ee712@redhat.com>
 <9eb86a53-de55-a1cc-0497-ed06ad795530@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <9eb86a53-de55-a1cc-0497-ed06ad795530@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/10/21 22:25, Richard Henderson wrote:
> On 10/5/21 12:27 PM, Paolo Bonzini wrote:
>> On 05/10/21 20:24, Alex Bennée wrote:
>>> This library is only needed for the softmmu targets and as such
>>> break static *-user builds where libbpf is detected and it tries to
>>> link it into the user binaries.
>>>
>>> Fixes: 46627f41b6 ("ebpf: Added eBPF RSS loader.")
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>   meson.build | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meson.build b/meson.build
>>> index 60f4f45165..d8bcf13b21 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> @@ -2307,7 +2307,7 @@ subdir('bsd-user')
>>>   subdir('linux-user')
>>>   subdir('ebpf')
>>> -common_ss.add(libbpf)
>>> +softmmu_ss.add(libbpf)
>>
>> It should not be needed at all, since ebpf/meson.build has
>>
>> softmmu_ss.add(when: libbpf, if_true: files('ebpf_rss.c'), if_false: 
>> files('ebpf_rss-stub.c'))
>>
>> (which already adds libbpf if needed).
> 
> Ooo, magic side effects.  I'll note that the manual doesn't say that it 
> adds and dependencies from varnames_and_deps, only that it checks them.

Good point, it's in an example above:

# Include zlib.c if the zlib dependency was found, and link zlib
# in the executable
ss.add(when: zlib, if_true: files('zlib.c'))

Paolo


