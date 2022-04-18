Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03890505AFA
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 17:27:15 +0200 (CEST)
Received: from localhost ([::1]:51390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngTHV-0001xI-Jm
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 11:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngTGK-0001GL-MJ
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 11:26:00 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:35645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngTGJ-0004FY-1j
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 11:26:00 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 i24-20020a17090adc1800b001cd5529465aso12819309pjv.0
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 08:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6RpQBvbKCLQQHCHObw1BhBmOd5OLaa55HdOXwDo3+YA=;
 b=yddRy+m58R0sc5cM83jqMe76oJN9+NaXwpFsbupTA/lTojJ8C9Aeg4ZbLvDeWzJmM0
 Wi2MC0DIdfoU8Z5vurNiwg403bc0FamocqMxMeXgLF0rdIFYdHdtzRG8n8+xi/1K/PJw
 YKQ+t7dDGoQBaG/G5a2VZn1tgOmGUp0nzkkknfMZBqEpxoFw1kRAjF7nGhKEhHJAzTPD
 Gro6j2KTaEm7DnEYNxwd74Nxw3pFwIr2tJQ1B9Dx4BWUKitcypMXto8r7XpfG+8uLiZZ
 amcF4VGG/UdzAAl31Usop0jv1sF/Ww50iqzelT6T6jbXdAvRVhIPUQ3GX2hK6UrpGHPa
 fgzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6RpQBvbKCLQQHCHObw1BhBmOd5OLaa55HdOXwDo3+YA=;
 b=AaLwkcB/4M4fOghPw+AasOM2zxs0hi+x59xps3GsZs35KDgoW/K8/Xsy7FP2GMQm9X
 1TJGJ5+/b/JJGpQVFz035tnqdzpH7tEyyXSx543GbA9qlENh1NP50PQghPJgNTT22DDY
 9jtklZFuG39eJ+/BxUDJ5FpbuMqhqRt6NAlrN4BaEnlUFRHeJwzKghYoc0uWZYOkJhPY
 PWVHbxYnrdBaLkqO44FLFLa/wKwMt+NnZ2WJVfBTD2D5KIDbpUWkWbHOjglJyn0gUlz5
 clFFwQY7AG0YnzFhIS05NnK7Effv/EfBOoQZZyiCL38nwZeX2ZhyQGvTPP5E7xvnUq8a
 6+yA==
X-Gm-Message-State: AOAM5314ZvZSyQpS0UZvXsWGFa4KOMG83TcfFWfTCUuaSerV/ByEg4hl
 xLsbSj5MRGM8z0Fks3h5qd6EbEvB3hTPIg==
X-Google-Smtp-Source: ABdhPJza2WHgeJ40YGOkPNq/x7H2wxjbMjgVVy4DBVf8qLZFuPRJyX+hfJJXNWA2kYka7MNUktB+PQ==
X-Received: by 2002:a17:902:bcc5:b0:158:f19e:ab10 with SMTP id
 o5-20020a170902bcc500b00158f19eab10mr8921085pls.130.1650295557153; 
 Mon, 18 Apr 2022 08:25:57 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a17090a00cd00b001d297df6725sm3589649pjd.22.2022.04.18.08.25.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Apr 2022 08:25:56 -0700 (PDT)
Message-ID: <465c955a-aad4-8cc6-4135-46960edc1496@linaro.org>
Date: Mon, 18 Apr 2022 08:25:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 42/43] tests/tcg/loongarch64: Add hello/memory test in
 loongarch64 system
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-43-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220415094058.3584233-43-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/22 02:40, Xiaojuan Yang wrote:
> - We write a very minimal softmmu harness.
> - This is a very simple smoke test with no need to run a full Linux/kernel.
> - The Makefile.softmmu-target record the rule to run.
> 
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   MAINTAINERS                                   |  1 +
>   tests/tcg/loongarch64/Makefile.softmmu-target | 33 +++++++
>   tests/tcg/loongarch64/system/boot.S           | 56 ++++++++++++
>   tests/tcg/loongarch64/system/kernel.ld        | 30 +++++++
>   tests/tcg/loongarch64/system/regdef.h         | 86 +++++++++++++++++++
>   5 files changed, 206 insertions(+)
>   create mode 100644 tests/tcg/loongarch64/Makefile.softmmu-target
>   create mode 100644 tests/tcg/loongarch64/system/boot.S
>   create mode 100644 tests/tcg/loongarch64/system/kernel.ld
>   create mode 100644 tests/tcg/loongarch64/system/regdef.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

