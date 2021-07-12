Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B4D3C4675
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 12:21:57 +0200 (CEST)
Received: from localhost ([::1]:50002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2t4W-000150-Ir
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 06:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2t3L-0000AY-Ca
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 06:20:43 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2t3J-0004rd-GQ
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 06:20:43 -0400
Received: by mail-wr1-x42e.google.com with SMTP id v5so24867374wrt.3
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 03:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BIrGsf64xh/em8bVbev3arFNkwnc1GL2/l222EhYMfk=;
 b=I9X+tF6wex7r0siOkbqCKh3RwasiveIlDuME/3+hKLrdLaokGlNbD1C2xNJ184TciK
 +xDzH8YpZKgSjqgY+S1YnMqTS1r0rPylGie0lE5nJ5RUqZn+1NXaDAcikv+Z/Wyql9Jn
 5RFOZuKNV9yJbq6zr/a4jrpE/2RB1Np/Og/TX4th+pEmWPb7BDNrL2Wfg9Hgt+F5Fier
 3xDYeL75/o9A21rKGR1ao5+b8sKl8eO2uIsNfsvaP935sQ8UzSFavSSV+irKMq4tjweg
 3ywhiYlqamdwKnOsgoXC7u4JViLLLLjL8iGvSwkPi3LKktwMZgq5REWeVNoHqHZsRBJW
 elSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BIrGsf64xh/em8bVbev3arFNkwnc1GL2/l222EhYMfk=;
 b=CQlaveaB/aCuDLz+COIjLb0VRGIENavlBpkl87YS4WA3MPRbtXEHonuWpVZIo6A7Lg
 6jh+Zlhywhc9w4YtdZM/U6hymIRTcofl4HUeXj8Dqkp3nu+hQ/0KIhsyPglpfFz53Bbt
 Nxwy+K+bvG/EM8h+UmPtx183lKOsC0y4GjLwzFajbD6veOpLOazShFulnwa2Vqj3YglM
 y1P4jI3+DL6Lj/vd/13s6LmQQYJac3YSsptmRai7xDlsQRMxjtsSDV1mebOI7dX5BO96
 euUqMUlRpnddYLuPUDPsi6EUaf0GDQ3YCcGH8BwBTuAKMMfdbXwhjD/1fpt553yVQxeK
 c+9A==
X-Gm-Message-State: AOAM532wwDWJQFaTuH/OWcRq2U76fZJazO9J+lMNxCmf3zIkL8WRbv2a
 FXxzpoLBTujBOC+OfbwDr+Q=
X-Google-Smtp-Source: ABdhPJyCTbOSNiS8tRBU25eM/ffVq6ciyarRN+TdModgDnh61rcaAup3kXO6TjLLEqZxwSKelNnkpQ==
X-Received: by 2002:a05:6000:1544:: with SMTP id
 4mr21140314wry.288.1626085239038; 
 Mon, 12 Jul 2021 03:20:39 -0700 (PDT)
Received: from [192.168.1.24] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id h10sm14408632wmb.46.2021.07.12.03.20.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 03:20:38 -0700 (PDT)
Subject: Re: [PULL 4/4] hw/sd: sdhci: Enable 64-bit system bus capability in
 the default SD/MMC host controller
To: qemu-devel@nongnu.org, Andrey Smirnov <andrew.smirnov@gmail.com>
References: <20210711211057.2714586-1-f4bug@amsat.org>
 <20210711211057.2714586-5-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8f15fdea-0373-97f6-138e-368998b7f0e1@amsat.org>
Date: Mon, 12 Jul 2021 12:20:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210711211057.2714586-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.631,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, Alexander Bulekov <alxndr@bu.edu>,
 Joanne Koong <joannekoong@gmail.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/11/21 11:10 PM, Philippe Mathieu-Daudé wrote:
> From: Joanne Koong <joannekoong@gmail.com>
> 
> The default SD/MMC host controller uses SD spec v2.00. 64-bit system bus capability
> was added in v2.
> 
> In this change, we arrive at 0x157834b4 by computing (0x057834b4 | (1ul << 28))
> where 28 represents the BUS64BIT SDHC_CAPAB field.
> 
> Signed-off-by: Joanne Koong <joannekoong@gmail.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Message-Id: <20210623185921.24113-1-joannekoong@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/sd/sdhci-internal.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
> index e8c753d6d1e..a76fc704e5e 100644
> --- a/hw/sd/sdhci-internal.h
> +++ b/hw/sd/sdhci-internal.h
> @@ -316,16 +316,16 @@ extern const VMStateDescription sdhci_vmstate;
>   * - 3.3v and 1.8v voltages
>   * - SDMA/ADMA1/ADMA2
>   * - high-speed
> + * - 64-bit system bus
>   * max host controller R/W buffers size: 512B
>   * max clock frequency for SDclock: 52 MHz
>   * timeout clock frequency: 52 MHz
>   *
>   * does not support:
>   * - 3.0v voltage
> - * - 64-bit system bus
>   * - suspend/resume
>   */
> -#define SDHC_CAPAB_REG_DEFAULT 0x057834b4
> +#define SDHC_CAPAB_REG_DEFAULT 0x157834b4
>  
>  #define DEFINE_SDHCI_COMMON_PROPERTIES(_state) \
>      DEFINE_PROP_UINT8("sd-spec-version", _state, sd_spec_version, 2), \
> 

Unfortunately this breaks the TYPE_IMX_USDHC model for which
I don't have the datasheet, so I don't know how to fix it.

I suppose it is simpler to remove the COMMON_PROPERTIES macro
to avoid such problems.

