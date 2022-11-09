Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECF06221B2
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 03:07:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osaUd-0006VV-0V; Tue, 08 Nov 2022 21:07:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1osaUa-0006VH-TC
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 21:07:04 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1osaUT-00086u-UO
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 21:07:03 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 c15-20020a17090a1d0f00b0021365864446so567824pjd.4
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 18:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oREZuEMTLg7xt+eQLzSPOII1brjdUbmD6KR+qXK9qow=;
 b=LhXnyFcQCy8Gshn1vvHhQ8xI17LNqCpcn+mtB2AfoMfsC4zX8C6gfOzz6GhI2XjWSl
 P7iGS9qnJh22nk2X1mEWVsxehIu/zvnYXuts7FcSRvLx50h5DzbsCF6AJK9hBmZ5zW45
 2BYAbFzbjWRJ4JzR9e+NZxc5IH4sRTKlQM8CVfc6DyadpC+04GAdI0gRPvx3WEG4aC4T
 8IRKGhKhsjy41lNGhTXLdjYAzhzx+wCtI9Z0+1PxKDrjmQt00xbWCEPBAmtFUF3PY+81
 y9vKduPOHkCK5poiu+SV1QyRUKThYLR/NBWhibpsK0hyHog6YwlTrP/3FQ9IBqF6qN2o
 V8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oREZuEMTLg7xt+eQLzSPOII1brjdUbmD6KR+qXK9qow=;
 b=EFGAtyQeJ7tvCHab8ICvL1n3twtXMkqBi2hBlktZS273OvBNO+T+PzI1iB8tBplvlb
 ysxS/TMdbU6yeK36bWV1tz+CiVXCqfz4qN9YJ/Pj+/cMT3IjFXJpUIObVHBemq8ab0/y
 kjuInXUrJibaE08/CGpdxHi3pz69wu4O6S5zdLhSiugbQScgtnJCiQUbqfbiVeaI+vyP
 3EgRQTiylgcjDVPmjXbnbUcIt53+yy56ZbeLIbV63GZ4G3s8hTNW9WxKtl0C8IHVxtu2
 Sl8cBylkeUi8nyu2QfNzKNikTu+G4jgz4O9/630RS4Ez7V8hUU/9TjiF8zlx8v2i+cKr
 tV/A==
X-Gm-Message-State: ACrzQf22KKX8FWvz4VSKIv/WjSxGBl0h59JkjowCoHQbWg9OLyhNo+bB
 rKdOo/cPrVLhZdvmlVT0MFbYbQ==
X-Google-Smtp-Source: AMsMyM7/yyj0Yelhvt+X3MbfM1dg5tFOy7519HbQhQpcS/T2l8AICDWG5VC/rOBL1eFVWxIIt12o1g==
X-Received: by 2002:a17:902:e552:b0:179:e795:71c5 with SMTP id
 n18-20020a170902e55200b00179e79571c5mr58076307plf.57.1667959615261; 
 Tue, 08 Nov 2022 18:06:55 -0800 (PST)
Received: from [10.3.10.183] ([203.47.88.146])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a170902f54d00b00178aaf6247bsm7612469plf.21.2022.11.08.18.06.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 18:06:54 -0800 (PST)
Message-ID: <8da99147-5eb9-3b2b-44f5-64d29c610ca4@linaro.org>
Date: Wed, 9 Nov 2022 13:06:49 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 2/2] util/log: Always send errors to logfile when
 daemonized
Content-Language: en-US
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221108140032.1460307-1-groug@kaod.org>
 <20221108140032.1460307-3-groug@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221108140032.1460307-3-groug@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

On 11/9/22 01:00, Greg Kurz wrote:
> When QEMU is started with `-daemonize`, all stdio descriptors get
> redirected to `/dev/null`. This basically means that anything
> printed with error_report() and friends is lost.
> 
> Current logging code allows to redirect to a file with `-D` but
> this requires to enable some logging item with `-d` as well to
> be functional.
> 
> Relax the check on the log flags when QEMU is daemonized, so that
> other users of stderr can benefit from the redirection, without the
> need to enable unwanted debug logs. Previous behaviour is retained
> for the non-daemonized case. The logic is unrolled as an `if` for
> better readability. The qemu_log_level and log_per_thread globals
> reflect the state we want to transition to at this point : use
> them instead of the intermediary locals for correctness.
> 
> qemu_set_log_internal() is adapted to open a per-thread log file
> when '-d tid' is passed. This is done by hijacking qemu_try_lock()
> which seems simpler that refactoring the code.
> 
> Signed-off-by: Greg Kurz<groug@kaod.org>
> ---
>   util/log.c | 72 ++++++++++++++++++++++++++++++++++++++++--------------
>   1 file changed, 53 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

