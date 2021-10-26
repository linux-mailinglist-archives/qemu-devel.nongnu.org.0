Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B06143B423
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 16:29:59 +0200 (CEST)
Received: from localhost ([::1]:60828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfNSg-0003xc-Cc
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 10:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mfNBb-0006Re-9R
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 10:12:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mfNBX-0007wY-Ll
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 10:12:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635257532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nCWnXJK0w51Nct5FPDSC6WzktazVqg9xiXN40FFcXQ0=;
 b=IuVPgfBxLyMKbd9ULI9AnF4LcjB46+d4dPaF2rEpMcGGbRm2ZG+Wo2bLheSWI2llvhJnr3
 BWEFyPSmaZvq+kDNvQOpRi54jgPhdW/+tajwA/7KoIc6jRj/QVUQewnxNd1PRT7Xc5FP9a
 WpVtNs7IBgI1oDO+L67ULLX/Ryw7Qzk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-hgX51Q0IMzSHfDwq0b8Lgw-1; Tue, 26 Oct 2021 10:12:11 -0400
X-MC-Unique: hgX51Q0IMzSHfDwq0b8Lgw-1
Received: by mail-ed1-f72.google.com with SMTP id
 z20-20020a05640240d400b003dce046ab51so13119767edb.14
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 07:12:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nCWnXJK0w51Nct5FPDSC6WzktazVqg9xiXN40FFcXQ0=;
 b=UffJUxZ+0TdSfMg6pNyeJcMq/eq69JbbA589y1v1yJPgLmJchg3utP5ao6CmSry7Mp
 yqX2WFT77JxUhAkze1x2mqZ4AxK00sWrP8mQMuZagqO+yaC1NydUeuVfmucVWfAfjQ/t
 ykpnm/9vQHwD6m/Em1li7xn5aCQaMroMfMPZ0ROH3FnZgjCuSJk+lYAPu9vRmAipTpyg
 RkpTRF+WExTlZ5xLM2ap5Zn/dRmMLgkqt8fmOytPQVD/LGvqgKONB7ZutpdXtj5zTwK/
 u5KlLifIceceSmnhzjSilOVQpEyKFKNGmfDkf3sgGmGHavWgKW/ZM5LAt3CIbvrJy+VQ
 NJXw==
X-Gm-Message-State: AOAM530JnfVMujXHfZ3Dw4UpZrzxEwcf1RZ5vBGYskz+rLvQJlM4TXtA
 C/+c9sJ8Fv4LaDee/P2lWLXCTntj1KedYpbyA84b22s0UA1M9AyXhQIDiiFRJwud+NX5dN+c1Qe
 ZuyXswxiCS+LAJsE=
X-Received: by 2002:a17:906:7f8e:: with SMTP id
 f14mr30930724ejr.267.1635257529769; 
 Tue, 26 Oct 2021 07:12:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpmTW2kqZ35WWYDh65ndAWpifWPAMPOc5MA5DKdtaSZ3ZhbMp1Xm0+4g4CqPg7BHxEMVHBmA==
X-Received: by 2002:a17:906:7f8e:: with SMTP id
 f14mr30930691ejr.267.1635257529475; 
 Tue, 26 Oct 2021 07:12:09 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id y26sm3976934edv.88.2021.10.26.07.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 07:12:08 -0700 (PDT)
Date: Tue, 26 Oct 2021 16:12:07 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v3] i386: docs: Briefly describe KVM PV features
Message-ID: <20211026161207.03117a1e@redhat.com>
In-Reply-To: <20211004140445.624875-1-vkuznets@redhat.com>
References: <20211004140445.624875-1-vkuznets@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  4 Oct 2021 16:04:45 +0200
Vitaly Kuznetsov <vkuznets@redhat.com> wrote:

> KVM PV features don't seem to be documented anywhere, in particular, the
> fact that some of the features are enabled by default and some are not can
> only be figured out from the code.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
> Changes since "[PATCH v2 0/8] i386: Assorted KVM PV and Hyper-V feature
>  improvements" [Paolo Bonzini]:
> - Convert to 'rst' and move to docs/system/i386/kvm-pv.rst.
> - Add information about the version of Linux that introduced the particular
>   PV feature.
> ---
>  docs/system/i386/kvm-pv.rst | 100 ++++++++++++++++++++++++++++++++++++
>  docs/system/target-i386.rst |   1 +
>  2 files changed, 101 insertions(+)
>  create mode 100644 docs/system/i386/kvm-pv.rst
> 
> diff --git a/docs/system/i386/kvm-pv.rst b/docs/system/i386/kvm-pv.rst
> new file mode 100644
> index 000000000000..1e5a9923ef45
> --- /dev/null
> +++ b/docs/system/i386/kvm-pv.rst
> @@ -0,0 +1,100 @@
> +Paravirtualized KVM features
> +============================
> +
> +Description
> +-----------
> +
> +In some cases when implementing hardware interfaces in software is slow, ``KVM``
> +implements its own paravirtualized interfaces.
> +
> +Setup
> +-----
> +
> +Paravirtualized ``KVM`` features are represented as CPU flags. The following
> +features are enabled by default for any CPU model when ``KVM`` acceleration is
> +enabled:

