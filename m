Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A4259FF35
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 18:13:49 +0200 (CEST)
Received: from localhost ([::1]:58732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQt0m-0006yK-5j
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 12:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oQsnz-0001vX-Ov
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 12:00:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oQsnv-0003k1-H1
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 12:00:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661356830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y5EuXf79I1la+8EmiKcIuSoDq0QdT/WIysqemTXBPSY=;
 b=fWDXjcrwflpCDxQWhBirmEl3CKDAjqTF6cFIZg5tDrrEf0HYBMfX0D9UUKB2gAymrc2WZ1
 zv3FuoJLvMtHJoIXKWcicpRITlrDy5tJh7CIpyS/VZxv/wD+uK5CepMd+jbor6LuHXCkHe
 A4Njs9uYva9hTy7O8GsLB8eGfsPT9vY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-368-4JF5AIorMFW4mufUR2AHEA-1; Wed, 24 Aug 2022 12:00:28 -0400
X-MC-Unique: 4JF5AIorMFW4mufUR2AHEA-1
Received: by mail-ed1-f72.google.com with SMTP id
 m16-20020a056402431000b0044662a0ba2cso8304115edc.13
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 09:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=Y5EuXf79I1la+8EmiKcIuSoDq0QdT/WIysqemTXBPSY=;
 b=iGtW7s7kCx9rhUWGdjzz3AHF+Q7KJGbM18lCCy0tJkL1UWLa8yzmWw8lN2BgK/L8Dx
 LfLovhPSr+igPT0OcTd7axqbMfkhDWj7wmurmqNvdXzBQapN9igSeIdHhj257XaMgPvB
 LWi9iGW0lFRXZadvjh8FrjNSDxQa8+Wc8fm98H9Ky58qr/3mmUZhSpiw1ZWlxx5co6jE
 FPAjUyincYNuceEZg5cd132xDmONacIIy40z3OX5swK+FrIFfGCx2cEBUUDlC/Py7WGq
 rp7oOXHLFQRH4mxixspvu60Vnvi9c7NoUVkcZD5QB/LzL5xWWMeDmKo21ZhimND0MSPs
 2pRg==
X-Gm-Message-State: ACgBeo0w2wEa20gUPo8GO9KwGkUXhZn+fI9MRQQTPWEofjVQztBhHf1e
 Zv6jWLn+JhRHO9+z7p6CUu9RLmCQWpSc5MCaPB2lY0Ary3yziImCFde1FRDO2qyR1CkMFgs2vVn
 3yuWw7drpgxhUViA=
X-Received: by 2002:a17:906:9c82:b0:6e1:1d6c:914c with SMTP id
 fj2-20020a1709069c8200b006e11d6c914cmr3252177ejc.769.1661356827445; 
 Wed, 24 Aug 2022 09:00:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5VKt3y7IeoMGGyJmdWtLgqTt2WbFUHgF1/KhWp2kXwukoilW9hb5LOgaxtOB152zRjKIVq2g==
X-Received: by 2002:a17:906:9c82:b0:6e1:1d6c:914c with SMTP id
 fj2-20020a1709069c8200b006e11d6c914cmr3252153ejc.769.1661356827150; 
 Wed, 24 Aug 2022 09:00:27 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a056402105300b0044790836307sm797807edu.85.2022.08.24.09.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 09:00:26 -0700 (PDT)
Date: Wed, 24 Aug 2022 18:00:25 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <ani@anisinha.ca>
Subject: Re: [PATCH v2 1/5] hw/smbios: add core_count2 to smbios table type 4
Message-ID: <20220824180025.70822df6@redhat.com>
In-Reply-To: <20220731162141.178443-2-jusual@redhat.com>
References: <20220731162141.178443-1-jusual@redhat.com>
 <20220731162141.178443-2-jusual@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
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

On Sun, 31 Jul 2022 18:21:37 +0200
Julia Suvorova <jusual@redhat.com> wrote:

> In order to use the increased number of cpus, we need to bring smbios
> tables in line with the SMBIOS 3.0 specification. This allows us to
> introduce core_count2 which acts as a duplicate of core_count if we have
> fewer cores than 256, and contains the actual core number per socket if
> we have more.
> 
> core_enabled2 and thread_count2 fields work the same way.
> 
> Signed-off-by: Julia Suvorova <jusual@redhat.com>

I'd fix up checkpatch warnings but otherwise looks good to me

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/smbios/smbios_build.h     |  9 +++++++--
>  include/hw/firmware/smbios.h | 11 +++++++++++
>  hw/smbios/smbios.c           | 18 +++++++++++++++---
>  3 files changed, 33 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/smbios/smbios_build.h b/hw/smbios/smbios_build.h
> index 56b5a1e3f3..351660024e 100644
> --- a/hw/smbios/smbios_build.h
> +++ b/hw/smbios/smbios_build.h
> @@ -27,6 +27,11 @@ extern unsigned smbios_table_max;
>  extern unsigned smbios_table_cnt;
>  
>  #define SMBIOS_BUILD_TABLE_PRE(tbl_type, tbl_handle, tbl_required)        \
> +        SMBIOS_BUILD_TABLE_PRE_SIZE(tbl_type, tbl_handle, tbl_required,   \
> +                                    sizeof(struct smbios_type_##tbl_type))\
> +
> +#define SMBIOS_BUILD_TABLE_PRE_SIZE(tbl_type, tbl_handle,                 \
> +                                    tbl_required, tbl_len)                \
>      struct smbios_type_##tbl_type *t;                                     \
>      size_t t_off; /* table offset into smbios_tables */                   \
>      int str_index = 0;                                                    \
> @@ -39,12 +44,12 @@ extern unsigned smbios_table_cnt;
>          /* use offset of table t within smbios_tables */                  \
>          /* (pointer must be updated after each realloc) */                \
>          t_off = smbios_tables_len;                                        \
> -        smbios_tables_len += sizeof(*t);                                  \
> +        smbios_tables_len += tbl_len;                                     \
>          smbios_tables = g_realloc(smbios_tables, smbios_tables_len);      \
>          t = (struct smbios_type_##tbl_type *)(smbios_tables + t_off);     \
>                                                                            \
>          t->header.type = tbl_type;                                        \
> -        t->header.length = sizeof(*t);                                    \
> +        t->header.length = tbl_len;                                       \
>          t->header.handle = cpu_to_le16(tbl_handle);                       \
>      } while (0)
>  
> diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
> index 4b7ad77a44..56f7bf0fea 100644
> --- a/include/hw/firmware/smbios.h
> +++ b/include/hw/firmware/smbios.h
> @@ -18,6 +18,8 @@
>  
>  
>  #define SMBIOS_MAX_TYPE 127
> +#define offsetofend(TYPE, MEMBER) \
> +       (offsetof(TYPE, MEMBER) + sizeof_field(TYPE, MEMBER))
>  
>  /* memory area description, used by type 19 table */
>  struct smbios_phys_mem_area {
> @@ -187,8 +189,17 @@ struct smbios_type_4 {
>      uint8_t thread_count;
>      uint16_t processor_characteristics;
>      uint16_t processor_family2;
> +    /* SMBIOS spec 3.0.0, Table 21 */
> +    uint16_t core_count2;
> +    uint16_t core_enabled2;
> +    uint16_t thread_count2;
>  } QEMU_PACKED;
>  
> +typedef enum smbios_type_4_len_ver {
> +    SMBIOS_TYPE_4_LEN_V28 = offsetofend(struct smbios_type_4, processor_family2),
> +    SMBIOS_TYPE_4_LEN_V30 = offsetofend(struct smbios_type_4, thread_count2),
> +} smbios_type_4_len_ver;
> +
>  /* SMBIOS type 11 - OEM strings */
>  struct smbios_type_11 {
>      struct smbios_structure_header header;
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 60349ee402..657093e5f6 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -681,8 +681,13 @@ static void smbios_build_type_3_table(void)
>  static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
>  {
>      char sock_str[128];
> +    size_t tbl_len = SMBIOS_TYPE_4_LEN_V28;
>  
> -    SMBIOS_BUILD_TABLE_PRE(4, T4_BASE + instance, true); /* required */
> +    if (smbios_ep_type == SMBIOS_ENTRY_POINT_TYPE_64) {
> +        tbl_len = SMBIOS_TYPE_4_LEN_V30;
> +    }
> +
> +    SMBIOS_BUILD_TABLE_PRE_SIZE(4, T4_BASE + instance, true, tbl_len); /* required */
>  
>      snprintf(sock_str, sizeof(sock_str), "%s%2x", type4.sock_pfx, instance);
>      SMBIOS_TABLE_SET_STR(4, socket_designation_str, sock_str);
> @@ -709,8 +714,15 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
>      SMBIOS_TABLE_SET_STR(4, serial_number_str, type4.serial);
>      SMBIOS_TABLE_SET_STR(4, asset_tag_number_str, type4.asset);
>      SMBIOS_TABLE_SET_STR(4, part_number_str, type4.part);
> -    t->core_count = t->core_enabled = ms->smp.cores;
> -    t->thread_count = ms->smp.threads;
> +
> +    t->core_count = (ms->smp.cores > 255) ? 0xFF : ms->smp.cores;
> +    t->core_enabled = t->core_count;
> +
> +    t->core_count2 = t->core_enabled2 = cpu_to_le16(ms->smp.cores);
> +
> +    t->thread_count = (ms->smp.threads > 255) ? 0xFF : ms->smp.threads;
> +    t->thread_count2 = cpu_to_le16(ms->smp.threads);
> +
>      t->processor_characteristics = cpu_to_le16(0x02); /* Unknown */
>      t->processor_family2 = cpu_to_le16(0x01); /* Other */
>  


