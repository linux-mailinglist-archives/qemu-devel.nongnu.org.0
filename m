Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D2E3CE6C4
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 19:02:27 +0200 (CEST)
Received: from localhost ([::1]:35466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Wew-00068S-O9
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 13:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m5Wcw-0004rU-08
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 13:00:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m5Wcs-0002Lg-Nx
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 13:00:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626714018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IRP+JUDCE8+xInO1K/CwfsFl2Glt120UarEzsoI0s+s=;
 b=dthbIgvi4lfDyxnwByV0aW66xZjdRr5JfW0SDSnTaTschCklKRhsJUaWOVSnTunIF0Wvor
 7EsIU8rcXrIn8IYJ7Mu9OpyxEjbbvQWo9CaSj/gGBs0QfUzw14mAMD32hvImIOJgwhuRSF
 CVjc4wbnzrMdHePGw0MtinaTrGbzmxY=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-7SQcLXHpMuOb8bjlQOmtoA-1; Mon, 19 Jul 2021 13:00:16 -0400
X-MC-Unique: 7SQcLXHpMuOb8bjlQOmtoA-1
Received: by mail-io1-f71.google.com with SMTP id
 p7-20020a6b63070000b029050017e563a6so13082252iog.4
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 10:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IRP+JUDCE8+xInO1K/CwfsFl2Glt120UarEzsoI0s+s=;
 b=L+LPN0EttFOC9B5g7IpA8nSYQjTeOP/FXQ6n7b2DEqiueBXfKAwVyZ5GJCYl28LlBU
 t56zkh6I9ZAMk7ugpA/CwnhYDVl11YVrxzA24eaGP62wMSmBlFGB9IkLNxIyfjtiots1
 JoPfSNuW6LqNxZa1zvg5Asau1sqK9af23Moqm9sEchzM5j/HEExLxBNWdeCU8HjcbDac
 2uH5CERfDvsBaqmGPOPVJ0qKTaQMr1WAKqDINkLipwOmpOjU2jqi7yCDcEoaNU35PrzX
 FMTCATtfv6B37ToPCEms5Fts3kCCA7dX9tCgjH+pMlcbaSX4ik72Zpl+mXov5GeekO09
 Kz2g==
X-Gm-Message-State: AOAM5323ds4v34FF6PUeA2I9dUP7QqtFrVCv2s/iWG7iRZBk+o5JI/1E
 liovslqIGWsMKFwfRbcoiPNgIm5FrYwK5yQMJFFCnywBXEIbjd4crG6URqdvF9Tr16CDvVU5z0C
 e64z+Xe7DZmItsUg=
X-Received: by 2002:a92:cb52:: with SMTP id f18mr17810595ilq.97.1626714016360; 
 Mon, 19 Jul 2021 10:00:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcOPOIvxYxHdiYjfn3P7VE/6KfH1iQ7uYnYaCsyWXfgKmwYwNDJ+mOf7voQ2ClZLbIO+JCBQ==
X-Received: by 2002:a92:cb52:: with SMTP id f18mr17810570ilq.97.1626714016211; 
 Mon, 19 Jul 2021 10:00:16 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id c4sm9958860ilq.70.2021.07.19.10.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 10:00:15 -0700 (PDT)
Date: Mon, 19 Jul 2021 19:00:13 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v2 06/11] hw: Add compat machines for 6.2
Message-ID: <20210719170013.jtnu6seyoz65g3yi@gator>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-7-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210719032043.25416-7-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, Igor Mammedov <imammedo@redhat.com>,
 yuzenghui@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 19, 2021 at 11:20:38AM +0800, Yanan Wang wrote:
> Add 6.2 machine types for arm/i440fx/q35/s390x/spapr.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt.c              |  9 ++++++++-
>  hw/core/machine.c          |  3 +++
>  hw/i386/pc.c               |  3 +++
>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>  hw/ppc/spapr.c             | 15 +++++++++++++--
>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>  include/hw/boards.h        |  3 +++
>  include/hw/i386/pc.h       |  3 +++
>  9 files changed, 71 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 81eda46b0b..01165f7f53 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2788,10 +2788,17 @@ static void machvirt_machine_init(void)
>  }
>  type_init(machvirt_machine_init);
>  
> +static void virt_machine_6_2_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE_AS_LATEST(6, 2)
> +
>  static void virt_machine_6_1_options(MachineClass *mc)
>  {
> +    virt_machine_6_2_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
>  }
> -DEFINE_VIRT_MACHINE_AS_LATEST(6, 1)
> +DEFINE_VIRT_MACHINE(6, 1)
>  
>  static void virt_machine_6_0_options(MachineClass *mc)
>  {
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 8b4d07d3fc..63439c4a6d 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -37,6 +37,9 @@
>  #include "hw/virtio/virtio.h"
>  #include "hw/virtio/virtio-pci.h"
>  
> +GlobalProperty hw_compat_6_1[] = {};
> +const size_t hw_compat_6_1_len = G_N_ELEMENTS(hw_compat_6_1);
> +
>  GlobalProperty hw_compat_6_0[] = {
>      { "gpex-pcihost", "allow-unmapped-accesses", "false" },
>      { "i8042", "extended-state", "false"},


> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index b6161cee88..2832f0f8aa 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -354,6 +354,9 @@ struct MachineState {
>      } \
>      type_init(machine_initfn##_register_types)
>  
> +extern GlobalProperty hw_compat_6_1[];
> +extern const size_t hw_compat_6_1_len;
> +
>  extern GlobalProperty hw_compat_6_0[];
>  extern const size_t hw_compat_6_0_len;
>

Arm and general parts look good to me

Reviewed-by: Andrew Jones <drjones@redhat.com>


