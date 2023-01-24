Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B75679F28
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 17:49:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKMT6-0001ch-7y; Tue, 24 Jan 2023 11:48:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pKMT2-0001Zh-AC
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 11:48:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pKMT0-0000ol-Bd
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 11:48:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674578893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ooFEJN/pyP/cDMvjOhXEjomp8PGB1CgiajEd+XQCDwM=;
 b=fLhlztXSPF1+quA0I3RcSMqI3GNEt57FwCB6NSGN0F6l2auIHu2xXmAhuRPC5+2UogqKj+
 ebHDQ2ECMOAK9X5ej9eU4ciCUMIXoUK0QzJuNmHRIcGKopiXHZQZaZCjdZ0RF46Ng6/Jhj
 NrFYjKdg/BV2YjB5V+HB3sUl+WUxAuA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-426-m44T2azpN4aoFzwBDPoc4A-1; Tue, 24 Jan 2023 11:48:11 -0500
X-MC-Unique: m44T2azpN4aoFzwBDPoc4A-1
Received: by mail-ej1-f69.google.com with SMTP id
 ds1-20020a170907724100b008775bfcef62so10145179ejc.9
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 08:48:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ooFEJN/pyP/cDMvjOhXEjomp8PGB1CgiajEd+XQCDwM=;
 b=2sdvnG/T5DeZtJrgNy7IemZUH0s7JIsMhAJnHnnc0JsCNeApoBULuSUTnZkUvuJ7no
 m48CGy6HVadIRRpzr8GJKs4ByXYxzcu8GQI+3f/vyutfgW5ncInkc1VAJpTtJzSiTvnv
 2Ug+otDwR1M3oglfCUaB6AgEm0XstC78yXP+4sARMt+AvzmZnrXuzTqpEprQBeA8Jayr
 ce+oULe7hYqzTUVRlU2YQ9uUu0CBayn9ODs9bAry6GF3hrjU/aoNXO9id5x4liGNPs0K
 1rfv8ueq+hITHZikALgRYH1+k9eiVWErZ3O+q8Zk20RMe+MuSjCLtqw20D5ZlVKfWKFQ
 Qfcg==
X-Gm-Message-State: AFqh2krNqx3cX8BGldrpO7m1f1+OzpbNBmnCsF3r6zvhAuBWiRFtHV2r
 YmPodNiGqul/mizuoTVZ5qvuBCOJ35u0deur7jFMvgBAyqSnxRmLgTGgfB1LHS6JxY6j5bZsg7j
 K90P6uTQlRmIGFLA=
X-Received: by 2002:a05:6402:2421:b0:472:9af1:163f with SMTP id
 t33-20020a056402242100b004729af1163fmr33256406eda.37.1674578890367; 
 Tue, 24 Jan 2023 08:48:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvLa41i74AHAy4UBc+wM34DFLrd6e+kExCNQUIOJPzcsGcHYUc78tjC2fMgnXKSu6Edolc3+Q==
X-Received: by 2002:a05:6402:2421:b0:472:9af1:163f with SMTP id
 t33-20020a056402242100b004729af1163fmr33256384eda.37.1674578890165; 
 Tue, 24 Jan 2023 08:48:10 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 n19-20020a05640204d300b004954c90c94bsm1265977edw.6.2023.01.24.08.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 08:48:09 -0800 (PST)
Date: Tue, 24 Jan 2023 17:48:08 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>, Aurelien Jarno
 <aurelien@aurel32.net>
Subject: Re: [PATCH 1/7] hw/acpi/{ich9,piix4}: Reuse existing attributes for
 QOM properties
Message-ID: <20230124174808.6bc1d8ca@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230122170724.21868-2-shentey@gmail.com>
References: <20230122170724.21868-1-shentey@gmail.com>
 <20230122170724.21868-2-shentey@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Sun, 22 Jan 2023 18:07:18 +0100
Bernhard Beschow <shentey@gmail.com> wrote:

> The QOM properties are accessed after the device models have been
> realized. This means that the constants are redundant. Remove them.
not sure it above means.

Perhaps:

subj: use existing fields type::foo instead of static memory.

