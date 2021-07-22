Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1293D2B8F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 19:56:46 +0200 (CEST)
Received: from localhost ([::1]:38976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6cw9-0005wq-Lr
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 13:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m6ctk-0001Mq-7e
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:54:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m6cti-00032d-2K
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:54:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626976453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NBK5ZbfLr2xOMEjTMg8AY+rGI1FLEY7KEe1dQPGLHug=;
 b=i51OtlkwtHqidUK3fA9f1yOVaLZVEWyzLHf0AnsR/GsjYeH85GIeZYXkbuLyql6ctz8Pz8
 vKdgMHq0RwZVQUUrx4Q59gIOsM5zDYISfw5VFo2Qw6WscFS1Pbhyvcy17sLKYdWp8B/6pg
 kygu7R2BXBzBiCiEpmq9ZCC/h886NP0=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-Wy61dp8bPbObUeQsTNBWDw-1; Thu, 22 Jul 2021 13:54:12 -0400
X-MC-Unique: Wy61dp8bPbObUeQsTNBWDw-1
Received: by mail-ot1-f71.google.com with SMTP id
 t4-20020a9d77440000b02904bbc3b57656so4175214otl.9
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:54:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NBK5ZbfLr2xOMEjTMg8AY+rGI1FLEY7KEe1dQPGLHug=;
 b=trR99Tk37qd3UF6S710eX5+qoW4awL1z1F1RH48yJavPEVwL5pHPBDV0K7UqXwgSdP
 MsxKQ+sw+OfztmqsHnNMyJG+5miM5472dlK2N3LQN47+HjvswFLu7LwENKlnNMmOvkoN
 OY3UKqpTCG9N3AIGmwcTAVFuP638Z/KJODNX3Tbcw53FxurzMPJSNI3BHRE+zYWoj+eT
 69j0S+d9PrYg4eHYecUANhc6es83P+CWaHnStMYYJnfY7Xt4ulduPjUA9ENEZfEPROAG
 +pWTrHEr92nLPNMpykae+VFuquJapyq+mdI0aMFoz5uUlh2pELW0k/zUU+HDlhFX1jCA
 oQkQ==
X-Gm-Message-State: AOAM5338ISkP0J2bHefTFcRIw5u8U+r1JSCGG9iN2UiEZle50IfEXOUb
 q7jMf9sNZxQ4//TukE5IpoBtm4Bu+HbKT2aj4pC8YBSdnvwtcBYnZjbjvbXMhFF5vm2MXyWr/hP
 t42FPMOJLuu8nCts=
X-Received: by 2002:aca:7589:: with SMTP id q131mr6290239oic.76.1626976451780; 
 Thu, 22 Jul 2021 10:54:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWs4lbf5DnGa7JMnK2l64tfYQl0ksZqISWX93BlHjCEaqgHFm5i1Srl4kN8yR6jo7Dk0/VNg==
X-Received: by 2002:aca:7589:: with SMTP id q131mr6290236oic.76.1626976451658; 
 Thu, 22 Jul 2021 10:54:11 -0700 (PDT)
Received: from [192.168.0.173] (ip68-102-25-176.ks.ok.cox.net. [68.102.25.176])
 by smtp.gmail.com with ESMTPSA id g1sm5270450otk.21.2021.07.22.10.54.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 10:54:11 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [RFC PATCH v2 34/44] target/i386/tdx: set reboot action to
 shutdown when tdx
To: isaku.yamahata@gmail.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 alistair@alistair23.me, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, cohuck@redhat.com, mtosatti@redhat.com,
 xiaoyao.li@intel.com, seanjc@google.com, erdemaktas@google.com
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <d1afced8a92c01367d0aed7c6f82659c9bf79956.1625704981.git.isaku.yamahata@intel.com>
Message-ID: <0ccf5a5c-2322-eae3-bd4b-9e72e2f4bbd1@redhat.com>
Date: Thu, 22 Jul 2021 12:54:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d1afced8a92c01367d0aed7c6f82659c9bf79956.1625704981.git.isaku.yamahata@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/21 7:55 PM, isaku.yamahata@gmail.com wrote:
> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> In TDX CPU state is also protected, thus vcpu state can't be reset by VMM.
> It assumes -action reboot=shutdown instead of silently ignoring vcpu reset.
> 
> TDX module spec version 344425-002US doesn't support vcpu reset by VMM.  VM
> needs to be destroyed and created again to emulate REBOOT_ACTION_RESET.
> For simplicity, put its responsibility to management system like libvirt
> because it's difficult for the current qemu implementation to destroy and
> re-create KVM VM resources with keeping other resources.
> 
> If management system wants reboot behavior for its users, it needs to
>   - set reboot_action to REBOOT_ACTION_SHUTDOWN,
>   - set shutdown_action to SHUTDOWN_ACTION_PAUSE optionally and,
>   - subscribe VM state change and on reboot, (destroy qemu if
>     SHUTDOWN_ACTION_PAUSE and) start new qemu.
> 
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> ---
>   target/i386/kvm/tdx.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
> index 1316d95209..0621317b0a 100644
> --- a/target/i386/kvm/tdx.c
> +++ b/target/i386/kvm/tdx.c
> @@ -25,6 +25,7 @@
>   #include "qapi/qapi-types-misc-target.h"
>   #include "standard-headers/asm-x86/kvm_para.h"
>   #include "sysemu/sysemu.h"
> +#include "sysemu/runstate-action.h"
>   #include "sysemu/kvm.h"
>   #include "sysemu/kvm_int.h"
>   #include "sysemu/tdx.h"
> @@ -363,6 +364,19 @@ static void tdx_guest_init(Object *obj)
>   
>       qemu_mutex_init(&tdx->lock);
>   
> +    /*
> +     * TDX module spec version 344425-002US doesn't support reset of vcpu by
> +     * VMM.  VM needs to be destroyed and created again to emulate
> +     * REBOOT_ACTION_RESET.  For simplicity, put its responsibility to
> +     * management system like libvirt.
> +     *
> +     * Management system should
> +     *  - set reboot_action to REBOOT_ACTION_SHUTDOWN
> +     *  - set shutdown_action to SHUTDOWN_ACTION_PAUSE
> +     *  - subscribe VM state and on reboot, destroy qemu and start new qemu
> +     */
> +    reboot_action = REBOOT_ACTION_SHUTDOWN;
> +
>       tdx->debug = false;
>       object_property_add_bool(obj, "debug", tdx_guest_get_debug,
>                                tdx_guest_set_debug);
> 

I think the same effect could be accomplished with modifying
kvm_arch_cpu_check_are_resettable.


