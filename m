Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3623236CEA9
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 00:38:25 +0200 (CEST)
Received: from localhost ([::1]:54082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbWLY-0005CT-Au
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 18:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lbWKL-0004er-7d
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 18:37:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lbWKH-0003nP-Kx
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 18:37:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619563024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+G1V5FFo7XSIb4p/tdjLzvYyptF1L8F4+XfoOkLwnFc=;
 b=IDEsTzwN6u0wjEL1ii7C7fVHTqQT+nVm0JGy3i5iQXllf7tQBGmG2yezrDeHiz60q9e0CG
 kfJJBG0r14EmvcmUcVZpO5+YPyFmoOWd7pYvJqE/1M16Qgg8krYXjfkkxCSGmVMrQEYiWX
 6Qre+ZYulbsIWiti6Oh/IPHAGu6UK1w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-ZYvebRCROwCRgdKDCf2qFg-1; Tue, 27 Apr 2021 18:37:00 -0400
X-MC-Unique: ZYvebRCROwCRgdKDCf2qFg-1
Received: by mail-wm1-f72.google.com with SMTP id
 b196-20020a1c80cd0000b029013f94053d98so867640wmd.6
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 15:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+G1V5FFo7XSIb4p/tdjLzvYyptF1L8F4+XfoOkLwnFc=;
 b=N51Mg74RvpwCpEZSeCqNPUOWADtpaZgmxG90ZiqYCWYXnYfIrMfqwNrg8Iulhb/01g
 DKEh7CwYzF9clQAr/D00TTJxaXXX2C7mC4zQKx6P41GjvX/FJjolNuLuLwYvUo+jgdND
 6L9L7GaA75yahYyDLu3YimnWd4QzV8xUmXym3mPGWThrgZu/oJfGBJNOTHEQAQ5KkzFm
 bwCJB68tRMX29mvZ7TeiPUHck/Urwq1ydaHEYbMJ+FtnCIdcZ28SsuOMqO7YIkjy9MPd
 uT9qKmeUMI12Laa3ywlgwBcyQeTAaShqHut29wk3o14G+l6ho2M6pNlA6EpraEq4LnzY
 1WVg==
X-Gm-Message-State: AOAM532ylSz2vQtE1QmFjQE1k4B3ZZtq+1Npv1Gof10aqwCqwQwfCGII
 ZKJ51YWrrF8rcltBZTNrScpiXjtQjIOPcQX/TtRCCkYTsXCwcGLP1vjYfcZapnEpF1L98IdKd4Y
 9xASh3VWE0jiE6bs=
X-Received: by 2002:a5d:6787:: with SMTP id v7mr23584242wru.386.1619563018955; 
 Tue, 27 Apr 2021 15:36:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJfy4j9/ptJosnt7UeSjT92nca7uK0MrNmWkmtq1WHZP5JNMZKIT1PHH3AEQj1wuBbR9jPgg==
X-Received: by 2002:a5d:6787:: with SMTP id v7mr23584224wru.386.1619563018801; 
 Tue, 27 Apr 2021 15:36:58 -0700 (PDT)
Received: from redhat.com ([2a10:800a:cdef:0:114d:2085:61e4:7b41])
 by smtp.gmail.com with ESMTPSA id i3sm1298784wmq.28.2021.04.27.15.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 15:36:57 -0700 (PDT)
Date: Tue, 27 Apr 2021 18:36:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: suyuheng <su_yuheng@foxmail.com>
Subject: Re: [PATCH] microvm: Enable hotplug of pcie
Message-ID: <20210427183635-mutt-send-email-mst@kernel.org>
References: <tencent_F4EF5FC4638158CB96B434014DF9CBF62405@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_F4EF5FC4638158CB96B434014DF9CBF62405@qq.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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
Cc: ehabkost@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 pbonzini@redhat.com, Yuheng Su <suyuheng@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 27, 2021 at 09:04:27PM +0800, suyuheng wrote:
> From: Yuheng Su <suyuheng@bytedance.com>
> 
> Signed-off-by: Yuheng Su <suyuheng@bytedance.com>


seems to be extended config space as opposed to hotplug ...

> ---
>  hw/i386/acpi-microvm.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> index ccd3303aac..4f32bf512f 100644
> --- a/hw/i386/acpi-microvm.c
> +++ b/hw/i386/acpi-microvm.c
> @@ -26,6 +26,7 @@
>  
>  #include "exec/memory.h"
>  #include "hw/acpi/acpi.h"
> +#include "hw/acpi/pci.h"
>  #include "hw/acpi/aml-build.h"
>  #include "hw/acpi/bios-linker-loader.h"
>  #include "hw/acpi/generic_event_device.h"
> @@ -209,6 +210,16 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
>                      ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
>                      x86ms->oem_table_id);
>  
> +    acpi_add_table(table_offsets, tables_blob);
> +    {
> +        AcpiMcfgInfo mcfg = {
> +           .base = mms->gpex.ecam.base,
> +           .size = mms->gpex.ecam.size,
> +        };
> +        build_mcfg(tables_blob, tables->linker, &mcfg, x86ms->oem_id,
> +                   x86ms->oem_table_id);
> +    }
> +
>      xsdt = tables_blob->len;
>      build_xsdt(tables_blob, tables->linker, table_offsets, x86ms->oem_id,
>                 x86ms->oem_table_id);
> -- 
> 2.11.0


