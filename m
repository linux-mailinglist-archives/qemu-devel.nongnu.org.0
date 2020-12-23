Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE7A2E1A37
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 09:57:12 +0100 (CET)
Received: from localhost ([::1]:33082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krzxG-0001Ib-SL
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 03:57:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1krzwK-0000m9-Sv
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 03:56:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1krzwF-0004NF-Fr
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 03:56:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608713765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YDhJ2ytTBcsqqtoAKeQE/fnroSxxMTsieyKyV1vACIk=;
 b=eo8kyJHg+EZN5xmabGB1kBUiCvgnfwGBO6OZqYyAIraapxbinrf9M76z9z5RJLdBAvaxkz
 dmb1NMjxfAOoTrygzZgrkCQqx58+fLS9N4ockJF6wciPb0BxNm4K1Z/gSmxLlI/T/R0GIJ
 xEvdIrdlt1J4dh0oxcARvVstkK/SqhE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-r-ARvPdRNKCWakbSzbGSKw-1; Wed, 23 Dec 2020 03:56:01 -0500
X-MC-Unique: r-ARvPdRNKCWakbSzbGSKw-1
Received: by mail-wr1-f70.google.com with SMTP id 88so12212409wrc.17
 for <qemu-devel@nongnu.org>; Wed, 23 Dec 2020 00:56:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YDhJ2ytTBcsqqtoAKeQE/fnroSxxMTsieyKyV1vACIk=;
 b=dwZTkXF2zpW2srvK9OMsdDOP2sfiRnrXRnZ8glSk+Wm+XlrTynULD3MHfW3IGvO3ka
 1nOo2YJWurqJcpbkMgYpwsjusdFRFNecm0S1z9Qch5eTVmHMbDcjOijDgtQ4RxKVcT3m
 bBP/WUwYi87n6OCPG78p0/IwxP6T2b/k8ck0nzCJVrByr8apQhgLbo4NwyqdylRd7bdJ
 ONTGLPDq8WvZ8z//MYoCPAFdk1YBshKNmUA1X46txTQT2wR7q9JAI+lbkFt0oWiW+u3a
 iE5sBKNI0FVDb/mKG6wraw/DLvjGoPLq0G03gVpR1vVYelnEDIKQMdQ6WI9qCYGLmaXj
 93Ww==
X-Gm-Message-State: AOAM5313lssmt/qiV0h7NSU58rKK2ewZMkbkLh4Mv9Xu4heLi9/8AbZ4
 KHuhcI+ysvYrM4nX2+MNkjzAo19GCQTPuLsKeAwhl1Y/wibRQPJ8WZwxfbDb2GSQdZy2MvZ3IUv
 2GGShsf2mNpGvyz0=
X-Received: by 2002:adf:ab56:: with SMTP id r22mr16934823wrc.351.1608713760578; 
 Wed, 23 Dec 2020 00:56:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwe0bDgq29Zu7Q1TrDILoxQM68K0pabT3MlIaIBv+nXOp9UiKCCoP63ONZtN/9gdyQzNONKhg==
X-Received: by 2002:adf:ab56:: with SMTP id r22mr16934801wrc.351.1608713760242; 
 Wed, 23 Dec 2020 00:56:00 -0800 (PST)
Received: from [192.168.1.124] ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id h29sm37460587wrc.68.2020.12.23.00.55.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Dec 2020 00:55:59 -0800 (PST)
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <160871104474.106117.16441172468969132477.stgit@bahia.lan>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] ppc: Fix build with --without-default-devices
Message-ID: <7bafab63-659d-a8e9-a2d1-36483b226bf0@redhat.com>
Date: Wed, 23 Dec 2020 09:55:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <160871104474.106117.16441172468969132477.stgit@bahia.lan>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.521,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/12/20 09:10, Greg Kurz wrote:
> Linking of the qemu-system-ppc64 fails on a POWER9 host when
> --without-default-devices is passed to configure:
> 
> $ ./configure --without-default-devices \
>                --target-list=ppc64-softmmu && make
> 
> ...
> 
> libqemu-ppc64-softmmu.fa.p/hw_ppc_e500.c.o: In function `ppce500_init_mpic_kvm':
> /home/greg/Work/qemu/qemu-ppc/build/../hw/ppc/e500.c:777: undefined reference to `kvm_openpic_connect_vcpu'
> libqemu-ppc64-softmmu.fa.p/hw_ppc_spapr_irq.c.o: In function `spapr_irq_check':
> /home/greg/Work/qemu/qemu-ppc/build/../hw/ppc/spapr_irq.c:189: undefined reference to `xics_kvm_has_broken_disconnect'
> libqemu-ppc64-softmmu.fa.p/hw_intc_spapr_xive.c.o: In function `spapr_xive_post_load':
> /home/greg/Work/qemu/qemu-ppc/build/../hw/intc/spapr_xive.c:530: undefined reference to `kvmppc_xive_post_load'
> 
> ... and tons of other symbols belonging to the KVM backend of the
> openpic, XICS and XIVE interrupt controllers.
> 
> It turns out that OPENPIC_KVM, XICS_KVM and XIVE_KVM are marked
> to depend on KVM but this has no effect when minikconf runs in
> allnoconfig mode. The correct way to express that some configuration
> A requires some other configuration B to be true is "A select B".
> 
> Have OPENPIC, XICS and XIVE to select their KVM counterpart if KVM
> is set. While here, fix POWERNV to select XIVE and XICS, just like
> PSERIES, and drop the now useless XIVE related config clauses from
> hw/ppc/Kconfig.
> 
> This went unnoticed so far because CI doesn't test the build with
> --without-default-devices and KVM enabled on a POWER host.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>

