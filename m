Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D795EBE87
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 11:26:00 +0200 (CEST)
Received: from localhost ([::1]:55918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od6ql-00028S-Rh
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 05:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1od6iO-0008V5-4c
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:17:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1od6iK-0001U1-Ud
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:17:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664270235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UQfYJYe+f1ZJlWxPO/NC+mL/f6ey5vMPSNmzbvnp1aM=;
 b=bgcDGqxzbCOX+0vK4WP3iHdBQ2C8IICfAMWjH4gGzuL4pREOKiXQUku7jKRSEXeipurKCT
 2tHgUlE8ErPvoBjf9yChyuoyY+zoXJHHd7qYsag/Xte4QWkH+NnVR+IbCfmjhx/yxMsanS
 KXfpDUgqr3FtZNefH8q6SSUTkQrI19k=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-569-A4xhARgyPB-OZckkPDFr6Q-1; Tue, 27 Sep 2022 05:17:14 -0400
X-MC-Unique: A4xhARgyPB-OZckkPDFr6Q-1
Received: by mail-ej1-f69.google.com with SMTP id
 qb16-20020a1709077e9000b007827e5f3e2dso3486926ejc.3
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 02:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=UQfYJYe+f1ZJlWxPO/NC+mL/f6ey5vMPSNmzbvnp1aM=;
 b=vwh8PDncuRuKulVIXwVCvsOdsRTHbruDhiRYWeM/TKDd1YHgjr2szKdFv+spn0s2NJ
 8oMNhJq6fiFI7HZO9XpwvFFpCwEbzRU0ck2UxDJ5WmMMQRMn5snCK64rfi5vipW8KCEf
 01q2Y/26Fc8dygHugW1PzFaLhLU3zB545q2UP4toWxBYxoicJPF2WaFUN05VWne6MS9M
 twXWYXMyv9aGLSQgT4kGaExqklEwFA7Z7bahBxXpPjvw6a9b7IeN9Q+XG+G16qBJ5RYh
 oxfHm1vzmI30mNTMEnWnyeGX/UqSWRMsxrG9RPUSAwyVYT0oQYMHJGeVJx2tXhkWc/Ti
 VR9w==
X-Gm-Message-State: ACrzQf0kLrtJbqKghjW1UO5KEPK6oTdS0eBOFNdThfvMbfNlKOWDuM3F
 b55zp/RoDZB/i2YUr0PvOzp2xPjoNDTKrU4tSTydNFxo6YbQtK8VTE8oO3Rf9i53CbIhgLDKFUX
 pizxvVubRjXvGQEM=
X-Received: by 2002:a17:907:9602:b0:780:8c9f:f99a with SMTP id
 gb2-20020a170907960200b007808c9ff99amr22252313ejc.465.1664270233544; 
 Tue, 27 Sep 2022 02:17:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6g8t5m4YRfQR/npIYXd/ywm5HV9j7exnNbjnnIKbVQDEv5U5hq3ZAKZzG+MwgsmbJ77UfoRA==
X-Received: by 2002:a17:907:9602:b0:780:8c9f:f99a with SMTP id
 gb2-20020a170907960200b007808c9ff99amr22252300ejc.465.1664270233337; 
 Tue, 27 Sep 2022 02:17:13 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 kz22-20020a17090777d600b00730979f568fsm488578ejc.150.2022.09.27.02.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 02:17:12 -0700 (PDT)
Date: Tue, 27 Sep 2022 11:17:11 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>, David
 Woodhouse <dwmw2@infradead.org>, Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v2] Revert "intel_iommu: Fix irqchip / X2APIC
 configuration checks"
Message-ID: <20220927111711.4307af92@redhat.com>
In-Reply-To: <20220926153206.10881-1-peterx@redhat.com>
References: <20220926153206.10881-1-peterx@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Mon, 26 Sep 2022 11:32:06 -0400
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
> One thing to mention is that this patch may break migration compatibility
> of such VM, however that's probably the best thing we can do, because the
> old behavior was simply wrong and not working for >8 vcpus.  For <=8 vcpus,
> there could be a light guest ABI change (by enabling KVM x2apic after this
> patch), but logically it shouldn't affect the migration from working.
> 
> Also, this is not the 1st commit to change x2apic behavior.  Igor provided
> a full history of how this evolved for the past few years:
> 
> https://lore.kernel.org/qemu-devel/20220922154617.57d1a1fb@redhat.com/
> 
> Relevant commits for reference:
> 
>   fb506e701e ("intel_iommu: reject broken EIM", 2016-10-17)
>   c1bb5418e3 ("target/i386: Support up to 32768 CPUs without IRQ remapping", 2020-12-10)
>   77250171bd ("intel_iommu: Fix irqchip / X2APIC configuration checks", 2022-05-16)
>   dc89f32d92 ("target/i386: Fix sanity check on max APIC ID / X2APIC enablement", 2022-05-16)
> 
> We may want to have this for stable too (mostly for 7.1.0 only).  Adding a
> fixes tag.
> 
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Claudio Fontana <cfontana@suse.de>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Fixes: 77250171bd ("intel_iommu: Fix irqchip / X2APIC configuration checks")
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> v2:
> - Added some more information into commit message [Igor]
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
>      }
>  
>      /* Currently only address widths supported are 39 and 48 bits */


