Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 301D466CBFE
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 18:21:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHTAD-0006Ec-1Y; Mon, 16 Jan 2023 12:20:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHTAB-0006EU-Nk
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 12:20:51 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHTAA-0002iu-0h
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 12:20:51 -0500
Received: by mail-wr1-x432.google.com with SMTP id h16so28140921wrz.12
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 09:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X2CriQPW3zj9RV25XOAnLqTriHyg08BtY5dVR/sNLZc=;
 b=nAgWHhmlq4IaVallCoX0dcvc0WAwxqyRtNXuXdWTJVHmxK0a2PA463y4VLtB54SZGI
 qUKGITiWlQ8D4BDi34j3SBHY39eHi2EzFPP+KgLsSNd2TaR22ruwnyIOKxtD58yf4QP2
 oVg7+zDh23rz9wIc760bG6OQxCzjDbzOBo7GGrO2rrqm9Cybe0LXCezNHkQtZcGYkvi2
 yvOxz1ZiBK174WCq+gmD+sK2dOnBC096gn+f3Q2jo8bIoHyTunhrNP6eiQFUHe9YEeVo
 xdFNYD4C92nu7fdg53INj3bxQw7EkSKO1hL6DMvk61YNtt7hl2zO3CtcpwpEtyuDIqEE
 cNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X2CriQPW3zj9RV25XOAnLqTriHyg08BtY5dVR/sNLZc=;
 b=VXiJg22UrbHyBh0CqA8ysGPD/NLIQE05DXCvHcCYEj8a8D28sisQK7gFxcZi5KGpzE
 Up0+6bDB+IH4S0X1Qb0iKjkCSbtdJ/TNKjHlnc2F1jbUyogjTarn5AMD1Yc83LOBM95Q
 u5NwT65JshSLmRulAeSKGaZSiVyWRoyb9d/CwRWxrCg9y/knENjWXpWR0HWm6UVfO3eC
 MiiC4dOw1X5t1LPOCnPBwfJvKCKtIGJ1bd7GNjhiVLFU02L3jvsfj0MMEqVRlw1xdhfx
 XIxANkkqxRa3XL67+VfbefZxpweoP+EiHwlfdD+rNWOBhBhiEfSskL7arkJPnpFhJkw3
 53kg==
X-Gm-Message-State: AFqh2krb5mFpk3K8XmPo6Yhp5TI9mSR6vvAovRfxAmKFX0O8UbIuvILi
 gfbnlAJsFmmYbt0nc1HW4vM=
X-Google-Smtp-Source: AMrXdXuQQ1l3pq3617pvMDMQz9I5Z/ahSh2VAdkPvmNKxLvg9aTvKkZeRb94JBy5HHifLYPpKPaRsA==
X-Received: by 2002:a05:6000:1708:b0:2bd:db1c:8dfe with SMTP id
 n8-20020a056000170800b002bddb1c8dfemr280979wrc.48.1673889648009; 
 Mon, 16 Jan 2023 09:20:48 -0800 (PST)
Received: from [192.168.6.176] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 z12-20020adfd0cc000000b002bdff778d87sm4015164wrh.34.2023.01.16.09.20.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 09:20:47 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <9384a737-02b7-a32f-2805-4319542373bc@xen.org>
Date: Mon, 16 Jan 2023 17:20:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 15/51] i386/xen: manage and save/restore Xen guest
 long_mode setting
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
References: <20230110122042.1562155-1-dwmw2@infradead.org>
 <20230110122042.1562155-16-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230110122042.1562155-16-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 10/01/2023 12:20, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Xen will "latch" the guest's 32-bit or 64-bit ("long mode") setting when
> the guest writes the MSR to fill in the hypercall page, or when the guest
> sets the event channel callback in HVM_PARAM_CALLBACK_IRQ.
> 
> KVM handles the former and sets the kernel's long_mode flag accordingly.
> The latter will be handled in userspace. Keep them in sync by noticing
> when a hypercall is made in a mode that doesn't match qemu's idea of
> the guest mode, and resyncing from the kernel. Do that same sync right
> before serialization too, in case the guest has set the hypercall page
> but hasn't yet made a system call.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Reviewed-by: Paul Durrant <paul@xen.org>

... with one suggestion...

