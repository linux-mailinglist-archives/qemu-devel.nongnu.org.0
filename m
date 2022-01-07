Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6070E487DB3
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 21:26:09 +0100 (CET)
Received: from localhost ([::1]:33216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5voO-0001cP-Fx
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 15:26:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5vmJ-00005D-Fz
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 15:23:59 -0500
Received: from [2607:f8b0:4864:20::535] (port=43859
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5vmH-0005gB-OR
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 15:23:59 -0500
Received: by mail-pg1-x535.google.com with SMTP id 8so6340293pgc.10
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 12:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xDdfZmWyqdSVTAXVBADg0hD3oX2PNa9PSothirQTFSc=;
 b=GwFaMgbOJ7vA6rwcaZq6QXY9LSIBtiqYffH5RrxDF70uezPqIy7HuzeQ2SjW+QEbUz
 CKT8I/s+pt1nYnGQZ/O3D5QH7UcQu7QSnMS81azkgUo+9wjFyuwZlaQ5CPLw+ZzBDHOR
 Q9t2e0yQCppOMHHOEWhdFw9AO4HLdkdBAFpOZNtu9bjQ3ej25vV1ttXJXhy/EBqNHtgx
 pJuI4xCtsiAznyoXE0fPfCUSWmOcp40jwUOKW4vI4q98KxU7hhnQAcdPfRMy1F3v6sOp
 568KU5kdPZthHU8gwNSyJJ7e7GHeazy13Jg2fKMA5yeEKAIAjqyb9NtPvAA5vX+MJR+e
 GMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xDdfZmWyqdSVTAXVBADg0hD3oX2PNa9PSothirQTFSc=;
 b=ueWn0XjkLKWv5iNVAOXKdH5x0/S7iocbMAkq0J5b239PV0a8O5x/lkpYFF9EQjfN1E
 Kfl1IOLQmmzFr0ZyCvtFT76fyeKHp0FQ9eI6sPGoGYvRns/AeVEHWeN+GerNQQERgyyY
 Tlmhlj/wju0XgfTPZT5GQc078a7HL5QcFSDA1sRRKp3FwEw7zm0YbmVwFvZ1oceZHjrh
 Z+0tUBS41m9WdEOSwB3FOd86Siz5x2Lc83wb18OIrZvaM09sCwvL89IP6gqbRae+0Oqg
 BOkKOcu75rAekhBvTwNCG+X7doYPz47K2zdzqxqMTuGFQW16a6BEWt1JUFIPqfIr0Vho
 fFQA==
X-Gm-Message-State: AOAM533bszh9/up8jA3gorPYGyexeDjE4qx5zH3aQZ391ymEiCcNcT1y
 A1TjW9G4/r+Flmu4GAAMKPb7QA==
X-Google-Smtp-Source: ABdhPJzftw4PEotEHASckTN5Gy0MMQebU7XjsnC+2xdRTZQFdnCEJ67BUd0zbNp7g3vfVMes2gAU8A==
X-Received: by 2002:a63:9602:: with SMTP id c2mr42975234pge.538.1641587036373; 
 Fri, 07 Jan 2022 12:23:56 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id p24sm6121962pfn.33.2022.01.07.12.23.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 12:23:55 -0800 (PST)
Subject: Re: [PATCH v3] hw/arm/virt: KVM: Enable PAuth when supported by the
 host
To: Marc Zyngier <maz@kernel.org>, qemu-devel@nongnu.org
References: <20220107150154.2490308-1-maz@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a3d32f18-dbbb-e462-82ce-722f424707f9@linaro.org>
Date: Fri, 7 Jan 2022 12:23:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220107150154.2490308-1-maz@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/22 7:01 AM, Marc Zyngier wrote:
> @@ -1380,17 +1380,10 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
>               return;
>           }
>   
> -        /*
> -         * KVM does not support modifications to this feature.
> -         * We have not registered the cpu properties when KVM
> -         * is in use, so the user will not be able to set them.
> -         */
> -        if (!kvm_enabled()) {
> -            arm_cpu_pauth_finalize(cpu, &local_err);
> -            if (local_err != NULL) {
> +        arm_cpu_pauth_finalize(cpu, &local_err);
> +        if (local_err != NULL) {
>                   error_propagate(errp, local_err);
>                   return;
> -            }
>           }

Indentation is still off -- error + return should be out-dented one level.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

