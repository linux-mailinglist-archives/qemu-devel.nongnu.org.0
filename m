Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C857440199
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 19:58:39 +0200 (CEST)
Received: from localhost ([::1]:38126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgW9G-0002fU-9P
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 13:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgVm6-0003B4-9I
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 13:34:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgVm3-0001d6-4z
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 13:34:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635528878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g0LlKwb+qrdv5Vdajrf8plaOwGCkL8glPl2+9Uk+Mh0=;
 b=RQ4FbNvPr59EE4OOjROSJ0KictL46ABjlZqcvtMJODMegmtN57zWD8C4uB7xLkCuoWONhB
 dgMBevJ/aCHZ2TPrfkju99dsOfvTtAhgDpOVSK29Hv5UuX5UsdTHCtaB8BZUlO/FAraR19
 kNNnuZ+Rvv3gPkkc+3+cOkXcRGK873g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540--v-BQyQkPx6COGI3vx_W6w-1; Fri, 29 Oct 2021 13:34:36 -0400
X-MC-Unique: -v-BQyQkPx6COGI3vx_W6w-1
Received: by mail-wr1-f70.google.com with SMTP id
 g15-20020a5d64ef000000b0016a1331535eso3650120wri.10
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 10:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g0LlKwb+qrdv5Vdajrf8plaOwGCkL8glPl2+9Uk+Mh0=;
 b=GG87p8DQawhkopZ/fU2Y7HNNeS+JpnyNoyTedql4zNUFD+Btjh6EMj6IpZgVljhUPg
 JrvDwvsD7xbFAjW1QG0UxA5smiFsFBsTL+ElM9dlX8VxoRwTippyCXolEnpAQop98Vak
 vE/CRhy4yVQfdBY7mao7Ty0nAyKu6vjNIwY3l9jVvqXC5FHNv0q+2SinIjLfBNNimseZ
 jkaaKpBCNyLZr7btwJ4dUnkjCM+gOwM/EUHZBWwomCix9DMr85RWiX9zNRm42D7VedsL
 qDjg/xRhBQf1g1M3sRgVFdSh8A9L/HmUkUyj8XGj5Aqs8fP6M68FVKTNS3UJ2Mri+I7i
 AYbg==
X-Gm-Message-State: AOAM533F3vEK+gkdBoGuoZ0DiWKY30ham1fKaqzrBgmgh+2au+wmVuHS
 sRBxni+ZNCLEPUjpgfiHyM9oiGPWNcP+n1ilgF243A6Ml99/uBOAhGx6kBKPOGeAUl5F523+efQ
 4jbKtocf6a4T5iyc=
X-Received: by 2002:a5d:64e2:: with SMTP id g2mr15955293wri.253.1635528875533; 
 Fri, 29 Oct 2021 10:34:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgRObhgT7l1vHXyPxbyIfREsLKsBvulUytix3JrSTq4PcCiOXld+newdr/RJe50taCCo1yJw==
X-Received: by 2002:a5d:64e2:: with SMTP id g2mr15955255wri.253.1635528875257; 
 Fri, 29 Oct 2021 10:34:35 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o23sm6133315wms.18.2021.10.29.10.34.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 10:34:34 -0700 (PDT)
Message-ID: <aedc893d-79bf-1d3c-74d6-8388d0d1915c@redhat.com>
Date: Fri, 29 Oct 2021 19:34:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 2/3] qdev-monitor: Check sysbus device type before
 creating it
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20211029142258.484907-1-damien.hedde@greensocs.com>
 <20211029142258.484907-3-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211029142258.484907-3-damien.hedde@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.512, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, mark.burton@greensocs.com,
 edgari@xilinx.com, mirela.grujic@greensocs.com,
 Alistair Francis <alistair.francis@wdc.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 16:22, Damien Hedde wrote:
> Add an early check to test if the requested sysbus device type
> is allowed by the current machine before creating the device. This
> impacts both -device cli option and device_add qmp command.
> 
> Before this patch, the check was done well after the device has
> been created (in a machine init done notifier). We can now report
> the error right away.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> 
> v3: update error message
> ---
>  softmmu/qdev-monitor.c | 11 +++++++++++

/me wonders why this file is named '-monitor'.

> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 4851de51a5..e49d9773d2 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -42,6 +42,7 @@
>  #include "qemu/cutils.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/clock.h"
> +#include "hw/boards.h"
>  
>  /*
>   * Aliases were a bad idea from the start.  Let's keep them
> @@ -254,6 +255,16 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
>          return NULL;
>      }
>  
> +    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE)) {
> +        /* sysbus devices need to be allowed by the machine */
> +        MachineClass *mc = MACHINE_CLASS(object_get_class(qdev_get_machine()));
> +        if (!device_type_is_dynamic_sysbus(mc, *driver)) {
> +            error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "driver",

Per include/qapi/qmp/qerror.h:

  /*
   * These macros will go away, please don't use in new code, and do not
   * add new ones!
   */

  #define QERR_INVALID_PARAMETER_VALUE \
      "Parameter '%s' expects %s"

> +                       "a dynamic sysbus device type for the machine");

Besides, this is easier to read:

            error_setg(errp, "Parameter 'driver' expects a dynamic"
                             " sysbus device type for the machine");

Maybe remove QERR_INVALID_PARAMETER_VALUE from qdev_get_device_class()
in a preliminary patch?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +            return NULL;
> +        }
> +    }
> +
>      return dc;
>  }
>  
> 


