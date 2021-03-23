Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE97346945
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:43:39 +0100 (CET)
Received: from localhost ([::1]:45328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmwE-0003vh-SG
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOmpt-0004l1-9D
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 15:37:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOmpr-0006x0-Iz
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 15:37:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616528222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZmfPaTBR8wilJm1nYN/WkiiflxOqeM3YtnKS21sOGSY=;
 b=V1USUxsJl2oc/rd/9f05oxJlPxuEqKPgDIP61RKBnGUbrc1Ldhdkk2V4P6fqdEa9CVuc5u
 XP/XQyTTwGfrQ1m7yzjhbrDgI5mv/vm7hjR+f+AYoCUrg5+rtXGDc3PZCXx1FBrz/xB50j
 WElZk1oFEf3V/93GdTz9/DOYyeO2h3E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-yTdWVAAiNnyUXZFB9Ww5Mw-1; Tue, 23 Mar 2021 15:36:59 -0400
X-MC-Unique: yTdWVAAiNnyUXZFB9Ww5Mw-1
Received: by mail-wr1-f72.google.com with SMTP id z6so1569088wrh.11
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 12:36:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZmfPaTBR8wilJm1nYN/WkiiflxOqeM3YtnKS21sOGSY=;
 b=eNUNfk4JaQ9NA8HHZ1Br1LcPod7ERrXqCCkWp5B1uO+hUjMGKeqh2JW4EZbge/jYHo
 BscRcCLbV4qfccjdRWxa1TE9YrbCNEtD/da44fI/UdQRo1P4p3do07hzThDWzkfwT+9g
 +9ygRPCot+p8G1AtkWS6H0YDt6V7b+/Fkp5ANQ7JHhMXRvCLq4hUZif5XHX5+lNtIGpA
 nz+NW62kga+vf/jJat2Fj1CFYog1+zJ8aXotFFjvhzKtE5Eq/MmRRnRHRFRsLI0vQbH5
 FDCQy0nfzCR6/quKXmocd+d7FE8YPmgnjiWOlWFdL8jEwXielIuRbF0k9nN9sfSuduHZ
 lXTA==
X-Gm-Message-State: AOAM5313NVbw/x8s93rWjUuBpbE73HcPkHdbpLoqnG3CAGfBoIe0Qopa
 mYJkDKc56/9Xt1JROz4e8s/xXeSB62EBQ2cFoEW7onZps5JO87qn4SziUOa/Hz4DeYOwYpwDlCA
 p9Youae2PWdVeEzU=
X-Received: by 2002:adf:f144:: with SMTP id y4mr5713118wro.408.1616528217826; 
 Tue, 23 Mar 2021 12:36:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwH5ACdHtRmQQ8MHFIVQwWuIigvXuP0QGIj7c9G4+7/9DAPGl5fD1lJ/PWRuPKBbilr9kuhhw==
X-Received: by 2002:adf:f144:: with SMTP id y4mr5713096wro.408.1616528217618; 
 Tue, 23 Mar 2021 12:36:57 -0700 (PDT)
Received: from redhat.com (bzq-79-183-252-180.red.bezeqint.net.
 [79.183.252.180])
 by smtp.gmail.com with ESMTPSA id y18sm25322027wrq.61.2021.03.23.12.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 12:36:57 -0700 (PDT)
Date: Tue, 23 Mar 2021 15:36:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Subject: Re: [PATCH v2 3/3] acpi:piix4, vt82c686: reinitialize acpi PM device
 on reset
Message-ID: <20210323153624-mutt-send-email-mst@kernel.org>
References: <cover.1616519655.git.isaku.yamahata@intel.com>
 <a4ac127f85c6787cf8fdf0a002b9dc0f3a7e080b.1616519655.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
In-Reply-To: <a4ac127f85c6787cf8fdf0a002b9dc0f3a7e080b.1616519655.git.isaku.yamahata@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, Reinoud Zandijk <reinoud@netbsd.org>,
 aurelien@aurel32.net, pbonzini@redhat.com, imammedo@redhat.com,
 isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 23, 2021 at 10:24:31AM -0700, Isaku Yamahata wrote:
> Commit 6be8cf56bc8b made sure that SCI is enabled in PM1.CNT
> on reset in acpi_only mode by modifying acpi_pm1_cnt_reset() and
> that worked for q35 as expected.
> 
> The function was introduced by commit
>   eaba51c573a (acpi, acpi_piix, vt82c686: factor out PM1_CNT logic)
> that forgot to actually call it at piix4 reset time and as result
> SCI_EN wasn't set as was expected by 6be8cf56bc8b in acpi_only mode.
> 
> So Windows crashes when it notices that SCI_EN is not set and FADT is
> not providing information about how to enable it anymore.
> Reproducer:
>    qemu-system-x86_64 -enable-kvm -M pc-i440fx-6.0,smm=off -cdrom any_windows_10x64.iso
> 
> Fix it by calling acpi_pm1_cnt_reset() at piix4 reset time.
> 
> Occasionally this patch adds reset acpi PM related registers on
> piix4/vt582c686 reset time and de-assert sci.
> piix4_pm_realize() initializes acpi pm tmr, evt, cnt and gpe.
> via_pm_realize() initializes acpi pm tmr, evt and cnt.
> reset them on device reset. pm_reset() in ich9.c correctly calls
> corresponding reset functions.
> 
> Fixes: 6be8cf56bc8b (acpi/core: always set SCI_EN when SMM isn't supported)
> Reported-by: Reinoud Zandijk <reinoud@NetBSD.org>
> Co-developed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> ---
> CC: imammedo@redhat.com
> CC: isaku.yamahata@intel.com
> CC: mst@redhat.com
> CC: reinoud@NetBSD.org
> CC: isaku.yamahata@gmail.com
> CC: berrange@redhat.com
> CC: pbonzini@redhat.com
> CC: f4bug@amsat.org
> CC: aurelien@aurel32.net

Can you split acpi and vt82c686 changes to separate patches
please? This way we can merge them independently.

Thanks!

> ---
>  hw/acpi/piix4.c   | 7 +++++++
>  hw/isa/vt82c686.c | 5 +++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 6056d51667..8f8b0e95e5 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -326,6 +326,13 @@ static void piix4_pm_reset(DeviceState *dev)
>          /* Mark SMM as already inited (until KVM supports SMM). */
>          pci_conf[0x5B] = 0x02;
>      }
> +
> +    acpi_pm1_evt_reset(&s->ar);
> +    acpi_pm1_cnt_reset(&s->ar);
> +    acpi_pm_tmr_reset(&s->ar);
> +    acpi_gpe_reset(&s->ar);
> +    acpi_update_sci(&s->ar, s->irq);
> +
>      pm_io_space_update(s);
>      acpi_pcihp_reset(&s->acpi_pci_hotplug, !s->use_acpi_root_pci_hotplug);
>  }
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index f0fb309f12..98325bb32b 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -178,6 +178,11 @@ static void via_pm_reset(DeviceState *d)
>      /* SMBus IO base */
>      pci_set_long(s->dev.config + 0x90, 1);
>  
> +    acpi_pm1_evt_reset(&s->ar);
> +    acpi_pm1_cnt_reset(&s->ar);
> +    acpi_pm_tmr_reset(&s->ar);
> +    pm_update_sci(s);
> +
>      pm_io_space_update(s);
>      smb_io_space_update(s);
>  }
> -- 
> 2.25.1


