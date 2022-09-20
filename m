Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6EC5BDAFC
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 05:48:09 +0200 (CEST)
Received: from localhost ([::1]:38070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaUEy-0005Yx-Bp
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 23:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oaUDY-00048Y-Jm
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 23:46:40 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:35680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oaUDW-0008NR-7C
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 23:46:40 -0400
Received: by mail-ed1-x52d.google.com with SMTP id 29so2003359edv.2
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 20:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=WAM8wl5Wr+kMTKMLaQOJGn7dYKjo/rEuff9pJMzWhqk=;
 b=Zkztre8NqYNuDojJUsvnCaiZYypwG/xMwaMjl3CS4mnt3VLsjZ05Oc/o+VBBfZ+vzX
 DInVRocF2zN4Z+C931tEjVKmPL38O+mosKPHf7eFo3GjCwB3wv+oriVqrypESbETsTJj
 crRf6c+52p+IufkpKhbGA1zvgIW4/uDmKJYEm5crEdQ0Z+ehkfNZ6mNepsxbZP6/H+2j
 2HQhcdyRRchNslOJ2CdhQiYJ+cO2LMjunDpPvxnLg9YnuGNcbYWlBFn/gyu2qDgq+Dfo
 ng71qOo3/SsZ/Ik2gM8AJ4/PUUiTzF3T7f9LiuRqtB+DgB/ZBJxWV4YkS0dcsWZX7dYy
 kJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=WAM8wl5Wr+kMTKMLaQOJGn7dYKjo/rEuff9pJMzWhqk=;
 b=a77c5dbg4pqmSUAfHFLjcqzGM3qza587wiKrWAZIIeQ2W2FiAWdeCo6dtXehnkeLex
 2HQGb3lAtr2vYsdHWUDwr7gvLWtPc7mJkCt7ieTXpIuRSTTdXrLYXP178a+gHMNMyjYI
 irLF4/RYoRy/gzGKWVYyyewOE0vLt8mjuP/tjfhr7+DDQxJN45e8gGijRx/Zcp7VvgKL
 sIJvVMIPCMcNOEshaSSiFg+vFHtx7+ZUYeKhIZdJA6S4bWpRMqTAbRKZmS+B+MSroMI+
 SKHHl953QNaEcjmTuCYs5C1JsmvqVQVaB1+euXKKCCruMFBC9hJQzxZoBYynr6bEq48B
 LwmA==
X-Gm-Message-State: ACrzQf0MUkm38iXtqgpLSLo7P+b4S6ajx0QZfbfeYqbJlvaGfwYTNP7t
 4UuHSUtgfyus2upkXqmYotK1Zg==
X-Google-Smtp-Source: AMsMyM5IYNa0NyeCO0qvfN6bn89FujVFoY2ZxLOZBpdWlc2XjhDNvQSSUN0bdQPdAKxp4+r4DTgrVA==
X-Received: by 2002:a05:6402:3596:b0:450:c4d9:a04b with SMTP id
 y22-20020a056402359600b00450c4d9a04bmr18387781edc.218.1663645596061; 
 Mon, 19 Sep 2022 20:46:36 -0700 (PDT)
Received: from [192.168.4.112] (h-213.61.242.164.host.de.colt.net.
 [213.61.242.164]) by smtp.gmail.com with ESMTPSA id
 j23-20020aa7de97000000b0044e9e5ce396sm356441edv.95.2022.09.19.20.46.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 20:46:35 -0700 (PDT)
Message-ID: <90ae9a51-07be-d12a-99bf-d829584805d9@linaro.org>
Date: Tue, 20 Sep 2022 05:46:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/i386: correctly mask SSE4a bit indices in register
 operands
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220918071807.539664-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220918071807.539664-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.952,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/18/22 09:18, Paolo Bonzini wrote:
> SSE4a instructions EXTRQ and INSERTQ have two bit index operands, that can be
> immediates or taken from an XMM register.  In both cases, the fields are
> 6-bit wide and the top two bits in the byte are ignored.  translate.c is
> doing that correctly for the immediate case, but not for the XMM case, so
> fix it.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   target/i386/ops_sse.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

But these aren't SSE4a, they're AMD New Media instructions, which was a bit confusing.


r~

