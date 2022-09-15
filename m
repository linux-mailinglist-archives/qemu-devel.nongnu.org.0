Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 118E15B977F
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 11:33:47 +0200 (CEST)
Received: from localhost ([::1]:37110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYlFh-0005I2-Nb
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 05:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYkSG-0000vx-Ia
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:42:41 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:38722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYkS9-0000Gy-UP
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:42:40 -0400
Received: by mail-io1-xd30.google.com with SMTP id i7so5354387ioa.5
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 01:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=YuFB+qIprqQIIIxLQUd6GJxnBwg4GoK59uqfarnn8AY=;
 b=RBadalc/Fjqp+VJpiisCNjJsrNxPulwE7tm/CcEj5sxqwO/uGCOtcQAN46oEusgUV8
 QI86z3FiahPnW+jA+bwAf/RnFRcfUOfDQdpXCDd69jkmsBUZ0Sj9CePcuk7HWhAOKe/E
 Hwm0xyXF0nlz6AY6nJC/RVsrS04qIoE53DrboLj+JwzwF0rvlyl+RAn4Im2aFhQY/h2p
 i68nscyUoMamTRyS3j8AXEUg62N3zoI+grzmcB2Mbl6f8jJY7eXGCv/7uwK2v6F3ySZK
 Ehm4mhbeeTdGC+JRkZzh2Vp36M/0P61c4/eF+fmGCNPHb0/yeXLbb4YUr/poA/YejmxA
 Ugdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=YuFB+qIprqQIIIxLQUd6GJxnBwg4GoK59uqfarnn8AY=;
 b=7cQRnGN5IOKD7F7eiH9ii1zpGmPWKwMIzdcyuD27A0XerFaka8wJWh3B3s961p8e4t
 Fx7KAP/xvHvCxDgE1xrQJ2hYaCTJcMgUoVs0XPcAscnOP29T1SZa5WGnOK/S3/Tcqgk2
 xTaibfoJP4yCFpqmOc0tWz4KeGp7LEkTtXFsVJc/Qee9sKjQo1r67BsOBL8eNU8uRvB5
 fzfm2JuRdUER1GqlUbNLVBf1QkkGSseJmeLi3LCCnYpkkzb5r83y5WR23Nnb/ZZCetDm
 IgVPH6yk1CYXr4BhzSSsUt9aUWLV1OoHmHbNBKOeN0QvJYxUeCzYUhfWC6PCZigPFgpk
 G08w==
X-Gm-Message-State: ACgBeo1WCqAgy1YEWoJUfKquoAexXdSIddHyvc+iGoA9TuSBsJ3elYUP
 jb+S5xuA7tZ3RcbYwjuux4DR/w==
X-Google-Smtp-Source: AA6agR6tla/yVP8O54pQW2wS9BlM12eLD3seM6EUnYF0MubE2fm+5pCi966jaRFTrcexGVTlqRDQ4A==
X-Received: by 2002:a05:6602:2c4c:b0:6a1:6e51:6920 with SMTP id
 x12-20020a0566022c4c00b006a16e516920mr6788615iov.113.1663231344107; 
 Thu, 15 Sep 2022 01:42:24 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf?
 ([2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf])
 by smtp.gmail.com with ESMTPSA id
 q19-20020a02b053000000b00349e1922573sm200309jah.170.2022.09.15.01.42.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 01:42:23 -0700 (PDT)
Message-ID: <247b44f6-5d8f-f4a0-abc7-bbe018b80cd7@linaro.org>
Date: Thu, 15 Sep 2022 09:42:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 30/30] tests/docker: remove the Debian base images
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
 <20220914155950.804707-31-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220914155950.804707-31-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd30.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.583,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/22 16:59, Alex Bennée wrote:
> We no longer use these in any of our images. Clean-up the remaining
> comments and documentation that reference them and remove from the
> build.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth<thuth@redhat.com>
> Message-Id:<20220826172128.353798-25-alex.bennee@linaro.org>
> ---
>   docs/devel/testing.rst                   |  2 +-
>   .gitlab-ci.d/container-core.yml          |  5 ----
>   .gitlab-ci.d/containers.yml              |  5 ----
>   tests/docker/Makefile.include            |  8 +----
>   tests/docker/dockerfiles/debian10.docker | 38 ------------------------
>   tests/docker/dockerfiles/debian11.docker | 18 -----------
>   6 files changed, 2 insertions(+), 74 deletions(-)
>   delete mode 100644 tests/docker/dockerfiles/debian10.docker
>   delete mode 100644 tests/docker/dockerfiles/debian11.docker

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

