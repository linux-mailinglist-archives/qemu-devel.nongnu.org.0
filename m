Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FBA30BBC0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 11:07:48 +0100 (CET)
Received: from localhost ([::1]:58598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6sb6-0005Lb-35
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 05:07:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1l6sZP-0004lt-BH
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 05:06:04 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:44620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1l6sZN-0001Mu-DF
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 05:06:03 -0500
Received: by mail-ed1-x531.google.com with SMTP id c2so22167538edr.11
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 02:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version; bh=tsDYwwHg+3mPx+C3jfQdbzfQ3OfjS+LOH8Ok9Z4hDns=;
 b=tNIaZWLvhVSZQ6WK9aQHxp47Kq1O1aM5hKs3EKKTFrt3ykUNibVd5w1fslLyJKVIKF
 Fx+dGCoBSVTKY6lCMVZfY2ORB3daF3G3tw+td8/uy+kxyKbsiVUCOI/bYP9axdqLt86u
 GZO2zfjt6f/SuqJz3dZuQ0XxRn73oaT8P+Fc5a2OBDTWIAe7cIhTV+Yy9g9SNSfavd5g
 EdlBOKre87/JNlZZ5J5TXbW0g7+lAfWWJHPLPDF7AX+PY5ivLyslZXBicqOQgrNAvlTg
 cqv7J0TChCB/AHsj9h5D1OPvIJ5l2Nsbm4FNO50jBmDWsgShZ437dsBSf5hzZ4PAiTLW
 56kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version;
 bh=tsDYwwHg+3mPx+C3jfQdbzfQ3OfjS+LOH8Ok9Z4hDns=;
 b=M2uwlZNcuydvMKFJIjrozaN/G84tPrOiYfG3SevUvG69HPqNQ18odwu1mZJJ1zdRMe
 wrJ/07smZUHGi17BxyZHG9u4pdXxHi69mhEyQ07cEpHNGEWbBia8vbbLycQj7cnSG/4x
 xr1MWkbPHJFrz5fjIQ7i3Qrh6e1BpDszVrx9ntterBEs+jVQY2SbEdC174SOSpX3qRTu
 LkWL+vaEjnl85nEV4lzkBzruo78hCUOMLM+RkldoQwIVuIAXWg+bfbj76Qu9HUVNKaaA
 T6aHF7rZSqdqiHUuSeVDYe/Z35UBBv5amzcNZhCoIXABvS3QsttL4t3QUUGPtn068fR3
 mA8Q==
X-Gm-Message-State: AOAM530TP/gvfWhUpzdvLRV3ZILDTDbouKVSvGjNb+Gna0isQGNJ+67x
 9u2O0NpUyW0KmdlzpR3cQnhJZW6JMpyu8zbxgAI=
X-Google-Smtp-Source: ABdhPJxZffidjZ2McqAX4Erk6+6ZVNyVhdGmtK/8Y2AkYAO3L9OOBrKts42PHlQiQskWc1SMvXVgDA==
X-Received: by 2002:a50:ed97:: with SMTP id h23mr22376378edr.278.1612260359474; 
 Tue, 02 Feb 2021 02:05:59 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id u9sm9225865ejc.57.2021.02.02.02.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 02:05:59 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id ba98a585;
 Tue, 2 Feb 2021 10:05:58 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/2] pci: add romsize property
In-Reply-To: <20210129192838.582771-3-pbonzini@redhat.com>
References: <20210129192838.582771-1-pbonzini@redhat.com>
 <20210129192838.582771-3-pbonzini@redhat.com>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
X-Now-Playing: Peter Gabriel - Up: No Way Out
Date: Tue, 02 Feb 2021 10:05:57 +0000
Message-ID: <cunpn1ilr7e.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: neutral client-ip=2a00:1450:4864:20::531;
 envelope-from=dme@dme.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: lersek@redhat.com, dgilbert@redhat.com, peterx@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Friday, 2021-01-29 at 20:28:38 +01, Paolo Bonzini wrote:

