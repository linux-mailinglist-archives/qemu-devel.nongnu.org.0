Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1855431D451
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 04:46:52 +0100 (CET)
Received: from localhost ([::1]:58780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCDnf-0004Gl-6f
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 22:46:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCDme-0003kQ-Pl
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 22:45:49 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:45234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCDmc-0004nP-O6
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 22:45:48 -0500
Received: by mail-pg1-x52d.google.com with SMTP id p21so1994245pgl.12
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 19:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JMxbtxx7bMCLhGz9dcCS6nwDK/8XWrhJs7Bgc8M8ujQ=;
 b=eNVB1KPly6LsaS/zJinQUVbjAmUsFvn62PIXkQwOcJJDIUY3izHkvv1meNV52OPupV
 r/+k59AayIjIAkG+SUG7WwxCS2F+AVmCD5KBhIbck0cbMykzEEksujs5nKUEqvsiBi/H
 zqU9cxdTy7VUWKm+13/t6Mwd/DVcDiHbfvadHqWYyPYhJguemJJ/ZXuHlRR0qaDXJMQu
 q+99Rhg4WL2hdaT8q7fI8h8IsF0ZAfX1majb3Z5GMbK0exv/uvlJUK47FMrqwGvlsoXf
 ZjYKSe67xkNNZw6hynrq3/3ZBhK5tch+lwPt/j6qiiKx+EiaI10LYvEo9voQWVgus5zt
 lRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JMxbtxx7bMCLhGz9dcCS6nwDK/8XWrhJs7Bgc8M8ujQ=;
 b=b6uXo4YhfRNSzUbLjFrqmHTmrVJX3kiBKFOjcEIfO/0iMYKEDznQNL6cfYgUTOjJX/
 ePBnmA+RNge7++oUvmb0tYjsgHxEZBxeGzWEzQCpFzdK8ssqLGemsCqX7U5SwoOZcfRJ
 XbGBrrCW4JpbpwQWbtt7ChZ0/2wWDepFJumYNqgKHjHqWlwLWfwsdqcDtUrH1dLq/VPo
 k/k+g136RGH/UJnLgUdS1YSuyvzJVfJvy1216Ms3tFcKXS+aJNrQYRepAPTBJ2t9URpU
 guEzkhOl5P008Yy/vQoItpUlwO3QklDNlEyB2BLQf4/vWI/hT9uSBrQQDL3CtNQmaMem
 ErLg==
X-Gm-Message-State: AOAM533ws1AN8q8BxJrzwPsKXrADlq9uFiaN4xs3OlondiT+esTpIPdi
 NvmmeG8vrxY4lSrbXcuKFhlZidmTkeUBfg==
X-Google-Smtp-Source: ABdhPJzUesrlz4q3Sjd18njIZOUYZJVTN3Mc3fOnCnhGsTc/BoRd1nBUs9Xy2BNYP569TAkzU5G4XA==
X-Received: by 2002:aa7:9018:0:b029:1d9:55d7:1ffc with SMTP id
 m24-20020aa790180000b02901d955d71ffcmr22297469pfo.71.1613533544660; 
 Tue, 16 Feb 2021 19:45:44 -0800 (PST)
Received: from [192.168.3.43] (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id y73sm421141pfb.17.2021.02.16.19.45.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 19:45:44 -0800 (PST)
Subject: Re: [PATCH v2 1/3] target/arm: Add support for FEAT_SSBS, Speculative
 Store Bypass Safe
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210216224543.16142-1-rebecca@nuviainc.com>
 <20210216224543.16142-2-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7ad3acde-1f9b-13d5-7600-000400fe0c38@linaro.org>
Date: Tue, 16 Feb 2021 19:45:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210216224543.16142-2-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 2:45 PM, Rebecca Cran wrote:
> Add support for FEAT_SSBS. SSBS (Speculative Store Bypass Safe) is an
> optional feature in ARMv8.0, and mandatory in ARMv8.5.
> 
> Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
> ---
>  target/arm/cpu.h           | 15 +++++++-
>  target/arm/helper.c        | 37 ++++++++++++++++++++
>  target/arm/internals.h     |  6 ++++
>  target/arm/translate-a64.c | 12 +++++++
>  4 files changed, 69 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

