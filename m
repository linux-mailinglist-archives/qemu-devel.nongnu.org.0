Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B25D587722
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 08:39:32 +0200 (CEST)
Received: from localhost ([::1]:33562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIlYw-0003Wf-KR
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 02:39:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oIlUR-0001os-Ik
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 02:34:51 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:40655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oIlUP-0005Ml-I2
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 02:34:51 -0400
Received: by mail-pl1-x62f.google.com with SMTP id x23so3927405pll.7
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 23:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=mtHSpfW5bj0IJK2iBbX+5ljUtC0lL6ziEDTrY+H5OeM=;
 b=H8snsPqddyodq6+2EYLmKiMSFlXQNRTy5lQfI+Fyvh0vW57kqIXudIblG8MQgtrQlz
 mroyuzhsZyYxvqqJX3f8d3YHSuXYcGTuQe/PNUEDl+USqh/2gbtikFcwthLKi3vWVTT9
 k7SihT3HoK/S5xcOYPKR6xjRmM5AhOsR+TEYvx0VTCPNZo7Bs/apbCxcvMm/4FimVPq4
 TymU4wDw//rwC9Akgb05m2ozyYWlfQ3TUKlOjH1kIIAIxhMz7UgffrG9h5LMdvUlq61O
 LwDy7iJP5vOQFF2Smk9mLlJF3slP1FL9iJdEUZ99lNbjEv9h6kbI1xskYGI3EQvIKIWY
 6i1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=mtHSpfW5bj0IJK2iBbX+5ljUtC0lL6ziEDTrY+H5OeM=;
 b=GMrCmYJsn5TUUiTGSFN+/Jpuu1/CpWinECCLc1e5MgzUtYJXNnncEOWwYZ+Kryx3IQ
 MaaeYlpy4CW7RumaSeQdmfk7CacGOZEWhbMSONUOxP6baF6KN2Ew209xv5lWuOTOZgQv
 WcFnc0Rw2oS0dkFTIJimg5W6H9kNcZa9UzMCAQMdZpFfCgy3PbuQlL1fwqJQTQa1M0iB
 KKk/cQhu4c4p39m3NVjN3YewSD1HMvEJP73aKm9Gr8N0pyiemDpDhZZZDqR+BTpnput0
 IbbVifU0sOQIP0Ff3oKlX2L9wcwcLkBP49xZEffurv8K0cyeSLYaDneSSTISzJGXdmX7
 Lv3w==
X-Gm-Message-State: ACgBeo0nGM7KmoT4DdtctUcsEMywkO442BcTkggiXbwDV6zfon0JDMqp
 jgwDxrr5WtX1k5xCvZfjpvU=
X-Google-Smtp-Source: AA6agR5d6Dp+mmV/SDS1O/C7UUj2/tL0wB8P7DIcmrrtha4o1HZTdr8ENsDxyQhYEQZIgW0cCkKZvA==
X-Received: by 2002:a17:90a:982:b0:1ef:f525:9801 with SMTP id
 2-20020a17090a098200b001eff5259801mr23133071pjo.191.1659422088023; 
 Mon, 01 Aug 2022 23:34:48 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a1709029a0c00b0016c454598b5sm10756201plp.167.2022.08.01.23.34.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 23:34:47 -0700 (PDT)
Message-ID: <769cfc18-9585-5ddf-de46-52aa64328cea@amsat.org>
Date: Tue, 2 Aug 2022 08:34:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.1] hw/mips/malta: turn off x86 specific features of
 PIIX4_PM
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 ani@anisinha.ca, dgilbert@redhat.com, mst@redhat.com
References: <20220728115034.1327988-1-imammedo@redhat.com>
 <CAFEAcA95sRW8u2NFDa1BX7uNg2t85Yr_kPgWWC+5QnJobygwMA@mail.gmail.com>
 <20220728151627.119d57d5@redhat.com>
