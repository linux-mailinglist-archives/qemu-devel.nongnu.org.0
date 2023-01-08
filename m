Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC29D661A77
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 23:28:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEe7i-0007zp-N9; Sun, 08 Jan 2023 17:26:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEe7h-0007zh-2K
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 17:26:37 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEe7f-00045c-EV
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 17:26:36 -0500
Received: by mail-pf1-x42e.google.com with SMTP id x4so738420pfj.1
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 14:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F6Koi3a8eFFIhos5liG2t91Nf2fvjUkt929d09BEY8w=;
 b=WmI6aRh2k2yf2URm1FPOjCRuG68kvT3EaRKF87LzGIZP0ExacncKZ2TIvRsMstPBWA
 CsjvxvU6GEaszO5pS4u99eGNflq+SKqaEuWHF0Na+FjZiFT8QrL+LkTQoGTqwovOjdmb
 5TWSRRdCC5e1Bpk4zBylHmr7eLu55pj+7hBJoYagpzQ2WhhM560NkMXSh/F7BNdxT0bJ
 wctfuuVFgPkq2rlXL16mE6bFDCfB+EuDhNx2vfG17Za2Sym7gVejQaBImncLVqXFC2iy
 uF7IqKjUNRK0ZVWPfexKk9NfCsnneZBOvJdbrY0lmjaELeQA/1gNIMwNtyhkxATEMMxk
 lg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F6Koi3a8eFFIhos5liG2t91Nf2fvjUkt929d09BEY8w=;
 b=NlHoKos5wn/hAaL/HZFDh8LbqRn8ButaHGepnfFLXZMdZKXuoRYCDpbIIFDXIxxAO3
 aGdXdzbg+CitOrxldDU4SlKgca/qGC+rjGGnYlqJq6b3gOMFWvBVRTjCMTqCWL3kNp36
 Cu/xBlYjASapIuurNtVkFuC4nzI7CrtJNKymiJfbb3Np0unJq3R96xJeN80SIQpVnHLg
 t/JZGs2mRUtEwm76wsdI1kXiOte/u4M8C/9SD2XksJ60UC0tk6g5MrYIFAlP63YB/Lk3
 wnM9vg+ItZhBe+qryRMriZL87bwN63BTC6d0RoWa4ZJMWAEPIkIdNlWkVSREO8Ux2sxL
 PKSQ==
X-Gm-Message-State: AFqh2kp4cBHk1sbPcvQWEvs30xHnXXPPKL2E0NKNXwBS821ySO9i5zQB
 2wQtts9/sCB+ZPmZbDSAkAGH2g==
X-Google-Smtp-Source: AMrXdXtIwQQ03JsBdhF6bnlt6Md3FMrKwCRUInrAj8zLn4JdRP7ANy1VN1VOI6XBlim53oLlGxa/NA==
X-Received: by 2002:a05:6a00:1747:b0:582:7d41:c8a4 with SMTP id
 j7-20020a056a00174700b005827d41c8a4mr36344452pfc.15.1673216793506; 
 Sun, 08 Jan 2023 14:26:33 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 y29-20020aa793dd000000b0057462848b94sm4586137pff.184.2023.01.08.14.26.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 14:26:32 -0800 (PST)
Message-ID: <bfae98eb-43e3-afe3-be69-105bd44870ec@linaro.org>
Date: Sun, 8 Jan 2023 14:26:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/1] tcg: add perfmap and jitdump
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: "Vanderson M . do Rosario" <vandersonmr2@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org
References: <20221114161321.3364875-1-iii@linux.ibm.com>
 <20221114161321.3364875-2-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221114161321.3364875-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

On 11/14/22 08:13, Ilya Leoshkevich wrote:
> -const void *tcg_splitwx_to_rx(void *rw);
> +const void *tcg_splitwx_to_rx(const void *rw);
>   void *tcg_splitwx_to_rw(const void *rx);
>   #else
> -static inline const void *tcg_splitwx_to_rx(void *rw)
> +static inline const void *tcg_splitwx_to_rx(const void *rw)

This is incorrect, or at least not as designed.

The idea is that any rw pointer is not const, and any rx pointer is const, and this 
declaration prevents double-conversion.


r~

