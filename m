Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFAB2CA18C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 12:38:28 +0100 (CET)
Received: from localhost ([::1]:60344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk3zH-0007oO-Dg
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 06:38:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kk3yB-0006x3-Vq
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:37:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kk3y9-0000gf-KB
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:37:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606822636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mEg2mvzmDJQWmGL7PYMzg8O29/2xQkUxKTa922eJt3k=;
 b=cVVDEX43q+QAN9kZtpDlGYHh5RmMmEaH672vjsDrX6gxwa50SsWtGS9D/RUTNrgHPtO44h
 sW6CRvedw74Ei6RfeatHalxaW6Jbr5ukBwAFoBKP3kAF8v/0z5v8j74vRKxymulY56Htjj
 5+bcbDkHTJvTrnd1v971kc5pNVpwlJ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-IFLTQ76fNu2YwhjvsgGOKQ-1; Tue, 01 Dec 2020 06:37:12 -0500
X-MC-Unique: IFLTQ76fNu2YwhjvsgGOKQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 111C780364B;
 Tue,  1 Dec 2020 11:37:11 +0000 (UTC)
Received: from work-vm (ovpn-115-1.ams2.redhat.com [10.36.115.1])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 06679189CE;
 Tue,  1 Dec 2020 11:37:04 +0000 (UTC)
Date: Tue, 1 Dec 2020 11:37:02 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Ashish Kalra <Ashish.Kalra@amd.com>
Subject: Re: [PATCH 02/11] exec: Add new MemoryDebugOps.
Message-ID: <20201201113702.GE4338@work-vm>
References: <cover.1605316268.git.ashish.kalra@amd.com>
 <4393d426ae8f070c6be45ff0252bae2dca8bbd42.1605316268.git.ashish.kalra@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4393d426ae8f070c6be45ff0252bae2dca8bbd42.1605316268.git.ashish.kalra@amd.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas.Lendacky@amd.com, brijesh.singh@amd.com, ehabkost@redhat.com,
 kvm@vger.kernel.org, mst@redhat.com, mtosatti@redhat.com,
 ssg.sos.patches@amd.com, qemu-devel@nongnu.org, armbru@redhat.com,
 pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Ashish Kalra (Ashish.Kalra@amd.com) wrote:
> From: Ashish Kalra <ashish.kalra@amd.com>
> 
> Introduce new MemoryDebugOps which hook into guest virtual and physical
> memory debug interfaces such as cpu_memory_rw_debug, to allow vendor specific
> assist/hooks for debugging and delegating accessing the guest memory.
> This is required for example in case of AMD SEV platform where the guest
> memory is encrypted and a SEV specific debug assist/hook will be required
> to access the guest memory.
> 
> The MemoryDebugOps are used by cpu_memory_rw_debug() and default to
> address_space_read and address_space_write_rom.
> 
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  include/exec/memory.h | 11 +++++++++++
>  softmmu/physmem.c     | 24 ++++++++++++++++++++----
>  2 files changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index aff6ef7605..73deb4b456 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -2394,6 +2394,17 @@ MemTxResult address_space_write_cached_slow(MemoryRegionCache *cache,
>                                              hwaddr addr, const void *buf,
>                                              hwaddr len);
>  
> +typedef struct MemoryDebugOps {
> +    MemTxResult (*read)(AddressSpace *as, hwaddr phys_addr,
> +                        MemTxAttrs attrs, void *buf,
> +                        hwaddr len);
> +    MemTxResult (*write)(AddressSpace *as, hwaddr phys_addr,
> +                         MemTxAttrs attrs, const void *buf,
> +                         hwaddr len);
> +} MemoryDebugOps;
> +
> +void address_space_set_debug_ops(const MemoryDebugOps *ops);
> +
>  static inline bool memory_access_is_direct(MemoryRegion *mr, bool is_write)
>  {
>      if (is_write) {
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index a9adedb9f8..057d6d4ce1 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -166,6 +166,18 @@ struct DirtyBitmapSnapshot {
>      unsigned long dirty[];
>  };
>  
> +static const MemoryDebugOps default_debug_ops = {
> +    .read = address_space_read,
> +    .write = address_space_write_rom
> +};
> +
> +static const MemoryDebugOps *debug_ops = &default_debug_ops;
> +
> +void address_space_set_debug_ops(const MemoryDebugOps *ops)
> +{
> +    debug_ops = ops;
> +}
> +
>  static void phys_map_node_reserve(PhysPageMap *map, unsigned nodes)
>  {
>      static unsigned alloc_hint = 16;
> @@ -3407,6 +3419,10 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
>          page = addr & TARGET_PAGE_MASK;
>          phys_addr = cpu_get_phys_page_attrs_debug(cpu, page, &attrs);
>          asidx = cpu_asidx_from_attrs(cpu, attrs);
> +
> +        /* set debug attrs to indicate memory access is from the debugger */
> +        attrs.debug = 1;
> +
>          /* if no physical page mapped, return an error */
>          if (phys_addr == -1)
>              return -1;
> @@ -3415,11 +3431,11 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
>              l = len;
>          phys_addr += (addr & ~TARGET_PAGE_MASK);
>          if (is_write) {
> -            res = address_space_write_rom(cpu->cpu_ases[asidx].as, phys_addr,
> -                                          attrs, buf, l);
> +            res = debug_ops->write(cpu->cpu_ases[asidx].as, phys_addr,
> +                                   attrs, buf, l);
>          } else {
> -            res = address_space_read(cpu->cpu_ases[asidx].as, phys_addr,
> -                                     attrs, buf, l);
> +            res = debug_ops->read(cpu->cpu_ases[asidx].as, phys_addr,
> +                                  attrs, buf, l);
>          }
>          if (res != MEMTX_OK) {
>              return -1;
> -- 
> 2.17.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


