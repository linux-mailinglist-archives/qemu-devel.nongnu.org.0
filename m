Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EEA3DE275
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 00:27:52 +0200 (CEST)
Received: from localhost ([::1]:33614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAgPX-00021m-2h
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 18:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAgLt-00070C-0r
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 18:24:05 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:37582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAgLr-0004MC-EV
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 18:24:04 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 dw2-20020a17090b0942b0290177cb475142so1106077pjb.2
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 15:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=KFYDCifg/mbgVUn1ZvLLaKpJMS36pZOswFlSzWorrSk=;
 b=Rp53RfHMXKHfrdIP9tDdS3zXxib6ou9F8o3KH8F3zCsXb7BEGKCwK1a28fB8Xu9LEO
 R1zsdlSKJ2ko2SEJivg8WmPEu22PNPQ62dgoOJ+llkZYkckd0RYywlLw+fd6dtaOnUFe
 kRy1AaHYt1RNDIrRFBySduHp7ATwI0KVEfyWo8cRtus2xJBKEcbL7VYN+mYz9LfxQwNu
 xaIBqKW2SvsiEEtkakEliAh+FruAifRpGacDfecBO2RXHfyFLEav5Avd/Sf96SzSWOIm
 XJDfi/iV5UpvYTtBT8kQGj7mzZsPmeetbXrFotiGiJmAqrQ2y9IqRXaYD5HypiIdHh7k
 T0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KFYDCifg/mbgVUn1ZvLLaKpJMS36pZOswFlSzWorrSk=;
 b=Lapix3S3HeWPz8k1uD3rHyitSU7C3/LI+0MbU9Kfz7XqJVxLdNmErUvreqJr9680Lg
 0ZHoBSDwmTfoduXn1dtmV084Ems1Za88W3DwKauR9D58mVm8vlbUkaSFFfhZH2DJZ219
 3HKvZDthjoW9fhuwiof+4QVIDbYS9VEmvioZLDmHKp62ybhcBYqlndpPVT++/zx3mUSq
 tO0LP5RMRqUF//aQOAi9/p26340BHAJxvj1wFfr6RkHeDTQYwyRAiwbW5fP3aIRE1lex
 7/MbKOW+0VzPOCsYEc+gZkyZFhcnhfE5x8AJB8zAV4XZC+ORjjqSxNmYjaWP20roWQMX
 Gldw==
X-Gm-Message-State: AOAM531Ppw+IqHTIMAcU4J9/0TCjzM60/tnqnG+/6h0sBfwicB6ciEf6
 diXuSaNezC9GYbtpDRunTSAgAbvoi3yAqQ==
X-Google-Smtp-Source: ABdhPJxdAN5B6KFKwtTXQB2CjAU1zTlSTnxz81lc86uT1mFfRJ0HI8Ta4Flu509qYz6rdtvadLUa+g==
X-Received: by 2002:a17:90a:1f4c:: with SMTP id
 y12mr18647056pjy.60.1627943042203; 
 Mon, 02 Aug 2021 15:24:02 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id s7sm12592754pfk.12.2021.08.02.15.24.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 15:24:01 -0700 (PDT)
Subject: Re: [PATCH 2/2] target/arm: Implement M-profile trapping on division
 by zero
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210730151636.17254-1-peter.maydell@linaro.org>
 <20210730151636.17254-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1dfb2e6a-bf57-8d0f-88c1-7fe88b4857ab@linaro.org>
Date: Mon, 2 Aug 2021 12:23:59 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730151636.17254-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 7/30/21 5:16 AM, Peter Maydell wrote:
> Unlike A-profile, for M-profile the UDIV and SDIV insns can be
> configured to raise an exception on division by zero, using the CCR
> DIV_0_TRP bit.
> 
> Implement support for setting this bit by making the helper functions
> raise the appropriate exception.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h       |  1 +
>   target/arm/helper.h    |  4 ++--
>   target/arm/helper.c    | 19 +++++++++++++++++--
>   target/arm/m_helper.c  |  4 ++++
>   target/arm/translate.c |  4 ++--
>   5 files changed, 26 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

