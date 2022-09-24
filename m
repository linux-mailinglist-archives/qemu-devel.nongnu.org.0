Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2CC5E8FC8
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 23:17:13 +0200 (CEST)
Received: from localhost ([::1]:42258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocCWO-0002wz-Sn
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 17:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocCU9-0001Se-4C
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 17:14:53 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:47004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocCU7-0000dY-Hx
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 17:14:52 -0400
Received: by mail-qk1-x736.google.com with SMTP id d17so2075793qko.13
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 14:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=LeYJT+DdsC55wBo5eJlHwgtD9uFjrf+kEFs8swzr1pw=;
 b=SCKwGV/NDliQC7v6U/BaA9QzTRtGmwikGFeAOYOZ39honQv8IotSoqXhLWsPz2ej9l
 n4nlQD6ppzvcEGEkKj013R9zo8OsBjannqDOTW02B6RO0TDxM1JSyAo6PPpVHNxrymTa
 Tp51U4S/jUhP2Dvb0ZBPQ0YmqneKZeGuB7lSKhDYYC2/YqHJPV3wn86MuNczoTPylldS
 w27Jh1o3gL4O2sXuKdUrw8Re0kkXPLAV99U+wQke6n879P3peoprrVQu0Vekyg8s5I3n
 yeYPhUipHazEd8GglYoxbQ26FnP1etY4FHT2wM0IYVW7qmCrUfp3SZv0ff6puZQz/QMo
 5/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=LeYJT+DdsC55wBo5eJlHwgtD9uFjrf+kEFs8swzr1pw=;
 b=GKxixRuRnGMtPm3MxyBWc2h3r+rnvMn9joMr+tz2cZ00NHFMcowyoBAkqgVeHAHNKy
 XRkjnByCQjoeXy1WecRigRSLu4YlwOoi+WwnNhqqQVacpYfgDGvLLo6UQOvBp45OIteJ
 5xKTAcDPjX4zRBS5289P1A71u0J1/fSzpQWVgKbwF8WYWIaQi/pUKe69peqLOs+RvwUc
 rhCHp3iDskYNrR7xDF/oGUtSi2mIhaXvKpOSff+KzqPKmGnrm6jrj6d2KecF6y3VEUFp
 5kqIzQCOa17YizEA2pEX4N6a7Jl9tPi0v2yQPhn/V1MSj1QodYWZMVikx1bLSJXMsTVF
 at+g==
X-Gm-Message-State: ACrzQf2WL5/0MxVLw2P0My94vy7A5YeDMyK+NCNmf8BF+9gV3REx/R1Y
 P0sPUUh5fuZ5aCXcrP/C+SLOzg==
X-Google-Smtp-Source: AMsMyM7CqXMFFaPmaVcwL92EF8c9yAYZkESt7YUvfZWtVb6Kd1pjXYHEWsiCopfKcZHtgPgNSraAPw==
X-Received: by 2002:a05:620a:a58:b0:6ce:7e34:901b with SMTP id
 j24-20020a05620a0a5800b006ce7e34901bmr10067211qka.467.1664054090166; 
 Sat, 24 Sep 2022 14:14:50 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3?
 ([2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3])
 by smtp.gmail.com with ESMTPSA id
 bn29-20020a05620a2add00b006bbf85cad0fsm8500301qkb.20.2022.09.24.14.14.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 14:14:49 -0700 (PDT)
Message-ID: <daac6289-29a2-98b6-b869-cb99f826ea49@linaro.org>
Date: Sat, 24 Sep 2022 21:14:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 28/37] target/i386: reimplement 0x0f 0x38, add AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220920172507.95568-1-pbonzini@redhat.com>
 <20220920172507.95568-29-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220920172507.95568-29-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x736.google.com
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

On 9/20/22 17:24, Paolo Bonzini wrote:
> There are several special cases here:
> 
> 1) extending moves have different widths for the helpers vs. for the
> memory loads, and the width for memory loads depends on VEX.L too.
> This is represented by X86_SPECIAL_AVXExtMov.
> 
> 2) some instructions, such as variable-width shifts, select the vector element
> size via REX.W.
> 
> 3) VSIB instructions (VGATHERxPy, VPGATHERxy) are also part of this group,
> and they have (among other things) two output operands.
> 
> 3) the macros for 4-operand blends (which are under 0x0f 0x3a) have to be
> extended to support 2-operand blends.  The 2-operand variant actually
> came a few years earlier, but it is clearer to implement them in the
> opposite order.
> 
> X86_TYPE_WM, introduced earlier for unaligned loads, is reused for helpers
> that accept a Reg* but have a M argument.
> 
> These three-byte opcodes also include AVX new instructions, for which
> the helpers were originally implemented by Paul Brook<paul@nowt.org>.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/ops_sse.h            | 188 ++++++++++++++++++++++++++-
>   target/i386/ops_sse_header.h     |  19 +++
>   target/i386/tcg/decode-new.c.inc | 112 ++++++++++++++++-
>   target/i386/tcg/decode-new.h     |   6 +
>   target/i386/tcg/emit.c.inc       | 210 ++++++++++++++++++++++++++++++-
>   target/i386/tcg/translate.c      |   2 +-
>   6 files changed, 529 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

