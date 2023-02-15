Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E206983EB
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 19:57:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSMxj-00077A-UG; Wed, 15 Feb 2023 13:57:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSMxh-00075w-U5
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:57:01 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSMxg-0007s5-50
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:57:01 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 w20-20020a17090a8a1400b00233d7314c1cso3195993pjn.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 10:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2ty6Go6imRL7ziN4P5mkkosy0GQ2+LjZUs26ivjwRjQ=;
 b=U2vhKVdoN9iFSmXrjkqJK4FePEI44f52W/rAgGrDQp6w+nrkZoqao9XDa9j+nD15af
 JC7OJhnjRJwCoiNJu0lMjxjsJmilNNmUkSlqSxeeCcJiYbDFPXDdb0rR2nS5jm8AZM5B
 QdM4UdUJIRBFUygs2mdtCgjOqZkwe7QasHkjVf16iFsg+1/2CvbooULsEnlBwgsqf+ph
 EQiAGIt3mhpwSDXOoodsuyeLM0jewBsROA1dVbKygIEOw++TEL/y8sfS8yQKSKgGDCNS
 bltQ7wPrJ7eecjBX56Q/r5QIGpi96kyGSJUhrNiBWqe2+5BQlnM/LoFGGS48SAA7xaKs
 5JZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2ty6Go6imRL7ziN4P5mkkosy0GQ2+LjZUs26ivjwRjQ=;
 b=pWlG95jG/v8y3h8ynVCPNQq2/CviOtsyvNmKkVlEBvYInDvuin5b7YdPpPGcd3FF9M
 5qSq3lfZbpgr8IkjS9e/mPAYjSloFoTylaPGvVaUUpvftwo5moP7HPA591xGGwD5GZu2
 PSfCm8yNzzMRglVVtUf1dX+o3wDur0b6jEv/XVECLWi2iHJJDt4yZmyNAxTPgyRYO3vC
 B26WrmeuVLGfMjhr/Eecu7J5PSK07HMeXpVRkbK3G5CyEnQKJrr1jXB4NehvFzZ7ueDS
 yM1d7WcBEahHTUCLnjaGVhqEJX5cbY48hKlydcyS6PetM7zDnj1LzIN38XJXXGu11KKO
 2T5A==
X-Gm-Message-State: AO0yUKWT9jTQlg8QpD4FRxji1FkXrTzqqp6C89Ji22RNIFtjDBmgP7v4
 NkcOfMFnRq6TmDw1fT6FpaxClw==
X-Google-Smtp-Source: AK7set+unld6jrOIAxw5cbdGNozT2yxZY3NSokKlDP7l6oTF0+nwdImKRxNhmj05ZwCJf5FuXI618g==
X-Received: by 2002:a17:903:182:b0:19a:723a:832f with SMTP id
 z2-20020a170903018200b0019a723a832fmr4817950plg.7.1676487418478; 
 Wed, 15 Feb 2023 10:56:58 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 w14-20020a170902a70e00b0018997f6fc88sm12496392plq.34.2023.02.15.10.56.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 10:56:57 -0800 (PST)
Message-ID: <59eff7cc-cddc-bd5a-9d96-284172a515ba@linaro.org>
Date: Wed, 15 Feb 2023 08:56:52 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/5] hw/timer/i8254: Factor i8254_pit_create() out and
 document
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Marcelo Tosatti <mtosatti@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230215174353.37097-1-philmd@linaro.org>
 <20230215174353.37097-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215174353.37097-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/15/23 07:43, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/timer/i8254.c         | 16 ++++++++++++++++
>   include/hw/timer/i8254.h | 24 +++++++++++++-----------
>   2 files changed, 29 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

