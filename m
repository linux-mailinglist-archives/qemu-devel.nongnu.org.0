Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 656E441717F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:07:40 +0200 (CEST)
Received: from localhost ([::1]:55178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjzP-0006vw-Dw
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjru-0006EF-26
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:59:54 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:33365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjrs-0002by-JH
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:59:53 -0400
Received: by mail-qt1-x82d.google.com with SMTP id x9so9221523qtv.0
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iyd41zlFqsRotG75e7iSzoQnfoui4Pj98afsZQ6B/Mg=;
 b=iKzthBqU0kX1o82TCeTaHB5Q/gQ1UkBPmizupgLVaDqt7GMSQWd60EnPvMjh5OHW3I
 AjYGurXeu7FiRkeum39JXvZq3EpEzIxnaRDXVd1njw/22fiRTP6bbvqgVgdFfT2bW+Nb
 iq3O9cypEszy99W7+YZYyUI7EQAR8d9GeUrkIFOPk9bd24azAKqbJgDRiaGH5B1NGhyO
 cLPpsApY7VsCfJFIa3CkYiLGFLS7uxQgtCVaoHmuS8zzoc/NLBXRjhATRb3oZSVqRwJJ
 oqfbx9b9g+yr3QkA/YGnMp+ydclJ79yfO84vFhrSh4VtFSWDLcrYev7kxrvZhbBZmsOC
 ohIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iyd41zlFqsRotG75e7iSzoQnfoui4Pj98afsZQ6B/Mg=;
 b=OKl7BAjwVDJO9s4TuOVAdE6T9Ni0frJDU5sNnntOaE9V5CtDvqLXraMtgC9tpywcuw
 ecktI0L7AMXA42I0Ii3qbly8slN34EyDdWC/P2a7MLPSC/eMwqURHUZgDvOekvIMPqOH
 5GDpoSP+QUj0JpBFZwo5D5Cxnbgb1E9Jc26WF5gOyA17ii5//4LYzBLOIZB+FEm4AYrg
 IDXrqHpu2VVry0B7sQQgUEsxjBmrPWZZMMn5/ZO9ZYm3qtzOaAvExrnX8ew9w2QgqOkp
 dRgb0QS+bfsnDUHhC8hadq9BUnsvMj7+ZOI8Q7quppr0MWE5YmvhqTvs3fjMG4bLowHa
 iCQw==
X-Gm-Message-State: AOAM530YN2lQTm/omejPY7O/p3XoSJCknmDHGHtV7oo4S9MBLZz6LRh2
 2+MblK5mrH2hj6NUai+5Qh/aJg==
X-Google-Smtp-Source: ABdhPJxjWD0NrYAQAINHxGr3gdpB7k/tutAWnlpnE35rYBroSigElw6KDfPP1l8WHtTktTKP01gN5w==
X-Received: by 2002:ac8:1e93:: with SMTP id c19mr3751478qtm.60.1632484791560; 
 Fri, 24 Sep 2021 04:59:51 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id g8sm4903873qtp.62.2021.09.24.04.59.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 04:59:50 -0700 (PDT)
Subject: Re: [PATCH v2 3/9] bsd-user/mmap.c: MAP_ symbols are defined, so no
 need for ifdefs
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922045636.25206-1-imp@bsdimp.com>
 <20210922045636.25206-4-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0387ab61-5de6-9377-9048-618537127144@linaro.org>
Date: Thu, 23 Sep 2021 10:37:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922045636.25206-4-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kevans@freebsd.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 9:56 PM, Warner Losh wrote:
> All these MAP_ symbols are always defined on supported FreeBSD versions
> (12.2 and newer), so remove the #ifdefs since they aren't needed.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   bsd-user/mmap.c | 14 --------------
>   1 file changed, 14 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

