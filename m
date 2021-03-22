Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF6F3452AE
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 00:00:15 +0100 (CET)
Received: from localhost ([::1]:54740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOTWw-0006Ss-NK
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 19:00:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTUM-0005Gw-N6
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 18:57:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTUK-0008JB-VP
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 18:57:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616453852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xF2IE2WmY5o+uVdaqoP82jKbC/PcLehJchwXoLPSH+E=;
 b=GeKDA8EyBLFINJZLgluooEUhMIo59gJenPQ8b7myTHMRVHsyI9MvkDXpWQIfJnUUeC7qk8
 c8I9Pav3z8gJbDmbHguRygHltSKu+0lY/w+doxEZD9It4XPcJ++Z//ArgKAZlHpLwSn1vN
 7QxMqfxXMQa604upkxFAFavF5Ag1Q3E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-2FT0sDi1M9GtT0os8hM5yg-1; Mon, 22 Mar 2021 18:57:30 -0400
X-MC-Unique: 2FT0sDi1M9GtT0os8hM5yg-1
Received: by mail-wr1-f72.google.com with SMTP id b6so136554wrq.22
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 15:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xF2IE2WmY5o+uVdaqoP82jKbC/PcLehJchwXoLPSH+E=;
 b=Dobjl9jaue6xIZH385zEZdOL2B5XO2yllv6vGH/iWmSV7AAFbBj5/dunMQ1hMoXVZv
 QRbfjIiX0XUElqhd0imAvTp7MtvbKEAV9ALH9esHw2U57xTiTxKqDqxE7h0pEdPUs7ZE
 Fz4lEolj2iobcG3kbBQ0FPqZqd8w3N8ZXRqKiUgw1WpwfoUonQxWPe+ggneMyY4czctS
 NS7yo+bhdGb7pYp1+PSTq5S9tVZkaQNwzykwo/qyT7Z4Fx2k7eDnrfxLfwE+ZlEDaKxB
 /KHfuNgJ6EuGY919kdRZHSeJx7Mte0l03A0Cybm5osERtiPeNQp7lHdlmeckVVT2Bv6n
 a4yQ==
X-Gm-Message-State: AOAM530jRqcfSuSpDvq/XFAqmdeG1/tda+E9mThHkF2LLGEDeU0jtsg/
 cY511877BgJCUzSOhlil1URXS53zORfMzdBGoT8AdKrAwrWtWf78uIl99gM4Qw5vmlYiB+GOmC7
 ZgpFJBVaFhcMUx8s=
X-Received: by 2002:a05:6000:124f:: with SMTP id
 j15mr781513wrx.263.1616453849045; 
 Mon, 22 Mar 2021 15:57:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrTgUZUTnCYK97DMsOCHMXQmrBBkIImfA5r06nTdsdbCjWdAKyOBjYXCd7MfnaR9C+M28DiA==
X-Received: by 2002:a05:6000:124f:: with SMTP id
 j15mr781509wrx.263.1616453848904; 
 Mon, 22 Mar 2021 15:57:28 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id a4sm6531361wrx.86.2021.03.22.15.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 15:57:28 -0700 (PDT)
Date: Mon, 22 Mar 2021 18:57:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: isaku.yamahata@gmail.com
Subject: Re: [PATCH] acpi:piix4, vt82c686: reinitialize acpi PM device on reset
Message-ID: <20210322185659-mutt-send-email-mst@kernel.org>
References: <20210317104146.784de0c1@redhat.com>
 <1ceb31c6782f701674d3b907a419f5a82adb37bc.1616012290.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
In-Reply-To: <1ceb31c6782f701674d3b907a419f5a82adb37bc.1616012290.git.isaku.yamahata@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
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
Cc: isaku.yamahata@intel.com, berrange@redhat.com, qemu-devel@nongnu.org,
 f4bug@amsat.org, Reinoud Zandijk <reinoud@netbsd.org>, pbonzini@redhat.com,
 Igor Mammedov <imammedo@redhat.com>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 17, 2021 at 02:49:31PM -0700, isaku.yamahata@gmail.com wrote:
> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
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

Caused regressions reported by Peter. Pls reproduce and debug, then
repost. Thanks!

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
> ---
>  hw/acpi/piix4.c   | 7 +++++++
>  hw/isa/vt82c686.c | 5 +++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 1efc0ded9f..a00525025b 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -325,6 +325,13 @@ static void piix4_pm_reset(DeviceState *dev)
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
> index 05d084f698..7bacad03e2 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -167,6 +167,11 @@ static void via_pm_reset(DeviceState *d)
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


