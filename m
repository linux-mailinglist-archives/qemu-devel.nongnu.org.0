Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AFF5E581A
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 03:35:52 +0200 (CEST)
Received: from localhost ([::1]:58334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obB81-0004d8-T6
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 21:35:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1obB5Z-00031w-KF
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 21:33:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1obB5R-0006zZ-Lk
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 21:33:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663810387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hp2mnv6FXyIeyU72ew7KLHH8DLXZepbUxyVoMBLPiSc=;
 b=BTUf+NoSDxYuR9hTK83Zvf8FfvCj1M0O7kXhf9rqt3lPPZCxBSP7sNkw+pPORfUs0GD5C+
 dqc+mSZIS/LHxzSVJsSrHBJ6tn0uMTRjNtj8i9ddufJbHt4EaLExXCTM5LbKbNGU4CTTE9
 NzHZQkCenOz8xJ3kgbtnH1jgkKRYiVU=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-652-pyDKtMUnOEG6igYZjfH98Q-1; Wed, 21 Sep 2022 21:33:06 -0400
X-MC-Unique: pyDKtMUnOEG6igYZjfH98Q-1
Received: by mail-oo1-f71.google.com with SMTP id
 n6-20020a4a6106000000b0044b2434319eso3442401ooc.3
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 18:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=hp2mnv6FXyIeyU72ew7KLHH8DLXZepbUxyVoMBLPiSc=;
 b=mohxcDnsvDl7Q9Xxr8f3Zx2oV3n0ivVP1B38G0ycQidHV/iWvtXmc3g86p9RC5As/I
 QYczM/XaBexfiaGQdZ+eVIy0QDc/U8J3UCWsiTIfqWHqLZ17NMxinrr1fAUvFtUuzehV
 tw6Wl9lgeCNCh2gnK3DGwSn04MIx1bbKbroZ3MqMTiJ9i2WTJOkBWAVaRTfmQY4oV+eO
 tHWj2nhvZZkQpNwh2X4gjCk1xrApwpus2FFCWES+VFy658FSI4NdhoeeQ11/I0E84uA+
 ib71in4E1PwLmKMFBaAgKfwM1oSHxfbmiEEGAX21WqZnNyCcxGuTXqEef5aVLv5GxMdv
 cJ5A==
X-Gm-Message-State: ACrzQf0yk2ixVdpuu7n5oxNvAZKJ4baF48LmRP8EM/YdeDEDp22UkleV
 rRKYL0rmtM775ybVBMu+gT3vEsKckUt2Q5Ho0E2vksbfQOxVMIth8qEf/YWYsAViJdcLvIFee3p
 Im1l6Bl3BCHqdhtQDUZ1uIPyL1BUiQSg=
X-Received: by 2002:a05:6830:1550:b0:659:68f7:492b with SMTP id
 l16-20020a056830155000b0065968f7492bmr490013otp.237.1663810385572; 
 Wed, 21 Sep 2022 18:33:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM511YACQhD66TXBQ72SZSrTvg0jv5Sp3TX123R6SUzDl25Fp2jJVCwwDShG+C+tkfLjJD8v0t+2FQ4slC2deFo=
X-Received: by 2002:a05:6830:1550:b0:659:68f7:492b with SMTP id
 l16-20020a056830155000b0065968f7492bmr490003otp.237.1663810385359; Wed, 21
 Sep 2022 18:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220921161227.57259-1-peterx@redhat.com>
In-Reply-To: <20220921161227.57259-1-peterx@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 22 Sep 2022 09:32:54 +0800
Message-ID: <CACGkMEux0zSD01s+vVceEkEmvsQ7dZpU8wnPVXjLNxNMFJKEJg@mail.gmail.com>
Subject: Re: [PATCH] Revert "intel_iommu: Fix irqchip / X2APIC configuration
 checks"
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 David Woodhouse <dwmw2@infradead.org>, Claudio Fontana <cfontana@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 22, 2022 at 12:12 AM Peter Xu <peterx@redhat.com> wrote:
>
> It's true that when vcpus<=255 we don't require the length of 32bit APIC
> IDs.  However here since we already have EIM=ON it means the hypervisor
> will declare the VM as x2apic supported (e.g. VT-d ECAP register will have
> EIM bit 4 set), so the guest should assume the APIC IDs are 32bits width
> even if vcpus<=255.  In short, commit 77250171bdc breaks any simple cmdline
> that wants to boot a VM with >=9 but <=255 vcpus with:
>
>   -device intel-iommu,intremap=on
>
> For anyone who does not want to enable x2apic, we can use eim=off in the
> intel-iommu parameters to skip enabling KVM x2apic.
>
> This partly reverts commit 77250171bdc02aee106083fd2a068147befa1a38, while
> keeping the valid bit on checking split irqchip, but revert the other change.
>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Claudio Fontana <cfontana@suse.de>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  hw/i386/intel_iommu.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 05d53a1aa9..6524c2ee32 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -3818,6 +3818,11 @@ static bool vtd_decide_config(IntelIOMMUState *s, Error **errp)
>              error_setg(errp, "eim=on requires accel=kvm,kernel-irqchip=split");
>              return false;
>          }
> +        if (!kvm_enable_x2apic()) {
> +            error_setg(errp, "eim=on requires support on the KVM side"
> +                             "(X2APIC_API, first shipped in v4.7)");
> +            return false;
> +        }

I wonder if we need some work on the migration compatibility here
(though it could be tricky).

Thanks

>      }
>
>      /* Currently only address widths supported are 39 and 48 bits */
> --
> 2.32.0
>


