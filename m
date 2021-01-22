Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E574300E86
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 22:08:14 +0100 (CET)
Received: from localhost ([::1]:33296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l33fB-0008UI-JT
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 16:08:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l33df-0007uQ-8l
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 16:06:39 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:40689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l33dd-0002qh-I5
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 16:06:39 -0500
Received: by mail-pg1-x52f.google.com with SMTP id 15so4636530pgx.7
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 13:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/xmkKJSPsTa3TefUDSVWPklk/jO5wFLO2KHK4TGWN9g=;
 b=Tc0tC+3Fr/JfO4v9iWqIVdMwrIx8lceZ0mTscV2O80PZXdcZRgJ5Ol+2MmhbOlWtQI
 S0JZcBwujzuDWwL0yh5m59KBDJQJTjBta7hJNoaarwgRFKzcU93z/Y6HfVTEXjzkeks6
 lqMMARVNpUZ9IbKR5Jbo2RhgVqBntqAeZF7g1PXx2X7xCBYNaYL0Bv6IHXJVzfva2aQp
 6wFRcGIaWjIdE3OjJxSXYyPfm9TmDoPssPj455mv2UBqA3mja0i0W1+1Zz/gU9B+5Jk8
 2KKe4Ho2VMOJi3fIP+sKA/3EOTYHhUqsU8MYAtvCci65eXZcRg8qOV//q378dd/biKlg
 1ojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/xmkKJSPsTa3TefUDSVWPklk/jO5wFLO2KHK4TGWN9g=;
 b=tJpRaslhm/gTl158SthHPnVJAm0DgqblcmYji4wqD3Gffnj6QKOm4EiafGbDsc3mEq
 elWRWtWlv8NDm7/dufSkjT3AHEY8e/bXoS2iwCaOAhPh93WCGa6gLlf3kfYoNd1t3or0
 9E8tp/wmYgR6b0mm7lDdI/6NFaf2NHsWHPhzfB7isRRnz1eNBJ4yHWrFwhPM9QalgJrB
 1Q1T5WuclxG5Q5c56lKz+J/zFcYaDEYotmYsNlom2CKi/n8lcntgNEH+FE+EiniBL81U
 RRap7KMzMayX0vjMEFHOcqxU1QITzuvvmUoWQ4LeYhhECr8rvflFRcqT1Bl4lf52/+oZ
 XBGQ==
X-Gm-Message-State: AOAM530XEWyzdD2LXi4ICTDHI1gy6+gcIJMoYqkvbUO+43RtzgcG/Ts9
 EBNeNvOSqpsUijpJsEVojTducg==
X-Google-Smtp-Source: ABdhPJzQJbVZ5OOWbBz4gsnOYF1xG2Y5wax9I8XdXfbPD8mj4vN+k61mOtoc3hDHYXtt+RgitAKPEg==
X-Received: by 2002:a63:4a49:: with SMTP id j9mr6530334pgl.197.1611349596019; 
 Fri, 22 Jan 2021 13:06:36 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id a37sm8579730pgm.79.2021.01.22.13.06.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 13:06:35 -0800 (PST)
Subject: Re: [PATCH v2 3/3] target/arm: Set ID_AA64PFR0.DIT and ID_PFR0.DIT to
 1 for "max" AA64 CPU
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
References: <20210122044537.1823-1-rebecca@nuviainc.com>
 <20210122044537.1823-4-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bdb8ccbf-c95c-f6f3-b0af-1e0baf3fabec@linaro.org>
Date: Fri, 22 Jan 2021 11:06:32 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210122044537.1823-4-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.221,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 6:45 PM, Rebecca Cran wrote:
> Enable FEAT_DIT for the "max" AARCH64 CPU.
> 
> Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu64.c | 5 +++++
>  1 file changed, 5 insertions(+)

There is also a 32-bit "max" cpu in cpu.c.


r~

