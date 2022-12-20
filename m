Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 713CF65233C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:58:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7e4i-0001T7-Cu; Tue, 20 Dec 2022 09:58:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p7e4g-0001PT-Bw
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:58:34 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p7e4e-0004vL-RU
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:58:34 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 o5-20020a05600c510500b003d21f02fbaaso11316098wms.4
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=kuW+pqh5ZrqMqnHaA35TmcTQ/LtbfV/W2Zluc4HVTr0=;
 b=k2lbVgp7S2UCURXI8gYGNzMoaDbo6q8loR0Z87ZHYUGGbl9oNtDZCDQlN4rBg1dwvj
 08CAhszqtbGvY+Pd6T8mrvQNRvWH0AMpyuhKmdRGvQQMSth1Sw9DhPzRqy2hqiFTBxPH
 GAVOKXyXpu4e/b/ZoRroWHHketc85dm8D/7RHbq3bT40zOcQBsnI2pyjVJkVNkaibSsA
 JALW9w4yxFHKyuk4JlCmvZtwfW+bwUwWeY9Nk1aJrAaZTtXGawm2j81y5gfivK+tW44d
 VW6Q3dpbgl6e8gBSuPLe2XB4QT53+ey0E2jnQgjnLW9TRYVNpon+y73E4cuIXvKnbXAu
 JC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kuW+pqh5ZrqMqnHaA35TmcTQ/LtbfV/W2Zluc4HVTr0=;
 b=HcdFB7x4LT90zBwEWgy55B5ovn86+W++UoPoUDNsfhJamxWUAdtyW8hOBEK3/cUj9q
 xDhTSO/U6PwZbNKH6hLyibOD75sp9ACzUfL5hiAGP36c5JDgIy92cIsQOzgH7vlXmk9e
 57LPk7nMf0hAMaoEQPRFQ3UTafIjShR6vrkVYl9eSPV8ViEg+w6otlLen280XFEe2D+3
 oL8Es+WiGrSxMjjV+e4/zq+1HpDIrSlxBYK1ekx6dXik4yBy1I8xWK7Y0VDf1OQDjz1n
 6Cz943TCwamasXT+KJr1x/uiten8c7iLC9r7imUbR0V6HxOVXzIsEPCDZ8oGbbcJMZ/E
 rTTg==
X-Gm-Message-State: AFqh2koHsVf+gKeE88/sHR5zv4/x3+ZNYDHTrjeUoo21YTrCPGgTyEcR
 em9DaJ+kKQHZhj9HTdMJ4dQ=
X-Google-Smtp-Source: AMrXdXtmQ27jptf4QWclZMgpFuB82ybt16OhV06RcxRv2Kxm9cjCQiGBx8OD2qtfJE6B7Bmq1kPvwg==
X-Received: by 2002:a7b:cb86:0:b0:3d0:4af1:a36e with SMTP id
 m6-20020a7bcb86000000b003d04af1a36emr1865795wmi.26.1671548311410; 
 Tue, 20 Dec 2022 06:58:31 -0800 (PST)
Received: from [192.168.6.89] (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0a4c00b003cfa3a12660sm2752251wmq.1.2022.12.20.06.58.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 06:58:31 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <756138f6-95b0-c7a3-8e4a-3637266eeab3@xen.org>
Date: Tue, 20 Dec 2022 14:58:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH v3 05/38] i386/kvm: handle Xen HVM cpuid leaves
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221216004117.862106-1-dwmw2@infradead.org>
 <20221216004117.862106-6-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221216004117.862106-6-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.161, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 16/12/2022 00:40, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> Introduce support for emulating CPUID for Xen HVM guests. It doesn't make
> sense to advertise the KVM leaves to a Xen guest, so do it unconditionally
> when the xen-version machine property is set.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> [dwmw2: Obtain xen_version from machine property, make it automatic]
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/cpu.c         |  1 +
>   target/i386/cpu.h         |  2 +
>   target/i386/kvm/kvm.c     | 78 +++++++++++++++++++++++++++++++++++++--
>   target/i386/kvm/xen-emu.c |  4 +-
>   target/i386/kvm/xen-emu.h | 13 ++++++-
>   5 files changed, 91 insertions(+), 7 deletions(-)
>
[snip]
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index a98995d4d7..5977edb1ca 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -22,6 +22,7 @@
>   
>   #include <linux/kvm.h>
>   #include "standard-headers/asm-x86/kvm_para.h"
> +#include "standard-headers/xen/arch-x86/cpuid.h"
>   
>   #include "cpu.h"
>   #include "host-cpu.h"
> @@ -1750,7 +1751,6 @@ int kvm_arch_init_vcpu(CPUState *cs)
>       int max_nested_state_len;
>       int r;
>       Error *local_err = NULL;
> -
>       memset(&cpuid_data, 0, sizeof(cpuid_data));
>   

nit: this seems to be a gratuitous whitespace change

>       cpuid_i = 0;

With that fixed...

Reviewed-by: Paul Durrant <paul@xen.org>


