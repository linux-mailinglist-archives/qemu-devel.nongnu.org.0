Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 291874498AF
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 16:45:11 +0100 (CET)
Received: from localhost ([::1]:55420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk6pZ-0004uh-Qh
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 10:45:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mk6nR-0003Vj-0y
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:42:57 -0500
Received: from [2a00:1450:4864:20::435] (port=36657
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mk6nL-0005DQ-7y
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:42:56 -0500
Received: by mail-wr1-x435.google.com with SMTP id s13so27674870wrb.3
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 07:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hMTDcW0D7yNFGXUXrpduCEnVS95gV9fWvJu34D4Ey+U=;
 b=tkJq04geNdZFbYMF0tqZLgokWyRa/RYFfKo4hS0xtXNcbKM2G2Z3+X+SjZdyBOICwl
 QaXsPqhKmxkNNxH6V21qwA364BVA8zDkJHEpDonrEQPfLASN0wOkcejZqmfjpBlOTZHo
 dGg4LdpNtJ92tyefiN1BiIKYjPnUq+T8YWFM/cNc9c9E63n4AsRn/1ukdtx9f5UeKgYy
 Zf5MNQOfFWj95EX78z3JCGPnmK3+xSgTsM412e3wOsUt2X75Z3/9OMvxkqDnNK+5ON2a
 TwTbgxEw3mqWQbPXo7MZSyFNJAW2EUm/glUhsBe33iL2tPJ0HuOo0yxGXJrx5RnJgMnI
 bJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hMTDcW0D7yNFGXUXrpduCEnVS95gV9fWvJu34D4Ey+U=;
 b=FbDPjMg1MaJOQYB1/Fp8zzOGFduLWj1lZCGO3N3zQT8NKQLJ67s35oVuUzHNgEpG9x
 zdV+kbhjO6oimthC18IsTpBdc3cm5Nzl4LhwqA/QCiSWXEkXhi3alm0xwK/925BAKfMR
 6gXrhjfzAaqL8bi+IciuXhVapPB9PcHZ6VnO3KF68hOcmdp1QeE4Ys5jF2BU9E93bZeq
 a+Whf/cXiNhEdAv7+c0tBj5a35AKdD3F4WUmBiIIgLOXCFho4qgMzzba1p4Epu8ZTDey
 sRfCZqm6CAElaHCUNI2DyvZCKBV7hchZbiAJ/IntCau5XgDMQX5F5u8/TqPPFgIoJTjr
 Quhg==
X-Gm-Message-State: AOAM533XPBqfTCiRy3Dwy3inUOMAU79TwE1CFAOAjJB/tCdgwdNVFpgf
 AIdxAwRgpnTwoIiGUfAvQFkq6g==
X-Google-Smtp-Source: ABdhPJy3wAKt0KGqJSMotuKPBXK42F0Kd/dtaPckGERavtdQPfDjnJnz3EyS1HiEsyL3GeqvL+tO9g==
X-Received: by 2002:a05:6000:1c2:: with SMTP id
 t2mr107089wrx.378.1636386169467; 
 Mon, 08 Nov 2021 07:42:49 -0800 (PST)
Received: from [192.168.8.106] (173.red-95-126-185.staticip.rima-tde.net.
 [95.126.185.173])
 by smtp.gmail.com with ESMTPSA id a4sm15434385wmg.10.2021.11.08.07.42.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 07:42:49 -0800 (PST)
Subject: Re: [PATCH v5 34/37] bsd-user/arm/signal.c: arm set_mcontext
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211108035136.43687-1-imp@bsdimp.com>
 <20211108035136.43687-35-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f7c85323-ac00-f67f-f1d5-c02733ec8ad6@linaro.org>
Date: Mon, 8 Nov 2021 16:42:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211108035136.43687-35-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.06,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Philippe Mathieu-Daude <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 4:51 AM, Warner Losh wrote:
> +    env->regs[15] = tswap32(gr[TARGET_REG_PC] & ~mask);

Oops, one more buglet: the mask should be outside the tswap.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

