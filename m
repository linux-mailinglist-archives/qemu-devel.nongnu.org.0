Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 931E961A644
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 01:05:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or6fu-0003t6-Nr; Fri, 04 Nov 2022 20:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or6fs-0003si-FX
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 20:04:36 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or6fm-0004ub-Ij
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 20:04:35 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-13b6c1c89bdso7169838fac.13
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 17:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G0pwnPHzV3CHxUogJGE/FSXR77yFup9eH0AgrTDN4k8=;
 b=pcGgDOPFjzCMjWcEdmur82MHpwMCqBVkioHgSsRxs/Pvd3XHjgcG/mh0DKlG1LsWWK
 6jnsKg2gQ0XWI4XTyREQTuhYs70v9GDwBdi4keuikhKN8xZipUxdoQq8dEXM1hpzzj0i
 7TdSxuQo/LhxhGoAcxLfq+hTHt5Grr+hBSInouRwJZO8E0Ros6scfTDR7gW3XreOLcDR
 U+dd36cNJ2ButNs+JJVs1hL90wbOlQhl3lds9cJp/6XvfzNLKI1b13rxC9kf2hH6D/ay
 yPF8R1Cjasoe9J/TN/VFw31d6QQ0fIB095IXbINt7zZsqy4qdUefv6m7sw1YhFRsvAPD
 hEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G0pwnPHzV3CHxUogJGE/FSXR77yFup9eH0AgrTDN4k8=;
 b=5DSMXfmK8K6yw+9mZRXDSsw8pv1g612xzYhAJ9qqsqv9L5dFnQp93vtjmJBwR3EGVE
 8J8M8P43f9/J/B2hDa0w9WwLf0N4NsrXw34BO5UVf6vp9KzKfw6UzMTEyjhRwrq5Y7wb
 aUtKl+a9zmaZaLgB5/VcC/WOsFDO7r6cgl2hWBf7jIuciJGKDMuAu2HugD+o6HK3ioEZ
 KSUylQQSxt2gsWhBIGPiTtjDExmop38IN3RVxPNwJrK/bFYGwpBZEQ5g+reeSBpN03VI
 Vk91hHYgykxQ5FxFJZThsF1OdqoWZl1xcQ/siX+9VlCvPtu1v2g2+jcUWWUzeClBCM5J
 ZUpg==
X-Gm-Message-State: ACrzQf1achaX/rwaegrSLOXDgFnJPjbAwtNVLh9mOx9JyrAAubzzLufs
 ZVa8LhaX0NF0KSI/uV6GonCcsQ==
X-Google-Smtp-Source: AMsMyM5hZTd43TltdYm5eyuuauvCcUzMpWm5hZa/vqwPouun1EexUPkQSaDq4KiGbXV5i0tlYRkYjA==
X-Received: by 2002:a05:6870:d210:b0:13b:9601:89fb with SMTP id
 g16-20020a056870d21000b0013b960189fbmr14783118oac.203.1667606669145; 
 Fri, 04 Nov 2022 17:04:29 -0700 (PDT)
Received: from [192.168.229.227] ([172.58.176.28])
 by smtp.gmail.com with ESMTPSA id
 a20-20020a056870d61400b00136a0143de8sm201263oaq.40.2022.11.04.17.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 17:04:28 -0700 (PDT)
Message-ID: <a1e12867-a9e2-08b8-fb75-0fb58ce227e8@linaro.org>
Date: Sat, 5 Nov 2022 11:04:16 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 04/11] Hexagon (target/hexagon) Only use branch_taken
 when packet has multi cof
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20221104192631.29434-1-tsimpson@quicinc.com>
 <20221104192631.29434-5-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221104192631.29434-5-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/5/22 06:26, Taylor Simpson wrote:
> When a packet has more than one change-of-flow instruction, only the first
> one to branch is considered.  We use the branch_taken variable to keep
> track of this.
> 
> However, when there is a single cof instruction, we don't need the same
> amount of bookkeeping.
> 
> We add the pkt_has_multi_cof member to the Packet structure, and pass this
> information to the needed functions.
> 
> When there is a generated helper function with cof, the generator will
> pass this pkt_has_multi_cof as a runtime value.
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/insn.h               |  1 +
>   target/hexagon/macros.h             |  2 +-
>   target/hexagon/decode.c             | 15 +++++++++++++--
>   target/hexagon/op_helper.c          | 24 +++++++++++++++---------
>   target/hexagon/translate.c          |  4 +++-
>   target/hexagon/gen_helper_funcs.py  |  5 ++++-
>   target/hexagon/gen_helper_protos.py |  8 ++++++--
>   target/hexagon/gen_tcg_funcs.py     |  5 +++++
>   target/hexagon/hex_common.py        |  3 +++
>   9 files changed, 51 insertions(+), 16 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

