Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DED53931F
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 16:24:52 +0200 (CEST)
Received: from localhost ([::1]:55310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw2ni-0006QO-OL
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 10:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nw2jy-0003yR-L5
 for qemu-devel@nongnu.org; Tue, 31 May 2022 10:20:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nw2jv-00032k-Ga
 for qemu-devel@nongnu.org; Tue, 31 May 2022 10:20:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654006854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e1KCPm5wT2W53PpXh4IpPnTHKPSdtP0rg3RYlSJZpCE=;
 b=P87GKrlc9ghz+fkd/stG8rsRFf7X9A80IL7bUgyBRdEBLlHpaS9yeoZ+p0q7JYgflqo4Dd
 9/JsiBhWNAgn3Gk+VRCcdVVWAdRxKQEyF/hwqSHX6IHRw2TNVoT5V1BdffKM/3CI0hL0KG
 6jeXTrmnysxvTCaNnR296FB4GrFvWJk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-hFOs38iiNVq2Ic30xpAjLA-1; Tue, 31 May 2022 10:20:52 -0400
X-MC-Unique: hFOs38iiNVq2Ic30xpAjLA-1
Received: by mail-wm1-f72.google.com with SMTP id
 l15-20020a05600c1d0f00b003973901d3b4so6112101wms.2
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 07:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=e1KCPm5wT2W53PpXh4IpPnTHKPSdtP0rg3RYlSJZpCE=;
 b=4m6PO17uUV8oOLjs8EOfPerTgDZliZ2e0E/d8INPOBfD+m/13LtUxEVhD7cYLJNHRA
 obtQzEC2FYVv7jObqNVnDGc4mvRCJht3kja3ZozkPLTIFVgeUCP77s7jTNaPJbcqSc/P
 ogi/pLQ71cXk6oiXNrkcleYR2LYj5hVLDyTCZ3wvjFmfmfeZA0RW7evAzUuJAOMvLyWZ
 XqL1iBO3npjrkEGx0byI6EpMGT+w+6FOz6uwPfxrGHLEPbwaaFgVepABZB5i7rcYzWOS
 rA+wfmjbgWkoey7GUug5/eaNmpD5o88/mzLDeONp60c1RKbzlaxtZizxqhQEkXtUxS2i
 teuA==
X-Gm-Message-State: AOAM530q6qyugyB+4dR+M5Xjlg6JzRhMuxHqKgMXamndjANYq2hXTkNn
 CyoPKhP9ka20jl+88Hg/98LB9qe0d/c5Z2tWU0mFc2ua1dH7hA1aJn2dB4dGKinQk43pW26ojUw
 LjfDzh1EmnYRfdBM=
X-Received: by 2002:a05:6000:156f:b0:20f:d444:dcd with SMTP id
 15-20020a056000156f00b0020fd4440dcdmr38284061wrz.223.1654006851425; 
 Tue, 31 May 2022 07:20:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhUku61xIUw3a9QI5S4Rx8JyfsoTtW52ji4237uiklYBkhIB6T3yWXseea66yrTrlBKSnoiQ==
X-Received: by 2002:a05:6000:156f:b0:20f:d444:dcd with SMTP id
 15-20020a056000156f00b0020fd4440dcdmr38284035wrz.223.1654006851120; 
 Tue, 31 May 2022 07:20:51 -0700 (PDT)
Received: from redhat.com ([2.52.157.68]) by smtp.gmail.com with ESMTPSA id
 t1-20020adfe101000000b0020d110bc39esm11794621wrz.64.2022.05.31.07.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 07:20:50 -0700 (PDT)
Date: Tue, 31 May 2022 10:20:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org,
 Dario Faggioli <dfaggioli@suse.com>,
 Martin =?utf-8?B?TGnFoWth?= <martin.liska@suse.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Dario Faggioli <DarioFaggiolidfaggioli@suse.com>, qemu-stable@nongnu.org
Subject: Re: [PATCH] pci: fix overflow in snprintf string formatting
Message-ID: <20220531102036-mutt-send-email-mst@kernel.org>
References: <20220531114707.18830-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220531114707.18830-1-cfontana@suse.de>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, May 31, 2022 at 01:47:07PM +0200, Claudio Fontana wrote:
> the code in pcibus_get_fw_dev_path contained the potential for a
> stack buffer overflow of 1 byte, potentially writing to the stack an
> extra NUL byte.
> 
> This overflow could happen if the PCI slot is >= 0x10000000,
> and the PCI function is >= 0x10000000, due to the size parameter
> of snprintf being incorrectly calculated in the call:
> 
>     if (PCI_FUNC(d->devfn))
>         snprintf(path + off, sizeof(path) + off, ",%x", PCI_FUNC(d->devfn));
> 
> since the off obtained from a previous call to snprintf is added
> instead of subtracted from the total available size of the buffer.
> 
> Without the accurate size guard from snprintf, we end up writing in the
> worst case:
> 
> name (32) + "@" (1) + SLOT (8) + "," (1) + FUNC (8) + term NUL (1) = 51 bytes
> 
> In order to provide something more robust, replace all of the code in
> pcibus_get_fw_dev_path with a single call to g_strdup_printf,
> so there is no need to rely on manual calculations.
> 
> Found by compiling QEMU with FORTIFY_SOURCE=3 as the error:
> 
> *** buffer overflow detected ***: terminated
> 
> Thread 1 "qemu-system-x86" received signal SIGABRT, Aborted.
> [Switching to Thread 0x7ffff642c380 (LWP 121307)]
> 0x00007ffff71ff55c in __pthread_kill_implementation () from /lib64/libc.so.6
> (gdb) bt
>  #0  0x00007ffff71ff55c in __pthread_kill_implementation () at /lib64/libc.so.6
>  #1  0x00007ffff71ac6f6 in raise () at /lib64/libc.so.6
>  #2  0x00007ffff7195814 in abort () at /lib64/libc.so.6
>  #3  0x00007ffff71f279e in __libc_message () at /lib64/libc.so.6
>  #4  0x00007ffff729767a in __fortify_fail () at /lib64/libc.so.6
>  #5  0x00007ffff7295c36 in  () at /lib64/libc.so.6
>  #6  0x00007ffff72957f5 in __snprintf_chk () at /lib64/libc.so.6
>  #7  0x0000555555b1c1fd in pcibus_get_fw_dev_path ()
>  #8  0x0000555555f2bde4 in qdev_get_fw_dev_path_helper.constprop ()
>  #9  0x0000555555f2bd86 in qdev_get_fw_dev_path_helper.constprop ()
>  #10 0x00005555559a6e5d in get_boot_device_path ()
>  #11 0x00005555559a712c in get_boot_devices_list ()
>  #12 0x0000555555b1a3d0 in fw_cfg_machine_reset ()
>  #13 0x0000555555bf4c2d in pc_machine_reset ()
>  #14 0x0000555555c66988 in qemu_system_reset ()
>  #15 0x0000555555a6dff6 in qdev_machine_creation_done ()
>  #16 0x0000555555c79186 in qmp_x_exit_preconfig.part ()
>  #17 0x0000555555c7b459 in qemu_init ()
>  #18 0x0000555555960a29 in main ()
> 
> Found-by: Dario Faggioli <Dario Faggioli <dfaggioli@suse.com>
> Found-by: Martin Liška <martin.liska@suse.com>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Claudio Fontana <cfontana@suse.de>

Queued, thanks!

> ---
>  hw/pci/pci.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index a9b37f8000..6e7015329c 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2640,15 +2640,15 @@ static char *pci_dev_fw_name(DeviceState *dev, char *buf, int len)
>  static char *pcibus_get_fw_dev_path(DeviceState *dev)
>  {
>      PCIDevice *d = (PCIDevice *)dev;
> -    char path[50], name[33];
> -    int off;
> -
> -    off = snprintf(path, sizeof(path), "%s@%x",
> -                   pci_dev_fw_name(dev, name, sizeof name),
> -                   PCI_SLOT(d->devfn));
> -    if (PCI_FUNC(d->devfn))
> -        snprintf(path + off, sizeof(path) + off, ",%x", PCI_FUNC(d->devfn));
> -    return g_strdup(path);
> +    char name[33];
> +    int has_func = !!PCI_FUNC(d->devfn);
> +
> +    return g_strdup_printf("%s@%x%s%.*x",
> +                           pci_dev_fw_name(dev, name, sizeof(name)),
> +                           PCI_SLOT(d->devfn),
> +                           has_func ? "," : "",
> +                           has_func,
> +                           PCI_FUNC(d->devfn));
>  }
>  
>  static char *pcibus_get_dev_path(DeviceState *dev)
> -- 
> 2.26.2


