Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7484C44030D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 21:22:55 +0200 (CEST)
Received: from localhost ([::1]:48900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgXSo-00073T-Gq
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 15:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgX7B-0003eW-T9
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:00:35 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:39844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgX78-0001BH-3s
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:00:33 -0400
Received: by mail-pl1-x629.google.com with SMTP id t21so7413602plr.6
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 12:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2vkI6qajBg7c8SuYjDSgczCh72vg00ieNNexMqfjXTQ=;
 b=OaQ/wmHYijyzzKHHP8fI1KBS+Si0mwxyU/2F5QfvFlwwK9MMPvpK1QXfHvufnWqWwN
 yrR7RIXhyoid/y81WxfVb/XxnNdZkVYCERKgEuHOuQUE4CqTehhk9pTcyKi6Yn6b3cM3
 vzWhb3Pz9tb/Kg0chwswFaXOMWJvxHsfLOKoGvtzRq42QzwS/GvslzQKZPjpxv+YvJXI
 RZSjHTwBGJQhrZ39N4ClQ8VI1qiY1PMT9V5r3aov/HBprK29KiVqw3hV6VRA0/duRvb6
 YDrACsHmxc+aNOQbgJnjv6dI1g6r9PdU0pMDjwhWkokdRUZsAhOiLcq3cT+0ogP6mM52
 dMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2vkI6qajBg7c8SuYjDSgczCh72vg00ieNNexMqfjXTQ=;
 b=TUVWNLY/97cjz0qWrJYTRGwzDqFlefTJgboCKZSO9cdKNT+dPmjCm+/zdJfnbaWsmJ
 j2nkO0C2ZJLmbHTSdm3YwpJsvrTJgNNnXHEl2+/xT2+0Ov0fR/y8UYTgp8OSpmRTunYt
 OMiA2muXTHDbPiHAVIWXCXnSMlEJ+u/i3LBNZoWEYlUZWl4o4sShR3zpVmuF7S2C0UFo
 eY+HxOo0nLK1TCPIJ/C3MK8eE/0D4/D+zoDFgO3wFy3woaz0ztZCh/B0vnHXuIVzvnKt
 ppNhAgDEJslKi7mbpngo55RgZ93j2flTVEwCQfXm3colqYYPBa9lTGH7gRASBS5cFYBY
 JrEw==
X-Gm-Message-State: AOAM530plBtamSwZBksZ1fOpPM/DgJfHdP18xQH7ptHC0m0s2W4pBH9/
 FWZcUEMC1oAsIxfbfMRU/T9dHw==
X-Google-Smtp-Source: ABdhPJxPrK1cGF31ixZhu1oY/rbiIZ5Fa31tDZy4e5vYQQ7wuuSaF+Y7vU25n3cOCmmYaKtCXa/6mw==
X-Received: by 2002:a17:90a:bc85:: with SMTP id
 x5mr13333384pjr.166.1635534028531; 
 Fri, 29 Oct 2021 12:00:28 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id q18sm8573333pfj.46.2021.10.29.12.00.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 12:00:27 -0700 (PDT)
Subject: Re: [PATCH v4 13/30] Hexagon HVX (target/hexagon) helper overrides
 infrastructure
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1634033468-23566-1-git-send-email-tsimpson@quicinc.com>
 <1634033468-23566-14-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <89947902-1f12-9b83-1edb-3fdaf4bcca49@linaro.org>
Date: Fri, 29 Oct 2021 12:00:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1634033468-23566-14-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
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
Cc: ale@rev.ng, bcain@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/21 3:10 AM, Taylor Simpson wrote:
> Build the infrastructure to create overrides for HVX instructions.
> We create a new empty file (gen_tcg_hvx.h) that will be populated
> in subsequent patches.
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg_hvx.h        | 21 +++++++++++++++++++++
>   target/hexagon/genptr.c             |  1 +
>   target/hexagon/gen_helper_funcs.py  |  3 ++-
>   target/hexagon/gen_helper_protos.py |  3 ++-
>   target/hexagon/gen_tcg_funcs.py     |  3 ++-
>   target/hexagon/meson.build          | 13 +++++++------
>   6 files changed, 35 insertions(+), 9 deletions(-)
>   create mode 100644 target/hexagon/gen_tcg_hvx.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

