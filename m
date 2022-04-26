Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A33D7510AC0
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 22:52:14 +0200 (CEST)
Received: from localhost ([::1]:47616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njSAP-0002J3-8L
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 16:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njS5P-0003tL-AL
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:47:03 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:39902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njS5N-0004UU-28
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:47:03 -0400
Received: by mail-pf1-x42c.google.com with SMTP id y38so3279054pfa.6
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 13:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jUXS8BxLrw0XSu2EexWbr3W51XIoBU9KSMHDqcIO1Ss=;
 b=e/tpD/W3sG+zu9mgrbJLsHZVIdooSps28G+NpjhKL1z+zGniv0+kuXBkbJXl7WAi4o
 c3TPhN3xf/nJkuaguuTtb0/wdkeURoVD+rj1x44cpYypugiS5O1Kv+GqXdBObmw9nqbK
 yRskbWlNXaTyxFVHb5QuGgqE8wZ61RC0bzg/5EC43KPKvb4xp6bWRGFogZpQyRD180xM
 aIvSw1LZfruxGvCDGcvBpLPJC8xvI1/pY4Mmgzr/XqEXFRu4gVE584Y/yyDnf/XXpLoW
 TKrMoBuRqaLx9jAmeoz9BARU5mooSBT0bS+B6+kTlLeD9P8Yfv9dqUx+PSEY0R8ZOWqz
 fE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jUXS8BxLrw0XSu2EexWbr3W51XIoBU9KSMHDqcIO1Ss=;
 b=iBNXVBidyreSdt0c60UMnzRGtQ4ysYAor2OGOCJXgCKvmxngYxBhFOZO5STi+hMI3b
 eQN4OhcauhkXyE1rdGDzeUCOLG4dQQIMW1/B/HHAImPzSgXN8PX4R2pYoDQ2w3uvUwX+
 uD9QRNG0FaoSUSeB3N0eAaqBFfjKPKEwc6nJ1Z2xzsgd9L3LRd7nXKPt12K2wpUFmtZk
 SR83d2jXckGOoZsCR/iZfdOko2Qw14ON0lBf+Twd0ivr1bIMJGUWT7F4uUYiM/MdUKZC
 es/rKbk4buwfEeyBimG440NTA/FzlnfXED3AB77++FMCV/r7oEmc5L9rPBYx5e59wNhV
 r/ig==
X-Gm-Message-State: AOAM532L8gbpgRKGEB+oe5Nsf6VQFS7bP2Og69jpCvXgokqL9+on3xHa
 wn/ZAHVVCo8ut9zqno4TVjGQpA==
X-Google-Smtp-Source: ABdhPJwwo3ZbukCNDcLsrREY1s13HspdZkUTtMd3/LVXjaKdSt1hNu+7Z+ovVgf2P/5kx69AwQ4S0g==
X-Received: by 2002:a63:8c1a:0:b0:3ab:35a9:5f8f with SMTP id
 m26-20020a638c1a000000b003ab35a95f8fmr10417842pgd.598.1651006018675; 
 Tue, 26 Apr 2022 13:46:58 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 h124-20020a62de82000000b0050d3020bda0sm10825347pfg.195.2022.04.26.13.46.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 13:46:58 -0700 (PDT)
Message-ID: <3cd852ae-7c9b-da81-4d51-8e6900754ef5@linaro.org>
Date: Tue, 26 Apr 2022 13:46:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 02/26] Use QEMU_SANITIZE_ADDRESS
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
 <20220426092715.3931705-3-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220426092715.3931705-3-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "open list:Floppy" <qemu-block@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/22 02:26, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   tests/qtest/fdc-test.c    | 2 +-
>   util/coroutine-ucontext.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

