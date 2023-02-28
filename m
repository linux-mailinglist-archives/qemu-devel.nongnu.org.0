Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 966996A6285
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 23:34:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX8XP-0005PF-Tj; Tue, 28 Feb 2023 17:33:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX8XO-0005P6-BC
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 17:33:34 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX8XM-0003X4-PP
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 17:33:34 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 m14-20020a7bce0e000000b003e00c739ce4so6786160wmc.5
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 14:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677623611;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uUH71D8M5TLzog18h+dMc+e3fI8cCj0o13eROXtPVZI=;
 b=BxXWv+WiuDEoF+/5qAmeHF/EhWMt+/8LhVIwHL18BGlsAfYu7Ai6BX1ZkXih21PqA7
 ECLmarXho6aG9Ejeegxi3qkD/sshDMvC97cxsz0X1xpzJ7KLMHbl8GsTItPLEY/FIge6
 rBFuetQAP/+sjKunNgJdzBdCtCU3Htb9AqLVqHFhzqh8xCXSs993fND/kLeNecPtQ2At
 ms77QtPN6LBr00na5QVfydUVuiFU+5lLTwc3WSLUokVm6Ki62GjyNRMIcuYNvouzd4X7
 739U5HyWT96bEFa/4K0LjUh5+CmP3ACENW3CKBY+eAg1U3zZZRZHRmASzLkaZxKuw3PN
 OyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677623611;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uUH71D8M5TLzog18h+dMc+e3fI8cCj0o13eROXtPVZI=;
 b=dTzASYd6gnYE6jZPWQHl1vyMjeZb9WEI4MXZvuBKb4J/2Fa3cVQfgQuQrY6YOHBiTo
 ch4227uDR5K5mPMfPU7/00t0AnGIcfqYWkNzuHTQH7EFPL8T9MPSmy9M0WddfO55Wui+
 KTHKEg4bKxTYu0YvASFiyX985qX6+s+zGO8zoNEk2zbBnq6y+W5/0EjWoLLCrRpI5aIu
 pYtbltbXJ0P6b+Dqj2O8UilLmRsxwo7VbfLk0JmE8/6zfi/wWDtGEzRNIS6xfcD69Zoy
 quH76Ki51mZaheJiv/7OtWZHHsX/mLZcbhaP4GSyvkNCMBC61yq95H4VQxQ5woIfinE9
 vb2Q==
X-Gm-Message-State: AO0yUKXM/4CbTxkNoeBq1oQpvazTIWgvrxz2pQgh+2cvR0DluG8pFV4P
 jDPc2SisjJHzjRPrIqPKtOoKvg==
X-Google-Smtp-Source: AK7set9uGF1G7NqoHwtfLo0GF+DdsSsKK9xE0AS8E57LjlanO9zZ9Oq7bcplpzLaNpJ/C7OLQFUHYQ==
X-Received: by 2002:a05:600c:4aa7:b0:3ea:f6c4:5f25 with SMTP id
 b39-20020a05600c4aa700b003eaf6c45f25mr3308972wmp.36.1677623611226; 
 Tue, 28 Feb 2023 14:33:31 -0800 (PST)
Received: from [192.168.68.175] (166.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.166]) by smtp.gmail.com with ESMTPSA id
 v22-20020a1cf716000000b003e1fee8baacsm17648395wmh.25.2023.02.28.14.33.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 14:33:30 -0800 (PST)
Message-ID: <f4adf0fe-1af7-a841-ddd6-38d786f96c61@linaro.org>
Date: Tue, 28 Feb 2023 23:33:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 3/4] hw/isa/piix: Unify QOM type name of PIIX ISA function
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20230210165754.34342-1-philmd@linaro.org>
 <20230210165754.34342-4-philmd@linaro.org>
 <30EE17DE-67F6-4D3C-BA82-EA3A1D256E95@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <30EE17DE-67F6-4D3C-BA82-EA3A1D256E95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 28/2/23 22:55, Bernhard Beschow wrote:
> 
> 
> Am 10. Februar 2023 16:57:53 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>> Mechanical change doing:
>>
>>   $ sed -i -e 's/PIIX4_PCI_DEVICE/PIIX4_ISA/g' $(git grep -l PIIX4_PCI_DEVICE)
>>   $ sed -i -e 's/PIIX3_XEN_DEVICE/PIIX3_ISA_XEN/g' $(git grep -l PIIX3_XEN_DEVICE)
>>   $ sed -i -e 's/PIIX3_DEVICE/PIIX3_ISA/g' $(git grep -l PIIX3_DEVICE)
>>   $ sed -i -e 's/PIIX3_PCI_DEVICE/PIIX_ISA/g' $(git grep -l PIIX3_PCI_DEVICE)
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> hw/i386/pc_piix.c             |  5 ++---
>> hw/isa/piix3.c                | 20 ++++++++++----------
>> hw/isa/piix4.c                | 10 +++++-----
>> hw/mips/malta.c               |  2 +-
>> include/hw/southbridge/piix.h | 10 +++++-----
>> 5 files changed, 23 insertions(+), 24 deletions(-)


>> -OBJECT_DECLARE_SIMPLE_TYPE(PIIX4State, PIIX4_PCI_DEVICE)
>> +OBJECT_DECLARE_SIMPLE_TYPE(PIIX4State, PIIX4_ISA)
>>
>> static void piix4_set_irq(void *opaque, int irq_num, int level)
>> {
>> @@ -81,7 +81,7 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
>>
>> static void piix4_isa_reset(DeviceState *dev)
>> {
>> -    PIIX4State *d = PIIX4_PCI_DEVICE(dev);
>> +    PIIX4State *d = PIIX4_ISA(dev);
> 
> PIIX4State holds the state of the whole south bridge and not just the ISA function. I therefore tend to find PIIX4_ISA() slightly misleading...

Not in the respin of your work: PIIX_ISA is simply the PCI-ISA bridge 
function #0, part of a new QOM PIIX chipset. One rationale is the
address spaces are not part of the ISA function, but intrinsic part
of the while chipset, shared between some PCI functions. Another is
some functions don't depend on the ISA bridge to be usable.

