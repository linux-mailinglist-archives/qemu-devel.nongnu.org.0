Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A76664D22D4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 21:47:34 +0100 (CET)
Received: from localhost ([::1]:43998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRgk1-00031D-2A
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 15:47:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRgiR-0002HI-3w
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 15:45:57 -0500
Received: from [2607:f8b0:4864:20::1030] (port=42763
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRgiP-0001CA-2H
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 15:45:54 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 c16-20020a17090aa61000b001befad2bfaaso433643pjq.1
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 12:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uKb6nbDQAMC+vdi2WX5HCr7rnhQGgCAJpaUn8oerFac=;
 b=sRPZ2mMuzrqp+k9cY7/Lo+hj1Zi9/JU6bboX4u0AvRKr7jM9+OEGgEWggkKv9a64f4
 fq1sf2uuyyRqAyjcBi3wEXtrN+secrpHtgIm4jhzqkDA0I7Zu2js1OSDsA+Gmuv37LY1
 dZppXHcMYQh1LZ99btv3H+/Z8DAQMvwrYYVSiWckQ93Df6e/pP86CxOltuSRG7Ccy82n
 P/e27KvQCE1lVAkpuWISpoTnhdwf4NVNDP/Fj8ApC5T0MMzI5MK4nEKV/uzt+MPVQQKO
 1QK0nPKbugctufzvPCGFgCcBX5MzwWi+fQlxpgSew/MguwQ0tlHpOQZO9yXO+QLL2aRK
 zJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uKb6nbDQAMC+vdi2WX5HCr7rnhQGgCAJpaUn8oerFac=;
 b=fSyBkG0Nlyf3e6NqaXXnoctYy3xtCRXb/PI3x6kI50oLiP+cgZQqzjq8+am41/06Bf
 plcX8AB3VVXR8zkjsZZtEBOmHTJ55PpWh5VKf22ZWI/o5x+etEgtfW4r6DMLJWMATzXq
 krCou7xDbv2xt0/6rX/TvtTDwDvUrv4ubPKNxH2+xWByYEKTLPn50vcPOZzMGKMMnkQl
 KMmHzo5ORUfFz/aNbHEP8p5V71Ct4WlJP/tOOXdAGMG4ckaSNiE/RTbwxLNb1VwF7/40
 Sw2LzA/d7fhioP9eCt+lSXI8i4JPFK/w9T3tP+PDqgkwXTcsgAByWssmVBfeVX75vGqm
 xwNA==
X-Gm-Message-State: AOAM530aMNY16NDGNL3VEdscKdsZvsPDSlcbF7sIcttqnKZ1AaW4h3Xe
 BbAmXuip680RR6yegRjiexZuQQ==
X-Google-Smtp-Source: ABdhPJyyDLWwq8vArrW2VmWgxh2kix6jfwyMAmwMgKicLvI9lAshjDa+praGDvWaqRpfDeZNorQYxQ==
X-Received: by 2002:a17:903:22cb:b0:151:9f41:8738 with SMTP id
 y11-20020a17090322cb00b001519f418738mr19969411plg.46.1646772351390; 
 Tue, 08 Mar 2022 12:45:51 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 y5-20020a056a00190500b004f104b5350fsm21288945pfi.93.2022.03.08.12.45.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 12:45:50 -0800 (PST)
Message-ID: <f80be14d-d3d4-b3d7-0b0a-3fc28f7e28ac@linaro.org>
Date: Tue, 8 Mar 2022 10:45:46 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 17/33] target/nios2: Prevent writes to read-only or
 reserved control fields
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-18-richard.henderson@linaro.org>
 <CAFEAcA-y3H1GP9TFDoUsLTMNWMe0SnVAXHyM2scaRyCafD=Y=w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-y3H1GP9TFDoUsLTMNWMe0SnVAXHyM2scaRyCafD=Y=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/22 10:24, Peter Maydell wrote:
> On Tue, 8 Mar 2022 at 07:20, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Create an array of masks which detail the writable and readonly
>> bits for each control register.  Apply them when writing to
>> control registers.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
>> index f2813d3b47..189adf111c 100644
>> --- a/target/nios2/cpu.c
>> +++ b/target/nios2/cpu.c
>> @@ -88,6 +88,55 @@ static void nios2_cpu_initfn(Object *obj)
>>
>>       cpu_set_cpustate_pointers(cpu);
>>
>> +    /* Begin with all fields of all registers are reserved. */
>> +    memset(cpu->cr_state, 0, sizeof(cpu->cr_state));
>> +
>> +    /*
>> +     * The combination of writable and readonly is the set of all
>> +     * non-reserved fields.  We apply writable as a mask to bits,
>> +     * and merge in existing readonly bits, before storing.
>> +     */
>> +#define WR_REG(C)       cpu->cr_state[C].writable = -1
>> +#define RO_REG(C)       cpu->cr_state[C].readonly = -1
>> +#define WR_FIELD(C, F)  cpu->cr_state[C].writable |= R_##C##_##F##_MASK
>> +#define RO_FIELD(C, F)  cpu->cr_state[C].readonly |= R_##C##_##F##_MASK
>> +
>> +    WR_FIELD(CR_STATUS, PIE);
> 
> I think you need to claim (CR_STATUS, RSIE) is a RO bit, because without
> EIC it's should-be-one.

That's patch 19.

> 
>> +    WR_REG(CR_ESTATUS);
>> +    WR_REG(CR_BSTATUS);
>> +    RO_REG(CR_CPUID);
>> +    WR_FIELD(CR_EXCEPTION, CAUSE);
>> +    WR_REG(CR_BADADDR);
>> +
>> +    /* TODO: These control registers are not present with the EIC. */
>> +    WR_REG(CR_IENABLE);
>> +    RO_REG(CR_IPENDING);
> 
> Missing CR_CONFIG register ?

Present with MPU or ECC, and we implement neither.  Perhaps these should be listed below 
with the TODO?

> 
>> +
>> +    if (cpu->mmu_present) {
>> +        WR_FIELD(CR_STATUS, U);
>> +        WR_FIELD(CR_STATUS, EH);
> 
> True by the documentation, but we don't seem to prevent EH from
> being set to 1 when we take an exception on the no-MMU config...

Yeah, I noticed this when cleaning things up in patch 28, but didn't want to change things 
too much in that patch.  I also don't have a no-mmu kernel to test against.

>> +        WR_FIELD(CR_TLBMISC, WR);
> 
> (the docs call this field 'WE', incidentally)

Yeah, noticed that and meant to fix it, but forgot.

>> +        WR_FIELD(CR_TLBMISC, RD);
> 
> If you claim this bit to be writable you'll allow the gdbstub
> to set it, which is probably not what you want. (Actual writes to
> this register are handled via the helper function.)

Mm.  Perhaps calling it reserved is the easiest way out of that.  For these mmu registers, 
we don't apply the two masks, but pass it all to the helper.  I'm open to ideas there.

>> +        WR_FIELD(CR_TLBMISC, WAY);
> 
> Missing PID field ?

Yep, thanks.

>> +        WR_REG(CR_TLBACC);
> 
>> +    }
> 
> You don't enforce the reserved/readonly bits on status when
> we copy it from estatus during eret. (That change appears later,
> in patch 26.)

Yep.  I could move the masking back to this patch, leave only the estatus/sstatus change 
to patch 26.

> The same *ought* to apply for bret, except that we have a bug in
> our implementation of it, where we fail to copy bstatus into status...

Hah, thanks, yes.


r~

