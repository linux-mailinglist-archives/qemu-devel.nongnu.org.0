Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2B7640450
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 11:16:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p135b-00062k-JC; Fri, 02 Dec 2022 05:16:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p135Y-00061Z-KF
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:16:12 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p135U-0008OZ-PV
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:16:11 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 f13-20020a1cc90d000000b003d08c4cf679so43954wmb.5
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 02:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0+52GnqNOawWol0oZigZLebXP5D8xkpft1tnlHMQ+ZE=;
 b=qocTwF5pRr6NLu91IRgFgOiXN7Xrelj9PYh7w6nP7Y7O8zYxtbI1zgmDFnB/sLRxxq
 9GtgqbNrJgRK22N+N35GjMW4+tZfwyus8IU/C1zR60D1mhUdCtzfg/PZ6o8+QaIGr1jH
 kaOAoiN62qkHXA4bp7sIBGw/HRfw2z3UVPm05n36HXeJVHjCUocLsFjaFRJYCks4Hphq
 +rnJTpy8X5vgvTGPdv64rQgEOMZdG+bHR0c0YykA/pHemo//KtCOJ+8/6X2S4LYpfUVH
 DiJauJuAciYnjlW0Vvk0AjRL/W/1ZbQXNGr5UhbWJjPRgPVl1qG+sG0joZ0G3+/D7qAF
 OFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0+52GnqNOawWol0oZigZLebXP5D8xkpft1tnlHMQ+ZE=;
 b=fZIrdi2GZOG7yAOg+kJaMAx4rVcEqPlySZ3p1aLH1hNtITAO2HwDK9kASAG4yjB/Pz
 tdGMF7N8fiQ1m2DYFiP8nED3hoFSxC+Hx5+9m695F7gIFjUtHMeK55FgDD4Ctmuou6Ez
 pAPtpNISHKjCq6FZxAGk/qsx+K6AJuKLXlJwYxZE2mhV9P4cGsJ5BpXatgRT6pbW/he3
 HYlwwHSNWgdtTX0BrquxmeE/bAH3CeLdxGKDqCMStqfpiKKyhnOGe5SI9e/02UVLTZiB
 lc/kcL5kIQ3rNJ7y9G5XVwjkLLzckTTvh5aeh6yE85awhMW0PkWiuDI9BZ+G3N/CZa9r
 dYYA==
X-Gm-Message-State: ANoB5plo7mLLD5t9obgB7fPfQ6fpsbBU9l6h1b8AUE6nBoZ9rVCOyYH6
 uEvLgrplMLSosx302MaxoCU/ZA==
X-Google-Smtp-Source: AA0mqf4auMOOgb5nq/X/We0IpHFoEpeks4zSH6FlWUVoH1bZIaKLyKtGkmcZjTQryClcNulbm2sBCw==
X-Received: by 2002:a05:600c:3c87:b0:3d0:58bb:9fa3 with SMTP id
 bg7-20020a05600c3c8700b003d058bb9fa3mr18268856wmb.39.1669976167341; 
 Fri, 02 Dec 2022 02:16:07 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f21-20020a1c6a15000000b003cf4d99fd2asm7833170wmc.6.2022.12.02.02.16.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 02:16:06 -0800 (PST)
Message-ID: <a580f83d-eed3-4719-e875-63b787b9a307@linaro.org>
Date: Fri, 2 Dec 2022 11:16:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v2 05/14] ui/spice: Require spice-server >= 0.14.0
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com
References: <20221202100512.4161901-1-armbru@redhat.com>
 <20221202100512.4161901-6-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221202100512.4161901-6-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 2/12/22 11:05, Markus Armbruster wrote:
> Version 0.14.0 is now old enough to have made it into the major
> distributions:
> 
>       Debian 11: 0.14.3
>       RHEL-8: 0.14.3
>       FreeBSD (ports): 0.15.0
>       Fedora 35: 0.15.0
>       Ubuntu 20.04: 0.14.2
>       OpenSUSE Leap 15.3: 0.14.3
> 
> Requiring it lets us drop a number of version checks.  The next commit
> will clean up some more.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   meson.build                | 2 +-
>   hw/display/qxl.h           | 2 --
>   include/ui/qemu-spice.h    | 6 +-----
>   include/ui/spice-display.h | 2 --
>   chardev/spice.c            | 2 --
>   hw/display/qxl.c           | 7 +------
>   6 files changed, 3 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


