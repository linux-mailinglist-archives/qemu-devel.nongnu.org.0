Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6C5391364
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 11:09:28 +0200 (CEST)
Received: from localhost ([::1]:32940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llpXb-00075I-0B
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 05:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llpWn-0006Oq-EZ
 for qemu-devel@nongnu.org; Wed, 26 May 2021 05:08:37 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:41626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llpWl-00063i-Tp
 for qemu-devel@nongnu.org; Wed, 26 May 2021 05:08:37 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so92296wmq.0
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 02:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G67I+AfUdDBdsJSgNoy4bAiEsF2xMVEjdIt1DQhkVxc=;
 b=kvGOyZrtah2MlX0zS9YGEjvPH00X4UHo839g68E/ZZNsFFwWh46qPICAsTkOf3prAG
 EUUfEM0b7Zf+NbZpUR4odzULhrx4YoVgiDbi6gpsSGhRXrvsp6+SAaAng0tIiEyW+bXb
 Iip4sPVSdcVn0flLPMn6JjXd7gyruvvARlAEVf0KljpHnFr/HZPfj19IQfKJErmJGVwt
 pyxi3RuzQuyir4zmoUxMtZgHvGzl663bLjxo15laUsaN8bgkKjMF+/lP7AlbI3+4x4Yi
 2/Jo5QKO1/UQZyAA5TQXYWl9yxjj6mG/kVNx1yoEPhEXdZRycUJ/KAyGzdnZup7nzm6S
 HAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G67I+AfUdDBdsJSgNoy4bAiEsF2xMVEjdIt1DQhkVxc=;
 b=P6ZUi+jkucfbnJ92cJUvbT8TBU/N6WEzFePjuWtUjPZeK5Hfjoq42TjPIZJARicssS
 kSqG81dH0iqCvsa8l9FYcZ0g29OFBcx4u8BsjzU/E+3Vq2pLko6jHxNuXiANP8sTgZpi
 LF4YFJLUJcHfz0ge+0QuesaJuVnbkcC9QnEqh03Uq5GQ74glHXj9znYWz+KsvFIBHYeE
 6cSw0dfGKyVMXlfz21uReCPAelLaOoGpRloqS6KPU60XBiVm3PNw84MGqc1FqUhIquRo
 A0+II9vQRE2XqZhoNC4Ry3p2Ny1qbdhR0WR8PQyroXEl7hu6ssGVsbMzMB5qXDSrmwbr
 5tKA==
X-Gm-Message-State: AOAM531FMHui8D6gYz8pJjdY/YIg37aB3ceUBZxke1noVdvSc8IqADZW
 1ZqIwO423suwu+CA/YdxJ8I=
X-Google-Smtp-Source: ABdhPJyn2I1dJm3YlvCMNi0upXgXUgPVHSYV1b5CPN05ph7iaYIr1hp9Nzr2dq59so4w3D3+Byf2Og==
X-Received: by 2002:a7b:cc19:: with SMTP id f25mr28017612wmh.153.1622020114181; 
 Wed, 26 May 2021 02:08:34 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id s7sm5601632wmh.35.2021.05.26.02.08.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 02:08:33 -0700 (PDT)
Subject: Re: [PULL 1/3] hw/net/imx_fec: return 0xffff when accessing
 non-existing PHY
To: Jason Wang <jasowang@redhat.com>, peter.maydell@linaro.org
References: <1622017492-7770-1-git-send-email-jasowang@redhat.com>
 <1622017492-7770-2-git-send-email-jasowang@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7a56c641-4c32-44a1-2a28-37c9b4846f42@amsat.org>
Date: Wed, 26 May 2021 11:08:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1622017492-7770-2-git-send-email-jasowang@redhat.com>
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
Cc: qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/26/21 10:24 AM, Jason Wang wrote:
> From: Guenter Roeck <linux@roeck-us.net>
> 
> If a PHY does not exist, attempts to read from it should return 0xffff.
> Otherwise the Linux kernel will believe that a PHY is there and select
> the non-existing PHY. This in turn will result in network errors later
> on since the real PHY is not selected or configured.
> 
> Since reading from or writing to a non-existing PHY is not an emulation
> error, replace guest error messages with traces.
> 
> Fixes: 461c51ad4275 ("Add a phy-num property to the i.MX FEC emulator")
> Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Tested-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud茅 <f4bug@amsat.org>

Mojibake :/

> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/net/imx_fec.c    | 8 +++-----
>  hw/net/trace-events | 2 ++
>  2 files changed, 5 insertions(+), 5 deletions(-)

