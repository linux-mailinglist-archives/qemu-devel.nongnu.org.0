Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 194C13A1DF8
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 22:09:20 +0200 (CEST)
Received: from localhost ([::1]:54116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr4Vr-00008h-57
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 16:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr4V2-0007Ht-Cm
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 16:08:28 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:40814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr4V0-0004Nx-Mc
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 16:08:28 -0400
Received: by mail-pg1-x52c.google.com with SMTP id j12so20563618pgh.7
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 13:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=PXLMXcHBmzb/zXY7jtiDe+4U02G2KJ9qGMP1y1d95v4=;
 b=QNA7T/yO/gUCJRoKvpGVeMxDtwJZr6r0+C3kZ6v09pTS8vwIER1J+aIar6Sv36Xr5+
 XYZKvUyGiCS5PrfC4Sveav0o0Yys7gspPPnpBBFjqppkQuqDFc1WYJa/x3x5c1sF4sbg
 JPXeZwylQuFONW0Tlzd3zQOfkruBtJFzA/D7YUiwQnBX1vu4+/0PPeOWRVMZfK6DMABk
 FCOcugkdLUUWJQ1olvKs2a04pKnX1/UR194aoQuyVFE2bvJ7VfkHmy7dsnX7o59GHkcG
 sZLS5geBuxaANTAgkrfEbec2ynIrFZXyNLI4pdbXJ2u6Q8lr7JpJmZ8kkQfIAaL4TpRC
 HjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PXLMXcHBmzb/zXY7jtiDe+4U02G2KJ9qGMP1y1d95v4=;
 b=FAMuXuZqMdRlsFL77mVZmBBlVrNYvLc2EtgDu/ktlcHLDRhcq4ZZk7CjVYkoWZIZMT
 YWkgke6Yy9EwIKKXPeXTX3KvafHND1MjGunqvtp2EsEdqZjeCVt3c5IXo+XS3PHNhBdF
 VzXL8+1IxwPlJ4ortv0LPsEDaCB5s/14LXS0uMri3pC2uDbS3vkB6jTdEplD25/abqHf
 RfdiPYjuiIvGZKJmFZaFE8foTtlHmgpYm7mKOrJ8bE5LkaJGn8/s2RoAWpdqlPfi7c5/
 R9vvXIsDuDclO7fpxIASQRPIKLbhNu6YmzajSbo4iEk8Z+jTRo7uVHjNQsEVCx5U/v0L
 VgpA==
X-Gm-Message-State: AOAM530xCGK8jgI2w5DT3EfkMVULgwxYcOpOCb/W/gTkoJXxNtVpfFpJ
 CK1cVZH5EgaQbrzqSPMBKAGF7dSCaecdNg==
X-Google-Smtp-Source: ABdhPJyFQOoTW/zOY+khCrKyYMEgFOmwfj/48iStFReCgcfi70i1BaALXCY23MfvDGwnFu7FTlC9QA==
X-Received: by 2002:a62:1c48:0:b029:2ea:1c13:e229 with SMTP id
 c69-20020a621c480000b02902ea1c13e229mr1362078pfc.17.1623269305273; 
 Wed, 09 Jun 2021 13:08:25 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 f28sm516913pgb.12.2021.06.09.13.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 13:08:25 -0700 (PDT)
Subject: Re: [PATCH 48/55] target/arm: Implement MVE VQDMLSDH and VQRDMLSDH
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-49-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <70319bd4-9699-d9c5-ffa4-5c3e28d23849@linaro.org>
Date: Wed, 9 Jun 2021 13:08:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-49-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:58 AM, Peter Maydell wrote:
> Implement the MVE VQDMLSDH and VQRDMLSDH insns, which are
> like VQDMLADH and VQRDMLADH except that products are subtracted
> rather than added.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 16 ++++++++++++++
>   target/arm/mve.decode      |  5 +++++
>   target/arm/mve_helper.c    | 44 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c |  4 ++++
>   4 files changed, 69 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

