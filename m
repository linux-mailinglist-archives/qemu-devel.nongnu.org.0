Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB1B68AF67
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 11:56:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOch7-0008A1-6L; Sun, 05 Feb 2023 05:56:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOch4-00089r-En
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 05:56:22 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOch2-0004lV-On
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 05:56:22 -0500
Received: by mail-ej1-x634.google.com with SMTP id ml19so26929914ejb.0
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 02:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vsoWybfSyyor0ymm88Vn/AnHZ58KzGYNy65ck/j4AZg=;
 b=IT9cSH/HDgRbuCHXA3SRdiJ5AWJAR9JDjYARVwEfiMz9o6poZqw29QgZw1bdlW2CpO
 JbgdIfD++v+OpuGAX58Mhb4qwBZVM7/lcRnekF2axZtbCY7ki1CpxMzxq0SrJoqb2OoJ
 SpxBTpgXLd2uGZCA3y+vZh2U3kqIVC3G4rRfByxyTQiC4g4PHofsCmPkliU/kwK2P+b9
 ltVMXnod4WXqO0OWUgEFFeuoAQCG1r8BSJMi3oH4a8YQ0LWAW+wssVTcVTpT/00rP0YB
 BugXHOWaUrMhZgn2tvgskR4Bf8Z6YNtML176biNI2z4sPPGjxqnYEG4qf/QSRka2I9Wz
 0DFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vsoWybfSyyor0ymm88Vn/AnHZ58KzGYNy65ck/j4AZg=;
 b=rGLs743nqTzrqpSp7df4m/9lyKEIC8F/05I701fta1U+3+qnJFP+IVOIgfD0eyK1KB
 fCitSMhkISVAprDSnrCixILOmJOqO+xnqi7o2HvIz+6kxPLBegkD1Dp5IBfNSM0Bbtih
 P/fczEEtA5pqPVYG7LAInNe30eq5rcjcKV6h6urOgjiF1ZbZ7+NhlQyt9tTVI3eOKxdL
 +aVIBFV/um7MCpOU2Tcc5AXQiCOhHR5XkRyDGzoz/xIJtc1x9jzDKyqtZbrh8zYEr6J+
 631wWHHfren+Sxk+5Wj4FstDqpsCCC3jXsm5VdmU91BUrNrNBMB58ETlQpbPbsf/cWC8
 DjOg==
X-Gm-Message-State: AO0yUKWaOC6Kxsqu1QZ3SxDKCXAWfUOrnW3jyL8aj2lDdz1Ns/oOx/Pg
 U1D9zAVcROQ9MJAZo39cSeh+Ig==
X-Google-Smtp-Source: AK7set/BHvaC5pEDQKBIEJAEoSSbeZXr+m7OApXLL9v7gMRpFM1vt7wXL6eRjTig6VcrzPUYUQv/6A==
X-Received: by 2002:a17:906:53d5:b0:88c:8c2e:af17 with SMTP id
 p21-20020a17090653d500b0088c8c2eaf17mr14830028ejo.2.1675594578203; 
 Sun, 05 Feb 2023 02:56:18 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g21-20020a1709061e1500b0087bd629e9e4sm4043305ejj.179.2023.02.05.02.56.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 02:56:17 -0800 (PST)
Message-ID: <1dc32ad1-e52b-f1cd-c176-5844cdba6815@linaro.org>
Date: Sun, 5 Feb 2023 11:56:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 4/4] pcie: add trace-point for power indicator transitions
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com
References: <20230204174758.234951-1-vsementsov@yandex-team.ru>
 <20230204174758.234951-6-vsementsov@yandex-team.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230204174758.234951-6-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 4/2/23 18:47, Vladimir Sementsov-Ogievskiy wrote:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>   hw/pci/pcie.c       | 20 ++++++++++++++++++++
>   hw/pci/trace-events |  3 +++
>   2 files changed, 23 insertions(+)

> +static const char *pcie_sltctl_pic_str(uint16_t sltctl)
> +{
> +    switch (sltctl & PCI_EXP_SLTCTL_PIC) {
> +    case PCI_EXP_SLTCTL_PWR_IND_ON:
> +        return "on";
> +    case PCI_EXP_SLTCTL_PWR_IND_BLINK:
> +        return "blink";
> +    case PCI_EXP_SLTCTL_PWR_IND_OFF:
> +        return "off";
> +    default:
> +        return "?";

Maybe "illegal"?

Otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +    }
> +}


