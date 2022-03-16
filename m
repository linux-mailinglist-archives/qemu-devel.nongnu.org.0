Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 537C04DB967
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 21:33:35 +0100 (CET)
Received: from localhost ([::1]:54276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUaKr-0004rh-Tn
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 16:33:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUaHd-0003BV-2g
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 16:30:13 -0400
Received: from [2607:f8b0:4864:20::22f] (port=35593
 helo=mail-oi1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUaHb-0007bG-9c
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 16:30:12 -0400
Received: by mail-oi1-x22f.google.com with SMTP id e4so542321oif.2
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 13:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Xt69TVOEOAUb73bTVYhTRW0x3/X4pfT4znDF/toKFPI=;
 b=ApAK56pU29wRXTVpzZxUPJrC/mzPPVErhnINWWiHfIb9ERQJkYiRUwIrhlD7WiyYc8
 zuUPb8BE+0dC5gHOwOXMs8bXshtP04oaJIXMT9wJ5euviZ8m2ncD0KQqkR9YtfS85pc8
 BA2Zf5Dugx/cwchsHHJ0WjjCm4ygI/VHz83auOYQ2pz5Me6wnH0eSYoiVndJXxkcw6iM
 Lx++kBSn7nZG2h+7ZONlWroAOvjToELKQoSSL2N59rl3r6nUjNoJxY9sNkcRDtdekRU1
 ZjQ1YrSOnQQHhXH5ecmWlvtxFnQfT30r2+ooZ1/JQ/Jc6V9ikyCXnQ1zBrXrZ07GNIpA
 pgwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Xt69TVOEOAUb73bTVYhTRW0x3/X4pfT4znDF/toKFPI=;
 b=L+YGK9SWDsWK9aCBzJTiUoCRrLv8qtqKFNaS8f4pOPlrc0mFxJe5gIPFfQ6WP0AyYW
 u5n5CDawOztBupcHFPIWcR0T4E5TiycAKi2+xDyGGzDftxI3/qYlDy0Bnuf7y7PQ6Tdn
 jhiFWxvBqiWfEzdQPpwYOc92yYzIGAxFsmcSSw24YMxcKKcug+zz8A9u4Q95OMxg1TXC
 yRHZfaLncYV0nO+DjSYN/TxDzV6Q6+PjLAyZ10UUszDEC8iT2omjSbJGuPNbCqqLf22u
 ITX0oN9sTvk6/UttnAsDRxJvu/W+/tAQXK13Ds0jWeuwVOOhn52jo2iHG8WYBt6x3Xsv
 mkLw==
X-Gm-Message-State: AOAM530aiq2veBYdq5CtcsyWGBEbmY9X5XkuLf+O+iY1GCoX+ZJ6Q0/+
 J4Sh4AewYXO22YWnjCZVOVj/kQ==
X-Google-Smtp-Source: ABdhPJwBv3gDzeENpp6xpPKns3dF8WTHD58YQMkdWAm5H96FJ+N28tRGQmltppLwWE1kk8VQ7UqicA==
X-Received: by 2002:a05:6808:3dc:b0:2ed:5bc:4c66 with SMTP id
 o28-20020a05680803dc00b002ed05bc4c66mr570304oie.121.1647462604522; 
 Wed, 16 Mar 2022 13:30:04 -0700 (PDT)
Received: from ?IPV6:2607:fb90:2823:9a18:3a12:c6b0:a7fe:e853?
 ([2607:fb90:2823:9a18:3a12:c6b0:a7fe:e853])
 by smtp.gmail.com with ESMTPSA id
 4-20020a056870004400b000dabe0c435bsm1246272oaz.7.2022.03.16.13.30.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 13:30:04 -0700 (PDT)
Message-ID: <6e407910-90f2-2d3a-d3f2-32b7f83d97b5@linaro.org>
Date: Wed, 16 Mar 2022 13:29:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] target/ppc: Replicate Double->Single-Precision result
Content-Language: en-US
To: Lucas Coutinho <lucas.coutinho@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220316200427.3410437-1-lucas.coutinho@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220316200427.3410437-1-lucas.coutinho@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
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
Cc: groug@kaod.org, danielhb413@gmail.com, matheus.ferst@eldorado.org.br,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/22 13:04, Lucas Coutinho wrote:
> Power ISA v3.1 formalizes the previously undefined result in
> words 1 and 3 to be a copy of the result in words 0 and 2.
> 
> This affects: xvcvsxdsp, xvcvuxdsp, xvcvdpsp.
> 
> And the previously undefined result in word 1 to be a copy of
> the result in word 0.
> 
> This affects: xscvdpsp.
> 
> Signed-off-by: Lucas Coutinho<lucas.coutinho@eldorado.org.br>
> ---
> This patch is a follow-up of:
> https://lists.gnu.org/archive/html/qemu-ppc/2022-03/msg00354.html
> which have the same behavior of the instructions altered
> ---
>   target/ppc/fpu_helper.c | 48 +++++++++++++++++++++++++++++++++++++----
>   1 file changed, 44 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I had a brief look for other cases, but I guess I should have looked harder.  Thanks for 
the follow-up.


r~

