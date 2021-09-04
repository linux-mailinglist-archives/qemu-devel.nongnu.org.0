Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD283400A67
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 10:49:41 +0200 (CEST)
Received: from localhost ([::1]:41364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMRMq-0006ve-DR
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 04:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMRLO-0005vP-Ms
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 04:48:10 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:45701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMRLM-00048x-Vx
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 04:48:10 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so996137wms.4
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 01:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RwpaIr0VaGOmrO7H/BpqEfJujkfEODrddNk1vEw2cJc=;
 b=SPupqHPwn8oCDxbOXhppz3oml+ijAp5grfFUT42aBB4k8L3tDucgUi85oMzWNa0TkT
 XPKOWB/QekkSsl18a84GyV1kEHIaZiq0766ZPtjQLv5Jbxmw2upMkMRmx0Iw/cixBEE+
 nRTgBbqkEEqNuNwGRMIg3TyT4qIFT/00xhuPDDJb1EHv4OyhFlc3CooQTxWnc5pxmYRC
 oDyUzKtpv4gLpYsT/MgH+fuuMDZvqpNh/p5YX/RbxLEUPII7FIHgShkmRxOccBG8hMFB
 nLZGxLDdOMjz3emYZiQaHiTBHPgO+T7kgfyC7sXOKD9d+5fFtd812te6xQ5xNu+D/0r6
 DiFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RwpaIr0VaGOmrO7H/BpqEfJujkfEODrddNk1vEw2cJc=;
 b=HnoFLdAKHobDaYJuUmcGu1Ciz32XGL1UUcLBYq885SEGrcOQqyqfCFa5mJ0uolCIhX
 OTvYebhBEcGsDg+x6LWjKR2dE/4iOCvyuK+m/1lW4n1tinQyKJ4Nj/t7NC1mB9JOc0L+
 Ph0Ns7nKsOh+oZz7z3dLFdoLMkbMYKiZl6Zuu5TZEl1iUsBB3AMYiB/8TUpkwRDJ8dTW
 yPZrqUJSEWRJU6GV81RbKM/3Rx18SKXi9SC6+3ut4+Jv2jryKCpn62cLTbK2pBsWG0fe
 KDXKnT/8XZTl/qK8g/Ms9EuewFTkJfosf/ki575sgymMv8A18ViYZ2u3iPjJT/qp+WSk
 t3LA==
X-Gm-Message-State: AOAM531wLR3Cm2bos3IPOgc7BEeXM+HWJBWIIAXnaYz5Rpaz2q5qkVE5
 U7u4xZiRt/IIiY8tm6zbL6Eurg==
X-Google-Smtp-Source: ABdhPJyOqAsPrkha36ZyWIjHq1Jx7C7gK+Z6HZr13DptO3/idP4B2QtYW17p6eisMwB8+q4bT8muwQ==
X-Received: by 2002:a1c:a903:: with SMTP id s3mr2271244wme.171.1630745287012; 
 Sat, 04 Sep 2021 01:48:07 -0700 (PDT)
Received: from [192.168.8.107] (246.red-2-142-218.dynamicip.rima-tde.net.
 [2.142.218.246])
 by smtp.gmail.com with ESMTPSA id k1sm1582893wrz.61.2021.09.04.01.48.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 01:48:06 -0700 (PDT)
Subject: Re: [PATCH 1/4] qdev: Support marking individual buses as 'full'
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210903151435.22379-1-peter.maydell@linaro.org>
 <20210903151435.22379-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b6ef1f44-294a-ed87-97e9-b94592a1cf06@linaro.org>
Date: Sat, 4 Sep 2021 10:48:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903151435.22379-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 5:14 PM, Peter Maydell wrote:
> By default, QEMU will allow devices to be plugged into a bus up to
> the bus class's device count limit.  If the user creates a device on
> the command line or via the monitor and doesn't explicitly specify
> the bus to plug it in, QEMU will plug it into the first non-full bus
> that it finds.
> 
> This is fine in most cases, but some machines have multiple buses of
> a given type, some of which are dedicated to on-board devices and
> some of which have an externally exposed connector for user-pluggable
> devices. One example is I2C buses.
> 
> Provide a new function qbus_mark_full() so that a machine model can
> mark this kind of "internal only" bus as 'full' after it has created
> all the devices that should be plugged into that bus. The "find a
> non-full bus" algorithm will then skip the internal-only bus when
> looking for a place to plug in user-created devices.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/qdev-core.h | 24 ++++++++++++++++++++++++
>   softmmu/qdev-monitor.c |  7 ++++++-
>   2 files changed, 30 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