/if host kernel supports them

> +
> +- ``kvmclock``
> +- ``kvm-nopiodelay``

> +- ``kvm-asyncpf``

later you say it's not enabled by default since x.y and something else should be used instead

maybe add a kernel version for each item in this list aka: (since: ... [,till])

> +- ``kvm-steal-time``
> +- ``kvm-pv-eoi``
> +- ``kvmclock-stable-bit``
> +
> +``kvm-msi-ext-dest-id`` feature is enabled by default in x2apic mode with split
> +irqchip (e.g. "-machine ...,kernel-irqchip=split -cpu ...,x2apic").


> +Note: when CPU model ``host`` is used, QEMU passes through all supported
> +paravirtualized ``KVM`` features to the guest.

Is it true in case of kvm-pv-enforce-cpuid=on ?

Also I'd s/passes through/enables/
on the grounds that host CPUID simply doesn't have such CPUIDs
so it's a bit confusing.


> +Existing features
> +-----------------
> +
> +``kvmclock``
> +  Expose a ``KVM`` specific paravirtualized clocksource to the guest. Supported
> +  since Linux v2.6.26.
> +
> +``kvm-nopiodelay``
> +  The guest doesn't need to perform delays on PIO operations. Supported since
> +  Linux v2.6.26.
> +
> +``kvm-mmu``
> +  This feature is deprecated.
> +
> +``kvm-asyncpf``
> +  Enable asynchronous page fault mechanism. Supported since Linux v2.6.38.
> +  Note: since Linux v5.10 the feature is deprecated and not enabled by ``KVM``.

> +  Use ``kvm-asyncpf-int`` instead.
'Use' or 'Used' by default?


> +``kvm-steal-time``
> +  Enable stolen (when guest vCPU is not running) time accounting. Supported
> +  since Linux v3.1.
> +
> +``kvm-pv-eoi``
> +  Enable paravirtualized end-of-interrupt signaling. Supported since Linux
> +  v3.10.
> +
> +``kvm-pv-unhalt``
> +  Enable paravirtualized spinlocks support. Supported since Linux v3.12.
> +
> +``kvm-pv-tlb-flush``
> +  Enable paravirtualized TLB flush mechanism. Supported since Linux v4.16.
> +
> +``kvm-pv-ipi``
> +  Enable paravirtualized IPI mechanism. Supported since Linux v4.19.
> +
> +``kvm-poll-control``
> +  Enable host-side polling on HLT control from the guest. Supported since Linux
> +  v5.10.
> +
> +``kvm-pv-sched-yield``
> +  Enable paravirtualized sched yield feature. Supported since Linux v5.10.
> +
> +``kvm-asyncpf-int``
> +  Enable interrupt based asynchronous page fault mechanism. Supported since Linux
> +  v5.10.
> +
> +``kvm-msi-ext-dest-id``
> +  Support 'Extended Destination ID' for external interrupts. The feature allows
> +  to use up to 32768 CPUs without IRQ remapping (but other limits may apply making

maybe add a footnote pointing to what 'other limits' may exist.

> +  the number of supported vCPUs for a given configuration lower). Supported since
> +  Linux v5.10.
> +
> +``kvmclock-stable-bit``
> +  Tell the guest that guest visible TSC value can be fully trusted for kvmclock
> +  computations and no warps are expected. Supported since Linux v2.6.35.
> +
> +Supplementary features
> +----------------------
> +
> +``kvm-pv-enforce-cpuid``
> +  Limit the supported paravirtualized feature set to the exposed features only.

Does 'the exposed features' mean feature flags explicitly set for CPU on command line?

> +  Note, by default, ``KVM`` allows the guest to use all currently supported
> +  paravirtualized features even when they were not announced in guest visible
> +  CPUIDs. Supported since Linux v5.10.
> +
> +
> +Useful links
> +------------
> +
> +Please refer to Documentation/virt/kvm in Linux for additional details.
> diff --git a/docs/system/target-i386.rst b/docs/system/target-i386.rst
> index 6a86d638633a..4daa53c35d8f 100644
> --- a/docs/system/target-i386.rst
> +++ b/docs/system/target-i386.rst
> @@ -26,6 +26,7 @@ Architectural features
>     :maxdepth: 1
>  
>     i386/cpu
> +   i386/kvm-pv
>     i386/sgx
>  
>  .. _pcsys_005freq:


