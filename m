Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CE0522E8D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 10:37:55 +0200 (CEST)
Received: from localhost ([::1]:35890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nohr0-0004iF-9X
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 04:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nohni-0003nS-Rp
 for qemu-devel@nongnu.org; Wed, 11 May 2022 04:34:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nohna-0000h7-Gw
 for qemu-devel@nongnu.org; Wed, 11 May 2022 04:34:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652258055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ut3BupXi3voP/vv7+UzkWhENlV04+UgLJqDQYiGzHZg=;
 b=W6EP5wrFUwItbkPRJ25mQYAbgyQy9Ey92CK+DZ30rAYaEzp7sV3AS/layFCG5Qn2kuL5FS
 /p8rGJmoSbylr56ciLXp4ifjozwEnuuY2nS/WKOCB5FOXa19sfIWEhHToc2ezllliincwY
 5E2EUwtg8NvT1xUzEFqeecf69ZixCCc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-vu0UaRakN6ag7MA4zUDQNQ-1; Wed, 11 May 2022 04:34:12 -0400
X-MC-Unique: vu0UaRakN6ag7MA4zUDQNQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 i131-20020a1c3b89000000b00393fbb0718bso2535651wma.0
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 01:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ut3BupXi3voP/vv7+UzkWhENlV04+UgLJqDQYiGzHZg=;
 b=ItPFQlubn8n9y/qmfUP5F8wpG+DMQbtABrX+Z8tW9OLUIcHVHNzrYs+tPVHQig2kZE
 PTGW9zy/TbKwX0RokgC5pgVUbCTFwi41bQTprd9cg55+NKG+Aqxv+l1pHGboFAIgS2ta
 QMD6ryETSsKJS7ipmqrfeHykBbp8bR+rfPf2drBQEX5veWKON3fq24/EgoBuiXwAEwvQ
 mWKAvYrCLQz+9OOlUs7vDGsjp1hlikC2Sjgek46o/QninA8bw9uellxg5rQSn2VZ/8Ul
 Cy+tSiTJEr5ZS0t3Nd4xuV6KDHY8P2ODWXIqj16kZIANUpbYwymkBHFUbbBjifb2nvqG
 Kzjg==
X-Gm-Message-State: AOAM531L49M0lhGK0Im0AnbFxQABsOO9CDsYfKFaTXHZ3Zprs8iX+JEe
 QAASXaw1zgDBQ2KxQnIW5aVmjDV9Iv30qCrs7tbYXFJbtpItTcAMcx39V2E0NE9ClS49Cq/CouQ
 RB96hAUe2FXK1nKk=
X-Received: by 2002:a1c:f207:0:b0:38e:9aac:df41 with SMTP id
 s7-20020a1cf207000000b0038e9aacdf41mr3633897wmc.14.1652258050598; 
 Wed, 11 May 2022 01:34:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4n2JK20iioqabWRcxp/I7wqtUgDxXYOomrrJabtwVN5XMMeswLrpam/WainR1Kk5zZvgwUg==
X-Received: by 2002:a1c:f207:0:b0:38e:9aac:df41 with SMTP id
 s7-20020a1cf207000000b0038e9aacdf41mr3633871wmc.14.1652258050264; 
 Wed, 11 May 2022 01:34:10 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 q64-20020a1c4343000000b003942a244ec2sm1543488wma.7.2022.05.11.01.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 01:34:09 -0700 (PDT)
Date: Wed, 11 May 2022 09:34:07 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>, jmario@redhat.com
Cc: qemu-devel@nongnu.org, david@redhat.com, berrange@redhat.com
Subject: Re: [PATCH] util: NUMA aware memory preallocation
Message-ID: <Ynt0/9jfeUPg4JxN@work-vm>
References: <ffdcd118d59b379ede2b64745144165a40f6a813.1652165704.git.mprivozn@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffdcd118d59b379ede2b64745144165a40f6a813.1652165704.git.mprivozn@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Michal Privoznik (mprivozn@redhat.com) wrote:
> When allocating large amounts of memory the task is offloaded
> onto threads. These threads then use various techniques to
> allocate the memory fully (madvise(), writing into the memory).
> However, these threads are free to run on any CPU, which becomes
> problematic on NUMA machines because it may happen that a thread
> is running on a distant node.
> 
> Ideally, this is something that a management application would
> resolve, but we are not anywhere close to that, Firstly, memory
> allocation happens before monitor socket is even available. But
> okay, that's what -preconfig is for. But then the problem is that
> 'object-add' would not return until all memory is preallocated.
> 
> Long story short, management application has no way of learning
> TIDs of allocator threads so it can't make them run NUMA aware.
> 
> But what we can do is to propagate the 'host-nodes' attribute of
> MemoryBackend object down to where preallocation threads are
> created and set their affinity according to the attribute.

Joe (cc'd) sent me some numbers for this which emphasise how useful it
is:
 | On systems with 4 physical numa nodes and 2-6 Tb of memory, this numa-aware
 |preallocation provided about a 25% speedup in touching the pages.
 |The speedup gets larger as the numa node count and memory sizes grow.
....
 | In a simple parallel 1Gb page-zeroing test on a very large system (32-numa
 | nodes and 47Tb of memory), the numa-aware preallocation was 2.3X faster
 | than letting the threads float wherever.
 | We're working with someone whose large guest normally takes 4.5 hours to
 | boot.  With Michal P's initial patch to parallelize the preallocation, that
 | time dropped to about 1 hour.  Including this numa-aware preallocation
 | would reduce the guest boot time to less than 1/2 hour.

so chopping *half an hour* off the startup time seems a worthy
optimisation (even if most of us aren't fortunate enough to have 47T of
ram).

Dave

> Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2074000
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> ---
>  backends/hostmem.c     |  6 ++--
>  hw/virtio/virtio-mem.c |  2 +-
>  include/qemu/osdep.h   |  2 ++
>  util/meson.build       |  2 +-
>  util/oslib-posix.c     | 74 ++++++++++++++++++++++++++++++++++++++++--
>  util/oslib-win32.c     |  2 ++
>  6 files changed, 82 insertions(+), 6 deletions(-)
> 
> diff --git a/backends/hostmem.c b/backends/hostmem.c
> index a7bae3d713..7373472c7e 100644
> --- a/backends/hostmem.c
> +++ b/backends/hostmem.c
> @@ -232,7 +232,8 @@ static void host_memory_backend_set_prealloc(Object *obj, bool value,
>          void *ptr = memory_region_get_ram_ptr(&backend->mr);
>          uint64_t sz = memory_region_size(&backend->mr);
>  
> -        os_mem_prealloc(fd, ptr, sz, backend->prealloc_threads, &local_err);
> +        os_mem_prealloc(fd, ptr, sz, backend->prealloc_threads,
> +                        backend->host_nodes, MAX_NODES, &local_err);
>          if (local_err) {
>              error_propagate(errp, local_err);
>              return;
> @@ -394,7 +395,8 @@ host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)
>           */
>          if (backend->prealloc) {
>              os_mem_prealloc(memory_region_get_fd(&backend->mr), ptr, sz,
> -                            backend->prealloc_threads, &local_err);
> +                            backend->prealloc_threads, backend->host_nodes,
> +                            MAX_NODES, &local_err);
>              if (local_err) {
>                  goto out;
>              }
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index 5aca408726..48b104cdf6 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -467,7 +467,7 @@ static int virtio_mem_set_block_state(VirtIOMEM *vmem, uint64_t start_gpa,
>              int fd = memory_region_get_fd(&vmem->memdev->mr);
>              Error *local_err = NULL;
>  
> -            os_mem_prealloc(fd, area, size, 1, &local_err);
> +            os_mem_prealloc(fd, area, size, 1, NULL, 0, &local_err);
>              if (local_err) {
>                  static bool warned;
>  
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index 1c1e7eca98..474cbf3b86 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -577,6 +577,8 @@ unsigned long qemu_getauxval(unsigned long type);
>  void qemu_set_tty_echo(int fd, bool echo);
>  
>  void os_mem_prealloc(int fd, char *area, size_t sz, int smp_cpus,
> +                     const unsigned long *host_nodes,
> +                     unsigned long max_node,
>                       Error **errp);
>  
>  /**
> diff --git a/util/meson.build b/util/meson.build
> index 8f16018cd4..393ff74570 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -15,7 +15,7 @@ freebsd_dep = []
>  if targetos == 'freebsd'
>    freebsd_dep = util
>  endif
> -util_ss.add(when: 'CONFIG_POSIX', if_true: [files('oslib-posix.c'), freebsd_dep])
> +util_ss.add(when: 'CONFIG_POSIX', if_true: [files('oslib-posix.c'), freebsd_dep, numa])
>  util_ss.add(when: 'CONFIG_POSIX', if_true: files('qemu-thread-posix.c'))
>  util_ss.add(when: 'CONFIG_POSIX', if_true: files('memfd.c'))
>  util_ss.add(when: 'CONFIG_WIN32', if_true: files('aio-win32.c'))
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index 477990f39b..1572b9b178 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -73,6 +73,10 @@
>  #include "qemu/error-report.h"
>  #endif
>  
> +#ifdef CONFIG_NUMA
> +#include <numa.h>
> +#endif
> +
>  #define MAX_MEM_PREALLOC_THREAD_COUNT 16
>  
>  struct MemsetThread;
> @@ -82,6 +86,9 @@ typedef struct MemsetContext {
>      bool any_thread_failed;
>      struct MemsetThread *threads;
>      int num_threads;
> +#ifdef CONFIG_NUMA
> +    struct bitmask *nodemask;
> +#endif
>  } MemsetContext;
>  
>  struct MemsetThread {
> @@ -420,6 +427,12 @@ static void *do_touch_pages(void *arg)
>      }
>      qemu_mutex_unlock(&page_mutex);
>  
> +#ifdef CONFIG_NUMA
> +    if (memset_args->context->nodemask) {
> +        numa_run_on_node_mask(memset_args->context->nodemask);
> +    }
> +#endif
> +
>      /* unblock SIGBUS */
>      sigemptyset(&set);
>      sigaddset(&set, SIGBUS);
> @@ -463,6 +476,12 @@ static void *do_madv_populate_write_pages(void *arg)
>      }
>      qemu_mutex_unlock(&page_mutex);
>  
> +#ifdef CONFIG_NUMA
> +    if (memset_args->context->nodemask) {
> +        numa_run_on_node_mask(memset_args->context->nodemask);
> +    }
> +#endif
> +
>      if (size && qemu_madvise(addr, size, QEMU_MADV_POPULATE_WRITE)) {
>          ret = -errno;
>      }
> @@ -489,7 +508,9 @@ static inline int get_memset_num_threads(size_t hpagesize, size_t numpages,
>  }
>  
>  static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
> -                           int smp_cpus, bool use_madv_populate_write)
> +                           int smp_cpus, const unsigned long *host_nodes,
> +                           unsigned long max_node,
> +                           bool use_madv_populate_write)
>  {
>      static gsize initialized = 0;
>      MemsetContext context = {
> @@ -499,6 +520,7 @@ static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
>      void *(*touch_fn)(void *);
>      int ret = 0, i = 0;
>      char *addr = area;
> +    unsigned long value = max_node;
>  
>      if (g_once_init_enter(&initialized)) {
>          qemu_mutex_init(&page_mutex);
> @@ -520,6 +542,48 @@ static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
>          touch_fn = do_touch_pages;
>      }
>  
> +    if (host_nodes) {
> +        value = find_first_bit(host_nodes, max_node);
> +    }
> +    if (value != max_node) {
> +#ifdef CONFIG_NUMA
> +        struct bitmask *cpus = numa_allocate_cpumask();
> +        g_autofree unsigned long *zerocpumask;
> +        size_t zerocpumasklen;
> +        g_autofree unsigned long *zeronodemask;
> +        size_t zeronodemasklen;
> +
> +        context.nodemask = numa_bitmask_alloc(max_node);
> +
> +        zerocpumasklen = cpus->size / sizeof(unsigned long);
> +        zerocpumask = g_new0(unsigned long, zerocpumasklen);
> +
> +        for (; value != max_node;
> +             value = find_next_bit(host_nodes, max_node, value + 1)) {
> +            if (numa_node_to_cpus(value, cpus) ||
> +                memcmp(cpus->maskp, zerocpumask, zerocpumasklen) == 0)
> +                continue;
> +
> +            /* If given NUMA node has CPUs run threads on them. */
> +            numa_bitmask_setbit(context.nodemask, value);
> +        }
> +
> +        numa_bitmask_free(cpus);
> +
> +        zeronodemasklen = max_node / sizeof(unsigned long);
> +        zeronodemask = g_new0(unsigned long, zeronodemasklen);
> +
> +        if (memcmp(context.nodemask->maskp,
> +                   zeronodemask, zeronodemasklen) == 0) {
> +            /* If no NUMA has a CPU available, then don't pin threads. */
> +            g_clear_pointer(&context.nodemask, numa_bitmask_free);
> +        }
> +#else
> +        errno = -EINVAL;
> +        return -1;
> +#endif
> +    }
> +
>      context.threads = g_new0(MemsetThread, context.num_threads);
>      numpages_per_thread = numpages / context.num_threads;
>      leftover = numpages % context.num_threads;
> @@ -554,6 +618,10 @@ static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
>      if (!use_madv_populate_write) {
>          sigbus_memset_context = NULL;
>      }
> +
> +#ifdef CONFIG_NUMA
> +    g_clear_pointer(&context.nodemask, numa_bitmask_free);
> +#endif
>      g_free(context.threads);
>  
>      return ret;
> @@ -566,6 +634,8 @@ static bool madv_populate_write_possible(char *area, size_t pagesize)
>  }
>  
>  void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
> +                     const unsigned long *host_nodes,
> +                     unsigned long max_node,
>                       Error **errp)
>  {
>      static gsize initialized;
> @@ -608,7 +678,7 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
>  
>      /* touch pages simultaneously */
>      ret = touch_all_pages(area, hpagesize, numpages, smp_cpus,
> -                          use_madv_populate_write);
> +                          host_nodes, max_node, use_madv_populate_write);
>      if (ret) {
>          error_setg_errno(errp, -ret,
>                           "os_mem_prealloc: preallocating memory failed");
> diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> index dafef4f157..6efd912355 100644
> --- a/util/oslib-win32.c
> +++ b/util/oslib-win32.c
> @@ -314,6 +314,8 @@ int getpagesize(void)
>  }
>  
>  void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
> +                     const unsigned long *host_nodes,
> +                     unsigned long max_node,
>                       Error **errp)
>  {
>      int i;
> -- 
> 2.35.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


