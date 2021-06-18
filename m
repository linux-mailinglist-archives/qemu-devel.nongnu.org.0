Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FE33ACDD7
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 16:47:34 +0200 (CEST)
Received: from localhost ([::1]:32850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luFmP-0008Pf-Kl
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 10:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luFjy-000735-8K
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 10:45:02 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:42682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luFjv-00063h-U1
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 10:45:02 -0400
Received: by mail-pg1-x52e.google.com with SMTP id i34so2376794pgl.9
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 07:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=h2idtcNg73Ez5P3bSTmn0ayv02j/HEPwlAJMMROze/c=;
 b=tzpEDCtoDOOTNia5QDFCHs68GT6ugHe+lYbHTfKjurM2CcY/tKdAaGU9k1rkdcl0I9
 oBxdGRa9ASMvicjXrJVzTyYx6TtRx8DrG99NGY1sSjUxXlOIHior3r40kKIAMMs4wwfD
 uw44BCrlDBwJmhwBJdZvGcClIqxGSd/x4BvrjyQHVisszFuLqMuwTSdjkRADtoxQlqlr
 jmswZdLX59O97/jONSRi3xXq0E/6yvbS3WntTkTxP0ZBgl9CfCzuqdiEOzIE3F0f/u1P
 jC6bjMgGeBpuy4C+D+ZfXyzM9Cmw53OcFm+eYV3C6j8i3L1oPc1Hj3Lb/pbY+MDY8Bpz
 Jl5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h2idtcNg73Ez5P3bSTmn0ayv02j/HEPwlAJMMROze/c=;
 b=hB67YkWIddpY9Kcu6HWr9SPpPyiSJM8jyVYDPQtGe03DL5PMtpu6InYxS4GxDw1+0a
 ZeljBFhG3aL4FAY2yW7o+TP5zo5ivXjqueBYMCAnDqD59cN40DXy02IrCTxBxLCJHyd5
 cRKTfE9zaWa2cQ509mKFEzPCxxBcSuG80oCl/MAWzrr6+ytZjaVVPZcKxk+jnHsVzXJ+
 hkGSyKIbKGw+cl69kUsOBOtrLIeEB7Jk27dzBvL9r/9Ffv7X3PlJs1QRT3Agz7BIBbmW
 G113cxGT7cLalMp2Fxt1HMZeMCtGjtmlGJCKZjYBaBtoMQyujC44Rf49oxyOu5c01xiB
 PG4g==
X-Gm-Message-State: AOAM532nwwSUBoVOoEVPe8U+54Zo3VWqMmQGdzcyMjgEWmLf2/Z/19uH
 y0em3T1tKmNN0KIZ/+sSbSod0ZFWYjIstA==
X-Google-Smtp-Source: ABdhPJyLoyyxiLHeO4sgobc6LkkCLgw93K6SOhvAlXZn+XmDSy+WgAqFjJ7Fd+aubRMuqj5iUauORg==
X-Received: by 2002:a63:d908:: with SMTP id r8mr10399741pgg.414.1624027498052; 
 Fri, 18 Jun 2021 07:44:58 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id t2sm5522230pjj.19.2021.06.18.07.44.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 07:44:57 -0700 (PDT)
Subject: Re: [PATCH v3 01/44] target/arm: Implement MVE VLDR/VSTR
 (non-widening forms)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210617121628.20116-1-peter.maydell@linaro.org>
 <20210617121628.20116-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9f5024ac-2c22-2484-2eab-39506a36073f@linaro.org>
Date: Fri, 18 Jun 2021 07:44:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210617121628.20116-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
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

On 6/17/21 5:15 AM, Peter Maydell wrote:
> Implement the forms of the MVE VLDR and VSTR insns which perform
> non-widening loads of bytes, halfwords or words from memory into
> vector elements of the same width (encodings T5, T6, T7).
> 
> (At the moment we know for MVE and M-profile in general that
> vfp_access_check() can never return false, but we include the
> conventional return-true-on-failure check for consistency
> with non-M-profile translation code.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Changes v2->v3: pass MSIZE to specify memory size,
> and advance addr by that rather than by ESIZE;
> advance addr always, not only when predication passes.
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

