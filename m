Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C34F738FB24
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 08:46:52 +0200 (CEST)
Received: from localhost ([::1]:47174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llQq3-0008JZ-TU
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 02:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llQoW-000724-0B; Tue, 25 May 2021 02:45:16 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llQoU-00033v-By; Tue, 25 May 2021 02:45:15 -0400
Received: by mail-wm1-x332.google.com with SMTP id z130so16069126wmg.2;
 Mon, 24 May 2021 23:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ebn63hHqkjlgUmZfp5AMlLroqpj8MQllW+Oasfs+1PA=;
 b=NwslT851irPFNUEmcGPEdoGTT2QSf/GgP51R1kykySOHttZimmW+QFdB1j4GwLc4xE
 8lemsJj4/lYSq6cme3+OjMYy89SkvviXQY2epf3yZCaQnuy/cABMgzOEZpYzZVpXxyut
 V/H+hSgDkdLxVuii1ku3EgxWKm2gBvz2tTu7a8zT5VMie1PTyxP5ef6Krg/ZIpKNdi9L
 xmrbV4e4tzGt1YJ+JOkvinipD72nD0Vj93ADncw5o3+tRNAm2SeFupwLRmoicfBbezCy
 1+S0Q6ukyhg2nQ+pWHIy+w86mJBkeI9ZzxMFXhaiIVOKunQDPAIwgr+B+aoYz+ILZ+cU
 97gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ebn63hHqkjlgUmZfp5AMlLroqpj8MQllW+Oasfs+1PA=;
 b=gTzFE50oa/L8Oy2MeZemAPMp5yuYaqsSROXJlWYDrvnR0uDHdMeZTtqXxkb2YYuuOh
 +GWYhy3ZJWN1nVANyoi6qvrcGtpvGkowsybce3rqxiTie2oPf79km2EMaqmKOben0rcm
 L9zQLzTdyR+49D+pHpIrYrxHx966jJ//LZ6TpU7vSHfEAHTy/yFtZnizGhZqrgsRCWUj
 bXgOPoL6GyARBgWxyEr9ycGEjiXbSWb/m0IU/gH43R2Gb7yoPlonDyj153IUvsdXEdP6
 FMKDFC83rtESRBLpstoK9WbkC7Ej22qTFybtvib2Ivif7bCV41IEQBUYA9JMc3JIxrmP
 QBtw==
X-Gm-Message-State: AOAM530ajgcavpOdQk9gE99RxSjILImzoxFzKzwcqQNrl778Kj+hM7L1
 B8ym1CCpvOZumZXWQ3TB5Sk=
X-Google-Smtp-Source: ABdhPJwE3XG53EGe+6pMrlFmbtzHNel2uBMUGR5i2Ks+rfoCCG/HGS2c8d2y+8BeMVDLzBu5rJ/H8g==
X-Received: by 2002:a05:600c:350a:: with SMTP id
 h10mr23438862wmq.119.1621925112197; 
 Mon, 24 May 2021 23:45:12 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id p5sm15573577wrd.25.2021.05.24.23.45.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 23:45:11 -0700 (PDT)
Subject: Re: [PATCH_V3] Adding ifdefs to call the respective routines only
 when their configs are enabled
To: Swetha Joshi <swethajoshi139@gmail.com>
References: <20210525025823.3208218-1-swethajoshi139@gmail.com>
 <331a819e-1745-4d4b-cc4a-82521a58186a@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <59ce1ae3-fb76-aea4-d631-f3668a2d2386@amsat.org>
Date: Tue, 25 May 2021 08:45:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <331a819e-1745-4d4b-cc4a-82521a58186a@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-trivial@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm <qemu-arm@nongnu.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 5:20 AM, Richard Henderson wrote:
> On 5/24/21 7:58 PM, Swetha Joshi wrote:
>> Signed-off-by: Swetha Joshi <swethajoshi139@gmail.com>
>> ---
>>   target/arm/kvm64.c | 12 ++++++++----
>>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> You're still missing the commit message.
> 
>>
>> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
>> index dff85f6db9..47a4d9d831 100644
>> --- a/target/arm/kvm64.c
>> +++ b/target/arm/kvm64.c
>> @@ -1403,7 +1403,10 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int
>> code, void *addr)
>>       hwaddr paddr;
>>       Object *obj = qdev_get_machine();
>>       VirtMachineState *vms = VIRT_MACHINE(obj);
>> -    bool acpi_enabled = virt_is_acpi_enabled(vms);
>> +    bool acpi_enabled = false;

Oh, IIUC this is an user request to build QEMU *with* KVM but
*without* the Virt machine? Presumably sbsa-ref or Xilinx
Versal/ZynqMP?

Interesting, I never tested that config. Swetha, do you mind
providing more information on the use case?

Thanks,

Phil.

>> +#ifdef CONFIG_ARM_VIRT
>> +    acpi_enabled = virt_is_acpi_enabled(vms);
>> +#endif /* CONFIG_ARM_VIRT */
>>         assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
>>   @@ -1426,12 +1429,13 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c,
>> int code, void *addr)
>>                */
>>               if (code == BUS_MCEERR_AR) {
>>                   kvm_cpu_synchronize_state(c);
>> -                if (!acpi_ghes_record_errors(ACPI_HEST_SRC_ID_SEA,
>> paddr)) {
>> -                    kvm_inject_arm_sea(c);
>> -                } else {
>> +#ifdef CONFIG_ACPI_APEI
>> +                if (acpi_ghes_record_errors(ACPI_HEST_SRC_ID_SEA,
>> paddr)) {
>>                       error_report("failed to record the error");
>>                       abort();
>>                   }
>> +#endif /* CONFIG_ACPI_APEI */
>> +                kvm_inject_arm_sea(c);
>>               }
> 
> Otherwise the actual patch looks ok.
> 
> I'm a bit surprised that you need the second hunk.  I would have
> expected the entire block to be optimized away with the 'acpi_enabled =
> false' being propagated into the outermost IF.
> 
> 
> r~
> 


