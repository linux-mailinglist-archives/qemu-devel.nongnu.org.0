Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0FF401B65
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 14:47:00 +0200 (CEST)
Received: from localhost ([::1]:53022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNE1c-0004QS-1v
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 08:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNDzC-0002Et-Mj
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 08:44:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNDyz-0001U8-6s
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 08:44:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630932253;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2kp1G4/rKxz4m3INYgpqx8tfuyws4fSW1lqHamsfiRE=;
 b=amPbpiliyw9PcM1/yhGhWoRSSbjladRZ4E2yDpZlllurGU5IJkwRuucWCBUSKNbYUbbinK
 q+ffR/xQjkOeVdJT2tMojfiyZcZz4WgALn6Lt5tpH7KGNhyn4Ftyx+nL/OTynEhk490QwZ
 hTY9TvX2K28hwflKFui4XlfPHwFEz8k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-XXolAIsNOeCgtvLzXDW4IQ-1; Mon, 06 Sep 2021 08:44:11 -0400
X-MC-Unique: XXolAIsNOeCgtvLzXDW4IQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 m22-20020a7bcb96000000b002f7b840d9dcso3188426wmi.1
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 05:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=2kp1G4/rKxz4m3INYgpqx8tfuyws4fSW1lqHamsfiRE=;
 b=d4af+R1WASSFdI3wd6iQIdAGwqLMCw/OdSx0E4MBhm253sPxssQdNtswk1AIp+GkwK
 oobksAKeoAFqdToMJO9gqCF6jofJURAfmr6CWHVXjnz+3vRc86drUmKaMD4GyAXWHTvd
 31r39C+q5jD17CkDN1QsI8UnyhNfxcUMojbamNAqP94SkcefzU/KK3f4sXy9lx1Jdd7g
 B0FrVfUYYGw8Pdc84+OOaBR7NG0mCtQVSvJCZZ1GqjZlqizmPMFbbORNv0sAoa2I776r
 t41vuDzwJrMK2smdQNYxEjwhevXJIaDKj9f7wK/nP8U25mqMxHw1/BIRXGlWChkq2dVy
 O9xA==
X-Gm-Message-State: AOAM5326gvhPK5+jwAyzlCLhbGCS7vBs2e2vsQa10n9jPZTP3EiN352i
 siTQD/scPHWIh3mykBNDXoNvZivs8YLWnZNEg3qqpk6V/a4al0k6ae+/+2cOVWIyupFISaMILhR
 eoB3A+7t0KoYWWEE=
X-Received: by 2002:a05:600c:2d89:: with SMTP id
 i9mr11536707wmg.10.1630932250116; 
 Mon, 06 Sep 2021 05:44:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhULQlwUZ/E7blqV2kX+lpVJIcHxXbKAENEgCeMK2DsaQzhrqHjuiyip/4MOCaXZ3vvlJkdA==
X-Received: by 2002:a05:600c:2d89:: with SMTP id
 i9mr11536678wmg.10.1630932249881; 
 Mon, 06 Sep 2021 05:44:09 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id f20sm7083328wmb.32.2021.09.06.05.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 05:44:09 -0700 (PDT)
Subject: Re: [PATCH v2 1/8] acpi: Add VIOT structure definitions
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
 <20210903143208.2434284-2-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <535cdf06-d933-aa9f-8a01-3230b1836ab7@redhat.com>
Date: Mon, 6 Sep 2021 14:44:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210903143208.2434284-2-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.332,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jean,

On 9/3/21 4:32 PM, Jean-Philippe Brucker wrote:
> The ACPI Virtual I/O Translation table (VIOT) table describes I/O
> topology for paravirtual devices. At the moment it describes the
> relation between virtio-iommu devices and their endpoints. Add the
> structure definitions for VIOT.

I don't think those additions are needed anymore. Looking at Igor's
conversions in  [PATCH v2 00/35] acpi: refactor error prone
build_header() and packed structures usage in ACPI tables you will see
he removes them and hardcode the sizes/offsets in
hw/arm/virt-acpu-build.c and removes the associated structs. Even the
enum values are not used anymore which is arguable but this seems to be
the default style now. Anyway there are some structs like AcpiViotMmio
which are not used in this series. Thanks Eric
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> Following the latest spec draft, and related acpica change
> https://jpbrucker.net/virtio-iommu/viot/viot-v9.pdf
> https://github.com/acpica/acpica/commit/fc4e33319c1ee08f20f5c44853dd8426643f6dfd
> ---
>  include/hw/acpi/acpi-defs.h | 60 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index cf9f44299c..adbf7d7b77 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -618,4 +618,64 @@ struct AcpiIortRC {
>  } QEMU_PACKED;
>  typedef struct AcpiIortRC AcpiIortRC;
>  
> +/*
> + * Virtual I/O Translation Table
> + */
> +struct AcpiViot {
> +    ACPI_TABLE_HEADER_DEF
> +    uint16_t node_count;
> +    uint16_t node_offset;
> +    uint8_t reserved[8];
> +} QEMU_PACKED;
> +typedef struct AcpiViot AcpiViot;
> +
> +#define ACPI_VIOT_NODE_HEADER_DEF   /* Fields common to all nodes */ \
> +    uint8_t type;          \
> +    uint8_t reserved;      \
> +    uint16_t length;
> +
> +/* Values for node Type above */
> +enum {
> +    ACPI_VIOT_NODE_PCI_RANGE = 0x01,
> +    ACPI_VIOT_NODE_MMIO = 0x02,
> +    ACPI_VIOT_NODE_VIRTIO_IOMMU_PCI = 0x03,
> +    ACPI_VIOT_NODE_VIRTIO_IOMMU_MMIO = 0x04,
> +};
> +
> +struct AcpiViotPciRange {
> +    ACPI_VIOT_NODE_HEADER_DEF
> +    uint32_t endpoint_start;
> +    uint16_t segment_start;
> +    uint16_t segment_end;
> +    uint16_t bdf_start;
> +    uint16_t bdf_end;
> +    uint16_t output_node;
> +    uint8_t reserved1[6];
> +} QEMU_PACKED;
> +typedef struct AcpiViotPciRange AcpiViotPciRange;
> +
> +struct AcpiViotMmio {
> +    ACPI_VIOT_NODE_HEADER_DEF
> +    uint32_t endpoint;
> +    uint64_t base_address;
> +    uint16_t output_node;
> +    uint8_t reserved1[6];
> +} QEMU_PACKED;
> +typedef struct AcpiViotMmio AcpiViotMmio;
> +
> +struct AcpiViotVirtioIommuPci {
> +    ACPI_VIOT_NODE_HEADER_DEF
> +    uint16_t segment;
> +    uint16_t bdf;
> +    uint8_t reserved1[8];
> +} QEMU_PACKED;
> +typedef struct AcpiViotVirtioIommuPci AcpiViotVirtioIommuPci;
> +
> +struct AcpiViotVirtioIommuMmio {
> +    ACPI_VIOT_NODE_HEADER_DEF
> +    uint8_t reserved1[4];
> +    uint64_t base_address;
> +} QEMU_PACKED;
> +typedef struct AcpiViotVirtioIommuMmio AcpiViotVirtioIommuMmio;
> +
>  #endif


