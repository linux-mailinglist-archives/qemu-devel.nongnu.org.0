Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C4F5EB42B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 00:09:28 +0200 (CEST)
Received: from localhost ([::1]:46834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocwI3-0005kr-Pe
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 18:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocwFz-0002Xy-Vr
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 18:07:20 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:38787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocwFy-0001ER-7J
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 18:07:19 -0400
Received: by mail-ej1-x632.google.com with SMTP id nb11so17004611ejc.5
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 15:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=QMgOgYXKVvr9CfjGYyNe2rC7VurGlAlVzDj4Ka7w/GI=;
 b=H+KTYnneLkD+vhnJ9q2uzK8yeTE6oJqEqyyN7vCJnf5ChbP3xJMSz7B/6yI4pI2hz4
 Xwd+wybuhcp1N245KQh1b2TWtP4rTMmSZ26Tay0jlK5ehjckHB2BK4GjXTzryNjix1Wf
 oIk6P0qSJIm/cF7NLAi9zlvhkAhEwHn04cxIGRAdxip6le4+QzTdC33Km3DZPbXXMJPD
 zvLux5CEeKXJsQfQzhq9jAHVxiYnRuISbjhVhYJzewW88Z0eBkjWJueHRzsMINyD1a0H
 xLBqvl64tF/DOIvnJENkWAjp8ftgLw9XesJvpowN03/tyiaqoFdgnHuPYb4WOJe4DVMo
 1H9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=QMgOgYXKVvr9CfjGYyNe2rC7VurGlAlVzDj4Ka7w/GI=;
 b=4LtJJv1lx7Atg+vSdimB+YHUMP/XZGxDiuxsrOT2BKtpAal/xBIOE4aJtvm9ASlY45
 mxabJQ8zs9XerFBmgwx3x7G/AkXvDqa28aV6NR0JLQJX9EHZW4Ag8YlWjd7/H5+E9AVP
 jwZmVfFnqY5ZTMIDM4oKIhaaCMrTBEiuC/isiR0Hn1hxKAt2Zu60NO7PBjvoh9/9Gv8W
 LVJkLmn1BBDk+5cmMGKJ5q9h98XLCqMdZkBEB7XNwzT+mOIs5Qh3teF4emut38k76k3z
 ECFfGurkCgjeMhwHleAQeudT7iBRI0ipWij9t7WuAmJL6XANw6/HBTXaQtpGEhs26PYU
 rrng==
X-Gm-Message-State: ACrzQf3+eeHnoWYVBMPBadJCPW0F8+QluKEQct67NebTe80kiV7IQTt1
 X8FZ1YSC3xP2o6lYG8lgLaG0Vw==
X-Google-Smtp-Source: AMsMyM4vGdK4+ghJCNAADlfCBQyAKm5+2LOnDAeIccI69QfzEEai5OxeX52471EsnrDGbmBH8B5RAg==
X-Received: by 2002:a17:907:270b:b0:77b:17b3:f446 with SMTP id
 w11-20020a170907270b00b0077b17b3f446mr19749363ejk.415.1664230036736; 
 Mon, 26 Sep 2022 15:07:16 -0700 (PDT)
Received: from [192.168.190.227] ([31.209.146.210])
 by smtp.gmail.com with ESMTPSA id
 ia1-20020a170907a06100b0077934671cb6sm8766602ejc.56.2022.09.26.15.07.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 15:07:16 -0700 (PDT)
Message-ID: <03e0ac72-9c9b-8e8a-9573-6881113956f2@linaro.org>
Date: Sun, 25 Sep 2022 10:35:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 2/3] module: add Error arguments to module_load_one and
 module_load_qom_one
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, Markus Armbruster
 <armbru@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, dinechin@redhat.com, Gerd Hoffmann
 <kraxel@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?=
 <berrange@redhat.com>
References: <20220908183012.17667-1-cfontana@suse.de>
 <20220908183012.17667-3-cfontana@suse.de> <877d23ekj0.fsf@pond.sub.org>
 <76775f64-e49a-1c3c-0d73-10d93eff34e4@amsat.org>
 <87y1ucdirx.fsf@pond.sub.org> <cc2c5e14-f0a0-4415-9fe1-d7811ee27850@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <cc2c5e14-f0a0-4415-9fe1-d7811ee27850@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/21/22 16:03, Claudio Fontana wrote:
