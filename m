Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E9C64B9B3
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 17:29:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p588K-0002my-8H; Tue, 13 Dec 2022 11:27:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p588E-0002kW-IC
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:27:53 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p588B-0000br-Gv
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:27:50 -0500
Received: by mail-ot1-x330.google.com with SMTP id
 l8-20020a056830054800b006705fd35eceso142890otb.12
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 08:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/oMA+z00Yw19B/Cul8IeNaINjwJ1SCer6liwMab+nsM=;
 b=ewQ5LxezpxJAB2m1ksaGJtzd5kpUg+nh//lXQo7PNwYyfXdnQ1ZwTy7jknLprxh9Rn
 dQpa68hWHKRMeUvlFCvZp/8L1F/hc82kaDy7O3cibZvJFIva5jSuZcXjZWUi45ZPnOkG
 fkncDL/wRR3a2is5wx6x6G6tGIxWM7VBXXdAjAEItVMcuSiM0hE6rcxmmRnJogPKgJXr
 0m4H+K6u9aM/kQiKjVYE43QdSB1EomqzNiFW+d+J2onUt9BYzWwF3G/gzWnax9fhQKls
 qqD0VS1P6Aqq6aLtfhTrZBbQmCiQ6LsGgRGDt21y+vIFi1HwGuZ1QQWTl9X66dV8Bz4m
 2HfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/oMA+z00Yw19B/Cul8IeNaINjwJ1SCer6liwMab+nsM=;
 b=cws9BgA9mmxSwL1uCPgeNkllPn+zItQPG3Exi5bEoIOOklV9hsF6urXUP+4s5ocRvc
 IKs8qCEqnFU53uNjPKJlrKADx3lHaxFGKkHspQrAPKuS/X9gQilAH0gXcnwYzJNuIob9
 4hYir5qS58hjHfZqV0sEedMhFcB/mQCLmWO9cEBMk6jBNofyRVrgIv6jeMb+cV4uilKs
 zfopcm53YXQx0X7nHMMuNbonG4oZbIQv6RhN29u3dSapo3L6zAFlsxRwpi+k8vrH2m5/
 hwEV7DtooTmhlAF8qzM/YlCn5QdbgdHzlRcgAlt5S7XmNrWnIOkohQyyt5sIJ0wRSHSG
 JuTQ==
X-Gm-Message-State: ANoB5pnvWyaSW1eOQjCF4A2/4DzSu9dwqheaQ4frn8BvWp/dbcj3RJnj
 hjj3CfyvH1dbT7ouDEIXxF4q6A==
X-Google-Smtp-Source: AA0mqf4bUBNp8VKszMMkYf4/flL3vsYNf0SBOhkGZZeY/vokVqYz0t9j9xhdQLOpPWBiDUnH4QC5UQ==
X-Received: by 2002:a05:6830:2a05:b0:66b:b674:5a5b with SMTP id
 y5-20020a0568302a0500b0066bb6745a5bmr11202969otu.21.1670948864753; 
 Tue, 13 Dec 2022 08:27:44 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:c63:85ed:4256:8ad0?
 ([2806:102e:18:2efc:c63:85ed:4256:8ad0])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a9d7c85000000b00670763270fcsm1321216otn.71.2022.12.13.08.27.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 08:27:44 -0800 (PST)
Message-ID: <b46e4c40-257f-8a89-85b8-8c2806f395be@linaro.org>
Date: Tue, 13 Dec 2022 10:27:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH-for-8.0 1/3] hw/ppc: Replace tswap32() by const_le32()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Alistair Francis <alistair@alistair23.me>,
 David Gibson <david@gibson.dropbear.id.au>, Jason Wang
 <jasowang@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-2-philmd@linaro.org>
 <8d47b826-2011-3203-c682-aa32a76b8dc2@linaro.org>
 <d73fe725-565e-7fcb-e7d3-846189459545@linaro.org>
 <a1f4b5a6-0a8a-5a04-8ab6-f3f08b9d36aa@linaro.org>
 <CAFEAcA_F3Z+UPW-wHs8xedYX3TiV8CRQAom0DhefKLFH_Ejgog@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_F3Z+UPW-wHs8xedYX3TiV8CRQAom0DhefKLFH_Ejgog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 12/13/22 10:21, Peter Maydell wrote:
> On Tue, 13 Dec 2022 at 16:14, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 12/13/22 10:10, Philippe Mathieu-Daudé wrote:
>>> On 13/12/22 17:00, Richard Henderson wrote:
>>>> On 12/13/22 06:52, Philippe Mathieu-Daudé wrote:
>>>>> Assuming the developers of commits 2c50e26efd ("powerpc: Add
>>>>> a virtex5 ml507 refdesign board") and 4b387f9ee1 ("ppc: Add
>>>>> aCube Sam460ex board") were testing on a little-endian setup,
>>>>> they meant to use const_le32() instead of tswap32() here,
>>>>> since tswap32() depends on the host endianness.
>>>>
>>>> tswap depends on target endianness.
>>>
>>> Yes, it depends on both host/target endianness. What I meant
>>> is we shouldn't have system code depending on host endianness.
>>
>> It compares host vs target endianness, to determine if a swap is needed.  But the real
>> dependency is target endianness.
> 
> It does seem odd, though. We have a value in host endianness
> (the EPAPR_MAGIC constant, which is host-endian by virtue of
> being a C constant). But we're storing it to env->gpr[], which
> is to say the CPUPPCState general purpose register array. Isn't
> that array *also* kept in host endianness order?

Yes indeed.

> If so, then the right thing here is "don't swap at all",

So it would seem...

> i.e. just "env->gpr[6] = EPAPR_MAGIC;". But that would imply
> that the current code is setting the wrong value for the GPR
> on little-endian hosts, which seems a bit unlikely...

... unless this board has only been tested on matching hosts.


r~


