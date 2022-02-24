Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BBC4C3384
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 18:24:53 +0100 (CET)
Received: from localhost ([::1]:56022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNHrI-0003iZ-Eb
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 12:24:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nNHpz-00031L-0F
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 12:23:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nNHpv-0007Ic-3V
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 12:23:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645723405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SVfTJ6anb491OUOQYs/CQ4ePvlBqeMB+k1XPLSo5Mz0=;
 b=hdMfVvZHV9RuGWcIzHJ+07J55xold8T9YUOX1m0MnAfSwVMholblIJoYqgt9r+/opdx3BX
 sHW99cp/sbLRcIq1gYZjcFFvFEsJ8mYNaMPE3ly57/+x3aPE7okgdCvPSnp3oMthAnw2FM
 UlkbcNwnj19gnnEDnixpE7glYT5gxuc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-ssIEO3RYNMKB2PXse6atzg-1; Thu, 24 Feb 2022 12:23:22 -0500
X-MC-Unique: ssIEO3RYNMKB2PXse6atzg-1
Received: by mail-ej1-f70.google.com with SMTP id
 m4-20020a170906160400b006be3f85906eso1516785ejd.23
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 09:23:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SVfTJ6anb491OUOQYs/CQ4ePvlBqeMB+k1XPLSo5Mz0=;
 b=ospfWCpZ6EPGnb9ywrGyyumEI5QjwRtL5J9AK9EapEM0reQVI2JoTU2pznV1yq0QcI
 wwnOY471mIUwcCnBJPcmv9OZ6yK677sqFRMVc3aYE0bn/TopXiH2pdhEseXrwGOQMB87
 KPTQQzTOkCrvsezW0v1fNp2u7o8mPQgi3thWhQdXG9DArXrHOwBhnpU0I2pXMJiDMdIn
 Xx24zl3p5slYQ09f/HaYXjSnGQVip6XBys7aahsCXAFiq6I01lOJ7exWfk6yg9+zjK2/
 8m7qIjQOmm20EwJ+vAvV004b5iSEkkJGX5H23ElrALDCIhB5yMm+kwm0DyyFTcqUdpef
 GlCQ==
X-Gm-Message-State: AOAM531IUFwN6Q06OT0kKwDuVl8E9DhnUzD0aOndnpyVChmrVl0c2KMf
 KdievEe+h1PoXfSNlWN1pKEs3a/HqohtdG6JOiCZZY9anIjvkujjZwlFw1wKgEyLFYTUjDHrNbN
 DRWsdEriOF9cUhEc=
X-Received: by 2002:a17:906:d7aa:b0:6cf:1fb3:2986 with SMTP id
 pk10-20020a170906d7aa00b006cf1fb32986mr3166553ejb.594.1645723400886; 
 Thu, 24 Feb 2022 09:23:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6jWYULrdNpRc+hmqpkQSSxTYrBpnn7SMh2MHQyux+iJ5NiRMUce00wrD3fe6Dcb1E5FXnZQ==
X-Received: by 2002:a17:906:d7aa:b0:6cf:1fb3:2986 with SMTP id
 pk10-20020a170906d7aa00b006cf1fb32986mr3166526ejb.594.1645723400625; 
 Thu, 24 Feb 2022 09:23:20 -0800 (PST)
Received: from redhat.com ([2.55.165.55])
 by smtp.gmail.com with ESMTPSA id d25sm1643042ejz.4.2022.02.24.09.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 09:23:18 -0800 (PST)
Date: Thu, 24 Feb 2022 12:23:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v3 4/6] i386/pc: relocate 4g start to 1T where applicable
Message-ID: <20220224122146-mutt-send-email-mst@kernel.org>
References: <20220223184455.9057-1-joao.m.martins@oracle.com>
 <20220223184455.9057-5-joao.m.martins@oracle.com>
 <20220223161744-mutt-send-email-mst@kernel.org>
 <5fee0e05-e4d1-712b-9ad1-f009aba431ea@oracle.com>
 <c28ade30-fbea-4d3a-3b11-356c02abaabb@oracle.com>
