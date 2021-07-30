Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8FB3DBF21
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 21:42:56 +0200 (CEST)
Received: from localhost ([::1]:51000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9YPH-0006rL-CA
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 15:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YO7-0005v6-Qo
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 15:41:43 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:42767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YO6-0000nQ-99
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 15:41:43 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 o44-20020a17090a0a2fb0290176ca3e5a2fso15888123pjo.1
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 12:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=XIkIZUOXJZAefI+U0E2hTAaqkdhFCiAxcuC4xPnzYMA=;
 b=VBddcm3j6amC//jKLLg8WLKAY4PPBL1kXTHmQazS0BXzHCpIbSRKe93hU6UCjVyopg
 GqgEQqrmYEv478A+hJ317G9wg4WMY6yP4iHomcTMu2fp8B84wg39mFgGUDImU+8WNvAx
 z2+HUXcvXM3DHQE7zAnEZjw0mmYXhKizjKF8nLEaRA03wxsrNWXI3gfFl+PksSnOJg4w
 a4DIRAhYCqyrwNzzgv7VM6aXUZkKTwqeyJdKW47oF2tRvH0MjTLo5sxS/7KGv1a53cxr
 2/w8Nkh43Blo62HhVamK9lxeZp0FgcuKiGeoa569P3m0W7/cI3gxGkiZg4E3/pvKtPRD
 A5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XIkIZUOXJZAefI+U0E2hTAaqkdhFCiAxcuC4xPnzYMA=;
 b=hJVsyf8u5RL91nGzpKZI8cRXsBCC5R22XYt7zOom5mT2pi+LvM0hmDSvaSQE7EJss8
 qh15fGQYrh1qmGREXgAzFjZ34tErGlxbENNy/qCbq9Kr1KQmU9ElqfVpTu3A7Qq7Ad6J
 X7Xu3FDmFSaptshlD0Kn788KEqlSsosX7TyzgqDOQ4rhL1kX2aPW1d52dylBkvH+ZgsA
 9Ps4tLpC/D7LmXVllRJkv8QN81YEGf9job0qNy4JSxZI74cNmjm1fG+H5isA1ke3XVGD
 x/+djbmfivQ2WtQYSOK5ZIOTGJ0Q267eRO4gopQHJMZpFj4ctz0QgMRqH7TpCUTHwx1Y
 RKaw==
X-Gm-Message-State: AOAM530aaHj3l2z2R6AdUaiAemEKhkobd5iR+Q8/NRhxnDzWzK+rCzOR
 wvdZwRiAQoLCBk12H/SoF5otyilnm+fqQQ==
X-Google-Smtp-Source: ABdhPJxCne4bxjJLlVFN+40G672h4SNz5Hukj+6TPnD2fw45jMEy0e3lgu6KuF57YYeDE8qwC88pZQ==
X-Received: by 2002:a17:90b:4d0b:: with SMTP id
 mw11mr4854420pjb.122.1627674100731; 
 Fri, 30 Jul 2021 12:41:40 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id g14sm3116440pjj.16.2021.07.30.12.41.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 12:41:40 -0700 (PDT)
Subject: Re: [PATCH for-6.2 39/53] target/arm: Implement MVE VFMA and VFMS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-40-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <10327c97-27e2-b3d2-8e5f-20a4ec41351f@linaro.org>
Date: Fri, 30 Jul 2021 09:41:37 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-40-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

On 7/29/21 1:14 AM, Peter Maydell wrote:
> +            r = FN(n[H##ESIZE(e)], m[H##ESIZE(e)], d[H##ESIZE(e)],      \
> +                   0, fpst);                                            \
> +            mergemask(&d[H##ESIZE(e)], r, mask);                        \
> +        }                                                               \
> +        mve_advance_vpt(env);                                           \
> +    }
> +
> +#define DO_VFMS16(N, M, D, F, S) float16_muladd(float16_chs(N), M, D, F, S)
> +#define DO_VFMS32(N, M, D, F, S) float32_muladd(float32_chs(N), M, D, F, S)
> +
> +DO_VFMA(vfmah, 2, uint16_t, float16_muladd)
> +DO_VFMA(vfmas, 4, uint32_t, float32_muladd)
> +DO_VFMA(vfmsh, 2, uint16_t, DO_VFMS16)
> +DO_VFMA(vfmss, 4, uint32_t, DO_VFMS32)

Here's where I think passing float16/float32 as the type will pay off, with

   r = n[H##SIZE(e)];
   if (CHS) {
     r = TYPE##_chs(r);
   }
   r = TYPE##_muladd(r, m[...], d[...], 0, fpst);


r~

