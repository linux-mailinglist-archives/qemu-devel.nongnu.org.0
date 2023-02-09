Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90042691299
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 22:24:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQENo-0007V2-Dr; Thu, 09 Feb 2023 16:23:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQENm-0007Ur-V4
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 16:23:06 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQENl-0008AS-Cv
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 16:23:06 -0500
Received: by mail-wr1-x435.google.com with SMTP id bk16so3179365wrb.11
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 13:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XZT/lG77zf6AkJw9DtNQv5h6kpuZnQ46SqrWg9MmYPc=;
 b=enTAhbic1K3Y0h39Pmlrb3gFxVKcgYifKjC7mM7SC+y56ekxalq3xmC5pQoEPyNHb3
 rbSU7pAiWwXXQOzuVWWkUFreydcgLgukC1vFZvA5lOZ1Qwm9NY9fUM5BFv2R7e34YPlT
 zASjX2qzv/74/fbrUcvlupYq4O9tAwty26yYZ3n89ZJATS6/9ThMuTF5NQ2oZ+joailn
 2PB4fdXbeeSQuRZekt0SI4cOagY5/LrBGx6P8X2avVUW6dhXdzX6kX7NysXEwy7ZtPJ8
 2NEVdSKp7fP3oLiba410+TKuZtzlazw+Hvxp5HIlfFWiqHju1xyh/JUUgq5xMfTUt2kk
 NdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XZT/lG77zf6AkJw9DtNQv5h6kpuZnQ46SqrWg9MmYPc=;
 b=zXK0gcnk3hANe3He95JoubxoQ9u612bPyI22+CrKSK+VNeRoWOLTKhUNZQsUTFjNWA
 EjwVoWIFzwErpWd1FmPcewZbMVLud/qjSQs9si9RlRHOqIz+WKICGP1DKb8vhh61usN9
 lW6VJM35nUQUJkO6HAsG8fcOgyi+sqL2fuW4zs9manGmQv4UKo1+TyNzn8auw8JaXnG0
 dNTLL3Y/gFU/0m2LPeI+ZnOE9ErAjvxzxI+VNgk28r0PmBIQY1jZlOT770z6WBZ6Ug2I
 DdJVfbtxhQ4Ls47gwlsFv/nbgRXODmT58vGGF6TFSo5BIQWU/9WY4VXabKH5pV8yh/V3
 /pnw==
X-Gm-Message-State: AO0yUKXlWM6kfwl8E6sV4Rc2v9sBfWYMzmZgkTfAkG3MzTGrIYS4UhAg
 pT2zFQVFhMfYrEKPwWoSR4yfuA==
X-Google-Smtp-Source: AK7set84ADyL5lVL18aWFRFoiZHuAcverq3jWDk75HGhSHLkvqpnbSeJhfpEqCfrIodTZ7MC/r4aKQ==
X-Received: by 2002:a5d:4149:0:b0:2bf:dd84:adf6 with SMTP id
 c9-20020a5d4149000000b002bfdd84adf6mr11338895wrq.60.1675977783608; 
 Thu, 09 Feb 2023 13:23:03 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a5d540c000000b002bff1de8d4bsm2076544wrv.49.2023.02.09.13.23.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 13:23:02 -0800 (PST)
Message-ID: <00d3fa26-5bec-a3ad-f4e9-b6ccf8933d79@linaro.org>
Date: Thu, 9 Feb 2023 22:23:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v3 10/15] pcie: introduce pcie_sltctl_powered_off() helper
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, den-plotnikov@yandex-team.ru
References: <20230209200808.869275-1-vsementsov@yandex-team.ru>
 <20230209200808.869275-11-vsementsov@yandex-team.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230209200808.869275-11-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 9/2/23 21:08, Vladimir Sementsov-Ogievskiy wrote:
> In pcie_cap_slot_write_config() we check for PCI_EXP_SLTCTL_PWR_OFF in
> a bad form. We should distinguish PCI_EXP_SLTCTL_PWR which is a "mask"
> and PCI_EXP_SLTCTL_PWR_OFF which is value for that mask.
> 
> Better code is in pcie_cap_slot_unplug_request_cb() and in
> pcie_cap_update_power(). Let's use same pattern everywhere. To simplify
> things add also a helper.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>   hw/pci/pcie.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)


> +static bool pcie_sltctl_powered_off(uint16_t sltctl)
> +{
> +    return (sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_OFF &&
> +        (sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_OFF;

Matter of taste (it is harder to miss the &&):

    return (sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_OFF
            && (sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_OFF;


> @@ -770,10 +775,9 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
>        * this is a work around for guests that overwrite
>        * control of powered off slots before powering them on.
>        */
> -    if ((sltsta & PCI_EXP_SLTSTA_PDS) && (val & PCI_EXP_SLTCTL_PCC) &&
> -        (val & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_OFF &&
> -        (!(old_slt_ctl & PCI_EXP_SLTCTL_PCC) ||
> -        (old_slt_ctl & PCI_EXP_SLTCTL_PIC) != PCI_EXP_SLTCTL_PWR_IND_OFF)) {
> +    if ((sltsta & PCI_EXP_SLTSTA_PDS) && pcie_sltctl_powered_off(val) &&
> +        !pcie_sltctl_powered_off(old_slt_ctl))

Certainly simpler!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


