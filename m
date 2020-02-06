Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D5E15476A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 16:14:50 +0100 (CET)
Received: from localhost ([::1]:40792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izirh-0006M7-Ha
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 10:14:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52589)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iziqb-0005Rh-7V
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 10:13:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iziqZ-0005SJ-2F
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 10:13:40 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33574
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1iziqY-0005CD-Jl
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 10:13:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581002000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jbgm2m42f7OMjK3H9K2IflfpyPtQa+Xtuklb5NOtQWA=;
 b=Tn6JmZXArRJgOi71R040B+aLqdOnHHnH1sVZb2nS8OFN0oHLeoa/xJD8I/11gP03bjCMyW
 JvhVGJ9ud61g/F6/fQ6sLZhn8sT4sVjZPsvOAtYBNXuUUFx1yapP51l06HfJ9pHqgXB+oc
 4pLF5YGo1Pi9yKgNr6PE/iNbjZh9krM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-_e-uPQN9NyqD8MmYtjWSYA-1; Thu, 06 Feb 2020 10:13:18 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B60018010F1;
 Thu,  6 Feb 2020 15:13:17 +0000 (UTC)
Received: from [10.36.118.128] (unknown [10.36.118.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74EE610027A1;
 Thu,  6 Feb 2020 15:13:13 +0000 (UTC)
Subject: Re: [PATCH v1 08/13] util/mmap-alloc: Prepare for resizable mmaps
To: =?UTF-8?Q?Murilo_Opsfelder_Ara=c3=bajo?= <muriloo@linux.ibm.com>
References: <20200203183125.164879-1-david@redhat.com>
 <20200203183125.164879-9-david@redhat.com>
 <2036195.sfUKtyktLc@kermit.br.ibm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <a700b170-97da-fb43-9a80-41fd44949152@redhat.com>
Date: Thu, 6 Feb 2020 16:13:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <2036195.sfUKtyktLc@kermit.br.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: _e-uPQN9NyqD8MmYtjWSYA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.02.20 00:00, Murilo Opsfelder Ara=FAjo wrote:
> Hello, David.
>=20
> On Monday, February 3, 2020 3:31:20 PM -03 David Hildenbrand wrote:
>> When shrinking a mmap we want to re-reserve the already populated area.
>> When growing a memory region, we want to populate starting with a given
>> fd_offset. Prepare by allowing to pass these parameters.
>>
>> Also, let's make sure we always process full pages, to avoid
>> unmapping/remapping pages that are already in use when
>> growing/shrinking. (existing callers seem to guarantee this, but that's
>> not obvious)
>>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Greg Kurz <groug@kaod.org>
>> Cc: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
>> Cc: Eduardo Habkost <ehabkost@redhat.com>
>> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>  util/mmap-alloc.c | 32 +++++++++++++++++++++-----------
>>  1 file changed, 21 insertions(+), 11 deletions(-)
>>
>> diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
>> index f043ccb0ab..63ad6893b7 100644
>> --- a/util/mmap-alloc.c
>> +++ b/util/mmap-alloc.c
>> @@ -83,12 +83,12 @@ size_t qemu_mempath_getpagesize(const char *mem_path=
)
>>  }
>>
>>  /*
>> - * Reserve a new memory region of the requested size to be used for map=
ping
>> - * from the given fd (if any).
>> + * Reserve a new memory region of the requested size or re-reserve part=
s
>> + * of an existing region to be used for mapping from the given fd (if a=
ny).
>> */
>> -static void *mmap_reserve(size_t size, int fd)
>> +static void *mmap_reserve(void *ptr, size_t size, int fd)
>>  {
>> -    int flags =3D MAP_PRIVATE;
>> +    int flags =3D MAP_PRIVATE | (ptr ? MAP_FIXED : 0);
>>
>>  #if defined(__powerpc64__) && defined(__linux__)
>>      /*
>> @@ -111,19 +111,23 @@ static void *mmap_reserve(size_t size, int fd)
>>      flags |=3D MAP_ANONYMOUS;
>>  #endif
>>
>> -    return mmap(0, size, PROT_NONE, flags, fd, 0);
>> +    return mmap(ptr, size, PROT_NONE, flags, fd, 0);
>>  }
>>
>>  /*
>>   * Populate memory in a reserved region from the given fd (if any).
>>   */
>> -static void *mmap_populate(void *ptr, size_t size, int fd, bool shared,
>> -                           bool is_pmem)
>> +static void *mmap_populate(void *ptr, size_t size, int fd, size_t
>> fd_offset, +                           bool shared, bool is_pmem)
>>  {
>>      int map_sync_flags =3D 0;
>>      int flags =3D MAP_FIXED;
>>      void *new_ptr;
>>
>> +    if (fd =3D=3D -1) {
>> +        fd_offset =3D 0;
>> +    }
>> +
>>      flags |=3D fd =3D=3D -1 ? MAP_ANONYMOUS : 0;
>>      flags |=3D shared ? MAP_SHARED : MAP_PRIVATE;
>>      if (shared && is_pmem) {
>> @@ -131,7 +135,7 @@ static void *mmap_populate(void *ptr, size_t size, i=
nt
>> fd, bool shared, }
>>
>>      new_ptr =3D mmap(ptr, size, PROT_READ | PROT_WRITE, flags |
>> map_sync_flags, -                   fd, 0);
>> +                   fd, fd_offset);
>>      if (new_ptr =3D=3D MAP_FAILED && map_sync_flags) {
>>          if (errno =3D=3D ENOTSUP) {
>>              char *proc_link =3D g_strdup_printf("/proc/self/fd/%d", fd)=
;
>> @@ -153,7 +157,7 @@ static void *mmap_populate(void *ptr, size_t size, i=
nt
>> fd, bool shared, * If mmap failed with MAP_SHARED_VALIDATE | MAP_SYNC, w=
e
>> will try * again without these flags to handle backwards compatibility. =
*/
>> -        new_ptr =3D mmap(ptr, size, PROT_READ | PROT_WRITE, flags, fd, =
0);
>> +        new_ptr =3D mmap(ptr, size, PROT_READ | PROT_WRITE, flags, fd,
>> fd_offset); }
>>      return new_ptr;
>>  }
>> @@ -178,13 +182,16 @@ void *qemu_ram_mmap(int fd,
>>      size_t offset, total;
>>      void *ptr, *guardptr;
>>
>> +    /* we can only map whole pages */
>> +    size =3D QEMU_ALIGN_UP(size, pagesize);
>> +
>=20
> Caller already rounds up size to block->page_size.
>=20
> Why this QEMU_ALIGN_UP is necessary?
>=20
>>      /*
>>       * Note: this always allocates at least one extra page of virtual
>> address * space, even if size is already aligned.
>>       */
>>      total =3D size + align;
>=20
> If size was aligned above with pagesize boundary, why would this align be=
=20
> necessary?
>=20
> Can the pagesize differ from memory region align?

Sorry, skipped this comment.

Yes, e.g., we want to align ram blocks for KVM to hugepage size, to
allow for transparent huge pages. So the comment still holds.


--=20
Thanks,

David / dhildenb


