Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D65349240
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 13:42:01 +0100 (CET)
Received: from localhost ([::1]:35994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPPJI-0005tl-8U
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 08:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lPPIH-0005Rs-7R
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:40:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lPPI9-0005Jr-RY
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:40:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616676045;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=6O8QHaNJXyAEOIsoZS1qfmI0SzVf3/y9urZ4EyTH4Gs=;
 b=czML727N1mHEsyMYzQMHGQfiHRBZGm/p01g55bRmOXT+BGAomHgrtgPyUWSSgy0DOY5l2X
 kBYN/xQVFw0/IHZWAYaF+johWwEcb8TE04Qu057A/+YCLzR2Rcage28qs/RTVj/YA+tWIj
 VBkLeqEACKSWuz7YXftWeQVZx+Dzs4o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-klag0fdhNhG06J3bG2k3AA-1; Thu, 25 Mar 2021 08:40:44 -0400
X-MC-Unique: klag0fdhNhG06J3bG2k3AA-1
Received: by mail-wr1-f72.google.com with SMTP id h5so2569775wrr.17
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 05:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=6O8QHaNJXyAEOIsoZS1qfmI0SzVf3/y9urZ4EyTH4Gs=;
 b=HVWJw+N9PYHkAHHFPMP9uyHLigkigLON9kEgQ7ii6Fe5jl9W8CrQF58wag0xi56Yba
 Oj9UasnS0Hg5q0qiC0UMumS5eFGBDwzN3MmpKfuRe7yS/o/sW0yHXYRXNNVSuSv03nwY
 sfhcIj7Eiv5ul+F5g7+5NlH/SEqR9VwfX2XElTb0tKOFTsamg06dtKdU0fvv93CXaZA1
 yZOgBHnxQDxdKZpwg6sj0m6UDDZfVgwVyHMS1aJkQvQeZPBw0Rt+7WEpR53ActWZOVQy
 p4d87TNQTyUMp450kDEVMyIX9rljp9+sKYgeIff/PWYm4H59voqZmUlfCklVUfqQ/fnr
 r5qQ==
X-Gm-Message-State: AOAM530oG5cV6TV9Rl75qG3DGGsrHEY7pvkJDKYUQT4QcQLRvAm1bVCR
 GWjF9rwtfAOK5+LUuViy2C4xwo3FYnfPF0FA1zwJ4Ft53K0KNtcqMVMPeUF2w3o9YO1FMipfQ5g
 Paw8q9MVxNh/tWSU=
X-Received: by 2002:a5d:53c8:: with SMTP id a8mr8575322wrw.323.1616676042861; 
 Thu, 25 Mar 2021 05:40:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFi4RS1f3fmHT0giNW6AKw56rJ5a+s9HFAWrLBVAOjmpcKEyL4yu1NRjO91WKZY/A5VuDnlQ==
X-Received: by 2002:a5d:53c8:: with SMTP id a8mr8575299wrw.323.1616676042593; 
 Thu, 25 Mar 2021 05:40:42 -0700 (PDT)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id a6sm6641419wmm.0.2021.03.25.05.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 05:40:42 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [RFC PATCH v2 5/5] Enable the MTE support for KVM guest
In-Reply-To: <5ed81ba84e44100798009cee95c3dc2d993602f0.1615972140.git.haibo.xu@linaro.org>
 (Haibo Xu's message of "Wed, 17 Mar 2021 09:28:24 +0000")
References: <cover.1615972140.git.haibo.xu@linaro.org>
 <5ed81ba84e44100798009cee95c3dc2d993602f0.1615972140.git.haibo.xu@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Thu, 25 Mar 2021 13:40:41 +0100
Message-ID: <87mturo186.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: quintela@redhat.com
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 dgilbert@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Haibo Xu <haibo.xu@linaro.org> wrote:
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  hw/arm/virt.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 76658b93a3..36cfdb29e9 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -79,6 +79,7 @@
>  #include "hw/virtio/virtio-iommu.h"
>  #include "hw/char/pl011.h"
>  #include "qemu/guest-random.h"
> +#include "migration/misc.h"
>  
>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> @@ -828,6 +829,21 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
>      }
>  }
>  
> +static int virt_precopy_notify(NotifierWithReturn *n, void *data)
> +{
> +    PrecopyNotifyData *pnd = data;
> +
> +    switch (pnd->reason) {
> +    case PRECOPY_NOTIFY_SETUP:
> +        precopy_enable_metadata_migration();
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    return 0;
> +}
> +
>  static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
>                               uint32_t phandle)
>  {
> @@ -1912,9 +1928,9 @@ static void machvirt_init(MachineState *machine)
>      }
>  
>      if (vms->mte && kvm_enabled()) {
> -        error_report("mach-virt: KVM does not support providing "
> -                     "MTE to the guest CPU");
> -        exit(1);
> +        /* connect migration precopy request */
> +        vms->precopy_notifier.notify = virt_precopy_notify;
> +        precopy_add_notifier(&vms->precopy_notifier);
>      }
>  
>      create_fdt(vms);

Why are you using a notifier here?
It is not enough for you just esetup at this point a variable somewhere
   "foo->mte_enabled = true"

And create a function that just does:

bool is_mte_enabled(vode)
{
        return foo->mte_enabled;
}

And just check that everywhere?

Later, Juan.


