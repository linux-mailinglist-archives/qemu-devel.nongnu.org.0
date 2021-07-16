Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A1D3CBABC
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 18:49:51 +0200 (CEST)
Received: from localhost ([::1]:34644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4R26-0000DS-7T
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 12:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4R1C-0007sv-Uq
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 12:48:54 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:43552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4R1A-00015K-Vk
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 12:48:54 -0400
Received: by mail-pl1-x633.google.com with SMTP id b12so5580848plh.10
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 09:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=dRFQz5gAi/aA80nNbVcSDOE9q3Ebd/7xPuH+q8KFD3k=;
 b=dDZR46WbT2k8l06IF0iGQPpYSZXAy2NHvqUbY7FGa44+Ijdry+9T9iQVlaD08d48qG
 OW1kJBQl0vHLSdppnH9dcKst8a4Dkg3K5L8YQM4J/vEkWJCpD0QiFMWH87fvoMiS0XAF
 Nq01FBRqxbJZxBFJe1TmG7cjOvo2trGC/SNzzMqxijrhfNHbKHCdci02PpYHumqzJCYd
 O74w/lsnMbtJztyaWJwcOmGh9NLj0ku8xflCRA2X+FA/E1y/pxpdChtQatb4033AKOYY
 KdtpQNsbrnqucnJtqxOP/Bf13ZekJv0zzsEwGXrS8fWdP4LtuhxoGYmSey91x6fZDI7c
 3K8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dRFQz5gAi/aA80nNbVcSDOE9q3Ebd/7xPuH+q8KFD3k=;
 b=q/oLdiwMj7kQo67w/ocI3astIMXvzDvg705mNKC+5M+Bd9lAPTIylrzWdc7gJ5TGUg
 taH17vyJjkYsZrrYU8nFms5r82e0wBadBgj/P2LQITp9Gjeklb6RsbGE9dQmTUVMi9Qt
 KWTLhhPZSsY/YheR1XrqFHFFdmbHhc3me/VuhG/baqXxo9KG9ujKgxQrfJS2ctt/sOW0
 Xaqg1SIlhxG0tp5v/+aqbcX8jWJ9AlmSdTt1RjBAKRatoRE1GB3IxtBrMM6w/9MxHl60
 N/nv/Kpv9M5Sq+sgjewHeE3+7KSyazpdmKXkXgHvNQDUuZM4rGRj4qUfDx1jqUwfIUcF
 dUgQ==
X-Gm-Message-State: AOAM533NkjsdEd0mOOBP/rzzbdONZo40SfugzYZ7wuqSkn1DdE/u19J9
 kshEMndclqbBSYfseJ36Puy0I8NZ2R6H3w==
X-Google-Smtp-Source: ABdhPJyUxQmH62TUGMkJ4ox7rqFwTwBzpZpY8f1ur3O+1tliaGPBSxHnBelCHQk9SImbPFOsm/aAFQ==
X-Received: by 2002:a17:902:fe87:b029:12a:ef40:57a2 with SMTP id
 x7-20020a170902fe87b029012aef4057a2mr8396971plm.81.1626454131486; 
 Fri, 16 Jul 2021 09:48:51 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x10sm10888638pfr.150.2021.07.16.09.48.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 09:48:51 -0700 (PDT)
Subject: Re: [PATCH for-6.2 09/34] target/arm: Factor out mve_eci_mask()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c05e1d38-f356-a842-871b-38db054d4671@linaro.org>
Date: Fri, 16 Jul 2021 09:48:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 6:37 AM, Peter Maydell wrote:
> In some situations we need a mask telling us which parts of the
> vector correspond to beats that are not being executed because of
> ECI, separately from the combined "which bytes are predicated away"
> mask.  Factor this mask calculation out of mve_element_mask() into
> its own function.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/mve_helper.c | 58 ++++++++++++++++++++++++-----------------
>   1 file changed, 34 insertions(+), 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

