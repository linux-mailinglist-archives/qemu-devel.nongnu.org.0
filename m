Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1632F655AEA
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 19:13:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p991P-0000y7-J8; Sat, 24 Dec 2022 13:13:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p991N-0000xh-OX
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 13:13:21 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p991M-0006qc-7a
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 13:13:21 -0500
Received: by mail-pl1-x635.google.com with SMTP id u7so7579544plq.11
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 10:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wf17dQ/yI2YQrN1f5hNa/k1Oqe5IJFQMziVcIdMFa54=;
 b=SJfFuhDmhNtkuVOmpir5g97jweJ+HJUgcN0u59AMiJ2WH9sQc/k8tjTbsi5JgWz+07
 7YnmVfLSQDHkyLu9bgk5aQzPg93oT4euLRsmmn5hMy+POPfIzRLL+WsNxGjg/tGM2yvc
 QbhJi1fXw1o0IlBX8cxrLcGDz8iio80+95WooLdkQPT7n+x8tMv26UNUVZB5zVMOxkS0
 3o7eWJxfpV2KTY/y2oHJTBLNyhNMs+H6FYGz3AwvKkKAWhwAwpv1wQ22vWJiraouyfaw
 WB0U460lIPpMAEhkGGLJMG7TB7z4BbtQ6TtEwBiIPb6xnRX8QS+tQEiToXOPSOUeYjQO
 RBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wf17dQ/yI2YQrN1f5hNa/k1Oqe5IJFQMziVcIdMFa54=;
 b=65rFKY8Jih5ydT7jq4gIjzAhqWAXI6SwCks1aJLHVleG9SWdsF+KfmEN03VY3lh+jX
 0TTOoNcgV4T2zz6qJ/aHvnjHcaT5hd9gvyfTyAIhl27eain64yC1kspiahDfLWdHMvtA
 YGjGkSB6RjBYyznbjHSVjoMEtC0rwMadMM2AJL468lhzdETFAxnFjggZ95Rb0CX5kd3D
 ebuKpm+2z624FMeDpFU0p3dU/6q6zMpYPy6ltBRHF6ZGq7dvJoblljHuBF6fGvRq9Wym
 Q9rk80dR5TO8mEJxbVv/PikxUi+Zoq5xjWhudRQOIHLaLTy+FypqU0TAnNkKrMJzD+Gw
 AjwA==
X-Gm-Message-State: AFqh2kriKGeJaajZsmZQIcicuq5LwlDoIsyKwTxoQgivTXQFHMyuxDDE
 Rf+G8eAgo8LpFZT2tlQXae60sw==
X-Google-Smtp-Source: AMrXdXsLPgUwr1+tRFuye+d3OscPg7AFzTpU25brNKHhv7TyPFm4v3UA12dQSrGaW0EmiFpCyNj26A==
X-Received: by 2002:a17:902:e983:b0:192:4c82:cc1a with SMTP id
 f3-20020a170902e98300b001924c82cc1amr15613740plb.37.1671905598617; 
 Sat, 24 Dec 2022 10:13:18 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a170902a38800b00189c4b8ca21sm4383670pla.18.2022.12.24.10.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 10:13:18 -0800 (PST)
Message-ID: <57f27ab7-1136-c773-69b5-2ba35e8379d0@linaro.org>
Date: Sat, 24 Dec 2022 10:13:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 18/43] target/loongarch: Implement vsat
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-19-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221224081633.4185445-19-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/24/22 00:16, Song Gao wrote:
> +TRANS(vsat_b, gen_vv_i, gen_helper_vsat_b)
> +TRANS(vsat_h, gen_vv_i, gen_helper_vsat_h)
> +TRANS(vsat_w, gen_vv_i, gen_helper_vsat_w)
> +TRANS(vsat_d, gen_vv_i, gen_helper_vsat_d)
> +TRANS(vsat_bu, gen_vv_i, gen_helper_vsat_bu)
> +TRANS(vsat_hu, gen_vv_i, gen_helper_vsat_hu)
> +TRANS(vsat_wu, gen_vv_i, gen_helper_vsat_wu)
> +TRANS(vsat_du, gen_vv_i, gen_helper_vsat_du)

Implement these with dup + min + max.


r~