> ---
>   hw/i386/kvm/xen_overlay.c | 65 +++++++++++++++++++++++++++++++++++++++
>   hw/i386/kvm/xen_overlay.h |  4 +++
>   target/i386/kvm/xen-emu.c | 12 ++++++++
>   3 files changed, 81 insertions(+)
> 
> diff --git a/hw/i386/kvm/xen_overlay.c b/hw/i386/kvm/xen_overlay.c
> index 3e85bf912f..6fd63ff906 100644
> --- a/hw/i386/kvm/xen_overlay.c
> +++ b/hw/i386/kvm/xen_overlay.c
> @@ -44,6 +44,7 @@ struct XenOverlayState {
>       MemoryRegion shinfo_mem;
>       void *shinfo_ptr;
>       uint64_t shinfo_gpa;
> +    bool long_mode;
>   };
>   
>   struct XenOverlayState *xen_overlay_singleton;
> @@ -96,9 +97,21 @@ static void xen_overlay_realize(DeviceState *dev, Error **errp)
>   
>       s->shinfo_ptr = memory_region_get_ram_ptr(&s->shinfo_mem);
>       s->shinfo_gpa = INVALID_GPA;
> +    s->long_mode = false;
>       memset(s->shinfo_ptr, 0, XEN_PAGE_SIZE);
>   }
>   
> +static int xen_overlay_pre_save(void *opaque)
> +{
> +    /*
> +     * Fetch the kernel's idea of long_mode to avoid the race condition
> +     * where the guest has set the hypercall page up in 64-bit mode but
> +     * not yet made a hypercall by the time migration happens, so qemu
> +     * hasn't yet noticed.
> +     */
> +    return xen_sync_long_mode();
> +}
> +
>   static int xen_overlay_post_load(void *opaque, int version_id)
>   {
>       XenOverlayState *s = opaque;
> @@ -107,6 +120,9 @@ static int xen_overlay_post_load(void *opaque, int version_id)
>           xen_overlay_map_page_locked(&s->shinfo_mem, s->shinfo_gpa);
>           xen_overlay_set_be_shinfo(s->shinfo_gpa >> XEN_PAGE_SHIFT);
>       }
> +    if (s->long_mode) {
> +        xen_set_long_mode(true);
> +    }
>   
>       return 0;
>   }
> @@ -121,9 +137,11 @@ static const VMStateDescription xen_overlay_vmstate = {
>       .version_id = 1,
>       .minimum_version_id = 1,
>       .needed = xen_overlay_is_needed,
> +    .pre_save = xen_overlay_pre_save,
>       .post_load = xen_overlay_post_load,
>       .fields = (VMStateField[]) {
>           VMSTATE_UINT64(shinfo_gpa, XenOverlayState),
> +        VMSTATE_BOOL(long_mode, XenOverlayState),
>           VMSTATE_END_OF_LIST()
>       }
>   };
> @@ -198,3 +216,50 @@ void *xen_overlay_get_shinfo_ptr(void)
>   
>       return s->shinfo_ptr;
>   }
> +
> +int xen_sync_long_mode(void)
> +{
> +    int ret;
> +    struct kvm_xen_hvm_attr xa = {
> +        .type = KVM_XEN_ATTR_TYPE_LONG_MODE,
> +    };
> +
> +    if (!xen_overlay_singleton) {
> +        return -ENOENT;
> +    }
> +
> +    ret = kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_GET_ATTR, &xa);
> +    if (!ret) {
> +        xen_overlay_singleton->long_mode = xa.u.long_mode;
> +    }
> +
> +    return ret;
> +}
> +
> +int xen_set_long_mode(bool long_mode)
> +{
> +    int ret;
> +    struct kvm_xen_hvm_attr xa = {
> +        .type = KVM_XEN_ATTR_TYPE_LONG_MODE,
> +        .u.long_mode = long_mode,
> +    };
> +
> +    if (!xen_overlay_singleton) {
> +        return -ENOENT;
> +    }
> +
> +    ret = kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_SET_ATTR, &xa);
> +    if (!ret) {
> +        xen_overlay_singleton->long_mode = xa.u.long_mode;
> +    }
> +
> +    return ret;
> +}
> +
> +bool xen_is_long_mode(void)
> +{
> +    if (xen_overlay_singleton) {
> +        return xen_overlay_singleton->long_mode;
> +    }
> +    return false;

return xen_overlay_singleton && xen_overlay_singleton->long_mode;

perhaps?

> +}
> diff --git a/hw/i386/kvm/xen_overlay.h b/hw/i386/kvm/xen_overlay.h
> index 00cff05bb0..5c46a0b036 100644
> --- a/hw/i386/kvm/xen_overlay.h
> +++ b/hw/i386/kvm/xen_overlay.h
> @@ -17,4 +17,8 @@ void xen_overlay_create(void);
>   int xen_overlay_map_shinfo_page(uint64_t gpa);
>   void *xen_overlay_get_shinfo_ptr(void);
>   
> +int xen_sync_long_mode(void);
> +int xen_set_long_mode(bool long_mode);
> +bool xen_is_long_mode(void);
> +
>   #endif /* QEMU_XEN_OVERLAY_H */
> diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
> index 80005ea527..80f09f33df 100644
> --- a/target/i386/kvm/xen-emu.c
> +++ b/target/i386/kvm/xen-emu.c
> @@ -19,6 +19,8 @@
>   #include "trace.h"
>   #include "sysemu/runstate.h"
>   
> +#include "hw/i386/kvm/xen_overlay.h"
> +
>   #include "standard-headers/xen/version.h"
>   #include "standard-headers/xen/sched.h"
>   
> @@ -274,6 +276,16 @@ int kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
>           return -1;
>       }
>   
> +    /*
> +     * The kernel latches the guest 32/64 mode when the MSR is used to fill
> +     * the hypercall page. So if we see a hypercall in a mode that doesn't
> +     * match our own idea of the guest mode, fetch the kernel's idea of the
> +     * "long mode" to remain in sync.
> +     */
> +    if (exit->u.hcall.longmode != xen_is_long_mode()) {
> +        xen_sync_long_mode();
> +    }
> +
>       if (!do_kvm_xen_handle_exit(cpu, exit)) {
>           /*
>            * Some hypercalls will be deliberately "implemented" by returning