> On 9/21/22 14:16, Markus Armbruster wrote:
>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>>
>>> On 16/9/22 11:27, Markus Armbruster wrote:
>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>
>>>>> improve error handling during module load, by changing:
>>>>>
>>>>> bool module_load_one(const char *prefix, const char *lib_name);
>>>>> void module_load_qom_one(const char *type);
>>>>>
>>>>> to:
>>>>>
>>>>> bool module_load_one(const char *prefix, const char *name, Error **errp);
>>>>> bool module_load_qom_one(const char *type, Error **errp);
>>>>>
>>>>> module_load_qom_one has been introduced in:
>>>>>
>>>>> commit 28457744c345 ("module: qom module support"), which built on top of
>>>>> module_load_one, but discarded the bool return value. Restore it.
>>>>>
>>>>> Adapt all callers to emit errors, or ignore them, or fail hard,
>>>>> as appropriate in each context.
>>>>
>>>> How exactly does behavior change?  The commit message is mum on the
>>>> behavior before the patch, and vague on the behavior afterwards.
>>>>
>>>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>>>> ---
>>>>>    audio/audio.c         |   9 ++-
>>>>>    block.c               |  15 ++++-
>>>>>    block/dmg.c           |  18 +++++-
>>>>>    hw/core/qdev.c        |  10 ++-
>>>>>    include/qemu/module.h |  38 ++++++++++--
>>>>>    qom/object.c          |  18 +++++-
>>>>>    softmmu/qtest.c       |   6 +-
>>>>>    ui/console.c          |  18 +++++-
>>>>>    util/module.c         | 140 ++++++++++++++++++++++++------------------
>>>>>    9 files changed, 194 insertions(+), 78 deletions(-)
>>>
>>>>> diff --git a/include/qemu/module.h b/include/qemu/module.h
>>>>> index 8c012bbe03..78d4c4de96 100644
>>>>> --- a/include/qemu/module.h
>>>>> +++ b/include/qemu/module.h
>>>>> @@ -61,16 +61,44 @@ typedef enum {
>>>
>>>>>    
>>>>>    void module_call_init(module_init_type type);
>>>>> -bool module_load_one(const char *prefix, const char *lib_name);
>>>>> -void module_load_qom_one(const char *type);
>>>>> +
>>>>> +/*
>>>>> + * module_load_one: attempt to load a module from a set of directories
>>>>> + *
>>>>> + * directories searched are:
>>>>> + * - getenv("QEMU_MODULE_DIR")
>>>>> + * - get_relocated_path(CONFIG_QEMU_MODDIR);
>>>>> + * - /var/run/qemu/${version_dir}
>>>>> + *
>>>>> + * prefix:         a subsystem prefix, or the empty string ("audio-", ..., "")
>>>>> + * name:           name of the module
>>>>> + * errp:           error to set in case the module is found, but load failed.
>>>>> + *
>>>>> + * Return value:   true on success (found and loaded);
>>>>> + *                 if module if found, but load failed, errp will be set.
>>>>> + *                 if module is not found, errp will not be set.
>>>>
>>>> I understand you need to distingush two failure modes "found, but load
>>>> failed" and "not found".
>>>>
>>>> Functions that set an error on some failures only tend to be awkward: in
>>>> addition to checking the return value for failure, you have to check
>>>> @errp for special failures.  This is particularly cumbersome when it
>>>> requires a @local_err and an error_propagate() just for that.  I
>>>> generally prefer to return an error code and always set an error.
>>>
>>> I notice the same issue, therefore would suggest this alternative
>>> prototype:
>>>
>>>     bool module_load_one(const char *prefix, const char *name,
>>>               bool ignore_if_missing, Error **errp);
>>> which always sets *errp when returning false:
>>>
>>>    * Return value:   if ignore_if_missing is true:
>>>    *                   true on success (found or missing), false on
>>>    *                   load failure.
>>>    *                 if ignore_if_missing is false:
>>>    *                   true on success (found and loaded); false if
>>>    *                   not found or load failed.
>>>    *                 errp will be set if the returned value is false.
>>>    */
>>
>> I think this interface is less surprising.

I agree.

>>
>> If having to pass a flag turns out to to be a legibility issue, we can
>> have wrapper functions.
>>
> 
> To me it seems even more confusing tbh. Do we have more ideas? Richard?

My first idea was a tri-state return function (e.g. enum return).  But that would have 
required an extra dance in those places where we *can* accept missing module to free the 
unused Error.

I think the above extra argument is a good replacement for that dance.  The only other 
alternative is to use different functions for the different uses.



r~

