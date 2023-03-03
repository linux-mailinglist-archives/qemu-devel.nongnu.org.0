Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3E06A942C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:31:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY1kC-0001Nc-79; Fri, 03 Mar 2023 04:30:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY1k8-0001Mp-SP
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:30:24 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY1k3-00039N-Pl
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:30:21 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so3454488wmb.3
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 01:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677835818;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JkipkX6fXxbmgyU33W5HJhgndliilpZcOl1Orvy7OCQ=;
 b=gaKg76r6WBgtiay+bW4cQISmgvlilupjgeO5gnbV+RX9MdbAu5kqea4ffb7r8+JbYV
 HzefGoUUnFi/6CTrPia+0qbrkyBqAow69euRFYeUb0sGN/5M/qkgTtvQ0j9A3aoZGVz7
 u/f7dq2y0OaiVm2+GlV4TpD6YX9P5dwuidTlZoSgAwEm1Ghzj4jRqbB+aCd0lHyrgHk2
 dKI6c5bkrwrZIHX7QBSwoHJov7nb1KwFDEdEiM+kVb+ZdwypDXF99kBMCZEk238MjpTq
 L3+KUlHMBjQ7144bP1dhP7TcmwPyQMUCtXVdD7joLSvmXfc3zoeJVHpIfymciQp4+DVW
 qfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677835818;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JkipkX6fXxbmgyU33W5HJhgndliilpZcOl1Orvy7OCQ=;
 b=zT1MA53AzJ1uhqsbuYTK1dNqNCHmWajSnKQXSTMgtubnoSfy7Ce52YdLhgVOIJWjll
 ZdAVTFsLaCN0U87gXZzHA25AQ+fLVZcF/XGbbWqXSxtcnYqfv+ENdh/zbSCh/boHZBr+
 pIYtcCy86cT2XhAIeiUMKExEBm6CWjKn92eJ13UCA2Rv4PyeYkz8zP7iSEjQDvoeq0Ea
 E0lAOSG/2++pm9IlkrH6itIxa2bCihkHVqsz+nd8aS8FeM+PzOzJ8juXIUw6Dm+e/KTZ
 AtdcjDGdXqGKLNJRdJmCFsuy8P3JHlGPsTZgpiOemqFM7NfHGyEmkh29xG0/NN6dwGKp
 fgWA==
X-Gm-Message-State: AO0yUKWVUfIAQG//WINNCaZTnhPiJrcP3SZjIdLO1VCW3dSy0xsXW07k
 vkC7IWt7bPfBdxMC5pCXro2xWQ==
X-Google-Smtp-Source: AK7set8SU2PNFW5zpRfvtttMiKOrH6yFW2Rjq6IV8kDSQamQ8eOTIV8Xk3EqZ1N0vBRhNbJWN0vNxA==
X-Received: by 2002:a05:600c:3b87:b0:3eb:33fb:9dcf with SMTP id
 n7-20020a05600c3b8700b003eb33fb9dcfmr1165708wms.5.1677835818201; 
 Fri, 03 Mar 2023 01:30:18 -0800 (PST)
Received: from [192.168.59.175] (180.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.180]) by smtp.gmail.com with ESMTPSA id
 f7-20020a05600c44c700b003e2232d0960sm1840516wmo.23.2023.03.03.01.30.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 01:30:17 -0800 (PST)
Message-ID: <05b41d7f-11a6-18d6-5239-a30479c1cb89@linaro.org>
Date: Fri, 3 Mar 2023 10:30:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2] tcg: Include "qemu/timer.h" for profile_getclock
Content-Language: en-US
To: "Richard W.M. Jones" <rjones@redhat.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com
References: <20230303084948.3351546-1-rjones@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230303084948.3351546-1-rjones@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 3/3/23 09:49, Richard W.M. Jones wrote:
> When CONFIG_PROFILER is set there are various undefined references to
> profile_getclock.  Include the header which defines this function.
> 
> For example:
> 
> ../tcg/tcg.c: In function ‘tcg_gen_code’:
> ../tcg/tcg.c:4905:51: warning: implicit declaration of function ‘profile_getclock’ [-Wimplicit-function-declaration]
>   4905 |     qatomic_set(&prof->opt_time, prof->opt_time - profile_getclock());
>        |                                                   ^~~~~~~~~~~~~~~~
> 
> Thanks: Philippe Mathieu-Daudé

;)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---
>   accel/tcg/tcg-accel-ops.c | 1 +
>   accel/tcg/translate-all.c | 1 +
>   softmmu/runstate.c        | 1 +
>   tcg/tcg.c                 | 1 +
>   4 files changed, 4 insertions(+)

