Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1567F66E8A4
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 22:42:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHtgy-0005e2-5k; Tue, 17 Jan 2023 16:40:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHtgv-0005cE-QH
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 16:40:25 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHtgu-0003GG-5Q
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 16:40:25 -0500
Received: by mail-pg1-x535.google.com with SMTP id 7so23054347pga.1
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 13:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AcVEPWClRI94g9v5KSp3wSvgePAX02EC69sY1cg8Ei4=;
 b=y3NrN4Quhl38XnkVyfYFikfMGXuzUdOe86QeHc3ich9WveIqGYWPk5HPehBRmwxf6H
 CjxERbsV7hXXf1u1KTQZDoqZtTX1IoZodSrd1kTyXIb6dyMKoVMeeAUo+mwEcC9mp/2m
 BNexm0zJUZPNlbdhtEHh15Erpz0b26SnGDHA6SP7lAYFkfQ5NzWWjYurSwB1NnREKM04
 DarVSe0lglQ+qAtFuBPk/lt2ySdXvHIjAYyE8GCSkMrX/6ow6LPxLBPL9hNkgEdyBLne
 ippIwjfBdN8uYC0nIRqXsJLU3St9AcBZfjR6ppm0D+snmwdQ3hBhrFoH7DjBqMgfsNlJ
 ic3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AcVEPWClRI94g9v5KSp3wSvgePAX02EC69sY1cg8Ei4=;
 b=a2KscnC7dGpvTTkbzMdRqJDAFJTkVemiLBhvmM30GP5C+7fhR2Dpa6t8oqZI4IhBbN
 36MzdygpPe6/qagH8DZlI8Wn/eQh/r25CGsb8F95tNxn6NypJ2Tb666zqnhHRZ02JcW0
 osf0CysNS3TJF/cDsxfVzC1+nUMaTLIir21lr8HjWUHaWLfaq+SxypXwk9TKB6EonDof
 ik2rlR8FNe9yFmKEKxYRBtydqyMQtzwhAuMQIJ+Rz/WklOwGGbWFOEG5+eBo95uPZtQh
 +YO07RuJCb4oR2QabCFoPdlp1+yRVSgc2AYaqVMcCLsm6w8PMkbCK74iQ0cZ+OsBsq7O
 dPqA==
X-Gm-Message-State: AFqh2kpodOiXRSPz8TisgyZ0mfGG41XaPss+rVmY8PMmDbIAjImQ5N07
 8cG10iKv/ZCG7AmJwKHIkfzNsQ==
X-Google-Smtp-Source: AMrXdXupIDdN8ZJmd88BdgAI0PdfPFNZi4DnoPsB0hEfWs5UMouzHWeY2a5QMfRIj9ZxDgaAKaxuuQ==
X-Received: by 2002:a62:1851:0:b0:581:95a7:d2f4 with SMTP id
 78-20020a621851000000b0058195a7d2f4mr24761696pfy.9.1673991622365; 
 Tue, 17 Jan 2023 13:40:22 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 f129-20020a623887000000b0058bf2ae9694sm6177716pfa.156.2023.01.17.13.40.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 13:40:21 -0800 (PST)
Message-ID: <cb9cdb62-5c5a-c7de-9fa7-99f5438af332@linaro.org>
Date: Tue, 17 Jan 2023 11:40:18 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH qemu v2 2/3] target/arm/gdbstub: Support reading M system
 registers from GDB
Content-Language: en-US
To: ~dreiss-meta <dreiss@meta.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <167398464577.10345.18365355650640365165-2@git.sr.ht>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <167398464577.10345.18365355650640365165-2@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 1/9/23 13:05, ~dreiss-meta wrote:
> From: David Reiss <dreiss@meta.com>
> 
> Follows a fairly similar pattern to the existing special register debug
> support.  Only reading is implemented, but it should be possible to
> implement writes.
> 
> `v7m_mrs_control` was renamed `arm_v7m_mrs_control` and made
> non-static so this logic could be shared between the MRS instruction and
> the GDB stub.
> 
> Signed-off-by: David Reiss <dreiss@meta.com>
> ---
>   target/arm/cpu.h      |  12 +++-
>   target/arm/gdbstub.c  | 125 ++++++++++++++++++++++++++++++++++++++++++
>   target/arm/m_helper.c |   6 +-
>   3 files changed, 138 insertions(+), 5 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index bf2bce046d..fdbb0d9107 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -856,6 +856,7 @@ struct ArchCPU {
>   
>       DynamicGDBXMLInfo dyn_sysreg_xml;
>       DynamicGDBXMLInfo dyn_svereg_xml;
> +    DynamicGDBXMLInfo dyn_m_systemreg_xml;

You don't need a new variable here, because a given cpu cannot be both a-profile and 
m-profile -- dyn_sysreg_xml can hold the xml for the current set of system registers.


> +    g_autoptr(GArray) regs = g_array_new(false, true, sizeof(const char *));
> +    /* 0 */ g_array_append_str_literal(regs, "msp");
> +    /* 1 */ g_array_append_str_literal(regs, "psp");
> +    /* 2 */ g_array_append_str_literal(regs, "primask");
> +    /* 3 */ g_array_append_str_literal(regs, is_main ? "basepri" : "");
> +    /* 4 */ g_array_append_str_literal(regs, is_main ? "faultmask" : "");
> +    /* 5 */ g_array_append_str_literal(regs, "control");
> +    /* 6 */ g_array_append_str_literal(regs, is_v8 ? "msplim" : "");
> +    /* 7 */ g_array_append_str_literal(regs, is_v8 ? "psplim" : "");

Can use NULL instead of ""?

Otherwise it looks plausible.


r~

