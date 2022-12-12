Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A0564A4B8
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 17:25:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4lau-0007n6-AX; Mon, 12 Dec 2022 11:23:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4las-0007mx-3P
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:23:54 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4laq-0001Xo-HR
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:23:53 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso4131325wmp.3
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 08:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=THiHIuB0p7h9vC4l7JndhlvgHdjQAH3vgMdil1nHSoM=;
 b=gedRsSXdFf6L/CMQjyLqO/+jB7nTOb2dxQQ0gjZl5F48IOBIP4kUhTZnhzRXGnGS3q
 iO57tGqTBbXmVq7kGq3roQ4sM5J3pYJizfDVnavo7jgtwKuQRag6weqvoS505CHVrcDm
 jMs6tLU4lt15Ea0yS7dnfM0/WaA3t90W2wFbUeZXg7K0O8l/NOWtY1Zm6UuH23AXXKLG
 FbC0wOENewlhGRQt+wjJF+w3GrXkCZMUQG5gvwJ05ZfKCZeyAuYcpza5wn1T/czeyqRe
 pnKLy10KUTIrcWgymS1x8osDuoFXeFU//V+t9lhUiEeN81ZvX6Di7dkntTAFUoGQb1Bk
 iVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=THiHIuB0p7h9vC4l7JndhlvgHdjQAH3vgMdil1nHSoM=;
 b=W8dUAzY6wdL5vygWQL1dXqm1MLqQtQIiuj2QI5DC5BcPggvsK1FPpEmTTibFVif3S2
 J/oc5Kos9Y356KfOVYWxNCTSKqYMHwLFATd4HNypGwtTfJW8U+Cq8dgw2ZAq8R93cSze
 KQ3kJsllYEfsj6TWpgrhEdlIg+hd5RXVo1qWHCo8OltfVVnzt/G7VG6Vt1gHAsUD6odP
 vsXoiHyWrcMe6eh7Gq5IGGI7XiSPcjGsd3dfTL1vy4isf9PRhuldVDcecDeh3TDSGNgT
 h/0YQpeQpocQpjK7MvdHE6EGN7cQ7IcGGlN/iZjaPy0SmVzuweg7rteTsrLhomDXQtKW
 tkHQ==
X-Gm-Message-State: ANoB5pm5qQNMkSnAn54rfPfAW0pLUiZ/3yi7zYHZIJaR/dE+1tf1c7vq
 Tj58BphGBfK9PGwguitL5Kc=
X-Google-Smtp-Source: AA0mqf4acYsLn+swPZzpQmUXH7qBbFAVu/BBA6ZmwR4Zjf+xFIN3odl4bzmM83qwvF63D+CIuNaIlw==
X-Received: by 2002:a05:600c:688c:b0:3d0:73f5:b2c0 with SMTP id
 fn12-20020a05600c688c00b003d073f5b2c0mr13272123wmb.20.1670862230941; 
 Mon, 12 Dec 2022 08:23:50 -0800 (PST)
Received: from [192.168.4.46] (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id
 h67-20020a1c2146000000b003d1de805de5sm10033640wmh.16.2022.12.12.08.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 08:23:50 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <c2aea82a-388b-5e6e-6f2b-3fd6b7e1c848@xen.org>
Date: Mon, 12 Dec 2022 16:23:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 21/22] i386/xen: implement
 HYPERVISOR_event_channel_op
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
 <20221209095612.689243-22-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221209095612.689243-22-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x335.google.com
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
> Additionally set XEN_INTERFACE_VERSION to most recent in order to
> exercise both event_channel_op and event_channel_op_compat.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/xen.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 45 insertions(+)
> 
> diff --git a/target/i386/xen.c b/target/i386/xen.c
> index 1af336d9e5..f102c40f04 100644
> --- a/target/i386/xen.c
> +++ b/target/i386/xen.c
> @@ -18,11 +18,14 @@
>   #include "hw/i386/kvm/xen_overlay.h"
>   #include "hw/i386/kvm/xen_evtchn.h"
>   
> +#define __XEN_INTERFACE_VERSION__ 0x00040400
> +

Xen is actually at:

#define __XEN_LATEST_INTERFACE_VERSION__ 0x00040e00

now.

>   #include "standard-headers/xen/version.h"
>   #include "standard-headers/xen/memory.h"
>   #include "standard-headers/xen/hvm/hvm_op.h"
>   #include "standard-headers/xen/hvm/params.h"
>   #include "standard-headers/xen/vcpu.h"
> +#include "standard-headers/xen/event_channel.h"
>   
>   static bool kvm_gva_to_gpa(CPUState *cs, uint64_t gva, uint64_t *gpa,
>                              size_t *len, bool is_write)
> @@ -452,6 +455,42 @@ static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
>       return true;
>   }
>   
> +static bool kvm_xen_hcall_evtchn_op_compat(struct kvm_xen_exit *exit,
> +                                          X86CPU *cpu, uint64_t arg)
> +{
> +    struct evtchn_op op;
> +    int err = -EFAULT;
> +
> +    if (kvm_copy_from_gva(CPU(cpu), arg, &op, sizeof(op))) {
> +        goto err;
> +    }
> +
> +    switch (op.cmd) {
> +    default:
> +        return false;
> +    }
> +err:
> +    exit->u.hcall.result = err;
> +    return true;
> +}
> +
> +static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit,
> +                                    int cmd, uint64_t arg)
> +{
> +    int err = -ENOSYS;
> +
> +    switch (cmd) {
> +    case EVTCHNOP_init_control:
> +        err = -ENOSYS;

Why? It already has that value.

   Paul

> +        break;
> +    default:
> +        return false;
> +    }
> +
> +    exit->u.hcall.result = err;
> +    return true;
> +}
> +


