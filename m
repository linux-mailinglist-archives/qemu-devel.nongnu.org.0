Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6160F32BE42
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 23:42:12 +0100 (CET)
Received: from localhost ([::1]:35400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHaC3-0007gb-FQ
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 17:42:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHaAc-0006xO-KM
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 17:40:42 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:36051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHaAa-0000Sx-SO
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 17:40:42 -0500
Received: by mail-pf1-x435.google.com with SMTP id l7so13138420pfd.3
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 14:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=19f7qb+y53JUvtjj49PEhOyUOKx4GdRkcZ4TxjovP6o=;
 b=lhaYUznlzNOKrWes0imFI5KMW2dlMouFHt4iXY3cFTZesQ93/nvsGsD71hc8XKmJdC
 lyZ7YdQxnksbQBl9QYqXnRB80OJb5iORG46eIQ0oUO00lyLto9ECyduBi3LmdMyzGMfG
 Xgp6WfDg2J+TYy3Ym6dahStrGKYvcFVSQ8WcHEMM1JU1R1NnDezxIOoLgN3IxJLSDXFC
 RbdUOqair7pVNpzLelzoaqtlmNDguqzJbws9J1CSdzNyF9q9UEzrusuKmFo/5yjAS632
 G2LINNT4sxuf/yXvZ2f8Iq+puikASA+O+Qkc7BN8E/RMMvLuNjJR5GvHkQeHaFHhisOe
 6Zeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=19f7qb+y53JUvtjj49PEhOyUOKx4GdRkcZ4TxjovP6o=;
 b=WpqdFqEm1e3UvMYpdxsijWfqxjpl29ENm4p+DMdUhXxBpUT1a8JfwAGA71uscOZRsK
 19FMauCNj+OF9ImBkv2V0dULlUMhXe3KMDhDlfPr3bXzCKKqknSKpS6ZNK0GqxDTiFlQ
 A2bDHa3IgrnwpqP002qrJQ2CPW2562lEvVcXQ4LRen/VRquYtvRQ62VqlJJVVrSFXlZS
 TFKe4RndFrA3VOgeHjx4lzyODhy6E93QzzDUPGMGsoenWbvHsvDEdlwEoiIhTjJ+Tgdm
 G07q3bgTXPqXIZ48kgGoTTe4nz4qct0DS809eopDks/lheCe/VArzNDXzX+SrammJBcJ
 pe/w==
X-Gm-Message-State: AOAM530qwC1IBLrY4uoK83w5USctIRBrCNGJ3EU+Ke/fasHih3VP84HC
 4abmDVZ3zujTc9L/CDI+TTeqaQ==
X-Google-Smtp-Source: ABdhPJwz/bMCHyyD7OIkvr3YG1CVZ9O5KF5y4VexZUR5mN50uLcJIePe39XM65mIty99NkpI96B+/Q==
X-Received: by 2002:a63:3d0b:: with SMTP id k11mr1023694pga.390.1614811239246; 
 Wed, 03 Mar 2021 14:40:39 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id m16sm7568084pgj.26.2021.03.03.14.40.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 14:40:38 -0800 (PST)
Subject: Re: [PATCH v4 22/28] target/arm: Restrict watchpoint code to system
 emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210303214708.1727801-1-f4bug@amsat.org>
 <20210303214708.1727801-23-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e09f8ecf-700b-2394-10d9-3320b57e4de2@linaro.org>
Date: Wed, 3 Mar 2021 14:40:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210303214708.1727801-23-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 1:47 PM, Philippe Mathieu-Daudé wrote:
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index 844db08bd57..ed3f22d78a5 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -4849,6 +4849,7 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
>                   /* Some page is MMIO, see below. */
>                   goto do_fault;
>               }
> +#ifndef CONFIG_USER_ONLY
>               if (unlikely(flags & TLB_WATCHPOINT) &&
>                   (cpu_watchpoint_address_matches
>                    (env_cpu(env), addr + mem_off, 1 << msz)
> @@ -4856,6 +4857,7 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
>                   /* Watchpoint hit, see below. */
>                   goto do_fault;
>               }
> +#endif
>   

Nack.  These are eliminated via TLB_WATCHPOINT 0 in exec/cpu-all.h, and an 
empty inline function in hw/core/cpu.h.


r~

