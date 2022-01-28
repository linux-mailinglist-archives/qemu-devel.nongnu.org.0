Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAAA49F7B2
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 11:57:47 +0100 (CET)
Received: from localhost ([::1]:58758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDOws-0006e5-Ef
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 05:57:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nDOuJ-0005gm-Vv
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 05:55:08 -0500
Received: from [2a00:1450:4864:20::535] (port=41918
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nDOuH-0003Vz-6y
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 05:55:07 -0500
Received: by mail-ed1-x535.google.com with SMTP id j2so8994053edj.8
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 02:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XyBalw8WQja9AqTXwskoTOx/wAivSzlSQvhqmeq9elU=;
 b=AosnHSfR+NmU/Y88nPv8bfWB/vbqCbVvUD+0GmVvOvrpQFs368I12x9bKfv6QKgN/2
 4CWewnFVWNlwCgnDfMDMGkO5qBTZXmaxUNEIAYCupZiLbGBeKO/rtUCz5Gs6/GurJ2p9
 BvCnv3ScQBJUpcHPRVTby/C/mmFcQ2LeusOlp7BVuaQesUFp8FR5hu/16vUA+OawTw0H
 Lxu/v2d7vzUddiN0kLE0thrtzXhKOuJiftashAXZeYE5F4fF5krHRYtCkS4ZEBtjk3FY
 ULEQaFo3I2S7jKedMEwJzyy7mye0isN3b78CpT+n8Hsi6FVHAHZWwveN6HghoXm9xrQ5
 LH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XyBalw8WQja9AqTXwskoTOx/wAivSzlSQvhqmeq9elU=;
 b=mhFK3iCXvQjZvYQuZ6QD4Veh2E1HXsMrJInru9unC8K/no0QFB9859e6snbb4Ua9kr
 bS8BduNz+yIaTlrr+4hi8T5eZVnsAXag10+IuKociLfCvezXtFt/xBT168TJSjyXz1e3
 4zahaF3jmBlP4ALI0OzfgcVaaVS0CX0kQjXb3s+dMaHLfGSxr4ZMoYVuqbVLzq1dNYE+
 LFQTLfD7aA1Tt5gZxbTwEHQAoquNZdt+csuMW1DShGhpvG1JOnNDgxV4g5RtKuvILO71
 ib8AiQfvnoTGFMW69HjEe1JQqJxwrW8gNx6JYwUb7mPl0h7DoKX5+SLaRL65ZoNwhA6n
 fRBw==
X-Gm-Message-State: AOAM530san6ZZ/xWgYNPT2o9zw0GNRkcOqbY/k7YtL0sObDq348sfiVd
 Ibz4aVk9hlSMVwrfAMYgR2c=
X-Google-Smtp-Source: ABdhPJwhvJuxvlWzemCZd2nJlp6iJY+lLs6nteKPVxH7O1CiTNvcwhc5ItZTH1PNpqQpOCRZapfr4g==
X-Received: by 2002:aa7:cb42:: with SMTP id w2mr7767567edt.376.1643367303657; 
 Fri, 28 Jan 2022 02:55:03 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id g6sm7643856ejz.170.2022.01.28.02.55.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jan 2022 02:55:03 -0800 (PST)
Message-ID: <932291d0-954b-7092-b61d-83182413ba9d@redhat.com>
Date: Fri, 28 Jan 2022 11:55:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] target/i386: Add kvm_get_one_msr helper
Content-Language: en-US
To: Yang Weijiang <weijiang.yang@intel.com>, ehabkost@redhat.com,
 qemu-devel@nongnu.org
References: <20220127155845.95594-1-weijiang.yang@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220127155845.95594-1-weijiang.yang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/22 16:58, Yang Weijiang wrote:
> @@ -135,6 +135,7 @@ static struct kvm_msr_list *kvm_feature_msrs;
>   
>   #define BUS_LOCK_SLICE_TIME 1000000000ULL /* ns */
>   static RateLimit bus_lock_ratelimit_ctrl;
> +static int kvm_get_one_msr(X86CPU *cpu, int index, uint64_t *value);
>   
>   int kvm_has_pit_state2(void)
>   {

...

> @@ -2734,6 +2721,25 @@ static int kvm_put_one_msr(X86CPU *cpu, int index, uint64_t value)
>       return kvm_vcpu_ioctl(CPU(cpu), KVM_SET_MSRS, cpu->kvm_msr_buf);
>   }
>   
> +static int kvm_get_one_msr(X86CPU *cpu, int index, uint64_t *value)
> +{
> +    int ret;
> +    struct {
> +        struct kvm_msrs info;
> +        struct kvm_msr_entry entries[1];
> +    } msr_data = {
> +        .info.nmsrs = 1,
> +        .entries[0].index = index,
> +    };
> +
> +    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_MSRS, &msr_data);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +    assert(ret == 1);
> +    *value = msr_data.entries[0].data;
> +    return ret;
> +}
>   void kvm_put_apicbase(X86CPU *cpu, uint64_t value)
>   {
>       int ret;

The patch is a good idea, but you can put the function before the uses. 
  This way there will be no need for a forward declaration, either.

Thanks,

Paolo

