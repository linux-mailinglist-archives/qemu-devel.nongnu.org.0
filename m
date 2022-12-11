Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 039F4649514
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 17:25:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4P8O-0006VC-2b; Sun, 11 Dec 2022 11:25:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4P8L-0006V3-Nh
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 11:24:57 -0500
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4P8J-000430-7V
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 11:24:56 -0500
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1445ca00781so5810676fac.1
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 08:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O/E3YJOQjdQ0vtE2MCN13iZTfGILQbDTSd2RGsxouBg=;
 b=JfzFlA/aqX3LWIbiIAoSvSVXda4IILq0Q98OGaz5KOD+WZQON1a5wYH4/Tu5/O17up
 Mh4GBDmFD8oAbkHYRPBl3Uh4me6KGBfvFkAdtMF7lFUrsX72MMw7Sxcd+ZHRxzjhx4Q8
 IF2rgULu4Sh6Q5F0dXoh0N7jggvIBwk0FhrvjNhdQNN3+EMtHLbLfX86pO2wlUD2doSS
 T1s/YuEsPmlYjM2D8X2wFrpuKJnUTdOA1b1gIHN4wj8qk4vi+cP9zffwU9PkhuVrHiHx
 7e3dmQtrZg4N6EZa69FsVxByDFE/8ovNuvkX1O98sDuD241mBo3Oz8nWyddhnKQIIhrQ
 6XOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O/E3YJOQjdQ0vtE2MCN13iZTfGILQbDTSd2RGsxouBg=;
 b=EkFJM07RSkysyrAN608sF8asGPSCRr1WsTZpo5GKHZV4OkF23S3/budQMIldYmbMAG
 Xbe/73kMqPkUpKxoV5qWwomSlVxbLby1FFx6NNdahmbdhecllBFxbnPEPGC+TYWvk+Io
 3KUJKi3Gu1DB7ubCdV9hW42MJIELvpm39jSKpeNVQbBCQ4VLC7Ul0kb4bsxVinRKUC95
 bu+U+joA0gSMymTc2JLfpIOyeu5GnTQLB8Z0lUCz8HLOUuiqllKf0ZlBTnyTRj4ooLEX
 QrX2sAWUMBH01+lPDYi3Tdxp+ql3oxhDI5EZ842EaYmJ/9T0pV1O5/UqPXX6SOhEvtGk
 +JkA==
X-Gm-Message-State: ANoB5pnplnO9pd5e9ciJAS6WTuaFVk1roDFxJHGpphDhFjVf78ql4mBI
 VNhMQDVnmnZgPXQRCyPgmL28IQ==
X-Google-Smtp-Source: AA0mqf4ELX04sbqJ9/hwT/hUWwHcW7zepxPLNdf8JCtTr+2YG2po87PtUDhn0zi8GK6cWpIk6vohqw==
X-Received: by 2002:a05:6870:5ccb:b0:148:1e16:8ca1 with SMTP id
 et11-20020a0568705ccb00b001481e168ca1mr2118513oab.45.1670775893550; 
 Sun, 11 Dec 2022 08:24:53 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:7b4f:f28b:eca6:b583?
 ([2806:102e:18:2efc:7b4f:f28b:eca6:b583])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a056870561100b0012763819bcasm3850934oao.50.2022.12.11.08.24.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 08:24:53 -0800 (PST)
Message-ID: <334a4beb-9c14-508c-9855-a723779eb239@linaro.org>
Date: Sun, 11 Dec 2022 10:24:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 5/7] hw/mips/bootloader: Implement nanoMIPS SW
 opcode
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
References: <20221210155502.74609-1-philmd@linaro.org>
 <20221210155502.74609-6-philmd@linaro.org>
 <ffe60d4d-551a-bf4c-403e-7d64aed30a78@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ffe60d4d-551a-bf4c-403e-7d64aed30a78@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2f.google.com
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

On 12/10/22 10:02, Philippe Mathieu-Daudé wrote:
> On 10/12/22 16:55, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/mips/bootloader.c | 24 +++++++++++++++++++++++-
>>   1 file changed, 23 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
>> index 997e74ee52..cc3df385df 100644
>> --- a/hw/mips/bootloader.c
>> +++ b/hw/mips/bootloader.c
>> @@ -150,9 +150,31 @@ static void bl_gen_lui(void **p, bl_reg rt, uint32_t imm32)
>>       }
>>   }
>> +static void bl_gen_ori_nm(void **ptr, bl_reg rt, bl_reg rs, uint16_t imm)
>> +{
>> +    uint16_t *p = (uint16_t *)*ptr;
>> +    uint32_t insn = 0;
> 
> Similarly, we should check whether imm fits in 12-bit.

I think you should simply split at the "li" level instead of lui+ori.


r~

> 
>> +    insn = deposit32(insn, 26, 6, 0b100000);
>> +    insn = deposit32(insn, 21, 5, rt);
>> +    insn = deposit32(insn, 16, 5, rs);
>> +    insn = deposit32(insn, 0, 12, imm);
>> +
>> +    stw_p(p, insn >> 16);
>> +    p++;
>> +    stw_p(p, insn >> 0);
>> +    p++;
>> +
>> +    *ptr = p;
>> +}
> 
> 