> This property can be useful for distros to set up known-good ROM sizes for
> migration purposes.  The VM will fail to start if the ROM is too large,
> and migration compatibility will not be broken if the ROM is too small.
>
> Note that even though romsize is a uint32_t, it has to be between 1
> (because empty ROM files are not accepted, and romsize must be greater
> than the file) and 2^31 (because values above are not powers of two and
> are rejected).
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/pci/pci.c             | 19 +++++++++++++++++--
>  hw/xen/xen_pt_load_rom.c | 14 ++++++++++++--
>  include/hw/pci/pci.h     |  1 +
>  3 files changed, 30 insertions(+), 4 deletions(-)
>
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index bbce10050b..5b3fe3c294 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -68,6 +68,7 @@ static void pcibus_reset(BusState *qbus);
>  static Property pci_props[] = {
>      DEFINE_PROP_PCI_DEVFN("addr", PCIDevice, devfn, -1),
>      DEFINE_PROP_STRING("romfile", PCIDevice, romfile),
> +    DEFINE_PROP_UINT32("romsize", PCIDevice, romsize, -1),
>      DEFINE_PROP_UINT32("rombar",  PCIDevice, rom_bar, 1),
>      DEFINE_PROP_BIT("multifunction", PCIDevice, cap_present,
>                      QEMU_PCI_CAP_MULTIFUNCTION_BITNR, false),
> @@ -2107,6 +2108,11 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
>      bool is_default_rom;
>      uint16_t class_id;
>  
> +    if (pci_dev->romsize != -1 && !is_power_of_2(pci_dev->romsize)) {
> +        error_setg(errp, "ROM size %d is not a power of two", pci_dev->romsize);
> +        return;

It would be nice to be consistent with the format type when reporting
errors - it's %d here...

> +    }
> +
>      /* initialize cap_present for pci_is_express() and pci_config_size(),
>       * Note that hybrid PCIs are not set automatically and need to manage
>       * QEMU_PCI_CAP_EXPRESS manually */
> @@ -2372,7 +2378,16 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>          g_free(path);
>          return;
>      }
> -    size = pow2ceil(size);
> +    if (pdev->romsize != -1) {
> +        if (size > pdev->romsize) {
> +            error_setg(errp, "romfile \"%s\" (%u bytes) is too large for ROM size %u",
> +                       pdev->romfile, (uint32_t)size, pdev->romsize);

%u here...

> +            g_free(path);
> +            return;
> +        }
> +    } else {
> +        pdev->romsize = pow2ceil(size);
> +    }
>  
>      vmsd = qdev_get_vmsd(DEVICE(pdev));
>  
> @@ -2382,7 +2397,7 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>          snprintf(name, sizeof(name), "%s.rom", object_get_typename(OBJECT(pdev)));
>      }
>      pdev->has_rom = true;
> -    memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, size, &error_fatal);
> +    memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize, &error_fatal);
>      ptr = memory_region_get_ram_ptr(&pdev->rom);
>      if (load_image_size(path, ptr, size) < 0) {
>          error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
> diff --git a/hw/xen/xen_pt_load_rom.c b/hw/xen/xen_pt_load_rom.c
> index a50a80837e..153812f8cd 100644
> --- a/hw/xen/xen_pt_load_rom.c
> +++ b/hw/xen/xen_pt_load_rom.c
> @@ -53,10 +53,20 @@ void *pci_assign_dev_load_option_rom(PCIDevice *dev,
>      }
>      fseek(fp, 0, SEEK_SET);
>  
> +    if (dev->romsize != -1) {
> +        if (st.st_size > dev->romsize) {
> +            error_report("ROM BAR \"%s\" (%ld bytes) is too large for ROM size %d",

%d here...

> +                         rom_file, (long) st.st_size, dev->romsize);
> +            goto close_rom;
> +        }
> +    } else {
> +        dev->romsize = st.st_size;
> +    }
> +
>      snprintf(name, sizeof(name), "%s.rom", object_get_typename(owner));
> -    memory_region_init_ram(&dev->rom, owner, name, st.st_size, &error_abort);
> +    memory_region_init_ram(&dev->rom, owner, name, dev->romsize, &error_abort);
>      ptr = memory_region_get_ram_ptr(&dev->rom);
> -    memset(ptr, 0xff, st.st_size);
> +    memset(ptr, 0xff, dev->romsize);
>  
>      if (!fread(ptr, 1, st.st_size, fp)) {
>          error_report("pci-assign: Cannot read from host %s", rom_file);
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 259f9c992d..b028245b62 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -343,6 +343,7 @@ struct PCIDevice {
>  
>      /* Location of option rom */
>      char *romfile;
> +    uint32_t romsize;
>      bool has_rom;
>      MemoryRegion rom;
>      uint32_t rom_bar;
> -- 
> 2.29.2

dme.
-- 
Tell her I'll be waiting, in the usual place.

