Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D84604210
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 12:53:19 +0200 (CEST)
Received: from localhost ([::1]:37998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol6hK-0007ue-Ui
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 06:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ol6bi-0003Q9-PF
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 06:47:43 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:37454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ol6bP-0005q4-H0
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 06:47:12 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 c7-20020a05600c0ac700b003c6cad86f38so17263315wmr.2
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 03:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N5rEVJ4c2G9081f8Yj52mU6DFoYB3xzbCM8r8MoWZv0=;
 b=PHDkasHI+rm/0UsoT/j4tsT0ShsHkKhcKC1Vv5/ykBOtyVbRlVGGl6XpmnYJp2nsyF
 Z60eWFFSkTwIojpA/h5DGPp+1wztLf4PpP0hSpj9ZLDOziRHBGcJ+bvA5ILCvHJ2UTmS
 /q/sbLIEoq8A+JXHb7y/z7N/IdBvcHRuNMDLSo7y/HeDItgwLnurDGSu81KAvaFN10cf
 7PZG82wd6oXA1JJ3oRA2iuK6eaPIGTFMhx7XJRJ7/fA3BYNtMKrzxfRtMTOgKfuQUeMf
 UUxpSVjS4TmLl/C8j1YGxWpwUVy7AwaofY7NEDQnumc15zjgtMam3Ix4VTDQaZThopY/
 nCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N5rEVJ4c2G9081f8Yj52mU6DFoYB3xzbCM8r8MoWZv0=;
 b=yC60XSTdyPF8pPq/KcTTa9/wcoOWtMYdtxs+wHQXLhRAbgCJXZR2fVyQCBpjE1qpaN
 nZwy5YTCiSEhvYADnboNt2U4UckhuKn8EsXlMM8N2fEsCYLwm7Qtgos1jnPWRbDijNVo
 3GXNTwdMWXwqYSkBRNVExUKM2G0J0WTj0HA2w99GLk0IWtQ9J61z8J71CcUGrvH/tXgW
 /XCNmjmCz0DD332JuKqRUQwBjZPZqEtPVgHeK4YA59DBT6Fz64jTjbSx27jFpDYt/YK1
 930o5srMkXwKqtgGzEfqe1R8tuQSdY3Ch2bJleTSGMYmbRJYRAi70DXtnLs7xU7OOU0v
 p99w==
X-Gm-Message-State: ACrzQf3OQjxXbHRx00cK45utzOyFWkK+f3bXcAtxIdltsw3z2G9hb8Yy
 GKCMMCV9M3S+tyWbbfPEDqRjeQ==
X-Google-Smtp-Source: AMsMyM44ril6wo8YgRXNgSAb+HwPp8ad3ZMFNUjF/brFM7bKd5Rm89bnd8glGNBNA0ZbpjDQodAfmA==
X-Received: by 2002:a05:600c:4e52:b0:3b4:a828:1d84 with SMTP id
 e18-20020a05600c4e5200b003b4a8281d84mr24870413wmq.143.1666176428824; 
 Wed, 19 Oct 2022 03:47:08 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q13-20020adfea0d000000b0022e3e7813f0sm13408657wrm.107.2022.10.19.03.47.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 03:47:07 -0700 (PDT)
Message-ID: <64fcba4f-c816-b77e-fb8e-df7232425657@linaro.org>
Date: Wed, 19 Oct 2022 12:47:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v3 11/15] gdbstub: move into its own sub directory
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-12-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20220927141504.3886314-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/9/22 16:15, Alex Bennée wrote:
> This is in preparation of future refactoring as well as cleaning up
> the source tree. Aside from the minor tweaks to meson and trace.h this
> is pure code motion.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   meson.build                    |  4 +++-
>   gdbstub/trace.h                |  1 +
>   gdbstub.c => gdbstub/gdbstub.c |  2 +-
>   MAINTAINERS                    |  2 +-
>   gdbstub/meson.build            |  1 +
>   gdbstub/trace-events           | 29 +++++++++++++++++++++++++++++
>   trace-events                   | 28 ----------------------------
>   7 files changed, 36 insertions(+), 31 deletions(-)
>   create mode 100644 gdbstub/trace.h
>   rename gdbstub.c => gdbstub/gdbstub.c (99%)
>   create mode 100644 gdbstub/meson.build
>   create mode 100644 gdbstub/trace-events

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


