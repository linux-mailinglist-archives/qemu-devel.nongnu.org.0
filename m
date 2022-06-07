Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28A5541F5D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 01:18:07 +0200 (CEST)
Received: from localhost ([::1]:47156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyiSc-0007G4-FW
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 19:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyh0c-0005kl-CZ
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 17:45:06 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:46771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyh0a-0001ty-MJ
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 17:45:05 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 k5-20020a17090a404500b001e8875e6242so5825111pjg.5
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 14:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SDWpnZFMtL4Hca+pZTxhN7y3J2q8vThKISacKSLODEM=;
 b=ewE7qU7OQFnZzrkBuZvGwjSCZ1zyFx00TuGJR4FvDxkJ2s+AhOHWTQpMuLobFL6xlV
 fqOS3rtHZJMIvAaaPylXtQTUDAn5z2P8QkR1hOnRu82S/SGwCIgufnagNnGdQi560s+Z
 wKOyD9g/9RpdK0VBbVZlAfRGvIrmAHlJ2+0ttUfl15OWg1DtKOHqEZ3TaVFKK72GyfzY
 C5TvTt+RirS47CWwEDb0Q94MxHE2YqjgZNncY1hfua3Ar5T9o+7N5m28+tMb2lQcg2NY
 xMdTudPlIHuVSTlUDKQWKRCCN2aKnB6hUy7GQ791mjuIpGiVazOQ1VHQUtuwKOSVgtUg
 tpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SDWpnZFMtL4Hca+pZTxhN7y3J2q8vThKISacKSLODEM=;
 b=XDXxlXKaoaOkctBTFOkv69hRDMfgwtEJlTzkxRK2tfIkVVzVWMl+E+Pza2k+1xdaeC
 Mhchv/fASECFL3lEeIDNodtv6AvQB4VHxJ6UC1d3zuharGl31g8/0fOOJSBFC8+RXDqp
 CCK+D1CBsfmfpBsZosaPVAUH3yFZNnWm8HukAVoYuxz859KUMLSmI7mnU+GdjtOIQcMq
 gZX4IuHyF5e0k15rlOSGhX2hKy6Dd81D1RMviY/RWfgxAn/MsBXsx9xa0e7/yrS0mtt+
 ndQApYtPbhtU1qTIropj2QFYYcVSD0AWitXjoiWb7WY5Ie9GlkATZIXg7qaAu/+rUYPa
 gbMQ==
X-Gm-Message-State: AOAM5305djacZVq2Lhtk/puZcGSxco58U/nWLuNfGz1UXa5Bh1ZCNI4R
 5CCSZa7H/1l8nEdY92+hUDcp4Q==
X-Google-Smtp-Source: ABdhPJwwlh/WK0qAMpPYebDuBkqfBgIWx7KljPRhkqC5qMlEnMtAYchUYGm1xRDPQDwFPulc0w0a5w==
X-Received: by 2002:a17:903:1248:b0:151:9708:d586 with SMTP id
 u8-20020a170903124800b001519708d586mr30863636plh.15.1654638303037; 
 Tue, 07 Jun 2022 14:45:03 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3cf2:c634:5b19:25f6?
 ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 199-20020a6215d0000000b0051b9c0af43dsm13434398pfv.155.2022.06.07.14.45.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 14:45:02 -0700 (PDT)
Message-ID: <575c6936-c0e0-2c9f-8c5d-e9184001804b@linaro.org>
Date: Tue, 7 Jun 2022 14:45:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 4/6] bsd-user/bsd-file.h: Add implementations for read,
 pread, readv and preadv
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: arrowd@freebsd.org, def@freebsd.org, jrtc27@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>
References: <20220607201440.41464-1-imp@bsdimp.com>
 <20220607201440.41464-5-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220607201440.41464-5-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/22 13:14, Warner Losh wrote:
> +/* read(2) */
> +static inline abi_long do_bsd_read(abi_long arg1, abi_long arg2, abi_long arg3)

Why the inline markers?  Best to drop them.

> +        /*
> +         * File system calls.
> +         */
> +    case TARGET_FREEBSD_NR_read: /* read(2) */
> +        ret = do_bsd_read(arg1, arg2, arg3);
> +        break;
> +
> +    case TARGET_FREEBSD_NR_pread: /* pread(2) */
> +        ret = do_bsd_pread(cpu_env, arg1, arg2, arg3, arg4, arg5, arg6);
> +        break;
> +
> +    case TARGET_FREEBSD_NR_readv: /* readv(2) */
> +        ret = do_bsd_readv(arg1, arg2, arg3);
> +        break;

Missing preadv, which you added above.

r~