It is also possible to remove the *_KVM symbols and just use

     when: ['CONFIG_KVM', 'CONFIG_OPENPIC']
     when: ['CONFIG_XICS', 'CONFIG_OPENPIC']
     when: ['CONFIG_XIVE', 'CONFIG_OPENPIC']

in the meson.build files.  Which one is preferrable depends on personal 
taste, and I do not myself lean in one direction or the other---I 
mention it just in case _you_ find that one preferrable.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks!

Paolo

> ---
>   hw/intc/Kconfig |   18 +++++++++++++-----
>   hw/ppc/Kconfig  |   17 ++---------------
>   2 files changed, 15 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> index 468d548ca771..0a5c080c4f5c 100644
> --- a/hw/intc/Kconfig
> +++ b/hw/intc/Kconfig
> @@ -19,6 +19,7 @@ config ARM_GIC
>   config OPENPIC
>       bool
>       select MSI_NONBROKEN
> +    select OPENPIC_KVM if KVM
>   
>   config APIC
>       bool
> @@ -32,21 +33,28 @@ config ARM_GIC_KVM
>   
>   config OPENPIC_KVM
>       bool
> -    default y
> -    depends on OPENPIC && KVM
>   
>   config XICS
>       bool
> -    depends on POWERNV || PSERIES
> +    select XICS_KVM if KVM
>   
>   config XICS_SPAPR
>       bool
>       select XICS
>   
> +config XIVE
> +    bool
> +    select XIVE_KVM if KVM
> +
> +config XIVE_SPAPR
> +    bool
> +    select XIVE
> +
>   config XICS_KVM
>       bool
> -    default y
> -    depends on XICS && KVM
> +
> +config XIVE_KVM
> +    bool
>   
>   config ALLWINNER_A10_PIC
>       bool
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index 982d55f5875c..037d9332e994 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -31,6 +31,8 @@ config POWERNV
>       select FDT_PPC
>       select PCI_EXPRESS
>       select MSI_NONBROKEN
> +    select XIVE
> +    select XICS
>   
>   config PPC405
>       bool
> @@ -129,21 +131,6 @@ config VIRTEX
>       select XILINX_ETHLITE
>       select FDT_PPC
>   
> -config XIVE
> -    bool
> -    depends on POWERNV || PSERIES
> -
> -config XIVE_SPAPR
> -    bool
> -    default y
> -    depends on PSERIES
> -    select XIVE
> -
> -config XIVE_KVM
> -    bool
> -    default y
> -    depends on XIVE_SPAPR && KVM
> -
>   # Only used by 64-bit targets
>   config FW_CFG_PPC
>       bool
> 
> 


