Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F063227A7
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 10:19:48 +0100 (CET)
Received: from localhost ([::1]:37722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lETr9-0004Nz-AJ
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 04:19:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEToP-00031K-68
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:16:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEToL-00055U-EJ
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:16:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614071809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dAkqBhB+uHYbWuO1byEI4ZvQKd5gCXjvQo6TYSFOb5I=;
 b=IutT88SbrpVM6OUoog14TPUHrljM4gut98TbJvWrTerAEyQctsJMYIuQd1DcPwcfigLSEy
 +OI/B4fyTxvlITyvoimc09SxmijyPsnFnrUymV8DZV82AzdlwiPVdxqLBgu+MyQHobzMIL
 urn1z0kc8SwXIxUscnfYp3Nr/iC1qeU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-Dr9_ay4XNQCH1PU0gOebig-1; Tue, 23 Feb 2021 04:16:47 -0500
X-MC-Unique: Dr9_ay4XNQCH1PU0gOebig-1
Received: by mail-wm1-f69.google.com with SMTP id o18so461372wmq.2
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 01:16:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dAkqBhB+uHYbWuO1byEI4ZvQKd5gCXjvQo6TYSFOb5I=;
 b=UOe3tAz++RPBIyx817m/YtxBqvidwueMdfVvm5D33yclepzUS+7ly/nqCg42TxXq4S
 nM/IzYWT9zDYYhH5al6Ovll5qpli306t/q3VXNLQwAaZ5E1P//DzA/q9kvQzWQ03zzjw
 ci42D7y5yxwlzPRolJf60fUyHGSEC1o2HdxsmYYFwukgmHCPkWbTvnzwKKBIe5s73AcT
 26UNIyM9iJ7s0XUkqhGyzuzZg3GYxyKc6Kn/+KPDm9JUdcipPlxMbFaWTGC6RqgI8cWn
 f0jMcXQezsiHDCknr85dj4vlLlxrN+j8EfdmNjAMNyCU5DYV8X+G2kyjS7o9LbOyqwbS
 JYkw==
X-Gm-Message-State: AOAM530hlykSiynEJQ1AzsNdXyJgHXuhS7xUkwZvuGGKL6VMkDs+Z67x
 6QxSEjtdBTMuIcJtgdAtI39lamEI8SE+uZpS48bCOLKdtlzEfRMrwWGj1USRfYsziQFFyaVZVrX
 hOtCoKt4PbCXoy4M=
X-Received: by 2002:a5d:410e:: with SMTP id l14mr6224028wrp.406.1614071805028; 
 Tue, 23 Feb 2021 01:16:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbjCoS3gNmmsJ+dHPIyBm/Sddmv7iLz5Kq0ts4GnSqSR0YahYvk+DftXOnxt0B9LZn6yLtWg==
X-Received: by 2002:a5d:410e:: with SMTP id l14mr6224007wrp.406.1614071804848; 
 Tue, 23 Feb 2021 01:16:44 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a6sm2028768wmj.23.2021.02.23.01.16.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 01:16:44 -0800 (PST)
Subject: Re: [RFC v1 06/38] target/arm: split off cpu-softmmu.c
To: Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-7-cfontana@suse.de> <87blcc57rj.fsf@linaro.org>
 <e7f21ff9-b2c6-668e-c973-d2949b81327e@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2765ff1d-8b77-c2c8-c48a-dc2f582d80ff@redhat.com>
Date: Tue, 23 Feb 2021 10:16:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <e7f21ff9-b2c6-668e-c973-d2949b81327e@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Claudio Fontana <cfontana@centriq4.arch.suse.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/21 9:55 AM, Claudio Fontana wrote:
> On 2/22/21 6:29 PM, Alex Bennée wrote:
>>
>> Claudio Fontana <cfontana@suse.de> writes:
>>
>>> From: Claudio Fontana <cfontana@centriq4.arch.suse.de>
>>>
>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>> ---
>>>  target/arm/internals.h   |   9 ++-
>>>  target/arm/cpu-softmmu.c | 134 +++++++++++++++++++++++++++++++++++++++
>>>  target/arm/cpu.c         |  95 ---------------------------
>>>  target/arm/meson.build   |   1 +
>>>  4 files changed, 143 insertions(+), 96 deletions(-)
>>>  create mode 100644 target/arm/cpu-softmmu.c
>>>
>>> diff --git a/target/arm/internals.h b/target/arm/internals.h
>>> index 6384461177..6589b63ebc 100644
>>> --- a/target/arm/internals.h
>>> +++ b/target/arm/internals.h
>>> @@ -1196,4 +1196,11 @@ static inline uint64_t useronly_maybe_clean_ptr(uint32_t desc, uint64_t ptr)
>>>      return ptr;
>>>  }
>>>  
>>> -#endif
>>> +#ifndef CONFIG_USER_ONLY
>>> +void arm_cpu_set_irq(void *opaque, int irq, int level);
>>> +void arm_cpu_kvm_set_irq(void *opaque, int irq, int level);
>>> +bool arm_cpu_virtio_is_big_endian(CPUState *cs);
>>> +uint64_t a15_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri);
>>> +#endif /* !CONFIG_USER_ONLY */
>>> +
>>> +#endif /* TARGET_ARM_INTERNALS_H */
>>> diff --git a/target/arm/cpu-softmmu.c b/target/arm/cpu-softmmu.c
>>> new file mode 100644
>>> index 0000000000..263d1fc588
>>> --- /dev/null
>>> +++ b/target/arm/cpu-softmmu.c
>>> @@ -0,0 +1,134 @@
>>> +/*
>>> + * QEMU ARM CPU
>>
>> I guess apropos the discussion earlier it's really cpu-sysemu.c and we
>> could expand the header comment.
>>
>>   QEMU ARM CPU - Helpers for system emulation and KVM only
>>
>> <snip>
>>
>> Otherwise:
>>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>
> 
> Should I rename all *softmmu in the series to "sysemu"?
> 
> I wonder if we should take the issue of sysemu/system/softmmu topic into a separate series.
> Currently basically starting from the build system already, "softmmu", sysemu and system are treated as a single thing, and the convention from build system and directories seems to be "softmmu",
> while from the header files we get "sysemu/".
> 
> I agree that this is not a sufficient model to account for the new feature that Richard wants to develop,
> I just suggest we could also consider tackling this separately, with a pass through the whole code, gathering more input in the context of a dedicated series.
> 
> What do you think?

This is a valid reasoning. However I have my doubts "doing
that later" will ever be done/finished (not related to you
Claudio in particular, but with dealing with all subsystems).

Personally I'd rather see this sorted out with the arm target
then once done propose it as an example to the other ones.
You already considered the most complex cases, x86 and arm :)

> Also Paolo, any comments, since softmmu is all over meson?
> 
> Ciao,
> 
> Claudio
> 


