Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CC83EA6C6
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 16:47:42 +0200 (CEST)
Received: from localhost ([::1]:40034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEBzg-00058T-Vk
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 10:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mEByL-0004LK-6z
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 10:46:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mEByH-0001cC-N4
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 10:46:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628779572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2osqVmnisuPiBdF/WPcdMtNl0zObhv0LjbJLZvX136o=;
 b=VrMWlK/30LxRtUYSY4qQ/gQh3/y/ADy0uEF5QM9wPetfD28SytnKrfrsJ1ktHPZk+k2O0A
 S3v5737WXVu03UPhAxwCjyD4CNmi5QXOw3QNi4G+vcAYqRDd62a/Ut0rReYukC2OzD6E2Z
 VD2wbAV2EipAfU/+keRQhDfo2YJyuEc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-g0L2POjiOQKnxwrhfEp7Wg-1; Thu, 12 Aug 2021 10:46:11 -0400
X-MC-Unique: g0L2POjiOQKnxwrhfEp7Wg-1
Received: by mail-wr1-f69.google.com with SMTP id
 p10-20020a5d68ca000000b001552bf8b9daso210577wrw.22
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 07:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2osqVmnisuPiBdF/WPcdMtNl0zObhv0LjbJLZvX136o=;
 b=A+vCRXgvzoDVX1p7qm1eqzNvNl4YSn0omcnSkSROFnU5jEbhAH7koizeUx1NMSLCE2
 iWeP8uTl+ElXVwDtDhUn0wiSpKqCe9UIT9tihQjaC4RNQhRWrujxxdJNDFE+uatRmO25
 q89KNQppWIGP2TR843dLWi9h9nLEdoi5dc2GsiDMgTS4MXloeBVKVoDYzv82VjeqHk/S
 lpkQvvMC+t7voflvKetJy1PLnVmwkuLf66+LDrEwDy8yCfw96gj2gHvpACZvoY1zPsBv
 0XutEwiiOgcShFWsLZuOnzJjtz0TcupEERfFA9w+2NcSMB8bxibXED9DJRCMBi1nBklz
 YtKg==
X-Gm-Message-State: AOAM532Xjua109A2sLCuEwus0nyyCS1qNAdcwFRtW+wOqdgcmGBl7CW7
 cHWYoAuKzminWQijO3mfXwbv0Rsvw9g+TnJM2W5fpr8EE1tNNvZXOEskt/7HDE7+T3bblQ3Teca
 EvT5a0QejIsEFT9A=
X-Received: by 2002:adf:fc50:: with SMTP id e16mr4611480wrs.382.1628779570167; 
 Thu, 12 Aug 2021 07:46:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7Q7r5wj9rqBh7lZpEfbWbGacdXyFtu9La+eomcO0HbroscxwV9W6Lo/L/uBXwyhKNq/udVg==
X-Received: by 2002:adf:fc50:: with SMTP id e16mr4611459wrs.382.1628779569919; 
 Thu, 12 Aug 2021 07:46:09 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id t15sm3159300wrw.48.2021.08.12.07.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 07:46:09 -0700 (PDT)
Date: Thu, 12 Aug 2021 16:46:08 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] q35: catch invalid cpu hotplug configuration
Message-ID: <20210812164608.72fa1e37@redhat.com>
In-Reply-To: <20210812102341.3316254-1-kraxel@redhat.com>
References: <20210812102341.3316254-1-kraxel@redhat.com>
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
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.701, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 12 Aug 2021 12:23:41 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> Related: https://bugzilla.redhat.com//show_bug.cgi?id=1985924
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/isa/lpc_ich9.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
> index 5f9de0239cf9..5f143dca17aa 100644
> --- a/hw/isa/lpc_ich9.c
> +++ b/hw/isa/lpc_ich9.c
> @@ -31,6 +31,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
>  #include "cpu.h"
> +#include "qapi/error.h"
>  #include "qapi/visitor.h"
>  #include "qemu/range.h"
>  #include "hw/isa/isa.h"
> @@ -676,6 +677,18 @@ static void ich9_lpc_realize(PCIDevice *d, Error **errp)
>      DeviceState *dev = DEVICE(d);
>      ISABus *isa_bus;
>  
> +    if ((lpc->smi_host_features & BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT)) &&
> +        !(lpc->smi_host_features & BIT_ULL(ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT))) {
> +        /*
> +         * smi_features_ok_callback() throws an error on this.
> +         *
> +         * So bail out here instead of advertizing the invalid
> +         * configuration and get obscure firmware failures from that.
> +         */
> +        error_setg(errp, "cpu hot-unplug requires cpu hot-plug");
> +        return;
> +    }
> +
>      isa_bus = isa_bus_new(DEVICE(d), get_system_memory(), get_system_io(),
>                            errp);
>      if (!isa_bus) {


