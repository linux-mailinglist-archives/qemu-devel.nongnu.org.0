Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA8230896F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 15:03:00 +0100 (CET)
Received: from localhost ([::1]:46790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5UMU-0000nP-QE
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 09:02:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5UKE-0008J0-Ky; Fri, 29 Jan 2021 09:00:39 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5UK8-00074b-7P; Fri, 29 Jan 2021 09:00:38 -0500
Received: by mail-wr1-x433.google.com with SMTP id m13so8930311wro.12;
 Fri, 29 Jan 2021 06:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FsYRMw7HnPkgsBv9hTLxfyNAV9cuANyRlDNn45uUqXA=;
 b=fHTJYtLygz88onu++lPFn68/a7K4vMa8o9DJFPLl8x6ke2UcjiX9YspAF+mlxilmWN
 wEfyUuvicQ8ByGkK6eifKpmeV9iMuj67NoUqla5mBIv0I579J417t3FFKJXVuqp1PMyg
 o8nd0YJFDOuV/3x0YHvhrMj2TBi4+FfT53gaF/bVG1L14MXlaJCiE5JKjQrujz/1NGUI
 iPSLIuM99gKDs4nMdSR51J1edIz+zPDR2zkX9uBcviCWQjz23DOXgVIcRaeumlbvN0v2
 Fpkrf1a1C0jBraC4Tk25V+DKUHWWfBV/kIc9xLMjnRldCY57PGkWxXgL1pOHFgnNqTZv
 UZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FsYRMw7HnPkgsBv9hTLxfyNAV9cuANyRlDNn45uUqXA=;
 b=a9T+TPzcqERecwzHdfvj/BZq0gSQhDOlUSTytXK5svF4TzBkUxzHa2Ztkkk+kw9b9N
 ooHOyAMmU0hsNTqnp2uzpq0jhPQT7MfV5ySRPwc7F4UB0qvKjeD675X+dnMVm0tHkVzm
 +5zSj0YQMg6tDk8o/w7LzpjHJYS2KVLTFmJznNkKJwiiJwcjJXSAglAdmY+03VpsRi3j
 1XZT9trfGHS+AKtjvY6NETN69iJY08MfEPDfXLWg/uZWDw30sWbVwIa/UpICYRPL8U4S
 BWywuj4Gmv4t0iXR39shBvvffHuqhjjEi0/s9JSroVg2Qqh+n20x2PphZXiPapZEdj+L
 Cu4Q==
X-Gm-Message-State: AOAM532O5lv2QflbGizKPwXM5FRPphiZdfDJpq+QouvjgoSX3nzeEMDx
 ai7HtAPrvi0Bwg21u60oJpA=
X-Google-Smtp-Source: ABdhPJx73Hl432qYVhWSHOUeINI/H2qV916/MQzJIw8n42P2Z0wAggGpn1MzSxxXTWOJXGygl4HvjQ==
X-Received: by 2002:a5d:4c84:: with SMTP id z4mr4525140wrs.289.1611928830596; 
 Fri, 29 Jan 2021 06:00:30 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id p17sm10251524wmg.46.2021.01.29.06.00.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 06:00:29 -0800 (PST)
Subject: Re: [PATCH v9 04/10] hw/ssi: imx_spi: Rework imx_spi_reset() to keep
 CONREG register value
To: Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210129132323.30946-1-bmeng.cn@gmail.com>
 <20210129132323.30946-5-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <26c7af92-ae7f-a522-b27c-854575a5b078@amsat.org>
Date: Fri, 29 Jan 2021 15:00:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210129132323.30946-5-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/21 2:23 PM, Bin Meng wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> When the block is disabled, all registers are reset with the
> exception of the ECSPI_CONREG. It is initialized to zero
> when the instance is created.
> 
> Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
>      chapter 21.7.3: Control Register (ECSPIx_CONREG)
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> [bmeng: add a 'common_reset' function that does most of reset operation]
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v9:
> - Add a 'common_reset' function that does most of reset operation,
>   leaving ECSPI_CONREG clear in imx_spi_reset().
> 
> Changes in v7:
> - remove the RFC tag
> 
> Changes in v6:
> - new patch: [RFC] rework imx_spi_reset() to keep CONREG register value
> 
>  hw/ssi/imx_spi.c | 32 ++++++++++++++++++++++++--------
>  1 file changed, 24 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

