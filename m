Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926853CBEF9
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 00:04:45 +0200 (CEST)
Received: from localhost ([::1]:53328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Vwq-0002vn-Lp
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 18:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Vvn-00023g-Ms
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 18:03:39 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:52937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Vvl-0005z2-An
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 18:03:39 -0400
Received: by mail-pj1-x1030.google.com with SMTP id bt15so7224814pjb.2
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 15:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=75CbBi3qKSMlzhLFkGPBCnP9v234XTeCUQKVcLwl/Qg=;
 b=PUckA+8JJS/1n/yRLKf9vm+WhSOPORALQR1f/YnZbCbX1pZy4tUv5KFvBlnfneKzwz
 OY+IrJn5/g03W9Qp1OZiYm5NZ2sbPwZLB0Txdp9dWXmH0jwa/me0PY6AZS1Ui6AYKbT3
 u1QiR/GBvnilx5EeSmqxIudiHWFvaNjHjNH8r4CKVDEPi/DsGKkPkZh5duTkJ3M9Slt8
 4JXDbhEZXm+wq/b61OVR52b2FPPFz8MX9S0RVQxntg+vhxSKRQ9AjPPkTaHZ7ma4dkb/
 3i2iqLo6+EKxxd73M8hyobMrOblnJMrUTjnTaAr78jSOtSe7PaP329mtmAEVtRknn8hH
 0pKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=75CbBi3qKSMlzhLFkGPBCnP9v234XTeCUQKVcLwl/Qg=;
 b=Aq2/jZNg1tktOX2aWxUDRnZ9oIEjabQKEo2++ChwGs/k1vv0QiYCX/5Nx61KcjUNZI
 DqOhyPGl3T06DtEjNVMjOfhA7tK7JOCM1KTrJEpbfM4ov4g1V/naUVkdmuzzXoLT4E/C
 LKGc23rEQWoYJd5yQ1RaBJK3Z/Z5Nfe6SQEQGzkggQ5xXjt1yTsQHzpYciFo35EjFPXA
 I8P3N0tQogpcOXaLlnUzlfkrXaji+Eb1y8Mf/Uyq3hRvXTSLoOF3K0k0vqBf7txuo/GA
 RDoELd0i5bTOySSA3tSZVJl1qIwLikRgTlE8robcP4yrrtXuRCJZ/Gq8PoDomqktF2Ca
 vDoQ==
X-Gm-Message-State: AOAM531aGj8WZPhPQjQQ/9A8V0MZMYeVssHkcGcDbHvEzQYpNOJkttzJ
 3yXJpow8JudIwQiZbZuxcCWRB4CUuaIxzA==
X-Google-Smtp-Source: ABdhPJxNNXgznkQ+iVVO6iA3r4mkwiePWGa0qfJTwpY+Bbh3fyKwqUHsNXqlnFohHkH93BIGlrDEZA==
X-Received: by 2002:a17:902:da89:b029:12a:d3d7:a8ab with SMTP id
 j9-20020a170902da89b029012ad3d7a8abmr9344198plx.78.1626473015756; 
 Fri, 16 Jul 2021 15:03:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id c7sm11709678pgq.22.2021.07.16.15.03.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 15:03:35 -0700 (PDT)
Subject: Re: [PATCH for-6.2 16/34] target/arm: Implement MVE VPSEL
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ccadb40b-633d-a9a0-cb60-6e819094b0a4@linaro.org>
Date: Fri, 16 Jul 2021 15:03:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 7/13/21 6:37 AM, Peter Maydell wrote:
> Implement the MVE VPSEL insn, which sets each byte of the destination
> vector Qd to the byte from either Qn or Qm depending on the value of
> the corresponding bit in VPR.P0.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  2 ++
>   target/arm/mve.decode      |  7 +++++--
>   target/arm/mve_helper.c    | 19 +++++++++++++++++++
>   target/arm/translate-mve.c |  2 ++
>   4 files changed, 28 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

