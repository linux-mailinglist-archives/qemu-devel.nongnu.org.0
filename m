Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D51A13ABA99
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 19:24:17 +0200 (CEST)
Received: from localhost ([::1]:41390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltvkW-0001qe-Lo
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 13:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ltvio-00005S-Gy
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:22:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ltvij-0004ek-Iu
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:22:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623950543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c+qcfX1zc6UsLACHSmPltrR/crxMG0s1rSiZKubr3IE=;
 b=NSXb9BicFvlrQuwoGVqfgLKN6oCzfKHlfgLXAzhzoRf85BGbq5HpYkV6KZYMWSmw+DVnC1
 tuc+fIDoMJ7k+V9TqFiEl7GiA6ZWGJ2+06lHQLUReNh3lCQnMeYmKRjuPD3D3zgXECDDew
 d5rf18Rv9X4f96wZdkEeTghdC5LuH3A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-fxLxZUAON1OE8sycsN-CNg-1; Thu, 17 Jun 2021 13:22:19 -0400
X-MC-Unique: fxLxZUAON1OE8sycsN-CNg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1DBE8015C6;
 Thu, 17 Jun 2021 17:22:17 +0000 (UTC)
Received: from localhost (unknown [10.22.9.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 928471349A;
 Thu, 17 Jun 2021 17:22:14 +0000 (UTC)
Date: Thu, 17 Jun 2021 13:22:13 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH] x86: add SEV hashing to fw_cfg for kernel/initrd/cmdline
Message-ID: <20210617172213.j2c3o7h76zrsw2yt@habkost.net>
References: <20210525065931.1628554-1-dovmurik@linux.ibm.com>
 <20210615152033.czhsaz44yxtc5ext@habkost.net>
 <1cff8347-ee38-a0a8-f089-36b28a40b828@redhat.com>
 <06b28ac7-19ed-edd8-a555-2858e976d964@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <06b28ac7-19ed-edd8-a555-2858e976d964@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
 Brijesh Singh <brijesh.singh@amd.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 James Bottomley <jejb@linux.ibm.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 qemu-devel@nongnu.org, Laszlo Ersek <lersek@redhat.com>,
 Hubertus Franke <frankeh@us.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 17, 2021 at 03:48:52PM +0300, Dov Murik wrote:
> 
> 
> On 15/06/2021 22:53, Philippe Mathieu-Daudé wrote:
> > Hi Dov, James,
> > 
> > +Connor who asked to be reviewer.
> > 
> > On 6/15/21 5:20 PM, Eduardo Habkost wrote:
> >> On Tue, May 25, 2021 at 06:59:31AM +0000, Dov Murik wrote:
> >>> From: James Bottomley <jejb@linux.ibm.com>
> >>>
> >>> If the VM is using memory encryption and also specifies a kernel/initrd
> >>> or appended command line, calculate the hashes and add them to the
> >>> encrypted data.  For this to work, OVMF must support an encrypted area
> >>> to place the data which is advertised via a special GUID in the OVMF
> >>> reset table (if the GUID doesn't exist, the user isn't allowed to pass
> >>> in the kernel/initrd/cmdline via the fw_cfg interface).
> >>>
> >>> The hashes of each of the files is calculated (or the string in the case
> >>> of the cmdline with trailing '\0' included).  Each entry in the hashes
> >>> table is GUID identified and since they're passed through the memcrypt
> >>> interface, the hash of the encrypted data will be accumulated by the
> >>> PSP.
> >>>
> >>> Signed-off-by: James Bottomley <jejb@linux.ibm.com>
> >>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> >>> [dovmurik@linux.ibm.com: use machine->cgs, remove parsing of GUID
> >>> strings, remove GCC pragma, fix checkpatch errors]
> >>> ---
> >>>
> >>> OVMF support for handling the table of hashes (verifying that the
> >>> kernel/initrd/cmdline passed via the fw_cfg interface indeed correspond
> >>> to the measured hashes in the table) will be posted soon to edk2-devel.
> >>>
> >>> ---
> >>>  hw/i386/x86.c | 120 +++++++++++++++++++++++++++++++++++++++++++++++++-
> >>>  1 file changed, 119 insertions(+), 1 deletion(-)
> >>>
> >>
> >> This is not an objection to the patch itself, but: can we do
> >> something to move all sev-related code to sev.c?  It would make
> >> the process of assigning a maintainer and reviewing/merging
> >> future patches much simpler.
> >>
> >> I am not familiar with SEV internals, so my only question is
> >> about configurations where SEV is disabled:
> >>
> >> [...]
> >>> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> >>> @@ -778,6 +818,11 @@ void x86_load_linux(X86MachineState *x86ms,
> >>>      const char *initrd_filename = machine->initrd_filename;
> >>>      const char *dtb_filename = machine->dtb;
> >>>      const char *kernel_cmdline = machine->kernel_cmdline;
> >>> +    uint8_t buf[HASH_SIZE];
> >>> +    uint8_t *hash = buf;
> >>> +    size_t hash_len = sizeof(buf);
> >>> +    struct sev_hash_table *sev_ht = NULL;
> >>> +    int sev_ht_index = 0;
> > 
> > Can you move all these variable into a structure, and use it as a
> > SEV loader context?
> > 
> > Then each block of code you added can be moved to its own function,
> > self-described, working with the previous context.
> > 
> > The functions can be declared in sev_i386.h and defined in sev.c as
> > Eduardo suggested.
> > 
> 
> Thanks Philippe, I'll try this approach.
> 
> 
> I assume you mean that an addition like this:
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
> 
> will be extracted to a function, and here (in x86_load_linux()) replaced
> with a single call:
> 
>     sev_kernel_loader_calc_cmdline_hash(&sev_loader_context, kernel_cmdline);
>   
> and that function will have an empty stub in non-SEV builds, and a do-
> nothing condition (at the beginning) if it's an SEV-disabled VM, and
> will do the actual work in SEV VMs.
> 
> Right?

I would suggest a generic notification mechanism instead, where
SEV code could register to be notified after the kernel/initrd is
loaded.

Maybe the existing qemu_add_machine_init_done_notifier()
mechanism would be enough for this?  Is there a reason the hash
calculation needs to be done inside x86_load_linux(),
specifically?

> 
> 
> Also, should I base my next version on top of the current master, or on
> top of your SEV-Housekeeping patch series, or on top of some other tree?
> 
> 
> -Dov
> 
> >>>  
> >>>      /* Align to 16 bytes as a paranoia measure */
> >>>      cmdline_size = (strlen(kernel_cmdline) + 16) & ~15;
> >>> @@ -799,6 +844,22 @@ void x86_load_linux(X86MachineState *x86ms,
> >>>          exit(1);
> >>>      }
> >>>  
> >>> +    if (machine->cgs && machine->cgs->ready) {
> >>
> >> machine->cgs doesn't seem to be a SEV-specific field.
> >> What if machine->cgs->ready is set but SEV is disabled?
> >>
> >>> +        uint8_t *data;
> >>> +        struct sev_hash_table_descriptor *area;
> >>> +
> >>> +        if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
> >>> +            fprintf(stderr, "qemu: kernel command line specified but OVMF has "
> >>> +                    "no hash table guid\n");
> >>> +            exit(1);
> >>> +        }
> >>> +        area = (struct sev_hash_table_descriptor *)data;
> >>> +
> >>> +        sev_ht = qemu_map_ram_ptr(NULL, area->base);
> >>> +        memcpy(sev_ht->guid, sev_hash_table_header_guid, sizeof(sev_ht->guid));
> >>> +        sev_ht->len = sizeof(*sev_ht);
> >>> +    }
> >>> +
> >>>      /* kernel protocol version */
> >>>      if (ldl_p(header + 0x202) == 0x53726448) {
> >>>          protocol = lduw_p(header + 0x206);
> >> [...]
> >>
> > 
> 

-- 
Eduardo


