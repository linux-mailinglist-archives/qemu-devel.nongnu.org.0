Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DE96DDE7B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 16:50:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmFJj-000664-1h; Tue, 11 Apr 2023 10:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pmFJf-00064v-Eo
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:49:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pmFJd-000707-Sx
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:49:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681224588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OONh1tM008WsfhKisHY4nGddPBIQCQW/ooPTbHlLuSc=;
 b=alA0vOoP/L+z1EyJykLyql93yYuQ00idtBdVR81cyTPxtSokHo0Dh0qNcrvs0MlYhQyHpo
 icixrL+bYuXaf1x4y/VDLLSqdW33msQn0O+A747JJ1hCFnpOFN52Nb/ow5qcD4OhtV+2+v
 aky9DUVKhjUZklEchXPd+Fiai/+kUhg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-m_IyeobXPmy5aKOH745rkA-1; Tue, 11 Apr 2023 10:49:47 -0400
X-MC-Unique: m_IyeobXPmy5aKOH745rkA-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-94a4a33da90so109421466b.3
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 07:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681224586;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OONh1tM008WsfhKisHY4nGddPBIQCQW/ooPTbHlLuSc=;
 b=YxNvWmnEa4DAIZ1prW1towtK0QJFg+dT+pyEWA/oHkZNnFNi93vooUC7OJg6yCo6DB
 ojtlFZk38z+V8h7kRan5cSb56O5wKuFCY1InIGHfaX5Q9z8ucNNByr+W43SP2OX1AvSR
 6yepmJoKJpDrwsyF/aCF9POasvLqD2kw09rpGmV3lYConfoozolCD9hxM8YvmkQgwQhF
 VDOL/PcuA2lfuyyyzPKcRrOk7BDONqoa/NNveN83FzqeVFE3xXuYEiZCrTfL3y+0Nbip
 Y6zH7tbAFsmhn3Q53j/lTn1tThm++MUJ4RtABvdMzIfqxU+WZ0bmw3/8+UL1s9JExejt
 lZ9A==
X-Gm-Message-State: AAQBX9cii1aRm5e9HqYnZSozdqXXIMJagnQ6FKNUJiMkX4gh6CXL8MXY
 ZTxDkwYEXeiXQlr5mO1N/y1ldhU32/BL4LjU49TgNsrcMpttPnWDpnagRCdabvLH8YvYRaurkwR
 RDydBINfZWhJ9Gsc=
X-Received: by 2002:aa7:cad9:0:b0:4fd:1cf1:b7b0 with SMTP id
 l25-20020aa7cad9000000b004fd1cf1b7b0mr12575802edt.7.1681224586543; 
 Tue, 11 Apr 2023 07:49:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZRDaqytXCeLi3KDIz1pQJHRzGpTh7YJAGQU6h0HhQvK0o317dK0Bnl9+wdDcnNGQ57In83Kw==
X-Received: by 2002:aa7:cad9:0:b0:4fd:1cf1:b7b0 with SMTP id
 l25-20020aa7cad9000000b004fd1cf1b7b0mr12575777edt.7.1681224586183; 
 Tue, 11 Apr 2023 07:49:46 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 n19-20020a509353000000b005002daeb27asm6016311eda.37.2023.04.11.07.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 07:49:45 -0700 (PDT)
Date: Tue, 11 Apr 2023 16:49:44 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: shannon.zhaosl@gmail.com, mst@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 boris.ostrovsky@oracle.com
Subject: Re: [PATCH 1/2] hw/acpi: arm: bump MADT to revision 5
Message-ID: <20230411164944.0549bb29@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230328155926.2277-2-eric.devolder@oracle.com>
References: <20230328155926.2277-1-eric.devolder@oracle.com>
 <20230328155926.2277-2-eric.devolder@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Tue, 28 Mar 2023 11:59:25 -0400
Eric DeVolder <eric.devolder@oracle.com> wrote:

> Currently ARM QEMU generates, and reports, MADT revision 4. ACPI 6.3
> introduces MADT revision 5.
> 
> For MADT revision 5, the GICC structure adds an SPE Overflow Interrupt
> field. This new 2-byte field is created from the existing 3-byte
> Reserved field. The spec indicates if the SPE overflow interrupt is
> not supported, to zero the field.
> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>


needs ACK from ARM folks

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


