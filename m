Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 146BD3B66FB
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:48:44 +0200 (CEST)
Received: from localhost ([::1]:32810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxuR8-0001w8-MZ
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxuPt-00013T-5l
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:47:25 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:46068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxuPr-00011U-Hi
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:47:24 -0400
Received: by mail-pg1-x52d.google.com with SMTP id y17so3656663pgf.12
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 09:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=x/JO9EyefEZKY19G+iILqyqd2Lr9kfCO9R0GOnEhJQ8=;
 b=yLF+C+fPdmm6If+eBQ3gnRm0aQxH6Vo1+5PIMYoUjvzWImMRS7LqszwZT+EwUIvlaV
 gJXXjREDFWe4L9FJR6C8sFMS/c4PFrTVOF7IfxPbnxTCmjX8lMKcQ6usBv9dx4s6zJCu
 pvpfav01xh7ewI8doiozt9gNV4AOiMBBFx3rGH9WiUCYcUE2+qe8o8GTXA7jUwUHTzPo
 m6exFhIbtBgZs5MFwebH7Y+4zFj5ZQGZxzidY5CgAGCf3ijFCKf6pPT6klqz8uwBSMh5
 vI3TpyW2G+MqO0HKLmf8K52CIkxWZG4zljSBkZTSnCjkaYpgqxM+IXB4gbVgmPm3JW9w
 6jzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x/JO9EyefEZKY19G+iILqyqd2Lr9kfCO9R0GOnEhJQ8=;
 b=EslWTKM2j81A4VCXcvLrUck3T9wSK8L5SQva6PaJ1+cIS1Mmwey/Bk6HBCKG4pomix
 EOsH9c7F1QDihMSeMaJ37JJETYUjunq/qcROrTntG4t8/hmbTX26PvJ3nJc2Rj4Hg7zn
 xpRsx3KxchCQl/+Rb8Q1iD4o7pvg0jROVFerAbG+S0TXhXOyjQExiU8vLdvymfva1Kxf
 G2o7U84Vm1yVPRB3oAXTUcrCAjIPKctZZx1O0quqtRCBKp9gday95uHMc8x3g2jFt9SM
 Tu6V3CBiHOX9kWnnxIbK45/jx6KSsrH9jNlXnSqIqpPoFSv0/ctiVi22NrIm0NgTtrqZ
 RwFA==
X-Gm-Message-State: AOAM532uLuLOwpJUVrzxgrTRjHFjB9MCofZibL9XNCrTGsLauYKtAFWL
 d4FosVgAMh3SFYwo8tVmnP9ETd1nfOeAcA==
X-Google-Smtp-Source: ABdhPJxqlrfOGb5c1VFUQ4FCmnid8J2mmF+dr2xs3Asds2X2ePvndSwoj8wgpOJal3rGlio8iai8Fg==
X-Received: by 2002:a05:6a00:b92:b029:303:1a7e:ee40 with SMTP id
 g18-20020a056a000b92b02903031a7eee40mr24961294pfj.76.1624898839792; 
 Mon, 28 Jun 2021 09:47:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d16sm24979pjs.33.2021.06.28.09.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 09:47:19 -0700 (PDT)
Subject: Re: [PATCH 14/18] target/arm: Implement MVE VADDLV
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <be1ce116-73be-0528-166d-b77997b81f8f@linaro.org>
Date: Mon, 28 Jun 2021 09:47:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

On 6/28/21 6:58 AM, Peter Maydell wrote:
> Implement the MVE VADDLV insn; this is similar to VADDV, except
> that it accumulates 32-bit elements into a 64-bit accumulator
> stored in a pair of general-purpose registers.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  3 ++
>   target/arm/mve.decode      |  6 +++-
>   target/arm/mve_helper.c    | 19 ++++++++++++
>   target/arm/translate-mve.c | 63 ++++++++++++++++++++++++++++++++++++++
>   4 files changed, 90 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

