Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC08682AA5
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:37:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMo02-00066g-9m; Tue, 31 Jan 2023 05:36:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMnzy-00065n-Dy
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:36:22 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMnzw-0001L3-Cu
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:36:21 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so4668193wms.1
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 02:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bgn/U/0877nowf/1YNq8ngB5T8wX3KLJ1dG6LgUWu8A=;
 b=NJIDN4hNueEGHCVSd2gX0nae1D+DL7XQR/1Qm2Nd8NIpUdK2KLQygQhZBGm0XxwvTi
 qdHd6Qnhyt0SvgNSMaRHs4JRXwu+0sXu27PeZnhuiPzojdGCVVzYMzTvf/x8M8sV0OP+
 DXjMujNb3XlmWr9JCTj6UGXmwbEJ1wVHXbd69E1irbRriqQe/TBYkDS/JbhQFsmSb4+e
 cpmPsEnq6JkXCuoOBGz9q5+y4EbiWA2DbuoEYI9ceKaXQPRU+CL0YTdGQI4OV8xlduwr
 xvqFpQuYOP+64zciPMM6HdeRsCfW10fmhFr2PYy4IbCuooW97pSw+AFlSireyjhG9z2C
 LRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bgn/U/0877nowf/1YNq8ngB5T8wX3KLJ1dG6LgUWu8A=;
 b=oKXb47wiul3An3kMpnVs6o7s+/dmli0FEhrO1o6dEuN/O+FWQlEmMLynz6vZqD0zem
 FcDhi4IFiZqYQt33rIvEOOsfDQXsOLd4a1JBcYG8W87LlRGkREcTqGBAHkvuZiuB6Uco
 sms4yxWO7jxc00yo1C1FzRV++pUYbe/CuqbCzeJvD7gI+zLzqw1pL6jfD/49sLhyPBen
 y3/AcwdGGKVOjrtt3qWK1cyQW22SEOoeNwLHWqAinQGxmddJEpdemEPWyLvbj2+hljzZ
 BDlx7rU1gwGaBqAaFsQ4f8YaT8AkwPpmFmbvRvhLks6gi3n7x27hOgu/oWmROYlkymA0
 mEYg==
X-Gm-Message-State: AO0yUKVy7IBVa9TfTdaJ0OqMhHZ4kr2aUxaXxXWaBGeEdcnRPzil254W
 YIKtX3rZ+8cgK7ukPFIBwe6dWA==
X-Google-Smtp-Source: AK7set+M1KjAV4rnieXYFOkmt3HDuRj6JJDFpyJ5LIgsp42umSAefRZM96h0iN6n1urzRBVZmh/h9g==
X-Received: by 2002:a1c:4c19:0:b0:3dc:5342:9f53 with SMTP id
 z25-20020a1c4c19000000b003dc53429f53mr9671717wmf.38.1675161378903; 
 Tue, 31 Jan 2023 02:36:18 -0800 (PST)
Received: from [192.168.0.115] ([41.141.105.34])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a7bcd09000000b003dc54344764sm7490832wmj.48.2023.01.31.02.36.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 02:36:18 -0800 (PST)
Message-ID: <069349bb-a09f-bac4-3a99-70699bd4fa54@linaro.org>
Date: Tue, 31 Jan 2023 11:36:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH] build: deprecate --enable-gprof builds and remove
 from CI
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230131094224.861621-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230131094224.861621-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 31/1/23 10:42, Alex Bennée wrote:
> As gprof relies on instrumentation you rarely get useful data compared
> to a real optimised build. Lets deprecate the build option and
> simplify the CI configuration as a result.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Thomas Huth <thuth@redhat.com>
> ---
>   docs/about/deprecated.rst  | 14 ++++++++++++++
>   meson.build                |  7 ++++++-
>   .gitlab-ci.d/buildtest.yml | 19 ++++---------------
>   meson_options.txt          |  3 ++-
>   4 files changed, 26 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


