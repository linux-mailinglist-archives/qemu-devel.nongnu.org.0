Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B329B6786A3
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 20:43:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK2iI-0005Vh-K5; Mon, 23 Jan 2023 14:42:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pK2iF-0005Uq-J1
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 14:42:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pK2iD-0002Ng-NN
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 14:42:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674502956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xOWz8++ZGuu8KzAN+/gPyGRMKWJCGGw8Xl5egS6HC9Y=;
 b=MQw17IcQrC2Ma6fAf+lI3BPJUTffYGyiiflcQ9CZvNGFAwCt3fpgLOpQQ6sLET1HaiumY8
 wmZlZaUAAJSe8By5Bb/w0sG+zr4Vrz6KBpRpzz1xASVB9nVMICIZRLN+koXT4MSVQS+LQp
 Y0lWnZT8rGTjncIhYWNyrTX/F5oIESo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-10-7uMBE3kDNn23avmCF43Rlw-1; Mon, 23 Jan 2023 14:42:35 -0500
X-MC-Unique: 7uMBE3kDNn23avmCF43Rlw-1
Received: by mail-wr1-f72.google.com with SMTP id
 o15-20020a5d684f000000b002be540246e1so1710925wrw.22
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 11:42:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xOWz8++ZGuu8KzAN+/gPyGRMKWJCGGw8Xl5egS6HC9Y=;
 b=2n60qErOaqQkBKSMH4ikbBwkdRvnsoxd0UrTJI2iGRJM//dpefepuUjZTya1LSGOxp
 xGk6UuftTdlS++aKKBAGLLKpUiuFa12lNXzXhtS//OSJUoSzMIQc2HG4/DMYPOOzB4N8
 KqVrMVJYTAi034hak6/L6Y1dUJtP44mSYyBRQLBEjD6PpYvaWjEKtQw5/u71zpFb1m5s
 Rh55pvA5mJD+ehp6QAVy4wn2KhRG7h34we3qXxK97dweGHL8GgLnAZjNIi7nsrfZxP1q
 4t7k44h9R/Q5UTKO612Q2RUJ9eyB+2sNUjte4ERbcNANU4ilOZvjxkuWVPrXGMfJx6j+
 LUeg==
X-Gm-Message-State: AFqh2kquzlAE5a0LHhw2EliIs3vYN1r2tHasc1tZtBV/Gop5+NDWYo0t
 k3O9kFpAaycO38Kp0jdbypnR20UZU+mYV5zzw7IQMNOXnYs3QqMQOVPan0THNCX9sBGac2e3yqr
 HLZuTalgfclznXZk=
X-Received: by 2002:a05:600c:4d81:b0:3d0:6c60:b4d1 with SMTP id
 v1-20020a05600c4d8100b003d06c60b4d1mr26343140wmp.6.1674502953570; 
 Mon, 23 Jan 2023 11:42:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXugztP2q/dY3VLYPetTXLXmTkcr2rtjKpAkyvVzold5w6eIgzzFF/Kv+YPEIhdquzYO/5y+Kg==
X-Received: by 2002:a05:600c:4d81:b0:3d0:6c60:b4d1 with SMTP id
 v1-20020a05600c4d8100b003d06c60b4d1mr26343122wmp.6.1674502953293; 
 Mon, 23 Jan 2023 11:42:33 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 i22-20020a05600c481600b003d9fa355387sm67395wmo.27.2023.01.23.11.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 11:42:32 -0800 (PST)
