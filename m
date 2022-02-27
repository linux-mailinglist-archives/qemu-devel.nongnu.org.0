Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B67684C58D5
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 01:58:20 +0100 (CET)
Received: from localhost ([::1]:41616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO7tD-0006xi-OV
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 19:58:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO7s2-0005KW-L9
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 19:57:06 -0500
Received: from [2607:f8b0:4864:20::1030] (port=56185
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO7ry-0005lw-Jn
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 19:57:05 -0500
Received: by mail-pj1-x1030.google.com with SMTP id gb21so7999540pjb.5
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 16:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+5wynbDhGFH8AybX8UsWZBULgN/zu0Ao1YYT0cYhx3A=;
 b=A+GPs9WYKXuazl3hKgEGPup3/a7xMy9V8LdcdU92rEueZvz7vLCY0iaOW7fMU3obMN
 WJaUH7GbAk1m71BAmOOeTx8aMQqucdc/K941mhVfjM5GsAuvSBskvRRxProBBeYLkKkm
 ZFkJYCMQV8yLwvnrzF7sjhGtCa/yNAT5DKrm8p37kBa8sezpNoGVTyDZqOZs5SDc/z0+
 aOfHPm7V8YQuZMPTvoL+lpSfPGumsobgyTn0YdE1FZG66NHfUm4HBh/qUrSfxhGwSRfb
 GUcx+CNu/E6qbNGnKW1PGKJQRIQVSdjY825LNu+b3sYN7Tfb5c3MN07ppWEOIgKEfi4B
 X+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+5wynbDhGFH8AybX8UsWZBULgN/zu0Ao1YYT0cYhx3A=;
 b=2onlAps2H4zW9b+zon2BNkRyS3o8pZ5XfDnx6MsNzSXrwVGWsFye749c7haa2iCbf5
 N2g0Q60t+Y8tIJYmwUYN9D1SG4NGNWxDNoGMCs6VEdzmL1/mtafC/ZIyGrPa6BDw/Xd6
 SfsNKvTpF6sqI9peQSfELVd/pcmcFFpZ1+YrG9s1/yawTVBKTIbjxwmhfUJaKgH6EsG1
 MGunCOssgTRfHp9qgO/cKVp09nA24HpQ1zUqOWXZj5WlaFQeABlgkqyuQOp//CQKWkxp
 XlH75Z9/VHihIwz10hK6cgBOpIZxIZeC+09Krk1wbE9cZmsHFyGalw+vfGKG2Bb2URCL
 YS/w==
X-Gm-Message-State: AOAM533iVMWJNg8P08ikQ8v+FJzNXWCnTboaYFRahs5jJVRiGxFt7W44
 p3kGAkId3a9rfrfZzZ7iOI79YMVuh3O2rw==
X-Google-Smtp-Source: ABdhPJwopLvOF35ZQO6a5Vrm2/8Gcu2R1aLcf0Y5pSA99WlhF0qLJWlRIxAP3bWtLhqXNV1XSPCe7Q==
X-Received: by 2002:a17:903:10d:b0:151:45e9:5319 with SMTP id
 y13-20020a170903010d00b0015145e95319mr5584176plc.55.1645923418157; 
 Sat, 26 Feb 2022 16:56:58 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:9001:d56a:9ee0:246?
 (2603-800c-1201-c600-9001-d56a-9ee0-0246.res6.spectrum.com.
 [2603:800c:1201:c600:9001:d56a:9ee0:246])
 by smtp.gmail.com with ESMTPSA id
 q20-20020a056a00151400b004f3cd061d33sm8325749pfu.204.2022.02.26.16.56.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Feb 2022 16:56:57 -0800 (PST)
Message-ID: <d77af38e-77d4-8ecb-e043-07be5734eeed@linaro.org>
Date: Sat, 26 Feb 2022 14:56:54 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 6/9] util: Share qemu_try_memalign() implementation
 between POSIX and Windows
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
 <20220226180723.1706285-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220226180723.1706285-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/22 08:07, Peter Maydell wrote:
> The qemu_try_memalign() functions for POSIX and Windows used to be
> significantly different, but these days they are identical except for
> the actual allocation function called, and the POSIX version already
> has to have ifdeffery for different allocation functions.
> 
> Move to a single implementation in memalign.c, which uses the Windows
> _aligned_malloc if we detect that function in meson.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   meson.build        |  1 +
>   util/memalign.c    | 33 +++++++++++++++++++++++++++++++++
>   util/oslib-posix.c | 26 --------------------------
>   util/oslib-win32.c | 18 ------------------
>   4 files changed, 34 insertions(+), 44 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

