Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 670C960F20A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 10:16:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ony2o-0004Ym-6a; Thu, 27 Oct 2022 04:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ony2i-0004Si-2F
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 04:15:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ony2e-0003ek-JX
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 04:15:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666858507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QjPY9+4I5DHjVi/Y4rzSS+KVMTBTql04AcJyqsjIKhc=;
 b=ZbVmCGDtqSyhlnaH5GMIYbK1G2UvIqJ8UTrex8+gQJkiUifiELwkE3HgA4ex2/4ml0p2Xz
 spsexwRQJtsLdYAkcSRm6ys7UnFbRIDSn8dhqJdZoMPzOyLRLZqZhbBiKgK8hTUZT0mODg
 ut3AF5wrbLHEwut3sProUNa6596BFYI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590-Uq9aKT7IMzuDmpdqLIC-rg-1; Thu, 27 Oct 2022 04:14:55 -0400
X-MC-Unique: Uq9aKT7IMzuDmpdqLIC-rg-1
Received: by mail-wm1-f70.google.com with SMTP id
 d13-20020a05600c34cd00b003ce1f62ac5aso2438439wmq.4
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 01:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QjPY9+4I5DHjVi/Y4rzSS+KVMTBTql04AcJyqsjIKhc=;
 b=xW3Tk6SW2uZkDmLhAiV3tDF01lRUtbmt3M6eNbz8XRBcl5os3lqcMm1VdZmbD1QSWj
 vIFcOWiiqRuEyd/x30aN29n1IgZGyhGwSpKEtMjhBsrInt2Ol4OnVoY9gczq4pw7lzvX
 c78TLtsSY0JcrlCwCVdRrSLhfeZ+q1+gw01cA31qyZTzPu9OkxDTLEnqX6AiN9h4gfav
 Gp5jUJtZESCRALyu9DKEwQd7dt4W6+q3Zf8aQKQ1q3Y1gayX9Suxnh31GOXvylv3WxAg
 9y/yLzaOeP2TCOg/8q2h+y5c/wqBtZv5SxX+9+TCzMo8qx9qfm79y+cggiVpZCXNzrBV
 G6hg==
X-Gm-Message-State: ACrzQf1eqE8MXqiGYHr1wO/SQPahd6fILozdinuD8/zCzPJt4wONaibi
 VsRfZ2bE8q6SHnR9EHsMdxMInaOdoZq0Ll7dDuakvP1EmqaZUFG9oOGGvv0Odd8nMd2ZZAW42ss
 Wk7Vkcvm2F3CwDmc=
X-Received: by 2002:adf:e491:0:b0:236:5270:7f5e with SMTP id
 i17-20020adfe491000000b0023652707f5emr21168708wrm.600.1666858493987; 
 Thu, 27 Oct 2022 01:14:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7IS9b7XmiKiAdINdp/ix1KQsBwFRndZI/5hqy5WjLYQxpP2j1yn9Od/dgibZX8QTwDaUps5g==
X-Received: by 2002:adf:e491:0:b0:236:5270:7f5e with SMTP id
 i17-20020adfe491000000b0023652707f5emr21168694wrm.600.1666858493766; 
 Thu, 27 Oct 2022 01:14:53 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-195.web.vodafone.de.
 [109.43.176.195]) by smtp.gmail.com with ESMTPSA id
 l16-20020a5d4110000000b002365cd93d05sm464583wrp.102.2022.10.27.01.14.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 01:14:53 -0700 (PDT)
Message-ID: <450544bf-4ff0-9d72-f57c-4274692916a5@redhat.com>
Date: Thu, 27 Oct 2022 10:14:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v10 3/9] s390x/cpu_topology: resetting the
 Topology-Change-Report
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20221012162107.91734-1-pmorel@linux.ibm.com>
 <20221012162107.91734-4-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221012162107.91734-4-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/10/2022 18.21, Pierre Morel wrote:
