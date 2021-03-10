Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E027B333A16
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:33:52 +0100 (CET)
Received: from localhost ([::1]:43304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJwA3-0007Cn-VW
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:33:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lJw5X-00036r-Fp
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:29:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lJw5U-0008Rc-D5
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:29:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615372147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q+9ruO+lsPVCnistGF7gVdnqH0r/SJhW5KWVWk6jPEQ=;
 b=BOVNXcsHHEXAkNVniJ+JEQy9mjL0WDqshFl5qWA0HzuJE8AAF+ikT1MlMRoJoAIz6CjvoG
 tBJx6TBoSh/OWf6pCQxzUwh3T89PY/RuOfacqP1Ss3c6BHESLXtvgA9Grs3/LPDYvasI9A
 IU4hPxshd89/wMRxtBVPVpV3GCY6tqs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-rL9C--A4Nga6xWqKg0CPmw-1; Wed, 10 Mar 2021 05:29:04 -0500
X-MC-Unique: rL9C--A4Nga6xWqKg0CPmw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27A7D1932481;
 Wed, 10 Mar 2021 10:29:02 +0000 (UTC)
Received: from [10.36.114.87] (ovpn-114-87.ams2.redhat.com [10.36.114.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C19B51037E82;
 Wed, 10 Mar 2021 10:28:57 +0000 (UTC)
Subject: Re: [PATCH v3 11/12] util/mmap-alloc: Support RAM_NORESERVE via
 MAP_NORESERVE
To: qemu-devel@nongnu.org
References: <20210308150600.14440-1-david@redhat.com>
 <20210308150600.14440-12-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <ba7a08d4-3cef-6c0a-5fb7-4f8837eb8d65@redhat.com>
Date: Wed, 10 Mar 2021 11:28:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210308150600.14440-12-david@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Marcel Apfelbaum <mapfelba@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.03.21 16:05, David Hildenbrand wrote:
> Let's support RAM_NORESERVE via MAP_NORESERVE. At least on Linux,
> the flag has no effect on most shared mappings - except for hugetlbfs
> and anonymous memory.
> 
> Linux man page:
>    "MAP_NORESERVE: Do not reserve swap space for this mapping. When swap
>    space is reserved, one has the guarantee that it is possible to modify
>    the mapping. When swap space is not reserved one might get SIGSEGV
>    upon a write if no physical memory is available. See also the discussion
>    of the file /proc/sys/vm/overcommit_memory in proc(5). In kernels before
>    2.6, this flag had effect only for private writable mappings."
> 
> Note that the "guarantee" part is wrong with memory overcommit in Linux.
> 
> Also, in Linux hugetlbfs is treated differently - we configure reservation
> of huge pages from the pool, not reservation of swap space (huge pages
> cannot be swapped).
> 
> The rough behavior is [1]:
> a) !Hugetlbfs:
> 
>    1) Without MAP_NORESERVE *or* with memory overcommit under Linux
>       disabled ("/proc/sys/vm/overcommit_memory == 2"), the following
>       accounting/reservation happens:
>        For a file backed map
>         SHARED or READ-only - 0 cost (the file is the map not swap)
>         PRIVATE WRITABLE - size of mapping per instance
> 
>        For an anonymous or /dev/zero map
>         SHARED   - size of mapping
>         PRIVATE READ-only - 0 cost (but of little use)
>         PRIVATE WRITABLE - size of mapping per instance
> 
>    2) With MAP_NORESERVE, no accounting/reservation happens.
> 
> b) Hugetlbfs:
> 
>    1) Without MAP_NORESERVE, huge pages are reserved.
> 
>    2) With MAP_NORESERVE, no huge pages are reserved.
> 
> Note: With "/proc/sys/vm/overcommit_memory == 0", we were already able
> to configure it for !hugetlbfs globally; this toggle now allows
> configuring it more fine-grained, not for the whole system.
> 
> The target use case is virtio-mem, which dynamically exposes memory
> inside a large, sparse memory area to the VM.
> 
> [1] https://www.kernel.org/doc/Documentation/vm/overcommit-accounting
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   softmmu/physmem.c |  1 +
>   util/mmap-alloc.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++-
>   2 files changed, 66 insertions(+), 1 deletion(-)
> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index dcc1fb74aa..199c5a4985 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -2229,6 +2229,7 @@ void qemu_ram_remap(ram_addr_t addr, ram_addr_t length)
>                   flags = MAP_FIXED;
>                   flags |= block->flags & RAM_SHARED ?
>                            MAP_SHARED : MAP_PRIVATE;
> +                flags |= block->flags & RAM_NORESERVE ? MAP_NORESERVE : 0;
>                   if (block->fd >= 0) {
>                       area = mmap(vaddr, length, PROT_READ | PROT_WRITE,
>                                   flags, block->fd, offset);
> diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
> index ecace41ad5..c511a68bbe 100644
> --- a/util/mmap-alloc.c
> +++ b/util/mmap-alloc.c
> @@ -20,6 +20,7 @@
>   #include "qemu/osdep.h"
>   #include "qemu/mmap-alloc.h"
>   #include "qemu/host-utils.h"
> +#include "qemu/cutils.h"
>   #include "qemu/error-report.h"
>   
>   #define HUGETLBFS_MAGIC       0x958458f6
> @@ -125,6 +126,7 @@ static void *mmap_activate(void *ptr, size_t size, int fd, uint32_t mmap_flags,
>       const bool readonly = mmap_flags & QEMU_RAM_MMAP_READONLY;
>       const bool shared = mmap_flags & QEMU_RAM_MMAP_SHARED;
>       const bool is_pmem = mmap_flags & QEMU_RAM_MMAP_PMEM;
> +    const bool noreserve = mmap_flags & QEMU_RAM_MMAP_NORESERVE;
>       const int prot = PROT_READ | (readonly ? 0 : PROT_WRITE);
>       int map_sync_flags = 0;
>       int flags = MAP_FIXED;
> @@ -132,6 +134,7 @@ static void *mmap_activate(void *ptr, size_t size, int fd, uint32_t mmap_flags,
>   
>       flags |= fd == -1 ? MAP_ANONYMOUS : 0;
>       flags |= shared ? MAP_SHARED : MAP_PRIVATE;
> +    flags |= noreserve ? MAP_NORESERVE : 0;
>       if (shared && is_pmem) {
>           map_sync_flags = MAP_SYNC | MAP_SHARED_VALIDATE;
>       }
> @@ -174,6 +177,66 @@ static inline size_t mmap_guard_pagesize(int fd)
>   #endif
>   }
>   
> +#define OVERCOMMIT_MEMORY_PATH "/proc/sys/vm/overcommit_memory"
> +static bool map_noreserve_effective(int fd, uint32_t mmap_flags)
> +{
> +#if defined(__linux__)
> +    const bool readonly = mmap_flags & QEMU_RAM_MMAP_READONLY;
> +    const bool shared = mmap_flags & QEMU_RAM_MMAP_SHARED;
> +    gchar *content = NULL;
> +    const char *endptr;
> +    unsigned int tmp;
> +
> +    /*
> +     * hugeltb accounting is different than ordinary swap reservation:
> +     * a) Hugetlb pages from the pool are reserved for both private and
> +     *    shared mappings. For shared mappings, reservations are tracked
> +     *    per file -- all mappers have to specify MAP_NORESERVE.
> +     * b) MAP_NORESERVE is not affected by /proc/sys/vm/overcommit_memory.
> +     */
> +    if (qemu_fd_getpagesize(fd) != qemu_real_host_page_size) {
> +        return true;
> +    }
> +
> +    /*
> +     * Accountable mappings in the kernel that can be affected by MAP_NORESEVE
> +     * are private writable mappings (see mm/mmap.c:accountable_mapping() in
> +     * Linux). For all shared or readonly mappings, MAP_NORESERVE is always
> +     * implicitly active -- no reservation; this includes shmem. The only
> +     * exception is shared anonymous memory, it is accounted like private
> +     * anonymous memory.
> +     */
> +    if (readonly || (shared && fd >= 0)) {
> +        return true;
> +    }
> +
> +    /*
> +     * MAP_NORESERVE is globally ignored for private writable mappings when
> +     * overcommit is set to "never". Sparse memory regions aren't really
> +     * possible in this system configuration.
> +     *
> +     * Bail out now instead of silently committing way more memory than
> +     * currently desired by the user.
> +     */
> +    if (g_file_get_contents(OVERCOMMIT_MEMORY_PATH, &content, NULL, NULL) &&
> +        !qemu_strtoui(content, &endptr, 0, &tmp) &&
> +        (!endptr || *endptr == '\n')) {
> +        if (tmp == 2) {
> +            error_report("Skipping reservation of swap space is not supported:"
> +                         " \"" OVERCOMMIT_MEMORY_PATH "\" is \"2\"");
> +            return false;
> +        }
> +        return true;
> +    }
> +    /* this interface has been around since Linux 2.6 */
> +    error_report("Skipping reservation of swap space is not supported:"
> +                 " Could not read: \"" OVERCOMMIT_MEMORY_PATH "\"");
> +    return false;
> +#else

I'll return "false" here for now after learning that e.g., FreeBSD never 
implemented the flag and removed it a while ago
	https://github.com/Clozure/ccl/issues/17

So I'll unlock it only for Linux - which makes sense, because I only 
test there (and only care about Linux with MAP_NORESERVE)

> +    return true;


-- 
Thanks,

David / dhildenb


