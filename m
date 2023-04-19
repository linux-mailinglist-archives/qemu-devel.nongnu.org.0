Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B8A6E72A3
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 07:32:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp0PT-0001Hj-0e; Wed, 19 Apr 2023 01:31:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pp0PP-0001HN-VC
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 01:31:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pp0PN-0000xB-VB
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 01:31:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681882267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X7P20zMft03/QtI4a2h8bHRgl8d+BbRt0aljLaAsMJI=;
 b=UlL6RBC90OxiDD5JpE+fK6srlbGicJuwciIx2plJD2bjENify6EFX2iFdPZASwmH0Mh9cG
 iniQuCVwerOAgdXqgX+RFuJafkOTNoi44heLLP+DmU6k+h5eRFysJDafVmFWMSkHdlofmB
 yLhGQBob0AaofZX+QKznTj6eFg3MaY0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-wcs2Ty-zMMSEJYpkZq6zVw-1; Wed, 19 Apr 2023 01:31:04 -0400
X-MC-Unique: wcs2Ty-zMMSEJYpkZq6zVw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f0b0c85c4fso49223505e9.0
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 22:31:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681882263; x=1684474263;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X7P20zMft03/QtI4a2h8bHRgl8d+BbRt0aljLaAsMJI=;
 b=RWM96y7jUbT0I3BCzmItlS8Efs7AIctdTS/QM/YJdbQIreAgBdYvg9lowAJQC/alxM
 w4DjfD2PRDMqW4224zrwlbDY2kk2mTvy2QJGInMWiAwDybgrCjbxNKuAphf74uw6XgGh
 5n3/gjNLgAaUXQLdhIasK+H961oY6pYmb7xtw7Ou9C5iZktE5Uo80scYNtcvLlwUYUiV
 LSp0G19YabKuetqve44vhOcOKjyrPPFDmoE5AlBLL6OLtPaCPDIXWynU4/VFaq+Mfpw4
 ffhN5qoLAUotdApapNbUdA/RtpL2WgtuP4OLld94SpfW/Hn0qufCtMkd6JvK1jr5yTO4
 0c4g==
X-Gm-Message-State: AAQBX9dsC7LGf9MYkh0y0Znx/kbm7m024mhRk/wjDeooeRI6nRfVDnw+
 f082TKuqyJ56obRIxXZH17kZ9t0oyudcFv+1HduE6hp2hTFT7qtD5gYRle+MyrObwApHyQq7sEz
 Btzj57kvbMsuEPSc=
X-Received: by 2002:a05:6000:12cf:b0:2ef:b257:b46c with SMTP id
 l15-20020a05600012cf00b002efb257b46cmr843271wrx.29.1681882263314; 
 Tue, 18 Apr 2023 22:31:03 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZPu72QoxURQUhCtJ4oQMWWpVkrAn7sBiubuAlcZBjtqmzCQyuCKqmqlUhJviIBh9tawt1cpA==
X-Received: by 2002:a05:6000:12cf:b0:2ef:b257:b46c with SMTP id
 l15-20020a05600012cf00b002efb257b46cmr843251wrx.29.1681882263020; 
 Tue, 18 Apr 2023 22:31:03 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1fc:3571:9b25:3dfd:20fa:b195])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a05600c211300b003f17a00c214sm952379wml.16.2023.04.18.22.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 22:31:02 -0700 (PDT)
Date: Wed, 19 Apr 2023 01:30:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: shannon.zhaosl@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, boris.ostrovsky@oracle.com
Subject: Re: [PATCH v2 2/4] hw/acpi: arm: bump MADT to revision 5
Message-ID: <20230419012905-mutt-send-email-mst@kernel.org>
References: <20230418165219.2036-1-eric.devolder@oracle.com>
 <20230418165219.2036-3-eric.devolder@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418165219.2036-3-eric.devolder@oracle.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Apr 18, 2023 at 12:52:17PM -0400, Eric DeVolder wrote:
> Currently ARM QEMU generates, and reports, MADT revision 4. ACPI 6.3
> introduces MADT revision 5.
> 
> For MADT revision 5, the GICC structure adds an SPE Overflow Interrupt
> field. This new 2-byte field is created from the existing 3-byte
> Reserved field. The spec indicates if the SPE overflow interrupt is
> not supported, to zero the field.
> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

So why do we bother changing this? I'd rather defer until
we actually intend to fill this field.

> ---
>  hw/arm/virt-acpi-build.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 4156111d49..23268dd981 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -705,7 +705,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      int i;
>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>      const MemMapEntry *memmap = vms->memmap;
> -    AcpiTable table = { .sig = "APIC", .rev = 4, .oem_id = vms->oem_id,
> +    AcpiTable table = { .sig = "APIC", .rev = 5, .oem_id = vms->oem_id,
>                          .oem_table_id = vms->oem_table_id };
>  
>      acpi_table_begin(&table, table_data);
> @@ -763,7 +763,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          /* Processor Power Efficiency Class */
>          build_append_int_noprefix(table_data, 0, 1);
>          /* Reserved */
> -        build_append_int_noprefix(table_data, 0, 3);
> +        build_append_int_noprefix(table_data, 0, 1);
> +        /* SPE overflow Interrupt */
> +        build_append_int_noprefix(table_data, 0, 2);
>      }
>  
>      if (vms->gic_version != VIRT_GIC_VERSION_2) {
> -- 
> 2.31.1


