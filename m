Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F69E42A46B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 14:29:51 +0200 (CEST)
Received: from localhost ([::1]:33718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maGuk-0005e8-6H
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 08:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maGZW-0006gr-94
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 08:07:54 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:45960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maGZU-0008CA-68
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 08:07:53 -0400
Received: by mail-pf1-x431.google.com with SMTP id i65so14476227pfe.12
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 05:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=84WNUBWjThH5Yyx3BZpsIrmZPueDWfG/TDSWA7CKFMQ=;
 b=h8wNOYoKs+k4SzE9qN0w2syPxghOb5lcJrlhKlICJkHSV7CCLE7pk4TvcRxCTmk+zH
 QwlVxHE6d9PSpEq4Dvn/YiskF3aC1xG7TtzX59FezHAWW05YreEC0Y8094quGcTyG0VJ
 6jBogCr3Ws5mW6onlngYf+BdhDNGNyJ/qomSyVObMnJrut9gGxFEdCnjMR0ToV66LeuM
 Ei1wWHp8DJw2Kdchg2zr8+kuH3uJNXUYLkSYt3wUvSqjQYCKSEY7wcufwjobZIu9rADS
 XV2FJ1YCkGxjZ4rhpPLWBaR5mDITQ2rSbfjkcVTyHx/P/l0bIUe/PnoZwQOciO9iUqxg
 4hLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=84WNUBWjThH5Yyx3BZpsIrmZPueDWfG/TDSWA7CKFMQ=;
 b=sNiyLzwtjdP4pJaAcJOEAl6CYm6ZfUB4J9LpOEn0MBpq6HQhpAeclcjsaVQMeG+Ewb
 gtC/9vdHJThAmakh9r0dE88a2x/e9jtQLFQG19zWVy1orIozzgbVKP9BEP8SmX+mzSgh
 X5Z3M581vLKb1WgS8dMDdG1vHQAemmcWaLrLdyaE/llM9IKLrMoiOQKdGTmfV8wKF6dN
 DSAf8PacRjpjmW/IVtavZo6Nb0olOHdKOVJP1rc/QCxtPvJxmckDI46fV5j0sJnpbSdI
 soxsy1bJoBwOR/XqI9gNHdIscfVISzv/uSMIvxmMaC7+UuyDdvTulRS+3H+33OHCqD18
 jVLw==
X-Gm-Message-State: AOAM532LkZJWPlJ9wGWUlaw/p7gTBYqyS15PWTX7E+GxgNgurii+rgN5
 sRyAfiolhpsbtsE465cRXkL7SQ==
X-Google-Smtp-Source: ABdhPJyJUtRlAUgXYhqY5VRLQUjl3YoYGB4u7YQjPlU9LWjWVZznqbmGfmH1Cgx7N16hSgSbScqihg==
X-Received: by 2002:a05:6a00:2343:b0:44d:2e13:3edf with SMTP id
 j3-20020a056a00234300b0044d2e133edfmr6485062pfj.72.1634040470507; 
 Tue, 12 Oct 2021 05:07:50 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id h23sm7795277pfn.109.2021.10.12.05.07.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 05:07:49 -0700 (PDT)
Subject: Re: [RFC PATCH] target/s390x: don't double ld_code() when reading
 instructions
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211012093128.3909859-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <db799d87-836b-5f90-7f40-d946d8779c40@linaro.org>
Date: Tue, 12 Oct 2021 05:07:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012093128.3909859-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/21 2:31 AM, Alex Bennée wrote:
> -        case 6:
> -            insn = (insn << 48) | (ld_code4(env, s, pc + 2) << 16);
> +         case 6:
> +             insn = deposit64(insn, 16, 32, ld_code4(env, s, pc + 2));
>               break;

Looks like some of indentation error?
Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

