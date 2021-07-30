Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 052BE3DBFDC
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 22:34:47 +0200 (CEST)
Received: from localhost ([::1]:41538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9ZDS-00021l-48
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 16:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9ZCg-00017v-BM
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:33:58 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:40500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9ZCe-0002Np-L0
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:33:58 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 u9-20020a17090a1f09b029017554809f35so22420819pja.5
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 13:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=EFDmzefkk3tdwffgmXbSaxcxkRkpMcHi0LkfxkXHGdM=;
 b=ly1tcmuue5YVGjrUFGfd6uKmnLrQzfmgfEVBCwD3qrE3Q4enb6eq4qJ6EWohO/z0CD
 pJKQNbKH1skNPmo0vP4ME3wYlf17J5CvcP1iVcgannmMbo7snRutOc70Nz2vvafxiXZ2
 oh+GMHgJu7Uzk+BHxTHr7/APWg3/1Yf+StoL8zerllMAzCec2GYBl1zdUJn6kSxXk/Mt
 RTJI6wtgVZKFT4P7gsteM0FZqyDId9yWRsc757oLwyg7FFGJYfqfVm+lcB8GRDglAiKM
 sMmqhFswq+NwNQCEHTcPCr1Xip0r8TUDexfj5JCbbleWp2M53DCbYOAHsKkJjDMk4mKM
 S1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EFDmzefkk3tdwffgmXbSaxcxkRkpMcHi0LkfxkXHGdM=;
 b=QtVjLoUruZk5GT5S0mH7SHaUcFUJh21N3v2hqSaXViB+k/1USR9suEHjaEYffzbiD8
 AvuJcaDKM7RrGhbvG8IYC3hB6329e7i6R/vflB8Kg1m0b9ysfJl0kPvTm3yH23dwuA+0
 QRVtBW448EMBnZFnZ64gVPhA5SYzCgqVlbKkZNRKUB06XRioXjbYIpPbJGMTRhyMFwiW
 4f2EPzBvJ1o9ClZ1Bt/F0UeZoKUW9mb/jsyjlWWk9c1+YLupi0Xmk47/B90dSm2VGaUG
 yidvW8AX2O+OmDDsZ+xJbSijAM8UhKRD/+Pe6OOJgVIFHbx1NdoJOr1hAtl/BLGP5Zyl
 SgDA==
X-Gm-Message-State: AOAM533vRnNb1xJ3DR2F7Hwa2H6e5/4gbufgv4DrLmTMMSQnhTDsfyPg
 GuVVSz3f2L6jXLFsTe7pnYRiJU+fYKZPmA==
X-Google-Smtp-Source: ABdhPJyR5d9m0OPHF7zF9yID5vB1/DXk/9dG+v2BHT2ZL8k2BiIT7Hbn/bMZ7qYwVZalPPNW6s3JfQ==
X-Received: by 2002:a65:61ab:: with SMTP id i11mr3855545pgv.168.1627677234880; 
 Fri, 30 Jul 2021 13:33:54 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id l1sm3787393pga.35.2021.07.30.13.33.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 13:33:54 -0700 (PDT)
Subject: Re: [PATCH for-6.2 51/53] target/arm: Implement MVE VCVT between
 single and half precision
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-52-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4c2eae08-0c32-e775-0964-f2861483bc27@linaro.org>
Date: Fri, 30 Jul 2021 10:33:51 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-52-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 1:15 AM, Peter Maydell wrote:
> +/*
> + * VCVT between halfprec and singleprec. As usual for halfprec
> + * conversions, FZ16 is ignored and AHP is observed.
> + */
> +#define DO_VCVT_SH(OP, TOP)                                             \
> +    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vm)   \

These might be easier to read as a local function with an extra "top" argument, rather 
than as a macro, since you're not passing in anything complicated.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

