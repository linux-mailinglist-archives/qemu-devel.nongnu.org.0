Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F8734B752
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Mar 2021 14:01:28 +0100 (CET)
Received: from localhost ([::1]:37170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQ8ZD-0001Uo-7H
	for lists+qemu-devel@lfdr.de; Sat, 27 Mar 2021 09:01:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQ8XM-0000Y4-SY
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 08:59:33 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:36495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQ8XL-0003lv-6F
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 08:59:32 -0400
Received: by mail-oi1-x22d.google.com with SMTP id c16so8603512oib.3
 for <qemu-devel@nongnu.org>; Sat, 27 Mar 2021 05:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dfE5wxoQ8DhJo8dm1exQMjpjPWpxeBW9kSnK9Zq2Ppc=;
 b=q5dpCLIFAJZexb/diUq0kx6ddf3JIEgaF4fk5tTTyX61Uu+dtQZ7NR6r87vfwhVP3i
 JSwTjHI22qSwmhefrLM+WsZbCyAeH0STmqgjC4gjPOR2pLkkYWs+P/HxMKMRBO8R1J7l
 f0DFK94m3TciXhVRz2sokBuzUbMlkRXLsss7F7+qFIBJt0N1+m9bdAf+sVEaq7ajWsOQ
 VoMFngglvO9YkkDoLH9C3Q0TuLLvQm2bqYEevn2jD/l1xeCgqWaSXWwbhQYlU2MpHsm0
 41euFnrmHLd0Mi2NXTUbJtvS5/HFS4fbzYvr9dRNsYgwOTp9mD9FrJr21GvwA9s5OYMu
 3enA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dfE5wxoQ8DhJo8dm1exQMjpjPWpxeBW9kSnK9Zq2Ppc=;
 b=ihqVonORuV0aZ+fUt+t3gaOxOvrafUrYYjjoSzZBJD4RLS3g8E5d+Qy9oejYngOYf8
 4nVua6R8RKyg+phahzfCstk0AZ/z5UaGhwOz/IkRDwglawdpDAFUZNS7u5tjcCvL/VyI
 WUEKN82QiRwXOHk0iuS1vYy299YLwhAV9iPXXNRYbV+Ayrwx9iCJOO1OOFkf+12ygHQO
 mokVrNP5we1oUjg8yspp+aqbJRPfcnxivpBTqaECAerPONH4SvlZLJQsjt0b3GTQObuJ
 sivcDJ0JtduAbCeq/e7fe7SKzWMQzBusXGeB6W6/4RoEukjFJOxx5TZeVlq6NkzNF2Od
 mbaA==
X-Gm-Message-State: AOAM531spcbzFZmvMhsiyco+nRRN0KfhP5N7WTAPMZjWDCTa2d+KnpYP
 WdKUNTjYiZ0bP2skxV1xDmQxJA==
X-Google-Smtp-Source: ABdhPJzH4XtGcDzxfk9/3aoLoycFXzf7hT1Wjk7BhiMUOQ9Fx5uNboFc+4B+YEmINMdpmGPZ4Q9LoQ==
X-Received: by 2002:aca:2104:: with SMTP id 4mr13365284oiz.124.1616849969618; 
 Sat, 27 Mar 2021 05:59:29 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id i25sm2836332otf.37.2021.03.27.05.59.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Mar 2021 05:59:29 -0700 (PDT)
Subject: Re: [RFC v11 47/55] target/arm: make is_aa64 and arm_el_is_aa64 a
 macro for !TARGET_AARCH64
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-40-cfontana@suse.de>
 <f8b0629b-a0da-e85e-5729-3f29eeb247ef@linaro.org>
 <e17f3c0d-7231-f6b4-4e07-b90fa115bb62@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2d342b02-2ee3-322c-ae79-646cc42b0a65@linaro.org>
Date: Sat, 27 Mar 2021 06:59:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <e17f3c0d-7231-f6b4-4e07-b90fa115bb62@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:05 PM, Claudio Fontana wrote:
> On 3/25/21 8:03 PM, Richard Henderson wrote:
>> On 3/23/21 9:46 AM, Claudio Fontana wrote:
>>> +#define is_a64(env) (false)
>> ...
>>> +#define arm_el_is_aa64(env, el) (false)
>>
>> Why a define and not have the ifdef inside the static inline?
>>
>> This define is causing you to make other random changes to avoid unused
>> variables, and I'm not keen.
>>
>> If you're running into problems with --enable-debug not eliminating code
>> blocks, leading to link errors, then I think that
>> __attribute__((always_inline)) and a comment will be the best option.
> 
> I am not getting linking troubles even with --enable-debug atm,
> so I'd avoid the attribute for now?

Then you must use the macro arguments in the define.

#define foo(x, y)  ((void)(x), (void)(y), false)


r~

