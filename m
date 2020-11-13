Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EFC2B2732
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 22:39:07 +0100 (CET)
Received: from localhost ([::1]:55882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdgmg-0006N6-AV
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 16:39:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdglI-0005ka-FM
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 16:37:40 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:39840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdglG-00080U-Nn
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 16:37:40 -0500
Received: by mail-pg1-x542.google.com with SMTP id i7so8154923pgh.6
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 13:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8DIIYGkGVU+UWKtk2QW2/EiJ0+H+gUj3LpHi52ISySs=;
 b=H1hNBUKttLOTQ7QdqZj6bSkmBwyDvPNRiWe+WjYP2kc7U4qAn9sgFTbNdaP0lLgsDU
 Yot8EIQFWw1D2Vb4Za2XTlss0cmp7UdC1wQchUuNknqMRvDOhbRjSHQ/e6ANpMMHCePg
 kUgK9thh29a/WWglOQc1mmZ85wxn3dTR+3VouQANBQhD6Q4kBI/JmCuamozZTmmd1RPI
 S9X/TOZaN7/0sv3aJiSgzBrhxQVcVnJ9SjrgAgr3/lLhSdvDaLFrFwOviFoYzIMn8iEx
 egxgYXJT4kXIq9dpGYTBYGwIPP/K95AUGK4BFOUaLzByUawKWB/l7U/4IGOkVcW1aiCr
 joQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8DIIYGkGVU+UWKtk2QW2/EiJ0+H+gUj3LpHi52ISySs=;
 b=ApcdZKkv21GQb6TQtjEbaS/6EYVkZgb3w/0VZCZ2fpG9LkzGLdmTIeUrAQZPpuO9c/
 etDOG01gJmhXD3LXN5QIy1QaHrX3eFVgxcDF868AUyhRt+PH0LUc/CWfuCdwB6L6khHC
 AvLFSpsDXecGBRgKd0Y2hzs2KQi8AbhLc6/no4QbxxnuA9xosrcyf0YyFopEcbCDboV5
 YuwjXAR9+oZIseASoEW4JJGksRx0cQUvmXsCRMUYsaOl43ADGheDUc+vYfXnXsCzJB3h
 AuU683P+5Cbjy8OMHPre5GbsY2ptQMG5kC/2mJIsFbzbVqTBccvPLH2v9PCObVlwyOAb
 cQTw==
X-Gm-Message-State: AOAM530R7eJd6dz7O+HzX4dOA4twIc8sxlH/2JDSKCpzqEQ0RjHWBzcZ
 gOFiOOQ6e9JcFTx19PQGUu7D2N5Q0CsGqg==
X-Google-Smtp-Source: ABdhPJyUJCBeSkr1lp7k6n3VtuK2LO+0/MrFq7Ad2P9xn5u39ti149o1E7foSFO1V7XUGZ/VUFs5Dw==
X-Received: by 2002:a17:90a:b118:: with SMTP id
 z24mr5063526pjq.108.1605303457083; 
 Fri, 13 Nov 2020 13:37:37 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id h5sm11820813pfk.126.2020.11.13.13.37.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 13:37:36 -0800 (PST)
Subject: Re: [PATCH 13/17] target/arm: handle VMID change in secure state
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <5554493.MhkbZ0Pkbq@basile.remlab.net>
 <20201109141020.27234-13-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e44d7b3e-089a-1101-df2c-27096cc0732c@linaro.org>
Date: Fri, 13 Nov 2020 13:37:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109141020.27234-13-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

On 11/9/20 6:10 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> The VTTBR write callback so far assumes that the underlying VM lies in
> non-secure state. This handles the secure state scenario.
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/helper.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

