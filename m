Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477FA352DAF
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 18:25:34 +0200 (CEST)
Received: from localhost ([::1]:58448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSMc1-0007As-Ci
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 12:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSMZl-0005lw-Tf
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 12:23:14 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:42510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSMZg-0005mf-Uh
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 12:23:13 -0400
Received: by mail-pg1-x534.google.com with SMTP id f10so3829343pgl.9
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 09:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1xGRAO8uFYwMPIUzyjH7fY98AaN77YRskCx/5s3MCKY=;
 b=cxDgncUK90MtsgC91nJd/vZR0z/I6JX0IUZRNm0rOgzliXTQbmLInPiylnupILDmmL
 i8okHLzB8Jd1sxFX0c9SzedXkJ7mxNTwH1+n4RNI5zDlivBsAF53URsknyeWetz6U3Xt
 5lt31RzyB8DnHvraKYVduprijzRgeyuHgfRhX2YTET9gfsZOjFTbRp/ZODFqfDUCuqko
 jYf/xm03wMq+CVqD0b3j2Iu67wcCJ+E5rnHYdb81IqZJxkYgkvvf3x+OJmJJVpbexlA2
 eDJ2py2nDdOxI7sdmuncGDbR5O2Hro0wa0oiOBO6JgBAuHIhD9WCgOuIONGupPEAMxIA
 kQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1xGRAO8uFYwMPIUzyjH7fY98AaN77YRskCx/5s3MCKY=;
 b=VADIAGRvDspaq8khPpdWgUpDuVuz6iIru36mfiVaFM1pnqhbHThW4oH7PCzqxjXkfW
 3bDah8mFZjKK1t+s86zDYkuxJ8ZEDNyqmonDM/SPM1BckoADdb/zRDSZ7VvR91S/LZw/
 mMI5Oa7kQWRYYzGKEExMsmVXBDIZZUuzJFAgdddyai/anJP6xSqfw7itzbOHzhIJvPHq
 lN1FrMRz9k04UeVD/LAW4LFm/9GLa6klUKm7op2KV3ALO9NX4xJWDKjzyijDHkh72P74
 km6iH6Ld5goSvBNQMsyorwZhsPE+8b8lz8Eyjki/JWKIOSZwUVm3AAbVniwG4rWknkls
 px4A==
X-Gm-Message-State: AOAM5315LTcVbkHNq4VQiA5048ihH2Edf8qrRUlrrt6pNki7scK/6nym
 wAHcfuEZkzZ3hqSzzjBHLCwzWQ==
X-Google-Smtp-Source: ABdhPJwUm73+UkLaRmGUnrA4ucOYeFnO7ltP4Zbf8/xc5OOK0YztiMCbH7UNoa6dV3VMHW2rLZV1rA==
X-Received: by 2002:aa7:8681:0:b029:1fd:4dd2:5659 with SMTP id
 d1-20020aa786810000b02901fd4dd25659mr12660476pfo.8.1617380587097; 
 Fri, 02 Apr 2021 09:23:07 -0700 (PDT)
Received: from [192.168.81.184]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id w124sm8745286pfb.73.2021.04.02.09.23.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 09:23:06 -0700 (PDT)
Subject: Re: [PATCH v2 03/11] tests/tcg: add concept of container_hosts
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210401102530.12030-1-alex.bennee@linaro.org>
 <20210401102530.12030-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <171d328a-85aa-0d40-c181-8c7ed9e56fd6@linaro.org>
Date: Fri, 2 Apr 2021 09:23:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210401102530.12030-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/21 3:25 AM, Alex Bennée wrote:
> While docker is nominally multarch these days it doesn't mean our
> distros actually package all cross compilers for all architectures.
> The upcoming Debian bullseye release will improve things further. At
> least for now we can get things like the 32 bit ARM compiler on it's
> 64 bit cousin.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   configure              |  2 +-
>   tests/tcg/configure.sh | 27 +++++++++++++++++++++++++--
>   2 files changed, 26 insertions(+), 3 deletions(-)

I'm not really keen on this, but I can't think of anything else. At least the 
dockerfile contents are also under our control, and this is only matching that.


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

