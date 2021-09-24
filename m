Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2C141771D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 16:54:03 +0200 (CEST)
Received: from localhost ([::1]:38504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTmaQ-0002qE-03
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 10:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTmZN-0002BQ-Pc
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 10:52:57 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:39810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTmZM-0002O1-E7
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 10:52:57 -0400
Received: by mail-qk1-x72d.google.com with SMTP id f130so28261428qke.6
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 07:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zz4vHRV//7q0BbbW5ruEqHxwbaHNXtcj0rFxHzkuu1Y=;
 b=UqfLWh8iR+lAjrzdUiiihyXQjZHeZgmzdCpvOXUUmE74Yk3pd/YA1i9f5x+WYtEwng
 xLYz741O0yFuCK2Fel6s3AVDPpHlYHmIMgTQf3atQidZHDtGfGsWqZkN5gLHeC8MU8uV
 xmxm3upVwyNqdu5grcEzedn/TQVcAgo+uWM4s6r6RS55WuWUvxHx5roaUa+uhuvxA/4f
 acIyOOk+HhSDXjqsUcw8NNEYzXx2KdlIym8p9zbAYc0A022h8/zKzMTo3ojKRNuz6sk/
 +il4l0GmQC7k4kAE7pelJ/F1HgyJmxbzWjqNw2hE1bT8ezAZ96DyL/OyTS72qf2WpNrT
 uMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zz4vHRV//7q0BbbW5ruEqHxwbaHNXtcj0rFxHzkuu1Y=;
 b=glhz7HxtwZDgvfwd/Gy0hzXAfY5CCAD2PF57uo4kYcCZgtPyE5/+pQ3/dlcI4M5tPE
 47rgazKXPeMy1HsV3zCTk6U8U8aIybA5z9tTe7s66RyOnP9lHCicD6qdJjY4h/nPr90k
 IZTaDx0G+LdRhuSaisMuPezP3uFW5ZD5xhwCdkv4LfhpnJJbqDNz8kFJ6HfPQwZ8/krv
 X8M9BWpo4cPxMu3ziY2CkFuxUfQHRyckdtfOsfFQlQDGFqmrBKUV9NpYF5+MMXKYQB29
 9gnxVxoWNQP8hylZ8Nsh4I5Dc9Pfx5uRYkQA4CH+ebaKxUxLucuFgEwhk8jwfqHvCMob
 5Tog==
X-Gm-Message-State: AOAM531zlt/c1jKriluXIyncCZYUzUYM5zT9bnvsE22VBI+SwcqAJeDn
 nY52yH/etU7XfsGw0dKYc4i0JA==
X-Google-Smtp-Source: ABdhPJyK8qwvP0iZKecCQjFhmh+Pn/V6yJFgDeVwcmKChrHCikXqerN/9ovABG5KOdbYmZm+V980IQ==
X-Received: by 2002:a37:b3c6:: with SMTP id
 c189mr11153539qkf.343.1632495175335; 
 Fri, 24 Sep 2021 07:52:55 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id b14sm5073239qtk.64.2021.09.24.07.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 07:52:54 -0700 (PDT)
Subject: Re: [PATCH v4 09/30] tcg/loongarch64: Implement tcg_out_mov and
 tcg_out_movi
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210923165939.729081-1-git@xen0n.name>
 <20210923165939.729081-10-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ba51f0ac-acab-9998-6a61-d9902aa6b352@linaro.org>
Date: Fri, 24 Sep 2021 10:52:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923165939.729081-10-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/21 12:59 PM, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui<git@xen0n.name>
> ---
>   tcg/loongarch64/tcg-target.c.inc | 111 +++++++++++++++++++++++++++++++
>   1 file changed, 111 insertions(+)

Looks really good, thanks.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

