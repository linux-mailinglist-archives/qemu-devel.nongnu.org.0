Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EF65BA799
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 09:52:45 +0200 (CEST)
Received: from localhost ([::1]:51862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ69T-0007JK-LC
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 03:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oZ67C-0004nz-PG
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 03:50:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oZ678-00048Y-NQ
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 03:50:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663314617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1NZTbhFlVyBBQGo1AIaDyf3k05YRJW4RFObswSf0PwI=;
 b=U4Ot76KQML7U3ftHno03AA1AXgBKCCpZ7YdEX7XtMuu6r7YUv5AG1PvEBx02M3Q6Ctxspb
 1912Y+E4jqSdT2RsM91jn9yeBJGDeBg8ZG9xZKpgKl+XAg58/seqzwzKIxuqOUrMlkEm/r
 pq+0VnNJd7sOg8QtAQoYJt5UKJj3Pww=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-JpIeevmXOiiyow8Ce5wsdw-1; Fri, 16 Sep 2022 03:50:16 -0400
X-MC-Unique: JpIeevmXOiiyow8Ce5wsdw-1
Received: by mail-ed1-f69.google.com with SMTP id
 t13-20020a056402524d00b00452c6289448so5072742edd.17
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 00:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=1NZTbhFlVyBBQGo1AIaDyf3k05YRJW4RFObswSf0PwI=;
 b=ieIKKR/w2e7EMecWnekjoQijrBOnYSYR34Y3gcFlJnPecC/m89ahQGB9bCGC6U2p63
 pmu6Uv02lS/jFUGFh+fZrlFoLxNXCWja/YrlE1IT56OQO9pC02SbbfAMnDBOaZETJp46
 qUHzb1cxnxex2/B3KGnAztl6nldfaRG8K5Z2PdV5W1J0Z5o4HO38gUgnKKM+pU4F0phY
 K3sqP2NaO7GVrAgeZ8XGM9FtqALZ7U5urbt4dIdEIRxJDFfRJYdhIRK+KA3Lm4FHn6nu
 mgv3SYJgs3W/ZP+Ri6n1wGJ0iSKeudvhSpYshEB2BRvebSfVqL+7drxv+rdU6Cwf4CLw
 lk3Q==
X-Gm-Message-State: ACrzQf1AvjAfi7JEQkNPI5vrc/AbQjtjhakUNzt3evss3R71S8dRC6CC
 qx3z6bDm00lzkTTl/uyokedcmibJfnaODWjvAWPqKdcxGNyqLY59G1uixk5gnDtNh7zcIl+ORTB
 IpeqAy2qPIU44X6w=
X-Received: by 2002:a17:907:3ea7:b0:77e:6057:3e1a with SMTP id
 hs39-20020a1709073ea700b0077e60573e1amr2756241ejc.470.1663314615264; 
 Fri, 16 Sep 2022 00:50:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4nHAmLDMPTmzRdijQheulGR9byfJDe6l9spzP9CeeRDH8PLz88ZQb2K0ZV7LCGXUU5mC5lzw==
X-Received: by 2002:a17:907:3ea7:b0:77e:6057:3e1a with SMTP id
 hs39-20020a1709073ea700b0077e60573e1amr2756226ejc.470.1663314615045; 
 Fri, 16 Sep 2022 00:50:15 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 1-20020a170906328100b0077909095acasm10143268ejw.143.2022.09.16.00.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 00:50:14 -0700 (PDT)
Date: Fri, 16 Sep 2022 09:50:13 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, michael.roth@amd.com, jsnow@redhat.com,
 eblake@redhat.com, "Michael S . Tsirkin" <mst@redhat.com>, Ani Sinha
 <ani@anisinha.ca>
Subject: Re: [PATCH 06/27] qapi acpi: Elide redundant has_FOO in generated C
Message-ID: <20220916095013.5c197a33@redhat.com>
In-Reply-To: <20220915204317.3766007-7-armbru@redhat.com>
References: <20220915204317.3766007-1-armbru@redhat.com>
 <20220915204317.3766007-7-armbru@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 15 Sep 2022 22:42:56 +0200
Markus Armbruster <armbru@redhat.com> wrote:

> The has_FOO for pointer-valued FOO are redundant, except for arrays.
> They are also a nuisance to work with.  Recent commit "qapi: Start to
> elide redundant has_FOO in generated C" provided the means to elide
> them step by step.  This is the step for qapi/acpi.py.
> 
> Said commit explains the transformation in more detail.  The invariant
> violations mentioned there do not occur here.
> 
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Ani Sinha <ani@anisinha.ca>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/core.c           | 14 +++++++-------
>  hw/acpi/cpu.c            |  1 -
>  hw/acpi/memory_hotplug.c |  1 -
>  scripts/qapi/schema.py   |  1 -
>  4 files changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> index 3e811bf03c..6da275c599 100644
> --- a/hw/acpi/core.c
> +++ b/hw/acpi/core.c
> @@ -185,7 +185,7 @@ static void acpi_table_install(const char unsigned *blob, size_t bloblen,
>      changed_fields = 0;
>      ext_hdr->_length = cpu_to_le16(acpi_payload_size);
>  
> -    if (hdrs->has_sig) {
> +    if (hdrs->sig) {
>          strncpy(ext_hdr->sig, hdrs->sig, sizeof ext_hdr->sig);
>          ++changed_fields;
>      }
> @@ -204,11 +204,11 @@ static void acpi_table_install(const char unsigned *blob, size_t bloblen,
>  
>      ext_hdr->checksum = 0;
>  
> -    if (hdrs->has_oem_id) {
> +    if (hdrs->oem_id) {
>          strncpy(ext_hdr->oem_id, hdrs->oem_id, sizeof ext_hdr->oem_id);
>          ++changed_fields;
>      }
> -    if (hdrs->has_oem_table_id) {
> +    if (hdrs->oem_table_id) {
>          strncpy(ext_hdr->oem_table_id, hdrs->oem_table_id,
>                  sizeof ext_hdr->oem_table_id);
>          ++changed_fields;
> @@ -217,7 +217,7 @@ static void acpi_table_install(const char unsigned *blob, size_t bloblen,
>          ext_hdr->oem_revision = cpu_to_le32(hdrs->oem_rev);
>          ++changed_fields;
>      }
> -    if (hdrs->has_asl_compiler_id) {
> +    if (hdrs->asl_compiler_id) {
>          strncpy(ext_hdr->asl_compiler_id, hdrs->asl_compiler_id,
>                  sizeof ext_hdr->asl_compiler_id);
>          ++changed_fields;
> @@ -255,12 +255,12 @@ void acpi_table_add(const QemuOpts *opts, Error **errp)
>      if (!hdrs) {
>          goto out;
>      }
> -    if (hdrs->has_file == hdrs->has_data) {
> +    if (!hdrs->file == !hdrs->data) {
>          error_setg(errp, "'-acpitable' requires one of 'data' or 'file'");
>          goto out;
>      }
>  
> -    pathnames = g_strsplit(hdrs->has_file ? hdrs->file : hdrs->data, ":", 0);
> +    pathnames = g_strsplit(hdrs->file ?: hdrs->data, ":", 0);
>      if (pathnames == NULL || pathnames[0] == NULL) {
>          error_setg(errp, "'-acpitable' requires at least one pathname");
>          goto out;
> @@ -297,7 +297,7 @@ void acpi_table_add(const QemuOpts *opts, Error **errp)
>          close(fd);
>      }
>  
> -    acpi_table_install(blob, bloblen, hdrs->has_file, hdrs, errp);
> +    acpi_table_install(blob, bloblen, !!hdrs->file, hdrs, errp);
>  
>  out:
>      g_free(blob);
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 3646dbfe68..4e580959a2 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -35,7 +35,6 @@ static ACPIOSTInfo *acpi_cpu_device_status(int idx, AcpiCpuStatus *cdev)
>          DeviceState *dev = DEVICE(cdev->cpu);
>          if (dev->id) {
>              info->device = g_strdup(dev->id);
> -            info->has_device = true;
>          }
>      }
>      return info;
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index 0a7e89a13e..a7476330a8 100644
> --- a/hw/acpi/memory_hotplug.c
> +++ b/hw/acpi/memory_hotplug.c
> @@ -44,7 +44,6 @@ static ACPIOSTInfo *acpi_memory_device_status(int slot, MemStatus *mdev)
>          DeviceState *dev = DEVICE(mdev->dimm);
>          if (dev->id) {
>              info->device = g_strdup(dev->id);
> -            info->has_device = true;
>          }
>      }
>      return info;
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index 3ae94300c4..5160a659b7 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -759,7 +759,6 @@ def need_has(self):
>          assert self.type
>          # Temporary hack to support dropping the has_FOO in reviewable chunks
>          opt_out = [
> -            'qapi/acpi.json',
>              'qapi/audio.json',
>              'qapi/block-core.json',
>              'qapi/block-export.json',


