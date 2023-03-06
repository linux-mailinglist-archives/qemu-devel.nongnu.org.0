Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFB96ABFDC
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 13:50:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZAID-00018R-CI; Mon, 06 Mar 2023 07:50:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZAHs-0000uf-Qq
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:49:56 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZAHq-0006WK-8o
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:49:56 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 l7-20020a05600c1d0700b003eb5e6d906bso5101491wms.5
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 04:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678106993;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bNVI7VluNzoNqhyY8xwpbpXH18Ij1XqJr9FfKmRqYtM=;
 b=VaYyaIxBseiIcs8zgz5qdOSXqTGLrpl6mt0h50ByjM7G+u4bp6jxJW1HPD7hS5dU2Q
 3hCfmKygsFyk0BKrtmqjkoUI3DXD0a+6mffdb5Ay9Vl/oIoEoPSVolfSEMSmzz3ZDlid
 zYbLS5u/Yn+1y2lmv0n3RFMg6X8U7R3tf7vOwSKePyR+YZzLmhmuPzcevH3hyo4CKZ/W
 UsaU1J7gE+o5IHiYutKA9SX/nd792SuSOrtadfO4fx05MNIZmLAvkQXf43wBTZtEblsJ
 TEjQsCvSRHSxyhtmo7p6tdxxerjuh6Zt3LRd3fsmlMqn0Hip0JFZpDZXTisKgkf7tfte
 qe5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678106993;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bNVI7VluNzoNqhyY8xwpbpXH18Ij1XqJr9FfKmRqYtM=;
 b=FpMfdXTWbsUzFpTlMXMoOhPWw9OGWxVVQELc2Sv2zpdGsp82ZBO6TNLWS7mdNPB2ZZ
 vPUdpwHvSN+ar60qapaWTgv4whgkf6CEv0Wk960pbpRPtM3PhLsHXhY/pFWMx2mQYybx
 aJJIpI4cYM0LaJqHwYd/21q9CtAEIj5uYGTSbnocBllb3Flsp7TxfFQwkS0CnPQ7m+MT
 HoyQ54NTJHMGu05Yi4e5ePIiWoTQ8nWuwzCswrtJILdYTHACfz8jAYw54MrIrXek8mZC
 Pf0iHT6E+k/I4e0yWosd47fRcm0S5moXYKhbEXV8C1K/dgxkWvTFgiCCuGHbLBN9iNXI
 C70Q==
X-Gm-Message-State: AO0yUKV/M43ooGKY1rrQb8pRgP+RY7130WbMm7zMiZlp3EokXlJ/L215
 7WPQIE62tPLt0yk8D2aJ1GtJTA==
X-Google-Smtp-Source: AK7set9P1KeYvpI0q2IczybaqswE0PROavmuR1VAddtoe5O4LCdi418dBgkP8f25CuVOONMIC1NAAQ==
X-Received: by 2002:a05:600c:1d24:b0:3da:1f6a:7b36 with SMTP id
 l36-20020a05600c1d2400b003da1f6a7b36mr9079376wms.0.1678106992726; 
 Mon, 06 Mar 2023 04:49:52 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c42c600b003eb192787bfsm9951209wme.25.2023.03.06.04.49.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 04:49:52 -0800 (PST)
Message-ID: <016f86ca-a703-748c-d44f-7d419a7e9f29@linaro.org>
Date: Mon, 6 Mar 2023 13:49:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v9 08/14] hw/nvram: NPCM7xx OTP device model
To: "Avi.Fishman@nuvoton.com" <Avi.Fishman@nuvoton.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "KFTING@nuvoton.com" <KFTING@nuvoton.com>, Alexander Bulekov
 <alxndr@bu.edu>, Shengtan Mao <stmao@google.com>,
 Hao Wu <wuhaotsh@google.com>, Chris Rauer <crauer@google.com>
