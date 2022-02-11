Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4D64B2074
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 09:45:58 +0100 (CET)
Received: from localhost ([::1]:44670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIRYz-00082z-AE
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 03:45:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nIRWu-0006yo-UP
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 03:43:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nIRWr-0003JJ-AU
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 03:43:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644569023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KunN1UgPbX6NHg3E3I/a5XEWL0JPZD5EmHgzY0PsKXc=;
 b=eosu6zQRVXE6Qv8j5W1gQFNDvzZCpol0TZQ6+s1+iimCqnZaa8iuVdd85X3o7sbCm7v1Lx
 KSW1pyOO4G89+2dUKCU4iW/6q2IyMV5lebwGY8OI2guxdZHSvfRjyn+v/kTdWySiqPyewl
 6G505jKhdmzedTais5OqbYBIX5QAOFQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-Lk1PWc0uPvKwkU5EtxRUOA-1; Fri, 11 Feb 2022 03:43:37 -0500
X-MC-Unique: Lk1PWc0uPvKwkU5EtxRUOA-1
Received: by mail-ed1-f72.google.com with SMTP id
 o6-20020a50c906000000b0040f6ac3dbb5so4920797edh.17
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 00:43:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KunN1UgPbX6NHg3E3I/a5XEWL0JPZD5EmHgzY0PsKXc=;
 b=E+WvS7/Kyl+u3DRUM+Qptca3ZHtbsiMCbTB4t9ZgfLlIjzi+ChZdKqgfs3m4yWZdsb
 5GDrOe/odC7IE7uKb5aOApq4XOEBZ2p0+Z15xtAjen9jbiwWhuGt+JhdvSithJKHAZgz
 2roxRySLGcq9KMID/ToIAn0564lO2CoIHprWrOC4ZPsduBSVQRCWkhBE4+4pyqwgfX8u
 JI8ghcWjhwbBe1eBjIeRN5ARWQZJ7qBXbt/K5PN2seXWvwcus770okf94yLLbCh+edDb
 f+kF0abR3uLbMGgSMVEofcnZ3QpOsvGVacxqH24OCl7JskGDiVDhfbv1PGED72jHNnt0
 ekSw==
X-Gm-Message-State: AOAM5327AnOjxpnFTOvkNQeQRFRHkjOPRNIuH/PznZK0xeLBcA3A3viY
 jCuRwmFeSAYur7niJ299RQZmIUq3sDLE6I2UWaouAOgtI4dC0r4Rdl4S6bBCiY0q4/qoFAUIccP
 p55m3jaRCTSP3Wnw=
X-Received: by 2002:a17:906:40d3:: with SMTP id
 a19mr430626ejk.759.1644569016584; 
 Fri, 11 Feb 2022 00:43:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznK8vw7Ckyb6/1hapPoVBHQwkhKxjzDRPYKFtzsmpgdq/MkHzvYcjHZ6WSz8LKKWnCriQRlA==
X-Received: by 2002:a17:906:40d3:: with SMTP id
 a19mr430615ejk.759.1644569016370; 
 Fri, 11 Feb 2022 00:43:36 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id fi3sm5497738ejc.168.2022.02.11.00.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 00:43:35 -0800 (PST)
Date: Fri, 11 Feb 2022 09:43:34 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v2 1/3] hw/smbios: code cleanup - use macro definitions
 for table base addresses
Message-ID: <20220211094334.7d5fedee@redhat.com>
In-Reply-To: <20220207113129.2701722-2-ani@anisinha.ca>
References: <20220207113129.2701722-1-ani@anisinha.ca>
 <20220207113129.2701722-2-ani@anisinha.ca>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  7 Feb 2022 17:01:27 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> This is a minor cleanup. Using macro definitions makes the code more
