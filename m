Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD38C410CEC
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 20:39:24 +0200 (CEST)
Received: from localhost ([::1]:43660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS1il-0005q6-Jg
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 14:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS1ce-0008VA-Em
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:33:04 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:45923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS1cc-0002Qb-LK
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:33:04 -0400
Received: by mail-pg1-x530.google.com with SMTP id n18so15108597pgm.12
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 11:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fFKBMFwOQFTLHayLf69IdrQ5kJ0sRE2I0LdXWXstyqk=;
 b=SAXMusN+wemhyNSJhH18IsWN3kuQbHRXh934+m1YLGCLqrfHvnQO+thuWhyVRKob2V
 XJ41UKcgcCWVWJ/7zKRXxbqg3Qyd4guHq5D5N86B64SsTWkrTbFt7e6MojZ0kQnNwtKk
 RJlJBBXKc2K4PyG3FDIe640QtdLKU86jk/rXTw6fBu6nxMQfh1N5zz4jQy5qtOyNdEiY
 lXxlXq6urRoVrSx2+JdKTrDvopqRg1wjRiXGO5sdF4S0xOFnT1AGn1cxxIrgTeRZ+BrC
 lqZq0XbVE9SWInShNm8CP7hH5prQzF283QS68Vn9XyW8oIoETIHSOtLmtUlKRk08UuwG
 bt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fFKBMFwOQFTLHayLf69IdrQ5kJ0sRE2I0LdXWXstyqk=;
 b=m7iYked+maTFoRjnWpaYsNmZrgf5paoontlD0pj2PwVzVFVZ274wpVOox/UxYn2Ssg
 Qxm1VpkQZ/SAOfQab4YerRTLYqVak1ljS8CM+jMKJby0lgLXWI7VeRAjuaXjVHNrtczc
 KkVpnlW6xpOk27mf8IIrcHvTNyvx8nHZUFejAEpn3aFrIs/J/0A1vk6TvZlrYYxZRhx0
 rHg3reSixPAsCepqnTxTsYJp2cbQ7eYD182h9GorslR8e/Sb7xoVukepgfymznJJuQ3v
 ZtiFD2kLwOfERcoqp6A09T/kdBW9MnZvLMW70GSSZynHWPAWTj3kbo+SLfncQodK/fob
 1zdQ==
X-Gm-Message-State: AOAM531PuM9Veq7QOUTYXYw6FutN1+F3A7xEmuU6rBBYKqAn50VesNEb
 ypi/2j7VuNfiyIinh6Jq+wzbjA==
X-Google-Smtp-Source: ABdhPJxt5/uEC3OBH2t5nU3o2gsPYGvpuWvub/0l8E9PNgHGT+6Dc3xXB2WBzevQmeTleidIa/VDaw==
X-Received: by 2002:a62:194a:0:b0:43d:f06e:4f4a with SMTP id
 71-20020a62194a000000b0043df06e4f4amr21277434pfz.20.1632076380503; 
 Sun, 19 Sep 2021 11:33:00 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id f144sm11853116pfa.24.2021.09.19.11.32.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 11:32:59 -0700 (PDT)
Subject: Re: [PATCH v2 19/41] hw/core: Add TCGCPUOps.record_sigsegv
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210918184527.408540-1-richard.henderson@linaro.org>
 <20210918184527.408540-20-richard.henderson@linaro.org>
 <95b28dff-7a3c-73fa-2449-c41110e12642@amsat.org>
 <e35c8e44-0b5d-a862-71a5-551fa9fb4985@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9b6c37ea-2a14-882b-a770-0cefddeba218@linaro.org>
Date: Sun, 19 Sep 2021 11:32:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e35c8e44-0b5d-a862-71a5-551fa9fb4985@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/19/21 11:24 AM, Philippe Mathieu-Daudé wrote:
> On 9/19/21 20:22, Philippe Mathieu-Daudé wrote:
>> On 9/18/21 20:45, Richard Henderson wrote:
>>> Add a new user-only interface for updating cpu state before
>>> raising a signal.  This will replace tlb_fill for user-only
>>> and should result in less boilerplate for each guest.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   include/hw/core/tcg-cpu-ops.h | 26 ++++++++++++++++++++++++++
>>>   1 file changed, 26 insertions(+)
>>>
>>> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
>>> index 4a4c4053e3..e229a40772 100644
>>> --- a/include/hw/core/tcg-cpu-ops.h
>>> +++ b/include/hw/core/tcg-cpu-ops.h
>>> @@ -114,6 +114,32 @@ struct TCGCPUOps {
>>>        */
>>>       bool (*io_recompile_replay_branch)(CPUState *cpu,
>>>                                          const TranslationBlock *tb);
>>> +#else
>>> +    /**
>>> +     * record_sigsegv:
>>> +     * @cpu: cpu context
>>> +     * @addr: faulting guest address
>>> +     * @access_type: access was read/write/execute
>>> +     * @maperr: true for invalid page, false for permission fault
>>> +     * @ra: host pc for unwinding
>>> +     *
>>> +     * We are about to raise SIGSEGV with si_code set for @maperr,
>>> +     * and si_addr set for @addr.  Record anything further needed
>>> +     * for the signal ucontext_t.
>>> +     *
>>> +     * If the emulated kernel does not provide anything to the signal
>>> +     * handler with anything besides the user context registers, and
>>> +     * the siginfo_t, then this hook need do nothing and may be omitted.
>>> +     * Otherwise, record the data and return; the caller will raise
>>> +     * the signal, unwind the cpu state, and return to the main loop.
>>> +     *
>>> +     * If it is simpler to re-use the sysemu tlb_fill code, @ra is provided
>>> +     * so that a "normal" cpu exception can be raised.  In this case,
>>> +     * the signal must be raised by the architecture cpu_loop.
>>> +     */
>>
>> Shouldn't it have the QEMU_NORETURN attribute?
> 
> Eh now I saw the next patch and understood raise_sigsegv() is
> where QEMU_NORETURN belong :)

Well, I had intended the hook to be able to return, so that the hook can merely set some 
env->fields, and return to raise the signal.  But in the end, all 4 targets that use the 
hook raise the exception themselves -- sometimes because env->exception_index is part of 
the data to be passed to the signal handler.


r~

