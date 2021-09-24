Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D13417CA4
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 22:57:25 +0200 (CEST)
Received: from localhost ([::1]:52922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTsG3-0007bA-WA
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 16:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mTsBS-0004vw-PI
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 16:52:38 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mTsBQ-0005Ix-S9
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 16:52:38 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18OIZHkK021128; 
 Fri, 24 Sep 2021 16:52:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=uetpReA7qP1JtycIEsMPshKN9V80rah21cPbDiJUjho=;
 b=gIXRO4S3r9/qmF3/p+EGAYXA8beJo5r2pv1tQHpByjW/6t4AQufkglgw1zVwqHOlMhDz
 uTRNr0+5Cl1+XzmRKSXg4fyx6keH+ArZWMShMkkvvVagr/J23sv+7s9mdWt0OmE4DxYK
 WG0ecTkgLjhGN8TOJb9W0PlpodB2PYetMI1Iswb7GSpmXGm+fRwwy4c1EKMLKxpWXjVz
 SsabfAbHm3gaDHqaZOPq7XpH4wWczJa/+1umXIlVh8/l4trhk5eU/H3UVZ1bD1tV6h0/
 nL7VCCrhr3iGnCSj2U74Dv5fgoL9NEmgkYkG2HVPymNIMS8uw9zejHPzjY6y0HlrGftA wQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b9m31acnn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 16:52:33 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18OKnL3Y002454;
 Fri, 24 Sep 2021 16:52:33 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b9m31acmm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 16:52:33 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18OKlvls030132;
 Fri, 24 Sep 2021 20:52:31 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma05wdc.us.ibm.com with ESMTP id 3b93g7msg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 20:52:31 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18OKqUJw32178530
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Sep 2021 20:52:30 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB4F9136055;
 Fri, 24 Sep 2021 20:52:30 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 772F313605D;
 Fri, 24 Sep 2021 20:52:30 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 24 Sep 2021 20:52:30 +0000 (GMT)
Subject: Re: [PATCH v4 01/35] acpi: add helper routines to initialize ACPI
 tables
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210924122802.1455362-1-imammedo@redhat.com>
 <20210924122802.1455362-2-imammedo@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <645791e4-abf1-4f30-0a73-f93370906381@linux.ibm.com>
Date: Fri, 24 Sep 2021 16:52:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210924122802.1455362-2-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3BJRkh8wSNeA7Gsau_9rcWp6rggHG8Lb
X-Proofpoint-GUID: sW4M8oJbdrTGl_iklrz8xnOozBLukwlo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-24_05,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109240124
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: ani@anisinha.ca, Eric Auger <eric.auger@redhat.com>, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 9/24/21 8:27 AM, Igor Mammedov wrote:
> Patch introduces acpi_table_begin()/ acpi_table_end() API
> that hides pointer/offset arithmetic from user as opposed
> to build_header(), to prevent errors caused by it [1].
>
>   acpi_table_begin():
>       initializes table header and keeps track of
>       table data/offsets
>   acpi_table_end():
>       sets actual table length and tells bios loader
>       where table is for the later initialization on
>       guest side.
>
> 1) commits
>     bb9feea43179 x86: acpi: use offset instead of pointer when using build_header()
>     4d027afeb3a9 Virt: ACPI: fix qemu assert due to re-assigned table data address
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>

Tested-by: Stefan Berger <stefanb@linux.ibm.com>


