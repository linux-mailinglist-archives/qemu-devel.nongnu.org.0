Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0105F53CB50
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 16:05:45 +0200 (CEST)
Received: from localhost ([::1]:51858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx7vr-0004Mn-IN
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 10:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nx7uJ-0002tb-QZ
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 10:04:07 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:46845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nx7uI-0007Z6-6F
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 10:04:07 -0400
Received: by mail-pg1-x535.google.com with SMTP id c14so7255953pgu.13
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 07:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sUCDG8ZB37f3JxtItIbiTafcH+tldRv5hwHPRFbKPIs=;
 b=rKUHXXCJBSrSqy6isylWK7oLyQQqd2LiA73SWCwR5BP75XS0oaj4/eStcXemn7f7mG
 GRMe6+38W6CYF//xxKVrjMhbRLIDV5NIgO8G9XqjL9XlFe3kcaUPeJkn/PHrujq1megB
 Hac2/ElcR3wSqyFHUwGT5VFFF4s5Ym72H+V4YwjC79rboNQ2vZKEILErpX0GmuHHfbgI
 sjg5zcftAqZGutg+8dqVuEZqoCMDXcTqcKVsjjGaXPNDVbqW/ouqALLl1kvn9ESd1rfq
 yclWStEfC1HwZgk2EzXk/Nk9XLdyoKb/b4DaugoaSUVHWC9OVlZq8KspWS/xoqAG0jqj
 USWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sUCDG8ZB37f3JxtItIbiTafcH+tldRv5hwHPRFbKPIs=;
 b=zqZGMs6xvrh2BOodni6uBlqt+G1LbDi7r/3Gvwtd2R0O451yG9cJmYxrC/zzZO8Nmw
 tJkZtWy/esMS+uplSqayy+K59FY3U4YH18yFch5XmnrgL4IsxLYz2QlRDIvfO1dREiCO
 ADLoghppKXQtdJgIq+B2dau4kGZwrPaOPJ94NsKvzkE+Ou6iadzpSyrhUAc8g8Hy9Koy
 VhiVQBTCIyAC8m0s0pDDvL9szIHT+jXwdjStY3eQNn9IwEjDhZTQUxJPY15tSXXGdcN5
 wWCFJtjlDpKofHgAkd0Qii6+a/uh9BSOfP/0HsP0oRNDng126hEVxR20RKySDkI5AMCH
 JxXA==
X-Gm-Message-State: AOAM531hBaPO2x3+Mkw9me5gmgmr4YxadvbfPEXs1YKMQgkUd12Ocg2u
 375QyViiMUocnFk6tri7l3jaHg==
X-Google-Smtp-Source: ABdhPJwAZRkAHYBju760wRgq8IeQGH2moewesed8s4Z9Fk4GJc9nWGBat+1yDhWBSYH1Ae/8iuL1VQ==
X-Received: by 2002:a05:6a00:803:b0:51b:d3bb:3f0 with SMTP id
 m3-20020a056a00080300b0051bd3bb03f0mr6812225pfk.57.1654265043337; 
 Fri, 03 Jun 2022 07:04:03 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3286:cc26:3d5e:3f94?
 ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 h188-20020a636cc5000000b003f9eacd0684sm5498771pgc.3.2022.06.03.07.04.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 07:04:02 -0700 (PDT)
Message-ID: <8baf9cbc-3cd4-bcd7-c60d-b68bf0784779@linaro.org>
Date: Fri, 3 Jun 2022 07:04:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] tests: Prefer max cpu type when using AArch64 virt
 machine
Content-Language: en-US
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: f4bug@amsat.org, alex.bennee@linaro.org, cohuck@redhat.com
References: <20220603111849.1481100-1-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220603111849.1481100-1-drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 6/3/22 04:18, Andrew Jones wrote:
> The max cpu type is the best default cpu type for tests to use
> when specifying the cpu type for AArch64 mach-virt. Switch all
> tests to it.
> 
> Cc: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Andrew Jones <drjones@redhat.com>

For avoidance of doubt, copying v1 comment to v2:

> diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
> index 0b2b0dc692b1..c19022ea977d 100644
> --- a/tests/avocado/replay_kernel.py
> +++ b/tests/avocado/replay_kernel.py
> @@ -147,7 +147,7 @@ def test_aarch64_virt(self):
>           """
>           :avocado: tags=arch:aarch64
>           :avocado: tags=machine:virt
> -        :avocado: tags=cpu:cortex-a53
> +        :avocado: tags=cpu:max
>           """
>           kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
>                         '/linux/releases/29/Everything/aarch64/os/images/pxeboot'

This will *not* work without further changes.  Fedora 29 will is old, and will not boot a 
cpu with FEAT_LPA2 enabled.

See 11593544df6f ("tests/avocado: update aarch64_virt test to exercise -cpu max")

Which makes me wonder if you've actually tested this?


r~

