Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57073420261
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 17:44:29 +0200 (CEST)
Received: from localhost ([::1]:53216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX3f9-0000w7-VS
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 11:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX3dc-0007eW-7c
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 11:42:52 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:45574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX3da-0002lL-H3
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 11:42:52 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id j12so247254qvk.12
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 08:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6oYERK7WY0BnBaaY2D1daaSG7/3fcU4cM2JLTWAS4U8=;
 b=HamwrdKLnTcNSNQLH49/JC575TLmKzdVGb1SQ+1yCCM5IBS5XrBwppJGfys/HMCyqg
 zRhPdGxF2qCK/zAJ5WC1j6RkTQn99aoc4fJjwmNUTRWMjrowXqN6vdaOpYWTPd02qHEq
 FhipvuG80z9x//imxiOvT3lmKmtpbCE2t7smz+zR1KLwGX1syGTOP9oJQT7kkFtbUDNo
 7OEIEzRirqx0oF5ikJKpJm6QrRPxh0qSuJDmujPQEsHmY3xSU6GnDNpK6zUt4lkJ5CW0
 wjdaRtgxImhgP7xUdhI/Ht0ChKc/U3WGUz2VnzmPG8fS0hgKo/HrB18X0DxpBBAtueh8
 tZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6oYERK7WY0BnBaaY2D1daaSG7/3fcU4cM2JLTWAS4U8=;
 b=f0Er2t+GlFUxhjhXKijPkrfObF3+FvH4MRMl6dOEGoa98gBuUakwhTgZsCr41SAxMg
 ej6LixI0W6KvpoS88dpNP2JJn9kBsZjLB085sjhZNL7lsAsRqRLLvu61omToug8YxRlp
 my0T214e7HNfUuK0LDVPQeXKdBZrpc/AIO/6V2Q9GTmW8J2Fyntncuiv2gDkCDcgKzJu
 cZsOqmoVj/59fozcKLfNnE8ikxPxEC9cAw9bj4TTm7GI+47pbNKtlwOXZ5JZd7xeibSY
 CMWzmMMC9nisDN3wGoQVWrsw2MRkbd+ckHJ+9cjNMohEqM49zYp74W0txYTJ8u5rwKLS
 qr3Q==
X-Gm-Message-State: AOAM531s7K6YC6uxFXDImOVoi+RIJj6POdlMQpzKDtnwDIWTmJRHqqA3
 Z4d1Z2KVWpJVuqhrJ6zGT9jykw==
X-Google-Smtp-Source: ABdhPJyi13O1mAe9rKqmYyoXCVN1R6T+l0N+S9Y5tRWrftkFdmfor5MewFpNlIDLIonFl/+Yp8OJ9A==
X-Received: by 2002:ad4:5646:: with SMTP id bl6mr19576219qvb.6.1633275769408; 
 Sun, 03 Oct 2021 08:42:49 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id b14sm6422223qkl.81.2021.10.03.08.42.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 08:42:48 -0700 (PDT)
Subject: Re: [PATCH 1/3] target/arm: Use tcg_constant_i32() in op_smlad()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211003143901.3681356-1-f4bug@amsat.org>
 <20211003143901.3681356-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b94aefa2-eec7-2eb6-7ec7-34b599514a78@linaro.org>
Date: Sun, 3 Oct 2021 11:33:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211003143901.3681356-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/21 10:38 AM, Philippe Mathieu-Daudé wrote:
> Avoid using a TCG temporary for a read-only constant.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/arm/translate.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

