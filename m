Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB244390CE6
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 01:20:53 +0200 (CEST)
Received: from localhost ([::1]:36986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llgM0-0003bo-7W
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 19:20:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llgKm-0002eV-BW
 for qemu-devel@nongnu.org; Tue, 25 May 2021 19:19:36 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:35366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llgKj-0000FO-JU
 for qemu-devel@nongnu.org; Tue, 25 May 2021 19:19:36 -0400
Received: by mail-pf1-x431.google.com with SMTP id g18so23149638pfr.2
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 16:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qlqrKdOuWM+c0zWdk4Al88EnpnHebKAyi7JgDJV1cvA=;
 b=huEafp8Oz2KCm0htUv6bCkuRB2teIAYAS6Ux/ip/sH8EGFWLS5zf1IGM9EJKc2RJBm
 rKPb0arYU96GjNXFy7bHpMajzK+txL5/FtZKZNX/N/SKJLpTa/HhStklegAH8x4dJLmg
 B3La5sfqdojtngjPLZmkzT0dyDsfK6DJMo6nVkyuiMoBe25ZZLWGD6Q/gTCszUOYPg1j
 dUac+vl+TWANiOE3mpYAp+q6uBbklSSnrWcDQOBzf41dXv1uR4EKywbod0Sv81BRj8ge
 TuOx0P+/Go00ILIVAME3hcYbzsOU8mjKlLqBSsWtOrVDGHQvvHAak3uNFcNwp6VYPqqH
 rFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qlqrKdOuWM+c0zWdk4Al88EnpnHebKAyi7JgDJV1cvA=;
 b=OiMa6ChB1SB+wbXQwfEwQC+hrOJqFlvceux1YS2D1VtdYLdry2mLzhW+eXOHn24Yh6
 L9Hsp/fpY3E5D/51HkeQvy7v80/shqlR4RILpB7D4enFD7mc0wp/7D5KfBadmTJFe4nX
 bymaTTmAiKAawojGpFdLboSaxhcruwVVuBIRFCuIYE1FfPEgOJjLxQnxgaKq+dMj8GDU
 ByaE+9Y7OMcumxMo0pv/gwFJ3H1hem7DAXDskEs+veA1XKBC/tfkNXDJscI4NHkYdY6G
 QKNqdfKmb74FEcQISVqJKlpOdTTtkmytrMiLe1fR28O5YFuq7sWzggulmW7EiKZLZXoh
 9sMw==
X-Gm-Message-State: AOAM531f9IcEDhANe6SlNBA3qv4LbU2bc03eVL0jlOCgGVs1XaL/PJXv
 KzoJsAsAT9gW3nvhPpjDcXBOJg==
X-Google-Smtp-Source: ABdhPJwSDSXBjqc3Fk/L0JM83fuVfwj+vFibRpFtkP7xCVHF71QjA4gUrTpNKE8gricAMaz0n58+Gg==
X-Received: by 2002:a63:a511:: with SMTP id n17mr21712464pgf.9.1621984771896; 
 Tue, 25 May 2021 16:19:31 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 m24sm4092133pfa.125.2021.05.25.16.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 16:19:31 -0700 (PDT)
Subject: Re: [PATCH 1/3] meson: Only build virtfs-proxy-helper if all
 requisites are found
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210525104648.4060904-1-philmd@redhat.com>
 <20210525104648.4060904-2-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d8f7c01c-7dc8-1ba2-d29c-6babf75f137e@linaro.org>
Date: Tue, 25 May 2021 16:19:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210525104648.4060904-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 3:46 AM, Philippe Mathieu-Daudé wrote:
> We first set have_virtfs_proxy_helper depending on have_virtfs,
> then update have_virtfs... While this might work, it is not clear
> when looking at the code logic. Move the have_virtfs_proxy_helper
> assignation*after*  updating have_virtfs to make it obvious.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   meson.build | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

