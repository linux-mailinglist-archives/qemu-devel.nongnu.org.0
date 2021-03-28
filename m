Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AA334BD10
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 17:50:26 +0200 (CEST)
Received: from localhost ([::1]:36588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQXgH-00029Q-Ej
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 11:50:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQXf3-0001OR-DR
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 11:49:10 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:39847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQXf1-0005yB-NB
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 11:49:09 -0400
Received: by mail-oi1-x22a.google.com with SMTP id i81so10823845oif.6
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 08:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tebX5njMOiPNpK3IlbfI8jbnNn1QEl4FYfreOHH7Q98=;
 b=XF5purJdnXCZuD8AlY1OUYpWDgQ0nryBZ45hgjcDl5CWdlQ9Y42A9dj2zf+0Nirb8X
 yLuqB5Mq94+b5u5QXyxk6UQOZQgnpaR7mzmEP1u1IRWaAC4kMR9xHjtuK6WR3XBigPCu
 BR1EsrV+QezoXtLM5Er5cwtSSqhZ87Gk4yWZU6EI1ZCoze7cUWwfy5U6Wd4H3N+lWqld
 XkfKYrWwC7fJgF8ptQfXiDhY8hT1rie8pnUkuEQvIJQK8SA6hazpiSre4JFnpFg9cZth
 QJIvLISAyyfCq/L7K8n7og9xyKc7z9a+g6FWU0PvOwtg+2g9OTDmbWAtWcRLynj+PXaM
 LPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tebX5njMOiPNpK3IlbfI8jbnNn1QEl4FYfreOHH7Q98=;
 b=OQiGgON5npQ7NvZsHoTokjRSUp4zFHzywYkNiqTSPfEEfYwBURlElDlJvyGqVMBRxR
 6Fy+jqkXoc6ZU10lhyegFKFst+GQH87YVJTcNTS1MmyNkLjcVfCbQmf447CASUYY62fH
 Z8WVkriScHEz71YRY80alQmQ3GLAkUBIVwovICZcHRiH1hN8K4RdDGNRVyNnIB0OtUvD
 d3w209TYdjBmLj+qMe8aYOOob6ovcufMx7LZTqXw7XaqFWdY/R/bIy2J4TFZxkxHN9+F
 fxBa1PqAeaQa+iPg/nPCnazkyHxram5vaYmnJchR/sLOSNKrV6wzM0WxtiuP7Amuxdan
 0X4Q==
X-Gm-Message-State: AOAM5336Ws1uoC7w+0X49zysZLszXI1gZBrZJr9i+4HDjNWXa+M6wEDN
 tarkL3ixS4W17ESY0i/30p+HSA==
X-Google-Smtp-Source: ABdhPJwpHqvtEkRZ8ZftyVGxMu8AE9ACKgIY3wp9M2V8mwcR6ZaQuy7peuIvBkwpD0TuD25XfMpvSw==
X-Received: by 2002:aca:3788:: with SMTP id e130mr15740933oia.45.1616946546502; 
 Sun, 28 Mar 2021 08:49:06 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id x23sm3293311ood.28.2021.03.28.08.49.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 08:49:06 -0700 (PDT)
Subject: Re: [RFC v12 14/65] target/arm: split cpregs from tcg/helper.c
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-15-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0e2eeedf-f7c6-79a6-0919-d7b0709396b5@linaro.org>
Date: Sun, 28 Mar 2021 09:49:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-15-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> give them their own common module cpregs.c, and an interface cpregs.h.
> Extract the raw cpustate list to its own module.
> This is more or less needed for KVM too.
> 
> For the tcg-specific registers, stuff them into tcg/cpregs.c
> 
> As a result, the monster that is tcg/helper.c is a bit less scary,
> and a lot of stuff is removed from cpu.h too, relegated to cpregs.h.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/cpregs.h            |  515 ++
>   target/arm/cpu.h               |  481 --
>   hw/arm/pxa2xx.c                |    1 +
>   hw/arm/pxa2xx_pic.c            |    1 +
>   hw/intc/arm_gicv3_cpuif.c      |    1 +
>   hw/intc/arm_gicv3_kvm.c        |    1 +
>   target/arm/cpregs.c            |  377 ++
>   target/arm/cpu.c               |    1 +
>   target/arm/cpu64.c             |    2 +-
>   target/arm/cpu_tcg.c           |    1 +
>   target/arm/cpustate-list.c     |  146 +
>   target/arm/gdbstub.c           |    1 +
>   target/arm/machine.c           |    1 +
>   target/arm/tcg/cpregs.c        | 7675 ++++++++++++++++++++++++++++++
>   target/arm/tcg/helper.c        | 8181 +-------------------------------
>   target/arm/tcg/op_helper.c     |    1 +
>   target/arm/tcg/translate-a64.c |    1 +
>   target/arm/tcg/translate.c     |    1 +
>   target/arm/meson.build         |    2 +
>   target/arm/tcg/meson.build     |    1 +
>   20 files changed, 8729 insertions(+), 8662 deletions(-)
>   create mode 100644 target/arm/cpregs.h
>   create mode 100644 target/arm/cpregs.c
>   create mode 100644 target/arm/cpustate-list.c
>   create mode 100644 target/arm/tcg/cpregs.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

