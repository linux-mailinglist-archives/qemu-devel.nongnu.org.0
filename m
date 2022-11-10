Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D220B623B60
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 06:39:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot0HF-0006kt-9f; Thu, 10 Nov 2022 00:39:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0HD-0006ka-7E
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:38:59 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0HB-0000vc-Pg
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:38:58 -0500
Received: by mail-pg1-x533.google.com with SMTP id s196so778242pgs.3
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 21:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MFjXc3OO2wrTV7wWAE0EqkDWnUduc6uXgR+dM71keLQ=;
 b=lHZIRhoBgSeiqxbsKIQa3z6D3afpALdr8SyVrcCNX1bCrBRJWClQssD6xAy548WcSt
 13FTD6xLCcYlAE1974eXA2F+MbCO9Derc5l4rJoXS03Wy8hbEE+VvCGatRCMRWutn9H8
 ErAmV+vDGCDKwyhjU7Oi3BKa/u1z++tli5v+Ta5tzJmfki33ylNNwxOYj2ArYYwzNGWS
 7mnGw5P4CGyzxobQg6dED6Cx0fn60MTMW30+2O24Z2S+qyjbNnPYlwF3hB2xYIPl0ZrC
 5c36hRcRbKpyQF4qxL/NUhWp4DwW0p1BB9vZpyWe03PGFNVhJe3F881zTjb97wGHJM2S
 Fxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MFjXc3OO2wrTV7wWAE0EqkDWnUduc6uXgR+dM71keLQ=;
 b=xarWq1z6F4LtLiXkQm957Os0KbvlhVmLqb59+RdtnGDtCW9CV9VmdlpkxZOh64ArdU
 Sc27fsbeJTrLYDdyXktmldjAEyZaiu8A/s9gyYChetvcjiYwtkZ/vUFtadEVFmULJyAm
 8dM5v2AZsWfKkwB2Pzgw6E+VoxKxbUikOZT706k3HtRtdQXvKaDMYjTRRO37zSOQHDqc
 kEXflHzEEZ4x6HW70z75puRmXuPphwzs1Bc15z6LMCpjFIloSzOdaMcYlECqlusc3T7R
 41F3Tde3g7Eu8lR+f2BmVKHWEbAKgTAJsCFTiKJysVfR+Abg7hoJGREnuFSTkaWhKGni
 qrnw==
X-Gm-Message-State: ACrzQf3wUkcNk8uNN21KM0IK74zhIzTGJVCm+bIzEeBgVyGpRgHMk40t
 xJGIlnNUZYymaKzq7RQF0151FxuEsoK91UyN
X-Google-Smtp-Source: AMsMyM6lGTiQ0dJMpsYJcuNk+bOgFuMgDoeqCxHZ7d+nhTikkgLV+qvyoKIsK1A/jScSdqspBbNJgg==
X-Received: by 2002:a63:460c:0:b0:46f:8c38:782d with SMTP id
 t12-20020a63460c000000b0046f8c38782dmr52393361pga.56.1668058736149; 
 Wed, 09 Nov 2022 21:38:56 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca?
 (2001-44b8-2176-c800-cc47-10aa-3fa4-e6ca.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca])
 by smtp.gmail.com with ESMTPSA id
 a2-20020a170902710200b00176b3d7db49sm10161249pll.0.2022.11.09.21.38.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 21:38:55 -0800 (PST)
Message-ID: <e0b75a1e-ba03-6ec1-442b-05ca7cd456dc@linaro.org>
Date: Thu, 10 Nov 2022 16:38:50 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH for-8.0 2/2] hw/input/ps2.c: Convert TYPE_PS2_{KBD,
 MOUSE}_DEVICE to 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20221109170009.3498451-1-peter.maydell@linaro.org>
 <20221109170009.3498451-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221109170009.3498451-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/10/22 04:00, Peter Maydell wrote:
> Convert the child classes TYPE_PS2_KBD_DEVICE and
> TYPE_PS2_MOUSE_DEVICE to the 3-phase reset system.  This allows us to
> stop using the old device_class_set_parent_reset() function.
> 
> We don't need to register an 'exit' phase function for the
> subclasses, because they have no work to do in that phase.  Passing
> NULL to resettable_class_set_parent_phases() will result in the
> parent class method being called for that phase, so we don't need to
> register a function purely to chain to the parent 'exit' phase
> function.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/input/ps2.h |  2 +-
>   hw/input/ps2.c         | 31 ++++++++++++++++++++-----------
>   2 files changed, 21 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

