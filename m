Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197EF34A7DC
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 14:13:05 +0100 (CET)
Received: from localhost ([::1]:42494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPmGt-0002QM-L6
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 09:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPmFR-0001ly-NO
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 09:11:33 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:35460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPmFO-0008DU-MK
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 09:11:32 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 v24-20020a9d69d80000b02901b9aec33371so5151143oto.2
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 06:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F6WIDF9391HYmfWEibY/i4ULNR9orVL+Vb4hlZA+XlQ=;
 b=vvejUJRKzdffPHP9YdYHn0QI87mKxaZ9r+KQNWpiEz1IedFCNqkbvmBZk63jbuWQ2T
 9H/TS0R6/7VcjpQg774si+jE9XKabcE6JaQaqrrxQGQ2sUT7rmy3VOfMrNT60nf2qwPJ
 EnCpK7x0tPCFimbUqBUuJeGECnRMF0HK9lQulnMbsv9k2VuShYSqpFfGAZll3FCKzLUk
 OMd/LbO5gyR26YYtyH70UA/unfcQhVm6kKzK9+evo01mr2ui9Yf/HFWfR4F87EGdGYM1
 B8PziRg4dEc7MB/7FiUmZXsCA+vaCptpleGdhQN63lMGFQqR+Hs4AiNmiFDagNH/pJ/y
 cXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F6WIDF9391HYmfWEibY/i4ULNR9orVL+Vb4hlZA+XlQ=;
 b=oKSTlstgefrcN1kTT6ge5tG0Dh3uzTUIMZ9ISzyg2tYksm2hBik5SA6TQgTwbCEsCQ
 JaLBGDoTT4mDkI2S+tp454fBFZqGXGrCkPtbR65l0gcMVKk0TVyhXkSwexDUAmUFnLbC
 +Dawp2b96SfWs2GzQD4XBg9O/xHSo4u911XY5dnRjFsyOKSrlDcdtSXfmnSlcZGF4aPb
 ZHIVDCe/e5GlJC9ND1ksupyxwKBQn28zgcK7dsla/XZONx06bBfqZ1YM+FOO/If6qULg
 NUpy+FDGiiqvwebvstt/E1DwZizW2RCobwFXfYiQ3knXiru/UI130dLRgWnyr0VsEojj
 mIhQ==
X-Gm-Message-State: AOAM530/tkSv7NsFRzCQHMRjkuEHY3IOQZ8XGJ9zoc2sLuIQutIlWI/9
 ut3d9bbztR2S+vA98Qs9KEcz1g5NTGkOeW/a
X-Google-Smtp-Source: ABdhPJx5fi0QOOMUx37xC0Bh0nZM0J1t0l/Hq4JxJTQLgCrN2yY/3xs8+H421RArMcuo3XFh3uEPDA==
X-Received: by 2002:a05:6830:22dc:: with SMTP id
 q28mr11745469otc.336.1616764288120; 
 Fri, 26 Mar 2021 06:11:28 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id x17sm1704952oie.5.2021.03.26.06.11.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Mar 2021 06:11:27 -0700 (PDT)
Subject: Re: [PATCH v3] i386/cpu_dump: support AVX512 ZMM regs dump
To: Robert Hoo <robert.hu@linux.intel.com>, pbonzini@redhat.com,
 ehabkost@redhat.com
References: <1616572804-7898-1-git-send-email-robert.hu@linux.intel.com>
 <fc15756c-755d-fc96-80f4-ac9d6f6b461b@linaro.org>
 <09e24732185ed4df204063a6446c39ae4805d4f6.camel@linux.intel.com>
 <30be732d-50ce-d11c-88c6-f23e2e2d1c48@linaro.org>
 <4226b2c42eb896dc917f096d14c7d38850d9ec80.camel@linux.intel.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <54b5fe3c-5bfe-209a-9600-4a86fefb7b2c@linaro.org>
Date: Fri, 26 Mar 2021 07:11:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <4226b2c42eb896dc917f096d14c7d38850d9ec80.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/21 7:47 PM, Robert Hoo wrote:
> On Thu, 2021-03-25 at 06:39 -0600, Richard Henderson wrote:
>> On 3/24/21 9:15 PM, Robert Hoo wrote:
>>>>> +        } else if (env->xcr0 & XFEATURE_AVX) {
>>>>
>>>> This is normally a 2-bit test.
>>>
>>> I beg your pardon. What 2 bits?
>>
>> I forget the names, but isn't the usual test xcr0 & 6 == 6?
> 
> 6 stands for SSE state-component and AVX state-component.
> I'm not sure about this.
> Can you remember where did you this "xcr0 & 6 == 6"? I can look into
> that.

IA-64 and IA32 Software developers manual, Vol 1 Basic Architecture, Section 
14.3 Detection of AVX instructions.


r~

