Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB795E65AE
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 16:32:53 +0200 (CEST)
Received: from localhost ([::1]:45430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obNFz-0008NJ-38
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 10:32:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1obMX8-0001Hq-Eh
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:46:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1obMX4-00048e-79
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:46:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663854383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0GK8ZHV4Xeyf+aIhpla7TRPBerZfr+vTG7hU3XaCR8Q=;
 b=MpMbGNT+jXyINBPYCstbWSM+pG69VKebwNyMQIlaQ2ZjT/N0PQlJyz0jFPX7alheVptdju
 nhcDHYmLjqi13SUHcteCRoYX1G5d+ntyIF/M2ms12kpUH5Dv34+yIXcijBSKHhMBJSxFH5
 59CAmTDrhkfyMT19IHZoqmUKcdVXBI8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-492-lrRIfQuOMuaxTbuT1-ONRA-1; Thu, 22 Sep 2022 09:46:22 -0400
X-MC-Unique: lrRIfQuOMuaxTbuT1-ONRA-1
Received: by mail-ed1-f72.google.com with SMTP id
 f18-20020a056402355200b0045115517911so6693966edd.14
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 06:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=0GK8ZHV4Xeyf+aIhpla7TRPBerZfr+vTG7hU3XaCR8Q=;
 b=pPc9GSny9ESKYfLhHTve0TF2FQuRHunDgk7cGRaq8nmcFuDObQ2DWV8Wkw/E1iyiHB
 DoFVufrNad3CtuvQF7ZqDTaiN8UaZbMfjc6+cScQx641qXiOiiKuAdGulFp/651kBvdN
 sO+ipoHsQQubSoZNawYlU2vt3F0yMLusSBcmbLXH5yMdrg+ZucIOrLrn92/wt41rvPxN
 WPyF/FPyLLKxQeUn3/wmzCZd+UKcVTFJ+eio5gQrBEeHxCMsArCOf83Zalr2A7B2az3y
 KkVyLu4KBW5hBifiGP0q/+GbTMhb9OMqGQrZDF1Mm4EmZd28qe5r2TrQ1vMV4sj//RSo
 86Lw==
X-Gm-Message-State: ACrzQf2DJJiRcmH9eXeHGT7IIt2UIUhRVJwCfFZZyevX3jhqcgoS887l
 WzH+GWlvyS3jIpMR23gEjkaE4Zu3SZQkONbTz++91PsykmFw3E92oSD60qGDbZSpwb/Zc0511ym
 cMQo6hq+cB2Tuq0Q=
X-Received: by 2002:a17:907:968d:b0:782:66dc:4b89 with SMTP id
 hd13-20020a170907968d00b0078266dc4b89mr1660931ejc.386.1663854380341; 
 Thu, 22 Sep 2022 06:46:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4f5e0Vq+SmHQJ4EKIn2CSRV6TYz0j3BKi/s6UW+lXLrmLWZFcbd9b0673j2XKEPWLNkvJbbw==
X-Received: by 2002:a17:907:968d:b0:782:66dc:4b89 with SMTP id
 hd13-20020a170907968d00b0078266dc4b89mr1660912ejc.386.1663854380156; 
 Thu, 22 Sep 2022 06:46:20 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 ez24-20020a1709070bd800b00741383c1c5bsm2588662ejc.196.2022.09.22.06.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 06:46:19 -0700 (PDT)
Date: Thu, 22 Sep 2022 15:46:17 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, David
 Woodhouse <dwmw2@infradead.org>, Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH] Revert "intel_iommu: Fix irqchip / X2APIC configuration
 checks"
Message-ID: <20220922154617.57d1a1fb@redhat.com>
In-Reply-To: <20220921161227.57259-1-peterx@redhat.com>
References: <20220921161227.57259-1-peterx@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Wed, 21 Sep 2022 12:12:27 -0400
Peter Xu <peterx@redhat.com> wrote:

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

above 'check' has side-effects
if it's supposed to be a check it would be better to use kvm_has_x2apic_api()
instead.

Also 77250171bdc says:
"
    The check on kvm_enable_x2apic() needs to happen *anyway* in order to
    allow CPUs above 254 even without an IOMMU, so allow that to happen
    elsewhere.
"

Looking for that elsewhere, it looks like commit dc89f32d92b was supposed
to take care of removed chunk, but that is not reachable because of > 255 vCPUs"

Likely 77250171bdc just exposed a bug in dc89f32d92b, where
the later removed kvm_enable_x2apic() always called (with split irqchip)
and made it called only when > 255 vCPUs.

So migration wise it looks like all version with it and less than 255 cpus
are broken.

Wait earlier c1bb5418e3, introduced that
   kvm_irqchip_is_split() && kvm_enable_x2apic()
'condition', also without any compat machinery to keep old behavior.

And before that kvm_enable_x2apic() was affecting only configuration
with intel_iommu (fb506e701e9b).

I'm not sure if anything could be salvaged here migration wise

PS:
I'd keep kvm_enable_x2apic() only in corrected x86_cpus_init()
and use kvm_has_x2apic_api() elsewhere for checks and bailing out.


> +            error_setg(errp, "eim=on requires support on the KVM side"
> +                             "(X2APIC_API, first shipped in v4.7)");
> +            return false;
> +        }



>      }
>  
>      /* Currently only address widths supported are 39 and 48 bits */


