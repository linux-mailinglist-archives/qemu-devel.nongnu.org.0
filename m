Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EEF6743B3
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 21:51:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIbs0-0004Xe-Oy; Thu, 19 Jan 2023 15:50:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIbry-0004XC-Ub
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 15:50:47 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIbrx-00022Z-0B
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 15:50:46 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 m3-20020a17090a414300b00229ef93c5b0so2240364pjg.2
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 12:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QkeeuhdmOssDlQHo1ITSHDVXwuNlSWUiLNtk4501ya8=;
 b=dvWZPAwmUz5fGgPR3HtCscYzDyWBL5aO4xj+wZiOXpyo/bsVG4INfqJX2IuW2WfB+Q
 tOgmdObHOpwLFMhIWGMfRCzlArcDdnbgZYCo0NjnHeeLyn4Tq3CQ60d2gLdF9hRIxMJ6
 /8v0gkFunNdOM+PZgGLHyWrvrVIThetyLH6sE65w61+prX2rILrpfxDq00fE8CbCYCZ1
 FzkjezUOOgkrAIonbJR2h09ARQomz3NjriA7XcLQvSUEfSDg5FDv4e4BxTVFj7A0SieT
 IEAzZjdzE503Mjjv/liSpIzVpj0hrwDBlY3MbBUlvSf0X9QUQvUsLkagqAC4Zo6yUc0G
 v+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QkeeuhdmOssDlQHo1ITSHDVXwuNlSWUiLNtk4501ya8=;
 b=Lx6KpNLogv6mm3QBqE0eUgd0caN/yUjWrOJWbTeAOWj8jpECPbveO18o4k7RPhVefh
 TRFjFZKQJD8hSXoYSB84iA/OkC4DYSFDrCyAN4fIV1hv0HaFuJQmgE1fOho10Rgt/ebq
 s7OzzI8B1kkxCRytGiZbHg0zLoCnGCuAeEykRb8TSFrJVIaoXvCz0a5ZG4lpfC+urInR
 SZ88rcIwhms/xu9N9POdAJFiTdMDTpc0xX7e7PDzFhzaA5bEllSqUFHzHycMYWsYuBYM
 p51P5I2z2muixhkmX0ca9GHxXA4taqzasqBi5choK9lYIted1VcH3bynf8XRvU6Qdwmr
 HAxw==
X-Gm-Message-State: AFqh2kr57xBwLuwNLZTk/oZdN8+/NR1UGLS44tNK/770g6SC9r1/vTfQ
 zkRFg/Jr5/3YYksGPu+gnH2/nQ==
X-Google-Smtp-Source: AMrXdXt27G2WaOcjtIkPTgt7/gZ2JH32c8KGQ2ODRxY8Uk1+c2qLukbClfqRMdWSqThbn2PpQ+3yxA==
X-Received: by 2002:a05:6a20:d80e:b0:ac:b2a3:e39c with SMTP id
 iv14-20020a056a20d80e00b000acb2a3e39cmr11815722pzb.62.1674161443425; 
 Thu, 19 Jan 2023 12:50:43 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 n6-20020a634d46000000b004351358f056sm21103500pgl.85.2023.01.19.12.50.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 12:50:42 -0800 (PST)
Message-ID: <3e2d3012-f723-83f6-2f80-f5b6da5505e0@linaro.org>
Date: Thu, 19 Jan 2023 10:50:38 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] tcg: Mark tcg helpers noinline to avoid an issue with LTO
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, idan.horowitz@gmail.com
References: <20230119165006.742073-1-richard.henderson@linaro.org>
 <CAFEAcA8HagPUUkPch6FfM-BdHPMFMsVRcSA-6CZwQ7JZwRdbpg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8HagPUUkPch6FfM-BdHPMFMsVRcSA-6CZwQ7JZwRdbpg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 1/19/23 07:11, Peter Maydell wrote:
> Do we have any chance of persuading the gcc folks to document
> that 'noinline' also affects function splitting ? That would
> reduce the chance that they decide to take out the attribute
> check at some future date...

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108470


r~

