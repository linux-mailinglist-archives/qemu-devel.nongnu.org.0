Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9CB64A44B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 16:38:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4ksk-0001Ua-4x; Mon, 12 Dec 2022 10:38:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4ksh-0001UC-8x
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:38:15 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4ksf-0006fU-I0
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:38:14 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 h8-20020a1c2108000000b003d1efd60b65so5534162wmh.0
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 07:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=wpvunxIuHO66zeFXqcFgCwF66wHnts8F+UDqx9Z9dno=;
 b=cHCKLk9JqjU/h5rJxZPgsxTYCNHvnwj20Ab4lbFUqvGLbeT6CgDuzSgPJ6I0idRvM3
 nKQ5MbssurIHHKPLDJEQEmPr6nh0YUBEfT3PIfz47Mp+FsdCCo79jjjywW8SbnruLPgF
 k0kAcf2pw80azvPdbY80/H2pVMi8BK9uyrtmY486DVh2bDYfFZm0voRsv2KKg4xTvpd+
 c2krYqa4aAehoOCjf7eVnIOo4NImIzW1JYj5XWxFlcxJ4zKbzdjKzDCsiJSfWjHjqgUD
 x4xwiUMKPgxU9m5TNNKKnN2dbu8QNgV2cD6LR709dVTWKIfonsZbtIBY7JzwFSyO0CMP
 zJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wpvunxIuHO66zeFXqcFgCwF66wHnts8F+UDqx9Z9dno=;
 b=4NLExNel/O0anR/g+47Iemms/Ah7XWut7qc+bUyTsZSOQmKSEI3e53wGSEezIVZYrR
 OSozlWZiaRodkyp/J5uCfCjG4xSngp8LUFTWcVV+4CVFvdGVcc0vVMDkLm+A8yHU4523
 u1lKrASJO5xcGNa61+h728YtC9z2dqJK/9PtXU9LlCm89isAIH+hr0zCT7oXjPvf3K1I
 I/Eh6Chz5lDysObzbhSfVZ9kcoQX4zsIljH/ClE02ElgOeMcUMfAunkpzQGXit6mJyhD
 wyyz3fRbaTSmr9zZSmxJwrie43OPI/fHf+exOp+Eu4egsgHWo9kgCBbMaZhExbLjqueN
 cf/Q==
X-Gm-Message-State: ANoB5pnNspIXG6B5qvtYBtVAWACZtoP4fdW/ITBYYjx0EtrnjvxiogX6
 zo2SkH/iNfOObKQOqPT438Y=
X-Google-Smtp-Source: AA0mqf45M09/2PNB1RZiLqUcQd1cPSxeXxEC8T8FWe5bVcCvQ2jWbOMoF3+wZlolADqlGkW6a3i4ZQ==
X-Received: by 2002:a05:600c:6899:b0:3d1:cf66:3afa with SMTP id
 fn25-20020a05600c689900b003d1cf663afamr12706988wmb.19.1670859491989; 
 Mon, 12 Dec 2022 07:38:11 -0800 (PST)
Received: from [192.168.4.46] (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a05600c348c00b003d070e45574sm9691708wmq.11.2022.12.12.07.38.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 07:38:11 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <4bacfc56-7d9b-b020-c048-dd8995e51418@xen.org>
Date: Mon, 12 Dec 2022 15:38:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 18/22] i386/xen: handle
 VCPUOP_register_runstate_memory_area
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
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-19-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221209095612.689243-19-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 09/12/2022 09:56, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> Allow guest to setup the vcpu runstates which is used as
> steal clock.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/cpu.h     |  1 +
>   target/i386/kvm/kvm.c |  9 +++++++++
>   target/i386/machine.c |  4 +++-
>   target/i386/xen.c     | 35 +++++++++++++++++++++++++++++++++++
>   4 files changed, 48 insertions(+), 1 deletion(-)
> 
[snip]
> +static int vcpuop_register_runstate_info(CPUState *cs, CPUState *target,
> +                                         uint64_t arg)
> +{
> +    struct vcpu_register_runstate_memory_area rma;
> +    uint64_t gpa;
> +    size_t len;
> +
> +    if (kvm_copy_from_gva(cs, arg, &rma, sizeof(*rma.addr.v))) {
> +        return -EFAULT;
> +    }
> +
> +    if (!kvm_gva_to_gpa(cs, rma.addr.p, &gpa, &len, false) ||
> +        len < sizeof(struct vcpu_time_info)) {
> +        return -EFAULT;
> +    }

Again, Xen stashes the GVA for this and not the GPA.

   Paul

