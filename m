Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21663B0553
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 23:54:39 +0200 (CEST)
Received: from localhost ([::1]:56594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8AZR-0005OL-VW
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 17:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34630)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i8AXt-0004kt-2p
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 17:53:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i8AXp-0004kM-BX
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 17:52:59 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:44634)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i8AXp-0004h3-5G
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 17:52:57 -0400
Received: by mail-qk1-x741.google.com with SMTP id i78so22387412qke.11
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 14:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zG9g+otp1810h2pCrRvj+di+YaNOEhhA9k9s635E/kE=;
 b=c18MYXCSS/P1U50i4jl5iKoHn33CO3P1zhyo9zYHbjDeMrxKavXW4jl7/Zf1VxJsor
 kdkHzncDt3NnayTjj4ka2KvWsU6TiHXdv4bsR59IWbqB6YlkGArj7DHTWIEZ82aT+EpH
 vjg7jwQtBGLD0D+BG7RmD9/jfPgreehwj6bUtIAlFuEXcaVWfWaqA2k+pB1iU4E44i5R
 fGEzAbTUiRXLDZLQWyMfHUXc3BV15Hdc6+K2fBumQarDNNbxGVtLn7CAobEm4fVD4iGy
 a5lWICHc9ntGSzNhGIEFHEiwonad7fMh3tMKDKmdT1TT7vPFNoyJhStsKxE2uZKnblm+
 DXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zG9g+otp1810h2pCrRvj+di+YaNOEhhA9k9s635E/kE=;
 b=Gkj2e/sLbo8PMhLpYEoZq6CK0wmRZbYURZWTnpzuKUaAkrCnlzgY/VuUHWvosKSa+m
 87t1DVQOZbotjeQnTM71jvhpBSNj8hHw9wzFezoYnVKdrbBdAy3jUhT7ln21cQEoR6sD
 XO/Y6XRCyII58egAbhvQgYC0RpLFNZ5ZnKDSqIOY9tLHvBEY8Qtcfa0ECw4H62Y8iQWW
 4Th50rK2n62zEAE5VwXHrc2tJLNWWspwGm2EnmaFuFmNO5a6ztnd4nIENT2n+sNfT8s2
 67UrSCO1NzyGFosWVb1yBt+IhiXrtvtfVZWmJis9LOf1NHLFXZqTwbE3FDx0Ff/Di6vQ
 NOlw==
X-Gm-Message-State: APjAAAUeCQlal2dQbkLvbGjbEBF5Y/y9VLSMliJJar/E7MluhpjtnbwC
 5JTjX2EsgE7fOnY64zegFqxhXg==
X-Google-Smtp-Source: APXvYqxjVmZPRdBMkVjuo+mQWlASS9g6vdg3ESNZDj8AuyRqo9eDSPfDsMR1t0JeDDQZxQbObLvk8w==
X-Received: by 2002:a37:4b06:: with SMTP id y6mr37310624qka.395.1568238773507; 
 Wed, 11 Sep 2019 14:52:53 -0700 (PDT)
Received: from [172.20.5.51] ([67.69.50.154])
 by smtp.gmail.com with ESMTPSA id n128sm9837574qkf.34.2019.09.11.14.52.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Sep 2019 14:52:52 -0700 (PDT)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20190906075750.14791-1-david@redhat.com>
 <20190906075750.14791-27-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0427a6c6-b043-3d09-6c09-d74fadcac96c@linaro.org>
Date: Wed, 11 Sep 2019 17:52:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906075750.14791-27-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::741
Subject: Re: [Qemu-devel] [PATCH v2 26/28] s390x/tcg: MVST: Fault-safe
 handling
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
Cc: Florian Weimer <fweimer@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefano Brivio <sbrivio@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/6/19 3:57 AM, David Hildenbrand wrote:
> +    /*
> +     * Our access should not exceed single pages, as we must not report access
> +     * exceptions exceeding the actually copied range (which we don't know at
> +     * this point). We might over-indicate watchpoints within the pages
> +     * (if we ever care, we have to limit processing to a single byte).
> +     */
> +    srca = access_prepare(env, s, len, MMU_DATA_LOAD, ra);
> +    desta = access_prepare(env, d, len, MMU_DATA_STORE, ra);
> +    for (i = 0; i < len; i++) {
> +        const uint8_t v = access_get_byte(env, &srca, i, ra);
> +
> +        access_set_byte(env, &desta, i, v, ra);
>          if (v == c) {
> -            set_address_zero(env, r1, d + len);
> +            set_address_zero(env, r1, d + i);
>              return 1;
>          }

Worth using memchr + memmove w/ nondestructive overlap?

That said,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