Date: Mon, 23 Jan 2023 19:42:30 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>, Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH RFC 09/21] ramblock: Add RAM_READONLY
Message-ID: <Y87jJtu529cI4OZ0@work-vm>
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-10-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117220914.2062125-10-peterx@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Peter Xu (peterx@redhat.com) wrote:
> This allows us to have RAM_READONLY to be set in ram_flags to show that
> this ramblock can only be read not write.
> 
> We used to pass in readonly boolean along the way for allocating the
> ramblock, now let it be together with the rest ramblock flags.
> 
> The main purpose of this patch is not for clean up though, it's for caching
> mapping information of each ramblock so when we want to mmap() it again for
> whatever reason we can have all the information on hand.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  backends/hostmem-file.c |  3 ++-
>  include/exec/memory.h   |  4 ++--
>  include/exec/ram_addr.h |  5 ++---
>  softmmu/memory.c        |  8 +++-----
>  softmmu/physmem.c       | 16 +++++++---------
>  5 files changed, 16 insertions(+), 20 deletions(-)
> 
> diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
> index 25141283c4..1daf00d2da 100644
> --- a/backends/hostmem-file.c
> +++ b/backends/hostmem-file.c
> @@ -56,9 +56,10 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
>      ram_flags = backend->share ? RAM_SHARED : 0;
>      ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
>      ram_flags |= fb->is_pmem ? RAM_PMEM : 0;
> +    ram_flags |= fb->readonly ? RAM_READONLY : 0;
>      memory_region_init_ram_from_file(&backend->mr, OBJECT(backend), name,
>                                       backend->size, fb->align, ram_flags,
> -                                     fb->mem_path, fb->readonly, errp);
> +                                     fb->mem_path, errp);
>      g_free(name);
>  #endif
>  }
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index c37ffdbcd1..006ba77ede 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -188,6 +188,8 @@ typedef struct IOMMUTLBEvent {
>  /* RAM is a persistent kind memory */
>  #define RAM_PMEM (1 << 5)
>  
> +/* RAM is read-only */
> +#define RAM_READONLY (1 << 6)
>  
>  /*
>   * UFFDIO_WRITEPROTECT is used on this RAMBlock to
> @@ -1292,7 +1294,6 @@ void memory_region_init_resizeable_ram(MemoryRegion *mr,
>   * @ram_flags: RamBlock flags. Supported flags: RAM_SHARED, RAM_PMEM,
>   *             RAM_NORESERVE,
>   * @path: the path in which to allocate the RAM.
> - * @readonly: true to open @path for reading, false for read/write.
>   * @errp: pointer to Error*, to store an error if it happens.
>   *
>   * Note that this function does not do anything to cause the data in the
> @@ -1305,7 +1306,6 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
>                                        uint64_t align,
>                                        uint32_t ram_flags,
>                                        const char *path,
> -                                      bool readonly,
>                                        Error **errp);
>  
>  /**
> diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
> index f4fb6a2111..0bf9cfc659 100644
> --- a/include/exec/ram_addr.h
> +++ b/include/exec/ram_addr.h
> @@ -110,7 +110,6 @@ long qemu_maxrampagesize(void);
>   *  @ram_flags: RamBlock flags. Supported flags: RAM_SHARED, RAM_PMEM,
>   *              RAM_NORESERVE.
>   *  @mem_path or @fd: specify the backing file or device
> - *  @readonly: true to open @path for reading, false for read/write.
>   *  @errp: pointer to Error*, to store an error if it happens
>   *
>   * Return:
> @@ -119,10 +118,10 @@ long qemu_maxrampagesize(void);
>   */
>  RAMBlock *qemu_ram_alloc_from_file(ram_addr_t size, MemoryRegion *mr,
>                                     uint32_t ram_flags, const char *mem_path,
> -                                   bool readonly, Error **errp);
> +                                   Error **errp);
>  RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
>                                   uint32_t ram_flags, int fd, off_t offset,
> -                                 bool readonly, Error **errp);
> +                                 Error **errp);
>  
>  RAMBlock *qemu_ram_alloc_from_ptr(ram_addr_t size, void *host,
>                                    MemoryRegion *mr, Error **errp);
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index e05332d07f..2137028773 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1601,18 +1601,16 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
>                                        uint64_t align,
>                                        uint32_t ram_flags,
>                                        const char *path,
> -                                      bool readonly,
>                                        Error **errp)
>  {
>      Error *err = NULL;
>      memory_region_init(mr, owner, name, size);
>      mr->ram = true;
> -    mr->readonly = readonly;
> +    mr->readonly = ram_flags & RAM_READONLY;
>      mr->terminates = true;
>      mr->destructor = memory_region_destructor_ram;
>      mr->align = align;
> -    mr->ram_block = qemu_ram_alloc_from_file(size, mr, ram_flags, path,
> -                                             readonly, &err);
> +    mr->ram_block = qemu_ram_alloc_from_file(size, mr, ram_flags, path, &err);
>      if (err) {
>          mr->size = int128_zero();
>          object_unparent(OBJECT(mr));
> @@ -1635,7 +1633,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
>      mr->terminates = true;
>      mr->destructor = memory_region_destructor_ram;
>      mr->ram_block = qemu_ram_alloc_from_fd(size, mr, ram_flags, fd, offset,
> -                                           false, &err);
> +                                           &err);
>      if (err) {
>          mr->size = int128_zero();
>          object_unparent(OBJECT(mr));
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index b5be02f1cb..6096eac286 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -1534,7 +1534,6 @@ static int file_ram_open(const char *path,
>  
>  static void *file_ram_alloc(RAMBlock *block,
>                              int fd,
> -                            bool readonly,
>                              bool truncate,
>                              off_t offset,
>                              Error **errp)
> @@ -1589,7 +1588,7 @@ static void *file_ram_alloc(RAMBlock *block,
>          perror("ftruncate");
>      }
>  
> -    qemu_map_flags = readonly ? QEMU_MAP_READONLY : 0;
> +    qemu_map_flags = (block->flags & RAM_READONLY) ? QEMU_MAP_READONLY : 0;
>      qemu_map_flags |= (block->flags & RAM_SHARED) ? QEMU_MAP_SHARED : 0;
>      qemu_map_flags |= (block->flags & RAM_PMEM) ? QEMU_MAP_SYNC : 0;
>      qemu_map_flags |= (block->flags & RAM_NORESERVE) ? QEMU_MAP_NORESERVE : 0;
> @@ -2057,7 +2056,7 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
>  #ifdef CONFIG_POSIX
>  RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
>                                   uint32_t ram_flags, int fd, off_t offset,
> -                                 bool readonly, Error **errp)
> +                                 Error **errp)
>  {
>      RAMBlock *new_block;
>      Error *local_err = NULL;
> @@ -2065,7 +2064,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
>  
>      /* Just support these ram flags by now. */
>      assert((ram_flags & ~(RAM_SHARED | RAM_PMEM | RAM_NORESERVE |
> -                          RAM_PROTECTED)) == 0);
> +                          RAM_PROTECTED | RAM_READONLY)) == 0);
>  
>      if (xen_enabled()) {
>          error_setg(errp, "-mem-path not supported with Xen");
> @@ -2100,8 +2099,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
>      new_block->used_length = size;
>      new_block->max_length = size;
>      new_block->flags = ram_flags;
> -    new_block->host = file_ram_alloc(new_block, fd, readonly,
> -                                     !file_size, offset, errp);
> +    new_block->host = file_ram_alloc(new_block, fd, !file_size, offset, errp);
>      if (!new_block->host) {
>          g_free(new_block);
>          return NULL;
> @@ -2120,11 +2118,11 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
>  
>  RAMBlock *qemu_ram_alloc_from_file(ram_addr_t size, MemoryRegion *mr,
>                                     uint32_t ram_flags, const char *mem_path,
> -                                   bool readonly, Error **errp)
> +                                   Error **errp)
>  {
>      int fd;
> -    bool created;
>      RAMBlock *block;
> +    bool created, readonly = ram_flags & RAM_READONLY;
>  
>      fd = file_ram_open(mem_path, memory_region_name(mr), readonly, &created,
>                         errp);
> @@ -2132,7 +2130,7 @@ RAMBlock *qemu_ram_alloc_from_file(ram_addr_t size, MemoryRegion *mr,
>          return NULL;
>      }
>  
> -    block = qemu_ram_alloc_from_fd(size, mr, ram_flags, fd, 0, readonly, errp);
> +    block = qemu_ram_alloc_from_fd(size, mr, ram_flags, fd, 0, errp);
>      if (!block) {
>          if (created) {
>              unlink(mem_path);
> -- 
> 2.37.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


