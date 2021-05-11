Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F004437AD0D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 19:24:33 +0200 (CEST)
Received: from localhost ([::1]:39582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgW7U-0001Mw-Hb
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 13:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgW3Q-0006tv-5d
 for qemu-devel@nongnu.org; Tue, 11 May 2021 13:20:20 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:41911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgW3O-0000IU-FG
 for qemu-devel@nongnu.org; Tue, 11 May 2021 13:20:19 -0400
Received: by mail-oi1-x22c.google.com with SMTP id c3so19646598oic.8
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 10:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CaE9gn3AVaxncY51ngIkNIadUHwWN1jk8eoUKCRdeDg=;
 b=PJMd4Pz3pWx3h2YO/LIyBuj6cX3HsiFmm/sJxdmVoKmb6qpgOIgAuEuI4hFFUJA/HN
 Y1BUuTAhTLNF8yC6zkmNdswvpwNh6nPT97RYAHjw7WHaxKYHfdX3B4G+pZ66fdObu6B5
 DTDlXFdxNb9Rem2/NCp58AYFVkLC9sJvAVDeme5S9FkEFgR5jUnQO4X4oWzbj+F/5wsM
 tOuDNJs76alSWXI6XgjDmnLOBaRfEWtBF8g7X9hLxuKX7Wyy/mPl9aD25vIY+oNWkuad
 vNNuS36BBNOSKo8iE8QFtsUcinEb+PKz0cCU/xrgKK65Kge+WN2gSbFeP5K+h7wUdryz
 lLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CaE9gn3AVaxncY51ngIkNIadUHwWN1jk8eoUKCRdeDg=;
 b=C4yIeQIUUIQItLuVhOJjzZTdO9Gp42ztIxwibuZYiVqijQykN2q0KEDtVAmUDm28Ok
 rHTF7aWwBN18qFTzD0bbwqzao6S9YqknpZXM0CtieMT4C87g6YaUjAPqm1mI6VYb7W3o
 20Tcd2/ikfWbOj31vVimsrUE78GmGVq/jwFe6xBPoMsBMf1fdSJaE1KKM1699EVKFy7v
 E7Ucv8vBJJ7uZOcEqxr2ZmYWf0QIOFrbCP1/SC3GVlT7NEVxYvcaXGNY/I4YP2UHl1YL
 RuTmogA6s+388rnrFnCo9mUiGKHQ0VN8p2JQbNR40Xzeb8lZyjgsppwfk3bGyXBcweAw
 8m7g==
X-Gm-Message-State: AOAM533AFinP5Yzz8K7PvHMgWE48dUryzU551DrCmmIG3qgg18ZBlMyK
 LQ6yFjgsK6Z01p4CcoDM8//UKg==
X-Google-Smtp-Source: ABdhPJy9DyRUBmVYDVcG0kaPZWQigWgl6+bi67LfUZnGL9RE+D8ARHjcWiMDZ/DJvufyvDezBOHG/Q==
X-Received: by 2002:aca:497:: with SMTP id 145mr9844434oie.108.1620753616909; 
 Tue, 11 May 2021 10:20:16 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id q7sm2440057otf.10.2021.05.11.10.20.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 10:20:16 -0700 (PDT)
Subject: Re: [PATCH v6 01/82] target/arm: Add ID_AA64ZFR0 fields and
 isar_feature_aa64_sve2
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-2-richard.henderson@linaro.org>
 <CAFEAcA8ovUnwOkvHWC8G-Dd38JUgpssj9ttDqi-+aCQd_1VkOQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <389776c3-6e24-92b9-253d-5a014a29e339@linaro.org>
Date: Tue, 11 May 2021 12:20:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8ovUnwOkvHWC8G-Dd38JUgpssj9ttDqi-+aCQd_1VkOQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 2:55 AM, Peter Maydell wrote:
> This code is earlier in the function than the place where we
> update ahcf->isar to set the "SVE supported bits":
> 
>      /* Add feature bits that can't appear until after VCPU init. */
>      if (sve_supported) {
>          t = ahcf->isar.id_aa64pfr0;
>          t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
>          ahcf->isar.id_aa64pfr0 = t;
>      }
> 
> so won't the condition here be always false ?

Good catch, thanks.
I guess I can test this running kvm inside tcg.


r~

