Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED26F3ACDDF
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 16:49:32 +0200 (CEST)
Received: from localhost ([::1]:36684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luFoK-0002Zp-1H
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 10:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luFmo-0001B0-Nt
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 10:47:58 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:36380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luFmf-0007mE-7t
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 10:47:58 -0400
Received: by mail-pl1-x62f.google.com with SMTP id x10so4789076plg.3
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 07:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=sVDzdrALyz1Ut5u64nza+nfE2rUMiAyHcq2AHxcbUKA=;
 b=bMPjsFk20VWbE+piRqoBq73u9O2xzqHbDadlPR2vK1GGI/aJwFF8mUQL4yTgGokcjq
 IqGQzK6SzkFQLGRgDN0QwKqSdVa5kNdmrmtRFG/43Po1C3LvqoyyGLWO4gQNdPjMqEe6
 MEGO13vcfJoRWgF3XVN0dYB2NYhHwZXz9PqsYYKtfUO0EhcmtZVb3er8nNIzKdgBDk3o
 4FYqSMC0IW6T15z/y5vEZqM7LRfwqhyY31epRSBf4UGCzN9obOdGHWNgn9Q9Q3md32QE
 i/SIUv9pEZjFk3eVfVyENP6Ta01TiEA5cLpeJUjKc/GEICOemUYixbPD1vS2PiXBF5WW
 jWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sVDzdrALyz1Ut5u64nza+nfE2rUMiAyHcq2AHxcbUKA=;
 b=MLTQzO6mtglfY7VUv3Ff7++1OgnQgsoc2PcH6wvmD4ODuE7B+ndNh18+hgy2K8hrns
 nBVo20QzspRvIjY0Sbw1tjPBLDG6l4oSBKE02f9xBXm/AlqMb9aY9/uoQ8bTMjnkdnS5
 XucHIbNUPqVBTDxeXwSNkiQdSa7oWe8tuCCNjUaEwqUOIBsROnrcqD2AUkX5WeHi+aSx
 8xpUIjhlDELc5JjJ2ljRvpO/MPjjlUWecvHGGUzSpU247KhjZSjpfjeJJh/C1hXcbN1k
 CurLSgK5K+OKBa8wN0U37gyV9vAsyq0how5XLYNmTFzMcuu2h0lR6N0+sIb0Me46Wsv4
 ZeUg==
X-Gm-Message-State: AOAM531qvko7qf2t78NXE3Q+NSnpNgT0CTf0J3pWnm5d21MmHJUPWPwB
 MPaq6fPRgd64iM3cSpxOiIljL7JqGqTrVQ==
X-Google-Smtp-Source: ABdhPJzIAIDbPHmY3kLLwDufwfr4BWSz/yBgeCzo/UkqLr7HRNFF402xY0W3aosuudfAzO4hP6cGow==
X-Received: by 2002:a17:90a:6548:: with SMTP id
 f8mr9354201pjs.106.1624027667651; 
 Fri, 18 Jun 2021 07:47:47 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id e2sm8284702pfc.135.2021.06.18.07.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 07:47:47 -0700 (PDT)
Subject: Re: [PATCH v3 02/44] target/arm: Implement widening/narrowing MVE
 VLDR/VSTR insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210617121628.20116-1-peter.maydell@linaro.org>
 <20210617121628.20116-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e1d8014f-c102-395d-1f1c-d02276a7c5d1@linaro.org>
Date: Fri, 18 Jun 2021 07:47:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210617121628.20116-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/21 5:15 AM, Peter Maydell wrote:
> Implement the variants of MVE VLDR (encodings T1, T2) which perform
> "widening" loads where bytes or halfwords are loaded from memory and
> zero or sign-extended into halfword or word length vector elements,
> and the narrowing MVE VSTR (encodings T1, T2) where bytes or
> halfwords are stored from halfword or word elements.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> v2->v3 changes: pass MSIZE, so we advance the address by
> the right amount in these widening/narrowing versions.
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

