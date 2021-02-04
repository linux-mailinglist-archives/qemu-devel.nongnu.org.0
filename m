Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B137730FCB2
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:28:06 +0100 (CET)
Received: from localhost ([::1]:51180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7kIP-0006Ut-Co
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:28:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7jmH-0001bi-CX
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:54:55 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:33882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7jmF-0004NA-85
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:54:53 -0500
Received: by mail-pj1-x102c.google.com with SMTP id my11so5469532pjb.1
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 10:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BfJehlSta+hp0R2SImPBG6xERlpT4B8ZSwFuh35geo0=;
 b=cAC6G8hG56PRPyjAcl0zEXGDX4lJJsn6MbrdA/98poJbTEP+jXX17k0JmXB3tR0jVs
 LdDQZwdiciY0K0zWuuZLMqk6s3y5TT29e2MWAS0HT2OHNgxGs7M7qnSHLzELEZQFw/PM
 Et2PqS6aGb/S6sR9Nue1Z1UDiCb+U7NJNNK7UiwYEyoECEgAOU2btQvdrhu2OarEiH8I
 X+kKGQ8PXdtPB9snBxoWyBYNfkFZqLZqglbOsX68UYaEat2nH5zCOj9z02nTC3PoaKM6
 BsAweugry+6YVOJUX4g/fpw7RFuzUGyoSsVuIp7PoxvuNzS9w3NIc0r6c63aEPvKzMpQ
 zMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BfJehlSta+hp0R2SImPBG6xERlpT4B8ZSwFuh35geo0=;
 b=hwWRE4RugKS/TtRRFUH63kKgmRprY5V4mmdmL+hNi8f8XHD4YHpkrE4+FLiCEFus7h
 NQmFcE18CwRBT0738Xcn8XZJzYbXwbwrSf1ixypXPrYa9AA0Obgj8frTRhpDFU6nIr+Z
 os5DcwDkKi6ok1HcfkA6+spVWuY+mpl+1UMRYvfpwrWt9G6oFvfkNgyqFg6kHnBxQm76
 GY4kOqUqTu4HnSV9/7xyXVDIYiGOptfAMQZBeyAcFhrMB3sc5v5upuhvQVJYEvbw/DK6
 krzhu8pZ88DjjN7KJhULt5AGZ8gk5x0GPoNXXN6vnr3RwmgJIHBwFmgf9gh5bPTAgY/x
 tpMg==
X-Gm-Message-State: AOAM531xiYHdFU/2EzYVHBmdv+LPxZKW3fjc2xPWaE836p/fbYneReRO
 C/gHMrlp19LNRSFfO1Mh8IovOg==
X-Google-Smtp-Source: ABdhPJxPVO81LWD+CT5dWV/jklHzWHxAo3YeoNlXCCdot0ku9Fg/fbTZKFQkyBB7Hn//TeT6eKiuOg==
X-Received: by 2002:a17:902:a58b:b029:e1:1040:36fb with SMTP id
 az11-20020a170902a58bb02900e1104036fbmr561888plb.0.1612464889764; 
 Thu, 04 Feb 2021 10:54:49 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id i25sm7178988pgb.33.2021.02.04.10.54.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 10:54:49 -0800 (PST)
Subject: Re: [PATCH] tcg/s390: Fix compare instruction from extended-immediate
 facility
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210204182902.1742826-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3328ae06-976f-5240-a538-6156cdbc71dc@linaro.org>
Date: Thu, 4 Feb 2021 08:54:45 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210204182902.1742826-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.182,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, "Richard W . M . Jones" <rjones@redhat.com>,
 qemu-s390x@nongnu.org, Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 8:29 AM, Philippe Mathieu-Daudé wrote:
> The code is currently comparing c2 to the type promotion of
> uint32_t and int32_t. That is, the conversion rules are as:
> 
>   (common_type) c2 == (common_type) (uint32_t)
>                         (is_unsigned
>                         ? (uint32_t)c2
>                         : (uint32_t)(int32_t)c2)
> 
> In the signed case we lose the desired sign extensions because
> of the argument promotion rules of the ternary operator.
> 
> Solve the problem by doing the round-trip parsing through the
> intermediate type and back to the desired common type (all at
> one expression).
> 
> Fixes: a534bb15f30 ("tcg/s390: Use constant pool for cmpi")
> Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
> Reported-by: Richard W.M. Jones <rjones@redhat.com>
> Suggested-by: David Hildenbrand <david@redhat.com>
> Suggested-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  tcg/s390/tcg-target.c.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

A most excellent catch, thanks.  Queued.


r~

