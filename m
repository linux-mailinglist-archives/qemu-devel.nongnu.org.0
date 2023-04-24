Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A456ED1EC
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 18:03:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqydy-00064p-MY; Mon, 24 Apr 2023 12:02:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqydw-0005zP-70
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:02:20 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqydu-0007p6-L9
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:02:19 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f09b4a1584so31178025e9.2
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 09:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682352137; x=1684944137;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/pl3gJZDXar0cbS+qfxK0bhWf4CWHfYUCRvsPgKFQ4E=;
 b=dgepOUTMqCFoTqMa0CDPNCfLOkcpqaDMNd1t6fpi+QIRJgfJFn8qOv+C4Y6zaPsp7u
 SkYJG9zN2GR4RmQHchi48a3/FGTxB/hJKgH+Zr8DIfGREfHO8iIj+x5kzTCYBNpBB/W4
 rjxhPtYLIUr1LLKxtq1sefJCj3ZaRuA3WB4fdGlw/W4mxrybs2uZMJJF/Jzf7pLKzTVs
 GHJc4ypUS3KMrxXBQniSQhW5bVBJc3u7YnrUQieXXlKbJJ+EDkEu0BSzaXGuGeuBTGxg
 DE8RPzuVt+CZ4v/ovIk30W9LObEbiTDfH8WWxZWddp0RCPqnVDRcEXZfoCXSLmyEgxuS
 WVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682352137; x=1684944137;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/pl3gJZDXar0cbS+qfxK0bhWf4CWHfYUCRvsPgKFQ4E=;
 b=GT7ZONQbIjt8pGi9O6FgqAUm0mVWKlXkVZIZNI5jZNKhr0L6S3XfS53TAKLNvH8cTp
 dDJ0NMJFQT+uLAZjWR/0PmchmDibPDWyEUJRkLm5WB3+q3oVT02GaAHBN2FCjTEdL8kd
 eoAu8NRpzsVGzSFAPQnxnnEoBHGfSsg+d92PAT317HMZwW4S9PiW73HHaNRkrG4WIifA
 zONivRfc4KfIofqb66GgnLeROYsM+S+z51qbEAh3mKeyYGpAlNOzUXHQgRargQVjnC7V
 iW5WfrU0fhQRP9J7XqQs6GxYXjN/3QDhQRKXFlMjEBJD+aZTbyT0gk90SPDNBnWTyi/4
 o3hA==
X-Gm-Message-State: AAQBX9eqsso5dXZuAO7fpI5bj740m4nNOM759jLxf6WmtuJGr9dqfnZW
 N84wMA54hWo9FIryw4ZkAlqfpGjETAb8t/pCGdFADA==
X-Google-Smtp-Source: AKy350bVrEoY8kQ7O9VAK4oH4ELPFuFi3y1OiCkc5F5v78H/4jEpKTjMNwRe4cAmHvrAYnGdL4ShKw==
X-Received: by 2002:adf:dccc:0:b0:2ff:a6c5:2809 with SMTP id
 x12-20020adfdccc000000b002ffa6c52809mr10588078wrm.28.1682352136702; 
 Mon, 24 Apr 2023 09:02:16 -0700 (PDT)
Received: from [10.43.0.114] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 t12-20020a5d690c000000b002f74578f494sm11084757wru.41.2023.04.24.09.02.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 09:02:16 -0700 (PDT)
Message-ID: <17e2f591-26e9-d5f8-8da6-8145ff8d2e02@linaro.org>
Date: Mon, 24 Apr 2023 17:02:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v3 42/44] target/loongarch: Implement vldi
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230420080709.3352575-1-gaosong@loongson.cn>
 <20230420080709.3352575-43-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420080709.3352575-43-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.194,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/20/23 09:07, Song Gao wrote:
> This patch includes:
> - VLDI.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    |   7 +
>   target/loongarch/insn_trans/trans_lsx.c.inc | 137 ++++++++++++++++++++
>   target/loongarch/insns.decode               |   4 +
>   3 files changed, 148 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

