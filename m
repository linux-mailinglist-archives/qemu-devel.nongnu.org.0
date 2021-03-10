Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB35333A20
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:36:53 +0100 (CET)
Received: from localhost ([::1]:49798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJwCy-0001U0-NV
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:36:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lJvoU-0008R0-5E
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:11:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lJvoQ-0006MG-Ad
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:11:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615371088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aWxQDC+lhUkO5q5VavZy67XuGx36A3pnM4guV03SqH8=;
 b=HfKFlOy6ilcFTqPiTW6TZZ/ioq2189wp0kSLXU3PgldG8nFIKSh57efdicmsfoRoX8ncYU
 kRl4+mtkX8T6AiRdf1fR9mycpjcqaaE4n3FcItOAkOaakurHZ2H4BavwLKNDeyBiCd7Dhx
 MM4446AQTLngH7h8HLd7EtWnQIk6wRA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-DEU1pVu5MIaixZAHjKI7fA-1; Wed, 10 Mar 2021 05:11:26 -0500
X-MC-Unique: DEU1pVu5MIaixZAHjKI7fA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 678791005D4D;
 Wed, 10 Mar 2021 10:11:24 +0000 (UTC)
Received: from [10.36.114.87] (ovpn-114-87.ams2.redhat.com [10.36.114.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6FC760C0F;
 Wed, 10 Mar 2021 10:11:10 +0000 (UTC)
Subject: Re: [PATCH v3 09/12] util/mmap-alloc: Pass flags instead of separate
 bools to qemu_ram_mmap()
From: David Hildenbrand <david@redhat.com>
To: Peter Xu <peterx@redhat.com>
References: <20210309200451.GF763132@xz-x1>
 <29372C8B-7F57-4AB6-99DB-5E73179D7555@redhat.com>
 <20210309205809.GI763132@xz-x1>
 <8f1f955d-f3b8-298b-eb43-b5d51824af44@redhat.com>
Organization: Red Hat GmbH
Message-ID: <1831f4b8-9dd2-4fc1-c3cd-1e789a7bc37f@redhat.com>
Date: Wed, 10 Mar 2021 11:11:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <8f1f955d-f3b8-298b-eb43-b5d51824af44@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10.03.21 09:41, David Hildenbrand wrote:
> On 09.03.21 21:58, Peter Xu wrote:
>> On Tue, Mar 09, 2021 at 09:27:10PM +0100, David Hildenbrand wrote:
>>>
>>>> Am 09.03.2021 um 21:04 schrieb Peter Xu <peterx@redhat.com>:
>>>>
>>>> ﻿On Mon, Mar 08, 2021 at 04:05:57PM +0100, David Hildenbrand wrote:
>>>>> Let's introduce a new set of flags that abstract mmap logic and replace
>>>>> our current set of bools, to prepare for another flag.
>>>>>
>>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>>> ---
>>>>> include/qemu/mmap-alloc.h | 17 +++++++++++------
>>>>> softmmu/physmem.c         |  8 +++++---
>>>>> util/mmap-alloc.c         | 14 +++++++-------
>>>>> util/oslib-posix.c        |  3 ++-
>>>>> 4 files changed, 25 insertions(+), 17 deletions(-)
>>>>>
>>>>> diff --git a/include/qemu/mmap-alloc.h b/include/qemu/mmap-alloc.h
>>>>> index 456ff87df1..55664ea9f3 100644
>>>>> --- a/include/qemu/mmap-alloc.h
>>>>> +++ b/include/qemu/mmap-alloc.h
>>>>> @@ -6,6 +6,15 @@ size_t qemu_fd_getpagesize(int fd);
>>>>>
>>>>> size_t qemu_mempath_getpagesize(const char *mem_path);
>>>>>
>>>>> +/* Map PROT_READ instead of PROT_READ|PROT_WRITE. */
>>>>> +#define QEMU_RAM_MMAP_READONLY      (1 << 0)
>>>>> +
>>>>> +/* Map MAP_SHARED instead of MAP_PRIVATE. */
>>>>> +#define QEMU_RAM_MMAP_SHARED        (1 << 1)
>>>>> +
>>>>> +/* Map MAP_SYNC|MAP_SHARED_VALIDATE if possible, fallback and warn otherwise. */
>>>>> +#define QEMU_RAM_MMAP_PMEM          (1 << 2)
>>>>
>>>> Sorry to speak late - I just noticed that is_pmem can actually be converted too
>>>> with "MAP_SYNC | MAP_SHARED_VALIDATE".  We can even define MAP_PMEM_EXTRA for
>>>> use within qemu if we want.  Then we can avoid one layer of QEMU_RAM_* by
>>>> directly using MAP_*, I think?
>>>>
>>>
>>> No problem :) I don‘t think passing in random MAP_ flags is a good interface (we would at least need an allow list).
>>>
>>>    I like the abstraction / explicit semenatics of QEMU_RAM_MMAP_PMEM as spelled out in the comment. Doing the fallback when passing in the mmap flags is a little ugly. We could do the fallback in the caller, I think I remember there is only a single call site.
>>>
>>> PROT_READ won‘t be covered as well, not sure if passing in protections improves the interface.
>>>
>>> Long story short, I like the abstraction provided by these flags, only exporting what we actually support/abstracting it, and setting some MAP_ flags automatically (MAP_PRIVATE, MAP_ANON) instead of having to spell that put in the caller.
>>
>> Yeh the READONLY flag would be special, it will need to be separated from the
>> rest flags.  I'd keep my own preference, but if you really like the current
>> way, maybe at least move it to qemu/osdep.h?  So at least when someone needs a
>> cross-platform flag they'll show up - while mmap-alloc.h looks still only for
>> the posix world, then it'll be odd to introduce these flags only for posix even
>> if posix definied most of them.
> 
> I'll give it another thought today. I certainly want to avoid moving all
> that MAP_ flag and PROT_ logic to the callers. E.g., MAP_SHARED implies
> !MAP_PRIVATE. MAP_SYNC implies that we want MAP_SHARED_VALIDATE. fd < 0
> implies MAP_ANONYMOUS.
> 
> Maybe something like
> 
> /*
>    * QEMU's MMAP abstraction to map guest RAM, taking care of alignment
>    * requirements and guard pages.
>    *
>    * Supported flags: MAP_SHARED, MAP_SYNC
>    *
>    * Implicitly set flags:
>    * - MAP PRIVATE: When !MAP_SHARED and !MAP_SYNC
>    * - MAP_ANONYMOUS: When fd < 0
>    * - MAP_SHARED_VALIDATE: When MAP_SYNC
>    *
>    * If mapping with MAP_SYNC|MAP_SHARED_VALIDATE fails, fallback to
>    * !MAP_SYNC|MAP_SHARED and warn.
>    */
>    void *qemu_ram_mmap(int fd,
>                        size_t size,
>                        size_t align,
>                        bool readonly,
>                        uint32_t mmap_flags,
>                        off_t map_offset);

What about this:


 From 13a59d404bb3edaed9e42c94432be28fb9a65c26 Mon Sep 17 00:00:00 2001
From: David Hildenbrand <david@redhat.com>
Date: Fri, 5 Mar 2021 17:20:37 +0100
Subject: [PATCH] util/mmap-alloc: Pass MAP_ flags instead of separate bools to
  qemu_ram_mmap()

Let's pass MAP_ flags instead of bools to prepare for passing other MAP_
flags and update the documentation of qemu_ram_mmap(). Only allow selected
MAP_ flags (MAP_SHARED, MAP_SYNC) to be passed and keep setting other
flags implicitly.

Keep the "readonly" flag, as it cannot be expressed via MAP_ flags.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
  include/qemu/mmap-alloc.h | 19 ++++++++++++++-----
  softmmu/physmem.c         |  6 ++++--
  util/mmap-alloc.c         | 13 ++++++++-----
  util/oslib-posix.c        |  3 ++-
  4 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/include/qemu/mmap-alloc.h b/include/qemu/mmap-alloc.h
index 456ff87df1..27ef374810 100644
--- a/include/qemu/mmap-alloc.h
+++ b/include/qemu/mmap-alloc.h
@@ -7,7 +7,10 @@ size_t qemu_fd_getpagesize(int fd);
  size_t qemu_mempath_getpagesize(const char *mem_path);
  
  /**
- * qemu_ram_mmap: mmap the specified file or device.
+ * qemu_ram_mmap: mmap anonymous memory, the specified file or device.
+ *
+ * QEMU's MMAP abstraction to map guest RAM, simplifying flag handling,
+ * taking care of alignment requirements and installing guard pages.
   *
   * Parameters:
   *  @fd: the file or the device to mmap
@@ -15,10 +18,17 @@ size_t qemu_mempath_getpagesize(const char *mem_path);
   *  @align: if not zero, specify the alignment of the starting mapping address;
   *          otherwise, the alignment in use will be determined by QEMU.
   *  @readonly: true for a read-only mapping, false for read/write.
- *  @shared: map has RAM_SHARED flag.
- *  @is_pmem: map has RAM_PMEM flag.
+ *  @map_flags: supported MAP_* flags: MAP_SHARED, MAP_SYNC
   *  @map_offset: map starts at offset of map_offset from the start of fd
   *
+ * Implicitly handled map_flags:
+ * - MAP PRIVATE: With !MAP_SHARED
+ * - MAP_ANONYMOUS: With fd < 0
+ * - MAP_SHARED_VALIDATE: With MAP_SYNC && MAP_SHARED
+ *
+ * MAP_SYNC is ignored without MAP_SHARED. If mapping via MAP_SYNC fails,
+ * warn and fallback to mapping without MAP_SYNC.
+ *
   * Return:
   *  On success, return a pointer to the mapped area.
   *  On failure, return MAP_FAILED.
@@ -27,8 +37,7 @@ void *qemu_ram_mmap(int fd,
                      size_t size,
                      size_t align,
                      bool readonly,
-                    bool shared,
-                    bool is_pmem,
+                    uint32_t map_flags,
                      off_t map_offset);
  
  void qemu_ram_munmap(int fd, void *ptr, size_t size);
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 8f3d286e12..1336884b51 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1533,6 +1533,7 @@ static void *file_ram_alloc(RAMBlock *block,
                              off_t offset,
                              Error **errp)
  {
+    uint32_t map_flags;
      void *area;
  
      block->page_size = qemu_fd_getpagesize(fd);
@@ -1580,9 +1581,10 @@ static void *file_ram_alloc(RAMBlock *block,
          perror("ftruncate");
      }
  
+    map_flags = (block->flags & RAM_SHARED) ? MAP_SHARED : 0;
+    map_flags |= (block->flags & RAM_PMEM) ? MAP_SYNC : 0;
      area = qemu_ram_mmap(fd, memory, block->mr->align, readonly,
-                         block->flags & RAM_SHARED, block->flags & RAM_PMEM,
-                         offset);
+                         map_flags, offset);
      if (area == MAP_FAILED) {
          error_setg_errno(errp, errno,
                           "unable to map backing store for guest RAM");
diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 0e2bd7bc0e..b558f1675a 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -119,16 +119,20 @@ static void *mmap_reserve(size_t size, int fd)
   * it accessible.
   */
  static void *mmap_activate(void *ptr, size_t size, int fd, bool readonly,
-                           bool shared, bool is_pmem, off_t map_offset)
+                           uint32_t map_flags, off_t map_offset)
  {
+    const bool shared = map_flags & MAP_SHARED;
+    const bool sync = map_flags & MAP_SYNC;
      const int prot = PROT_READ | (readonly ? 0 : PROT_WRITE);
      int map_sync_flags = 0;
      int flags = MAP_FIXED;
      void *activated_ptr;
  
+    g_assert(!(map_flags & ~(MAP_SHARED | MAP_SYNC)));
+
      flags |= fd == -1 ? MAP_ANONYMOUS : 0;
      flags |= shared ? MAP_SHARED : MAP_PRIVATE;
-    if (shared && is_pmem) {
+    if (shared && sync) {
          map_sync_flags = MAP_SYNC | MAP_SHARED_VALIDATE;
      }
  
@@ -174,8 +178,7 @@ void *qemu_ram_mmap(int fd,
                      size_t size,
                      size_t align,
                      bool readonly,
-                    bool shared,
-                    bool is_pmem,
+                    uint32_t map_flags,
                      off_t map_offset)
  {
      const size_t guard_pagesize = mmap_guard_pagesize(fd);
@@ -199,7 +202,7 @@ void *qemu_ram_mmap(int fd,
  
      offset = QEMU_ALIGN_UP((uintptr_t)guardptr, align) - (uintptr_t)guardptr;
  
-    ptr = mmap_activate(guardptr + offset, size, fd, readonly, shared, is_pmem,
+    ptr = mmap_activate(guardptr + offset, size, fd, readonly, map_flags,
                          map_offset);
      if (ptr == MAP_FAILED) {
          munmap(guardptr, total);
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 36820fec16..95e2b85279 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -229,8 +229,9 @@ void *qemu_memalign(size_t alignment, size_t size)
  /* alloc shared memory pages */
  void *qemu_anon_ram_alloc(size_t size, uint64_t *alignment, bool shared)
  {
+    const uint32_t map_flags = shared ? MAP_SHARED : 0;
      size_t align = QEMU_VMALLOC_ALIGN;
-    void *ptr = qemu_ram_mmap(-1, size, align, false, shared, false, 0);
+    void *ptr = qemu_ram_mmap(-1, size, align, false, map_flags, 0);
  
      if (ptr == MAP_FAILED) {
          return NULL;
-- 
2.29.2




-- 
Thanks,

David / dhildenb


