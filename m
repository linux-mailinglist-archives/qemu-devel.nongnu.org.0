Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 111096983FF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 19:59:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSMzX-00044K-Vn; Wed, 15 Feb 2023 13:58:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSMzW-00040K-Ca
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:58:54 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSMzU-00087F-Ki
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:58:54 -0500
Received: by mail-pj1-x102f.google.com with SMTP id k24so446755pji.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 10:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DIzl73kWeau48qZetvSUfvzRavavSKB2PkPmR3lHSR0=;
 b=gpS0+bAlt07kUA2ZJu3EHfEZiqEdL9GHj0G9nj/1k1H2FVSkJRZuvluWkOHtDfgWXA
 pNNVPj8mxHb8NpaeVrELFBp/qKD2d7Fz/1DEiIHW33VmiISjORmVUHLtJ5bJyZdee9w+
 nZOreT7pchwSFN8y5wfbyELYwifBE7yHRV+gyjR/beTQGY2Kz/SsfPGazOOYtuM/CYu3
 d0zGx0ciXqOpSIU3xR6g1XgAdor8XFciIYsGqVublirp2CXuXn9zSPhkuiXrQwdprwCY
 evJSdExQFhlGtT2Ezbf6NeUYHXb/r0GMP8436XQIkb39Qj9g/Z2aDLDr57h6N3d//RUx
 cRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DIzl73kWeau48qZetvSUfvzRavavSKB2PkPmR3lHSR0=;
 b=fi7VyLt1thRN47ITZxOTbbFh3nXgwDu7xSfEy0ooNz2DQUkoYshpGkJ0CuKlr7uYbT
 TYebLMzMnvw2Oou6Raj4Gj2qcJTF17HhVJdpUabqJDRLDHBS7UewvR2vIGrrGM6xANpE
 lXlyaqJWiKpY75dFytlaT14kgoRJlIlW7IxNQ0yMgXnHtUfv3X+KIjDP8oIuSQOAqIjH
 tStNXrtooJs2A/Hf9PHAmS8QViRXb2F8HJImtnYA7GUtars4hI7Jddr+4iVObh3eO2k6
 Fhyy8Mp82m9+rUla4grByfS7dPF1RG8ql3BFcOUv+dYiPTj8oGPOOqJymkKWGs+OOng9
 39Kw==
X-Gm-Message-State: AO0yUKXj4Jx+xS6URUz0kS/IrbZM0By/vUQNf/9ikjCosxLqDAMvylcI
 R+52mhL0mbIcBKuuSQ2tTs0uV3tbOTEmRfUz0+g=
X-Google-Smtp-Source: AK7set9DgLZTB7rl27KwrKxYRsqpYkeWHSRsybyUUeUy1CMe0Y3BPYePiN+A4A69zLPw8zMJAGsXiA==
X-Received: by 2002:a17:902:e803:b0:19a:9890:eac6 with SMTP id
 u3-20020a170902e80300b0019a9890eac6mr3545315plg.24.1676487530903; 
 Wed, 15 Feb 2023 10:58:50 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 y23-20020a1709029b9700b001991d6c6c64sm12457017plp.185.2023.02.15.10.58.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 10:58:50 -0800 (PST)
Message-ID: <24dae4b6-3af4-de73-7ffd-cc6613e3f2c7@linaro.org>
Date: Wed, 15 Feb 2023 08:58:45 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/5] hw/i386/pc: Un-inline i8254_pit_init()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Marcelo Tosatti <mtosatti@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230215174353.37097-1-philmd@linaro.org>
 <20230215174353.37097-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215174353.37097-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 2/15/23 07:43, Philippe Mathieu-Daudé wrote:
> pc_basic_device_init() is the single caller of i8254_pit_init()
> with a non-NULL 'alt_irq' argument. Open-code i8254_pit_init()
> by direclty calling i8254_pit_create().
> 
> To confirm all other callers pass a NULL 'alt_irq', add an
> assertion in i8254_pit_init().
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/i386/pc.c             | 10 +++++-----
>   include/hw/timer/i8254.h |  5 ++---
>   2 files changed, 7 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

