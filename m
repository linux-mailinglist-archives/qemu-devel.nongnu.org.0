Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B95307AFE
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 17:32:01 +0100 (CET)
Received: from localhost ([::1]:58230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5ADA-0004mL-TS
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 11:32:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l5AAl-0003wL-8X
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:29:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l5AAh-0006f9-6W
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:29:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611851365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CCZoQ89EWzLOBd3dDkZokGP3CCstpObwvmSe39d72NM=;
 b=bxIH+U4vWam760haMd6cfxgNknYnhaoB92wN0Do4PsGBr/ty8YGRkxHWKkb1e4A3K7TM6M
 HtNjwcl690jTxSAxh025BeG7rZn7sb9DTGV6XQf6f0cpy5b/6lz3TCmcPCAgmd9L05S68m
 cKvKDciw3PqV6W+i5I5KikJaBQE03uc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-ETGptvYZOOqVcHtXFACLyg-1; Thu, 28 Jan 2021 11:29:24 -0500
X-MC-Unique: ETGptvYZOOqVcHtXFACLyg-1
Received: by mail-ej1-f71.google.com with SMTP id f1so2418141ejq.20
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 08:29:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CCZoQ89EWzLOBd3dDkZokGP3CCstpObwvmSe39d72NM=;
 b=aYXD+SRo4qrssjjh77eOnj/39HxiDqJKH0VTwUSG+FvN9Ijxy9m9uoGQisOTn4/PXI
 JFIWuHPJdKbpy/NB8u23rk2mWwmbhW2u9Hlgcyz3CvyzM/GMf+W7J7+tFuU1lITrjdFu
 cz774XKSMfTEFWxHyqSk7MCR19nZ7RMgVc0rLgEl+TfFUvFKX2plBvfTX0EECOp2GW2k
 lb17TqOVxv20/uVt4GOGfBgtNiPg2zeMoY26sxYqrirNUwazGhs0UWHoyKQcUIN4X+UR
 q40V+5Zu3l18oddzrzYj0JNK/nrBhZyVVGqn6RwWthDjxgBR8tqN72JjJaPc3JER596h
 0ztw==
X-Gm-Message-State: AOAM530/OxTlsdOxKZNQ/JJzxzIEqXxzAuIO3J7e74iL7GkoypuyiP63
 71sgSQ0prd78l/eEaBOMQBB4lpr4DPt/PurdaH2nGhwZwXBQxmDjmBEBTGtdeKWhiRdSUt7vP/T
 vJ4vNcSA75CL1W0Ll0MKqsepB54otMHxiYcOPEnW1qzSf7PLd7jzGbDSmVbMLnuqx
X-Received: by 2002:aa7:ccc6:: with SMTP id y6mr375472edt.226.1611851362810;
 Thu, 28 Jan 2021 08:29:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHsWa5+tKtwPAPA8A1g/ABY/UW8G4h4mqPwBEN3UBtUmRTr3D2Cn4gSdTa8P7fu2lnFGOAGQ==
X-Received: by 2002:aa7:ccc6:: with SMTP id y6mr375441edt.226.1611851362617;
 Thu, 28 Jan 2021 08:29:22 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id hh21sm2489117ejb.13.2021.01.28.08.29.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 08:29:21 -0800 (PST)
Subject: Re: [PATCH v14 18/22] accel: introduce AccelCPUClass extending
 CPUClass
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
References: <20210128092814.8676-1-cfontana@suse.de>
 <20210128092814.8676-19-cfontana@suse.de>
 <64d8385c-db22-b647-2402-3840b0e0e9b5@redhat.com>
 <9a51a203-f6a8-686f-7859-475537b3607a@suse.de> <878s8dujj5.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <40ed971e-a4fe-77c5-94b9-28691874ee32@redhat.com>
Date: Thu, 28 Jan 2021 17:29:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <878s8dujj5.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 5:08 PM, Alex Bennée wrote:
> 
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> On 1/28/21 2:03 PM, Philippe Mathieu-Daudé wrote:
>>> On 1/28/21 10:28 AM, Claudio Fontana wrote:
> <snip>
>>>> +
>>>> +#define TYPE_ACCEL_CPU "accel-" CPU_RESOLVING_TYPE
>>>> +#define ACCEL_CPU_NAME(name) (name "-" TYPE_ACCEL_CPU)
>>>> +typedef struct AccelCPUClass AccelCPUClass;
>>>> +DECLARE_CLASS_CHECKERS(AccelCPUClass, ACCEL_CPU, TYPE_ACCEL_CPU)
>>>> +
>>>> +typedef struct AccelCPUClass {
>>>> +    /*< private >*/
>>>> +    ObjectClass parent_class;
>>>> +    /*< public >*/
>>>> +
>>>> +    void (*cpu_class_init)(CPUClass *cc);
>>>> +    void (*cpu_instance_init)(CPUState *cpu);
>>>> +    void (*cpu_realizefn)(CPUState *cpu, Error **errp);
>>>
>>> If we want callers to check errp, better have the prototype return
>>> a boolean.
>>
>> Good point, the whole errp thing is worth revisiting in the series,
>> there are many cases (which are basically reproduced in the refactoring from existing code),
>> where errp is passed but is really unused.
>>
>> I am constantly internally debating whether to remove the parameter altogether, or to keep it in there.
>>
>> What would you suggest?
> 
> I think it really depends on if we can expect the realizefn to usefully
> return an error message that can be read and understood by the user. I
> guess this comes down to how much user config is going to be checked at
> the point we realize the CPU?

cpu_realize() is were various feature checks are, isn't it?

  -cpu mycpu,feat1=on,feat2=off
  CPU 'mycpu' can not disable feature 'feat2' because of REASON.

> The bool returning realizefn with Error is a fairly common pattern.
> 



