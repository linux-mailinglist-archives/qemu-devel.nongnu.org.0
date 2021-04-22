Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 749503676DE
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 03:36:01 +0200 (CEST)
Received: from localhost ([::1]:44342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZOG8-00058j-2I
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 21:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZOED-0004W2-Ut
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 21:34:01 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:38647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZOEC-00018z-Dn
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 21:34:01 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 f11-20020a17090a638bb02901524d3a3d48so78134pjj.3
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 18:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mj/x+BsLcUMfijj10XaQ7IQW67uLpOTti6YMCpBR7CI=;
 b=fNk9U4F9fEXXfgieM/GzdY4H7Ii/RZi+/XIL5jK82v7NbBdNG2OU97Bf+/1kU0kmio
 tjxrg7pP9n6IFqkaN5M60dIvKoFjQPOJhDW9fqOm2bNxROmQEeKjBBbHrJIw/lFtoNyt
 Ld8bpBKe/1NIv3PDtEyngIVkfUkxurURSqooUUqHt91qjH6m7fv/WNyVC/fU8cAZsLLI
 LGiUwibu+mQmVVjSX413P3W63OCeyxLV6mUpKJBf4uEznXXZxZFMkEDrqAWptvn/uU+P
 5DvfFTn8UoPlwSWEtCaqta3R7z8wksv6iS7NgJrfxmE2clj9dZYcmmypnlC6cAbWsAM8
 OE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mj/x+BsLcUMfijj10XaQ7IQW67uLpOTti6YMCpBR7CI=;
 b=B7fQRwJV6k3QGIj/hoJYlRjhA0wxn+fbGrAnLzSLpDh3BWxUkBplUXuGoljhrvmmXR
 xLCD5qeEnvET4RNRAX2a7DuEiXrnbjku8Qkud14HYBbksaBQXhyv3qpzl0UpiCE7KMKf
 u51pjQpyxpG3rAuErQtYIvMD136OhbA+frOumc/g02wJGTLLA3VotoSk9gNgnUVtJXwO
 XJWtoeG818rZASNGBfd+wzlLs+CUUabp3VnskiO1z5xX/Bezlkc786k5RQvMnRfHcfvc
 id/XFttdMsxLWbzS0uuAYlvlQEHNNerLoOuGP8D4MUTJ/d5r5zIHbRsXKP8k2LJYIg3I
 5NAg==
X-Gm-Message-State: AOAM530m65DBBOgnYBOOMIvZMufLyMDzeEumboxhaA1iyMLvJyIABs68
 +KBHTMkJeQ7Tf+yTruphA5+8mQ==
X-Google-Smtp-Source: ABdhPJwtojAqzXSIki9ePbjIkYm49TY7vCoysVg+ZwShb3Eh3TWY9LOcSM8I9H7nAv9QljdmO+SWeA==
X-Received: by 2002:a17:90a:d983:: with SMTP id
 d3mr1126964pjv.99.1619055238147; 
 Wed, 21 Apr 2021 18:33:58 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id e190sm411134pfe.3.2021.04.21.18.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 18:33:57 -0700 (PDT)
Subject: Re: [RFC PATCH v2 1/7] hw/misc: Add device to help managing aliased
 memory regions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210419094329.1402767-1-f4bug@amsat.org>
 <20210419094329.1402767-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2b3a6aec-aef9-6f31-1537-310757d6aa83@linaro.org>
Date: Wed, 21 Apr 2021 18:33:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210419094329.1402767-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Peter Xu <peterx@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 2:43 AM, Philippe Mathieu-Daudé wrote:
> Not really RFC, simply that I'v to add the technical description,
> but I'd like to know if there could be a possibility to not accept
> this device (because I missed something) before keeping working on
> it. So far it is only used in hobbyist boards.
> 
> Cc: Peter Xu<peterx@redhat.com>
> Cc: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   include/hw/misc/aliased_region.h |  87 ++++++++++++++++++++
>   hw/misc/aliased_region.c         | 132 +++++++++++++++++++++++++++++++
>   MAINTAINERS                      |   6 ++
>   hw/misc/Kconfig                  |   3 +
>   hw/misc/meson.build              |   1 +
>   5 files changed, 229 insertions(+)
>   create mode 100644 include/hw/misc/aliased_region.h
>   create mode 100644 hw/misc/aliased_region.c

Looks reasonable to me.


> +    subregion_bits = 64 - clz64(s->span_size - 1);
> +    s->mem.count = s->region_size >> subregion_bits;
> +    assert(s->mem.count > 1);
> +    subregion_size = 1ULL << subregion_bits;

So... subregion_size = pow2floor(s->span_size)?

Why use a floor-ish computation here and pow2ceil later in aliased_mr_realize? 
  Why use either floor or ceil as opposed to asserting that the size is in fact 
a power of 2?  Why must the region be a power of 2, as opposed to e.g. a 
multiple of page_size?  Or just the most basic requirement that region_size be 
a multiple of span_size?


r~

