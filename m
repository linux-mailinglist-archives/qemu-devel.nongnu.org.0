Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BC43A5D70
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 09:09:41 +0200 (CEST)
Received: from localhost ([::1]:55254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsgj6-0006z7-Gy
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 03:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lsgi9-0006Iq-RA
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 03:08:41 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:24834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lsgi6-0000wn-Gj
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 03:08:41 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15E73XgY179539; Mon, 14 Jun 2021 03:08:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=MAGtd5FN0vIkoVt8VQBJa+k0ksOiZ6gDqGEqmZbK1O4=;
 b=qEK9J5Do4sqTXf/Sbgnkjs+u/Sl1WtybBcEQ0N0dVeLcmWodiyOeSJfSe4BBnJqEKJkG
 6BGkn2RfNqQF8GBRbj1YJQjW9fY/XtQ+8KH2vEfRqY8NotR76Zn5864BBWJUwlCNQ92U
 q+5OUZf+jfEm9OS/pi+N/Xhqe9hvXTTMpA7Mdo7CKUrW3sH9UVN67znC3ELV17L+sAdt
 WkHzCfs3WJutAlFIbOTmU2wGolv4aNa3vtUnkdP/HAa1o14i38EZPHmW4mY+hyH19EDE
 EjnKCuwc8ZLCXSdEU5Fwus9yVTuY44yXWX/QORwhHfXnVClNlE0uLeV8GXlduO5X+Tjo Mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3962ct038y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 03:08:33 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15E73c5I180023;
 Mon, 14 Jun 2021 03:08:32 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3962ct0380-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 03:08:32 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15E72Uoe002424;
 Mon, 14 Jun 2021 07:08:30 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 394m6hrrx5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 07:08:30 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15E78Rc435520870
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Jun 2021 07:08:27 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DBB552057;
 Mon, 14 Jun 2021 07:08:27 +0000 (GMT)
Received: from [9.148.12.78] (unknown [9.148.12.78])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 7A9DF52075;
 Mon, 14 Jun 2021 07:08:26 +0000 (GMT)
Subject: Re: [PATCH] x86: add SEV hashing to fw_cfg for kernel/initrd/cmdline
To: qemu-devel@nongnu.org
References: <20210525065931.1628554-1-dovmurik@linux.ibm.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <24983c32-fbb8-30cf-b140-0e9c2bfd6679@linux.ibm.com>
Date: Mon, 14 Jun 2021 10:08:26 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210525065931.1628554-1-dovmurik@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AGRMSEhq1M5gIjcFmNbEnrVoBV8DfOSe
X-Proofpoint-ORIG-GUID: ml7vP6ZxCNglM8n34x90yTLQ_SXunyP8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-13_11:2021-06-11,
 2021-06-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106140051
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.144,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Hubertus Franke <frankeh@us.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping


Reminder: this is to support secure (measured) boot with AMD SEV with
QEMU's -kernel/-initrd/-append switches.

The OVMF side of the implementation is under review (with some changes
requested), but so far no functional changes are exepcted from the QEMU
side, on top of this proposed patch.


(+Cc: Dave)

-Dov


On 25/05/2021 9:59, Dov Murik wrote:
> From: James Bottomley <jejb@linux.ibm.com>
> 
> If the VM is using memory encryption and also specifies a kernel/initrd
> or appended command line, calculate the hashes and add them to the
> encrypted data.  For this to work, OVMF must support an encrypted area
> to place the data which is advertised via a special GUID in the OVMF
> reset table (if the GUID doesn't exist, the user isn't allowed to pass
> in the kernel/initrd/cmdline via the fw_cfg interface).
> 
> The hashes of each of the files is calculated (or the string in the case
> of the cmdline with trailing '\0' included).  Each entry in the hashes
> table is GUID identified and since they're passed through the memcrypt
> interface, the hash of the encrypted data will be accumulated by the
> PSP.
> 
> Signed-off-by: James Bottomley <jejb@linux.ibm.com>
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> [dovmurik@linux.ibm.com: use machine->cgs, remove parsing of GUID
> strings, remove GCC pragma, fix checkpatch errors]
> ---
> 
> OVMF support for handling the table of hashes (verifying that the
> kernel/initrd/cmdline passed via the fw_cfg interface indeed correspond
> to the measured hashes in the table) will be posted soon to edk2-devel.
> 
> ---
>  hw/i386/x86.c | 120 +++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 119 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index ed796fe6ba..d8e77b99b4 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -37,12 +37,16 @@
>  #include "sysemu/replay.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/cpu-timers.h"
> +#include "sysemu/sev.h"
> +#include "exec/confidential-guest-support.h"
>  #include "trace.h"
> +#include "crypto/hash.h"
>  
>  #include "hw/i386/x86.h"
>  #include "target/i386/cpu.h"
>  #include "hw/i386/topology.h"
>  #include "hw/i386/fw_cfg.h"
> +#include "hw/i386/pc.h"
>  #include "hw/intc/i8259.h"
>  #include "hw/rtc/mc146818rtc.h"
>  
> @@ -758,6 +762,42 @@ static bool load_elfboot(const char *kernel_filename,
>      return true;
>  }
>  
> +struct sev_hash_table_descriptor {
> +    uint32_t base;
> +    uint32_t size;
> +};
> +
> +/* hard code sha256 digest size */
> +#define HASH_SIZE 32
> +
> +struct sev_hash_table_entry {
> +    uint8_t guid[16];
> +    uint16_t len;
> +    uint8_t hash[HASH_SIZE];
> +} __attribute__ ((packed));
> +
> +struct sev_hash_table {
> +    uint8_t guid[16];
> +    uint16_t len;
> +    struct sev_hash_table_entry entries[];
> +} __attribute__((packed));
> +
> +#define SEV_HASH_TABLE_RV_GUID "7255371f-3a3b-4b04-927b-1da6efa8d454"
> +
> +static const uint8_t sev_hash_table_header_guid[] =
> +        UUID_LE(0x9438d606, 0x4f22, 0x4cc9, 0xb4, 0x79, 0xa7, 0x93,
> +                0xd4, 0x11, 0xfd, 0x21);
> +
> +static const uint8_t sev_kernel_entry_guid[] =
> +        UUID_LE(0x4de79437, 0xabd2, 0x427f, 0xb8, 0x35, 0xd5, 0xb1,
> +                0x72, 0xd2, 0x04, 0x5b);
> +static const uint8_t sev_initrd_entry_guid[] =
> +        UUID_LE(0x44baf731, 0x3a2f, 0x4bd7, 0x9a, 0xf1, 0x41, 0xe2,
> +                0x91, 0x69, 0x78, 0x1d);
> +static const uint8_t sev_cmdline_entry_guid[] =
> +        UUID_LE(0x97d02dd8, 0xbd20, 0x4c94, 0xaa, 0x78, 0xe7, 0x71,
> +                0x4d, 0x36, 0xab, 0x2a);
> +
>  void x86_load_linux(X86MachineState *x86ms,
>                      FWCfgState *fw_cfg,
>                      int acpi_data_size,
> @@ -778,6 +818,11 @@ void x86_load_linux(X86MachineState *x86ms,
>      const char *initrd_filename = machine->initrd_filename;
>      const char *dtb_filename = machine->dtb;
>      const char *kernel_cmdline = machine->kernel_cmdline;
> +    uint8_t buf[HASH_SIZE];
> +    uint8_t *hash = buf;
> +    size_t hash_len = sizeof(buf);
> +    struct sev_hash_table *sev_ht = NULL;
> +    int sev_ht_index = 0;
>  
>      /* Align to 16 bytes as a paranoia measure */
>      cmdline_size = (strlen(kernel_cmdline) + 16) & ~15;
> @@ -799,6 +844,22 @@ void x86_load_linux(X86MachineState *x86ms,
>          exit(1);
>      }
>  
> +    if (machine->cgs && machine->cgs->ready) {
> +        uint8_t *data;
> +        struct sev_hash_table_descriptor *area;
> +
> +        if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
> +            fprintf(stderr, "qemu: kernel command line specified but OVMF has "
> +                    "no hash table guid\n");
> +            exit(1);
> +        }
> +        area = (struct sev_hash_table_descriptor *)data;
> +
> +        sev_ht = qemu_map_ram_ptr(NULL, area->base);
> +        memcpy(sev_ht->guid, sev_hash_table_header_guid, sizeof(sev_ht->guid));
> +        sev_ht->len = sizeof(*sev_ht);
> +    }
> +
>      /* kernel protocol version */
>      if (ldl_p(header + 0x202) == 0x53726448) {
>          protocol = lduw_p(header + 0x206);
> @@ -925,6 +986,17 @@ void x86_load_linux(X86MachineState *x86ms,
>      fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, strlen(kernel_cmdline) + 1);
>      fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline);
>  
> +    if (sev_ht) {
> +        struct sev_hash_table_entry *e = &sev_ht->entries[sev_ht_index++];
> +
> +        qcrypto_hash_bytes(QCRYPTO_HASH_ALG_SHA256, (char *)kernel_cmdline,
> +                           strlen(kernel_cmdline) + 1,
> +                           &hash, &hash_len, &error_fatal);
> +        memcpy(e->hash, hash, hash_len);
> +        e->len = sizeof(*e);
> +        memcpy(e->guid, sev_cmdline_entry_guid, sizeof(e->guid));
> +    }
> +
>      if (protocol >= 0x202) {
>          stl_p(header + 0x228, cmdline_addr);
>      } else {
> @@ -1008,6 +1080,17 @@ void x86_load_linux(X86MachineState *x86ms,
>  
>          stl_p(header + 0x218, initrd_addr);
>          stl_p(header + 0x21c, initrd_size);
> +
> +        if (sev_ht) {
> +            struct sev_hash_table_entry *e = &sev_ht->entries[sev_ht_index++];
> +
> +            qcrypto_hash_bytes(QCRYPTO_HASH_ALG_SHA256, (char *)initrd_data,
> +                               initrd_size, &hash, &hash_len, &error_fatal);
> +            memcpy(e->hash, hash, hash_len);
> +            e->len = sizeof(*e);
> +            memcpy(e->guid, sev_initrd_entry_guid, sizeof(e->guid));
> +        }
> +
>      }
>  
>      /* load kernel and setup */
> @@ -1063,7 +1146,17 @@ void x86_load_linux(X86MachineState *x86ms,
>          load_image_size(dtb_filename, setup_data->data, dtb_size);
>      }
>  
> -    memcpy(setup, header, MIN(sizeof(header), setup_size));
> +    /*
> +     * If we're doing an encrypted VM (sev_ht will be set), it will be
> +     * OVMF based, which uses the efi stub for booting and doesn't
> +     * require any values to be placed in the kernel header.  We
> +     * therefore don't update the header so the hash of the kernel on
> +     * the other side of the fw_cfg interface matches the hash of the
> +     * file the user passed in.
> +     */
> +    if (!sev_ht) {
> +        memcpy(setup, header, MIN(sizeof(header), setup_size));
> +    }
>  
>      fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
>      fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
> @@ -1073,6 +1166,31 @@ void x86_load_linux(X86MachineState *x86ms,
>      fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_SIZE, setup_size);
>      fw_cfg_add_bytes(fw_cfg, FW_CFG_SETUP_DATA, setup, setup_size);
>  
> +    if (sev_ht) {
> +        struct iovec iov[2] = {
> +            {.iov_base = (char *)setup, .iov_len = setup_size },
> +            {.iov_base = (char *)kernel, .iov_len = kernel_size }
> +        };
> +        struct sev_hash_table_entry *e = &sev_ht->entries[sev_ht_index++];
> +        int len;
> +
> +        qcrypto_hash_bytesv(QCRYPTO_HASH_ALG_SHA256, iov, 2,
> +                            &hash, &hash_len, &error_fatal);
> +        memcpy(e->hash, hash, hash_len);
> +        e->len = sizeof(*e);
> +        memcpy(e->guid, sev_kernel_entry_guid, sizeof(e->guid));
> +
> +        /* now we have all the possible entries, finalize the hash table */
> +        sev_ht->len += sev_ht_index * sizeof(*e);
> +        /* SEV len has to be 16 byte aligned */
> +        len = ROUND_UP(sev_ht->len, 16);
> +        if (len != sev_ht->len) {
> +            /* zero the excess data so hash can be reliably calculated */
> +            memset(&sev_ht->entries[sev_ht_index], 0, len - sev_ht->len);
> +        }
> +
> +        sev_encrypt_flash((uint8_t *)sev_ht, len, &error_fatal);
> +    }
>      option_rom[nb_option_roms].bootindex = 0;
>      option_rom[nb_option_roms].name = "linuxboot.bin";
>      if (linuxboot_dma_enabled && fw_cfg_dma_enabled(fw_cfg)) {
> 