> During a subsystem reset the Topology-Change-Report is cleared
> by the machine.
> Let's ask KVM to clear the Modified Topology Change Report (MTCR)
>   bit of the SCA in the case of a subsystem reset.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> Reviewed-by: Nico Boehr <nrb@linux.ibm.com>
> Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
> ---
>   target/s390x/cpu.h           |  1 +
>   target/s390x/kvm/kvm_s390x.h |  1 +
>   hw/s390x/cpu-topology.c      | 12 ++++++++++++
>   hw/s390x/s390-virtio-ccw.c   |  1 +
>   target/s390x/cpu-sysemu.c    |  7 +++++++
>   target/s390x/kvm/kvm.c       | 23 +++++++++++++++++++++++
>   6 files changed, 45 insertions(+)
> 
> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index d604aa9c78..9b35795ac8 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -825,6 +825,7 @@ void s390_enable_css_support(S390CPU *cpu);
>   void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg);
>   int s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t sch_id,
>                                   int vq, bool assign);
> +void s390_cpu_topology_reset(void);
>   #ifndef CONFIG_USER_ONLY
>   unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu);
>   #else
> diff --git a/target/s390x/kvm/kvm_s390x.h b/target/s390x/kvm/kvm_s390x.h
> index aaae8570de..a13c8fb9a3 100644
> --- a/target/s390x/kvm/kvm_s390x.h
> +++ b/target/s390x/kvm/kvm_s390x.h
> @@ -46,5 +46,6 @@ void kvm_s390_crypto_reset(void);
>   void kvm_s390_restart_interrupt(S390CPU *cpu);
>   void kvm_s390_stop_interrupt(S390CPU *cpu);
>   void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info);
> +int kvm_s390_topology_set_mtcr(uint64_t attr);
>   
>   #endif /* KVM_S390X_H */
> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
> index c73cebfe6f..9f202621d0 100644
> --- a/hw/s390x/cpu-topology.c
> +++ b/hw/s390x/cpu-topology.c
> @@ -107,6 +107,17 @@ static void s390_topology_realize(DeviceState *dev, Error **errp)
>       qemu_mutex_init(&topo->topo_mutex);
>   }
>   
> +/**
> + * s390_topology_reset:
> + * @dev: the device
> + *
> + * Calls the sysemu topology reset
> + */
> +static void s390_topology_reset(DeviceState *dev)
> +{
> +    s390_cpu_topology_reset();
> +}
> +
>   /**
>    * topology_class_init:
>    * @oc: Object class
> @@ -120,6 +131,7 @@ static void topology_class_init(ObjectClass *oc, void *data)
>   
>       dc->realize = s390_topology_realize;
>       set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +    dc->reset = s390_topology_reset;
>   }
>   
>   static const TypeInfo cpu_topology_info = {
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index aa99a62e42..362378454a 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -113,6 +113,7 @@ static const char *const reset_dev_types[] = {
>       "s390-flic",
>       "diag288",
>       TYPE_S390_PCI_HOST_BRIDGE,
> +    TYPE_S390_CPU_TOPOLOGY,
>   };
>   
>   static void subsystem_reset(void)
> diff --git a/target/s390x/cpu-sysemu.c b/target/s390x/cpu-sysemu.c
> index 948e4bd3e0..707c0b658c 100644
> --- a/target/s390x/cpu-sysemu.c
> +++ b/target/s390x/cpu-sysemu.c
> @@ -306,3 +306,10 @@ void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg)
>           kvm_s390_set_diag318(cs, arg.host_ulong);
>       }
>   }
> +
> +void s390_cpu_topology_reset(void)
> +{
> +    if (kvm_enabled()) {
> +        kvm_s390_topology_set_mtcr(0);
> +    }
> +}
> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
> index f96630440b..9c994d27d5 100644
> --- a/target/s390x/kvm/kvm.c
> +++ b/target/s390x/kvm/kvm.c
> @@ -2585,3 +2585,26 @@ int kvm_s390_get_zpci_op(void)
>   {
>       return cap_zpci_op;
>   }
> +
> +int kvm_s390_topology_set_mtcr(uint64_t attr)
> +{
> +    struct kvm_device_attr attribute = {
> +        .group = KVM_S390_VM_CPU_TOPOLOGY,
> +        .attr  = attr,
> +    };
> +    int ret;
> +
> +    if (!s390_has_feat(S390_FEAT_CONFIGURATION_TOPOLOGY)) {
> +        return -EFAULT;

EFAULT is something that indicates a bad address (e.g. a segmentation fault) 
... so this definitely sounds like a bad choice for an error code here.

  Thomas



