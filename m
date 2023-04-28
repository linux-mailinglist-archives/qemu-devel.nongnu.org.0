Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 011DB6F2489
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 14:16:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psjTV-0002nw-AP; Sat, 29 Apr 2023 08:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psjTT-0002nZ-C9
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:14:47 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psjTR-0004Bu-IG
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:14:46 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3010889c6ebso406454f8f.2
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 05:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682770484; x=1685362484;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iGBJJtjAm8Kv2/FPIdfdRI1Xi3UjJZY7LJrhjHKTIU8=;
 b=CVhRk7+qHr+sqMq5Ag1XklRPAsezrcu4ATWjkpzckV/vy3afCDTK2qHm1t+u5AeiAr
 E/M5FnpFB21rdeCt0j57Ixt406TZJIZYnHA9iMVYp7vzn7Ewnmc/cDxDQUbd6lhe9WVn
 acblWzngJqgPv5Lpbbdg1cGv0lq5MlK8fPv+uqv4fV5TGFsvfZ5Ijq1HPb8IVpmk3wvB
 lfvg8nOzkzRaTtgL2D1Gx0lKf/ib6R9mJlrQtIOgxVQiOzVxe3062yXTFiYccZqNxlaX
 qhnmCA9XJl9Z2396o5Zz/MzPp5+PpcuALnvITQVzNUNACBamfbF8y2qiLdnR2ZHUKbXV
 g+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682770484; x=1685362484;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iGBJJtjAm8Kv2/FPIdfdRI1Xi3UjJZY7LJrhjHKTIU8=;
 b=BY/+prGwS+8qfxlfH+CAXc+/UpZ0/t+HQzabQbtmT7rcDLlVIHKvUdog/usTc6sAV/
 pdfOpqWd493UXLzkhAU6VuRnR8KwLQN+Jeb0lXeiLpo4BryhRarXnjo2NzsR99wgHpxx
 AKamHh3x5ziHNSmbod+6oWTFmMbNwwl7YwNxB85kM/RaXG6/+rXgGj7hyQ1TYG24+Lzo
 OmOUbNz+QvF+Fn3G1rXPxtEUc/GbhxrMlnr/lRTSC4uOE5bj26jwATFw1vP7ldI4ALXW
 JiwfFKQ5cGK4ConIy3ol2js3KHUp8M/NB43yGCX/BtqN/SCJsETTSl12AD9zYqlZLpwc
 106g==
X-Gm-Message-State: AC+VfDyoJL22sxacS5iXqydz5G1B/GLm9XlGymmQBxToOMlSEW5AKbv2
 Pl5sJFOkpIbu8XUKSZdmKHZhXw==
X-Google-Smtp-Source: ACHHUZ5ggtIZCA78pawI7bAZcRj/wwUgqzsJQgx9shLRDzpjvyicdg8SZ+zQn2oTh4he4zrdBx778A==
X-Received: by 2002:adf:f285:0:b0:2f4:6270:48d3 with SMTP id
 k5-20020adff285000000b002f4627048d3mr5664107wro.0.1682770483821; 
 Sat, 29 Apr 2023 05:14:43 -0700 (PDT)
Received: from [192.168.212.175] (7.red-88-29-166.dynamicip.rima-tde.net.
 [88.29.166.7]) by smtp.gmail.com with ESMTPSA id
 i3-20020adff303000000b002f4cf72fce6sm23542073wro.46.2023.04.29.05.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Apr 2023 05:14:43 -0700 (PDT)
Message-ID: <ddfb4c85-d7c4-368d-f482-d8cc8f4cbc6a@linaro.org>
Date: Fri, 28 Apr 2023 23:17:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 1/9] hw/ide/ahci: remove stray backslash
Content-Language: en-US
To: Niklas Cassel <nks@flawful.org>, John Snow <jsnow@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <niklas.cassel@wdc.com>
References: <20230428132124.670840-1-nks@flawful.org>
 <20230428132124.670840-2-nks@flawful.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230428132124.670840-2-nks@flawful.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 28/4/23 15:21, Niklas Cassel wrote:
> From: Niklas Cassel <niklas.cassel@wdc.com>
> 
> This backslash obviously does not belong here, so remove it.
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> ---
>   hw/ide/ahci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


