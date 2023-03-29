Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D33B46CD164
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 07:04:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phNyr-0005eL-0o; Wed, 29 Mar 2023 01:04:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1phNyh-0005dm-Ar
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 01:04:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1phNyf-0007TK-9g
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 01:04:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680066244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yP0KyVKE+R1sUog5E8X20TxoAAGxmYFNRLauaZmRtJ0=;
 b=C49l81fVSIyHiTZSmCp7U+5WchRhBCt94lPx9g/eA6KW1Y2fKsiCsGrFwEq1Pre3vMpTZf
 HzKEAB5sL9TJ6GmPfD4K394ed2iVl2Ihiqh2XXzP2vNMrWhajc2Mxxpam0ZJJTzIzHfsAU
 Tyiv6R5/8o1dSp24jBdRjLFVmZWJOlk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-6G48kep-P22ptgClxLVNkw-1; Wed, 29 Mar 2023 01:04:03 -0400
X-MC-Unique: 6G48kep-P22ptgClxLVNkw-1
Received: by mail-wr1-f69.google.com with SMTP id
 d18-20020adfa412000000b002d43970bb80so1311365wra.6
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 22:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680066242;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yP0KyVKE+R1sUog5E8X20TxoAAGxmYFNRLauaZmRtJ0=;
 b=TdV20+1Xd4Yosqw4HImbZGJ6RLq0BB8fDTuz4TbosiOMGwVm1wk5Tyms7sdtYRl2QM
 2X9QKrYkL/PoFWbhL5EX9q8Oq5JRQH78sC35xdEh5iweE4PTLHeF3RSXxeTtVRnfshUG
 QGTQEpDxTcfOjInBAd6TZSRWmxh6pJtH/BesQUyg4oqGTscszMzA304AdnoQLwFHYll4
 3uguO7b+0P8zfUHzYyV1kJpSKQmtVfQEm779jgwVBLhJYAY6eIGd6sMgNroxQ9pLETZS
 PWon6Bv3xcqShiwdqF0BRs2CnhHkJYCy8xUYFmL0v/6YSIzMbTtTm0wO/MB6m+yWKbuN
 o+Rw==
X-Gm-Message-State: AAQBX9cri0YOjMjHNFiuyR2XWeGUIQYB3ZWNcqrMSMBooeP3RhH4fdxU
 mKEuKZPq/DGv4i6fChtas+F62YUyyTaXyAWZ4T+/d9NrvSRtYf9f3RVm+K91+QjTHMqcIIXCuHH
 btzCK6snxZkuk3f4=
X-Received: by 2002:a05:6000:10:b0:2ce:a6f6:edca with SMTP id
 h16-20020a056000001000b002cea6f6edcamr12814290wrx.55.1680066241948; 
 Tue, 28 Mar 2023 22:04:01 -0700 (PDT)
X-Google-Smtp-Source: AKy350aetzuCS/1dqddtIrgIz2NuABICFRacL21RPd/W1pWjL7kfC9yKvGyEskwRE8WoVYb7rDQuVg==
X-Received: by 2002:a05:6000:10:b0:2ce:a6f6:edca with SMTP id
 h16-20020a056000001000b002cea6f6edcamr12814272wrx.55.1680066241651; 
 Tue, 28 Mar 2023 22:04:01 -0700 (PDT)
Received: from redhat.com ([2.52.18.165]) by smtp.gmail.com with ESMTPSA id
 k10-20020a5d6e8a000000b002d1daafea30sm29066230wrz.34.2023.03.28.22.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 22:04:01 -0700 (PDT)
Date: Wed, 29 Mar 2023 01:03:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: shannon.zhaosl@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, boris.ostrovsky@oracle.com
Subject: Re: [PATCH 2/2] hw/acpi: i386: bump MADT to revision 5
Message-ID: <20230329010126-mutt-send-email-mst@kernel.org>
References: <20230328155926.2277-1-eric.devolder@oracle.com>
 <20230328155926.2277-3-eric.devolder@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230328155926.2277-3-eric.devolder@oracle.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Mar 28, 2023 at 11:59:26AM -0400, Eric DeVolder wrote:
> Currently i386 QEMU generates MADT revision 3, and reports
> MADT revision 1. ACPI 6.3 introduces MADT revision 5.
> 
> For MADT revision 4, that introduces ARM GIC structures, which do
> not apply to i386.
> 
> For MADT revision 5, the Local APIC flags introduces the Online
> Capable bitfield.
> 
> Making MADT generate and report revision 5 will solve problems with
> CPU hotplug (the Online Capable flag indicates hotpluggable CPUs).
> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

I am looking for ways to reduce risk of breakage with this.
We don't currently have a reason to change it if cpu
hotplug is off, do we? Maybe make it conditional on that.





> ---
>  hw/i386/acpi-common.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> index 52e5c1439a..1e3a13a36c 100644
> --- a/hw/i386/acpi-common.c
> +++ b/hw/i386/acpi-common.c
> @@ -38,8 +38,15 @@ void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
>  {
>      uint32_t apic_id = apic_ids->cpus[uid].arch_id;
>      /* Flags – Local APIC Flags */
> -    uint32_t flags = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
> -                     1 /* Enabled */ : 0;
> +    bool enabled = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
> +                     true /* Enabled */ : false;
> +    /*
> +     * ACPI 6.3 5.2.12.2 Local APIC Flags: OnlineCapable must be 0
> +     * if Enabled is set.
> +     */
> +    bool onlinecapable = enabled ? false : true; /* Online Capable */
> +    uint32_t flags = onlinecapable ? 0x2 : 0x0 |
> +        enabled ? 0x1 : 0x0;
>  
>      /* ACPI spec says that LAPIC entry for non present
>       * CPU may be omitted from MADT or it must be marked
> @@ -102,7 +109,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
>      MachineClass *mc = MACHINE_GET_CLASS(x86ms);
>      const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
>      AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
> -    AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = oem_id,
> +    AcpiTable table = { .sig = "APIC", .rev = 5, .oem_id = oem_id,
>                          .oem_table_id = oem_table_id };
>  
>      acpi_table_begin(&table, table_data);
> -- 
> 2.31.1
> 
> 
> 


