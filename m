Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C6B13CC04
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 19:24:11 +0100 (CET)
Received: from localhost ([::1]:58602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irnKs-0008EL-4b
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 13:24:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53987)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1irnIc-0005A7-Ku
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 13:21:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1irnIb-0006Vt-Ga
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 13:21:50 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:26880)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1irnIb-0006VT-A5
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 13:21:49 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2C4C57482D2;
 Wed, 15 Jan 2020 19:21:48 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0CB3D7482D0; Wed, 15 Jan 2020 19:21:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0B6A4745702;
 Wed, 15 Jan 2020 19:21:48 +0100 (CET)
Date: Wed, 15 Jan 2020 19:21:48 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3 80/86] hostmem: introduce "prealloc-threads"
 property
In-Reply-To: <1579108533-162236-1-git-send-email-imammedo@redhat.com>
Message-ID: <alpine.BSF.2.21.99999.352.2001151920060.24151@zero.eik.bme.hu>
References: <128a6dc6-4dcd-0d60-2112-d495426b184d@redhat.com>
 <1579108533-162236-1-git-send-email-imammedo@redhat.com>
User-Agent: Alpine 2.21.99999 (BSF 352 2019-06-22)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 15 Jan 2020, Igor Mammedov wrote:
> diff --git a/backends/hostmem.c b/backends/hostmem.c
> index e773bdf..4c23c77 100644
> --- a/backends/hostmem.c
> +++ b/backends/hostmem.c
> @@ -223,7 +223,6 @@ static void host_memory_backend_set_prealloc(Object *obj, bool value,
> {
>     Error *local_err = NULL;
>     HostMemoryBackend *backend = MEMORY_BACKEND(obj);
> -    MachineState *ms = MACHINE(qdev_get_machine());
>
>     if (backend->force_prealloc) {
>         if (value) {
> @@ -243,7 +242,7 @@ static void host_memory_backend_set_prealloc(Object *obj, bool value,
>         void *ptr = memory_region_get_ram_ptr(&backend->mr);
>         uint64_t sz = memory_region_size(&backend->mr);
>
> -        os_mem_prealloc(fd, ptr, sz, ms->smp.cpus, &local_err);
> +        os_mem_prealloc(fd, ptr, sz, backend->prealloc_threads, &local_err);
>         if (local_err) {
>             error_propagate(errp, local_err);
>             return;
> @@ -252,14 +251,45 @@ static void host_memory_backend_set_prealloc(Object *obj, bool value,
>     }
> }
>
> +static void host_memory_backend_get_prealloc_threads(Object *obj, Visitor *v,
> +    const char *name, void *opaque, Error **errp)
> +{
> +    HostMemoryBackend *backend = MEMORY_BACKEND(obj);
> +    visit_type_uint32(v, name, &backend->prealloc_threads, errp);
> +}
> +
> +static void host_memory_backend_set_prealloc_threads(Object *obj, Visitor *v,
> +    const char *name, void *opaque, Error **errp)
> +{
> +    HostMemoryBackend *backend = MEMORY_BACKEND(obj);
> +    Error *local_err = NULL;
> +    uint32_t value;
> +
> +    visit_type_uint32(v, name, &value, &local_err);
> +    if (local_err) {
> +        goto out;
> +    }
> +    if (value <= 0) {
> +        error_setg(&local_err,
> +                   "property '%s' of %s doesn't take value '%d'",
> +                   name, object_get_typename(obj), value);
> +        goto out;
> +    }
> +    backend->prealloc_threads = value;
> +out:
> +    error_propagate(errp, local_err);
> +}
> +
> static void host_memory_backend_init(Object *obj)
> {
>     HostMemoryBackend *backend = MEMORY_BACKEND(obj);
>     MachineState *machine = MACHINE(qdev_get_machine());
>
> +    /* TODO: convert this compat properties */

Did you mean "convert these compat properties" or "convert this compat 
property"?

Regards,
BALATON Zoltan

>     backend->merge = machine_mem_merge(machine);
>     backend->dump = machine_dump_guest_core(machine);
>     backend->prealloc = mem_prealloc;
> +    backend->prealloc_threads = 1;
> }
>
> static void host_memory_backend_post_init(Object *obj)

