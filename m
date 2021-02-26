Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF988325C76
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 05:18:09 +0100 (CET)
Received: from localhost ([::1]:47080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFUZs-0001U5-Ma
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 23:18:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFUOC-0000DO-J7
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 23:06:04 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:33201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFUOA-0007d6-LJ
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 23:06:04 -0500
Received: by mail-pl1-x635.google.com with SMTP id b8so1790835plh.0
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 20:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zLnHTQv/Vu2pnup34UFVvGdVD7eJnlRBWUpCfYSEtPk=;
 b=uaqKEmP12Z9ST8QPBdQnxcUcRyPoWidJjmlNsDEz/025DHuJMsgjlmjRxAaNLU9Rhv
 pT0/sTSeVu35DInxRzuYqNSx+gTBomIBeQZuHB8FS+o0NIKSfT0r7+Yswv4xVQSg9lNF
 tBEEVjONkZqiUWDlbQ0c1wPyVA5EKvyNvOrqHQzB7CN0F8PkHl4wEgLhC6fkiF0JWa4v
 zVRUVPOWYA4y894YWhPud4HENJK6iIme7PREcpZTNmPieGtGE+Rv6NAfOVXqQ+nBanrO
 +AeNKPvso7nqHXDsVQi2pLYYWfaqyfcZ3iEgm7jA8mjz27GDp0ER/0R2Wif6byFsdJ4H
 LmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zLnHTQv/Vu2pnup34UFVvGdVD7eJnlRBWUpCfYSEtPk=;
 b=LrFzKMAWRxvn+ZNyyBv6sbeYdS4jjUwdC9bFpWaFULa9aObqbdTWO2Whl1iUWSVAfD
 /UMnLWICpbukKVTBI0G+n9yiALYiPhVmPABIA5S3j3auKZ803VMqFgw/T8Lrdky9lTxk
 6vjGNwJ6rdY1hegWpXYX1N3Eba7mF7G2QmO1bhGoThU5acmloiWP0rEuOThtgyHU8B2T
 I2K513EwKiL0RhP2Yiwnpyoju92xpbURg94T8d/YkqKprLK8sGp9oDzecdZ8oNleBX/O
 T6BSiKRZCh+899F1x7o/1k7ih/bpuG717yKc3al9oITYflBUN0ybQyJeKvG+3mJ17dv+
 l8Gw==
X-Gm-Message-State: AOAM532ih5JawDIqz3ywcRgOevvsRR0LKSCU5Z8Urd4R88Cyw8+y0u4H
 6sVXhhdTgc+n45/vTRDGyOT8r5PAzLyVGQ==
X-Google-Smtp-Source: ABdhPJybolACY4QRMghq0WcV6OPdtbSa1bVsbwr00a2RYMdH5WStBlDuBa9idosv1k+o8V99xzvEPA==
X-Received: by 2002:a17:90a:7d05:: with SMTP id
 g5mr1015892pjl.173.1614312361021; 
 Thu, 25 Feb 2021 20:06:01 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id o21sm6971659pjp.42.2021.02.25.20.06.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 20:06:00 -0800 (PST)
Subject: Re: [PATCH v22 16/17] i386: gdbstub: only write CR0/CR2/CR3/EFER for
 SOFTMMU
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210224133428.14071-1-cfontana@suse.de>
 <20210224133428.14071-17-cfontana@suse.de>
 <c7a4c597-6864-1ce6-b759-d7ec531eea67@linaro.org>
 <efd0679f-5504-dee7-9bcf-8af0c4bed895@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <17092d2c-9f40-5d34-b91e-1324434feb48@linaro.org>
Date: Thu, 25 Feb 2021 20:05:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <efd0679f-5504-dee7-9bcf-8af0c4bed895@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.435,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/21 12:55 AM, Claudio Fontana wrote:
> On 2/25/21 5:19 AM, Richard Henderson wrote:
>> On 2/24/21 5:34 AM, Claudio Fontana wrote:
>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>>> ---
>>>  target/i386/gdbstub.c | 16 ++++++++++++++++
>>>  1 file changed, 16 insertions(+)
>>>
>>> diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
>>> index 41e265fc67..9f505d6ee3 100644
>>> --- a/target/i386/gdbstub.c
>>> +++ b/target/i386/gdbstub.c
>>> @@ -383,26 +383,38 @@ int x86_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
>>>  
>>>          case IDX_CTL_CR0_REG:
>>>              if (env->hflags & HF_CS64_MASK) {
>>> +#ifdef CONFIG_SOFTMMU
>>>                  cpu_x86_update_cr0(env, ldq_p(mem_buf));
>>> +#endif
>>>                  return 8;
>>>              }
>>> +#ifdef CONFIG_SOFTMMU
>>>              cpu_x86_update_cr0(env, ldl_p(mem_buf));
>>> +#endif
>>>              return 4;
>>
>> It would be nice to do all these with rather less ifdefs.
>> And let's correctly use !CONFIG_USER_ONLY.
>>
>> Without adding more stubs, may I suggest a new helper:
>>
>> static target_ulong read_long_cs64(env, buf, len)
>> {
>> #ifdef TARGET_X86_64
>>     if (env->hflags & HF_CS64_MASK) {
>>         *len = 8;
>>         return ldq_p(buf);
>>     }
>> #endif
>>     *len = 4;
>>     return ldl_p(buf);
>> }
> 
> in the current code the
> 
> #ifdef TARGET_x86_64 is not there. Is it safe to use everywhere?

It'll never be set unless TARGET_X86_64.  Also, it *is* used in other tests for
the mask.  I do wonder if we should have CS64_MASK defined to 0 for
!TARGET_X86_64, so that (X & 0) -> 0.

> should we do a matching:
> 
> static int gdb_read_reg_cs64(CPUX86State *env, GByteArray *buf, target_ulong val)
> {
>     if ((env->hflags & HF_CS64_MASK) || GDB_FORCE_64) {

I should think so, except...  that FORCE_64 makes the previous test useless.  I
have no idea what's going on here.


r~

