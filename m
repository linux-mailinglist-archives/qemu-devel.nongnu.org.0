Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 671E04C785F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:56:32 +0100 (CET)
Received: from localhost ([::1]:32926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOlCB-0006eE-1i
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:56:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOlAn-0004Rn-Lv
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:55:06 -0500
Received: from [2607:f8b0:4864:20::1030] (port=56042
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOlAi-00045H-19
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:55:05 -0500
Received: by mail-pj1-x1030.google.com with SMTP id gb21so11941097pjb.5
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 10:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RdtEO95V+Z+FzJlvGTCnOiLt8kaTnSPDLH5064uXZ3U=;
 b=PRKB0looZbLXWIu3WmK7i4ybs6kTjgp6F6vDPWymBwBz+4XYz/Y9a6IuvTYX4Fcjtr
 w8b5wpxjDLcpXh6uqWLP0g1bQ1gSpJ29oenBQsC57CSzlOLHdh5YZrcW8MP5hO643PMs
 DoK/w/X+67J+0kfnhkcDj5f1MO2xukIojCSYEXUzjvQ3L/jaLC8ZNlSGzovDi7tOeQav
 Etkf/VkyT2tlcMBiotYv7F2TLOM0h6lHam/wBpZ2ApRxXbridEeifRaZXpOlWoyzUW1y
 wG0nv2JEokr5L/n9IQUPL3IzIHV5kEBhojZko7syIxrME6fbpfDDCOXtKZP5Ia6jM1XG
 pPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RdtEO95V+Z+FzJlvGTCnOiLt8kaTnSPDLH5064uXZ3U=;
 b=Jvf72F15f58o1xmxaTBIj0mm7knHPA82bCTRO3TwlH6jmEWshsE3TWjTLYtyquR4yt
 zJdclQp8fSlOWCKtgnsrNaDoSt8T3IEXgc4xglco74qLhWtNQaXNG8a3jLWvazktCSPy
 ti/fw1FlHohxl1gH+y/EWqgUAzL/3cKwnTec+ndiESpqGmjqCrtE1maonbWjYvaujoJh
 YbQKKjIctNwHP3PPNe9dFhcV/FIYXLjVk8iG4bzzBXJ0PtXwdnNLVG+Buc9EbnPJXTaw
 IX4TxlShz9WoTvz4kFKzjkb+PEShituLlnQ+qxWzhq/8fPnClczIA205T5HhshFulhaG
 jC/g==
X-Gm-Message-State: AOAM5325TT3I+hmuvgjCOzBQphIZTrTSc5cUCYlkX5H9LAliVUeInYFc
 5uD0oLxYgRA710k0/9NXBnuecw==
X-Google-Smtp-Source: ABdhPJwYZItvJnILPEaVrkG2VO6eTWXtPp2SoKlB+HdGeUJxIhpo00PzDkR3VeTniPyHvOWN2yVf8g==
X-Received: by 2002:a17:90a:588c:b0:1b8:91a6:6cdf with SMTP id
 j12-20020a17090a588c00b001b891a66cdfmr18145309pji.239.1646074488603; 
 Mon, 28 Feb 2022 10:54:48 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:483f:d486:138f:7868?
 (2603-800c-1201-c600-483f-d486-138f-7868.res6.spectrum.com.
 [2603:800c:1201:c600:483f:d486:138f:7868])
 by smtp.gmail.com with ESMTPSA id
 u37-20020a056a0009a500b004e1414d69besm14575169pfg.151.2022.02.28.10.54.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 10:54:48 -0800 (PST)
Message-ID: <fd1f8a45-ec6a-a2e3-b936-b93128c1d428@linaro.org>
Date: Mon, 28 Feb 2022 08:54:44 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 02/14] target/riscv: rvk: add support for zbkb extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20220228144810.7284-1-liweiwei@iscas.ac.cn>
 <20220228144810.7284-3-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220228144810.7284-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, luruibo2000@163.com,
 lustrew@foxmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/28/22 04:47, Weiwei Li wrote:
>   - reuse partial instructions of zbb extension, update extension check for them
>   - add brev8, pack, packh, packw, unzip, zip instructions
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> Acked-by: Alistair Francis<alistair.francis@wdc.com>
> ---
>   target/riscv/bitmanip_helper.c          | 53 ++++++++++++++
>   target/riscv/helper.h                   |  3 +
>   target/riscv/insn32.decode              | 45 +++++++-----
>   target/riscv/insn_trans/trans_rvb.c.inc | 94 +++++++++++++++++++++----
>   target/riscv/translate.c                |  7 ++
>   5 files changed, 174 insertions(+), 28 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

