Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1983B7519
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 17:22:28 +0200 (CEST)
Received: from localhost ([::1]:47124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyFZD-0007E3-Ex
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 11:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lyFWG-0003tU-Ju
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:19:24 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lyFWD-0007yK-Nt
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:19:24 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15TF44Fh166525
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:19:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=RL0ial3DWZq7UgMuC7IkmY5fw0VI8C+fA1Q5juSDflE=;
 b=T6HfaxvFT7qOAx0xTAJHP+bQ4ZjtDTfiiWKo2/S0QnCmicASwJEMo2u8SqqcsjYRMELN
 5r72lIWPNK0P1VO0UFozQfX1UoEiwgbN9iLlBkO80/5wn+jM3aSUVX90g20tbZycfs81
 FOuxu+1GK3DYHgkwWbF13EKV6mu2wG9cELk0Bre1sUDkPYh+QsX5iLgKO0kLaRKqM+DQ
 LeiVZ2WYexvHTCNHTNKm3suId25vKrFL3+ftomGdrQrwqtVGiyOuqIm+RN5B5xQsDOED
 hxui2w1uyggh0/4dmOdPVZ2jZcdRToMFPxKzii3kzKKoDEPCmlz3Oox5dQoZAkght3IE Tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39g4unjkcv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:19:20 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15TF4TsJ167919
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:19:19 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39g4unjkcm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jun 2021 11:19:19 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15TFIJp3008631;
 Tue, 29 Jun 2021 15:19:19 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma05wdc.us.ibm.com with ESMTP id 39duvbs52u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jun 2021 15:19:19 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15TFJIdE24576262
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Jun 2021 15:19:18 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2EA88C09BD;
 Tue, 29 Jun 2021 15:19:18 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBCD8C09B8;
 Tue, 29 Jun 2021 15:19:17 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 29 Jun 2021 15:19:17 +0000 (GMT)
Subject: Re: [PATCH 33/53] acpi: build_tpm_tcpa: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210625091818.1047980-1-imammedo@redhat.com>
 <20210625091818.1047980-35-imammedo@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <f25b9842-40b3-f65d-2ab6-e87d71c65f91@linux.ibm.com>
Date: Tue, 29 Jun 2021 11:19:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210625091818.1047980-35-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: i2xWGlb6UEttfQuR21c1ojjQEVC8Ic29
X-Proofpoint-GUID: 1X6k-mbH4bCF-FWnacJptCJJ32SCsram
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-29_07:2021-06-28,
 2021-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 mlxscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106290097
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: stefanb@linux.vnet.ibm.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/25/21 5:17 AM, Igor Mammedov wrote:

> it replaces error-prone pointer arithmetic for build_header() API,
> with 2 calls to start and finish table creation,
> which hides offsets magic from API user.
>
> While at it switch to build_append_int_noprefix() to build
> table entries (which also removes some manual offset
> calculations).
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>


Patch 19, 24 and this one applied causes this error here when using a 
TPM 1.2:

qemu-system-x86_64: ../hw/acpi/bios-linker-loader.c:286: 
bios_linker_loader_add_pointer: Assertion `source_file' failed.


    Stefan


> ---
> CC: marcel.apfelbaum@gmail.com
> CC: stefanb@linux.vnet.ibm.com
> ---
>   include/hw/acpi/acpi-defs.h | 14 -------------
>   hw/i386/acpi-build.c        | 39 +++++++++++++++++++++----------------
>   2 files changed, 22 insertions(+), 31 deletions(-)
>
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index 4d8f8b34b0..3b42b138f0 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -418,20 +418,6 @@ struct AcpiSratProcessorGiccAffinity {
>
>   typedef struct AcpiSratProcessorGiccAffinity AcpiSratProcessorGiccAffinity;
>
> -/*
> - * TCPA Description Table
> - *
> - * Following Level 00, Rev 00.37 of specs:
> - * http://www.trustedcomputinggroup.org/resources/tcg_acpi_specification
> - */
> -struct Acpi20Tcpa {
> -    ACPI_TABLE_HEADER_DEF                    /* ACPI common table header */
> -    uint16_t platform_class;
> -    uint32_t log_area_minimum_length;
> -    uint64_t log_area_start_address;
> -} QEMU_PACKED;
> -typedef struct Acpi20Tcpa Acpi20Tcpa;
> -
>   /* DMAR - DMA Remapping table r2.2 */
>   struct AcpiTableDmar {
>       ACPI_TABLE_HEADER_DEF
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 96ad3e1b9d..bc45a666f6 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1849,31 +1849,36 @@ build_hpet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
>   }
>
>   #ifdef CONFIG_TPM
> +/*
> + * TCPA Description Table
> + *
> + * Following Level 00, Rev 00.37 of specs:
> + * http://www.trustedcomputinggroup.org/resources/tcg_acpi_specification
> + * 7.1.2 ACPI Table Layout
> + */
>   static void
>   build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
>                  const char *oem_id, const char *oem_table_id)
>   {
> -    int tcpa_start = table_data->len;
> -    Acpi20Tcpa *tcpa = acpi_data_push(table_data, sizeof *tcpa);
> -    unsigned log_addr_size = sizeof(tcpa->log_area_start_address);
> -    unsigned log_addr_offset =
> -        (char *)&tcpa->log_area_start_address - table_data->data;
> +    AcpiTable table = { .sig = "TCPA", .rev = 2,
> +                        .oem_id = oem_id, .oem_table_id = oem_table_id };
>
> -    tcpa->platform_class = cpu_to_le16(TPM_TCPA_ACPI_CLASS_CLIENT);
> -    tcpa->log_area_minimum_length = cpu_to_le32(TPM_LOG_AREA_MINIMUM_SIZE);
> -    acpi_data_push(tcpalog, le32_to_cpu(tcpa->log_area_minimum_length));
> +    acpi_init_table(&table, table_data);
> +    /* Platform Class */
> +    build_append_int_noprefix(table_data, TPM_TCPA_ACPI_CLASS_CLIENT, 2);
> +    /* Log Area Minimum Length (LAML) */
> +    build_append_int_noprefix(table_data, TPM_LOG_AREA_MINIMUM_SIZE, 4);
> +    /* Log Area Start Address (LASA) */
> +    /* log area start address to be filled by Guest linker */
> +    bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
> +        table_data->len, 8, ACPI_BUILD_TPMLOG_FILE, 0);
> +    build_append_int_noprefix(table_data, 0, 8);
> +    acpi_table_composed(linker, &table);
>
> +    /* allocate/reserve space for TPM log area */
> +    acpi_data_push(tcpalog, TPM_LOG_AREA_MINIMUM_SIZE);
>       bios_linker_loader_alloc(linker, ACPI_BUILD_TPMLOG_FILE, tcpalog, 1,
>                                false /* high memory */);
> -
> -    /* log area start address to be filled by Guest linker */
> -    bios_linker_loader_add_pointer(linker,
> -        ACPI_BUILD_TABLE_FILE, log_addr_offset, log_addr_size,
> -        ACPI_BUILD_TPMLOG_FILE, 0);
> -
> -    build_header(linker, table_data,
> -                 (void *)(table_data->data + tcpa_start),
> -                 "TCPA", sizeof(*tcpa), 2, oem_id, oem_table_id);
>   }
>   #endif
>

