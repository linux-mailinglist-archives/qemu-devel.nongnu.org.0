Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8902EB947
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 06:23:29 +0100 (CET)
Received: from localhost ([::1]:46604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx1I8-0007w0-CL
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 00:23:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kx1H9-0007Ve-6H
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 00:22:27 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kx1H7-0005jv-2d
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 00:22:26 -0500
Received: by mail-wr1-x42e.google.com with SMTP id w5so1271434wrm.11
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 21:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YxeLeNyh1RMmtGaOHSBjZA0GZBX46rkh1IZp9CAqAek=;
 b=Tl/eYSqA/dy5+zycOpPZC4RXPR/NDFyZ+r10PdmzGae4Bfb28SCKmhFS4vonNupfVD
 ruFsvfGRclkmWmvwm1MthJQ/sZS8JYsnENIzjuzd7skrMXuFr9zW6hAmW2amoDmqi38b
 UVnSww9iFwAbsq0VI+cj94Fw9gqes5c2EpTmJH4gNqZjcOX4QqIxg65EmjkqNZ5jwPjq
 3jlbNRTRzsRr5wQ8awZo8PUoCkbzfMcrY4hXt2tairpxsZx/QI5xMO6c2hKfSQvm7Y1I
 tvrywsfUJZNgnV8njv6tda/uEZ9DX3amMfNO0lOTejfJI2g2ysG+qvR0o7pU/RQMf3Js
 rNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YxeLeNyh1RMmtGaOHSBjZA0GZBX46rkh1IZp9CAqAek=;
 b=nzmMl+rVcwJVEY6MK1zIeqgGKVSQTNJvVgwbDKk8tyyd6LvmLr+CDGtTnat32QiAny
 rTEVOkw1OEiRhuxruKFPtXpzofUIfHw+xGvIci4X0cV/OVF2Yr9h9X4VfIm6GJ69LZqe
 fiS+UR+gIC2J2g8chhOliV0ijC0vQCOdS+NEup27Y2FuM4JdfpQKZ7zSM47kz5790VwC
 41Sjt/aPLW09YSeqpG9rrxm8DNZ2gYpwBklesuiMod8hTbCaIyc3xCba7104W33nFES3
 GQdIkRcSNKD8Wgat6xQB+vwfDaheOzYOAMvJwgHfqvkYMi68k66NRzzDSUeJgTCVVW+b
 Zh6Q==
X-Gm-Message-State: AOAM531x6ttf7+/YlG4RU6ERu0LOUnzioXfNx2hOh4QQOI8F+wmx0jXF
 U/8Vyc5CQceG0TyHGt+u6H8=
X-Google-Smtp-Source: ABdhPJxTFyjBD+Iap20EnQb26Ou5Tu15kvl5BnRDuINytAG91fjqP07i4uqaOEKYG5/qPNYM5O2QgA==
X-Received: by 2002:adf:ec8c:: with SMTP id z12mr2485917wrn.208.1609910543601; 
 Tue, 05 Jan 2021 21:22:23 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id q73sm1557001wme.44.2021.01.05.21.22.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 21:22:22 -0800 (PST)
Subject: Re: [PATCH v3 04/15] target/mips/mips-defs: Introduce CPU_MIPS64 and
 cpu_type_is_64bit()
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210104221154.3127610-1-f4bug@amsat.org>
 <20210104221154.3127610-5-f4bug@amsat.org>
 <aee2c3f4-f4b0-1d1a-2029-3c027d6cd724@linaro.org>
 <f351074a-e63e-f39a-c807-9250deca9c39@amsat.org>
 <d8cdb54c-bfd5-1ade-090a-7ad15974a302@amsat.org>
 <59096982-882f-5912-0fc4-27cb89166381@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7975d04c-0fc3-ecc3-8727-1372d6c529cb@amsat.org>
Date: Wed, 6 Jan 2021 06:22:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <59096982-882f-5912-0fc4-27cb89166381@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/6/21 5:23 AM, Jiaxun Yang wrote:
> 在 2021/1/5 下午6:05, Philippe Mathieu-Daudé 写道:
[...]
>>> I based the decodetree logic on the R6 ISA manual, decoding the
>>> bits from the more recent feature (a leaf) to the root, following
>>> this tree:
>>> https://images.anandtech.com/doci/8457/MIPS%20ISA%20Evolution.JPG
>>> (2.3 Evolution of the Architecture).
>>>
>>> Also "2.1 Historical Perspective":
>>>
>>>    In the MIPS IIITM ISA, 64-bit integers and addresses were added
>>>    to the instruction set. [...]
>>>    The MIPS32 Release 6 ISA maintains backward-compatibility, with
>>>    the exception of a few rarely used instructions, though the use
>>>    of trap-and-emulate or trap-and-patch; all pre-Release 6 binaries
>>>    can execute under binary translation. [...]
>>>    The MIPS64 Architecture is based on the MIPS V ISA and is backward
>>>    compatible with the MIPS32 Architecture.
> 
> Hi all,
> 
> Well I don't think it's worthy to keep R6 backward compatible with previous
> Release. Opcodes existed in pre-R6 but removed in R6 will be reused in
> future Releases (e.g. R6.1) for different functions.
> 
> And the statement here about trap-and-emul, trap-and-patch is false. It
> never
> happens in the real world. R2-to-R6 emul in kernel never goes into
> production
> quality, not to mention IEEE754-2008 (NAN2008) issue.
> 
> Based on documents we have, I'd prefer to treat MIPS ISA into three eras
> Classic (I, II, III, IV), Modern (R1, R2, R3, R5), R6+(R6 and afterwards).

Sounds good to me!

> The difference inside each era is well-documented in manuals, it can
> prevent
> us from get into a long-term hide and seek game of finding difference
> between
> ISA levels.

Which is easier when you have access to the manuals ;)

>>>
>>>> But if this is an intermediate step,
>>> As this isn't planned as intermediate step, I'll try to keep
>>> CPU_MIPS64 as a separate bit and post the result.
>> I'm not sure it is worth the effort, as I plan to check each ISA /
>> ASE bit from the CP0_ConfigX bits (similarly target/arm/ does), so
>> these definitions should disappear eventually.
>>
>> I.e. for the MSA ASE see:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg767523.html
>>
>>   /* Check presence of MSA implementation */
>>   static inline bool ase_msa_available(CPUMIPSState *env)
>>   {
>>       return env->CP0_Config3 & (1 << CP0C3_MSAP);
>>   }
> Unfortunately MIPS has a bad manner that allows vendors to have random
> extensions without unique identification.
> ASEs flag can never go...... But identify ASEs from registers is surely
> a good
> idea though. At least removing MIPS defined ASEs from ASE flag can make
> life easier.
> 
> AFAIK Loongson has a CPUID instruction for 3A4000 and we may
> implement that to identify Loongson extensions, Ingenic is also marking
> MXU support in CP0. There could be some PRID based match to further
> reduce ASEs flag.

Yes. I'd like to have check_$FEAT() opaque from the TCG helpers
perspective. Then how the check is implemented is a different
story and can involve CPU specific code (as your 3A4000 example).

Regards,

Phil.

