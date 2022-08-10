Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9CE58F2E8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 21:17:44 +0200 (CEST)
Received: from localhost ([::1]:39056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLrD5-00050t-GM
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 15:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLrAQ-0002Cr-8R
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 15:14:58 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:42762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLrAN-0003ON-FR
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 15:14:57 -0400
Received: by mail-pg1-x534.google.com with SMTP id 73so15154005pgb.9
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 12:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=CakDtKapqjxl6kkEG8qzefwdSJDebkiYLLlW2gu/f2c=;
 b=aPxsGvMO8UhuQ+jRPH3YJMi1TuNM/IQr8lRIRescAOzhpm0B90AHg2kls74HzHAJk7
 XKEI+hIo22pi6+V+2N8tijj+EVVG7WUeqhN+CQTGaXkELJ8DMqsktQsoxUTtWxJLUc+m
 radlxvfQve69tH4Lbeouv1WJaak02w51dQIKjL1jDqgtvOgcBBxUmlu0dam+0bGZb5KU
 gQzS2Wjcw+gENnq/oez5Kb8ZUOcaBC0L7LVquN3Fqurpx7P2AXc/1KkHMU+2a7HOPbcK
 xzXAofUeolOwYm1TN8PJcdsF+adeF92bjnBH+pYxzvwHwPVbirGhE5243QWDGSqVvWug
 Eajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=CakDtKapqjxl6kkEG8qzefwdSJDebkiYLLlW2gu/f2c=;
 b=xhUa1vFjHXVMTnhgZysRh966nFCsyCex/jCPJECLhtl9LDG4PP+EhV4FsOtj6aKKCx
 tTH9k4Uhla4Yo87C+8pqgkLNJnn0Ds7G598B/2TyYSJ/rxvwBh7UOVx9yfBKQ2idMxdS
 DJWP4OP82ugqXGTZpodz5Kmxrn6JU4/Ous4aD9lhI9vvf5HZZPnnA3xm8iw+zQ4jvm3z
 hLO7sFjvdJRGg5sTcLUQkZ+XUV8FqfgYzZA5eCa4lcnUBiV6OlivzODZjoFDnMBHVIaz
 W3ENPZ6+uteJVUW/JtjoTSNOwcDU9qJ6uJmxKI3zq1dOeLMYK4s7ZDXMlBJxIIT9e8J0
 MEnA==
X-Gm-Message-State: ACgBeo0NHEBTfPaAMkldAPNJEQmaxSfQbwk/qYQXHM0nQEXWSTB/gz5N
 bzZU/3lUiUAu79SEWhCGbbqzSQ==
X-Google-Smtp-Source: AA6agR4u8Uu2oGVTpfeimhuaPi3vB6DgX0j73diJpq+x9d3J8IZ5i2vHBGzGPvt8TIItWsA2io0nlQ==
X-Received: by 2002:a63:5d06:0:b0:41c:ef94:2b54 with SMTP id
 r6-20020a635d06000000b0041cef942b54mr22941414pgb.431.1660158892595; 
 Wed, 10 Aug 2022 12:14:52 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:1d05:6ab9:1c4d:d646?
 ([2602:ae:154e:e201:1d05:6ab9:1c4d:d646])
 by smtp.gmail.com with ESMTPSA id
 s32-20020a17090a69a300b001f74ddac693sm1989836pjj.52.2022.08.10.12.14.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 12:14:51 -0700 (PDT)
Message-ID: <b99793f3-8284-649f-1083-78ecc40e760e@linaro.org>
Date: Wed, 10 Aug 2022 12:14:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/1] Linux user for 7.1 patches
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220810165029.2497766-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220810165029.2497766-1-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

On 8/10/22 09:50, Laurent Vivier wrote:
> The following changes since commit 61b6e67171c602cf6451e4928c9cdcc24c57a485:
> 
>    Update version for v7.1.0-rc2 release (2022-08-09 19:25:15 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-7.1-pull-request
> 
> for you to fetch changes up to 3cd3df2a9584e6f753bb62a0028bd67124ab5532:
> 
>    linux-user: fix compat with glibc >= 2.36 sys/mount.h (2022-08-10 18:37:46 +0200)
> 
> ----------------------------------------------------------------
> Pull request linux-user 20220810
> 
> fix compat with glibc >= 2.36 sys/mount.h

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Daniel P. Berrangé (1):
>    linux-user: fix compat with glibc >= 2.36 sys/mount.h
> 
>   linux-user/syscall.c | 18 ++++++++++++++++++
>   meson.build          |  2 ++
>   2 files changed, 20 insertions(+)
> 