References: <20200911052101.2602693-1-hskinnemoen@google.com>
 <20200911052101.2602693-9-hskinnemoen@google.com>
 <6ccd925d-b965-4da0-13f2-365bd75abe88@linaro.org>
 <TYZPR03MB5678AF48AA1C86E4C96521A7E4B19@TYZPR03MB5678.apcprd03.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <TYZPR03MB5678AF48AA1C86E4C96521A7E4B19@TYZPR03MB5678.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 5/3/23 08:41, Avi.Fishman@nuvoton.com wrote:
> Hi,
> 
> Inside
> 
> 
>> -----Original Message-----
>> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Sent: Thursday, December 22, 2022 5:03 PM
>> To: Havard Skinnemoen <hskinnemoen@google.com>; peter.maydell@linaro.org
>> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org; IS20 Avi Fishman
>> <Avi.Fishman@nuvoton.com>; CS20 KFTing <KFTING@nuvoton.com>; Alexander
>> Bulekov <alxndr@bu.edu>; Shengtan Mao <stmao@google.com>; Hao Wu
>> <wuhaotsh@google.com>; Chris Rauer <crauer@google.com>; CS20 KFTing
>> <KFTING@nuvoton.com>
>> Subject: Re: [PATCH v9 08/14] hw/nvram: NPCM7xx OTP device model
>>
>> Hi,
>>
>> (old patch)
>>
>> On 11/9/20 07:20, Havard Skinnemoen wrote:
>>> This supports reading and writing OTP fuses and keys. Only fuse reading
>>> has been tested. Protection is not implemented.
>>>
>>> Reviewed-by: Avi Fishman <avi.fishman@nuvoton.com>
>>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> Tested-by: Alexander Bulekov <alxndr@bu.edu>
>>> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
>>> ---
>>>    include/hw/arm/npcm7xx.h       |   3 +
>>>    include/hw/nvram/npcm7xx_otp.h |  79 ++++++
>>>    hw/arm/npcm7xx.c               |  29 +++
>>>    hw/nvram/npcm7xx_otp.c         | 440 +++++++++++++++++++++++++++++++++
>>>    hw/nvram/meson.build           |   1 +
>>>    5 files changed, 552 insertions(+)
>>>    create mode 100644 include/hw/nvram/npcm7xx_otp.h
>>>    create mode 100644 hw/nvram/npcm7xx_otp.c
>>
>>> +/**
>>> + * npcm7xx_otp_array_write - ECC encode and write data to OTP array.
>>> + * @s: OTP module.
>>> + * @data: Data to be encoded and written.
>>> + * @offset: Offset of first byte to be written in the OTP array.
>>> + * @len: Number of bytes before ECC encoding.
>>> + *
>>> + * Each nibble of data is encoded into a byte, so the number of bytes written
>>> + * to the array will be @len * 2.
>>> + */
>>> +extern void npcm7xx_otp_array_write(NPCM7xxOTPState *s, const void
>> *data,
>>> +                                    unsigned int offset, unsigned int len);
>>
>>> +static void npcm7xx_init_fuses(NPCM7xxState *s)
>>> +{
>>> +    NPCM7xxClass *nc = NPCM7XX_GET_CLASS(s);
>>> +    uint32_t value;
>>> +
>>> +    /*
>>> +     * The initial mask of disabled modules indicates the chip derivative (e.g.
>>> +     * NPCM750 or NPCM730).
>>> +     */
>>> +    value = tswap32(nc->disabled_modules);
>>
>> In which endianness do you want this 32-bit fuse value to be written?
> 
> It should be little endian, I am not sure why there is a swap here.
> Unless the nc->disabled_modules for some reason is coming swapped so we swap it back.
> 
>>
>> I suppose you used a little-endian host, so we want it big-endian in
>> the OTP? In that case it would be better to use cpu_to_be32(), to
>> be able to use the OTP on a big-endian host such s390x.
> 
> So according to what I said then use cpu_to_le32()

Thank you Avi!

