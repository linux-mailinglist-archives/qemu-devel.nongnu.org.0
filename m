Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C3B6E7D85
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 16:58:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp9Eh-0006RK-RW; Wed, 19 Apr 2023 10:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pp9Ee-0006Qi-Rs
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 10:56:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pp9Ec-0002PQ-S2
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 10:56:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681916196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cRT+JlplELgWdlQU/jQYf7SkUZSL0rR4DAxc+aB1O3Q=;
 b=RYg2euEN/KdfaF7oG+EGO2GqwOz0ylQ/0Uv6NkCHOgdz1LkRbPp0a2n7IYaJAgglweHusz
 gKfYTrZT+hBK3RDGVtwOPMmytLkrisOv6n8tf6CluRtzg//9k3KT7uQkmJQs1r5tMROl3R
 n/BffopY+/7PyjGitWZZn5oBbYlAR1c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-N0EQZLNzMVSnjgTSAxFl1A-1; Wed, 19 Apr 2023 10:56:35 -0400
X-MC-Unique: N0EQZLNzMVSnjgTSAxFl1A-1
Received: by mail-wm1-f72.google.com with SMTP id
 h8-20020a05600c314800b003f170ffbe44so4251673wmo.3
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 07:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681916194; x=1684508194;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cRT+JlplELgWdlQU/jQYf7SkUZSL0rR4DAxc+aB1O3Q=;
 b=kJgj0oEkOnYITZvoUb4opEi/QPhru1o9pH2cXmJLWoGk5TM4sfpnASYmp2rpPHSBIM
 cM4xVdHZLCFhHx9LxuF5KlGDD8gBkYtPe8rtfAEcuq8EzmhYckGWmkjmXkdY3jKUpYAU
 qg0rSRdRZKSMDVWwuvpLVnKuGyPHvdIKKc1IBH4v1YUXHUszwnGD0U6TZVET0CnRslCv
 awvwx/XM/hzOz+ZLlNEiN7xUDDX3MZx5qwqNc4FiEjIL96kizqNHj6KQ8xitCe+2JC61
 wpV89E/DL1WJNSjlT3uoVUq+lScf4PJoewKgjIGjzbvowaGx6KmDgwkWN7vb+c5gyvcA
 abaw==
X-Gm-Message-State: AAQBX9fzfA0XKrd+5jM1mfp3E2+JIae2dUwXOT7TMokVzZjuFG0TtNVm
 iGMGFuTXt/jbL8NhAl7zRKNc40qyxgUQkYo5FEgJ2em3XfAYBDQg2ez+sIV642KEnKe+/qbgsX9
 tj295LvTyHfYzSAM=
X-Received: by 2002:a1c:7c15:0:b0:3f0:b095:15d9 with SMTP id
 x21-20020a1c7c15000000b003f0b09515d9mr13505115wmc.40.1681916193836; 
 Wed, 19 Apr 2023 07:56:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350aUkEFPBXfL2ddERLQji5glxUJhHVXtheWOr8y/Orii9ko6JX8UgvikkYYoeRl63cL7ese10A==
X-Received: by 2002:a1c:7c15:0:b0:3f0:b095:15d9 with SMTP id
 x21-20020a1c7c15000000b003f0b09515d9mr13505101wmc.40.1681916193503; 
 Wed, 19 Apr 2023 07:56:33 -0700 (PDT)
Received: from redhat.com ([2a06:c701:742d:fd00:c847:221d:9254:f7ce])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a7bc448000000b003f179fc6d8esm2398995wmi.44.2023.04.19.07.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 07:56:32 -0700 (PDT)
Date: Wed, 19 Apr 2023 10:56:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: shannon.zhaosl@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, boris.ostrovsky@oracle.com
Subject: Re: [PATCH v2 3/4] hw/acpi: i386: bump MADT to revision 5
Message-ID: <20230419105515-mutt-send-email-mst@kernel.org>
References: <20230418165219.2036-1-eric.devolder@oracle.com>
 <20230418165219.2036-4-eric.devolder@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230418165219.2036-4-eric.devolder@oracle.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Apr 18, 2023 at 12:52:18PM -0400, Eric DeVolder wrote:
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
> Link: https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.devolder@oracle.com/T/#t
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  hw/i386/acpi-common.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> index 52e5c1439a..286c1c5c32 100644
> --- a/hw/i386/acpi-common.c
> +++ b/hw/i386/acpi-common.c
> @@ -38,8 +38,15 @@ void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
>  {
>      uint32_t apic_id = apic_ids->cpus[uid].arch_id;
>      /* Flags – Local APIC Flags */
> -    uint32_t flags = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
> -                     1 /* Enabled */ : 0;
> +    bool enabled = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
> +                     true : false;
> +    /*
> +     * ACPI 6.3 5.2.12.2 Local APIC Flags: OnlineCapable must be 0
> +     * if Enabled is set.
> +     */
> +    bool onlinecapable = enabled ? false : true;

Pls write this as onlinecapable = !enabled or just open-code on the next
line - does not look like this variable adds  a lot of value.

> +    uint32_t flags = onlinecapable ? 0x2 : 0x0 | /* Online Capable */
> +                     enabled ? 0x1 : 0x0; /* Enabled */
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


