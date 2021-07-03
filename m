Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAED13BA98F
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 18:44:07 +0200 (CEST)
Received: from localhost ([::1]:55486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzikQ-0006Tf-WD
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 12:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lzij9-0005ex-2U
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 12:42:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lzij5-0000VQ-MT
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 12:42:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625330562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=23z4SMWjh30cZj1+Tj71n3UbEqFq8i862S8AE9GveXU=;
 b=BMcaHfW5hA2bCf1rmVGCuBUQsW0c/oVzHOZ9J4WZfTkG0SN+yzlNomI8NyPz5EX5i9avGN
 Uau5sZMF9fcrfXVtRobz1Y3550ARfwI0gJNeazcOIN2dK1F7mkXX0IPIZkfEL2hCaoNkPx
 aXkmsKv9Wg9EGuRuSlpwo+ZdLMEA1z0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-XKLkXzD6OtqqZqknXSkpUA-1; Sat, 03 Jul 2021 12:42:41 -0400
X-MC-Unique: XKLkXzD6OtqqZqknXSkpUA-1
Received: by mail-wr1-f69.google.com with SMTP id
 b3-20020a05600018a3b029011a84f85e1cso4678429wri.10
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 09:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=23z4SMWjh30cZj1+Tj71n3UbEqFq8i862S8AE9GveXU=;
 b=feoN0cEtJvM8NJShmat62ZZbtSlWiS37KM8O7gMV7pizmDswifi6qeNwmCpvZAK2WY
 ARjkvv4xLVLblz0AGs/lMakgwhk4UEsS0fGswlJNdeSC7gD/LpDjImBhC0OFjd3uhl+j
 31/fnoJMpzQ/5yniyGiSjtNn36jNtrCcRTkYYO0mYW/6fYla5j8ljN61lnEdWYdjWFBR
 jLd3sSyeeKbVgBQfD+KGZw57evcFCIJFwtXXi+v2g99m3rgtHjGzxJdh9XgkugivjVgl
 I358e3ZLFFJxGhY1zivVF8nqcWA80hiYI5USKfzZO3l2CGAsIx18YD8jhlXKQRG8Cndq
 +sjQ==
X-Gm-Message-State: AOAM533Ui8A0DjIpX2L7KQJYFVF8iz9xLm5H1tuXq+9wwmgS6kG060I5
 rxf00zv92BuqTfd0SjcS/PVUQFlSmBFT5ibBagYZXFNg5zn2y/uarRsb4KKrQhEPhK0ujPNB1Jl
 4uM69YtRWGMnXZH4=
X-Received: by 2002:a1c:4d0b:: with SMTP id o11mr5610951wmh.36.1625330560267; 
 Sat, 03 Jul 2021 09:42:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYe6a1kxjv/Q3qP737kjBlREDwqZH4E5a1T4ZK5LptE35Fl+AnppPGLIfiIYS8Sj2dl2m6TA==
X-Received: by 2002:a1c:4d0b:: with SMTP id o11mr5610923wmh.36.1625330560003; 
 Sat, 03 Jul 2021 09:42:40 -0700 (PDT)
Received: from redhat.com ([77.126.110.253])
 by smtp.gmail.com with ESMTPSA id n12sm7975255wmq.5.2021.07.03.09.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jul 2021 09:42:39 -0700 (PDT)
Date: Sat, 3 Jul 2021 12:42:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH] x86: add SEV hashing to fw_cfg for kernel/initrd/cmdline
Message-ID: <20210703123406-mutt-send-email-mst@kernel.org>
References: <20210525065931.1628554-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20210525065931.1628554-1-dovmurik@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Tobin Feldman-Fitzthum <tobin@ibm.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 25, 2021 at 06:59:31AM +0000, Dov Murik wrote:
> From: James Bottomley <jejb@linux.ibm.com>
> 
> If the VM is using memory encryption and also specifies a kernel/initrd
> or appended command line, calculate the hashes and add them to the
> encrypted data.  For this to work, OVMF must support an encrypted area
> to place the data which is advertised via a special GUID in the OVMF
> reset table (if the GUID doesn't exist, the user isn't allowed to pass
> in the kernel/initrd/cmdline via the fw_cfg interface).

Sorry about asking basic questions so late in the game.
I'm a bit curious why this feature makes sense. If someone can play
with a Linux kernel command line isn't it pretty much game over security
wise? What protections does Linux have against malicious actors
manipulating the command line?


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
> -- 
> 2.25.1


