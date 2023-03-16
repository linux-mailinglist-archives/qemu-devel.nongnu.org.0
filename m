Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7536BD5F7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 17:38:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcqbP-0003T2-Uu; Thu, 16 Mar 2023 12:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pcqbM-0003Sc-Ii
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 12:37:16 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pcqbK-0006Qw-6A
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 12:37:15 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 e15-20020a17090ac20f00b0023d1b009f52so5984456pjt.2
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 09:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678984632;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=//n2DfEFP633lx18EWrWXKaqYHGNheWDyoA7evR5uoI=;
 b=sl35LppsH2W7ht8LCuZMAVV+TOlM0Eh0lTLRieUYk0mw6xuKJhmOC1g4shu5KnFSCa
 TeSNWZ2CI8EQJkOm7P0thH0egSUbWxdtEuUZdK2DCJ/EMaPcF7U5iCaZrj+aaLoV4sDE
 YXQIBOy1m7Ch313U1lzJIm3Y6iIrdx77Dv454E4yPVD+Z8V6vWkpUGQSydcKQawbQ5F5
 Sjv/EfzcgmDJEceyhQoaH7wSXTtC9tG8FqUlYUirY3YllkrgXOkZb8jLL551/NO2sucP
 4YWxiiHrgWCFGP6tKyHDXWbjEYiSPLSgnLAeMXiuHHbQYprzs2axk1WkXzV0kPnSaJF1
 VPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678984632;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=//n2DfEFP633lx18EWrWXKaqYHGNheWDyoA7evR5uoI=;
 b=CCgYLkAVGmeAOeqctsWO/m4jHOd5wyGARysnkgXv0HABnkUkhOeNbf5QYXhb9NlH/r
 xR55ipQ3y0KKgD5OaR8T/BMroElCgE6eplB0w+GFulGe0p5VjpVcqI1QQxdAWpjSNHSY
 +G/4SRkL6goPChXbLpF70LqVN9kl4JCGjCKfR/LtMBVaRLE0lbxJnCX57jbxZTs4xpHM
 +C/NOJXNR4fZZZ6I46J7ACrZcyYycWwhNcmrUg0NdZYA3gw9Z93WoFfRtXjW3NUMCAgm
 /msuIOZaRIB6PcMZF7onsPu2lcDrTyBy2AdxuSg3qLWh3UgdogwTr+226zTULpKfz9rd
 /VMg==
X-Gm-Message-State: AO0yUKU5b9ZgJqQ3WjYIwi20x1AeV9Ub6Wtk0P2GCryKpXYN9TXR5Axd
 LIEPIZE/A+CHFneo6H3QX181Xw==
X-Google-Smtp-Source: AK7set9G6vM0KyZcfXgqukQ736Ivu1aCcNcIc4coBmgN4EUGdBTM2OAuVFx3aPf8tDTYZ6e66FMbUw==
X-Received: by 2002:a17:90b:4b0a:b0:23d:3fdb:f3f with SMTP id
 lx10-20020a17090b4b0a00b0023d3fdb0f3fmr4930368pjb.1.1678984632383; 
 Thu, 16 Mar 2023 09:37:12 -0700 (PDT)
Received: from [192.168.57.227] (96-82-119-43-static.hfc.comcastbusiness.net.
 [96.82.119.43]) by smtp.gmail.com with ESMTPSA id
 f22-20020a17090ac29600b0023f4274bd9asm494859pjt.29.2023.03.16.09.37.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 09:37:11 -0700 (PDT)
Message-ID: <623e7cd7-1bf6-b12c-0943-02ecfee318e0@linaro.org>
Date: Thu, 16 Mar 2023 09:37:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 02/32] tests/docker: all add DOCKER_BUILDKIT to RUNC
 environment
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230315174331.2959-1-alex.bennee@linaro.org>
 <20230315174331.2959-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230315174331.2959-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

On 3/15/23 10:43, Alex Bennée wrote:
> It seems we also need to pass DOCKER_BUILDKIT as an argument to docker
> itself to get the full benefit of caching.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Suggested-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/docker/Makefile.include | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Tested-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index 54ed77f671..9401525325 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -39,7 +39,7 @@ docker-qemu-src: $(DOCKER_SRC_COPY)
>   # General rule for building docker images.
>   docker-image-%: $(DOCKER_FILES_DIR)/%.docker
>   	  $(call quiet-command,			\
> -		$(RUNC) build				\
> +		DOCKER_BUILDKIT=1 $(RUNC) build		\
>   		$(if $V,,--quiet)			\
>   		$(if $(NOCACHE),--no-cache,		\
>   			$(if $(DOCKER_REGISTRY),--cache-from $(DOCKER_REGISTRY)/qemu/$*)) \


