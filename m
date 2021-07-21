Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E6C3D19C9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 00:34:51 +0200 (CEST)
Received: from localhost ([::1]:48936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Kni-0006Z3-8G
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 18:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6Kmi-0005hb-By
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 18:33:48 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:55133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6Kmf-0001Oc-U1
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 18:33:48 -0400
Received: by mail-pj1-x102a.google.com with SMTP id j1so1701002pjj.4
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 15:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=1ALymvoYRloylPo4+w+nemdh1GjsTeSHcaqUHYYfKaI=;
 b=lCSwb0RRriJ7fMTcNvmJ+p5ATt8FWkcN0rzU7wYczi6nVv04sJfN5/HQcr0MCdgUQ8
 fu6rmV8FWRjXQ+Pk25o5556VbkkCbzkUmag1tGRji/hqLi+CcndN3ZkGEDfa2wGUdfrL
 MJo4qbxtQOH+28E2CU+SbasC2nA502I4yiFOBufBc4i7i5LHOAhDGA7+PWpSY8yPGeIQ
 ZCsZW4tG1d1V7zsWa72A07L3yu1ZZNrYqRPXHRweOhEgB8pLWSr7M/GfNs0bgThFvmOU
 M9QL2+AyvG5TiMwd73PcPUyW19hKAH7aIFLmxasY3cmAqgnZq1cpsi0i2d3s5a714bw8
 yFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1ALymvoYRloylPo4+w+nemdh1GjsTeSHcaqUHYYfKaI=;
 b=TG5JI3TQ9HFyW7uztzxSfUyfSrkmoFLTQ/SXYJypvTEmyeYv/vbC0wK5jd+k+QqYQW
 p2HIbqm4oMdm+0/M55Sg4tU9yVpa2NEdJFLQAmDO2J5xL8ldQjZL8A78pcjbES7tCQj5
 SrZmSoMM3VLXM6g+wvyzJUFSSmVuIWYYkZPv07rd2V+wZ434VvcMbuxcBW4QinYPN92F
 KZ2zVRpdHbbxgWdNECf5ppQLxSDq15rsB4EbUay0hy/NZa3HGcF0byVDQzUHev2gOKsf
 9Q8/hG3jyIy0kCm1pk2NPHErqJ8EpxxmJguAp4SZkeklZvG5lGnkqNtZVg/IYp+WdS8J
 Fb+w==
X-Gm-Message-State: AOAM5321fYLPLOdBU5A78tZiTEREP2PvHD5U0Jz7CLhe7626GaJh9NIe
 QJf9UY0YiaZvGv3cVrJNpRHlWoO77z+Lyw==
X-Google-Smtp-Source: ABdhPJyFuZagNn0qRV2MMht0uLM1iz6XVxSQN3TW5eX/tjd0cgXBEyvBcCIT7Fj1Ec+T0uzasvbiAg==
X-Received: by 2002:a63:e250:: with SMTP id y16mr38423713pgj.247.1626906824118; 
 Wed, 21 Jul 2021 15:33:44 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id v7sm17673200pjk.37.2021.07.21.15.33.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 15:33:43 -0700 (PDT)
Subject: Re: [PATCH for-6.2 31/34] target/arm: Implement MVE VCTP
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-32-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8f65e081-e173-d841-c145-c8db03e72c28@linaro.org>
Date: Wed, 21 Jul 2021 12:33:40 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-32-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.117,
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

On 7/13/21 3:37 AM, Peter Maydell wrote:
> Implement the MVE VCTP insn, which sets the VPR.P0 predicate bits so
> as to predicate any element at index Rn or greater is predicated.  As
> with VPNOT, this insn itself is predicable and subject to beatwise
> execution.
> 
> The calculation of the mask is the same as is used to determine
> ltpmask in mve_element_mask(), but we precalculate masklen in
> generated code to avoid having to have 4 helpers specialized by size.
> 
> We put the decode line in with the low-overhead-loop insns in
> t32.decode because it's logically part of that collection of insn
> patterns, even though it is an MVE only insn.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  2 ++
>   target/arm/translate-a32.h |  1 +
>   target/arm/t32.decode      |  1 +
>   target/arm/mve_helper.c    | 20 ++++++++++++++++++++
>   target/arm/translate-mve.c |  2 +-
>   target/arm/translate.c     | 33 +++++++++++++++++++++++++++++++++
>   6 files changed, 58 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

