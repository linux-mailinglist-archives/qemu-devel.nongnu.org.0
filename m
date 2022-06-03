Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B4D53CB32
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 15:58:59 +0200 (CEST)
Received: from localhost ([::1]:46776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx7pK-0008WV-2w
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 09:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nx7nD-0006v9-Od
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 09:56:47 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:40765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nx7nB-0006Lb-Ud
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 09:56:47 -0400
Received: by mail-pl1-x634.google.com with SMTP id i1so6890953plg.7
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 06:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2rFZNp3tEVk5EQHNurOELSnUFyS8vkXaUKspXf05lY0=;
 b=bVSmJrLDinK94aVusIYSSf08UKLXcOOUV4HuLvLitJl00w3MYQuMswJKI7QlrRFXQ1
 m8ErJb80Zr6mujtuLyazG8lrOXt6ApdXjt4FQGahIfq08gR59fp8JYBEr+NUwiv4WzFd
 40S0g2WdAAsdSH8dFsKHoWT/4wOWvRIDaYkj3P1HYfApoXvgPpl788tTbv/LCX03gtO5
 q1+4HtNF2HSyCyZ+irpzQq/tA1Ksa1hOOFfpR1wJN5JfPBJ7F1Lwjsr2wKw2IsS9n2vu
 7Xw632jMqIzrBo4hDDIASUMGwK+2BcAVS5Dd/AuGcNT6QJZaJuPllAb6VzzZbEXaTkQt
 M4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2rFZNp3tEVk5EQHNurOELSnUFyS8vkXaUKspXf05lY0=;
 b=XeHvNXXJy8TtJD1gxmEbkpB0miBT7EZzkeUG8lsBays5ULkPG2xTHcyiKM723y3KDG
 qlgC/LnwmlmSiFftXJZNW/z88oguw2dEl71P5bKpEpk0lkMlzeh3Zka+LuEJg7X6GUhn
 kOdFMtpwMay+wbauHk1ma9p+O2DYugpA+bxMzY4bQRCJ9q9S3JqMBvsAzwh3pv+5fqac
 zoGl0xtg7TlRPq04q9wbJq+T/r1ZyzNEEMC+dS+oGURyePGq2WHtlaNGwFvxOftqScGi
 7EYbtzR2E/r7Idx78HrlEZifqB3MTH/nanbWF5jrBQvu52smCyGKTQIWXRnUFfqzT72+
 P/ig==
X-Gm-Message-State: AOAM530fEAIM8Ub8ry/S2DX2CSz9N6doQT3HgM9pnpendoyw87GImCK3
 +Zfz+QoacKHHHtYuDxEYKAhDCQ==
X-Google-Smtp-Source: ABdhPJyAIlkRbdiQGMGTgH7RBhrqDMPAJlSYVnuLuIy7jR+G3dFWfVkmDioiQHggPrZDaasvYm/ZJg==
X-Received: by 2002:a17:902:7149:b0:166:4e68:5c41 with SMTP id
 u9-20020a170902714900b001664e685c41mr6091529plm.25.1654264604232; 
 Fri, 03 Jun 2022 06:56:44 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3286:cc26:3d5e:3f94?
 ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 b6-20020a170902650600b0015f2b3bc97asm5528406plk.13.2022.06.03.06.56.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 06:56:43 -0700 (PDT)
Message-ID: <892b330e-2b7c-0cf7-f7a7-3419ad9ea040@linaro.org>
Date: Fri, 3 Jun 2022 06:56:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] tests/avocado: Prefer max cpu type when using AArch64
 virt machine
Content-Language: en-US
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: f4bug@amsat.org, alex.bennee@linaro.org
References: <20220603092505.1450350-1-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220603092505.1450350-1-drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

On 6/3/22 02:25, Andrew Jones wrote:
> The max cpu type is the best default cpu type for tests to use
> when specifying the cpu type for AArch64 mach-virt. Switch all
> tests to it.

This won't work without further changes.

> @@ -147,7 +147,7 @@ def test_aarch64_virt(self):
>           """
>           :avocado: tags=arch:aarch64
>           :avocado: tags=machine:virt
> -        :avocado: tags=cpu:cortex-a53
> +        :avocado: tags=cpu:max
>           """
>           kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
>                         '/linux/releases/29/Everything/aarch64/os/images/pxeboot'

For a release this old, we'll see the kernel bugs wrt FEAT_LPA/FEAT_LPA2.
See 11593544df6f ("tests/avocado: update aarch64_virt test to exercise -cpu max")


r~

