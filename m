Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EACDA1FB0E1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 14:37:06 +0200 (CEST)
Received: from localhost ([::1]:53972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlApu-00072x-0y
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 08:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jlAms-0003Iu-Hq
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 08:33:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32935
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jlAmq-0005Fc-IZ
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 08:33:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592310835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N/ebmebsjLDt3TJpu8HX9oDLWKA9koiwZKXkaYKQh10=;
 b=CbkcVFySxDYJxfDyM3mkRA55p223xbYe2mVzObdpL8VAcSh3XJxgPZRHcqxyccH47NFfGM
 TncXCZTQ/DT/Iyvff3hqWdMl1REC7m9Zw0/70svYMWACHz7QUTqNs2w3+6demygXYRR+np
 DYA8y9uZNpHziXBhRduBwfUEaVcZS4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-UA0NP7x_OlGBYzjanJNZbQ-1; Tue, 16 Jun 2020 08:33:53 -0400
X-MC-Unique: UA0NP7x_OlGBYzjanJNZbQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61F8B102C812;
 Tue, 16 Jun 2020 12:33:52 +0000 (UTC)
Received: from localhost (unknown [10.40.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38EF919D7D;
 Tue, 16 Jun 2020 12:33:29 +0000 (UTC)
Date: Tue, 16 Jun 2020 14:33:27 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v4 1/5] acpi: Convert build_tpm2() to build_append* API
Message-ID: <20200616143327.2ee38a48@redhat.com>
In-Reply-To: <20200611135917.18300-2-eric.auger@redhat.com>
References: <20200611135917.18300-1-eric.auger@redhat.com>
 <20200611135917.18300-2-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:46:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, mst@redhat.com,
 philmd@redhat.com, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcandre.lureau@redhat.com, eric.auger.pro@gmail.com,
 lersek@redhat.com, ardb@kernel.org, stefanb@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Jun 2020 15:59:13 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> In preparation of its move to the generic acpi code,
> let's convert build_tpm2() to use build_append API. This
> latter now is prefered in place of direct ACPI struct field
> settings with manual endianness conversion.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v3 -> v4:
> - Don't use Acpi20TPM2 *tpm2_ptr anymore
> - Use variables for control area start address and start method
> - Simplified arg values passed to bios_linker_loader_add_pointer
> - use g_assert_not_reached()
> ---
>  hw/i386/acpi-build.c | 49 +++++++++++++++++++++++++++++---------------
>  1 file changed, 33 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index b5669d6c65..f150d95ecc 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2298,35 +2298,52 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
>  static void
>  build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
>  {
> -    Acpi20TPM2 *tpm2_ptr = acpi_data_push(table_data, sizeof *tpm2_ptr);
> -    unsigned log_addr_size = sizeof(tpm2_ptr->log_area_start_address);
> -    unsigned log_addr_offset =
> -        (char *)&tpm2_ptr->log_area_start_address - table_data->data;
> +    uint8_t start_method_params[12] = {};
> +    unsigned log_addr_offset, tpm2_start;
> +    uint64_t control_area_start_address;
> +    uint32_t start_method;
> +    void *tpm2_ptr;
>  
> -    tpm2_ptr->platform_class = cpu_to_le16(TPM2_ACPI_CLASS_CLIENT);
> +    tpm2_start = table_data->len;
> +    tpm2_ptr = acpi_data_push(table_data, sizeof(AcpiTableHeader));
> +
> +    /* Platform Class */
> +    build_append_int_noprefix(table_data, TPM2_ACPI_CLASS_CLIENT, 2);
> +    /* Reserved */
> +    build_append_int_noprefix(table_data, 0, 2);
>      if (TPM_IS_TIS_ISA(tpm_find())) {
> -        tpm2_ptr->control_area_address = cpu_to_le64(0);
> -        tpm2_ptr->start_method = cpu_to_le32(TPM2_START_METHOD_MMIO);
> +        control_area_start_address = 0;
> +        start_method = TPM2_START_METHOD_MMIO;
>      } else if (TPM_IS_CRB(tpm_find())) {
> -        tpm2_ptr->control_area_address = cpu_to_le64(TPM_CRB_ADDR_CTRL);
> -        tpm2_ptr->start_method = cpu_to_le32(TPM2_START_METHOD_CRB);
> +        control_area_start_address = TPM_CRB_ADDR_CTRL;
> +        start_method = TPM2_START_METHOD_CRB;
>      } else {
> -        g_warn_if_reached();
> +        g_assert_not_reached();
>      }
> +    /* Address of Control Area */
> +    build_append_int_noprefix(table_data, control_area_start_address, 8);
> +    /* Start Method */
> +    build_append_int_noprefix(table_data, start_method, 4);
>  
> -    tpm2_ptr->log_area_minimum_length =
> -        cpu_to_le32(TPM_LOG_AREA_MINIMUM_SIZE);
> +    /* Platform Specific Parameters */
> +    g_array_append_vals(table_data, &start_method_params,
> +                        ARRAY_SIZE(start_method_params));
>  
> -    acpi_data_push(tcpalog, le32_to_cpu(tpm2_ptr->log_area_minimum_length));
> +    /* Log Area Minimum Length */
> +    build_append_int_noprefix(table_data, TPM_LOG_AREA_MINIMUM_SIZE, 4);

question not related to conversion:
Is it a part of 'Platform Specific Parameters'?
(as per spec table ends with it. if yes, then probably add pointer to place in spec
wher its documented.

> +
> +    acpi_data_push(tcpalog, TPM_LOG_AREA_MINIMUM_SIZE);
>      bios_linker_loader_alloc(linker, ACPI_BUILD_TPMLOG_FILE, tcpalog, 1,
>                               false);
>  
> -    /* log area start address to be filled by Guest linker */
> +    log_addr_offset = table_data->len;
> +    build_append_int_noprefix(table_data, 0, 8);
> +    /* Log Area Start Address to be filled by Guest linker */
move this line to where it used to be or at least above build_append_int_noprefix()

>      bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
> -                                   log_addr_offset, log_addr_size,
> +                                   log_addr_offset, 8,
>                                     ACPI_BUILD_TPMLOG_FILE, 0);
>      build_header(linker, table_data,
> -                 (void *)tpm2_ptr, "TPM2", sizeof(*tpm2_ptr), 4, NULL, NULL);
> +                 tpm2_ptr, "TPM2", table_data->len - tpm2_start, 4, NULL, NULL);
>  }
>  
>  #define HOLE_640K_START  (640 * KiB)

nevertheless looks like faithfull conversion,
btw why you didn't drop Acpi20TPM2 structure definition?


