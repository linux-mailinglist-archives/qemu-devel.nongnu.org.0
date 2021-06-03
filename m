Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C00139A9D9
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 20:14:51 +0200 (CEST)
Received: from localhost ([::1]:60010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lorrm-00022X-5d
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 14:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lorqb-00018O-SB
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 14:13:37 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:39519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lorqW-0005fU-NG
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 14:13:37 -0400
Received: by mail-pl1-x62c.google.com with SMTP id q16so3311815pls.6
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 11:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=73+yzPk6DbjIAtAVuHelafGV9WvxWje/7XEQgNJEHMQ=;
 b=yXI7rIW7lT6GQLi0nLO/BxyJz4302hAg3dJ71CYMqm51KcoeLH6vex6Eqe+tg94Wm3
 c98IwR9j3qhHvl32CNBoRCTLe2Ld/JYUT8oJfrHjlTfcDDYMRAK4sqfH3Wf8SZXhpR/z
 S8+SD4rh8RhvdaiXzYMI/fCFxXHkzOZApP5plUulITR/7ha1ASGa0Gw7r9l3C/uP+Ker
 InLS4gLSHImQTInqtDmLKGMENJhdiIlpaevSY97LppEmQUsFlVAbvSMixZXNP1KZl6mX
 +1gaWd3FsGkH7DuxpjJpchpYYmTBNZ1RXewSH393WN+tee1xD/Vu5eanulICjpQmiYqM
 o0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=73+yzPk6DbjIAtAVuHelafGV9WvxWje/7XEQgNJEHMQ=;
 b=WyT4/77I25vIzgwgXNWbqMsiRRASJ4u+XLv8oUnmhvp2ul6pAmtjzl6Du9chkw4PDN
 1kFtLqlV/946fqLgcs0niRa9ybWEQdmUWH3lgbLdsbbbKfZkBDVlvjfNulHr1D+qGvy1
 iTeq/IYMCTXtvQJep8rkLABkDGWlSAtZAewgBDJ+r1b15v2CW/qKR/i6tZJsUMKyAbql
 vTwH//w3Tz30tVMA9E2bRlP2nTWn/tYUPXTuf7swj3XnBN8m5B6PuZ9PMl0MtpqJeafO
 9MqnTIIWiJLSPLfxdpCKYF6iRCjnSWeMLYgzdfykINg/0BsJ6b/tlIjkI8heNZZHEFP1
 Jkiw==
X-Gm-Message-State: AOAM53143U6FQ8oHBWo+NtiQC7oYWz+x19tzqCmQoApp6DQVxU+lGQaH
 +hu7USqcBgJDp0L6srumpmnbqQ==
X-Google-Smtp-Source: ABdhPJyP7H+wjhQ0Fb5cle3xO2J+QfvPqp3cOZ1I2DRv5IvnFXTGTPMhKImfoNi/SPV5Cv9zvP+RyA==
X-Received: by 2002:a17:902:b713:b029:ef:b031:2a9c with SMTP id
 d19-20020a170902b713b02900efb0312a9cmr338185pls.22.1622744010920; 
 Thu, 03 Jun 2021 11:13:30 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 y5sm2962423pfb.19.2021.06.03.11.13.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 11:13:30 -0700 (PDT)
Subject: Re: [PATCH v2 24/26] s390x/tcg: Implement VECTOR FP (MAXIMUM|MINIMUM)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210517142739.38597-1-david@redhat.com>
 <20210517142739.38597-25-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f02310d9-9655-0d4c-5fa5-480f8e4eec9a@linaro.org>
Date: Thu, 3 Jun 2021 11:13:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517142739.38597-25-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.603,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 7:27 AM, David Hildenbrand wrote:
> +    if (unlikely(nan_a || nan_b)) {

Perhaps better as (dcmask_a | dcmask_b) & DCMASK_NAN ?

> +        if (sig_a || sig_b) {

Similarly.

> +    } else if (unlikely(inf_a && inf_b)) {
> +        switch (type) {
> +        case S390_MINMAX_TYPE_JAVA:
> +            return neg_a && !neg_b ? S390_MINMAX_RES_A : S390_MINMAX_RES_B;
> +        case S390_MINMAX_TYPE_C_MACRO:
> +        case S390_MINMAX_TYPE_CPP:
> +            return neg_b ? S390_MINMAX_RES_B : S390_MINMAX_RES_A;
> +        case S390_MINMAX_TYPE_F:
> +            return !neg_a && neg_b ? S390_MINMAX_RES_B : S390_MINMAX_RES_A;
> +        default:
> +            g_assert_not_reached();
> +        }

I don't understand why inf_a && inf_b gets a special case.  Inf is 
well-ordered. If the arguments are equal you can't tell the difference between 
them, so it doesn't matter whether A or B is returned.

I would pass this case along to S390_MINMAX_RES_MINMAX.

> +    } else if (unlikely(zero_a && zero_b)) {
> +        switch (type) {
> +        case S390_MINMAX_TYPE_JAVA:
> +            return neg_a && !neg_b ? S390_MINMAX_RES_A : S390_MINMAX_RES_B;

If neg_a && neg_b, both A and B are -0, and you can't distinguish them.  So 
this would seem to simplify to

     neg_a ? S390_MINMAX_RES_A : S390_MINMAX_RES_B

> +        case S390_MINMAX_TYPE_C_MACRO:
> +            return S390_MINMAX_RES_B;
> +        case S390_MINMAX_TYPE_F:
> +            return !neg_a && neg_b ? S390_MINMAX_RES_B : S390_MINMAX_RES_A;

Similarly if !neg_a && !neg_b, both A and B are +0.

Otherwise this looks good.


r~

