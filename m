Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B19B3CE7C8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 19:16:42 +0200 (CEST)
Received: from localhost ([::1]:51178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Wsj-0000Vn-8R
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 13:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m5WrA-0007Nr-T6
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 13:15:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m5Wr9-0003qi-9G
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 13:15:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626714902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3QjD8Ov5SjaRYrA/rIrzQeamQNS8tGLL7CAB92/hSSI=;
 b=HbUS9o4aeSv5Eq1jOmR6akVmrkzZ1TQFbYbfyN3QZCUeay9NRsZO+QYKhlTPMHgKFtDCjk
 9LNGWwHmuBXRLIYUZXMxsxXSce6MwpLsDKqNDASJCr013HdZuuSO0F7TGjsHPBANPVdX3d
 knoh2DAGFO9HvpaJRJqBxZHfcpQbIQY=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-6cDDmW79Ovya1hEunhOMAg-1; Mon, 19 Jul 2021 13:15:00 -0400
X-MC-Unique: 6cDDmW79Ovya1hEunhOMAg-1
Received: by mail-io1-f70.google.com with SMTP id
 e24-20020a5d8e180000b02904dd8a55bbd7so13072578iod.12
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 10:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3QjD8Ov5SjaRYrA/rIrzQeamQNS8tGLL7CAB92/hSSI=;
 b=CIw9v7q7AqRAf1atsSGsmHBl/ENTPodD1DDrf48gOKAy7xlImCJarJRZqp28+S7Cod
 SQuoiw0tOSzk8js8bUF+AhcOvkNdxG2C40GAPyYYGgIrCqxHpcHCCLeTfIca6xHhMPQw
 RvbWitnxIcaXGZCfJEWj7nW2aaMLgrVgO335v7ho2NY89XMEJ3I45Qnxj8+Xxkks706W
 Dz7e2eCbk140bLV4EONpMfL+UcREE3mXFmoCZBTfjzHpI6X5mbaYndh4aXGaFzS8W1rI
 8Zlma69xm60P2XZF6GPFhk2qCwZSBTjLN9P+f4SnGp7BMWwRIofPnSXnDV1u5/MAgeuR
 wh1w==
X-Gm-Message-State: AOAM530QqC0waK5QnjzBAGKaxAefpkW4MdYF+Ns5jDuU1cRUfct2a4dI
 keUXe0M8FxPY3xGI4MxSp05lWL5B7V51Ix79waB8h9hIQ4p30Jxbsa3CVkqtwbC4vhT70945GWW
 6ZACNVA9z56rWAfs=
X-Received: by 2002:a02:c906:: with SMTP id t6mr23048509jao.117.1626714900192; 
 Mon, 19 Jul 2021 10:15:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfcqSPW6QbtvKvBnN5WRLhzCYOaT9VC/KXgz+sNIsEVuw8QNivVpTSfxH8S+JF1mUg5kz7zg==
X-Received: by 2002:a02:c906:: with SMTP id t6mr23048481jao.117.1626714899988; 
 Mon, 19 Jul 2021 10:14:59 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id c16sm10430566ilo.72.2021.07.19.10.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 10:14:59 -0700 (PDT)
Date: Mon, 19 Jul 2021 19:14:57 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v2 08/11] machine: Use ms instead of global
 current_machine in sanity-check
Message-ID: <20210719171457.klvdn262sgt6ti3v@gator>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-9-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210719032043.25416-9-wangyanan55@huawei.com>
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

On Mon, Jul 19, 2021 at 11:20:40AM +0800, Yanan Wang wrote:
> In the sanity-check of smp_cpus and max_cpus against mc in function
> machine_set_smp(), we are now using ms->smp.max_cpus for the check
> but using current_machine->smp.max_cpus in the error message.
> Tweak this by uniformly using the local ms.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index c074425015..f5620c4d34 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -896,7 +896,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
>      } else if (ms->smp.max_cpus > mc->max_cpus) {
>          error_setg(errp, "Invalid SMP CPUs %d. The max CPUs "
>                     "supported by machine '%s' is %d",
> -                   current_machine->smp.max_cpus,
> +                   ms->smp.max_cpus,
>                     mc->name, mc->max_cpus);
>      }
>  
> -- 
> 2.19.1
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


