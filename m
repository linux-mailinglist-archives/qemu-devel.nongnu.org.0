Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 799D0571192
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 06:55:29 +0200 (CEST)
Received: from localhost ([::1]:41406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB7vk-00063T-72
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 00:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB7qB-0003k6-Sx
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 00:49:43 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:37761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB7q9-0005dt-Ji
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 00:49:43 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 y14-20020a17090a644e00b001ef775f7118so10284772pjm.2
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 21:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uOprlVGQvRFmcbSXDm0xTImsnnGaI6HZynQbKm9+iIA=;
 b=P/qJISFVt68qTTmnd0NgybbzARx93hpRx+962b8/lDxfEr84lC9Hieg6FE+WBNqo7o
 Fs2Z9z4x7UOAPO6AY+iqzfnEkJjD1bcxQ6+80kEut56ksRbK+nD41Au7JGGulY2aJCCu
 JNILPMoDIWN7pABdn2ooMP7SA11RUJJs4ktp7Dp2CvTz4wFKV+ekIMhr/oa21Ip3tJmx
 r3fOiJDwUNrPX9BgCpG8niEo+lqJS6UW/drHpbAdtj6IM8fVI8+3huqpEzrdBO4VLHeY
 drMaOvOayXPON6BcmG0Npl3goxpQ9H9aRHX0fF8UBJf+gvgrANBwN8SGjy7k4mFaY9PC
 r6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uOprlVGQvRFmcbSXDm0xTImsnnGaI6HZynQbKm9+iIA=;
 b=LHFVOAEipsiubwrSOSNb8zu2pG9aHo5hOFuPS2GNv9mRi91z2uAlA2V7jun0MFwJBe
 LAghQj9kUIuWZjiMIFeA8FoEsWC7GLbcneuZWxCfT4dTHZ6Ve6ABG+iEdDFlq04+6Bgz
 LIrqW+/zOzbLtExCxVU9j30UP1D4SSXR4AgqIbvyYBTDZWm6Lo9QtvjyjXN7g4kHGhrs
 n0jy3QC0x2zd1tkkxMPvCbOXj48JGtC1yq4w18Y2sPyUT8O7GWS3rxiK200rcaExw9fS
 3yfjBoJxUCfQFYfKdSyy4hwq7JxlkP6aCZJAcQKmkYgx4jHtdCnYvsUEEU8j2542wtkw
 p+WQ==
X-Gm-Message-State: AJIora8nzfqleufxrmcsGWGqL2o2ZoQ98Y04yRsWEqtLUCecVs8yP/aK
 gjPiLUi9coUnB6E8wyFmxIWEhQ==
X-Google-Smtp-Source: AGRyM1tou2/QUkkNw8Rmt62iUPVcagJctyPk+bDA0BILsg9ZP/zoLLU74s7WlWnYxIQfpm6U0KwRBA==
X-Received: by 2002:a17:902:e885:b0:16c:49c9:792a with SMTP id
 w5-20020a170902e88500b0016c49c9792amr8895972plg.11.1657601379811; 
 Mon, 11 Jul 2022 21:49:39 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 gv21-20020a17090b11d500b001ef7a9bc07csm5528165pjb.32.2022.07.11.21.49.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 21:49:39 -0700 (PDT)
Message-ID: <c7897b91-dbfd-3a32-68c8-d7afa40495ba@linaro.org>
Date: Tue, 12 Jul 2022 10:19:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/3] tests/tcg/s390x: test signed vfmin/vfmax
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand
 <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220712015717.3602602-1-iii@linux.ibm.com>
 <20220712015717.3602602-4-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220712015717.3602602-4-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 7/12/22 07:27, Ilya Leoshkevich wrote:
> +/*
> + * vfmin/vfmax code generation.
> + */
> +extern const char vfminmax_template[];
> +extern const int vfminmax_template_size;
> +extern const int vfminmax_offset;
> +asm(".globl vfminmax_template\n"
> +    "vfminmax_template:\n"
> +    "vl %v25,0(%r3)\n"
> +    "vl %v26,0(%r4)\n"
> +    "0: vfmax %v24,%v25,%v26,2,0,0\n"
> +    "vst %v24,0(%r2)\n"
> +    "br %r14\n"
> +    "1: .align 4\n"
> +    ".globl vfminmax_template_size\n"
> +    "vfminmax_template_size: .long 1b - vfminmax_template\n"
> +    ".globl vfminmax_offset\n"
> +    "vfminmax_offset: .long 0b - vfminmax_template\n");
...
> +
> +#define VFMIN 0xEE
> +#define VFMAX 0xEF
> +
> +static void vfminmax(unsigned char *buf, unsigned int op,
> +                     unsigned int m4, unsigned int m5, unsigned int m6,
> +                     void *v1, const void *v2, const void *v3)
> +{
> +    memcpy(buf, vfminmax_template, vfminmax_template_size);
> +    buf[vfminmax_offset + 3] = (m6 << 4) | m5;
> +    buf[vfminmax_offset + 4] &= 0x0F;
> +    buf[vfminmax_offset + 4] |= (m4 << 4);
> +    buf[vfminmax_offset + 5] = op;
> +    ((void (*)(void *, const void *, const void *))buf)(v1, v2, v3);
> +}

This works, of course.  It could be simpler using EXECUTE, to store just the one 
instruction and not worry about an executable mapped page, but I guess it doesn't matter.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

