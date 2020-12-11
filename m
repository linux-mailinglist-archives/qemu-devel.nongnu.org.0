Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ADA2D7E1D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:33:25 +0100 (CET)
Received: from localhost ([::1]:50374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knnEK-0000NN-CO
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:33:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knmm6-0003Ux-Dq
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:04:14 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:35937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knmm4-0004do-EW
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:04:13 -0500
Received: by mail-oi1-x241.google.com with SMTP id 9so3629920oiq.3
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 10:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5PIu2Z9/L7ek2TySoizXaCbU/iB7JTBy9qoc63a/zes=;
 b=DpWR/K1vVu0R/dUR8kZzgKv9rpt0qRfZQQ44vNCF7UMs2+VuaYljVlhZZz3xya7qjS
 YjdriD3zqQOfuhwzH1wymSuIuuoisz0EdUG4DIbKTnmW58nzuE/bW7bbWDejwhcnoYs7
 1u1kNLatfjpt3/uG3HktdlEAutbXK7CJv2s/y/Y/LGlEqGAWGTAJL7kH5Y+RGn9pnmre
 u8x20t7pALYBVK4Rab1Pm7JXCPhNNq0wMNnJ+iIbrOoNHntrKqqnUyQvf7EMj+HdZyHF
 gXpUZXM+nCzF/0dSNBoB+MsanGSD5fU7R5RtXnmTye/4o99jg6rzO/oUIrJrqTCjbiMh
 wDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5PIu2Z9/L7ek2TySoizXaCbU/iB7JTBy9qoc63a/zes=;
 b=nWvDHqI1EW+/voGyJ3p5a8ZGTDi0FR7zk5mZ6yP7FH6w9UaP0fi5RNQ6to12l1AtmZ
 byx6Xf9HJQJI0gNR410GO9LLjzKH+nqACliYm4PKvX1UjXFJer/N7PiluetfQoHPjWB4
 /cnjzLh9qLtwpe4GwIFseQcYIe3fHJo1ynlq+Nv/AuVMGKYphfYeDV31xVH6E79RNWKD
 RR5xTSwT/X9bt1jKMric3YmLG9YkbtUVJZOyMo3cTDw4PfkBkRugTvKQkH8mJ01W3R9o
 hiils4TiL019gW4fg0yRRTF2HmszMpk/5rY/HWxDHa5CnZ5BUO5W3rKS/jRG+WGhthjE
 BEOQ==
X-Gm-Message-State: AOAM5325haN0WBUL6O+cjjv/x/LmVZDFkShw22eyDW70Y9kelUxMWPBC
 7bR0mrYggnK9LmgGaUJGSmURSQ==
X-Google-Smtp-Source: ABdhPJwd9dNivJ8PqQKvZAM/MArFtaO9WBWOvX3RWw5Ws3Hz5mFKzDZG0/9o964ZOoLBPBFUmDG1vw==
X-Received: by 2002:aca:72cf:: with SMTP id p198mr10304226oic.60.1607709851110; 
 Fri, 11 Dec 2020 10:04:11 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id 8sm2084261otq.18.2020.12.11.10.04.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 10:04:10 -0800 (PST)
Subject: Re: [PATCH v11 18/25] cpu: Move synchronize_from_tb() to tcg_ops
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-19-cfontana@suse.de>
 <78a7119d-1b4b-47dc-8f16-510708c9fcd4@linaro.org>
 <cca08e8d-9235-46da-3610-8acafbc2de14@suse.de>
 <15b884b7-94e4-1476-f883-e84379b2661e@linaro.org>
 <5d9457df-c7c6-dd61-bbd7-1563d29102f8@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f4145cb8-5f22-6ca2-c568-1b874319c8da@linaro.org>
Date: Fri, 11 Dec 2020 12:04:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5d9457df-c7c6-dd61-bbd7-1563d29102f8@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 11:47 AM, Claudio Fontana wrote:
>> What is it that you thought you needed from core/cpu.h anyway?
...
>>>> Are you sure that splitting out hw/core/tcg-cpu-ops.h from hw/core/cpu.h in
>>>> patch 15 is even useful?
>>>
>>> it avoids a huge #ifdef CONFIG_TCG
>>
>> So?  The question should be: is it useful on its own, and I think the answer to
>> that is clearly not.  Thus it should not pretend to be a standalone header file.
>>
> 
> The whole point of the exercise is to sort out what is tcg specific and
> only compile it under CONFIG_TCG.
> 
> Having everything inside cpu.h wrapped in a 100 line #ifdef is not
> particularly readable or discoverable, so I think it is actually useful
> for understanding purposes to have it separate...
Ok, so separate, but perhaps not standalone.

My question above remains: what did you need from core/cpu.h?  Was it in fact
just a typedef for CPUState?
In which case "qemu/typedefs.h" is a better choice.


r~

