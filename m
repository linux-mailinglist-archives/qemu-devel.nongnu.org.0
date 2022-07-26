Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3982E581613
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 17:08:05 +0200 (CEST)
Received: from localhost ([::1]:51846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGMAF-0007YQ-UL
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 11:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGM3X-0000n8-RN
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 11:01:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGM3U-0002NV-2g
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 11:01:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658847663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DqRdzHZgVyzeobZnwGGfA9hdrmE+vMHaMsvJduZExRo=;
 b=cv/FEMn4+PmdrtR5QGRuKcsiajLelKSwwC6zENDhhL4OpQDKYDAzznr7eyJfkTDEx0OH1w
 GM9uqUtF+gFcUPurfkcw/5EtEsb3K21IM40eaDPOvSxJqD3NVbRW2zKGT7voyrj2yCDuYe
 tbTB+lF+B/pzRruYNWHGjQcT8nZ/kE8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-C3qvmCDgMaqM3urqae-zuw-1; Tue, 26 Jul 2022 11:01:01 -0400
X-MC-Unique: C3qvmCDgMaqM3urqae-zuw-1
Received: by mail-wr1-f69.google.com with SMTP id
 e3-20020adf9bc3000000b0021e50518071so2179398wrc.2
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 08:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=DqRdzHZgVyzeobZnwGGfA9hdrmE+vMHaMsvJduZExRo=;
 b=xst1Jqsnyh9dUpZ0Aw8weoh3eCrKlCoN7Wu/bsEjLWubfa15A8i0ChFtWAmPkJ5t2d
 5gxNYhkKWyhHnKmcGPUmp3ltGlzOUNcXP09E5b4tedKmIm54GpgC7yQTnsaicHTCmX0v
 lqJLBQ8beuWw7E2Nyt1/W6+GRSkQCJaDkMcONBmGyS8C7HRKXQG4ui4qTuvALVFAjEFA
 XPlR/2ATIJ6doyuzuFMpZjFucx1TN/YL3CFyWsXLWyA89ILNwj7bs6zBMUaUIuITjvNh
 AmDDmZ3XfASy8e20+etCqqQtqfirtZaTLnCQVomWlosEsxeIgus0h9dY3TbLoj6MweLA
 6f/g==
X-Gm-Message-State: AJIora+04P3br6JgWXf3wN4v6X9bOhWQOfgiWmM+olLywgo5C5Dd5ZGu
 EbJrW61RgfV5TC2VHs5BtFGF0+l4YpLuvbgW/7e/+kRxuYRac0SC/3fHdtmOvS65cVb3vLukiYr
 e29MeX7+58iUPdH8=
X-Received: by 2002:a5d:6da7:0:b0:21e:9a88:2593 with SMTP id
 u7-20020a5d6da7000000b0021e9a882593mr3268835wrs.336.1658847660549; 
 Tue, 26 Jul 2022 08:01:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u9PIaD2wCm9f7k6NP8Hf90AurzKOLwrOTdtCYFFra/3BCLlb+juAoQwcrpokMfEcGIwhowWw==
X-Received: by 2002:a5d:6da7:0:b0:21e:9a88:2593 with SMTP id
 u7-20020a5d6da7000000b0021e9a882593mr3268806wrs.336.1658847660085; 
 Tue, 26 Jul 2022 08:01:00 -0700 (PDT)
Received: from redhat.com ([2.55.43.166]) by smtp.gmail.com with ESMTPSA id
 i24-20020a1c5418000000b003a3187a2d4csm21960064wmb.22.2022.07.26.08.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 08:00:59 -0700 (PDT)
Date: Tue, 26 Jul 2022 11:00:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Hal Martin <hal.martin@gmail.com>
Cc: qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] Add support for SMBIOS type 8 (Port Connector Information)
Message-ID: <20220726105727-mutt-send-email-mst@kernel.org>
References: <20220710104804.31694-1-hal.martin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710104804.31694-1-hal.martin@gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Sun, Jul 10, 2022 at 12:48:04PM +0200, Hal Martin wrote:
> 
> This patch adds support for SMBIOS type 8 to qemu.
> 
> internal_reference: internal reference designator
> external_reference: external reference designator
> connector_type: hex value for port connector type (see SMBIOS 7.9.2)
> port_type: hex value for port type (see SMBIOS 7.9.3)
> 
> After studying various vendor implementationsi (Dell, Lenovo, MSI),
> the value of internal connector type was hard-coded to 0x0 (None).
> 
> Example usage:
> -smbios type=8,internal_reference=JUSB1,external_reference=USB1,connector_type=0x12,port_type=0x10 \
> -smbios type=8,internal_reference=JAUD1,external_reference="Audio Jack",connector_type=0x1f,port_type=0x1d \
> -smbios type=8,internal_reference=LAN,external_reference=Ethernet,connector_type=0x0b,port_type=0x1f \
> -smbios type=8,internal_reference=PS2,external_reference=Mouse,connector_type=0x0f,port_type=0x0e \
> -smbios type=8,internal_reference=PS2,external_reference=Keyboard,connector_type=0x0f,port_type=0x0d
> 
> Signed-off-by: Hal Martin <hal.martin@gmail.com>


