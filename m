Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EA233D86A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 16:57:33 +0100 (CET)
Received: from localhost ([::1]:58948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMC4a-0006Wy-Ru
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 11:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMC2I-00054k-2m
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:55:10 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:41950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMC2G-0005m0-6e
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:55:09 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso1778513wmi.0
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 08:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PmHCiLRGlb1fNVX0PDOlamGSghE6XVji5W/sU5YNmec=;
 b=a1uzyQPN47SqBokQsGG1XNCSC1AGmPIyOwonnKQGQiTGLARRL1shUs3BvUjuTWyR2E
 NIh2h4qD7nhK5yuOOHCnNVFPDXIpYgAiJEjrwjquwm0gm3ZRBftS0izksE2mPi96tSU8
 jUDtMBY4VVK8ceffwB5D/fwaKH4VI0jXqMwrMtGq06IkTVH9vodiIv7KAcTcLwIFYUIV
 6ZN02YVs8RsDtiHytmUR7HuAeBCiEbiQacD4Fsuv4TGATny5/kKkpnJGgTIphEOwtMXC
 ylWmAhImCxUDOJOLFeKLqwFQ83pqd1GHn0xr2/CEoeUGRySytPhwF2jBH7VeSDo+eiQo
 p08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PmHCiLRGlb1fNVX0PDOlamGSghE6XVji5W/sU5YNmec=;
 b=BKpFJwEJlC4M7gzWnWAfAfcgj+HFo4W+XxUnis44VxYcMlvOqVCHMrsHlL5ZJyrZmM
 LBHe6lZuo2++gdXbvGSxZnXtC2WSBWeku2Q5H9mR2+PPISCCG3wi/heg6NKh8yhvPDGK
 wirbOm96zVmn6N75w3iiMqybOsyqFBbzkgRNOPu+GDS5uwu7LhBLAngyqLyVhmZ4Zch1
 YTqTlPeWDMyWBNXaiP3R9e7zTPILUvekD7zTJ1web9jIjkZshadjf6PtTkdl8OElDCsS
 vloBYKWWqfIbaQhXWoo70xkcSiaHe7siXVnIvSqnvHKm1wSJMmgRZ10/bNRpq9ZeLW3P
 T1VQ==
X-Gm-Message-State: AOAM5303G8sehRhglBRt3mIqbWajCw6c5GCMLG71CCkGfN/v1G13O0zb
 yxiTlt5jadNUDafTR+QAZHo=
X-Google-Smtp-Source: ABdhPJwUEhIpQhahBFnE1DMDAa4xPo7temlQE1gPRAQ+d13HDu4dQ/Lz6uwIPutZ+0bqwNISMOycQA==
X-Received: by 2002:a7b:c084:: with SMTP id r4mr299000wmh.166.1615910106532;
 Tue, 16 Mar 2021 08:55:06 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id e18sm10229654wru.73.2021.03.16.08.55.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 08:55:06 -0700 (PDT)
Subject: Re: [RFC PATCH 5/8] qtest/libqos: Restrict CPU I/O instructions
To: Richard Henderson <richard.henderson@linaro.org>,
 Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org
References: <20210314232913.2607360-1-f4bug@amsat.org>
 <20210314232913.2607360-6-f4bug@amsat.org>
 <b1dc01eb-0090-e47e-2731-c1920d9cda42@redhat.com>
 <66630c68-d8ff-45ca-24e6-bbef1fc566ee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <235ffc43-288b-85aa-29f9-8f23e596674b@amsat.org>
Date: Tue, 16 Mar 2021 16:55:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <66630c68-d8ff-45ca-24e6-bbef1fc566ee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard and Laszlo,

On 3/16/21 4:43 PM, Richard Henderson wrote:
> On 3/16/21 9:37 AM, Laszlo Ersek wrote:
>> (+Peter, comment below)
>>
>> On 03/15/21 00:29, Philippe Mathieu-Daudé wrote:
>>> Restrict CPU I/O instructions to architectures providing
>>> I/O bus.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>   tests/qtest/libqos/fw_cfg.h | 3 +++
>>>   tests/qtest/libqos/fw_cfg.c | 2 ++
>>>   2 files changed, 5 insertions(+)
>>>
>>> diff --git a/tests/qtest/libqos/fw_cfg.h b/tests/qtest/libqos/fw_cfg.h
>>> index c6a7cf8cf05..3bfb6d6d55b 100644
>>> --- a/tests/qtest/libqos/fw_cfg.h
>>> +++ b/tests/qtest/libqos/fw_cfg.h
>>> @@ -36,6 +36,8 @@ size_t qfw_cfg_get_file(QFWCFG *fw_cfg, const char
>>> *filename,
>>>     QFWCFG *mm_fw_cfg_init(QTestState *qts, uint64_t base);
>>>   void mm_fw_cfg_uninit(QFWCFG *fw_cfg);
>>> +
>>> +#ifdef TARGET_HAS_IOPORT
>>>   QFWCFG *io_fw_cfg_init(QTestState *qts, uint16_t base);
>>>   void io_fw_cfg_uninit(QFWCFG *fw_cfg);
>>>   @@ -48,6 +50,7 @@ static inline void pc_fw_cfg_uninit(QFWCFG *fw_cfg)
>>>   {
>>>       io_fw_cfg_uninit(fw_cfg);
>>>   }
>>> +#endif /* TARGET_HAS_IOPORT */
>>>     G_DEFINE_AUTOPTR_CLEANUP_FUNC(QFWCFG, mm_fw_cfg_uninit)
>>>   diff --git a/tests/qtest/libqos/fw_cfg.c b/tests/qtest/libqos/fw_cfg.c
>>> index 6b8e1babe51..db2b83f5212 100644
>>> --- a/tests/qtest/libqos/fw_cfg.c
>>> +++ b/tests/qtest/libqos/fw_cfg.c
>>> @@ -131,6 +131,7 @@ void mm_fw_cfg_uninit(QFWCFG *fw_cfg)
>>>       g_free(fw_cfg);
>>>   }
>>>   +#ifdef TARGET_HAS_IOPORT
>>>   static void io_fw_cfg_select(QFWCFG *fw_cfg, uint16_t key)
>>>   {
>>>       qtest_outw(fw_cfg->qts, fw_cfg->base, key);
>>> @@ -162,3 +163,4 @@ void io_fw_cfg_uninit(QFWCFG *fw_cfg)
>>>   {
>>>       g_free(fw_cfg);
>>>   }
>>> +#endif /* TARGET_HAS_IOPORT */
>>>
>>
>> I'm not sure the macro name is ideal; the PCI host on aarch64/"virt"
>> emulates IO Ports (it's possible to allocate PCI IO resources on
>> "virt"). From patch#3, TARGET_HAS_IOPORT does not seem to extend to
>> arm64.
> 
> Correct, aarch64 has memory-mapped pci io resources, they are not on a
> separate ioport address space as for x86 and avr.

I first wrote TARGET_CPU_HAS_IOPORT but realized architecture
and CPU are linked, so I elided _CPU_.

What I'd like to clear from the QTest API is the idea that the CPU has
direct access to the I/O bus via I/O specific instructions.

Any machine able to use a host <-> PCI bus chipset is able to access
the I/O function from the PCI bus.

The fact that on X86 the first PCI function is wired to the same I/O
bus than the CPU is a machine implementation detail.

When accessing PCI I/O ressources on Aarch64, you don't have to use
dedicated I/O instructions.

Anyway for now Thomas discarded this series, as QTest is a generic API,
and we never had to worry about mixing address spaces so far, so not in
a hurry to clean this (although it would be useful to change address
space to access DMA or secure-CPU-view from QTest).

Regards,

Phil.

