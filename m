Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E569A6ED1C5
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 17:53:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqyVD-0000ld-C7; Mon, 24 Apr 2023 11:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqyVB-0000ke-1Z
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:53:17 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqyV9-0005Um-5C
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:53:16 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-2f95231618aso2904924f8f.1
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 08:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682351593; x=1684943593;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4zrwXQx1AQfwcXWjcO8+LCHPlb4CLUkXM7cyXJzLlpg=;
 b=KFNxihYwFrdc9q5MDg6mDgmnBeodQPtIJIGcRCQ6FgGd9OVnS2k3Gi/1oIUnLqbSFv
 Urtwk0qiJgtQdSfDXNlwRfKyoh1X1/nuk/bqhE7Ed8uofKXhFuuNmHfLlM5GKbiEc0mc
 6pczw4+VgdFvI2pIsvOOlDkiqVGkAEOwFKOTqwt3gvA8/Q9reQDDXAVckiFkiZTA+t+c
 n1uxqOAoCevor13XPdlq3vBVp8d6GIySaD8lekTHTUTkp7RN5tub5V49bcRh0X/LzFjI
 SUnqz9qboJXZEvSnVtUxzCyPI/TQN6obq6vhJBen5SFmrdRqo/n1tOYyl+Ofrc4jlAuz
 m7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682351593; x=1684943593;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4zrwXQx1AQfwcXWjcO8+LCHPlb4CLUkXM7cyXJzLlpg=;
 b=gbmmgZLjto+X5UsWxTCk6LvdO2R8Mr3dDqtBzR86hVJGdBu2++NIM9YXOWtt0RLzAe
 2VmETNBPs1QAEBdO/9l2u/0lWfWEyN/i/krTd9ujtaOSbliUISqNdxEbr53lkx4QhMt/
 uNYwM7niNgdnfHBntpqrYsAmgJHbWVARHFd/c8tkBjdu+bD7sdG0yPM8VwAJ7Sg0a14v
 xD2vxEB2EXx7JY8RyvyQB5QGY17lSeJOYapj4+kBHwlqlQ1MCbgQge98gpBtBdSXkOTb
 /x7cedl0spe6EZgkuTmzxq7yry3Ros9cU/v9+AVdBwcFjRVDujpAqZhLeYJqhuxTq422
 vqxA==
X-Gm-Message-State: AAQBX9d5RwYvDgU8CN0U8r6Y5yvS70V77LaRQ/pIH2ecyyVQo9nAgQ1L
 vu2Y8Nd5VMOlkQLlndY6biC6OQ==
X-Google-Smtp-Source: AKy350azhbvcriTiJr48DDh1cE74yN9RKQD6qVBW+nBoyW/jdQK3XfASUcxCPtV/hOJ6KkyX7OQUlA==
X-Received: by 2002:a5d:6152:0:b0:2cf:e3d0:2a43 with SMTP id
 y18-20020a5d6152000000b002cfe3d02a43mr9706704wrt.4.1682351593220; 
 Mon, 24 Apr 2023 08:53:13 -0700 (PDT)
Received: from [10.43.0.114] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 z18-20020adfe552000000b002f3e1122c1asm11076060wrm.15.2023.04.24.08.53.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 08:53:12 -0700 (PDT)
Message-ID: <26340d13-cd38-03eb-7306-abbbc1fbd794@linaro.org>
Date: Mon, 24 Apr 2023 16:53:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v3 37/44] target/loongarch: Implement vbitsel vset
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230420080709.3352575-1-gaosong@loongson.cn>
 <20230420080709.3352575-38-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420080709.3352575-38-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
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
> +#define SETANYEQZ(NAME, MO)                                         \
> +void HELPER(NAME)(CPULoongArchState *env, uint32_t cd, uint32_t vj) \
> +{                                                                   \
> +    bool ret = false;                                               \
> +    VReg *Vj = &(env->fpr[vj].vreg);                                \
> +                                                                    \
> +    ret = do_match2(0, Vj->D(0), Vj->D(1), MO);                     \
> +    env->cf[cd & 0x7] = ret;                                        \
> +}

Good.

> +
> +#define SETALLNEZ(NAME, BIT, E)                                     \
> +void HELPER(NAME)(CPULoongArchState *env, uint32_t cd, uint32_t vj) \
> +{                                                                   \
> +    int i;                                                          \
> +    bool ret = true;                                                \
> +    VReg *Vj = &(env->fpr[vj].vreg);                                \
> +                                                                    \
> +    for (i = 0; i < LSX_LEN/BIT; i++) {                             \
> +        ret &= (Vj->E(i) != 0);                                     \
> +    }                                                               \
> +    env->cf[cd & 0x7] = ret;                                        \
> +}

setallnez = !setanyeqz, so use !do_match2().



r~

