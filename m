Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 548BC303CE0
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 13:23:16 +0100 (CET)
Received: from localhost ([::1]:55248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4NNL-00043y-Dl
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 07:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l4NMS-0003Kx-6T
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 07:22:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l4NMQ-0005e6-0U
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 07:22:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611663736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HvQxIVMU7q003Q/u4RTQnCUtE1eszriH2uaRXEgNtcM=;
 b=PnXUYl4M+EqkU50DkOk+nmLDGMD6X+ppJ5CP29kiJ6C6Hzx13yAERhafe9fCX8aYyZP1sL
 sU/Wtg5FZbjdB08CW5viA9DHNN+AgvhB1Nb2EQQROMeD8x1q2eFasKatpGC7yObkGUWPC9
 iCP8BllriYtjEcVGtaASKzi9ygPlI/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-PLoUvyAsM6yAagONtTC2Kg-1; Tue, 26 Jan 2021 07:22:15 -0500
X-MC-Unique: PLoUvyAsM6yAagONtTC2Kg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 061AC107ACE3;
 Tue, 26 Jan 2021 12:22:13 +0000 (UTC)
Received: from work-vm (ovpn-115-24.ams2.redhat.com [10.36.115.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82D5B5D9C2;
 Tue, 26 Jan 2021 12:22:10 +0000 (UTC)
Date: Tue, 26 Jan 2021 12:22:07 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: James Bottomley <jejb@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] pc: add parser for OVMF reset block
Message-ID: <20210126122207.GA4221@work-vm>
References: <20201214154429.11023-1-jejb@linux.ibm.com>
 <20201214154429.11023-2-jejb@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20201214154429.11023-2-jejb@linux.ibm.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: thomas.lendacky@amd.com, ashish.kalra@amd.com, brijesh.singh@amd.com,
 david.kaplan@amd.com, berrange@redhat.com, jon.grimm@amd.com, tobin@ibm.com,
 qemu-devel@nongnu.org, frankeh@us.ibm.com, Dov.Murik1@il.ibm.com,
 pbonzini@redhat.com, dovmurik@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* James Bottomley (jejb@linux.ibm.com) wrote:
> OVMF is developing a mechanism for depositing a GUIDed table just
> below the known location of the reset vector.  The table goes
> backwards in memory so all entries are of the form
> 
> <data>|len|<GUID>
> 
> Where <data> is arbtrary size and type, <len> is a uint16_t and
> describes the entire length of the entry from the beginning of the
> data to the end of the guid.
> 
> The foot of the table is of this form and <len> for this case
> describes the entire size of the table.  The table foot GUID is
> defined by OVMF as 96b582de-1fb2-45f7-baea-a366c55a082d and if the
> table is present this GUID is just below the reset vector, 48 bytes
> before the end of the firmware file.
> 
> Add a parser for the ovmf reset block which takes a copy of the block,
> if the table foot guid is found, minus the footer and a function for
> later traversal to return the data area of any specified GUIDs.
> 
> Signed-off-by: James Bottomley <jejb@linux.ibm.com>
> 
> ---
> 
> v2: fix brace warnings and return values
> ---
>  hw/i386/pc_sysfw.c   | 106 +++++++++++++++++++++++++++++++++++++++++++
>  include/hw/i386/pc.h |   4 ++
>  2 files changed, 110 insertions(+)
> 
> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
> index 92e90ff013..436b78c587 100644
> --- a/hw/i386/pc_sysfw.c
> +++ b/hw/i386/pc_sysfw.c
> @@ -124,6 +124,107 @@ void pc_system_flash_cleanup_unused(PCMachineState *pcms)
>      }
>  }
>  
> +#define OVMF_TABLE_FOOTER_GUID "96b582de-1fb2-45f7-baea-a366c55a082d"
> +
> +static uint8_t *ovmf_table;
> +static int ovmf_table_len;
> +
> +static void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, int flash_size)

Maybe size_t for flash_size?

