Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A65E04E5486
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 15:48:29 +0100 (CET)
Received: from localhost ([::1]:36064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX2Hk-0004Cz-5j
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 10:48:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nX2Eg-0001Iv-Jz
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 10:45:19 -0400
Received: from [2a00:1450:4864:20::530] (port=40777
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nX2Cq-0006Bf-0B
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 10:43:25 -0400
Received: by mail-ed1-x530.google.com with SMTP id y10so2103025edv.7
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 07:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=siOkAmgFRaFnDpm0K2D3dUueuFRJOUHBT0v1MfBo/zM=;
 b=Wv+pDyxqTnNv7rZALXb0/X8p4e/5+RJz3WaCB3KoSxu6zd5elE9OzITSRbnzpdjTAI
 WxvbFudPFq4OwIVqEawonMSBIXlTQNZWP/wgY8Iat8wHZvf3CJvMFbjW2v6IucLuA7a8
 zrtkGysgPtPTt/3DA1G9oZoUcvRprkdXdMBIK+2BJowtyOydmo9TkKMWOe1ghcRle3T/
 YfA/1Hxofjs3mDtlWv/Ht8CqGIcVUc0X1/zNi9x4bv0EGUA7f6srhlr61SJFsewWxXW8
 zAlzwttxQHAyuHyu5QzeuAvH19BIRJiQFXMTWQSVwcRSAfPRkyh9phTET3dUpk9qtAEQ
 F1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=siOkAmgFRaFnDpm0K2D3dUueuFRJOUHBT0v1MfBo/zM=;
 b=Nn8D4ZfAz4fhtljzOhJbEAIZUebaid4VFhf3S6Ztuuq5JBwfkRbUy5XGHJ6oB/FZtc
 WemRzQrTGV9Mr8IplUX2YuwqUtXPPyiTXyV8g8iVfVS592gq/8mhs8pHtyTva2SEdw8E
 yH48y6LjPvWzuSphr+CmXRhtO4e6mr9ZkFdpo3LoifQPs8rqoC66uG9IfTLihsNyTFi3
 s9cLZqVhyGyYs44HpBTIIdrzK1WVm9KR8YDQH1lBy1HPpSn9/O4xZvjX2NPfj2uzojAu
 Yg/PGVFBudFUFj3DlJYDdbQa0tbk1l7t4JzxEbhzoIMJYFFNbJLnkBlKwoZIsmd/QI+8
 6dNA==
X-Gm-Message-State: AOAM533JUCZjXPHHSwq7xZwH/IzfKnjwC93DJ8It4wtsN+ual80NjOD5
 JTp4ofFcgdyohVSS9BFKG3c=
X-Google-Smtp-Source: ABdhPJzEcHpvukbGPgo8j4tgdXR1zqL4+CN0THz0nYpXS+hKz3UEiGqxISuUzbiEGNbBZs5LLkhm2Q==
X-Received: by 2002:a05:6402:1912:b0:418:cd23:3742 with SMTP id
 e18-20020a056402191200b00418cd233742mr470882edz.412.1648046602576; 
 Wed, 23 Mar 2022 07:43:22 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 z23-20020a170906435700b006b0e62bee84sm26457ejm.115.2022.03.23.07.43.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 07:43:22 -0700 (PDT)
Message-ID: <265f6824-7db4-8fda-f0b8-424b38e3e74f@redhat.com>
Date: Wed, 23 Mar 2022 15:43:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 2/5] softmmu/cpus: Free cpu->thread in
 generic_destroy_vcpu_thread()
Content-Language: en-US
To: Mark Kanda <mark.kanda@oracle.com>, qemu-devel@nongnu.org
References: <20220321141409.3112932-1-mark.kanda@oracle.com>
 <20220321141409.3112932-3-mark.kanda@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220321141409.3112932-3-mark.kanda@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/21/22 15:14, Mark Kanda wrote:
> diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
> index ea7dcad674..527592c4d7 100644
> --- a/accel/tcg/tcg-accel-ops.c
> +++ b/accel/tcg/tcg-accel-ops.c
> @@ -94,6 +94,7 @@ void tcg_handle_interrupt(CPUState *cpu, int mask)
>   
>   static void tcg_accel_ops_init(AccelOpsClass *ops)
>   {
> +    ops->destroy_vcpu_thread = generic_destroy_vcpu_thread;
>       if (qemu_tcg_mttcg_enabled()) {
>           ops->create_vcpu_thread = mttcg_start_vcpu_thread;
>           ops->kick_vcpu_thread = mttcg_kick_vcpu_thread;

This should not be done for the icount case, where there is only one thread.

Paolo

