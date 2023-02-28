Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3106A61C9
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 22:54:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX7uQ-0007Hq-Od; Tue, 28 Feb 2023 16:53:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX7uO-0007HJ-Dd
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:53:16 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX7uK-0003c8-Jl
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:53:16 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso5946746wmq.1
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 13:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677621191;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eNWWTmXqD/Hl2svbeJU3DygbOC8Ekf8J+x0b2gnlOVU=;
 b=tT6zcdlmnX/XpXr/pqTym9Xn6fvTrPLkZX1LubjvGFLnJ0jnq1uHsamMtO5fP6M/L2
 MiCYeb5u1X1ELXQWn3JPyShD2FLHakncjLG/Cu5ouGYBdXu+/qg6TyTYcY4ZfPGBInyW
 LexAd7nfWCQUxLkMAlxm9/8U63CAxLb8uREBqO9NWvlxwr8HXSTlHh/9Nz55kfpd87UR
 sGXmGhwCKQg2h7z7a28Gziyw7CNSjDLta623y9CV2hNHAF23bQR0iUOkR6/1dl0uXpM+
 CrW8safroNC8MkGD/o/Asgxb/1HQ5KwRzgLS3mHUn5QrFFtRh4dMghxr/v+hZmtl1V6A
 AQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677621191;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eNWWTmXqD/Hl2svbeJU3DygbOC8Ekf8J+x0b2gnlOVU=;
 b=o0WARKgLFOl+a4fwe8QYwxKtAnIgG+Sg2o28jHuAF1a57rNJfe0+7pddLLQmIzUgSE
 oviPe0jsMnNE1Kfyfb6W0c97lOB5YV4i76B5yqGm88SBxL3VYGOIigNJVunsoxDM9QV7
 ZDeWdvq2/M7k5abHrsVW2vy7kmre3Tv7/FaptbRQh+8/obCYVC0wc2ZU+REHUhLW7pk0
 34X8pGtyHxeYs+/zA+RUsjKBqcp9mcvTIgleQbOzt/gVI85S410uuB9EXpidWq+K6DcV
 2BX4tO6STv6QqiQCLXanuksStBOCPvoEwlg9fwGmO8p6EbqzcSUC3zan90rIGml4BDI4
 XNdA==
X-Gm-Message-State: AO0yUKWaqsLbqCnb0ngdjX2pcmj2SxuM/506cBT+XaFKdpBuaNyUUhGk
 phS/tR5iU1VRvMvLxwwXT49+XQ==
X-Google-Smtp-Source: AK7set8oBR8ZUtKQfqXL+uNsLpS+qcGjndSeFiC+tF7ogAloU4b8rKQM0LcUu+sp9QLiYqfwgJaJdw==
X-Received: by 2002:a05:600c:4fcc:b0:3ea:9530:22a6 with SMTP id
 o12-20020a05600c4fcc00b003ea953022a6mr10194680wmq.1.1677621191115; 
 Tue, 28 Feb 2023 13:53:11 -0800 (PST)
Received: from [192.168.68.175] (166.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.166]) by smtp.gmail.com with ESMTPSA id
 a2-20020adfdd02000000b002c3f03d8851sm11013264wrm.16.2023.02.28.13.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 13:53:10 -0800 (PST)
Message-ID: <fa133859-b079-2cc1-f431-cee6b1c19af3@linaro.org>
Date: Tue, 28 Feb 2023 22:53:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 24/24] tests/avocado: disable BootLinuxPPC64 test in CI
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Peter Maydell
 <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>, Markus Armbruster
 <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-25-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230228190653.1602033-25-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 28/2/23 20:06, Alex Bennée wrote:
> This test is exceptionally heavyweight (nearly 330s) compared to the
> two (both endians) TuxRun baseline tests which complete in under 160s.
> The coverage is slightly reduced but a more directed test could make
> up the difference.
> 
> tests/avocado/tuxrun_baselines.py:TuxRunBaselineTest.test_ppc64:
> 
> Overall coverage rate:
>    lines......: 9.6% (44110 of 458817 lines)
>    functions..: 16.5% (6767 of 41054 functions)
>    branches...: 6.0% (13395 of 222634 branches)
> 
> tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg:
> 
> Overall coverage rate:
>    lines......: 11.6% (53408 of 458817 lines)
>    functions..: 18.7% (7691 of 41054 functions)
>    branches...: 7.9% (17692 of 224218 branches)
> 
> So lets skip for GITLAB_CI and also unless AVOCADO_TIMEOUT_EXPECTED is
> specified by the user.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/boot_linux.py | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


