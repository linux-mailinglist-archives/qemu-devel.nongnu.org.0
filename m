Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31DD2C5B12
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 18:51:15 +0100 (CET)
Received: from localhost ([::1]:34000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiLQI-0008Jg-Ps
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 12:51:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kiLEk-0006BZ-Vk
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 12:39:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kiLEh-000776-K2
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 12:39:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606412354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uRAy0qqEHj1kPqOWdt/CbMqhuAaJtX7KNyFZYk2Zv5I=;
 b=aSy16CDN1vbfet2JY0Ef94z9mfZpVsrJWd/Ni27QM+zdPEeUJnynK5brSqEmKyUFoZlRh5
 mJYYxMCP5kNjTlsu/Vi/yWL9CbGxxqQQ6oThEP7KWqVIeE7aIoK18AQV9j4htugWkJkSnP
 BOoXnPnJhw9eunJ8MpaW2n+1J8Uqejs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-Chd0bcvTNRqmy3KBk8NPJQ-1; Thu, 26 Nov 2020 12:39:13 -0500
X-MC-Unique: Chd0bcvTNRqmy3KBk8NPJQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 270DD1009B64
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 17:39:12 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 646255C1CF;
 Thu, 26 Nov 2020 17:39:11 +0000 (UTC)
Date: Thu, 26 Nov 2020 18:39:09 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 20/36] vl: separate qemu_resolve_machine_memdev
Message-ID: <20201126183909.05464062@redhat.com>
In-Reply-To: <20201123141435.2726558-21-pbonzini@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
 <20201123141435.2726558-21-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

On Mon, 23 Nov 2020 09:14:19 -0500
Paolo Bonzini <pbonzini@redhat.com> wrote:

> This is a bit nasty: the machine is storing a string and later
> resolving it.  We probably want to make the memdev property a
> normal link, and handle "-M memdev" as a legacy option that is
> special cased by machine_set_property.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  softmmu/vl.c | 70 +++++++++++++++++++++++++++-------------------------
>  1 file changed, 37 insertions(+), 33 deletions(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 741a800114..6c8a103178 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2834,6 +2834,42 @@ static bool have_custom_ram_size(void)
>      return !!qemu_opt_get_size(opts, "size", 0);
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
> @@ -4467,39 +4503,7 @@ void qemu_init(int argc, char **argv, char **envp)
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


