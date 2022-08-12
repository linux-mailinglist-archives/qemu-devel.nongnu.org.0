Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BE05912B0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 17:13:49 +0200 (CEST)
Received: from localhost ([::1]:36226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMWM7-00077z-BS
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 11:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oMWCn-0007im-Dk
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 11:04:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oMWCi-0003O8-FX
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 11:04:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660316643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ees+rv9+1NiNUkn53Q6RzkKXl92l3LPsyuQnf/e5QV4=;
 b=YQLYV7+HdiFSO2+5Q3hXj75ohXZMKFoSVzwZs0HUQ6lH2Z88hi2YOHGQUCdIr6WtTeBPq4
 5Pe3Focs59awRiNxcFE56j7Udm6fsBwqYRdONul5l3YcslRMcpkrn8e4TfXXlEiPuFRN1q
 PBeyV6K5dHyDWBq3VrSfc7sZg5/81Zw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-381-rS7hrOI-OfyQzq-tabGb1w-1; Fri, 12 Aug 2022 11:04:01 -0400
X-MC-Unique: rS7hrOI-OfyQzq-tabGb1w-1
Received: by mail-wr1-f69.google.com with SMTP id
 d6-20020adfa346000000b002206e4c29caso204067wrb.8
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 08:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=ees+rv9+1NiNUkn53Q6RzkKXl92l3LPsyuQnf/e5QV4=;
 b=CjHc4EjRpryWb6NZuiosobHEpKrqPvPczn9Ly9fwUHf/nmJgSm7i077Ghon+LMcx62
 42hYpfRLo54ksr1JKFuWsDPvljorjoe+iDNgpkC5kzUs9KdjI8qy1OAw5e2YmYq67xhI
 haqG5Xpy+GDO2cTrx5rwefpxzsyBmOTSh6l2ZACNr9CrSQEDursgR8DlmeMZK5J1YG4B
 196qAFkkrehXTecDxHYeUVa3bOIuL6wuZ9jWn+KAtGMSx7p3bXyPOhX4+nI4mon8gJol
 XuA0Sl97Ee4G5ceI31Q6VdJxG/C2MKic8fn8OvQB+3i2iHzIdeyWCteGPZzuN0be56mX
 2H2A==
X-Gm-Message-State: ACgBeo2gIn6MxVeTqjbfyT0Ed5m6hmRrSEgC93rMcb2vGvRzBDYYwqZD
 ILGh6MfXMhdge0kcCobf0ygmYOoEU2FGgq8b1nZJ1XugtmxwMUcFnRD1n7ma+rrmG1eIazaNje+
 cnIJqApUNKr3dgnE=
X-Received: by 2002:a05:600c:1f16:b0:3a3:214c:a85e with SMTP id
 bd22-20020a05600c1f1600b003a3214ca85emr2975725wmb.95.1660316640696; 
 Fri, 12 Aug 2022 08:04:00 -0700 (PDT)
X-Google-Smtp-Source: AA6agR71PfsuVIEFRHXzlps1zlRtOJ3pqHNWQGqJZ2C98RV/OxUKuUpsLUS/dQ+llDHewR+TSGelCQ==
X-Received: by 2002:a05:600c:1f16:b0:3a3:214c:a85e with SMTP id
 bd22-20020a05600c1f1600b003a3214ca85emr2975694wmb.95.1660316640375; 
 Fri, 12 Aug 2022 08:04:00 -0700 (PDT)
Received: from redhat.com ([2.52.152.113]) by smtp.gmail.com with ESMTPSA id
 v20-20020a1cf714000000b003a5125049c9sm12604178wmh.9.2022.08.12.08.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 08:03:59 -0700 (PDT)
Date: Fri, 12 Aug 2022 11:03:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Hal Martin <hal.martin@gmail.com>
Cc: qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v2] hw/smbios: support for type 8 (port connector)
Message-ID: <20220812110220-mutt-send-email-mst@kernel.org>
References: <20220812135153.17859-1-hal.martin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220812135153.17859-1-hal.martin@gmail.com>
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

On Fri, Aug 12, 2022 at 03:51:53PM +0200, Hal Martin wrote:
> PATCH v1: add support for SMBIOS type 8 to qemu
> PATCH v2: incorporate patch v1 feedback and add smbios type=8 to qemu-options

history after --- pls

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
> 
> Signed-off-by: Hal Martin <hal.martin@gmail.com>

We are in freeze, I tagged this for after the release.
Just to make sure pls ping me after the release if possible.



> ---
>  hw/smbios/smbios.c           | 63 ++++++++++++++++++++++++++++++++++++
>  include/hw/firmware/smbios.h | 10 ++++++
>  qemu-options.hx              |  2 ++
>  3 files changed, 75 insertions(+)
> 
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 60349ee402..578cae0f0a 100644
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
> @@ -337,6 +344,29 @@ static const QemuOptDesc qemu_smbios_type4_opts[] = {
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
> @@ -718,6 +748,26 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
>      smbios_type4_count++;
>  }
>  
> +static void smbios_build_type_8_table(void)
> +{
> +    unsigned instance = 0;
> +    struct type8_instance *t8;
> +
> +    QTAILQ_FOREACH(t8, &type8, next) {
> +        SMBIOS_BUILD_TABLE_PRE(8, T0_BASE + instance, true);
> +
> +        SMBIOS_TABLE_SET_STR(8, internal_reference_str, t8->internal_reference);
> +        SMBIOS_TABLE_SET_STR(8, external_reference_str, t8->external_reference);
> +        /* most vendors seem to set this to None */
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
> @@ -1030,6 +1080,7 @@ void smbios_get_tables(MachineState *ms,
>              smbios_build_type_4_table(ms, i);
>          }
>  
> +        smbios_build_type_8_table();
>          smbios_build_type_11_table();
>  
>  #define MAX_DIMM_SZ (16 * GiB)
> @@ -1346,6 +1397,18 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
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
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 377d22fbd8..a27ab6afee 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2538,6 +2538,8 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
>      "              [,asset=str][,part=str][,max-speed=%d][,current-speed=%d]\n"
>      "              [,processor-id=%d]\n"
>      "                specify SMBIOS type 4 fields\n"
> +    "-smbios type=8[,external_reference=str][,internal_reference=str][,connector_type=%d][,port_type=%d]\n"
> +    "                specify SMBIOS type 8 fields\n"
>      "-smbios type=11[,value=str][,path=filename]\n"
>      "                specify SMBIOS type 11 fields\n"
>      "-smbios type=17[,loc_pfx=str][,bank=str][,manufacturer=str][,serial=str]\n"
> -- 
> 2.36.1


