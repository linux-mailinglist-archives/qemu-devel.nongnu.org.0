Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81683417C8E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 22:50:40 +0200 (CEST)
Received: from localhost ([::1]:45662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTs9U-00028j-Hx
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 16:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mTs6V-0000KS-BK
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 16:47:31 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:5150
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mTs6T-0001g9-7m
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 16:47:31 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18OKAAlC016133; 
 Fri, 24 Sep 2021 16:47:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=9fHjH7Xxqc6AZ96rtBicKxlpcIkc94qK4NUu7N07D3I=;
 b=T096sIypjG+TaOedvL5WXWeA33vqCiz4EmjhyK4Thcm897EMajy8PV9qVql7dWHs9fAj
 REjM0M+rNyI/akJdgrK9zLLCGSjOPreLnQxksjZrN81W2stBJZE4ePjfBnYgHJodTjEW
 waXcSn0sKXCY49Hp91hu677aFcsOVKFdoEB40hxCGRU7YWYCzCz4GhXWOfk2Kw115FEu
 KidVsCV4TRViXnDqKrpsNwBQtwg5zUjqYLKPVhBDjLF28zT2BZ6SYHTjUDtinFz4sMZW
 wM1eX7tgi5KvXPzLYdqGnGKdWDU36EqG+z6c48I4DwYW5k+TwAwrfgPcP7jJS9zmLf6f bg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3b9abkr91m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 16:47:26 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18OKkkaE022382;
 Fri, 24 Sep 2021 16:47:25 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3b9abkr91e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 16:47:25 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18OKSBaM014273;
 Fri, 24 Sep 2021 20:47:25 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 3b93g9mpse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 20:47:25 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18OKlOCp41091534
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Sep 2021 20:47:24 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83D6D28059;
 Fri, 24 Sep 2021 20:47:24 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F5022805E;
 Fri, 24 Sep 2021 20:47:24 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 24 Sep 2021 20:47:24 +0000 (GMT)
Subject: Re: [PATCH v4 15/35] acpi: build_tpm_tcpa: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210924122802.1455362-1-imammedo@redhat.com>
 <20210924122802.1455362-16-imammedo@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <61a5abfa-f779-c6f3-79e9-a36680e1ee11@linux.ibm.com>
Date: Fri, 24 Sep 2021 16:46:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210924122802.1455362-16-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: j9uBADbKbLLyz6Tf76mJLyjfQVSAFle2
X-Proofpoint-ORIG-GUID: 1m7ME_26YjISlBl5ZdKnBmpJkEPPZOlm
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-24_05,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1011 priorityscore=1501
 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2109240124
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: ani@anisinha.ca, Eric Auger <eric.auger@redhat.com>,
 stefanb@linux.vnet.ibm.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 8:27 AM, Igor Mammedov wrote:

> it replaces error-prone pointer arithmetic for build_header() API,
> with 2 calls to start and finish table creation,
> which hides offsets magic from API user.
>
> While at it switch to build_append_int_noprefix() to build
> table entries (which also removes some manual offset
> calculations).
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>

Tested-by: Stefan Berger <stefanb@linux.ibm.com>


> ---
> v2:
>    * fix assert when starting QEMU with TPM 1.2
>        Stefan Berger <stefanb@linux.ibm.com>
> v3:
>   * fix invalid checksum, by putting acpi_table_composed()
>     after pointer patching
>   * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/
>
> CC: stefanb@linux.vnet.ibm.com
> ---
>   include/hw/acpi/acpi-defs.h | 14 --------------
>   hw/i386/acpi-build.c        | 38 ++++++++++++++++++++++---------------
>   2 files changed, 23 insertions(+), 29 deletions(-)
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
> index 1587fe5a20..9fa6d7665b 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1878,31 +1878,39 @@ build_hpet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
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
> +    unsigned log_addr_offset;
> +    AcpiTable table = { .sig = "TCPA", .rev = 2,
> +                        .oem_id = oem_id, .oem_table_id = oem_table_id };
>
> -    tcpa->platform_class = cpu_to_le16(TPM_TCPA_ACPI_CLASS_CLIENT);
> -    tcpa->log_area_minimum_length = cpu_to_le32(TPM_LOG_AREA_MINIMUM_SIZE);
> -    acpi_data_push(tcpalog, le32_to_cpu(tcpa->log_area_minimum_length));
> +    acpi_table_begin(&table, table_data);
> +    /* Platform Class */
> +    build_append_int_noprefix(table_data, TPM_TCPA_ACPI_CLASS_CLIENT, 2);
> +    /* Log Area Minimum Length (LAML) */
> +    build_append_int_noprefix(table_data, TPM_LOG_AREA_MINIMUM_SIZE, 4);
> +    /* Log Area Start Address (LASA) */
> +    log_addr_offset = table_data->len;
> +    build_append_int_noprefix(table_data, 0, 8);
>
> +    /* allocate/reserve space for TPM log area */
> +    acpi_data_push(tcpalog, TPM_LOG_AREA_MINIMUM_SIZE);
>       bios_linker_loader_alloc(linker, ACPI_BUILD_TPMLOG_FILE, tcpalog, 1,
>                                false /* high memory */);
> -
>       /* log area start address to be filled by Guest linker */
> -    bios_linker_loader_add_pointer(linker,
> -        ACPI_BUILD_TABLE_FILE, log_addr_offset, log_addr_size,
> -        ACPI_BUILD_TPMLOG_FILE, 0);
> +    bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
> +        log_addr_offset, 8, ACPI_BUILD_TPMLOG_FILE, 0);
>
> -    build_header(linker, table_data,
> -                 (void *)(table_data->data + tcpa_start),
> -                 "TCPA", sizeof(*tcpa), 2, oem_id, oem_table_id);
> +    acpi_table_end(linker, &table);
>   }
>   #endif
>

