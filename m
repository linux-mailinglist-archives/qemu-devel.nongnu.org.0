Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 207D185135
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 18:37:18 +0200 (CEST)
Received: from localhost ([::1]:43476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvOw9-0000mm-CC
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 12:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44285)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hvOvd-0000M6-6F
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 12:36:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hvOvc-0004SZ-6E
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 12:36:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38264)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hvOvc-0004RP-0q
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 12:36:44 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ECFCB3C91A;
 Wed,  7 Aug 2019 16:36:42 +0000 (UTC)
Received: from work-vm (ovpn-117-204.ams2.redhat.com [10.36.117.204])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94F141000343;
 Wed,  7 Aug 2019 16:36:41 +0000 (UTC)
Date: Wed, 7 Aug 2019 17:36:39 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Singh, Brijesh" <brijesh.singh@amd.com>
Message-ID: <20190807163639.GK2867@work-vm>
References: <20190806165429.19327-1-brijesh.singh@amd.com>
 <20190806165429.19327-7-brijesh.singh@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190806165429.19327-7-brijesh.singh@amd.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Wed, 07 Aug 2019 16:36:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 06/14] hw/machine: introduce
 MachineMemoryEncryptionOps for encrypted VMs
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "Lendacky,
 Thomas" <Thomas.Lendacky@amd.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Singh, Brijesh (brijesh.singh@amd.com) wrote:
> When memory encryption is enabled in VM, the guest RAM will be encrypted
> with the guest-specific key, to protect the confidentiality of data while
> in transit we need to platform specific hooks to save or migrate the
> guest RAM. The MemoryEncryptionOps introduced in this patch will be later
> used by the migration.
> 
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>

OK, I can imagine adding some Error ** parameters to those perhaps or
maybe some different length types; but for now that's a good start;

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  include/hw/boards.h | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index c5446a39cf..ba80c236fe 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -105,6 +105,29 @@ typedef struct {
>      CPUArchId cpus[0];
>  } CPUArchIdList;
>  
> +/**
> + * The functions registers with MachineMemoryEncryptionOps will be used during
> + * the encrypted guest migration.
> + */
> +struct MachineMemoryEncryptionOps {
> +    /* Initialize the platform specific state before starting the migration */
> +    int (*save_setup)(const char *pdh, const char *plat_cert,
> +                      const char *amd_cert);
> +
> +    /* Write the encrypted page and metadata associated with it */
> +    int (*save_outgoing_page)(QEMUFile *f, uint8_t *ptr, uint32_t size,
> +                              uint64_t *bytes_sent);
> +
> +    /* Load the incoming encrypted page into guest memory */
> +    int (*load_incoming_page)(QEMUFile *f, uint8_t *ptr);
> +
> +    /* Write the page encryption state bitmap */
> +    int (*save_outgoing_bitmap)(QEMUFile *f);
> +
> +    /* Load the incoming page encryption bitmap */
> +    int (*load_incoming_bitmap)(QEMUFile *f);
> +};
> +
>  /**
>   * MachineClass:
>   * @deprecation_reason: If set, the machine is marked as deprecated. The
> @@ -228,6 +251,7 @@ struct MachineClass {
>                                                           unsigned cpu_index);
>      const CPUArchIdList *(*possible_cpu_arch_ids)(MachineState *machine);
>      int64_t (*get_default_cpu_node_id)(const MachineState *ms, int idx);
> +    struct MachineMemoryEncryptionOps *memory_encryption_ops;
>  };
>  
>  /**
> -- 
> 2.17.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