> ---
> CC: eric.auger@redhat.com
> ---
>   include/hw/acpi/aml-build.h | 31 +++++++++++++++++++
>   hw/acpi/aml-build.c         | 62 +++++++++++++++++++++++++++++++++++++
>   2 files changed, 93 insertions(+)
>
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 471266d739..4242382399 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -413,6 +413,37 @@ Aml *aml_concatenate(Aml *source1, Aml *source2, Aml *target);
>   Aml *aml_object_type(Aml *object);
>
>   void build_append_int_noprefix(GArray *table, uint64_t value, int size);
> +
> +typedef struct AcpiTable {
> +    const char *sig;
> +    const uint8_t rev;
> +    const char *oem_id;
> +    const char *oem_table_id;
> +    /* private vars tracking table state */
> +    GArray *array;
> +    unsigned table_offset;
> +} AcpiTable;
> +
> +/**
> + * acpi_table_begin:
> + * initializes table header and keeps track of
> + * table data/offsets
> + * @desc: ACPI table descriptor
> + * @array: blob where the ACPI table will be composed/stored.
> + */
> +void acpi_table_begin(AcpiTable *desc, GArray *array);
> +
> +/**
> + * acpi_table_end:
> + * sets actual table length and tells bios loader
> + * where table is for the later initialization on
> + * guest side.
> + * @linker: reference to BIOSLinker object to use for the table
> + * @table: ACPI table descriptor that was used with @acpi_table_begin
> + * counterpart
> + */
> +void acpi_table_end(BIOSLinker *linker, AcpiTable *table);
> +
>   void
>   build_header(BIOSLinker *linker, GArray *table_data,
>                AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index d5103e6d7b..229a3eb654 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -52,6 +52,19 @@ static void build_append_byte(GArray *array, uint8_t val)
>       g_array_append_val(array, val);
>   }
>
> +static void build_append_padded_str(GArray *array, const char *str,
> +                                    size_t maxlen, char pad)
> +{
> +    size_t i;
> +    size_t len = strlen(str);
> +
> +    g_assert(len <= maxlen);
> +    g_array_append_vals(array, str, len);
> +    for (i = maxlen - len; i > 0; i--) {
> +        g_array_append_val(array, pad);
> +    }
> +}
> +
>   static void build_append_array(GArray *array, GArray *val)
>   {
>       g_array_append_vals(array, val->data, val->len);
> @@ -1692,6 +1705,55 @@ Aml *aml_object_type(Aml *object)
>       return var;
>   }
>
> +void acpi_table_begin(AcpiTable *desc, GArray *array)
> +{
> +
> +    desc->array = array;
> +    desc->table_offset = array->len;
> +
> +    /*
> +     * ACPI spec 1.0b
> +     * 5.2.3 System Description Table Header
> +     */
> +    g_assert(strlen(desc->sig) == 4);
> +    g_array_append_vals(array, desc->sig, 4); /* Signature */
> +    /*
> +     * reserve space for Length field, which will be patched by
> +     * acpi_table_end() when the table creation is finished.
> +     */
> +    build_append_int_noprefix(array, 0, 4); /* Length */
> +    build_append_int_noprefix(array, desc->rev, 1); /* Revision */
> +    build_append_int_noprefix(array, 0, 1); /* Checksum */
> +    build_append_padded_str(array, desc->oem_id, 6, ' '); /* OEMID */
> +    /* OEM Table ID */
> +    build_append_padded_str(array, desc->oem_table_id, 8, ' ');
> +    build_append_int_noprefix(array, 1, 4); /* OEM Revision */
> +    g_array_append_vals(array, ACPI_BUILD_APPNAME8, 4); /* Creator ID */
> +    build_append_int_noprefix(array, 1, 4); /* Creator Revision */
> +}
> +
> +void acpi_table_end(BIOSLinker *linker, AcpiTable *desc)
> +{
> +    /*
> +     * ACPI spec 1.0b
> +     * 5.2.3 System Description Table Header
> +     * Table 5-2 DESCRIPTION_HEADER Fields
> +     */
> +    const unsigned checksum_offset = 9;
> +    uint32_t table_len = desc->array->len - desc->table_offset;
> +    uint32_t table_len_le = cpu_to_le32(table_len);
> +    gchar *len_ptr = &desc->array->data[desc->table_offset + 4];
> +
> +    /* patch "Length" field that has been reserved by acpi_table_begin()
> +     * to the actual length, i.e. accumulated table length from
> +     * acpi_table_begin() till acpi_table_end()
> +     */
> +    memcpy(len_ptr, &table_len_le, sizeof table_len_le);
> +
> +    bios_linker_loader_add_checksum(linker, ACPI_BUILD_TABLE_FILE,
> +        desc->table_offset, table_len, desc->table_offset + checksum_offset);
> +}
> +
>   void
>   build_header(BIOSLinker *linker, GArray *table_data,
>                AcpiTableHeader *h, const char *sig, int len, uint8_t rev,

