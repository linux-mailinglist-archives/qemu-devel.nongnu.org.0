Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3B36912A8
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 22:30:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQETV-0000mr-78; Thu, 09 Feb 2023 16:29:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQETR-0000mV-TZ
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 16:28:59 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQETQ-0001M4-9B
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 16:28:57 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 l21-20020a05600c1d1500b003dfe462b7e4so4689082wms.0
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 13:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kGXBu31gYyqnELduxmJm82FH6yH/u0Gwh/Lf2rGAAf4=;
 b=lK0l6OYXKluwrWYkApMQvXe49Q/KkDf5War3HahfEI5iRA9IQ2zRS6sZ05FEj3vVHk
 hzM71sz0ITrLs6mDdJZXcSOi8957kWuQehyo4pAyucMzdyUfStTiV26vgvUF3oa6L0SI
 5UJe4JGifj+fcr2CZ6kHLsDuGMhrXG0eOWxypUp2op8gmYmifaRaBmk+HNBK+YYkvb8f
 23MF8aRKfcF03x7/OJTYdOMLw/tnADx2X4fTlYVWhPBH/MoipF4ciJPMwvkLArr6ceup
 HUhOo6Bz7hOOlYYwSjp4UnCT/B8K0XslAEURIjzcMUDQR2NCJHPAZPGvuNvfy6AHxSYR
 cOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kGXBu31gYyqnELduxmJm82FH6yH/u0Gwh/Lf2rGAAf4=;
 b=tltz1zuei8mRN8RZs4FXTuFStO7gPVPvXvIZKfdJy5kpoYb+JrwNs96DxZTTO3KnAn
 EuwJeVUn7OZNFzZ0dUpeMlaAlSKgDRq9y5o+BOfxXKY07+KI4LaphHoFZQV13tLoye2d
 YqA+tNHjNf3eBey7HthEYNz+x63mSXlhaJZCNTdTgqqgCp9nzCsSIpRTdyl5IQci7HSe
 hQD9oKtCkEzBYJxWkJTwiSc3CQ17eFPE3Shh6fOnsNOtoo2QkEQowKEY1cfcc8GZEPwt
 78x53VFXltpcIzOeW4dQ1TfbLD9mCvkf4W6130/LPLANAlJ3V34cx1YTxttvOb08WTv/
 pNqA==
X-Gm-Message-State: AO0yUKXsbynnO9QbrcjqnN/x/ttDK/LaD/0Ir1hxHsSClFWR6hVT4IbD
 bdh+05h9+zjznUjfpytaQ9EWdg==
X-Google-Smtp-Source: AK7set+PhGgq2VfqSD5Oe9AQ5OmC0qKkPDt1Nzlpieb40qv4QY+SdhU7j4fqTTX4k5fFgZAvi3U51A==
X-Received: by 2002:a05:600c:1716:b0:3df:f7cc:4da2 with SMTP id
 c22-20020a05600c171600b003dff7cc4da2mr11088205wmn.16.1675978134703; 
 Thu, 09 Feb 2023 13:28:54 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a1c7210000000b003dc1d668866sm5816537wmc.10.2023.02.09.13.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 13:28:53 -0800 (PST)
Message-ID: <c6613d1d-b489-5094-fd8c-1795159d0a80@linaro.org>
Date: Thu, 9 Feb 2023 22:28:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v3 13/15] qapi: add HOTPLUG_STATE event
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, den-plotnikov@yandex-team.ru
References: <20230209200808.869275-1-vsementsov@yandex-team.ru>
 <20230209200808.869275-14-vsementsov@yandex-team.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230209200808.869275-14-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
> For PCIe and SHPC hotplug it's important to track led indicators,
> especially the power led. Add an event that helps.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>   qapi/qdev.json       | 62 ++++++++++++++++++++++++++++++++++++++++++++
>   include/hw/pci/pci.h | 15 +++++++++++
>   hw/pci/pci.c         | 33 +++++++++++++++++++++++
>   hw/pci/pcie.c        | 49 ++++++++++++++++++++++++++++++++++
>   hw/pci/shpc.c        | 42 ++++++++++++++++++++++++++++++
>   5 files changed, 201 insertions(+)
> 
> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index 2708fb4e99..40dc34f091 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -158,3 +158,65 @@
>   ##
>   { 'event': 'DEVICE_UNPLUG_GUEST_ERROR',
>     'data': { '*device': 'str', 'path': 'str' } }
> +
> +##
> +# @HotplugLedState:
> +#
> +# Since: 8.0
> +##
> +{ 'enum': 'HotplugLedState',
> +  'data': [ 'on', 'blink', 'off' ] }

Could this be more helpful as generic state in "hw/misc/led.h"?

> +##
> +# @HotplugPowerState:
> +#
> +# Since: 8.0
> +##
> +{ 'enum': 'HotplugPowerState',
> +  'data': [ 'on', 'off' ] }

Could it be better to have a generic SwitchState in qapi/common.json?

No real clue, just wondering...

