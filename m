Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 781516E5B9A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 10:06:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pogLf-0002MB-7h; Tue, 18 Apr 2023 04:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pogLb-0002Ly-CE
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 04:05:55 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pogLD-0002io-C7
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 04:05:50 -0400
Received: by mail-yb1-xb31.google.com with SMTP id n17so1344441ybq.2
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 01:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681805127; x=1684397127;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1VMIU1N7SsHmLNvNAdUIekAa2S7rSpqwcQ5YVCfZslM=;
 b=kNTtJ9j9aPzOdIXvfWmdqPFSryl2XgtJ/vvvHkdVdmeYJwDY4JdM98l+2bJNsmVnyu
 jvyhMN+Ck3K88Fqfhj6rG+H5cO667Dh5W02ChXW8c3rUWZkLK9eqP8lKxzalQYBJ6pc4
 lbZOOWzOSy61LlWVD55Eb0HJaszilOJbShWIMSDAED/P0X7N6etGHhYSt+vCJ3mRSni8
 /EBfPlFgQ3ahFPqR20n5qmNMDOdEiBXELLIwp1MmhtRGxL6SmQJ1fcpjC6tDxN8Mqbdo
 2SdVckEkUEdb6J/AEyz/8cwA2OJyjiKS2JkLPAScfzUNb7wtTc6cixHKCXOHKZ8iOWnY
 iASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681805127; x=1684397127;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1VMIU1N7SsHmLNvNAdUIekAa2S7rSpqwcQ5YVCfZslM=;
 b=K2VQ9JeUnBxLL1NS6ewHKElksUJ/B6fvn/zJoJM4VYfCQpkvlLkEb9KkE0Kzps+X5B
 e6hQldmj36obD9afY8NTzLb46s5mbi3vXBW07udTxau4cnw5vNqTOZ5oB8Szyh504wbx
 ogfEJeVHTMU6L71B/U4+q0CLN6p7KFlDGwWcjTpd11x3QMYDV0+0b8B4vSheLYF+Gw8X
 caUh3XMvt2fnxQomj3b/e/okji0cfnLSuB0i4KKHpuxd7ZSaJhM0PTiUzPZ4mGWxm9x/
 CAZFLudIDu/V95JIQNnC9CWXk7uOY6zgDS4VRr6HLeOPm1z9hYhq+eveSrSUl4pY1YDC
 uD+w==
X-Gm-Message-State: AAQBX9cimpy2EEq9X50X8ZjaggKE1Ays+AJO2VVZpwuRyP/5FQ1d9m5q
 4qSO6RD8By5BSect6iMv3ccAQmoxxdaGrQk0iKkL2Ffd
X-Google-Smtp-Source: AKy350Yef2DenN5ZT9kDyU8DeBnt9PpUNE+pF5hLz+Ac/T4i18zAKRUdTjXxNJVKucwMrn5q+oAZpA==
X-Received: by 2002:a05:6902:72a:b0:b8f:3b9d:7dd4 with SMTP id
 l10-20020a056902072a00b00b8f3b9d7dd4mr18151028ybt.31.1681805127431; 
 Tue, 18 Apr 2023 01:05:27 -0700 (PDT)
Received: from ?IPV6:2605:ef80:8079:8dd6:3f0f:2ab3:5c15:47fa?
 ([2605:ef80:8079:8dd6:3f0f:2ab3:5c15:47fa])
 by smtp.gmail.com with ESMTPSA id
 cd9-20020a05690c088900b0054c02f97d8dsm2896927ywb.91.2023.04.18.01.05.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 01:05:27 -0700 (PDT)
Message-ID: <add60763-a53a-e037-1690-d9c2da375dcd@linaro.org>
Date: Tue, 18 Apr 2023 10:05:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 03/10] accel/tcg: Use one_insn_per_tb global instead of
 old singlestep global
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
References: <20230417164041.684562-1-peter.maydell@linaro.org>
 <20230417164041.684562-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230417164041.684562-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=richard.henderson@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.284,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 4/17/23 18:40, Peter Maydell wrote:
> @@ -219,8 +221,8 @@ static void tcg_set_one_insn_per_tb(Object *obj, bool value, Error **errp)
>   {
>       TCGState *s = TCG_STATE(obj);
>       s->one_insn_per_tb = value;
> -    /* For the moment, set the global also: this changes the behaviour */
> -    singlestep = value;
> +    /* Set the global also: this changes the behaviour */
> +    qatomic_set(&one_insn_per_tb, value);
>   }

Oh, one question: is it worth having the TCGState member at all?
Seems like these accessors could work just fine with only the global.


r~


