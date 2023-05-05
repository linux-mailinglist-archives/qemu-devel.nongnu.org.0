Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 365DA6F8AA0
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:20:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2pZ-0007FC-Uj; Fri, 05 May 2023 17:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2pX-0007F2-H2
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:19:07 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2pV-0002i4-Rs
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:19:07 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f20215fa70so15929325e9.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321544; x=1685913544;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d7Fye5FMQRNiQu+TCCoAtANzVdyeUD4f7SxfRxmct9Q=;
 b=MJsRAU7MxYIIUsc+BaiUH6iY2wUBe2pajOyogKXFSQ2ckyzI9mUfimOgdV3i2mj2X/
 ES/9FwK03zTknB7gBId6Tg/pJ0G89SwOTD6dyPyor2j+tXa18If995NqR0nk7VIk/zmt
 FkWdW0mp17FlOtZF058qcWKLJwdfcm6S36G82WDmbe8zLlzCWth0qPGSrAoy9gNB3aEs
 dMB1l0ALmSsBchY329B2PXLwDxx3H2BcbUhJ80NM8ZlgL1jl7dR3S9K44Jpm0en0m5Hn
 m/3A0CPujw6eWwUPrRnTOa/KryjEiCaM1ieimcYHB3k2RlzOzh8H5Ta4wf1RPgwUhUzr
 nlzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321544; x=1685913544;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d7Fye5FMQRNiQu+TCCoAtANzVdyeUD4f7SxfRxmct9Q=;
 b=cc4tSGfIIcJjbEJaMvVM0lucYPAYRYGbKTrzCi8nU5GQeWiIpSu8mYZygv+cQfcEyH
 LBR+/W9mmnaMKtwXF0iOY1fKvQAVccCKyR9uieT9US/8650soh94ciKtt6SeKxJ2ANNw
 PDA4aWnRHQ/ppH8r2MZVwmwsLPIdSUh8Wl8DELXhmpfTIZ0kfLrB8kv8noQHhz8DQHsd
 L1mZM1rZnUh3QSG9TRk4ZwERPnBTUd5bxd2dPckuhaHe4e0t4KI6Dah7MZhFs0qvkAsL
 PaHA+T2D5kRruFzVk7wQOpvxu49Ny4rIfKAE9SV4YlS5VbOs6lbenWeaJx2WygB1OlZw
 5PXA==
X-Gm-Message-State: AC+VfDztnmwclPPhlgqEgEhYLTggf+A7PSRExdMiAzfi5pvmb/B24/RN
 3B1fNdN3lAVAUAOTZf3MqEInsw==
X-Google-Smtp-Source: ACHHUZ77R5zyYjHVGaWCrjiAX2Bgtdi/BECSHoG6mpHR1aM3lsd+zlRQy5m1tQjSxlwl2Iz6nQwkYg==
X-Received: by 2002:a1c:f408:0:b0:3f1:7372:f98f with SMTP id
 z8-20020a1cf408000000b003f17372f98fmr1832582wma.41.1683321544467; 
 Fri, 05 May 2023 14:19:04 -0700 (PDT)
Received: from [192.168.20.44] ([212.241.182.8])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a1c750b000000b003f1712b1402sm8997768wmc.30.2023.05.05.14.19.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 14:19:04 -0700 (PDT)
Message-ID: <09aa632a-379a-bd96-29b4-b51859936c30@linaro.org>
Date: Fri, 5 May 2023 22:19:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 0/1] audio patch
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230505113947.3301944-1-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230505113947.3301944-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/5/23 12:39, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> The following changes since commit f6b761bdbd8ba63cee7428d52fb6b46e4224ddab:
> 
>    Merge tag 'qga-pull-2023-05-04' ofhttps://github.com/kostyanf14/qemu  into staging (2023-05-04 12:08:00 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/marcandre.lureau/qemu.git  tags/pw-pull-request
> 
> for you to fetch changes up to c2d3d1c294151cea0e62d3ecca09837fc23ba4b3:
> 
>    audio/pwaudio.c: Add Pipewire audio backend for QEMU (2023-05-05 13:23:08 +0400)
> 
> ----------------------------------------------------------------
> Add PipeWire audio backend

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