Looks ok overall. Some nits below

> ---
>  hw/smbios/smbios.c           | 65 ++++++++++++++++++++++++++++++++++++
>  include/hw/firmware/smbios.h | 10 ++++++
>  2 files changed, 75 insertions(+)
> 
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 60349ee402..11fe75ece0 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -111,6 +111,13 @@ static struct {
>      .processor_id = 0,
>  };
>  
> +struct type8_instance {
> +    const char *internal_reference, *external_reference;
> +    uint8_t connector_type, port_type;
> +    QTAILQ_ENTRY(type8_instance) next;
> +};
> +static QTAILQ_HEAD(, type8_instance) type8 = QTAILQ_HEAD_INITIALIZER(type8);
> +
>  static struct {
>      size_t nvalues;
>      char **values;
> @@ -136,6 +143,7 @@ static QEnumLookup type41_kind_lookup = {
>      },
>      .size = 10
>  };
> +
>  struct type41_instance {
>      const char *designation, *pcidev;
>      uint8_t instance, kind;

Don't add this empty line pls.

> @@ -337,6 +345,29 @@ static const QemuOptDesc qemu_smbios_type4_opts[] = {
>      { /* end of list */ }
>  };
>  
> +static const QemuOptDesc qemu_smbios_type8_opts[] = {
> +    {
> +        .name = "internal_reference",
> +        .type = QEMU_OPT_STRING,
> +        .help = "internal reference designator",
> +    },
> +    {
> +        .name = "external_reference",
> +        .type = QEMU_OPT_STRING,
> +        .help = "external reference designator",
> +    },
> +    {
> +        .name = "connector_type",
> +        .type = QEMU_OPT_NUMBER,
> +        .help = "connector type",
> +    },
> +    {
> +        .name = "port_type",
> +        .type = QEMU_OPT_NUMBER,
> +        .help = "port type",
> +    },
> +};
> +
>  static const QemuOptDesc qemu_smbios_type11_opts[] = {
>      {
>          .name = "value",
> @@ -718,6 +749,27 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
>      smbios_type4_count++;
>  }
>  
> +static void smbios_build_type_8_table(void)
> +{
> +    unsigned instance = 0;
> +    struct type8_instance *t8;
> +
> +    QTAILQ_FOREACH(t8, &type8, next) {
> +

no empty line here pls

> +        SMBIOS_BUILD_TABLE_PRE(8, T0_BASE + instance, true);
> +
> +        SMBIOS_TABLE_SET_STR(8, internal_reference_str, t8->internal_reference);
> +        SMBIOS_TABLE_SET_STR(8, external_reference_str, t8->external_reference);
> +        // most vendors seem to set this to None


/* comments in this form please */

> +        t->internal_connector_type = 0x0;
> +        t->external_connector_type = t8->connector_type;
> +        t->port_type = t8->port_type;
> +
> +        SMBIOS_BUILD_TABLE_POST;
> +        instance++;
> +    }
> +}
> +
>  static void smbios_build_type_11_table(void)
>  {
>      char count_str[128];
> @@ -1030,6 +1082,7 @@ void smbios_get_tables(MachineState *ms,
>              smbios_build_type_4_table(ms, i);
>          }
>  
> +        smbios_build_type_8_table();
>          smbios_build_type_11_table();
>  
>  #define MAX_DIMM_SZ (16 * GiB)
> @@ -1346,6 +1399,18 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
>                             UINT16_MAX);
>              }
>              return;
> +        case 8:
> +            if (!qemu_opts_validate(opts, qemu_smbios_type8_opts, errp)) {
> +                return;
> +            }
> +            struct type8_instance *t;
> +            t = g_new0(struct type8_instance, 1);
> +            save_opt(&t->internal_reference, opts, "internal_reference");
> +            save_opt(&t->external_reference, opts, "external_reference");
> +            t->connector_type = qemu_opt_get_number(opts, "connector_type", 0);
> +            t->port_type = qemu_opt_get_number(opts, "port_type", 0);
> +            QTAILQ_INSERT_TAIL(&type8, t, next);
> +            return;
>          case 11:
>              if (!qemu_opts_validate(opts, qemu_smbios_type11_opts, errp)) {
>                  return;
> diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
> index 4b7ad77a44..e7d386f7c8 100644
> --- a/include/hw/firmware/smbios.h
> +++ b/include/hw/firmware/smbios.h
> @@ -189,6 +189,16 @@ struct smbios_type_4 {
>      uint16_t processor_family2;
>  } QEMU_PACKED;
>  
> +/* SMBIOS type 8 - Port Connector Information */
> +struct smbios_type_8 {
> +    struct smbios_structure_header header;
> +    uint8_t internal_reference_str;
> +    uint8_t internal_connector_type;
> +    uint8_t external_reference_str;
> +    uint8_t external_connector_type;
> +    uint8_t port_type;
> +} QEMU_PACKED;
> +
>  /* SMBIOS type 11 - OEM strings */
>  struct smbios_type_11 {
>      struct smbios_structure_header header;
> -- 
> 2.36.1


