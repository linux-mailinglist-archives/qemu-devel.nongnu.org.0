Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42845443BF3
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 04:42:07 +0100 (CET)
Received: from localhost ([::1]:44380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi7A6-00076J-E1
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 23:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi78o-0006FH-NI
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 23:40:46 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:40535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi78i-0001LL-Vh
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 23:40:42 -0400
Received: by mail-qv1-xf36.google.com with SMTP id b11so1423924qvm.7
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 20:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GbcXgax21uIToPanZooyhjKp/J4OykhPPKyraM0P2sM=;
 b=KgrZ0vXx08ML4IfpIbAqTmaXYPJQqyWtfDgY7fLhtexVOreKNZLlQeRbKrYXWnUQZj
 Tdiif2CHLuvRSzk/z2wAw6e9hivnRaPTuYgXCgXA4iXr/xg442hmgFGPqJlsuNb2t3zL
 DebASP6gWzPfRTNKVbpc8/k8A8bCfZ57mkme8cwVsaJ2eU0eYAK7F+Ibhtt04Rn4mOe+
 m4ChutPwkJDdnZuGwUUigL1FhqlZN4nOsT++y2TuI7gxH7SzLgSVPHYWEXf7ffVdRlbK
 nC5LvqkUwyoRMw4LDRTKzHNPGxbWGY2NHThh4PUjGZA6SgEn6Wn+XwqZq0JeAF53FU2i
 lPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GbcXgax21uIToPanZooyhjKp/J4OykhPPKyraM0P2sM=;
 b=IQldfoq1MTt8CabelBmdPlv6+wj/SWB75utPVTZG4dF0q4xZ5I292yxYf3WUkzfSdK
 nJKu1TpX76lGe1ZgR1h6l7SFme4XOyfC0HdW+A3YvSNYKR+K+KPI4cozfM4m73N5g3qn
 B8qShSH3rC4BM9Mlr+TiA536ntNlV3vmwo1a3v1df6FUAYOWyVEw58SQ9t+x5gXeaArX
 TvhpPvuYNf8UY3/NdyXSSUHKbV5+Voc3KESBW6zc/bAUrOipzRNFtHs0+hzAC7xEMum4
 5IIEYda3XAsFXtOMkb1Ot11P0SwGduYt8Fs6UjChU8cRhX6VPW4EDj1nnY7qSyhtsq4A
 yPlA==
X-Gm-Message-State: AOAM531aNaNWm8XCtQ3o2nOIlbkZtesQqxJozb8E3EzfU5zagRqA0W/p
 ELdi/WHKOBKLjIb61eyoVjoGww==
X-Google-Smtp-Source: ABdhPJwlX2WnQJ9KjMllE9tWx29AVlWmLcGxKomYd3x8rbd716KJBWpuVLFVgvaIQR5NHlIDfiPpdg==
X-Received: by 2002:a05:622a:346:: with SMTP id
 r6mr43215249qtw.0.1635910839956; 
 Tue, 02 Nov 2021 20:40:39 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id f7sm681365qkp.107.2021.11.02.20.40.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 20:40:39 -0700 (PDT)
Subject: Re: [PATCH v2 24/30] bsd-user/arm/target_arch_signal.h: arm
 set_mcontext
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211102225248.52999-1-imp@bsdimp.com>
 <20211102225248.52999-25-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d4673836-df0b-064d-50e5-2f301a7bf1f1@linaro.org>
Date: Tue, 2 Nov 2021 23:40:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102225248.52999-25-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf36.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 6:52 PM, Warner Losh wrote:
> +    env->regs[15] = tswap32(gr[TARGET_REG_PC]);

This will be able to crash qemu with an odd pc in thumb mode.
You'd have to artificially create this mcontext of course.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

