Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A69994714DB
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 18:10:39 +0100 (CET)
Received: from localhost ([::1]:52336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw5tO-0003rl-Hi
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 12:10:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mw5ml-0005jh-N9
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 12:03:47 -0500
Received: from [2607:f8b0:4864:20::52a] (port=46602
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mw5mk-0004aM-5y
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 12:03:47 -0500
Received: by mail-pg1-x52a.google.com with SMTP id r138so10670796pgr.13
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 09:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OaiRHSCruiO9TfsHt6fBnWquJN31LaxY5w5+/eFIRag=;
 b=VF1BhQ4XKYeNsKEu55IRII5nnWgZJnbosJRqIhiuMsW/fg3ZZueR5CpxewYMyvfJt+
 sFkCeLLSdddf7AUT7NfB/vtVvNIjKm3YoILrF78Me6YRUJ4dDZ8236pIIPXP3dcnZX2B
 FbY2MrmzjW2oWkLkRpjZ4/uyI2kQK0ZITy5eAMuACjUukm1fvYM35YD3A3uw/eLfrLYn
 4ZoFm6cfL8E9H1e3j2Y7xTx7CmBczs+yNQuYsrRLYX95BAnlKcQS4rlRQnTBix14Ro4D
 aFm1+4NtADOKFtEvGmgGutxH0C6HUvpS7Vc8K+qje6ffL5I/ihEg+NkMR6DXHE8hBcRT
 Q4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OaiRHSCruiO9TfsHt6fBnWquJN31LaxY5w5+/eFIRag=;
 b=P2HGrSZE64ke7wZ/4ACw++IIN9w7Yx1Oo03qisTBkbZYo1i8ad+8LJzVPajSIT1ANN
 6Ak4DcWaNT36rWM+cA4phNIlqpthKTZdVQcSIBFubeh9+yZnumeE7ihkw6LTI2JlN6wc
 QS3/x9K6WzhAKEHqTpjejtFrBfQYe/uX/sdlLvhNHVF9ezLo+bBdQt8JSJmNuwigY3yX
 ytpnBEWrsOmYQ3spyrUBJBzWRPhYnLnr6L8IYlWqH6rBt1HCx9Tqkn4BY5wmZgAx7HP/
 irmgqRnzZVT9PQWeUOJWtfEX868OGYZJ+Jo/Z5gdtEWSPo41Ig9alcxPDnhqrPxdFe7O
 RxLg==
X-Gm-Message-State: AOAM531n1bQAemmXrSiWpkt0NywIoAAr0+h6hU6xG3YjKtJwzJbzT/25
 h9ECvchJzAWp+h4dj2icXRfaBg==
X-Google-Smtp-Source: ABdhPJxcd2rmI+ReXOuRbi88AutPp86rgv626PQXFRnLjD4fYP4Nd5ouUINkTJPlNZgUz8kl0W8I/w==
X-Received: by 2002:a63:f651:: with SMTP id u17mr43049331pgj.256.1639242224759; 
 Sat, 11 Dec 2021 09:03:44 -0800 (PST)
Received: from [172.20.1.20] (45-19-222-18.lightspeed.sntcca.sbcglobal.net.
 [45.19.222.18])
 by smtp.gmail.com with ESMTPSA id a3sm7253282pfv.5.2021.12.11.09.03.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 09:03:44 -0800 (PST)
Subject: Re: [PATCH 2/4] target/ppc: Move xs{max,min}[cj]dp to decodetree
To: Victor Colombo <victor.colombo@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20211210141347.38603-1-victor.colombo@eldorado.org.br>
 <20211210141347.38603-3-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0d3ab065-7dff-840f-3d58-d2ef48e7d920@linaro.org>
Date: Sat, 11 Dec 2021 09:03:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211210141347.38603-3-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.317,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, matheus.ferst@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/21 6:13 AM, Victor Colombo wrote:
> Signed-off-by: Victor Colombo<victor.colombo@eldorado.org.br>
> ---
>   target/ppc/insn32.decode            | 17 +++++++++++++---
>   target/ppc/translate/vsx-impl.c.inc | 30 +++++++++++++++++++++++++----
>   target/ppc/translate/vsx-ops.c.inc  |  4 ----
>   3 files changed, 40 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

