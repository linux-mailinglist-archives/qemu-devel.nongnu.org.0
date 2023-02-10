Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4A569204A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 14:56:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQTsK-00088h-3w; Fri, 10 Feb 2023 08:55:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQTsF-00085T-AC
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:55:36 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQTsD-0002Ze-Gg
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:55:35 -0500
Received: by mail-wr1-x435.google.com with SMTP id j25so5150268wrc.4
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 05:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N0xhF6dFKQqLtF7woeaF+6exWTYueOUlXyKzkt26V4o=;
 b=ImKbD0oT3jHRB2ElG42FKbxWpKkdpsqiyR6Mp5UJRx581ze7qd6EVVsmILkZUcRG/0
 3Ee0iAbrlVo2JeJa6owzdIDDPOt8CpSaonsHCjizh1oukxQWvIJj2FIW6iTeYAgxif/k
 9PzTaxYSxMWaLtd19dSZFTKrGP+ibzVrfC519fcQ/VgUxu7G0bU7pYww5kuoTLCK8aco
 0KmqrkgBlHHbGGLaWPvQE//mUIhsfgfAqaoqonYSzwusrfjDY1U9KRr8NZ/nbJg0M9ZH
 lrKgMesUXUqU+lte6/peygVxFTm18vC1TSpkG8+wX82XaDy3H+8j/3fnYc0Pa9Px9emq
 JJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N0xhF6dFKQqLtF7woeaF+6exWTYueOUlXyKzkt26V4o=;
 b=zZSDX7RP6N1ZxCru1vw2nptT36effK+wRL9zaBrJuHMHLC5bdU/Ligz9n3D7zuU1RQ
 Q/zh9iaAs7DGjLdDT4lbpFYvWL1OPxLxQnvUG+QyGhkUNxszXdWLGeFIRI2tnRWn5VPa
 C4yb2WhCQK0B1+WiaztbpdqsTb7PWlKwpzx5d/uvSK2do9b3v1dm+xUEoolv8rLnUs2H
 ebdvpmVKDjS78y84Vh65pN8eJ3QMEncRmFvYf/M+M1N7plSJXr9u+jE/QXeP8vW/vvWs
 9Vtx5qDnU2aYFovaVoqg6siSd44+zLpZ6zelS3PA4FmAxCWJ4tIrATS/s8Eei93Mal1u
 hagg==
X-Gm-Message-State: AO0yUKVACua2R4UxyZx/twatJ6SMj3Lmi/kKQ4VSnApEeFEJhw03O+Tu
 a4IAzgVW6X55YnRi337mDUo=
X-Google-Smtp-Source: AK7set8R8bFuWhDSMN83NfCeu/lh9jPsMM5JdDoH38Mfg+3OvaFxjeEqN5awKdZkb3QbN2URsLloQQ==
X-Received: by 2002:a5d:60d0:0:b0:2bd:ee0c:26a3 with SMTP id
 x16-20020a5d60d0000000b002bdee0c26a3mr13668711wrt.8.1676037332053; 
 Fri, 10 Feb 2023 05:55:32 -0800 (PST)
Received: from [192.168.15.58] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c2cd300b003dfefe115b9sm5822136wmc.0.2023.02.10.05.55.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 05:55:31 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <165620ad-7a99-8287-d5fa-0fd2d4b4aa6f@xen.org>
Date: Fri, 10 Feb 2023 13:55:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 33/59] hw/xen: Implement EVTCHNOP_bind_ipi
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
 <20230201143148.1744093-34-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-34-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c  | 69 +++++++++++++++++++++++++++++++++++++++
