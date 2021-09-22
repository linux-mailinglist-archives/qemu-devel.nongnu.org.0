Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70395414AA8
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 15:37:51 +0200 (CEST)
Received: from localhost ([::1]:57650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT2Ra-0002u3-GJ
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 09:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mT2OK-0001Fr-RH
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:34:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mT2OC-0002Jt-Ku
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:34:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632317659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wnLE/jMVsNXBHV8ZmOE16/BDNw08yMGuo0hRhaDTaBI=;
 b=cPi3U+E4qkIFINYyy66D/grCqtrhDsE+vykpLudvmxJTGsFRBZ1D9kO/eLTw8WaCs66saL
 Sq84KTmxwvsxaRvjguDBi9tSjrI2c6/CexY6FlXRT/SrsNfjx4SSnawCmZdY1b14U4YXPM
 Iz0WaUuRMGJZaOtYbvjAwxvqXOQGezo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-_7BK91ScOAuThlkl9Of3BQ-1; Wed, 22 Sep 2021 09:34:18 -0400
X-MC-Unique: _7BK91ScOAuThlkl9Of3BQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 x7-20020a5d6507000000b0015dada209b1so2150951wru.15
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 06:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wnLE/jMVsNXBHV8ZmOE16/BDNw08yMGuo0hRhaDTaBI=;
 b=VKoqEWD/S0p8Jjq2gbJaM8MWtiENhjd/yb8rsTSzJYalz3EMLUsndN1oCuzu0INN6P
 O/lmKZTvua2W9Rz2qsq2kjIjo82yf8m3J25JqfCwPAruZ9NrPS21ontAjgut0mTSP7bZ
 lZSpd+RpTR5dvlTkNhvTt/nlMl32rOUF9ijmSCqHRUnGVUuMQ9WUwEQIVK9paeckEZky
 TmIZ5BzCmEtMKGI8K1madn2lx02aFNck3L5HZbZHO1T3QBBe1/2MGpQCqJSkw3hOaIri
 MwJ4DSuNzbkaJkwdPokKg8A5CFioZs/JiJE7qk0ai3423Ao022un+D/mCbXtUIaTOHPN
 MCLg==
X-Gm-Message-State: AOAM5318DHiTt4KbQ2e/70PvPYlKOqQLZNNC9ZbPSHwi7M+LJDWvzWf6
 X+sVcsu81oM99oC/tHR4AMGUk5leYx2iSIh9nV5PidsuuAIv2IYfPo9C7Y9h6hsf6SWpeusBp+q
 pXyfxUnO5d5PaeSE=
X-Received: by 2002:a05:6000:168b:: with SMTP id
 y11mr37371321wrd.350.1632317656822; 
 Wed, 22 Sep 2021 06:34:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxP63LZxmsflBIqY/HCJzOA1YjLVOeDyMENT+KDhh7YLl2IgvSqYlXLLzsbOEZ9gYnBFTnHLw==
X-Received: by 2002:a05:6000:168b:: with SMTP id
 y11mr37371298wrd.350.1632317656647; 
 Wed, 22 Sep 2021 06:34:16 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id i2sm2131743wrq.78.2021.09.22.06.34.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 06:34:16 -0700 (PDT)
Subject: Re: [PATCH v3 34/35] acpi: remove no longer used build_header()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-35-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <809b14cc-c5a3-bc23-a917-f0c1abda057b@redhat.com>
Date: Wed, 22 Sep 2021 15:34:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210907144814.741785-35-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/7/21 4:48 PM, Igor Mammedov wrote:
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  include/hw/acpi/acpi-defs.h | 25 -------------------------
>  include/hw/acpi/aml-build.h |  4 ----
>  hw/acpi/aml-build.c         | 23 -----------------------
>  3 files changed, 52 deletions(-)
> 
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index 1a0774edd6..ee733840aa 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -48,31 +48,6 @@ typedef struct AcpiRsdpData {
>      unsigned *xsdt_tbl_offset;
>  } AcpiRsdpData;
>  
> -/* Table structure from Linux kernel (the ACPI tables are under the
> -   BSD license) */
> -
> -
> -#define ACPI_TABLE_HEADER_DEF   /* ACPI common table header */ \
> -    uint32_t signature;          /* ACPI signature (4 ASCII characters) */ \
> -    uint32_t length;                 /* Length of table, in bytes, including header */ \
> -    uint8_t  revision;               /* ACPI Specification minor version # */ \
> -    uint8_t  checksum;               /* To make sum of entire table == 0 */ \
> -    uint8_t  oem_id[6] \
> -                 QEMU_NONSTRING;     /* OEM identification */ \
> -    uint8_t  oem_table_id[8] \
> -                 QEMU_NONSTRING;     /* OEM table identification */ \
> -    uint32_t oem_revision;           /* OEM revision number */ \
> -    uint8_t  asl_compiler_id[4] \
> -                 QEMU_NONSTRING;     /* ASL compiler vendor ID */ \
> -    uint32_t asl_compiler_revision;  /* ASL compiler revision number */
> -
> -
> -/* ACPI common table header */
> -struct AcpiTableHeader {
> -    ACPI_TABLE_HEADER_DEF
> -} QEMU_PACKED;
> -typedef struct AcpiTableHeader AcpiTableHeader;
> -
>  struct AcpiGenericAddress {
>      uint8_t space_id;        /* Address space where struct or register exists */
>      uint8_t bit_width;       /* Size in bits of given register */
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 6f3d1de1b1..b8272c239a 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -445,10 +445,6 @@ void acpi_table_begin(AcpiTable *desc, GArray *array);
>   */
>  void acpi_table_end(BIOSLinker *linker, AcpiTable *table);
>  
> -void
> -build_header(BIOSLinker *linker, GArray *table_data,
> -             AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
> -             const char *oem_id, const char *oem_table_id);
>  void *acpi_data_push(GArray *table_data, unsigned size);
>  unsigned acpi_data_len(GArray *table);
>  void acpi_add_table(GArray *table_offsets, GArray *table_data);
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 4135b385e5..b261ecfbc1 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1754,29 +1754,6 @@ void acpi_table_end(BIOSLinker *linker, AcpiTable *desc)
>          desc->table_offset, table_len, desc->table_offset + checksum_offset);
>  }
>  
> -void
> -build_header(BIOSLinker *linker, GArray *table_data,
> -             AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
> -             const char *oem_id, const char *oem_table_id)
> -{
> -    unsigned tbl_offset = (char *)h - table_data->data;
> -    unsigned checksum_offset = (char *)&h->checksum - table_data->data;
> -    memcpy(&h->signature, sig, 4);
> -    h->length = cpu_to_le32(len);
> -    h->revision = rev;
> -
> -    strpadcpy((char *)h->oem_id, sizeof h->oem_id, oem_id, ' ');
> -    strpadcpy((char *)h->oem_table_id, sizeof h->oem_table_id,
> -              oem_table_id, ' ');
> -
> -    h->oem_revision = cpu_to_le32(1);
> -    memcpy(h->asl_compiler_id, ACPI_BUILD_APPNAME8, 4);
> -    h->asl_compiler_revision = cpu_to_le32(1);
> -    /* Checksum to be filled in by Guest linker */
> -    bios_linker_loader_add_checksum(linker, ACPI_BUILD_TABLE_FILE,
> -        tbl_offset, len, checksum_offset);
> -}
> -
>  void *acpi_data_push(GArray *table_data, unsigned size)
>  {
>      unsigned off = table_data->len;
> 