MIME-Version: 1.0
In-Reply-To: <c28ade30-fbea-4d3a-3b11-356c02abaabb@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 24, 2022 at 04:07:22PM +0000, Joao Martins wrote:
> On 2/23/22 23:35, Joao Martins wrote:
> > On 2/23/22 21:22, Michael S. Tsirkin wrote:
> >>> +static void x86_update_above_4g_mem_start(PCMachineState *pcms,
> >>> +                                          uint64_t pci_hole64_size)
> >>> +{
> >>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
> >>> +    uint32_t eax, vendor[3];
> >>> +
> >>> +    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
> >>> +    if (!IS_AMD_VENDOR(vendor)) {
> >>> +        return;
> >>> +    }
> >>
> >> Wait a sec, should this actually be tying things to the host CPU ID?
> >> It's really about what we present to the guest though,
> >> isn't it?
> > 
> > It was the easier catch all to use cpuid without going into
> > Linux UAPI specifics. But it doesn't have to tie in there, it is only
> > for systems with an IOMMU present.
> > 
> >> Also, can't we tie this to whether the AMD IOMMU is present?
> >>
> > I think so, I can add that. Something like a amd_iommu_exists() helper
> > in util/vfio-helpers.c which checks if there's any sysfs child entries
> > that start with ivhd in /sys/class/iommu/. Given that this HT region is
> > hardcoded in iommu reserved regions since >=4.11 (to latest) I don't think it's
> > even worth checking the range exists in:
> > 
> > 	/sys/kernel/iommu_groups/0/reserved_regions
> > 
> > (Also that sysfs ABI is >= 4.11 only)
> 
> Here's what I have staged in local tree, to address your comment.
> 
> Naturally the first chunk is what's affected by this patch the rest is a
> precedessor patch to introduce qemu_amd_iommu_is_present(). Seems to pass
> all the tests and what not.
> 
> I am not entirely sure this is the right place to put such a helper, open
> to suggestions. wrt to the naming of the helper, I tried to follow the rest
> of the file's style.
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index a9be5d33a291..2ea4430d5dcc 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -868,10 +868,8 @@ static void x86_update_above_4g_mem_start(PCMachineState *pcms,
>                                            uint64_t pci_hole64_size)
>  {
>      X86MachineState *x86ms = X86_MACHINE(pcms);
> -    uint32_t eax, vendor[3];
> 
> -    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
> -    if (!IS_AMD_VENDOR(vendor)) {
> +    if (!qemu_amd_iommu_is_present()) {
>          return;
>      }
> 
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index 7bcce3bceb0f..eb4ea071ecec 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -637,6 +637,15 @@ char *qemu_get_host_name(Error **errp);
>   */
>  size_t qemu_get_host_physmem(void);
> 
> +/**
> + * qemu_amd_iommu_is_present:
> + *
> + * Operating system agnostic way of querying if an AMD IOMMU
> + * is present.
> + *
> + */
> +bool qemu_amd_iommu_is_present(void);
> +
>  /*
>   * Toggle write/execute on the pages marked MAP_JIT
>   * for the current thread.
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index f2be7321c59f..54cef21217c4 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -982,3 +982,32 @@ size_t qemu_get_host_physmem(void)
>  #endif
>      return 0;
>  }
> +
> +bool qemu_amd_iommu_is_present(void)
> +{
> +    bool found = false;
> +#ifdef CONFIG_LINUX
> +    struct dirent *entry;
> +    char *path;
> +    DIR *dir;
> +
> +    path = g_strdup_printf("/sys/class/iommu");
> +    dir = opendir(path);
> +    if (!dir) {
> +        g_free(path);
> +        return found;
> +    }
> +
> +    do {
> +            entry = readdir(dir);
> +            if (entry && !strncmp(entry->d_name, "ivhd", 4)) {
> +                found = true;
> +                break;
> +            }
> +    } while (entry);
> +
> +    g_free(path);
> +    closedir(dir);
> +#endif
> +    return found;
> +}

why are we checking whether an AMD IOMMU is present
on the host? Isn't what we care about whether it's
present in the VM? What we are reserving after all
is a range of GPAs, not actual host PA's ...



> diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> index af559ef3398d..c08826e7e19b 100644
> --- a/util/oslib-win32.c
> +++ b/util/oslib-win32.c
> @@ -652,3 +652,8 @@ size_t qemu_get_host_physmem(void)
>      }
>      return 0;
>  }
> +
> +bool qemu_amd_iommu_is_present(void)
> +{
> +    return false;
> +}


