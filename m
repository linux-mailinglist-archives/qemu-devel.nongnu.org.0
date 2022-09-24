Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CAB5E8FCB
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 23:22:22 +0200 (CEST)
Received: from localhost ([::1]:39376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocCbN-00081B-8R
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 17:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocCXz-0004El-7A
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 17:18:51 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:47011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocCXx-0001DE-Ne
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 17:18:50 -0400
Received: by mail-qk1-x733.google.com with SMTP id d17so2078917qko.13
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 14:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=gX1vlkzCvl9jfnHxTN5KbGoIXxEMeDdtZ/J8eAOLshc=;
 b=KBEVVWf8h1FSH4Cch1japacwl33rNaIeiBke60IrKjNyh8RHEOaiPDHPNaZUSPokY+
 +lt6Spe0HeRD1o7iY+dSwrb60yn5FYf/kM9M85gMXxAU+FRauqz2sKF0GLlSs+fantX9
 oPBPaISHabnp215DjfB4GIiyvvZSPBTzvcgq1lmJoq9vyXVeK638tJlOkZTaF38YjrPn
 X74kdgRAznzixvh0+IBWl5BQBnvP3qgKb76M6e10d7+pEKWSLG93rHW+iZeM7dPDTVvs
 lrJ4DxK1msgoIoRz+IX8Q8Fl1ISJJlfws4Yf0BecGxqUc4PvVf2NtfCZYsxofFQVY491
 dQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=gX1vlkzCvl9jfnHxTN5KbGoIXxEMeDdtZ/J8eAOLshc=;
 b=huS0pSfqT3OlB6zlHIGqIV8rI71uGvfnZSVHTGel1LjySqoj2bGGduqycti0kYS5pu
 7+bsceuT5tuu/a2VMghN+nOHt78QSxsFDBemw1YExzF2WxsEATOB/gAD8CPHFh3cVV2q
 55jfPBOVhxugf5wKqxQq5T/qgiMMFvGIEP1euHTkgjULT4vfz8lK2sLtmegen9hHjZjx
 x+U1boVV8T0Fv2/8s+znGrhNKqvHHF/tqH3+3dw65WWd/WjzuaBL9rMYwmaDwSqxS9fU
 xN+uggBHA5nHdq3ftA86Qpp9mkB3O+13Dssgm0PhCPs3ug90Q0KOo5wTLmZ2m6HhD8wN
 NfdQ==
X-Gm-Message-State: ACrzQf3okN7mg+q2jMSQaLLMRCdcTuMDOYu/3MHcOfgzapcKGEhB0y5n
 9MWdsJVEwcYkiPrQhO7Aoi9KUQ==
X-Google-Smtp-Source: AMsMyM7MqngR0Il0ZuapCWJ5JvCw7QwaJwzDVVlUVoVtyyQYrAVkea6i/+gnNo5lSNLZxG7DkG1k4A==
X-Received: by 2002:a37:aa51:0:b0:6cb:cdcd:5953 with SMTP id
 t78-20020a37aa51000000b006cbcdcd5953mr9760617qke.613.1664054328743; 
 Sat, 24 Sep 2022 14:18:48 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3?
 ([2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3])
 by smtp.gmail.com with ESMTPSA id
 bj36-20020a05620a192400b006ceb8f36302sm8669378qkb.71.2022.09.24.14.18.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 14:18:47 -0700 (PDT)
Message-ID: <2d2b8a3b-1caa-ae63-d30d-952eaa58e539@linaro.org>
Date: Sat, 24 Sep 2022 21:18:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 31/37] target/i386: reimplement 0x0f 0x28-0x2f, add AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220920172507.95568-1-pbonzini@redhat.com>
 <20220920172507.95568-32-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220920172507.95568-32-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x733.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/22 17:25, Paolo Bonzini wrote:
> Here the code is a bit uglier due to the truncation and extension
> of registers to and from 32-bit.  There is also a mistake in the
> manual with respect to the size of the memory operand of CVTPS2PI
> and CVTTPS2PI, reported by Ricky Zhou.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/tcg/decode-new.c.inc |  56 +++++++++++++++
>   target/i386/tcg/emit.c.inc       | 120 +++++++++++++++++++++++++++++++
>   target/i386/tcg/translate.c      |   1 +
>   3 files changed, 177 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

