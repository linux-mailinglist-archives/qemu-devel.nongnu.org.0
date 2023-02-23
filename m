Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CCF6A0681
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:45:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV95V-0002nM-TL; Thu, 23 Feb 2023 05:44:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pV95O-0002mF-Rr
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:44:29 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pV95L-000889-VT
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:44:26 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 p18-20020a05600c359200b003dc57ea0dfeso9845177wmq.0
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SImOkEqmDdEkwhMjhXOR0F510uW6Vxv8G6En62JaJkI=;
 b=wx4x7yu/A1lmheTqE1uuvt/BGNAx0w3nBgIlgO8lz6gT/4AdGbqTL2I4iQV5xIipQ1
 tcEQv65DEFVQRqdjeL90ynscsL7IlnAagbQMliQfj0BHcNnlhqpnC15DZ0QF1m1Yp9Hr
 dpJHy8CgBNBg1gfKFzZ+1rPBXlTND50VbbQvRGcaUVYJTG3CuOYPaIJzjX6d5ZXnIzZP
 nDOL4YHvNQHJgGOTF5Kq8x5aSwbXuPeILDiEEYEEybb5sAZyTKuixanTQ4TH34sK0YmR
 dGwam3yGRdkk3+KIyqfGE4SdYYgFyuFO15fDOixADUm1DRW168/TOo/WvKec8rdJgrQV
 ebbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SImOkEqmDdEkwhMjhXOR0F510uW6Vxv8G6En62JaJkI=;
 b=1oEyqcLbhjpOfrQc8Gjcvdvta/AvOcswH42IWNUrzL0IAX99Tx0tlcgd3OEu0FW/7a
 e8lPcItaNMdKECuqzTG/z68TiTp66m8Uavd79FW002uPDITpxGJl2DQUJTPj9Bvjyf6s
 EEHVW7sqlmpvYyfGKsqy6XnRqONV0sqA2gOCp+s4eipYXrPiUVOtHm9Gm0FFGbGjIndB
 tcq3YXmc0fXXatB0FTL/mh5OSfen2kxfVobY9YkP/0bqutm9QzwzTXphACOpBjasuifS
 +qd1Jt+30fBGBGDOqn62/9/xoKSCpqYlEFREoB/YS5r4qNtIHc3wJcykKRB7OSC24jWQ
 wcsQ==
X-Gm-Message-State: AO0yUKUW+9OR4/B/Vh7XphB/0tBeHXCXnwr26XMIxArf0V0j+LdZMbCC
 Kf4jrEwJJW7AVXAYlqqBlsyn8Q==
X-Google-Smtp-Source: AK7set/DN4tN85d32FYZjSqMMqPt7wK1DXlFI3r9ZunSVv3rrfLhpQT5x1JPvo9RJNmak8m5DKQaJA==
X-Received: by 2002:a05:600c:3b20:b0:3df:db20:b0ae with SMTP id
 m32-20020a05600c3b2000b003dfdb20b0aemr9844135wms.17.1677149061140; 
 Thu, 23 Feb 2023 02:44:21 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 15-20020a05600c22cf00b003e11f280b8bsm11597260wmg.44.2023.02.23.02.44.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 02:44:20 -0800 (PST)
Message-ID: <a7bc04e9-a3e8-1210-976e-f166b25cbc8e@linaro.org>
Date: Thu, 23 Feb 2023 11:44:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v9 08/14] hw/nvram: NPCM7xx OTP device model
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Havard Skinnemoen <hskinnemoen@google.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com,
 kfting@nuvoton.com, Alexander Bulekov <alxndr@bu.edu>,
 Shengtan Mao <stmao@google.com>, Hao Wu <wuhaotsh@google.com>,
 Chris Rauer <crauer@google.com>
References: <20200911052101.2602693-1-hskinnemoen@google.com>
 <20200911052101.2602693-9-hskinnemoen@google.com>
 <6ccd925d-b965-4da0-13f2-365bd75abe88@linaro.org>
In-Reply-To: <6ccd925d-b965-4da0-13f2-365bd75abe88@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
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

Tyrone, Hao, ping?

On 22/12/22 16:03, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> (old patch)
> 
> On 11/9/20 07:20, Havard Skinnemoen wrote:
>> This supports reading and writing OTP fuses and keys. Only fuse reading
>> has been tested. Protection is not implemented.
>>
>> Reviewed-by: Avi Fishman <avi.fishman@nuvoton.com>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Tested-by: Alexander Bulekov <alxndr@bu.edu>
>> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
>> ---
>>   include/hw/arm/npcm7xx.h       |   3 +
>>   include/hw/nvram/npcm7xx_otp.h |  79 ++++++
>>   hw/arm/npcm7xx.c               |  29 +++
>>   hw/nvram/npcm7xx_otp.c         | 440 +++++++++++++++++++++++++++++++++
>>   hw/nvram/meson.build           |   1 +
>>   5 files changed, 552 insertions(+)
>>   create mode 100644 include/hw/nvram/npcm7xx_otp.h
>>   create mode 100644 hw/nvram/npcm7xx_otp.c
> 
>> +/**
>> + * npcm7xx_otp_array_write - ECC encode and write data to OTP array.
>> + * @s: OTP module.
>> + * @data: Data to be encoded and written.
>> + * @offset: Offset of first byte to be written in the OTP array.
>> + * @len: Number of bytes before ECC encoding.
>> + *
>> + * Each nibble of data is encoded into a byte, so the number of bytes 
>> written
>> + * to the array will be @len * 2.
>> + */
>> +extern void npcm7xx_otp_array_write(NPCM7xxOTPState *s, const void 
>> *data,
>> +                                    unsigned int offset, unsigned int 
>> len);
> 
>> +static void npcm7xx_init_fuses(NPCM7xxState *s)
>> +{
>> +    NPCM7xxClass *nc = NPCM7XX_GET_CLASS(s);
>> +    uint32_t value;
>> +
>> +    /*
>> +     * The initial mask of disabled modules indicates the chip 
>> derivative (e.g.
>> +     * NPCM750 or NPCM730).
>> +     */
>> +    value = tswap32(nc->disabled_modules);
> 
> In which endianness do you want this 32-bit fuse value to be written?
> 
> I suppose you used a little-endian host, so we want it big-endian in
> the OTP? In that case it would be better to use cpu_to_be32(), to
> be able to use the OTP on a big-endian host such s390x.
> 
>> +    npcm7xx_otp_array_write(&s->fuse_array, &value, 
>> NPCM7XX_FUSE_DERIVATIVE,
>> +                            sizeof(value));
>> +}
> 
> For completeness:
> 
>  > +static void npcm730_class_init(ObjectClass *oc, void *data)
>  > +{
>  > +    NPCM7xxClass *nc = NPCM7XX_CLASS(oc);
>  > +
>  > +    /* NPCM730 is optimized for data center use, so no graphics, 
> etc. */
>  > +    nc->disabled_modules = 0x00300395;
>  > +    nc->num_cpus = 2;
>  > +}
>  > +
>  > +static void npcm750_class_init(ObjectClass *oc, void *data)
>  > +{
>  > +    NPCM7xxClass *nc = NPCM7XX_CLASS(oc);
>  > +
>  > +    /* NPCM750 has 2 cores and a full set of peripherals */
>  > +    nc->disabled_modules = 0x00000000;
>  > +    nc->num_cpus = 2;
>  > +}
> 
> Thanks,
> 
> Phil.


