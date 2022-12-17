Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAA864FB91
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 19:29:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6bwN-0008PO-TK; Sat, 17 Dec 2022 13:29:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6bwL-0008PD-S2
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 13:29:41 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6bwK-0004TK-GB
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 13:29:41 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 t11-20020a17090a024b00b0021932afece4so9186228pje.5
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 10:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gSKS7Calt2g2ShunskG//QjxVFUkA9l6GwbNI3wsm4w=;
 b=DuX9pBowIRh2vLLIHNnHKQFC+3f5YyDz6wfut0kZIIM8TzFleQJLQu3qinneIhtpsR
 N2e1vWxpRFI/z+P/HhgAONdnxh37CbtcxXkLpjeHCX4uh0h0k/5RWBWoNLUvT+PVybDm
 GXjnTaiILfpchmmU2Y+23InhsjjL7NI35h78FsnF7TgQ6E//cyCK6g5q4MnBJF9TPRe2
 bu5QCBZgXiSc44jQcwDeSc9MeTsAzZaY3wubl5oy2mJ1Vfa+2b2tRsgj6RoPJhmoS1DX
 HlP/isFiJt3ItI+VvZaRGTBT9MkZtUYmOdv7yoVPq30WthTvQPNwDBK+v95c1jaTuOey
 qRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gSKS7Calt2g2ShunskG//QjxVFUkA9l6GwbNI3wsm4w=;
 b=dIV8sm4k0xgy2nef34Kj2ggow8bDWONAQK/8elRroLu87kCqWmZDHwv0ccRBOPDA1Q
 KvdT87wyV0460cCr0M0r6NpL6NvSx08w6XN9gOKhYiSqgijNkg/LdOXNlGaphmBXLQOi
 I0JXzPtQkivhaOKWMvPI5s6srkzJm+a1a4Vf6DkhX7DOqFHuPk3ZOdub04k2rvh/6tQx
 7wXJRRLkQ6p/uBAPYJNCWgcW4xwx3mhMlUOTPaUv08J7pqxMPdgDK5Vzf3HKsYVlXeBz
 uBbvGvaV/yyOhjYQwOkDrhEMVrrcEyLjoWw6VrhbOa10mb8pjGWmUMSLbYk/KJzh5jEZ
 u+2A==
X-Gm-Message-State: ANoB5pmw1iwXuK1vvoiQTl7e9GQfWh66bYPfIQtmXXZNj1TBL5U7aykP
 nMgOI6aRpDomxjLutTHn3ZDB2w==
X-Google-Smtp-Source: AA0mqf4c+snyiZYhnrKTXqtm/i4oJnMXaBCDfg2VQnstuqn2JGPPofhGJHWzgp+aGBBepOkErqYChg==
X-Received: by 2002:a17:902:e011:b0:189:8425:730d with SMTP id
 o17-20020a170902e01100b001898425730dmr31313647plo.27.1671301778916; 
 Sat, 17 Dec 2022 10:29:38 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:dbe7:d50a:f977:e69b?
 ([2602:47:d48c:8101:dbe7:d50a:f977:e69b])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a170902e74100b00186b8752a78sm3865225plf.80.2022.12.17.10.29.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 10:29:38 -0800 (PST)
Message-ID: <d946bff2-e049-6130-7a56-3f4974336256@linaro.org>
Date: Sat, 17 Dec 2022 10:29:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/9] target/alpha: Remove obsolete STATUS document
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20221217172907.8364-1-philmd@linaro.org>
 <20221217172907.8364-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221217172907.8364-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

On 12/17/22 09:28, Philippe Mathieu-Daudé wrote:
> Likely out of sync: last update is from 2008
> (commit d1412eb240), 12 years ago.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/alpha/STATUS | 28 ----------------------------
>   1 file changed, 28 deletions(-)
>   delete mode 100644 target/alpha/STATUS

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

