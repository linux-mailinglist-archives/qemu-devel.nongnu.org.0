Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D14B443BBE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 04:10:30 +0100 (CET)
Received: from localhost ([::1]:37606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi6fU-0007Qr-Tb
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 23:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi6eJ-0006ZN-GR
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 23:09:15 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:45575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi6eH-0006zW-H8
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 23:09:15 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id s9so1320723qvk.12
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 20:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SWAWNiABe9ewit8ahsexjqamAFe5TvNwMXkxMutiRuQ=;
 b=mlR/M5bTQ+UpCV0k2EXWgLi3ScE/M2duKdftrkyupVU6+iekbqQJxrsdvXMAnUiQFq
 wLbH983etyZjzBLNf+bMOpKuiYdfFYPmsgEwMtccpu/evokyD+pYu4NnZ6YfgD4HayMl
 yyacE4MfdT4jCqfn10KUZDtLVY4vQBIaPxW4bfrJ7twkMmvRHsMW2PrIohKeN8oNhDax
 v60ZTntHj0xerft+Mv0R8FFyFpE9ajiHbDmhZ+tUFcWN3owmxYLbwHA2buTwzY1xNVZQ
 0SBD9bfEImrMITGWiSug5185ZlcE74yceuc5Gv4V3NpoYbgvlSepomIecia5ltlZjQGf
 VCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SWAWNiABe9ewit8ahsexjqamAFe5TvNwMXkxMutiRuQ=;
 b=LBo2liY7x/h4t/s+f/J6JqdoUsZQRP9dSvqZXYMr4UiJpb+L2vzgUkk1a7zxcWEzG8
 4qRSuVDyvaDfBT26RuTcfHpKBb8rT+OtqJTRB5ZN0qzDS1p5DM6EL0YzIFlkRSDKCbYB
 VmG042a/upJ2/+cY4GXBxwjyLsDO8VjjwsPghstRSfRtjGtZImXCTyA5gHM4WmFeAabI
 aUwliR2SLoVBcv0op+4SFI0y1JGXIK9iFbXrlyIv64Mij6yFJSyDmUTVuDJXf9MfJdcr
 rPy2o36hFyNhCZuDn3cCzUyDSdPnPgnqoQzxn8zNPg0+C2v0Q1rpIk2tuC0OuxtcFdxE
 7LxA==
X-Gm-Message-State: AOAM533mlMow1LAIet/YEKgfuGGsjIpiC5e+c1qcxjYs6thIbeRIB90R
 1BHTsSQKRUvym/dp59ugDbtGzg==
X-Google-Smtp-Source: ABdhPJwUEUj/hMaGVFGDa30jaRou6LrR8qaGXYfd/NQqU0XffvP8dnHTLc6gIxjSg8xTFT1IKR/RDw==
X-Received: by 2002:ad4:5966:: with SMTP id eq6mr40349493qvb.64.1635908952432; 
 Tue, 02 Nov 2021 20:09:12 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id e10sm665997qtx.66.2021.11.02.20.09.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 20:09:11 -0700 (PDT)
Subject: Re: [PATCH v2 05/30] bsd-user/arm/target_arch_cpu.h: CPU Loop
 definitions
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211102225248.52999-1-imp@bsdimp.com>
 <20211102225248.52999-6-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c99c8d10-2b57-09a3-8175-69901877faa1@linaro.org>
Date: Tue, 2 Nov 2021 23:09:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102225248.52999-6-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2b.google.com
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
 Kyle Evans <kevans@freebsd.org>, Olivier Houchard <cognet@ci0.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 6:52 PM, Warner Losh wrote:
> target_arch_cpu.h is for CPU loop definitions. Create the file and
> define target_cpu_init and target_cpu_reset for arm.
> 
> Signed-off-by: Olivier Houchard<cognet@ci0.org>
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> Reviewed-by: Kyle Evans<kevans@FreeBSD.org>
> ---
>   bsd-user/arm/target_arch_cpu.h | 43 ++++++++++++++++++++++++++++++++++
>   1 file changed, 43 insertions(+)
>   create mode 100644 bsd-user/arm/target_arch_cpu.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

