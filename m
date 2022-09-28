Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 432185EE250
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 18:54:24 +0200 (CEST)
Received: from localhost ([::1]:39656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odaKF-0001kh-9C
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 12:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odZgC-0005v1-6Z
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:13:01 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:35641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odZgA-0001tu-LN
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:12:59 -0400
Received: by mail-pg1-x530.google.com with SMTP id u69so12654138pgd.2
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 09:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=DDSKL+ClTuDbk97W0FKGPlQC0kDFN1JPAb2dbOqA5jE=;
 b=WKfMpioOWPzyBjI+sa6b5al3QmPsLNHT3ocwxTKhDTnBahtr8ePL9KwxEPPZQtuTU3
 OeOBa+rXVLg7A8BLEARyqdlVWynyBTBUlqaH24aTm8yzCZuoiYQKB1UE5ZHH2ekpiJ4i
 mrz4cyMQ1uJuWOQbGGX1Vw0+u0cws3PGg/B77tGf8qyvuihoj/3RpMbWpJ36VxNUGYrM
 WTARum4lATQ2f5aNPq3pLbQqitvhA0XZfuYbRhpQksXKMQ9aeBfUiX1dtdvt4YnVKRRZ
 wHaopeSvkpXflOKXJzQYmRqE63sxdN9yOPumSy2y0rJUE8VJ/6OPbVbpf1oIG1vJWFy3
 5rhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=DDSKL+ClTuDbk97W0FKGPlQC0kDFN1JPAb2dbOqA5jE=;
 b=U+31J90I91euutIiCR58X15PGQ/LSASsuVq1pdUTvs8AKLp+l1g+tWKWMOJWHM4Yso
 ygScFVE9zgslsUTDDBZ+iCY38A1Lkrvy4CJ+qgdFOkn5x2UaafQnhHi6cXkKElGvMueX
 Ou+xUM6nKde0wrXkQsTEvoYAvnVoaoTe/HkDKuvYqyzIAv5lw36kROy/7QIi3seDxlHl
 ITD8BMy1h1Xrj+FrP3QN5krKFy/N4um6p3icuzjzSfOWkAZHGOSQgguPB6B5Yudo5TmC
 TSoS6hPWbakebjDZJ5Z28WQjyqUQnMgFFWPN1yTH7wJ1IVFFggNUVtM+g7UBZVtYz9T0
 kUTQ==
X-Gm-Message-State: ACrzQf1jI9ENuyjEOFFlMSASyBdizkL4/w7tHL8wJzCpXafMWkWTsDIw
 uZL7A6A8Ndlr1nez551JpJNTXA==
X-Google-Smtp-Source: AMsMyM7OSp9nHvNi3kTnb6pVSPWJ5aRSM3GB+T4l/ZaKjld+e6OwqpO9YfEUAiNCOtVVMp+lgiWqMg==
X-Received: by 2002:a63:4805:0:b0:43b:e1c9:32af with SMTP id
 v5-20020a634805000000b0043be1c932afmr30191135pga.574.1664381576185; 
 Wed, 28 Sep 2022 09:12:56 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a62ce0a000000b00540b35628a4sm4154703pfg.123.2022.09.28.09.12.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 09:12:55 -0700 (PDT)
Message-ID: <7d9b175e-48e8-5769-94f8-93089f960c04@linaro.org>
Date: Wed, 28 Sep 2022 09:12:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] Hexagon (target/hexagon) add instruction attributes
 from archlib
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 mlambert@quicinc.com
References: <20220920080746.26791-1-tsimpson@quicinc.com>
 <20220920080746.26791-2-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220920080746.26791-2-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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

On 9/20/22 01:07, Taylor Simpson wrote:
> The imported files from the architecture library have added some
> instruction attributes.  Some of these will be used in a subsequent
> patch for determing the size of a store.
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/attribs_def.h.inc      |  37 +++++++-
>   target/hexagon/imported/ldst.idef     | 122 +++++++++++++-------------
>   target/hexagon/imported/subinsns.idef |  72 +++++++--------
>   3 files changed, 133 insertions(+), 98 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