all object_property_add_*_ptr() needs is a pointer to memory
storing so RO defaults where provided as pointers to static
constants. Instead of keeping static constants around, drop
them and initialize use existing type::foo field, which were
set set later on to this constant later at ...

(also see below: maybe squash ICH9_PMIO_GPE0_LEN cleanup here as well)

or something along this lines. 

> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/acpi/ich9.c  |  5 ++---
>  hw/acpi/piix4.c | 10 ++++------
>  2 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index a93c470e9d..2050af67b9 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -433,7 +433,6 @@ static void ich9_pm_set_keep_pci_slot_hpc(Object *obj, bool value, Error **errp)
>  
>  void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
>  {
> -    static const uint32_t gpe0_len = ICH9_PMIO_GPE0_LEN;

you are loosing default value here, (true it's set somewhere later)
suggest:
      pm->acpi_regs.gpe.len = ICH9_PMIO_GPE0_LEN;

and in patch on top maybe cleanup other places that use
ICH9_PMIO_GPE0_LEN with pm->acpi_regs.gpe.len

>      pm->acpi_memory_hotplug.is_enabled = true;
>      pm->cpu_hotplug_legacy = true;
>      pm->disable_s3 = 0;
> @@ -448,8 +447,8 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
>      object_property_add(obj, ACPI_PM_PROP_GPE0_BLK, "uint32",
>                          ich9_pm_get_gpe0_blk,
>                          NULL, NULL, pm);
> -    object_property_add_uint32_ptr(obj, ACPI_PM_PROP_GPE0_BLK_LEN,
> -                                   &gpe0_len, OBJ_PROP_FLAG_READ);
> +    object_property_add_uint8_ptr(obj, ACPI_PM_PROP_GPE0_BLK_LEN,
> +                                  &pm->acpi_regs.gpe.len, OBJ_PROP_FLAG_READ);
>      object_property_add_bool(obj, "memory-hotplug-support",
>                               ich9_pm_get_memory_hotplug_support,
>                               ich9_pm_set_memory_hotplug_support);
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 0a81f1ad93..370b34eacf 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -421,18 +421,16 @@ static void piix4_pm_add_properties(PIIX4PMState *s)
>  {
>      static const uint8_t acpi_enable_cmd = ACPI_ENABLE;
>      static const uint8_t acpi_disable_cmd = ACPI_DISABLE;
> -    static const uint32_t gpe0_blk = GPE_BASE;
> -    static const uint32_t gpe0_blk_len = GPE_LEN;

ditto

also maybe split on 2 patches 1 for ich9 another for piix4

>      static const uint16_t sci_int = 9;
>  
>      object_property_add_uint8_ptr(OBJECT(s), ACPI_PM_PROP_ACPI_ENABLE_CMD,
>                                    &acpi_enable_cmd, OBJ_PROP_FLAG_READ);
>      object_property_add_uint8_ptr(OBJECT(s), ACPI_PM_PROP_ACPI_DISABLE_CMD,
>                                    &acpi_disable_cmd, OBJ_PROP_FLAG_READ);
> -    object_property_add_uint32_ptr(OBJECT(s), ACPI_PM_PROP_GPE0_BLK,
> -                                  &gpe0_blk, OBJ_PROP_FLAG_READ);
> -    object_property_add_uint32_ptr(OBJECT(s), ACPI_PM_PROP_GPE0_BLK_LEN,
> -                                  &gpe0_blk_len, OBJ_PROP_FLAG_READ);
> +    object_property_add_uint64_ptr(OBJECT(s), ACPI_PM_PROP_GPE0_BLK,
> +                                   &s->io_gpe.addr, OBJ_PROP_FLAG_READ);
> +    object_property_add_uint8_ptr(OBJECT(s), ACPI_PM_PROP_GPE0_BLK_LEN,
> +                                  &s->ar.gpe.len, OBJ_PROP_FLAG_READ);
>      object_property_add_uint16_ptr(OBJECT(s), ACPI_PM_PROP_SCI_INT,
>                                    &sci_int, OBJ_PROP_FLAG_READ);
>      object_property_add_uint32_ptr(OBJECT(s), ACPI_PM_PROP_PM_IO_BASE,


