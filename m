Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A873A2DBD
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 16:08:30 +0200 (CEST)
Received: from localhost ([::1]:58210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrLMD-0007qr-56
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 10:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrLKX-0004ze-BC
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:06:45 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:43841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrLKT-0008Pk-9o
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:06:44 -0400
Received: by mail-pg1-x536.google.com with SMTP id e22so22656148pgv.10
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 07:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=yuFGKMTAeCtB1UE+hpJU0pMvvufsdjRbznoTusyObE8=;
 b=KN3G7BaCGFI+zZQ6Mzaz1AiOc24RWQWAZg5uwAyUe0bpMeLaPx7A1w20TzU8D822Pz
 6aL+9Hj1MtxnONZyjohUYbyv+DYmbisDV9v6JzpLY4Nq1415pqKwzV3aaIBE1YwCRN2i
 8J6cH4X7y9PU6oVY8i7QXmPdHBf1+Si6rydMJxcUq0YtV5tyVZ+mYLqZxNK1hId0j8UX
 CbritzPV/gjfYBtCvnYl0+NFr7PvRxfG42gSOzvhrGH8NMBjAEMyiW1OTkB0rEWvEzHZ
 cUT/ptdZoeIu8WBm3KAhKsyAO7Tny/xF/aVCpgH/hsGOdjGtwS81KNXaeAxbIjmEzUo0
 G86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yuFGKMTAeCtB1UE+hpJU0pMvvufsdjRbznoTusyObE8=;
 b=GytW4kRSLqf8RFEgaiNN2A+OIgj9dGO2MtvGwPHbVMjU59iaMXaTtr7eUXH2LstdJL
 G+p0yyShYDOBeyyqYhapPKlpRIswdDKuU7rUYHtOU9OMOmYJs+ogYBnYbHcGJpJBXjC/
 oxTHLXDOo9SixiaOWgpkMyzveeT2ufTkDA5D8gjK4YCByiIumTt0nInQXkg7FcBDs5vF
 GtmJkWQOmPk7z0E1UoJMeNrEQehliQaOcU+1EsBgMjHz0e0EJBp/qQ/I+odkXwIJjVHB
 twQJxKG50zqe6drGByW4lGXdzeZx7XbWdPkukv+Xx47lNAIfxrBmS9xhE1J85i9qpenX
 8yDg==
X-Gm-Message-State: AOAM53180LJSq4BGqVwUWRaPyvczEMxf526fvKmECjHRJqWtiQ0SpWaJ
 4pvNcaGytPK6+nghVjAOPKxrO4Ghlfu09g==
X-Google-Smtp-Source: ABdhPJwJCEG7i+okIQWuWoUjCdaUJ3m75TO6ZMoc4HHu8GUS1xf7tsL+t2YaopjBWxLW4dJsAcuAJg==
X-Received: by 2002:a05:6a00:1387:b029:2f3:1cbd:8742 with SMTP id
 t7-20020a056a001387b02902f31cbd8742mr3161041pfg.81.1623333999743; 
 Thu, 10 Jun 2021 07:06:39 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 v7sm2855963pfi.187.2021.06.10.07.06.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 07:06:39 -0700 (PDT)
Subject: Re: [PATCH 54/55] target/arm: Implement MVE VADDV
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-55-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <29e76f88-3a58-bc8d-b948-f61d379f2ca2@linaro.org>
Date: Thu, 10 Jun 2021 07:06:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-55-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

On 6/7/21 9:58 AM, Peter Maydell wrote:
> Implement the MVE VADDV insn, which performs an addition
> across vector lanes.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  7 ++++++
>   target/arm/mve.decode      |  2 ++
>   target/arm/mve_helper.c    | 24 +++++++++++++++++++
>   target/arm/translate-mve.c | 48 ++++++++++++++++++++++++++++++++++++++
>   4 files changed, 81 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

