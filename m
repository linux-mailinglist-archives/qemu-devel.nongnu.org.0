Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 426156BAE5C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 12:00:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcOrY-00037o-RH; Wed, 15 Mar 2023 07:00:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcOrS-00037T-RO
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 07:00:02 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcOrR-0002Ow-0F
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 07:00:02 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so892613wmq.1
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 04:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678877999;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uY+Du/VTw6nql03ctQATnllWacqEdnR5xSIV88jjV/M=;
 b=MxiBv+reRdZjxt6qDvUEXxzSLTQgTE+cKqGsJMkJIVueOpB2B0ZtfD8xIkk9F2rTTp
 dCVes8/SD4+LizAtMz+KKb9elGJZZbJ5D9VmD1Q+9Zw7cUHZpu8QKWMm1gO1B6Yu1m1H
 mTmgJ1Dpri/1FEHxeDYRuqUz5kijYZlhL5Bc+xqUr29lJ63HNeqcAnzsArR+owKcx/+r
 ZxGQkS8ZzZnp9sFyJVqo0fk/JcL5uU7WfU8G/hd6GdmRb9B5RUuGaVpt2dY4H1P8jbAm
 uZ6ECT2F1vDM7UzSC0zfImGSg2wzY5rNXLBAI+YLX/PhnYp36CjB7VZIe3SX/t8MXhf4
 7cDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678877999;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uY+Du/VTw6nql03ctQATnllWacqEdnR5xSIV88jjV/M=;
 b=NuPL9fBmz4xWU1JlH4WTIt5oK6yvi0mgtlNGBzoWg7vtV5T8d3OLm9BtLIuKRuWfml
 2BXTtj+dK8B/hhccctQYQnfKh2ai5xEGVEIURTPCT6beTrNOjFNmQX9BXlNGBtuek0NI
 8EiduKR6bQ+l/APKJnlio8qRU7pHEINMVw9tfmU+PqDJVWb+hcrDT25tYem/zxB2FrYq
 oHuaIjsazUtcl24pr66irBUOKATlpCD3piWtrAfc3B688mTwlOHXWzDgylkXDOs43rOA
 Yq4MY06Vfcl6ZgGvizwPMzT4gMx5GTJwW4pmLLCStN/d8Q0URXNFE8KfnHSklCGPTKSB
 ZrFw==
X-Gm-Message-State: AO0yUKVVdFOfrOOaqMm+lmQOvQ+By8WNxCU/fHhAk//rHf6yvqFKY4RC
 24CqoCWhOKRTgtutzb28bHV0mA==
X-Google-Smtp-Source: AK7set/k8BLpLkZITycVdCxhKdOzA5Ucdwe2eUHl112pqGCfuoYKfM6MPrGE5WoQ0gfkM6mnI99u2A==
X-Received: by 2002:a05:600c:b85:b0:3eb:399d:ab18 with SMTP id
 fl5-20020a05600c0b8500b003eb399dab18mr17797093wmb.35.1678877998822; 
 Wed, 15 Mar 2023 03:59:58 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i7-20020a5d6307000000b002c70851bfcasm4332972wru.28.2023.03.15.03.59.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 03:59:58 -0700 (PDT)
Message-ID: <73f5c61e-7250-3255-7a87-4b444e209ca6@linaro.org>
Date: Wed, 15 Mar 2023 11:59:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PULL 1/4] Fix build without CONFIG_XEN_EMU
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Miroslav Rezanina <mrezanin@redhat.com>,
 David Woodhouse <dwmw@amazon.co.uk>
References: <20230315105148.611544-1-pbonzini@redhat.com>
 <20230315105148.611544-2-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230315105148.611544-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 15/3/23 11:51, Paolo Bonzini wrote:
> From: Miroslav Rezanina <mrezanin@redhat.com>
> 
> Upstream commit ddf0fd9ae1 "hw/xen: Support HVM_PARAM_CALLBACK_TYPE_GSI callback"
> added kvm_xen_maybe_deassert_callback usage to target/i386/kvm/kvm.c file without
> conditional preprocessing check. This breaks any build not using CONFIG_XEN_EMU.
> 
> Protect call by conditional preprocessing to allow build without CONFIG_XEN_EMU.
> 
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
> Message-Id: <20230308130557.2420-1-mrezanin@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   target/i386/kvm/kvm.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 1aef54f87e64..de531842f6b1 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -4991,6 +4991,7 @@ MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
>           kvm_rate_limit_on_bus_lock();
>       }
>   
> +#ifdef CONFIG_XEN_EMU    

This triggers:

1/4 Checking commit ddc7cb30f824 (Fix build without CONFIG_XEN_EMU)
ERROR: trailing whitespace
#29: FILE: target/i386/kvm/kvm.c:4994:
+#ifdef CONFIG_XEN_EMU    $

total: 1 errors, 0 warnings, 14 lines checked

