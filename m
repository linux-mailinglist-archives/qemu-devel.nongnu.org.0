Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 402FF6C4147
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 04:49:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pepSL-000279-Sx; Tue, 21 Mar 2023 23:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pepSJ-00026T-Lw
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 23:48:07 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pepSH-00022T-RI
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 23:48:07 -0400
Received: by mail-pl1-x62a.google.com with SMTP id le6so18115103plb.12
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 20:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679456884;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4zTbeXri+jYZxk2Kw4JSPJOAZ7TCuxF0ZXj/Y4kBmVM=;
 b=uFL6uQ+GiDnRoJkzaSdboAKaw6L4jCqVH9XFVgpctL+aBVDVkXTTYkYUhGO6Dqql0i
 ybB4RGieNcWca2N8+f/L1oO+RW/QTBptiuyp3jNgt02G81TIYl4C7jez2itPKKDSVsCo
 Dm2bI6MHy+k3K506IF7s8krnZsvY9BlppP4SXoa86pzCry0JMCGYoG0FHRr6CvLOM1LI
 XKphUbEVVxZeqTz6kTkRC5UJEMELFOZCklI38WvMAmljTEAWdde7Ilz4CccYmi2yxRV9
 cQn/pwi7IsWRC2sRtrw5PqXnRDcbn2TVUohvxqlKqDhxv0FoPymBPmzVnPAhxEV0WXWb
 Ye9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679456884;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4zTbeXri+jYZxk2Kw4JSPJOAZ7TCuxF0ZXj/Y4kBmVM=;
 b=FBdo8Z5QY7THg23PkF9VG1cSNGlIBewW2iVsmDPvaSz+4op3uiIpm5vvKoFe3q6GMF
 WdlJQZldlb9l+ctPkSmosr8C0H0DCwx52MoKFDUbBZmhPjNxDVxzrKJv2oSdUNcwG3bb
 hidXyYqWUkWazkNgoqJIk6ce/pAcw2VXdkC1putInioMgGspcGsx1PAB1ZbbM4d4u1r+
 qSkEVXhUTuwQ6sTC61OXW0b9bNb02jEgG0IjLExMCt+3TzkMLYpocNuItrKwYbJyPws5
 PnA2MHKPYX/dSiw1d0TqBE2+quV/l0um+3sEM1a3peHpggEFctuM4R4tfe50rPLtcYJO
 nKCQ==
X-Gm-Message-State: AO0yUKUtuxCeDSMaGPLtD8GHiz+FpH7kktPCEaozx+smKqV/jjP0eRgL
 4RTxyPX5IcBLQu3IFHDqXo3ykA==
X-Google-Smtp-Source: AK7set8lYKmPTdR3yfky00mLVNNz2rJKy1qHDmggYUlWTy+zLKFPgQFlQZajXe8irkxHUrRIiNczEQ==
X-Received: by 2002:a17:90b:4a48:b0:233:e1e6:33d4 with SMTP id
 lb8-20020a17090b4a4800b00233e1e633d4mr1945645pjb.47.1679456884244; 
 Tue, 21 Mar 2023 20:48:04 -0700 (PDT)
Received: from [192.168.165.227] (24-113-166-229.wavecable.com.
 [24.113.166.229]) by smtp.gmail.com with ESMTPSA id
 r10-20020a63d90a000000b004fbe302b3f6sm8883428pgg.74.2023.03.21.20.48.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 20:48:03 -0700 (PDT)
Message-ID: <ae1e3a4a-89db-4f56-2fae-5491f36cd48e@linaro.org>
Date: Tue, 21 Mar 2023 20:48:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.0 2/3] target/s390x: Fix float_comp_to_cc() prototype
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230321083322.663561-1-clg@kaod.org>
 <20230321083322.663561-3-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230321083322.663561-3-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/21/23 01:33, Cédric Le Goater wrote:
> From: Cédric Le Goater<clg@redhat.com>
> 
> GCC13 reports an error :
> 
> ../target/s390x/tcg/fpu_helper.c:123:5: error: conflicting types for ‘float_comp_to_cc’ due to enum/integer mismatch; have ‘int(CPUS390XState *, FloatRelation)’ {aka ‘int(struct CPUArchState *, FloatRelation)’} [-Werror=enum-int-mismatch]
> 
>    123 | int float_comp_to_cc(CPUS390XState *env, FloatRelation float_compare)
>        |     ^~~~~~~~~~~~~~~~
> In file included from ../target/s390x/tcg/fpu_helper.c:23:
> ../target/s390x/s390x-internal.h:302:5: note: previous declaration of ‘float_comp_to_cc’ with type ‘int(CPUS390XState *, int)’ {aka ‘int(struct CPUArchState *, int)’}
>    302 | int float_comp_to_cc(CPUS390XState *env, int float_compare);
>        |     ^~~~~~~~~~~~~~~~
> 
> Cc: Thomas Huth<thuth@redhat.com>
> Cc: Richard Henderson<richard.henderson@linaro.org>
> Cc: David Hildenbrand<david@redhat.com>
> Cc: Ilya Leoshkevich<iii@linux.ibm.com>
> Fixes: 71bfd65c5f ("softfloat: Name compare relation enum")
> Signed-off-by: Cédric Le Goater<clg@redhat.com>
> ---
>   target/s390x/s390x-internal.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

