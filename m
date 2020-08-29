Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 588B0256A19
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Aug 2020 22:27:46 +0200 (CEST)
Received: from localhost ([::1]:37172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kC7Rx-0005bd-Ex
	for lists+qemu-devel@lfdr.de; Sat, 29 Aug 2020 16:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC7QK-00047u-U3
 for qemu-devel@nongnu.org; Sat, 29 Aug 2020 16:26:04 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:43075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC7QJ-00009c-C1
 for qemu-devel@nongnu.org; Sat, 29 Aug 2020 16:26:04 -0400
Received: by mail-pl1-x630.google.com with SMTP id y6so1217516plk.10
 for <qemu-devel@nongnu.org>; Sat, 29 Aug 2020 13:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GHmFgHDgWgCLIYeotRnGnQC29SLhmslWyqT3sF8MxZQ=;
 b=Vvia6TUdMZ+uBn9P5y2BR2qidkVGv6ql7n35UlTRoByFnUbYajeT4i8QpMOPErAOAl
 qHo/H+HBv8QrfcRjHFLgHjXZhMbqJ5gSPpr50YKIhMaKlaU5cvtYqigvpSoVyK3J+A3h
 3os+UuHEO0zxBstQRYkAUsdneLKaDt06hvwh1DgJh3Z9KuzEdpRBSEXFlCFYSsv3vP6Q
 vRTS/jQoK5pYfFTHJBmXO3VVz+eCnD5v90KmebTE4ZOjUqK+RD/NFD2mQZDFYXN/b51Q
 +eoMpEgfvQuRcnIeK2ryA8VmqELmP2cd4tphVzvexq9PdFCcgw40yyPoPLO5RrCw1D4O
 L4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GHmFgHDgWgCLIYeotRnGnQC29SLhmslWyqT3sF8MxZQ=;
 b=N9SrQYFWAtZPaHuyEfJpKCoCmvAbQQSpAuRBxf9UPhqclkwbxxKZX5fQr6Lf7tS4wd
 3PmaKLqB4Em5IWRO26rxh1giMGwDH+T5G+xY2L8T0AeOrDovdVTr+ekQCGcgrZ9Tg3m9
 poyw8foQiz78a1cdkTKsIPuNXcZlFBahuHzIbWjXEoBD7b42q+LpNynsC86Ftoi7jBOP
 /NRSZuoAoGr1VDnJidA/k+fqWIk8y0srsoe07eAuKjMiDNdYQZLQv69Zchhi6IJmksbF
 l1LnWqOnW64Dqmpoz78KmIRTQsLoyANrnV8F7lzfRGn44l4+YKXHHTcrqunoKtUAmqVj
 Wnrw==
X-Gm-Message-State: AOAM5332wReRQjGusWUGphgvGuoLWRXLcIZCqSo7e29kY2rOBoLGrgCc
 h2v3k5WusFgmsTLe7D0709fNbA==
X-Google-Smtp-Source: ABdhPJwhse6GmCi1Oh4gEH72T85scdBlj4uHqb9vLm9zwo5P8yWPL/F7jC9zknJ0hSipFNCwxEhb5g==
X-Received: by 2002:a17:90a:f2c1:: with SMTP id
 gt1mr4393340pjb.70.1598732761841; 
 Sat, 29 Aug 2020 13:26:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id fv21sm2757943pjb.16.2020.08.29.13.26.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 13:26:01 -0700 (PDT)
Subject: Re: [RFC v4 51/70] target/riscv: rvv-1.0: mask-register logical
 instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-52-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1d753bdc-e432-2796-7259-d1936316a0f6@linaro.org>
Date: Sat, 29 Aug 2020 13:25:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-52-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn_trans/trans_rvv.inc.c | 3 ++-
>  target/riscv/vector_helper.c            | 4 ----
>  2 files changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

