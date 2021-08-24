Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF463F5F9A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 15:56:23 +0200 (CEST)
Received: from localhost ([::1]:40108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIWuc-0003Ru-3h
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 09:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mIWtP-00026B-Is
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 09:55:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mIWtM-00029U-Dk
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 09:55:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629813303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OfKhkeL/wWyD3xCekfPGHfoYbTaumpDj5yGtt9EHmWo=;
 b=jHeHHTcYNII3KNHmsWfhRt6urZ3h1tyh/hizUYLQnep4Jtu4vqYf45y8SghUSjbG0pIqlp
 lY0nAmUyXWj+AvarUdfYKQeLtneEtv9qcz30IoYQEGPPlnMFeQZ3uFUMMwDFogI7WAmQS8
 meoIs4/xXFh2v0vv0wJPxLIzj04za/Y=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-X5L762LSOKefppr4KsP6Eg-1; Tue, 24 Aug 2021 09:54:19 -0400
X-MC-Unique: X5L762LSOKefppr4KsP6Eg-1
Received: by mail-ej1-f71.google.com with SMTP id
 r21-20020a1709067055b02904be5f536463so7085396ejj.0
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 06:54:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OfKhkeL/wWyD3xCekfPGHfoYbTaumpDj5yGtt9EHmWo=;
 b=tQOoR1XbqfYmSZu15VVvKwef2gKI+fFmHdWmF7Qr340d9Yh5B1ivBS9/xH7b1BvrIM
 PVyqI4LENJOWZLO4ioUyta7ttR+9E1oHnmRYQem1cQSpT/fMp6yhDjTqKmEz8av3+PIe
 5XfO5VqBjb9NnMtK3Vc9ZkpIvOdDJKUtLqmyayGS0zjifqUDiCzz/z9kgQbXe3JgQaPs
 WjINFe1xw/yUfJ+pjZMpNnDV4az7IRoXK+j6gouyBP7LYi9Yo9KG9nwK6leLa4IF8+fQ
 pbQ6qAtBA0arQgerOGKdQ2bLCqCHzDIWvIhL0w2lgQliBvXoNeB//QFGlYIxq7WNXUAe
 qkHQ==
X-Gm-Message-State: AOAM530rWqYFW4kUfy/3FBwNg2jTKlKRAQ1xIQWAEOLHjNhpTCKOr4m7
 nVwSGZsJjbgrqwUTmDBQYiOhHgQq84Zm+FqU4HaM411OnCZojjSwk9VM5asQzj0ELgq1mwSefr1
 5wtXFrMI8YzdOVBU=
X-Received: by 2002:a17:907:1108:: with SMTP id
 qu8mr21323782ejb.58.1629813258208; 
 Tue, 24 Aug 2021 06:54:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz87TmEoaInxpajVFxhaAN4px/BnApptR8aOWl0X77tthas77YCW8S8kD0GOyPvosNzNnK1GQ==
X-Received: by 2002:a17:907:1108:: with SMTP id
 qu8mr21323766ejb.58.1629813257963; 
 Tue, 24 Aug 2021 06:54:17 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id se22sm3393904ejb.32.2021.08.24.06.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 06:54:17 -0700 (PDT)
Date: Tue, 24 Aug 2021 15:54:15 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v6 1/5] hw/arm/virt: Only describe cpu topology since
 virt-6.2
Message-ID: <20210824135415.3kqhsl5nigsmkivx@gator.home>
References: <20210824122016.144364-1-wangyanan55@huawei.com>
 <20210824122016.144364-2-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210824122016.144364-2-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Salil Mehta <salil.mehta@huawei.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 wanghaibin.wang@huawei.com, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 24, 2021 at 08:20:12PM +0800, Yanan Wang wrote:
> On existing older machine types, without cpu topology described
> in ACPI or DT, the guest will populate one by default. With the
> topology described, it will read the information and set up its
> topology as instructed, but that may not be the same as what was
> getting used by default. It's possible that an user application
> has a dependency on the default topology and if the default one
> gets changed it will probably behave differently.
> 
> Based on above consideration we'd better only describe topology
> information to the guest on 6.2 and later machine types.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt.c         | 3 +++
>  include/hw/arm/virt.h | 4 +++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ae029680da..82f2eba6bd 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2795,9 +2795,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(6, 2)
>  
>  static void virt_machine_6_1_options(MachineClass *mc)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> +
>      virt_machine_6_2_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
>      mc->smp_props.prefer_sockets = true;
> +    vmc->no_cpu_topology = true;
>  }
>  DEFINE_VIRT_MACHINE(6, 1)
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 9661c46699..6ab21ea90e 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -124,11 +124,13 @@ struct VirtMachineClass {
>      bool claim_edge_triggered_timers;
>      bool smbios_old_sys_ver;
>      bool no_highmem_ecam;
> -    bool no_ged;   /* Machines < 4.2 has no support for ACPI GED device */
> +    bool no_ged;   /* Machines < 4.2 have no support for ACPI GED device */
>      bool kvm_no_adjvtime;
>      bool no_kvm_steal_time;
>      bool acpi_expose_flash;
>      bool no_secure_gpio;
> +    /* Machines < 6.2 have no support for describing cpu topology to guest */
> +    bool no_cpu_topology;
>  };
>  
>  struct VirtMachineState {
> -- 
> 2.19.1
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