> +{
> +    uint8_t *ptr;
> +    QemuUUID guid;
> +    int tot_len;
> +
> +    /* should only be called once */
> +    if (ovmf_table) {
> +        return;
> +    }
> +
> +    /*
> +     * if this is OVMF there will be a table footer
> +     * guid 48 bytes before the end of the flash file.  If it's
> +     * not found, silently abort the flash parsing.
> +     */
> +    qemu_uuid_parse(OVMF_TABLE_FOOTER_GUID, &guid);
> +    guid = qemu_uuid_bswap(guid); /* guids are LE */
> +    ptr = flash_ptr + flash_size - 48;

I think since flash_size is coming from memory_region_size it's probably
rounded to a page size by now, but perhaps we should always check we
have enough space before we start moving pointers around

(Given that the OVMF binary might be provided by the guest owner, we
have to consider it might be a vector to attack the hypervisor).

> +    if (!qemu_uuid_is_equal((QemuUUID *)ptr, &guid)) {
> +        return;
> +    }
> +
> +    /* if found, just before is two byte table length */
> +    ptr -= sizeof(uint16_t);
> +    tot_len = le16_to_cpu(*(uint16_t *)ptr) - sizeof(guid) - sizeof(uint16_t);
> +
> +    if (tot_len <= 0) {
> +        return;
> +    }
> +
> +    ovmf_table = g_malloc(tot_len);
> +    ovmf_table_len = tot_len;
> +
> +    /*
> +     * ptr is the foot of the table, so copy it all to the newly
> +     * allocated ovmf_table and then set the ovmf_table pointer
> +     * to the table foot
> +     */
> +    memcpy(ovmf_table, ptr - tot_len, tot_len);
> +    ovmf_table += tot_len;
> +}
> +
> +bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
> +                               int *data_len)
> +{
> +    uint8_t *ptr = ovmf_table;
> +    int tot_len = ovmf_table_len;
> +    QemuUUID entry_guid;
> +
> +    if (qemu_uuid_parse(entry, &entry_guid) < 0) {
> +        return false;
> +    }
> +
> +    if (!ptr) {
> +        return false;
> +    }
> +
> +    entry_guid = qemu_uuid_bswap(entry_guid); /* guids are LE */
> +    while (tot_len > 0) {
> +        int len;
> +        QemuUUID *guid;
> +
> +        /*
> +         * The data structure is
> +         *   arbitrary length data
> +         *   2 byte length of entire entry
> +         *   16 byte guid
> +         */
> +        guid = (QemuUUID *)(ptr - sizeof(QemuUUID));
> +        len = le16_to_cpu(*(uint16_t *)(ptr - sizeof(QemuUUID) -
> +                                        sizeof(uint16_t)));

Again I think we need to be checking tot_len > (sizeof(QemuUUID) +
sizeof(uint16_t)) before doing this dereference.

> +        /*
> +         * just in case the table is corrupt, wouldn't want to spin in
> +         * the zero case
> +         */
> +        if (len < sizeof(QemuUUID) + sizeof(uint16_t)) {
> +                return false;
> +        }
> +
> +        ptr -= len;
> +        tot_len -= len;

and that len is smaller or equal to tot_len here.

> +        if (qemu_uuid_is_equal(guid, &entry_guid)) {
> +            if (data) {
> +                *data = ptr;
> +            }
> +            if (data_len) {
> +                *data_len = len - sizeof(QemuUUID) - sizeof(uint16_t);
> +            }
> +            return true;
> +        }
> +    }
> +    return false;
> +}
> +
>  /*
>   * Map the pcms->flash[] from 4GiB downward, and realize.
>   * Map them in descending order, i.e. pcms->flash[0] at the top,
> @@ -195,6 +296,11 @@ static void pc_system_flash_map(PCMachineState *pcms,
>              if (kvm_memcrypt_enabled()) {
>                  flash_ptr = memory_region_get_ram_ptr(flash_mem);
>                  flash_size = memory_region_size(flash_mem);
> +                /*
> +                 * OVMF places a GUIDed structures in the flash, so
> +                 * search for them
> +                 */
> +                pc_system_parse_ovmf_flash(flash_ptr, flash_size);
>                  ret = kvm_memcrypt_encrypt_data(flash_ptr, flash_size);
>                  if (ret) {
>                      error_report("failed to encrypt pflash rom");
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 2aa8797c6e..19a53f745f 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -3,6 +3,7 @@
>  
>  #include "qemu/notify.h"
>  #include "qapi/qapi-types-common.h"
> +#include "qemu/uuid.h"
>  #include "hw/boards.h"
>  #include "hw/block/fdc.h"
>  #include "hw/block/flash.h"
> @@ -188,6 +189,9 @@ ISADevice *pc_find_fdc0(void);
>  void pc_system_flash_create(PCMachineState *pcms);
>  void pc_system_flash_cleanup_unused(PCMachineState *pcms);
>  void pc_system_firmware_init(PCMachineState *pcms, MemoryRegion *rom_memory);
> +bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
> +                               int *data_len);
> +
>  
>  /* acpi-build.c */
>  void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
> -- 
> 2.26.2
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