> readable. It is at once clear which tables use which starting base addresses.
> It also makes it easy to calculate the gaps between the addresses and modify
> them if needed.
> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/smbios/smbios.c | 38 ++++++++++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 6013df1698..56b412ce35 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -549,9 +549,23 @@ bool smbios_skip_table(uint8_t type, bool required_table)
>      return true;
>  }
>  
> +#define T0_BASE 0x000
> +#define T1_BASE 0x100
> +#define T2_BASE 0x200
> +#define T3_BASE 0x300
> +#define T4_BASE 0x400
> +#define T11_BASE 0xe00
> +
> +#define T16_BASE 0x1000
> +#define T17_BASE 0x1100
> +#define T19_BASE 0x1300
> +#define T32_BASE 0x2000
> +#define T41_BASE 0x2900
> +#define T127_BASE 0x7F00
> +
>  static void smbios_build_type_0_table(void)
>  {
> -    SMBIOS_BUILD_TABLE_PRE(0, 0x000, false); /* optional, leave up to BIOS */
> +    SMBIOS_BUILD_TABLE_PRE(0, T0_BASE, false); /* optional, leave up to BIOS */
>  
>      SMBIOS_TABLE_SET_STR(0, vendor_str, type0.vendor);
>      SMBIOS_TABLE_SET_STR(0, bios_version_str, type0.version);
> @@ -599,7 +613,7 @@ static void smbios_encode_uuid(struct smbios_uuid *uuid, QemuUUID *in)
>  
>  static void smbios_build_type_1_table(void)
>  {
> -    SMBIOS_BUILD_TABLE_PRE(1, 0x100, true); /* required */
> +    SMBIOS_BUILD_TABLE_PRE(1, T1_BASE, true); /* required */
>  
>      SMBIOS_TABLE_SET_STR(1, manufacturer_str, type1.manufacturer);
>      SMBIOS_TABLE_SET_STR(1, product_name_str, type1.product);
> @@ -619,7 +633,7 @@ static void smbios_build_type_1_table(void)
>  
>  static void smbios_build_type_2_table(void)
>  {
> -    SMBIOS_BUILD_TABLE_PRE(2, 0x200, false); /* optional */
> +    SMBIOS_BUILD_TABLE_PRE(2, T2_BASE, false); /* optional */
>  
>      SMBIOS_TABLE_SET_STR(2, manufacturer_str, type2.manufacturer);
>      SMBIOS_TABLE_SET_STR(2, product_str, type2.product);
> @@ -637,7 +651,7 @@ static void smbios_build_type_2_table(void)
>  
>  static void smbios_build_type_3_table(void)
>  {
> -    SMBIOS_BUILD_TABLE_PRE(3, 0x300, true); /* required */
> +    SMBIOS_BUILD_TABLE_PRE(3, T3_BASE, true); /* required */
>  
>      SMBIOS_TABLE_SET_STR(3, manufacturer_str, type3.manufacturer);
>      t->type = 0x01; /* Other */
> @@ -662,7 +676,7 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
>  {
>      char sock_str[128];
>  
> -    SMBIOS_BUILD_TABLE_PRE(4, 0x400 + instance, true); /* required */
> +    SMBIOS_BUILD_TABLE_PRE(4, T4_BASE + instance, true); /* required */
>  
>      snprintf(sock_str, sizeof(sock_str), "%s%2x", type4.sock_pfx, instance);
>      SMBIOS_TABLE_SET_STR(4, socket_designation_str, sock_str);
> @@ -702,7 +716,7 @@ static void smbios_build_type_11_table(void)
>          return;
>      }
>  
> -    SMBIOS_BUILD_TABLE_PRE(11, 0xe00, true); /* required */
> +    SMBIOS_BUILD_TABLE_PRE(11, T11_BASE, true); /* required */
>  
>      snprintf(count_str, sizeof(count_str), "%zu", type11.nvalues);
>      t->count = type11.nvalues;
> @@ -722,7 +736,7 @@ static void smbios_build_type_16_table(unsigned dimm_cnt)
>  {
>      uint64_t size_kb;
>  
> -    SMBIOS_BUILD_TABLE_PRE(16, 0x1000, true); /* required */
> +    SMBIOS_BUILD_TABLE_PRE(16, T16_BASE, true); /* required */
>  
>      t->location = 0x01; /* Other */
>      t->use = 0x03; /* System memory */
> @@ -749,7 +763,7 @@ static void smbios_build_type_17_table(unsigned instance, uint64_t size)
>      char loc_str[128];
>      uint64_t size_mb;
>  
> -    SMBIOS_BUILD_TABLE_PRE(17, 0x1100 + instance, true); /* required */
> +    SMBIOS_BUILD_TABLE_PRE(17, T17_BASE + instance, true); /* required */
>  
>      t->physical_memory_array_handle = cpu_to_le16(0x1000); /* Type 16 above */
>      t->memory_error_information_handle = cpu_to_le16(0xFFFE); /* Not provided */
> @@ -790,7 +804,7 @@ static void smbios_build_type_19_table(unsigned instance,
>  {
>      uint64_t end, start_kb, end_kb;
>  
> -    SMBIOS_BUILD_TABLE_PRE(19, 0x1300 + instance, true); /* required */
> +    SMBIOS_BUILD_TABLE_PRE(19, T19_BASE + instance, true); /* required */
>  
>      end = start + size - 1;
>      assert(end > start);
> @@ -814,7 +828,7 @@ static void smbios_build_type_19_table(unsigned instance,
>  
>  static void smbios_build_type_32_table(void)
>  {
> -    SMBIOS_BUILD_TABLE_PRE(32, 0x2000, true); /* required */
> +    SMBIOS_BUILD_TABLE_PRE(32, T32_BASE, true); /* required */
>  
>      memset(t->reserved, 0, 6);
>      t->boot_status = 0; /* No errors detected */
> @@ -828,7 +842,7 @@ static void smbios_build_type_41_table(Error **errp)
>      struct type41_instance *t41;
>  
>      QTAILQ_FOREACH(t41, &type41, next) {
> -        SMBIOS_BUILD_TABLE_PRE(41, 0x2900 + instance, true);
> +        SMBIOS_BUILD_TABLE_PRE(41, T41_BASE + instance, true);
>  
>          SMBIOS_TABLE_SET_STR(41, reference_designation_str, t41->designation);
>          t->device_type = t41->kind;
> @@ -871,7 +885,7 @@ static void smbios_build_type_41_table(Error **errp)
>  
>  static void smbios_build_type_127_table(void)
>  {
> -    SMBIOS_BUILD_TABLE_PRE(127, 0x7F00, true); /* required */
> +    SMBIOS_BUILD_TABLE_PRE(127, T127_BASE, true); /* required */
>      SMBIOS_BUILD_TABLE_POST;
>  }
>  