In-Reply-To: <20220728151627.119d57d5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 28/7/22 15:16, Igor Mammedov wrote:
> On Thu, 28 Jul 2022 13:29:07 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
> 
>> On Thu, 28 Jul 2022 at 12:50, Igor Mammedov <imammedo@redhat.com> wrote:
>>>
>>> QEMU crashes trying to save VMSTATE when only MIPS target are compiled in
>>>    $ qemu-system-mips -monitor stdio
>>>    (qemu) migrate "exec:gzip -c > STATEFILE.gz"
>>>    Segmentation fault (core dumped)
>>>
>>> It happens due to PIIX4_PM trying to parse hotplug vmstate structures
>>> which are valid only for x86 and not for MIPS (as it requires ACPI
>>> tables support which is not existent for ithe later)

We already discussed this Frankenstein PIIX4 problem 2 and 4 years ago:
https://lore.kernel.org/qemu-devel/4d42697e-ba84-e5af-3a17-a2cc52cf0dbc@redhat.com/
https://lore.kernel.org/qemu-devel/20190304210359-mutt-send-email-mst@kernel.org/

>>> Issue was probably exposed by trying to cleanup/compile out unused
>>> ACPI bits from MIPS target (but forgetting about migration bits).
>>>
>>> Disable compiled out features using compat properties as the least
>>> risky way to deal with issue.

So now MIPS is forced to use meaningless compat[] to satisfy X86.

Am I wrong seeing this as a dirty hack creeping in, yet another
technical debt that will hit (me...) back in a close future?

Are we sure there are no better solution (probably more time consuming
and involving refactors) we could do instead?

Thanks,

Phil.

>>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/995
>>
>>> ---
>>> PS:
>>> another approach could be setting defaults to disabled state and
>>> enabling them using compat props on PC machines (which is more
>>> code to deal with => more risky) or continue with PIIX4_PM
>>> refactoring to split x86-shism out (which I'm not really
>>> interested in due to risk of regressions for not much of
>>> benefit)
>>> ---
>>>   hw/mips/malta.c | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
>>> index 7a0ec513b0..0e932988e0 100644
>>> --- a/hw/mips/malta.c
>>> +++ b/hw/mips/malta.c
>>> @@ -1442,6 +1442,14 @@ static const TypeInfo mips_malta_device = {
>>>       .instance_init = mips_malta_instance_init,
>>>   };
>>>
>>> +GlobalProperty malta_compat[] = {
>>> +    { "PIIX4_PM", "memory-hotplug-support", "off" },
>>> +    { "PIIX4_PM", "acpi-pci-hotplug-with-bridge-support", "off" },
>>> +    { "PIIX4_PM", "acpi-root-pci-hotplug", "off" },
>>> +    { "PIIX4_PM", "x-not-migrate-acpi-index", "true" },
>>> +};
>>
>> Is there an easy way to assert in hw/acpi/piix4.c that if
>> CONFIG_ACPI_PCIHP was not set then the board has initialized
>> all these properties to the don't-use-hotplug state ?
>> That would be a guard against similar bugs (though I suppose
>> we probably aren't likely to add new piix4 boards...)
> 
> unfortunately new features still creep in 'pc' machine
> ex: "acpi-root-pci-hotplug"), and I don't see an easy
> way to compile that nor enforce that in the future.
> 
> Far from easy would be split piix4_pm on base/enhanced
> classes so we wouldn't need x86 specific hacks in 'base'
> variant (assuming 'enhanced' could maintain the current
> VMSTATE to keep cross-version migration working).
> 
>>> +const size_t malta_compat_len = G_N_ELEMENTS(malta_compat);
>>> +
>>>   static void mips_malta_machine_init(MachineClass *mc)
>>>   {
>>>       mc->desc = "MIPS Malta Core LV";
>>> @@ -1455,6 +1463,7 @@ static void mips_malta_machine_init(MachineClass *mc)
>>>       mc->default_cpu_type = MIPS_CPU_TYPE_NAME("24Kf");
>>>   #endif
>>>       mc->default_ram_id = "mips_malta.ram";
>>> +    compat_props_add(mc->compat_props, malta_compat, malta_compat_len);
>>>   }
>>>
>>>   DEFINE_MACHINE("malta", mips_malta_machine_init)
>>> --
>>> 2.31.1
>>
>> thanks
>> -- PMM
>>
> 


