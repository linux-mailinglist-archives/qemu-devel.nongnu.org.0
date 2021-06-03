Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8914F39A81C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 19:20:32 +0200 (CEST)
Received: from localhost ([::1]:55566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lor1D-0006Ni-HA
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 13:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loqxX-0001GY-Sm
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:16:43 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:33549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loqxU-0007Qa-V4
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:16:43 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 k22-20020a17090aef16b0290163512accedso3729330pjz.0
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 10:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FtNAMkyuR6DdTqQtDmmjUjfmQ1AjtIwvxI4mVzNAENM=;
 b=fRbH8wLeK5VDMsZcHAhko31in/jmmXvvSymfwmIcMr7es8mTskeCQ5Rv7qY8CMl8Ol
 Rj4xwAsowSwfpem95tmbDYfo3kSX0VjyccfCH36k9V9GMqi5l97srSZJJ8Yr3MSPwf7m
 l2B7fTThwwtmx/6xn6kZbpc7lAMH73aQc0CUbOGhCtqAWpnqX1T4OXziWhNUuEJloMt/
 vuoZzwpjHn0gskpGf7arxRDNn6Z+RwKPklRXRJ1gqO6cmIegDxdFhl9zwlyeQdlzjnoL
 LCKRFsrZUydqU2pCxGm8kvW146kouj3B0I0LJ/ET7PC2hSSXF9N9qBhQwocLsc9resYl
 qIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FtNAMkyuR6DdTqQtDmmjUjfmQ1AjtIwvxI4mVzNAENM=;
 b=Q+2OiYNtQVjzjoyyz3pxyjXuQTAC/yQoYuZCYfYNqEkr7dmDUfEqBhyOoHIm0v/sHt
 mkSEh+CfIfIQ3aZUbpmNzXWrrqqpls4Dp6IltOl7aOPGhxN+30dVtoNvf5B2yGsOtJG+
 LqdQTxD/0mTP+89JB8usoeZV4i29B4AeVMgTrVrBOJ4paiYs7Dl2UPOkEuxud4DiIhgO
 RLXqt93Lh72eMlnIXtIaKEQS/7B56iWi49VgPJy7INE4oPeAit4RQHsxr3q++wXerrW/
 e0TLPIUm4+jovNnDVbxrGzlGUJEJZ4B4i4KLtrMgsdRYS8m7az47LS3Nn/fsHvQUkO2Q
 KM8w==
X-Gm-Message-State: AOAM533mLnNHDqO+5yY83NxVIYqxVX5tU5tUimAYHGGP4CQS+Qtx6pze
 bcB9P6dAtsCDsHSG/vMZdwWIWA==
X-Google-Smtp-Source: ABdhPJyonSCDztWwjgUBcQKqXjG4PDkPeYI5nQUIA6tUWxwDpjj255hmim3ijKBWy/8BchZwtqZskA==
X-Received: by 2002:a17:902:7d83:b029:105:8b10:629e with SMTP id
 a3-20020a1709027d83b02901058b10629emr220260plm.0.1622740599371; 
 Thu, 03 Jun 2021 10:16:39 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 h16sm1325077pfk.119.2021.06.03.10.16.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 10:16:39 -0700 (PDT)
Subject: Re: [PATCH v2 04/26] s390x/tcg: Simplify vop64_2() handling
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210517142739.38597-1-david@redhat.com>
 <20210517142739.38597-5-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <64d0fa38-7f8d-b6ed-d871-68b97fa20d9e@linaro.org>
Date: Thu, 3 Jun 2021 10:16:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517142739.38597-5-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.603,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 7:27 AM, David Hildenbrand wrote:
> +#define DEF_GVEC_VOP2_FN(NAME, FN, BITS)                                       \
> +void HELPER(gvec_##NAME##BITS)(void *v1, const void *v2, CPUS390XState *env,   \
> +                               uint32_t desc)                                  \
> +{                                                                              \
> +    const uint8_t erm = extract32(simd_data(desc), 4, 4);                      \
> +    const uint8_t se = extract32(simd_data(desc), 3, 1);                       \

bool for se?  The argumemt to vopN_2 is bool...

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

