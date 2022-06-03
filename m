Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F9253CD0E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 18:20:51 +0200 (CEST)
Received: from localhost ([::1]:44242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxA2c-0005iB-Sy
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 12:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nx9z6-0003bY-W0
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 12:17:13 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:37751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nx9z1-00030P-Sq
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 12:17:12 -0400
Received: by mail-pf1-x42e.google.com with SMTP id bo5so7521279pfb.4
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 09:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Z9kQGa8PDySFOH457s1APvYiczMPNxn4DJVOw1bgws0=;
 b=qZ0g7VBq3iwotuuKUJrfYDgW7nbA7ULAv7AIVMAdLWjGDd/fX3mtJL2PRAqpcmFD+8
 a/kiw0px87tijkqT8rKJvMvqKdE37dMPB1vcJarxQ81vUiUE2xOVOWhRxRZ4EL6YN6E1
 Rbt2CzQuGTMhu20EialkMjKwYL9DSyxlo8mX4wfIOEtD4FCYY7Wheu3e2BZwESmfdbNN
 IVfL6T4QaRped6llYg0eu3EbpqCTc10N70qHn5XriXqfddbl7Ai6rXBCWu+nj5m32CeL
 7bRm7jbn/9JOGbbeSM0HOtw0WCe0h0ykkr9E5Sh1C9mwlEq2T3RMp60xnfMQQCZ/HAtd
 NQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z9kQGa8PDySFOH457s1APvYiczMPNxn4DJVOw1bgws0=;
 b=gPQu3kHDUhK45hBkukh5CEjZVZwTrAY+1yxv7StdAWjxyMVmGysNRkrT+eSjOpwpOU
 n+iUBm9k/XFysQYARf0D9JC7UU4B2AEsHZeEsSPRF+J/rBosjVjQ1flf3ZAvleJ8sbbI
 CGp3XpRriqKwW8JGk8J96x1AlevhmELvVv+3E73wU0UDN8GsS5QHmtSqbf0KBQirmFQ/
 rXeuTjoy6YFxBQcge3j9hUrtOmjmQpu0Nis1ilVeaktOdEguOkun4zFdNJ0frQFBkO8/
 Pn83w8rUA6N80pupDSqL2wqv0LynQVmGVcZypK4d8MQ9rw+dWYFyJab1xoyIrJjAO5iS
 2+5A==
X-Gm-Message-State: AOAM531ZdFOW6ucmA0boRsF1lzOzdccgiIW2XbZEonms6p21ymW9o0bG
 IUbRnzoQUKRFqlv8iyZT4hg1yA==
X-Google-Smtp-Source: ABdhPJyA6AvdYFBkrEmfcBSJa+tWE/mJZG9tAlU5pPnSq++nvhTbH0ObwTMO7jdxtjA7K04mZ8cWqA==
X-Received: by 2002:a05:6a00:1688:b0:517:cf7b:9293 with SMTP id
 k8-20020a056a00168800b00517cf7b9293mr78820693pfc.7.1654273025582; 
 Fri, 03 Jun 2022 09:17:05 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3286:cc26:3d5e:3f94?
 ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 h1-20020a655181000000b003fbaae74971sm5523284pgq.72.2022.06.03.09.17.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 09:17:05 -0700 (PDT)
Message-ID: <dabe3016-83a7-e5f9-6ff2-0fb20c7cfb25@linaro.org>
Date: Fri, 3 Jun 2022 09:17:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] gitlab-ci: Fix the build-cfi-aarch64 and
 build-cfi-ppc64-s390x jobs
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Daniel P . Berrange" <berrange@redhat.com>
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220603124809.70794-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220603124809.70794-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/3/22 05:48, Thomas Huth wrote:
> The job definitions recently got a second "variables:" section by
> accident and thus are failing now if one tries to run them. Merge
> the two sections into one again to fix the issue.
> 
> And while we're at it, bump the timeout here (70 minutes are currently
> not enough for the aarch64 job). The jobs are marked as manual anyway,
> so if the user starts them, they want to see their result for sure and
> then it's annoying if the job timeouts too early.
> 
> Fixes: e312d1fdbb ("gitlab: convert build/container jobs to .base_job_template")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   I wonder whether we should remove the build-cfi-aarch64 job instead.
>   When I tried to run it during the past months, it was always failing
>   for me. This time, I tried to bump the timeout while I was at it,
>   and it takes longer than 80 minutes here to finish - so I asume
>   nobody ever ran this successfully in the last months... Is anybody
>   using this job at all? I think if we want to have CFI coverage here,
>   it should get replaced by a custom runner job that runs on a more
>   beefy machine... (the ppc64-s390x job is fine by the way, it often
>   only runs a little bit longer than 60 minutes - I still bumped the
>   timeout here, too, just to be on the safe side)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

I think it might be useful to extend the other s390x jobs a bit too.  The last couple of 
fails have the test *nearly* completing.  E.g. your most recent pr:

https://gitlab.com/qemu-project/qemu/-/jobs/2544009687

Whether that indicates we've a speed regression, or host loading, or simply changes to the 
testsuite, I don't know.


r~

