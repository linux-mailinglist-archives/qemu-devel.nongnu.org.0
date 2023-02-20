Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD08C69C800
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:53:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2ri-0000hN-Su; Mon, 20 Feb 2023 04:53:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pU2rg-0000cF-Iu
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:53:44 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pU2re-0005Yv-Sb
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:53:44 -0500
Received: by mail-wm1-x334.google.com with SMTP id p26so479326wmc.4
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LMOWecNB6HKVhSDyX5Y5+0doxcbd+FOkSAi40ShtAio=;
 b=k+pAeMAg0ehy1oXCBd+1Nz+1WObaq6sg2sweqsw+DjAyY0Ir09q0AYeVhCDH7i8jEH
 RUQL6DudeYCRzga9C6qcqwmzpNEKJHJ/35zzsjkql7vnQaDntXgo0XOxLvrqmKKSdQMb
 lPCXA1/1gQvwUluip2d6sFjvWogl4b3J6oHWVI347Uxnh9DWPw5/b+Ttyq9cuafSnQir
 cizxt/SCBBijEJplU+VlFVvkvx5r5Mq166rtlUkCIST/vN1o1vJX/lMwvfcbtJjKllvQ
 Hm8QtqqwalltdFkDBzU4ulsJX0BjDZkigo1heQZCLES4CUGUUuM7JTjO1+lVD904DZWY
 5aTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LMOWecNB6HKVhSDyX5Y5+0doxcbd+FOkSAi40ShtAio=;
 b=mtyNe1EZuK2zEGcA0m2Ugm1OgMOjVA5j6RC5opu2CiF74nl5uqfUyyTLCa053GCTeN
 T8z7tRadtUVtpR38RVMoQHXiaoATc7WKRMB3xRQDgwNsHOsNnanubbHNOKrqzpRkZ2gg
 0Z4008I33xNar4NrHOMqjGT6X4s4UjwKflEoyJEdj/cQgiKNHLf/PTU1sWQGEtHmXUID
 5n1wT6XfzMnaSutCALR0Onh0WXi4vKusbhx+XACGjcsf0FMfAzbBtZOiVlhnjX/Tht8U
 s+kfY04v76c59KMqyiD2qZn0kKtut++/wXVNGTCM008G23LpO1E5VVVtDfnopZvZyBNV
 84Ew==
X-Gm-Message-State: AO0yUKUCBj/GNVXHQ4jKBFYnDCKbmTKP/8IHYgtOfLKUBTQSEutn1Qam
 1ChY8uKRadRenWtH7+fEj35Tzg==
X-Google-Smtp-Source: AK7set+AuNdW/QkoO6EaEvVUe6MLqT9K4Ol22dR5mSU+EhpygCxZaN3ZtIBukXDHy58FGggGyS5n+Q==
X-Received: by 2002:a7b:c7d4:0:b0:3df:de28:f819 with SMTP id
 z20-20020a7bc7d4000000b003dfde28f819mr521859wmk.15.1676886819755; 
 Mon, 20 Feb 2023 01:53:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5cc:caa0:de33:fc7:48d9:9d12?
 ([2a01:e0a:5cc:caa0:de33:fc7:48d9:9d12])
 by smtp.gmail.com with ESMTPSA id
 1-20020a05600c274100b003dfe549da4fsm1059509wmw.18.2023.02.20.01.53.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 01:53:39 -0800 (PST)
Message-ID: <0b796528-9646-d4bb-2b61-3ba3a672eab8@linaro.org>
Date: Mon, 20 Feb 2023 10:53:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 2/4] sysemu/os-win32: fix setjmp/longjmp on
 windows-arm64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 alex.bennee@linaro.org, peter.maydell@linaro.org
References: <20230216134911.6803-1-pierrick.bouvier@linaro.org>
 <20230216134911.6803-3-pierrick.bouvier@linaro.org>
 <9effb233-1dd7-0860-96e2-4f07a41adb5a@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <9effb233-1dd7-0860-96e2-4f07a41adb5a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/16/23 21:02, Richard Henderson wrote:
> On 2/16/23 03:49, Pierrick Bouvier wrote:
>> Windows implementation of setjmp/longjmp is done in
>> C:/WINDOWS/system32/ucrtbase.dll. Alas, on arm64, it seems to *always*
>> perform stack unwinding, which crashes from generated code.
>>
>> By using alternative implementation built in mingw, we avoid doing stack
>> unwinding and this fixes crash when calling longjmp.
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    include/sysemu/os-win32.h | 21 +++++++++++++++++++--
>>    meson.build               | 22 ++++++++++++++++++++++
>>    2 files changed, 41 insertions(+), 2 deletions(-)
> 
> Ugly, but workable.
> 
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Ideally we'd interact properly with system unwinding.  It looks like we'd use
> RtlAddFunctionTable, but the documentation is spread out and I've not found all of the bits.
> 
> We already do something similar for gdb -- see tcg/tcg.c, tcg_register_jit_int, and
> tcg/aarch64/tcg-target.c.inc, debug_frame.
> 

Thanks for the idea.
For the sake of completeness, using RtlInstallFunctionTableCallback 
could be a better strategy, as it allows to have a callback called only 
during stack unwinding [1].

Meanwhile, I'll ask to our contact in MSFT if it's possible to perform a 
setjmp/longjmp that does not trigger stack unwinding on aarch64.

[1] 
https://learn.microsoft.com/en-us/windows/win32/api/winnt/nf-winnt-rtlinstallfunctiontablecallback

> 
> r~

