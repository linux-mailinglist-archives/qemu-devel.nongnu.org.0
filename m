Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDC3696870
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 16:48:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRxWa-00045L-NZ; Tue, 14 Feb 2023 10:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRxWY-00041Q-Jd
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 10:47:18 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRxWW-0003Kf-Kw
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 10:47:18 -0500
Received: by mail-wr1-x42e.google.com with SMTP id h16so16093703wrz.12
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 07:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kpRF7xLMAZRoJ74hi+3Oaas282Nhtyrq/s+A0jUlUNk=;
 b=EgkKW4KY9cL3b4AbvwmLmjBGbh2P1ZWHYzghU3PmoGDzjifjSAsIqmE/6ah+jvyosR
 517wRQig1S1/SkAvbDQwvqWvJTC/7JpI/TpjnV5OkR80QZeapxcH5p+1jH2VSubXGA2G
 pdB5uFAZ9vVRgxmWxWy/1C/1tFFOshY8kwWZv7TG7Wbfak6Bq031Ugmgcro5d/Gu7w3d
 0aexSQEtEGqE0Bz1q5ia9oNk2jB12tN8EqLHvx9L2m9ZnjWa5jmxML7sFMpKjDaAogDS
 ErS/OvtjRmyE+31vHx3bMYu7UzHSd4rvyZCnGIM9sI6GKdWcAl3sZzwEKh3ir3Jjk8cV
 Z1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kpRF7xLMAZRoJ74hi+3Oaas282Nhtyrq/s+A0jUlUNk=;
 b=r+Mru+bXJS9v5wrJF/sFxoHXDgKwUF/EvYFYmNGrQ9rFA09/e2PUEedydhl4AYQEct
 LJ6xNpsce4na7Vk0MyPMl3oRcg83qP4cF2N0S8wdY05ZL+QsoTqOwdnPACIXLYTD/f46
 x6Q6IjIdBdN7yl96KKFrVDYG3P5eBKrnutkhzxEbap6FwNi7EgaQHXAYCPXzk891YJMy
 kwWQA0toSohKudpZx8dpecaXQsX6xLkoqwQq8Rgsnz1ukaL9DzCjjQ/WJtP9EtSoC/BE
 d0AureqwZmy4WtiPCHzvdrShkfoS0DSomw77PJV2oeJOPXiq8sLbHFnpXefaMxCfs4+/
 h3AQ==
X-Gm-Message-State: AO0yUKVvwu/IBuM6NoLEB54bhgeTHGMEChXXZP4bog33YYA4B99PTuJv
 +d5AtUlFDeB2ON9VR4nun44=
X-Google-Smtp-Source: AK7set/Q8OeHC3yCigB3k8ZX/e7ohKqF//R4akK/eYB4JVn0Xt2ohBd/l3QO7aVYicY2m2Fmy8Pl7Q==
X-Received: by 2002:a5d:440a:0:b0:2c5:5b0e:6ee9 with SMTP id
 z10-20020a5d440a000000b002c55b0e6ee9mr2379426wrq.39.1676389635114; 
 Tue, 14 Feb 2023 07:47:15 -0800 (PST)
Received: from [10.95.154.108] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a5d4564000000b002c54df43b42sm8899655wrc.23.2023.02.14.07.47.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 07:47:14 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <5cf88926-c53b-7c08-972d-9a8d822cfd2e@xen.org>
Date: Tue, 14 Feb 2023 15:47:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 49/59] i386/xen: handle HVMOP_get_param
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
References: <20230201143148.1744093-1-dwmw2@infradead.org>
 <20230201143148.1744093-50-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-50-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.35, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 01/02/2023 14:31, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> Which is used to fetch xenstore PFN and port to be used
> by the guest. This is preallocated by the toolstack when
> guest will just read those and use it straight away.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/kvm/xen-emu.c | 39 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
> index 75e62bc02f..3d6ea7ca98 100644
> --- a/target/i386/kvm/xen-emu.c
> +++ b/target/i386/kvm/xen-emu.c
> @@ -762,6 +762,42 @@ out:
>       return true;
>   }
>   
> +static bool handle_get_param(struct kvm_xen_exit *exit, X86CPU *cpu,
> +                             uint64_t arg)
> +{
> +    CPUState *cs = CPU(cpu);
> +    struct xen_hvm_param hp;
> +    int err = 0;
> +
> +    /* No need for 32/64 compat handling */
> +    qemu_build_assert(sizeof(hp) == 16);
> +
> +    if (kvm_copy_from_gva(cs, arg, &hp, sizeof(hp))) {
> +        err = -EFAULT;
> +        goto out;
> +    }
> +
> +    if (hp.domid != DOMID_SELF && hp.domid != xen_domid) {
> +        err = -ESRCH;
> +        goto out;
> +    }
> +
> +    switch (hp.index) {
> +    case HVM_PARAM_STORE_PFN:
> +        hp.value = XEN_SPECIAL_PFN(XENSTORE);

Reviewed-by: Paul Durrant <paul@xen.org>

... but this reminds me... I don't think you have code to seed the grant 
table in any of the patches. It is guest ABI that the XenStore PFN is in 
entry 1 of the grant table.

> +        break;
> +    default:
> +        return false;
> +    }
> +
> +    if (kvm_copy_to_gva(cs, arg, &hp, sizeof(hp))) {
> +        err = -EFAULT;
> +    }
> +out:
> +    exit->u.hcall.result = err;
> +    return true;
> +}
> +
>   static int kvm_xen_hcall_evtchn_upcall_vector(struct kvm_xen_exit *exit,
>                                                 X86CPU *cpu, uint64_t arg)
>   {
> @@ -806,6 +842,9 @@ static bool kvm_xen_hcall_hvm_op(struct kvm_xen_exit *exit, X86CPU *cpu,
>       case HVMOP_set_param:
>           return handle_set_param(exit, cpu, arg);
>   
> +    case HVMOP_get_param:
> +        return handle_get_param(exit, cpu, arg);
> +
>       default:
>           return false;
>       }


