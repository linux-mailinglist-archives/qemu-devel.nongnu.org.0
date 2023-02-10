Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECEE692093
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 15:13:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQU9S-0000I5-DF; Fri, 10 Feb 2023 09:13:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQU9Q-0000Hp-Lv
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:13:20 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQU9O-0005qo-HL
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:13:20 -0500
Received: by mail-wr1-x433.google.com with SMTP id co8so1450014wrb.1
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 06:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vyqv3n5VAQyCByn77+Gl8r6UPKeuA4IEsWTZ4PPephk=;
 b=QTeMsHYgrVXYg+UmT3HauNpWNGIchQ07y9wPlEf1yyRpurpwG+Qqc35YscACiyY6BW
 U70dNt+KAVk8xS6gRb4ipxQqviiQbdIwMIKyD8PfxEwjR1KUw4DvMGbQhj3Hg9XfC3HH
 hrnRmffQTDOgPIyEpHzwddvMJK+GOf2cmiIQhtq0kEjjMs+CncQz0uKS0gnsOFal/1MP
 HX3mxlMSsnqz0ONP1IVgwp+W/vfZqQV13n1mQA7FiBHY46bBp5J02YdyVH2C/xGfRy+Q
 ys/c0igvoDW/yT/SUFG3fi03o0Ie7ll7LJNmRxbeB2BvegcrrOHUblH+I64QMSgao2cH
 Pf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vyqv3n5VAQyCByn77+Gl8r6UPKeuA4IEsWTZ4PPephk=;
 b=bVNcZ7OZeLSC+wZCP28UXArzoLGw0wKfJiMqqQx5flnKx7fQWyxf5YPFxhtRz+yrWv
 7En7yI0D0e/cP2mhweuRLud240PQD+4c2wc+CaMNH/kzo9VebTjdzxRMRVVEEW/rifNC
 GrwSsOPRSD0cxNogQk3W0mXzaIZsiGeeXRf5TB65PkigpUbcw+NLWf9eXiroI9tBVbbR
 c2XonnjDE9Hm50voMXdUOwDkfd7rxe1n0+k5HjigbQHP5wEvbFTlrp5rRQbViVhpHOHB
 Iu8JUNeqLbjmzIUQurJQ3byrf7LCigEStnx2l7lufpbctr1x4WZEb6RagAgyTUZYQrEf
 SRzQ==
X-Gm-Message-State: AO0yUKU+jv47Sw8a1391qHcL9igNr5Yq52ozlkArtq61Axm0IYkXH/lk
 X/FFsNQoYqS1Mk7aD2OP6P0=
X-Google-Smtp-Source: AK7set/a/CUcm4Fip96cjlzzhti0B5cdKNyZ+YqkLjXUaFUiOb1IHyJBTvYYVC+mM+vUjB588qaI/w==
X-Received: by 2002:adf:e7ca:0:b0:2c5:4b22:bce9 with SMTP id
 e10-20020adfe7ca000000b002c54b22bce9mr1636823wrn.47.1676038391473; 
 Fri, 10 Feb 2023 06:13:11 -0800 (PST)
Received: from [192.168.15.58] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a5d4041000000b002c546d169ddsm2205150wrp.11.2023.02.10.06.13.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 06:13:11 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <9c20c26e-8c7c-8ad2-a339-a30fc98c0ada@xen.org>
Date: Fri, 10 Feb 2023 14:13:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 35/59] hw/xen: Implement EVTCHNOP_alloc_unbound
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
 <20230201143148.1744093-36-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-36-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x433.google.com
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
>   hw/i386/kvm/xen_evtchn.c  | 32 ++++++++++++++++++++++++++++++++
>   hw/i386/kvm/xen_evtchn.h  |  2 ++
>   target/i386/kvm/xen-emu.c | 15 +++++++++++++++
>   3 files changed, 49 insertions(+)
> 
> diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
> index a97d6ba61d..9dc5a98d94 100644
> --- a/hw/i386/kvm/xen_evtchn.c
> +++ b/hw/i386/kvm/xen_evtchn.c
> @@ -835,6 +835,38 @@ int xen_evtchn_bind_ipi_op(struct evtchn_bind_ipi *ipi)
>       return ret;
>   }
>   
> +int xen_evtchn_alloc_unbound_op(struct evtchn_alloc_unbound *alloc)
> +{
> +    XenEvtchnState *s = xen_evtchn_singleton;
> +    uint16_t type_val;
> +    int ret;
> +
> +    if (!s) {
> +        return -ENOTSUP;
> +    }
> +
> +    if (alloc->dom != DOMID_SELF && alloc->dom != xen_domid) {
> +        return -ESRCH;
> +    }
> +
> +    if (alloc->remote_dom == DOMID_QEMU) {
> +        type_val = PORT_INFO_TYPEVAL_REMOTE_QEMU;
> +    } else if (alloc->remote_dom == DOMID_SELF ||
> +               alloc->remote_dom == xen_domid) {
> +        type_val = 0;
> +    } else {
> +        return -EPERM;
> +    }
> +
> +    qemu_mutex_lock(&s->port_lock);
> +
> +    ret = allocate_port(s, 0, EVTCHNSTAT_unbound, type_val, &alloc->port);
> +
> +    qemu_mutex_unlock(&s->port_lock);
> +
> +    return ret;
> +}
> +
>   int xen_evtchn_send_op(struct evtchn_send *send)
>   {
>       XenEvtchnState *s = xen_evtchn_singleton;
> diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
> index 500fdbe8b8..fc080138e3 100644
> --- a/hw/i386/kvm/xen_evtchn.h
> +++ b/hw/i386/kvm/xen_evtchn.h
> @@ -21,11 +21,13 @@ struct evtchn_unmask;
>   struct evtchn_bind_virq;
>   struct evtchn_bind_ipi;
>   struct evtchn_send;
> +struct evtchn_alloc_unbound;
>   int xen_evtchn_status_op(struct evtchn_status *status);
>   int xen_evtchn_close_op(struct evtchn_close *close);
>   int xen_evtchn_unmask_op(struct evtchn_unmask *unmask);
>   int xen_evtchn_bind_virq_op(struct evtchn_bind_virq *virq);
>   int xen_evtchn_bind_ipi_op(struct evtchn_bind_ipi *ipi);
>   int xen_evtchn_send_op(struct evtchn_send *send);
> +int xen_evtchn_alloc_unbound_op(struct evtchn_alloc_unbound *alloc);
>   
>   #endif /* QEMU_XEN_EVTCHN_H */
> diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
> index 5299614d3c..e186dec9a9 100644
> --- a/target/i386/kvm/xen-emu.c
> +++ b/target/i386/kvm/xen-emu.c
> @@ -918,6 +918,21 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
>           err = xen_evtchn_send_op(&send);
>           break;
>       }
> +    case EVTCHNOP_alloc_unbound: {
> +        struct evtchn_alloc_unbound alloc;
> +
> +        qemu_build_assert(sizeof(alloc) == 8);

Why?

   Paul

> +        if (kvm_copy_from_gva(cs, arg, &alloc, sizeof(alloc))) {
> +            err = -EFAULT;
> +            break;
> +        }
> +
> +        err = xen_evtchn_alloc_unbound_op(&alloc);
> +        if (!err && kvm_copy_to_gva(cs, arg, &alloc, sizeof(alloc))) {
> +            err = -EFAULT;
> +        }
> +        break;
> +    }
>       default:
>           return false;
>       }


