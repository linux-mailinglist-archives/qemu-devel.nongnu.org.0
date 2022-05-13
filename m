Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C730D52674B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 18:42:33 +0200 (CEST)
Received: from localhost ([::1]:54082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npYN6-0006pR-Cp
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 12:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npYKl-0004YM-IN
 for qemu-devel@nongnu.org; Fri, 13 May 2022 12:40:08 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:36615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npYKj-0001OV-O0
 for qemu-devel@nongnu.org; Fri, 13 May 2022 12:40:07 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 gj17-20020a17090b109100b001d8b390f77bso11308909pjb.1
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 09:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=/0AUPiA9fISdUuPQrcgBDb955++g0uyRVUeALHXFTJQ=;
 b=zfC9Wx90pleHUCaHrsqnmytIPCHd/krtqgXNe0jpflcpgFt1B/6eitugDXNs3zkip2
 o3Rf+ZVD1JkdFCLEP0DEYHSrwj1KbU+mdNlEoxoAl90vLLHb5BryJ4cbv2By5g+zU7Ej
 aNPUNmFMfoJqwJkL/G1Z3A7A8ATue86nrDTovbIyT7dAbN3s0wL8mO8k7os6pHfqxHLd
 Bv4vVIcHyxwi9RX6M53JUxP+1q56OGwhSELP9i04saKAq0qFvca+ELdQ03k7QxbQJokk
 LEg2k7kvYALB/7psjk51eR5nkoIiTSyP107GJ2sTxsBV1/ZGptaLrB7SdSTqIs6bYrUE
 A4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=/0AUPiA9fISdUuPQrcgBDb955++g0uyRVUeALHXFTJQ=;
 b=hKBi4ULLOYJZd+wIOcjJXrSNRl7TYJ3R1sYZMW5ktq0gCsgYIhIQBHN0G4K5RV7PSu
 LLe6fJ+L9kvMdjK2KfIkUYxN3wiDWtFTaFGXrdFSrQBPDSaIswWw1tgSBPPMEeaP9dJZ
 6xUZBFvfGUkVGRllpZfV9YbCgo6lxyhsP10RM7bzZ2JN+uYldn+Otw/lWuN91CM5YC41
 vaLd7CMz8JXuFDPYvA+bpo+P2eZeOwABZ8w/7aReflfZsDzy8MsshZ5fQcFAFB0kD5HC
 vHFVyfz3e/ZVkFiTNJpGqOlisAd2AKs0eno3s0WR+dkaz856A8aEesCIb8o2fqYQPI6M
 nuJA==
X-Gm-Message-State: AOAM532G+ydXiCVTa9w3zmmivKgDHlXArlHUsFvjf3Z6IanwOmqrUeXD
 IZr4UO3UQwybL2SN0dHWrAksrA==
X-Google-Smtp-Source: ABdhPJwPjd//GTjZMYpVygCBkfZfRJTYVuzDvyhgnLaK/ObXPPUucwsJiSO/gWGzXzOg4s9FxSOhdw==
X-Received: by 2002:a17:903:2cf:b0:151:a932:f1f0 with SMTP id
 s15-20020a17090302cf00b00151a932f1f0mr5711720plk.130.1652460004183; 
 Fri, 13 May 2022 09:40:04 -0700 (PDT)
Received: from ?IPV6:2607:fb90:46a:1099:e682:8d73:3200:dae5?
 ([2607:fb90:46a:1099:e682:8d73:3200:dae5])
 by smtp.gmail.com with ESMTPSA id
 f66-20020a623845000000b0050dc76281edsm1928120pfa.199.2022.05.13.09.40.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 09:40:03 -0700 (PDT)
Message-ID: <2a010ecb-42af-c6e8-b922-0a6bd8a5b95e@linaro.org>
Date: Fri, 13 May 2022 09:40:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 68/74] hw/rx: Handle a kernel file that is ELF
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
 <20220503194843.1379101-69-richard.henderson@linaro.org>
 <CAFEAcA_=xurx4hppNZKqe6s72vyFShiMKP__iE_4Ff9noXSGXg@mail.gmail.com>
 <cc37e096-dc47-4ac7-aa3d-87bef3937ab2@linaro.org>
In-Reply-To: <cc37e096-dc47-4ac7-aa3d-87bef3937ab2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/13/22 08:48, Richard Henderson wrote:
> On 5/13/22 08:44, Peter Maydell wrote:
>> On Tue, 3 May 2022 at 21:52, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>>
>>> Attempt to load the kernel with load_elf.  If this fails with
>>> ELF_LOAD_NOT_ELF, continue to treat the kernel as a raw image.
>>>
>>> This will be handy for running semihosting programs.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> I know nothing of the specifics of the rx target, but I'm
>> always a bit dubious about adding more behaviour to the
>> -kernel option, which is (a) already a morass of undocumented
>> target specific behaviours (b) nominally supposed to be
>> "load a Linux kernel", not "load any random thing".
>> Can you do what you need with the generic-loader device instead?
>> That has the benefit of both being documented and also doing
>> the same thing on all target architectures.
> 
> I'll give that a try.

It works, editing the board not to reject lack of -bios and lack of -kernel.  And running 
by hand because the syntax of the test harness does not allow the test file to be joined 
with $(QEMU_OPTS), as in

   -device loader,cpu-num=0,file=testcase

I'll work with Alex to figure out how best to restructure the test harness.

In the meantime I certainly don't mind putting the rx part on the back burner if it'll 
help get the previous 67 patches reviewed...


r~

