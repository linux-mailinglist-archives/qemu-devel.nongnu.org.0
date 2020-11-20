Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0192BAAEA
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 14:17:22 +0100 (CET)
Received: from localhost ([::1]:51422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg6Hx-000708-8K
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 08:17:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kg6Fz-0006Th-UC
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 08:15:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kg6Fx-0003Nr-EH
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 08:15:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605878115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vif5l6MM9ywDp34kPaYBXw9++DfzQ/ohMLXcHUKRDr8=;
 b=caApBZWeYC2ZxgppoCcQGslpjYpL3BITLHhFj38Y59AywvANecqKoCTt0s8Yi5taqH7nw5
 kbgZoDVhlUHNV0fqeEuLpW794m58HFFfunQqZoRQzYJYfVffUhWp0LbZP0Ei/84U6IR9Lx
 O/c1WBlvvCGa4zr9kDHPdAG63rNZ/2s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-6iRJ_zrNNk-AsmgM6sbwww-1; Fri, 20 Nov 2020 08:15:12 -0500
X-MC-Unique: 6iRJ_zrNNk-AsmgM6sbwww-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C528E108E1B3
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 13:15:11 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D25D15D6CF;
 Fri, 20 Nov 2020 13:15:10 +0000 (UTC)
Date: Fri, 20 Nov 2020 14:15:09 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 21/29] vl: separate qemu_resolve_machine_memdev
Message-ID: <20201120141509.349283c7@redhat.com>
In-Reply-To: <20201027182144.3315885-22-pbonzini@redhat.com>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201027182144.3315885-22-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Oct 2020 14:21:36 -0400
Paolo Bonzini <pbonzini@redhat.com> wrote:

> This is a bit nasty: the machine is storing a string and later
> resolving it.  We probably want to remove the memdev property
> and instead make this a memory-set command.  "-M memdev" can be
> handled as a legacy option that is special cased by
> machine_set_property.
I'd treat this description as topic starter and drop it from this patch in v2.
with that,
  Reviewed-by: Igor Mammedov <imammedo@redhat.com>

how  memory-set would help or be any better than memdev?

memdev should be a link property, but due to RAM allocation
being dependent on used accel we can't create actual backend
until accelerator is initialized (i.e. after machine options parsed,
which forced me to make memdev a string that refers to a backend
created later).

If we can make RAM allocation independent from used accelerator
(if I recall right it has TCG dependency) and if we split -m CLI
handling and default ram_memdev_id (which is implicit CLI),
then we can make -M memdev a link and move RAM backends to
qemu_create_early_backends() time.

Which in context of creating machine via QMP would imply that
link should be set explicitly via QMP after backend is created.

Flow could look like this:
CLI part:
  -m / defaults - preps and 'if not NUMA'
     executes QMP
       object_add memory-backend-foo,size=X,id=(ram_memdev_id)
     in case -M memory-backend is not set explicitly, or fetch
     id of explicitly provided backend (which would be created by
     qemu_create_early_backends)
QMP part:
   object_add machine_foo,id=my_machine
   set (link) my_machine.memory-backend=(ram_memdev_id)

that way we do no need to create a separate memory-set command,
we can  handle it as a normal property, where all compat stuff
is kept in CLI part.

For CLI part handling there are 2 caveats:

 * Xen doesn't use memdev at all, it allocates memory region directly.
   Not sure what we should do in this case
   (may be we can create a separate xen-ram backend for it and remove
    'mr == &ram_memory' in xen_ram_alloc() hack)

 * legacy S390 machine types (<5.0) fixup ram_size before creating backend, if user
   provided value is not correct 5c30ef937f5 (i.e. not aligned properly).
   I guess we are stuck with it, given it's version-ed machine type. The rest of the code was
   fixed to error-out in the case board doesn't like -m value.
   Or we can treat it as user error (which should be corrected by user) and deprecate/remove fixup. 

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  softmmu/vl.c | 70 +++++++++++++++++++++++++++-------------------------
>  1 file changed, 37 insertions(+), 33 deletions(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 9a3c92387e..1485aba8be 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2834,6 +2834,42 @@ static bool have_custom_ram_size(void)
>      return !!qemu_opt_get(opts, "size");
>  }
>  
> +static void qemu_resolve_machine_memdev(void)
> +{
> +    if (current_machine->ram_memdev_id) {
> +        Object *backend;
> +        ram_addr_t backend_size;
> +
> +        backend = object_resolve_path_type(current_machine->ram_memdev_id,
> +                                           TYPE_MEMORY_BACKEND, NULL);
> +        if (!backend) {
> +            error_report("Memory backend '%s' not found",
> +                         current_machine->ram_memdev_id);
> +            exit(EXIT_FAILURE);
> +        }
> +        backend_size = object_property_get_uint(backend, "size",  &error_abort);
> +        if (have_custom_ram_size() && backend_size != ram_size) {
> +                error_report("Size specified by -m option must match size of "
> +                             "explicitly specified 'memory-backend' property");
> +                exit(EXIT_FAILURE);
> +        }
> +        if (mem_path) {
> +            error_report("'-mem-path' can't be used together with"
> +                         "'-machine memory-backend'");
> +            exit(EXIT_FAILURE);
> +        }
> +        ram_size = backend_size;
> +    }
> +
> +    if (!xen_enabled()) {
> +        /* On 32-bit hosts, QEMU is limited by virtual address space */
> +        if (ram_size > (2047 << 20) && HOST_LONG_BITS == 32) {
> +            error_report("at most 2047 MB RAM can be simulated");
> +            exit(1);
> +        }
> +    }
> +}
> +
>  static void set_memory_options(MachineClass *mc)
>  {
>      uint64_t sz;
> @@ -4476,39 +4512,7 @@ void qemu_init(int argc, char **argv, char **envp)
>          current_machine->cpu_type = parse_cpu_option(cpu_option);
>      }
>  
> -    if (current_machine->ram_memdev_id) {
> -        Object *backend;
> -        ram_addr_t backend_size;
> -
> -        backend = object_resolve_path_type(current_machine->ram_memdev_id,
> -                                           TYPE_MEMORY_BACKEND, NULL);
> -        if (!backend) {
> -            error_report("Memory backend '%s' not found",
> -                         current_machine->ram_memdev_id);
> -            exit(EXIT_FAILURE);
> -        }
> -        backend_size = object_property_get_uint(backend, "size",  &error_abort);
> -        if (have_custom_ram_size() && backend_size != ram_size) {
> -                error_report("Size specified by -m option must match size of "
> -                             "explicitly specified 'memory-backend' property");
> -                exit(EXIT_FAILURE);
> -        }
> -        if (mem_path) {
> -            error_report("'-mem-path' can't be used together with"
> -                         "'-machine memory-backend'");
> -            exit(EXIT_FAILURE);
> -        }
> -        ram_size = backend_size;
> -    }
> -
> -    if (!xen_enabled()) {
> -        /* On 32-bit hosts, QEMU is limited by virtual address space */
> -        if (ram_size > (2047 << 20) && HOST_LONG_BITS == 32) {
> -            error_report("at most 2047 MB RAM can be simulated");
> -            exit(1);
> -        }
> -    }
> -
> +    qemu_resolve_machine_memdev();
>      parse_numa_opts(current_machine);
>  
>      /* do monitor/qmp handling at preconfig state if requested */


