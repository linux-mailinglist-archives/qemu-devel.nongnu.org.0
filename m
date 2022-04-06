Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D6D4F60BE
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 16:07:31 +0200 (CEST)
Received: from localhost ([::1]:37596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc6Jl-0006qo-UK
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 10:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc6IC-0004hJ-BN
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 10:05:53 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:40904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc6I9-0006xC-Jz
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 10:05:52 -0400
Received: by mail-qt1-x829.google.com with SMTP id i4so4395787qti.7
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 07:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=J3uV/QbvectnmlG0Lw5iMlIIjPNUu+gU46IN+EVMLws=;
 b=fedx6F4d6xB62ujw+U8xCdmmy5NYwFkNnYn6Ja928EIf1LEHNxo1w6jNxXzi+FhHby
 0mFHEw0jKEQSbC0CQBDvhMCsgAjyVcFCAENJ+SdH3har24nEqPflC1tXvtY8YauS+mHi
 Y9y2yedP0E3JQMyZvdWxRklVY9J+znXIlAigVqXirUGaxZSGI9X9IVrx6uuuaJH2RSjj
 vbISIt+McEw+pB3PJveF6FfLYQNqTpC57dxSYquyOkJb8T8lQypHSjQoAtBhEz27+0xt
 1eRCB/vRH6qlVgoCeWuWX0yOBJwkSXAMaCVS+4pQNM9rQpl772rOHGx5SeZwYyuFOCCn
 Hv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=J3uV/QbvectnmlG0Lw5iMlIIjPNUu+gU46IN+EVMLws=;
 b=yE3lYHZMDvuDKJEB5kxPfWVxh34o+NBJx+73xd+kJHEvyyKOxaUaPOHI6HtEmlsoxq
 TljzcD6z8R+IStbLrbq3MjAq5ZUy3BvBUyuS/oIT+j/OXyof4OPcQVtIV/SOQPIoUjS5
 P10y+0hDVxmPMlh+inCLPL97dXKDz5jjhBJmFyA2FWWKzxqWaQX/n6xGeHHnn1LkAvmG
 YaD/dfWMGWYi0+SWE7o/Myjz6jnzdckMp+hHmefqFBFXGAoA96IRfqpJ4L5wFvIzpfOx
 eYeHoU5gTfTGhT+Hyzo2CcN8PTaMbFwkwzdifOBXFWDa6Kn7fUkQW3KKpymbNIKGnNUu
 bDeg==
X-Gm-Message-State: AOAM530Cok1Q2NsCN/+qoAsCk3C9FAKzfLk28eqPAWYV26F5Pqz/eOnj
 JwL2mzrpWcFS2NydoATaRvPoGA==
X-Google-Smtp-Source: ABdhPJx7RhMoX5MX4z3hKTKylPki2K4l88VD3+FgJ7/6vWcz0SnyuvdumYaH7Yb2ONgaoWDTGOdFVQ==
X-Received: by 2002:a05:622a:513:b0:2eb:871f:cd66 with SMTP id
 l19-20020a05622a051300b002eb871fcd66mr7568216qtx.434.1649253948536; 
 Wed, 06 Apr 2022 07:05:48 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 s13-20020a05620a0bcd00b0067afe7dd3ffsm10856036qki.49.2022.04.06.07.05.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 07:05:46 -0700 (PDT)
Message-ID: <24ff4e51-dcaa-37bb-dd33-04821bf48023@linaro.org>
Date: Wed, 6 Apr 2022 09:05:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 17/18] hw/arm/exynos4210: Put combiners into state
 struct
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/4/22 10:46, Peter Maydell wrote:
> Switch the creation of the combiner devices to the new-style
> "embedded in state struct" approach, so we can easily refer
> to the object elsewhere during realize.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/exynos4210.h           |  3 ++
>   include/hw/intc/exynos4210_combiner.h | 57 +++++++++++++++++++++++++++
>   hw/arm/exynos4210.c                   | 20 +++++-----
>   hw/intc/exynos4210_combiner.c         | 31 +--------------
>   4 files changed, 72 insertions(+), 39 deletions(-)
>   create mode 100644 include/hw/intc/exynos4210_combiner.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