>   hw/i386/kvm/xen_evtchn.h  |  2 ++
>   target/i386/kvm/xen-emu.c | 15 +++++++++
>   3 files changed, 86 insertions(+)
> 
> diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
> index da2f5711dd..d8527483b9 100644
> --- a/hw/i386/kvm/xen_evtchn.c
> +++ b/hw/i386/kvm/xen_evtchn.c
> @@ -13,6 +13,7 @@
>   #include "qemu/host-utils.h"
>   #include "qemu/module.h"
>   #include "qemu/main-loop.h"
> +#include "qemu/log.h"
>   #include "qapi/error.h"
>   #include "qom/object.h"
>   #include "exec/target_page.h"
> @@ -231,6 +232,43 @@ static void inject_callback(XenEvtchnState *s, uint32_t vcpu)
>       kvm_xen_inject_vcpu_callback_vector(vcpu, type);
>   }
>   
> +static void deassign_kernel_port(evtchn_port_t port)
> +{
> +    struct kvm_xen_hvm_attr ha;
> +    int ret;
> +
> +    ha.type = KVM_XEN_ATTR_TYPE_EVTCHN;
> +    ha.u.evtchn.send_port = port;
> +    ha.u.evtchn.flags = KVM_XEN_EVTCHN_DEASSIGN;
> +
> +    ret = kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_SET_ATTR, &ha);
> +    if (ret) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "Failed to unbind kernel port %d: %s\n",
> +                      port, strerror(ret));
> +    }
> +}
> +
> +static int assign_kernel_port(uint16_t type, evtchn_port_t port,
> +                              uint32_t vcpu_id)
> +{
> +    CPUState *cpu = qemu_get_cpu(vcpu_id);
> +    struct kvm_xen_hvm_attr ha;
> +
> +    if (!cpu) {
> +        return -ENOENT;
> +    }
> +
> +    ha.type = KVM_XEN_ATTR_TYPE_EVTCHN;
> +    ha.u.evtchn.send_port = port;
> +    ha.u.evtchn.type = type;
> +    ha.u.evtchn.flags = 0;
> +    ha.u.evtchn.deliver.port.port = port;
> +    ha.u.evtchn.deliver.port.vcpu = kvm_arch_vcpu_id(cpu);
> +    ha.u.evtchn.deliver.port.priority = KVM_IRQ_ROUTING_XEN_EVTCHN_PRIO_2LEVEL;
> +
> +    return kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_SET_ATTR, &ha);
> +}
> +
>   static bool valid_port(evtchn_port_t port)
>   {
>       if (!port) {
> @@ -549,6 +587,12 @@ static int close_port(XenEvtchnState *s, evtchn_port_t port)
>                                 p->type_val, 0);
>           break;
>   
> +    case EVTCHNSTAT_ipi:
> +        if (s->evtchn_in_kernel) {
> +            deassign_kernel_port(port);
> +        }
> +        break;
> +
>       default:
>           break;
>       }
> @@ -638,3 +682,28 @@ int xen_evtchn_bind_virq_op(struct evtchn_bind_virq *virq)
>   
>       return ret;
>   }
> +
> +int xen_evtchn_bind_ipi_op(struct evtchn_bind_ipi *ipi)
> +{
> +    XenEvtchnState *s = xen_evtchn_singleton;
> +    int ret;
> +
> +    if (!s) {
> +        return -ENOTSUP;
> +    }
> +
> +    if (!valid_vcpu(ipi->vcpu)) {
> +        return -ENOENT;
> +    }
> +
> +    qemu_mutex_lock(&s->port_lock);
> +
> +    ret = allocate_port(s, ipi->vcpu, EVTCHNSTAT_ipi, 0, &ipi->port);
> +    if (!ret && s->evtchn_in_kernel) {
> +        assign_kernel_port(EVTCHNSTAT_ipi, ipi->port, ipi->vcpu);

Should the error not be propagated here?

   Paul

> +    }
> +
> +    qemu_mutex_unlock(&s->port_lock);
> +
> +    return ret;
> +}
> diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
> index 0ea13dda3a..107f420848 100644
> --- a/hw/i386/kvm/xen_evtchn.h
> +++ b/hw/i386/kvm/xen_evtchn.h
> @@ -19,9 +19,11 @@ struct evtchn_status;
>   struct evtchn_close;
>   struct evtchn_unmask;
>   struct evtchn_bind_virq;
> +struct evtchn_bind_ipi;
>   int xen_evtchn_status_op(struct evtchn_status *status);
>   int xen_evtchn_close_op(struct evtchn_close *close);
>   int xen_evtchn_unmask_op(struct evtchn_unmask *unmask);
>   int xen_evtchn_bind_virq_op(struct evtchn_bind_virq *virq);
> +int xen_evtchn_bind_ipi_op(struct evtchn_bind_ipi *ipi);
>   
>   #endif /* QEMU_XEN_EVTCHN_H */
> diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
> index 0c4988ad63..4a20ccdf78 100644
> --- a/target/i386/kvm/xen-emu.c
> +++ b/target/i386/kvm/xen-emu.c
> @@ -891,6 +891,21 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
>           }
>           break;
>       }
> +    case EVTCHNOP_bind_ipi: {
> +        struct evtchn_bind_ipi ipi;
> +
> +        qemu_build_assert(sizeof(ipi) == 8);
> +        if (kvm_copy_from_gva(cs, arg, &ipi, sizeof(ipi))) {
> +            err = -EFAULT;
> +            break;
> +        }
> +
> +        err = xen_evtchn_bind_ipi_op(&ipi);
> +        if (!err && kvm_copy_to_gva(cs, arg, &ipi, sizeof(ipi))) {
> +            err = -EFAULT;
> +        }
> +        break;
> +    }
>       default:
>           return false;
>       }


