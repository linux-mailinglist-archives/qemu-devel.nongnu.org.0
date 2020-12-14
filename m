Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FBE2D96E4
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 12:04:25 +0100 (CET)
Received: from localhost ([::1]:38886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koleS-0005q1-Ki
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 06:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kolcK-0005Mw-Rf
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:02:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kolcG-0006DO-9r
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:02:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607943726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4qKeBdQAVaRLp0OddqZbG5LYByApk1UJjkcKbD4bJwQ=;
 b=XBG8Xe1f/Iyv57aGOZ0cO6wV0eBfruliRGMLbnk5vLPW36/gwWgEY7a1km1qaqU8qzBqgY
 FQiAIx5dmbXIb7/+HANcNyDoMRqkx98KIaSJfXZl6WoswuK2Fhgxk5F7dtlqWtuoJzGjAK
 WVvU1Sro+LKpTMYoYIxCVs/WNiS24eI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-Fm7S-6ZbPVCy9QcaExctSA-1; Mon, 14 Dec 2020 06:02:01 -0500
X-MC-Unique: Fm7S-6ZbPVCy9QcaExctSA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 636C2192CC41;
 Mon, 14 Dec 2020 11:02:00 +0000 (UTC)
Received: from localhost (unknown [10.40.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D5205D9D0;
 Mon, 14 Dec 2020 11:01:51 +0000 (UTC)
Date: Mon, 14 Dec 2020 12:01:49 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 1/3] memory: add readonly support to
 memory_region_init_ram_from_file()
Message-ID: <20201214120149.4fb0835f@redhat.com>
In-Reply-To: <20200916095150.755714-2-stefanha@redhat.com>
References: <20200916095150.755714-1-stefanha@redhat.com>
 <20200916095150.755714-2-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julio Montes <julio.montes@intel.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>, qemu-devel@nongnu.org,
 eric.g.ernst@gmail.com, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw4PCqQ==?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Sep 2020 10:51:48 +0100
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> There is currently no way to open(O_RDONLY) and mmap(PROT_READ) when
> creating a memory region from a file. This functionality is needed since
> the underlying host file may not allow writing.
>=20
> Add a bool readonly argument to memory_region_init_ram_from_file() and
> the APIs it calls.
>=20
> Extend memory_region_init_ram_from_file() rather than introducing a
> memory_region_init_rom_from_file() API so that callers can easily make a
> choice between read/write and read-only at runtime without calling
> different APIs.
>=20
> No new RAMBlock flag is introduced for read-only because it's unclear
> whether RAMBlocks need to know that they are read-only. Pass a bool
> readonly argument instead.
>=20
> Both of these design decisions can be changed in the future. It just
> seemed like the simplest approach to me.
>=20
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=83=C2=A9 <philmd@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/exec/memory.h     |  2 ++
>  include/exec/ram_addr.h   |  5 +++--
>  include/qemu/mmap-alloc.h |  2 ++
>  backends/hostmem-file.c   |  2 +-
>  exec.c                    | 18 +++++++++++-------
>  softmmu/memory.c          |  7 +++++--
>  util/mmap-alloc.c         | 10 ++++++----
>  util/oslib-posix.c        |  2 +-
>  8 files changed, 31 insertions(+), 17 deletions(-)
>=20
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index f1bb2a7df5..a81fa26165 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -879,6 +879,7 @@ void memory_region_init_resizeable_ram(MemoryRegion *=
mr,
>   *             - RAM_PMEM: the memory is persistent memory
>   *             Other bits are ignored now.
>   * @path: the path in which to allocate the RAM.
> + * @readonly: true to open @path for reading, false for read/write.
>   * @errp: pointer to Error*, to store an error if it happens.
>   *
>   * Note that this function does not do anything to cause the data in the
> @@ -891,6 +892,7 @@ void memory_region_init_ram_from_file(MemoryRegion *m=
r,
>                                        uint64_t align,
>                                        uint32_t ram_flags,
>                                        const char *path,
> +                                      bool readonly,
>                                        Error **errp);
> =20
>  /**
> diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
> index 3ef729a23c..2a0360a0f2 100644
> --- a/include/exec/ram_addr.h
> +++ b/include/exec/ram_addr.h
> @@ -110,6 +110,7 @@ long qemu_maxrampagesize(void);
>   *              - RAM_PMEM: the backend @mem_path or @fd is persistent m=
emory
>   *              Other bits are ignored.
>   *  @mem_path or @fd: specify the backing file or device
> + *  @readonly: true to open @path for reading, false for read/write.
>   *  @errp: pointer to Error*, to store an error if it happens
>   *
>   * Return:
> @@ -118,9 +119,9 @@ long qemu_maxrampagesize(void);
>   */
>  RAMBlock *qemu_ram_alloc_from_file(ram_addr_t size, MemoryRegion *mr,
>                                     uint32_t ram_flags, const char *mem_p=
ath,
> -                                   Error **errp);
> +                                   bool readonly, Error **errp);
>  RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
> -                                 uint32_t ram_flags, int fd,
> +                                 uint32_t ram_flags, int fd, bool readon=
ly,
>                                   Error **errp);
> =20
>  RAMBlock *qemu_ram_alloc_from_ptr(ram_addr_t size, void *host,
> diff --git a/include/qemu/mmap-alloc.h b/include/qemu/mmap-alloc.h
> index e786266b92..8b7a5c70f3 100644
> --- a/include/qemu/mmap-alloc.h
> +++ b/include/qemu/mmap-alloc.h
> @@ -14,6 +14,7 @@ size_t qemu_mempath_getpagesize(const char *mem_path);
>   *  @size: the number of bytes to be mmaped
>   *  @align: if not zero, specify the alignment of the starting mapping a=
ddress;
>   *          otherwise, the alignment in use will be determined by QEMU.
> + *  @readonly: true for a read-only mapping, false for read/write.
>   *  @shared: map has RAM_SHARED flag.
>   *  @is_pmem: map has RAM_PMEM flag.
>   *
> @@ -24,6 +25,7 @@ size_t qemu_mempath_getpagesize(const char *mem_path);
>  void *qemu_ram_mmap(int fd,
>                      size_t size,
>                      size_t align,
> +                    bool readonly,
>                      bool shared,
>                      bool is_pmem);
> =20
> diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
> index a3b2e8209e..dffdf142e0 100644
> --- a/backends/hostmem-file.c
> +++ b/backends/hostmem-file.c
> @@ -58,7 +58,7 @@ file_backend_memory_alloc(HostMemoryBackend *backend, E=
rror **errp)
>                                       backend->size, fb->align,
>                                       (backend->share ? RAM_SHARED : 0) |
>                                       (fb->is_pmem ? RAM_PMEM : 0),
> -                                     fb->mem_path, errp);
> +                                     fb->mem_path, false, errp);
>      g_free(name);
>  #endif
>  }
> diff --git a/exec.c b/exec.c
> index e34b602bdf..f1e82dad7a 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -1770,6 +1770,7 @@ static int64_t get_file_align(int fd)
> =20
>  static int file_ram_open(const char *path,
>                           const char *region_name,
> +                         bool readonly,
>                           bool *created,
>                           Error **errp)
>  {
> @@ -1780,7 +1781,7 @@ static int file_ram_open(const char *path,
> =20
>      *created =3D false;
>      for (;;) {
> -        fd =3D open(path, O_RDWR);
> +        fd =3D open(path, readonly ? O_RDONLY : O_RDWR);
>          if (fd >=3D 0) {
>              /* @path names an existing file, use it */
>              break;
> @@ -1832,6 +1833,7 @@ static int file_ram_open(const char *path,
>  static void *file_ram_alloc(RAMBlock *block,
>                              ram_addr_t memory,
>                              int fd,
> +                            bool readonly,
>                              bool truncate,
>                              Error **errp)
>  {
> @@ -1882,7 +1884,7 @@ static void *file_ram_alloc(RAMBlock *block,
>          perror("ftruncate");
>      }
> =20
> -    area =3D qemu_ram_mmap(fd, memory, block->mr->align,
> +    area =3D qemu_ram_mmap(fd, memory, block->mr->align, readonly,
>                           block->flags & RAM_SHARED, block->flags & RAM_P=
MEM);
>      if (area =3D=3D MAP_FAILED) {
>          error_setg_errno(errp, errno,
> @@ -2314,7 +2316,7 @@ static void ram_block_add(RAMBlock *new_block, Erro=
r **errp, bool shared)
> =20
>  #ifdef CONFIG_POSIX
>  RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
> -                                 uint32_t ram_flags, int fd,
> +                                 uint32_t ram_flags, int fd, bool readon=
ly,
>                                   Error **errp)
>  {
>      RAMBlock *new_block;
> @@ -2368,7 +2370,8 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, M=
emoryRegion *mr,
>      new_block->used_length =3D size;
>      new_block->max_length =3D size;
>      new_block->flags =3D ram_flags;
> -    new_block->host =3D file_ram_alloc(new_block, size, fd, !file_size, =
errp);
> +    new_block->host =3D file_ram_alloc(new_block, size, fd, readonly,
> +                                     !file_size, errp);
>      if (!new_block->host) {
>          g_free(new_block);
>          return NULL;
> @@ -2387,18 +2390,19 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size,=
 MemoryRegion *mr,
> =20
>  RAMBlock *qemu_ram_alloc_from_file(ram_addr_t size, MemoryRegion *mr,
>                                     uint32_t ram_flags, const char *mem_p=
ath,
> -                                   Error **errp)
> +                                   bool readonly, Error **errp)
>  {
>      int fd;
>      bool created;
>      RAMBlock *block;
> =20
> -    fd =3D file_ram_open(mem_path, memory_region_name(mr), &created, err=
p);
> +    fd =3D file_ram_open(mem_path, memory_region_name(mr), readonly, &cr=
eated,
> +                       errp);
>      if (fd < 0) {
>          return NULL;
>      }
> =20
> -    block =3D qemu_ram_alloc_from_fd(size, mr, ram_flags, fd, errp);
> +    block =3D qemu_ram_alloc_from_fd(size, mr, ram_flags, fd, readonly, =
errp);
>      if (!block) {
>          if (created) {
>              unlink(mem_path);
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index d030eb6f7c..1b0d1d42c6 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1553,15 +1553,18 @@ void memory_region_init_ram_from_file(MemoryRegio=
n *mr,
>                                        uint64_t align,
>                                        uint32_t ram_flags,
>                                        const char *path,
> +                                      bool readonly,
>                                        Error **errp)
>  {
>      Error *err =3D NULL;
>      memory_region_init(mr, owner, name, size);
>      mr->ram =3D true;
> +    mr->readonly =3D readonly;
>      mr->terminates =3D true;
>      mr->destructor =3D memory_region_destructor_ram;
>      mr->align =3D align;
> -    mr->ram_block =3D qemu_ram_alloc_from_file(size, mr, ram_flags, path=
, &err);
> +    mr->ram_block =3D qemu_ram_alloc_from_file(size, mr, ram_flags, path=
,
> +                                             readonly, &err);
>      mr->dirty_log_mask =3D tcg_enabled() ? (1 << DIRTY_MEMORY_CODE) : 0;
>      if (err) {
>          mr->size =3D int128_zero();
> @@ -1585,7 +1588,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *m=
r,
>      mr->destructor =3D memory_region_destructor_ram;
>      mr->ram_block =3D qemu_ram_alloc_from_fd(size, mr,
>                                             share ? RAM_SHARED : 0,
> -                                           fd, &err);
> +                                           fd, false, &err);
>      mr->dirty_log_mask =3D tcg_enabled() ? (1 << DIRTY_MEMORY_CODE) : 0;
>      if (err) {
>          mr->size =3D int128_zero();
> diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
> index 27dcccd8ec..890fda6a35 100644
> --- a/util/mmap-alloc.c
> +++ b/util/mmap-alloc.c
> @@ -85,9 +85,11 @@ size_t qemu_mempath_getpagesize(const char *mem_path)
>  void *qemu_ram_mmap(int fd,
>                      size_t size,
>                      size_t align,
> +                    bool readonly,
>                      bool shared,
>                      bool is_pmem)
>  {
> +    int prot;
>      int flags;
>      int map_sync_flags =3D 0;
>      int guardfd;
> @@ -146,8 +148,9 @@ void *qemu_ram_mmap(int fd,
> =20
>      offset =3D QEMU_ALIGN_UP((uintptr_t)guardptr, align) - (uintptr_t)gu=
ardptr;
> =20
> -    ptr =3D mmap(guardptr + offset, size, PROT_READ | PROT_WRITE,
> -               flags | map_sync_flags, fd, 0);
> +    prot =3D PROT_READ | (readonly ? 0 : PROT_WRITE);
> +
> +    ptr =3D mmap(guardptr + offset, size, prot, flags | map_sync_flags, =
fd, 0);
> =20
>      if (ptr =3D=3D MAP_FAILED && map_sync_flags) {
>          if (errno =3D=3D ENOTSUP) {
> @@ -171,8 +174,7 @@ void *qemu_ram_mmap(int fd,
>           * if map failed with MAP_SHARED_VALIDATE | MAP_SYNC,
>           * we will remove these flags to handle compatibility.
>           */
> -        ptr =3D mmap(guardptr + offset, size, PROT_READ | PROT_WRITE,
> -                   flags, fd, 0);
> +        ptr =3D mmap(guardptr + offset, size, prot, flags, fd, 0);
>      }
> =20
>      if (ptr =3D=3D MAP_FAILED) {
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index ad8001a4ad..236b3a88c1 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -227,7 +227,7 @@ void *qemu_memalign(size_t alignment, size_t size)
>  void *qemu_anon_ram_alloc(size_t size, uint64_t *alignment, bool shared)
>  {
>      size_t align =3D QEMU_VMALLOC_ALIGN;
> -    void *ptr =3D qemu_ram_mmap(-1, size, align, shared, false);
> +    void *ptr =3D qemu_ram_mmap(-1, size, align, false, shared, false);
> =20
>      if (ptr =3D=3D MAP_FAILED) {
>          return NULL;


