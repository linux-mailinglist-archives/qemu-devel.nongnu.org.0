Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7205F4692
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 17:23:15 +0200 (CEST)
Received: from localhost ([::1]:34978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofjlG-0006eT-Gk
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 11:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofieR-0003kZ-Ll
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:12:03 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:39492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofieP-0004dH-KA
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:12:03 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 v10-20020a17090a634a00b00205e48cf845so18719845pjs.4
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 07:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=MJVyuPVBD48xSBVP2xrv5sz9Q6OCQ+oSBSXO1FooiQo=;
 b=fJDxwqJYeM/4GxoSm6i01oP82c7oH29bmTsFIwkaPKjyJzwT1P3Sn7YgQ2ioizqJKf
 gugVJJaz9ff0yFOe2EwjO2Yt7wQYTZ7b4SoUoY5XqLJqBFAEytSSK68iBVEmGRfoF9Ig
 hkKdsZOigIAwxH/RlukuRnEFwZsaWJ2Ff1GfmjSdIEDzALZutX1+VrrLyG4vPFVwdMJ6
 kPcajUZ2R8ZCD8UhlN+uVB+lmqqtSl9VH9ktcN1kE3y2Gnmh2k+sR3pGsXmRj9Hv4oBN
 4LOFneX0of3cFzakD0U5zfI/TaKMR6c7AROEQkWB6jC79dOj2AKgiU9OgBzvWWvlCIaE
 txlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=MJVyuPVBD48xSBVP2xrv5sz9Q6OCQ+oSBSXO1FooiQo=;
 b=B/3lUtq9+cyjaCL76XmS9JjbNe9fdiIlXPQsUyPn+/evv68xLp/1EmlSAiZPxzhhhv
 rHAshdOo50lvdpM0+GzcBwof1aVeWcGIajN2J38U0miBfVBtxa06+GQY0t/mK0GH6twK
 iP45t2bXppqZaO5g3OQ80PIPifs2lj+zWKL3qMzGtTYinU+aPTyj7PabOFhdfosITZ/y
 WOuzhCUGGzaL6+S15STPqBRrqx6IVjR9U4tcm8J88FMtkwuMX3lUmjjAAyHINoQCL342
 lqdHBcMGIcBCRknXjuKmZqhkMELeCmISPmm66O2ExA6nrLynJgjYttBsvQ2BCF/6jAQ7
 mocQ==
X-Gm-Message-State: ACrzQf3+5p0Mvx8javjldMVTsZV2bOesReoImX7LFI5xtrj7iefLiItH
 D2kNoRMvFijvt03bM7/ZZu2elA==
X-Google-Smtp-Source: AMsMyM7JlHHVzaVGifbi2zHXk9muYIStTQT96FtQBRkcmhkLHK+mIGjJHLuBkAx4XSwh6n1hjQJ3CQ==
X-Received: by 2002:a17:90b:30d5:b0:20a:6453:43f with SMTP id
 hi21-20020a17090b30d500b0020a6453043fmr17941361pjb.74.1664892720163; 
 Tue, 04 Oct 2022 07:12:00 -0700 (PDT)
Received: from ?IPV6:2605:ef80:8015:12b0:403e:a15b:ff5e:d439?
 ([2605:ef80:8015:12b0:403e:a15b:ff5e:d439])
 by smtp.gmail.com with ESMTPSA id
 x24-20020a63db58000000b0042f62120c1bsm8468672pgi.17.2022.10.04.07.11.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 07:11:59 -0700 (PDT)
Message-ID: <afc00ecd-9750-e369-dda0-3c51fefb3baf@linaro.org>
Date: Tue, 4 Oct 2022 07:11:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] tcg/ppc: Optimize 26-bit jumps
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: npiggin@gmail.com
References: <20220919175614.32879-1-leandro.lupori@eldorado.org.br>
 <2ae7b41c-0a1a-dc2a-d7cf-bb14096f524f@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <2ae7b41c-0a1a-dc2a-d7cf-bb14096f524f@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.449,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/3/22 11:32, Leandro Lupori wrote:
> On 9/19/22 14:56, Leandro Lupori wrote:
>> PowerPC64 processors handle direct branches better than indirect
>> ones, resulting in less stalled cycles and branch misses.
>>
>> However, PPC's tb_target_set_jmp_target() was only using direct
>> branches for 16-bit jumps, while PowerPC64's unconditional branch
>> instructions are able to handle displacements of up to 26 bits.
>> To take advantage of this, now jumps whose displacements fit in
>> between 17 and 26 bits are also converted to direct branches.
>>
>> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
>> ---
>> v3:
>>    - make goto tb code 16-byte aligned
>>    - code cleanup
>>
> 
> Ping?
> 
> Does v3 look good now?

It does, thanks.  I will queue it for tcg-next.


r~

