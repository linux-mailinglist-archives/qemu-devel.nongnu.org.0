Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE953AD04E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 18:25:07 +0200 (CEST)
Received: from localhost ([::1]:40392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luHIn-00053B-1T
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 12:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luHHq-0004CE-Eu
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 12:24:06 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:41846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luHHm-0002T1-AB
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 12:24:06 -0400
Received: by mail-pl1-x62c.google.com with SMTP id e1so4921554plh.8
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 09:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=kqxZVhRCut8KjPpPX6+r7e1BX4UG3cef/g/Yi+njN+M=;
 b=s1lF78EDKZHuCrUfDSRvLmicYONDOWOVsn/I23/FntKphOINvEGziO9lh/zG4eNaHM
 sdc7gKTh4/NkNIQwVckjm2L+eTnoi28Kvj1x8eXRA/X2MPVW2Mo42PFZ+6rfQUvT2WaV
 eolmnJPbL5eV5M9Xu58uQX3mTGfMgFE4SukMJ4w3ifMVm3oRNmtZ3dM0336drKXZztVs
 O2yhQw6FsoNL0Qpb5krjbzeEiwuk5k3OB6r2nzwiEpXtjq7djeHszjQgqNEZA+4kE+7W
 CJlD/Ule1W7gqvR4hKVonMt7jqqhMpI0wM9f/oGS96jV6eNG5qLKLay2UoTGXhLdrmB+
 dg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kqxZVhRCut8KjPpPX6+r7e1BX4UG3cef/g/Yi+njN+M=;
 b=RacKrWzddAG2PQs7LZ7tC/zwnPkaLvxnZT9Cj34IBSSO9yzXZmtP8rRXPQN4dBKwMm
 vFCKPtD8HGj+uMNlGEJXuE+GnNThhidCNwWUGgb+z3Ez1jmcUF17D5iR7bJBfOuFV20Y
 1SHZWlKkd64aBmpNBbJtKQXMDXbFgp3y6fZ5pTbHBzMdIYEb5+CEfP5gviPrlcitL0KC
 JL4XYwDPl8fD9DkEIP5hZpkmaAN7FpHc8Ka+Tmzvuv8Na1TZV8ZAO0POdOrJOUQWly3J
 vgHtnzo3GJdpAOQtDVDaf2HhwkWGdB8vDige+4Zxv+WEOLyxpKkGI+2cOLdD72FDzzTe
 OZ9w==
X-Gm-Message-State: AOAM531qkK1wryEZ9NR6nronITj4M+kaMSWdg88bIIytxta/GFny2SEx
 kXs40DUwAEuHGKgxtqax3y/GlH3e3CwjHg==
X-Google-Smtp-Source: ABdhPJzOivhyfLH9Kn5U3bCL5GmBprhDC5FbnwmrUXhFt+Ec97ljrZ4rIABEDmywTYagVFWIYMZR+A==
X-Received: by 2002:a17:902:be10:b029:109:7460:cc41 with SMTP id
 r16-20020a170902be10b02901097460cc41mr5463055pls.4.1624033440923; 
 Fri, 18 Jun 2021 09:24:00 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u9sm9415332pgp.90.2021.06.18.09.24.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 09:24:00 -0700 (PDT)
Subject: Re: [PATCH 6/7] target/arm: Split vfp_access_check() into A and M
 versions
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210618141019.10671-1-peter.maydell@linaro.org>
 <20210618141019.10671-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <af54bb16-d390-0402-2c6f-4eba6b1ace65@linaro.org>
Date: Fri, 18 Jun 2021 09:23:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210618141019.10671-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

On 6/18/21 7:10 AM, Peter Maydell wrote:
> vfp_access_check and its helper routine full_vfp_access_check() has
> gradually grown and is now an awkward mix of A-profile only and
> M-profile only pieces.  Refactor it into an A-profile only and an
> M-profile only version, taking advantage of the fact that now the
> only direct call to full_vfp_access_check() is in A-profile-only
> code.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-vfp.c | 79 +++++++++++++++++++++++---------------
>   1 file changed, 48 insertions(+), 31 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

