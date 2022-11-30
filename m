Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC0D63D33C
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 11:23:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0KFH-0003h7-DV; Wed, 30 Nov 2022 05:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KFD-0003fm-W1
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:23:12 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KFB-0001PL-7o
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:23:11 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 o7-20020a05600c510700b003cffc0b3374so1046010wms.0
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 02:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JnJrOB+c2NQ0YB3wNFefCa8R3R+dx7TEY263HJKcXCE=;
 b=YAieyMeElgIJYA0LndIUDVfWgGJAJ1xaLCdOmSnepj3enCu/ZZOoxzJFNA6XFMXEw9
 4j+iOYmhvrcvjcBFqFzwFu8vuBf0xuJNFiQQQfukQJsX3AvEsHQ75k4+U1ld4Wpr1Q69
 bySaZbSbz0Q4qYYyyxUfwdF4NGxZJ+If91x03lzUhdP7XzsShzFiIRiOXCUODo384x3Z
 RNyOZiIccFsZbDwAPaGoWT9MawSQr4lGbUl1MRc36TalVsqmLhYROJ7k49yvVOCB9sNo
 weXhSR5nk1WrvDO7vLtEQkQGLLdv3DkAeUFq9o9u1DmZzsFCi1dSACSBm593mewrHkrA
 WKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JnJrOB+c2NQ0YB3wNFefCa8R3R+dx7TEY263HJKcXCE=;
 b=ubZXr+uHEKApTHHvAAmDtO5COeaNgRgXZBz//leFoO+nlBohvXjy8Y83svuP+N1/u0
 g8PQcupJhn+jj+mG5U7CPGkoqq0ropPW8pA2Hkn3uKiDYZEIqdgIF1rLoaY7rtGkK1kB
 GNyTmZHPYCIj0NjMcd/Fp2DWse2y7KVZwh/FJfwWZbsQxg1ltu3GtzWZ+LOJDKPxerGt
 t2eOh4TJVeWGTpYxwXNatB9NwtEM5zYY2VdZlY+ZVivo8ApuC+CseFcwucZfGmoyLIDu
 JGfRYWL1ioOI1AvU70NlpQ7F/T27TV8ZiwjtZhxO9YSquAndGECAwyptwZRIIHuqGz9a
 DiHw==
X-Gm-Message-State: ANoB5pklSUAENpviqDFdqlij+/i3g0qYvfwrgiRwjMEyoq6HwV9VJOPn
 D8koGlfO1UMARzmKQfSHmnM5IA==
X-Google-Smtp-Source: AA0mqf5/D6JUsK3NJugCbdG9PcdPqHU4VFo9NMpJ2XSHdAD//TFIbFH2sBwYVCZPGiJaEQqzOkqXhA==
X-Received: by 2002:a05:600c:3587:b0:3cf:a9c2:2b04 with SMTP id
 p7-20020a05600c358700b003cfa9c22b04mr44055867wmq.152.1669803786611; 
 Wed, 30 Nov 2022 02:23:06 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f6-20020a0560001b0600b002415dd45320sm1094791wrz.112.2022.11.30.02.23.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:23:06 -0800 (PST)
Message-ID: <3afda88a-bc5c-fb6f-941a-f4bf724ac0a1@linaro.org>
Date: Wed, 30 Nov 2022 11:23:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 7/7] hw/pci-host/pnv_phb3_msi: Convert
 TYPE_PHB3_MSI to 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Greg Kurz
 <groug@kaod.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-ppc@nongnu.org
References: <20221125115240.3005559-1-peter.maydell@linaro.org>
 <20221125115240.3005559-8-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221125115240.3005559-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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

On 25/11/22 12:52, Peter Maydell wrote:
> Convert the TYPE_PHB3_MSI class to 3-phase reset, so we can
> avoid using the device_class_set_parent_reset() function.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/ppc/xics.h      |  2 +-
>   hw/pci-host/pnv_phb3_msi.c | 15 +++++++++------
>   2 files changed, 10 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


