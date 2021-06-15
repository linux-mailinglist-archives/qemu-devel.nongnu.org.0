Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 625EA3A83D9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:23:37 +0200 (CEST)
Received: from localhost ([::1]:58092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltAue-0002Xk-DK
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ltAru-0006MX-Ox
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:20:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ltArs-0005X8-BG
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:20:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623770443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C0my8vawIcm2IdoNkJONg3OWFTTM/LgswqFK8C0PzkI=;
 b=hF74l+zBEeY6Fx6LEpRIIt95K4sFnfMbLyIpPYSbSt37s7EZHu7bVF1hUWouAzJ+Us5FXJ
 F7nPREF7N5loOXlGFyiNEBDUhnVC0OE10pwKyD2OMnGQLbejdlL+Sw1983YF1J9Fv5/Odp
 S8hOepsGoMHREsYUSqJRRsaXkPdwbSo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-LZJKGDLdPWyQn70DwBj43A-1; Tue, 15 Jun 2021 11:20:42 -0400
X-MC-Unique: LZJKGDLdPWyQn70DwBj43A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF5185BCB3;
 Tue, 15 Jun 2021 15:20:37 +0000 (UTC)
Received: from localhost (unknown [10.22.8.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 671EA60877;
 Tue, 15 Jun 2021 15:20:34 +0000 (UTC)
Date: Tue, 15 Jun 2021 11:20:33 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH] x86: add SEV hashing to fw_cfg for kernel/initrd/cmdline
Message-ID: <20210615152033.czhsaz44yxtc5ext@habkost.net>
References: <20210525065931.1628554-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20210525065931.1628554-1-dovmurik@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
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

This is not an objection to the patch itself, but: can we do
something to move all sev-related code to sev.c?  It would make
the process of assigning a maintainer and reviewing/merging
future patches much simpler.

I am not familiar with SEV internals, so my only question is
about configurations where SEV is disabled:

[...]
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
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

machine->cgs doesn't seem to be a SEV-specific field.
What if machine->cgs->ready is set but SEV is disabled?

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
[...]

-- 
Eduardo


