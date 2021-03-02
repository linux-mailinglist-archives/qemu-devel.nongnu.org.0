Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 634C532AA72
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 20:35:05 +0100 (CET)
Received: from localhost ([::1]:43432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHAnQ-0003Q8-8X
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 14:35:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHAHG-0007u1-Hk
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 14:01:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHAHE-0000ES-Oe
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 14:01:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614711707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Kq8ImMfn1vW9nImGYK9skXurogm4MKw3gVNZIccGfQ=;
 b=fmT1Q9M4w6nSj9lZoeIiw/iItXcsWhrgcQsoYoRYavZ2w2B2j1Yy8ANl3kQspQZ+P5RxLH
 6rs6sx9iRQaiuPR6vTtWcKpiAlQuyKII2tQQMC9HQb6wefDo6aadd2RDND/m2cflPDPeFK
 x2UlQKyXK/rapfmx5JN0uKVsV77Nbw0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-uYiO4hBbOeanzVFNy2AgeA-1; Tue, 02 Mar 2021 14:01:45 -0500
X-MC-Unique: uYiO4hBbOeanzVFNy2AgeA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E34179EC0;
 Tue,  2 Mar 2021 19:01:44 +0000 (UTC)
Received: from [10.36.114.189] (ovpn-114-189.ams2.redhat.com [10.36.114.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7FC061F20;
 Tue,  2 Mar 2021 19:01:11 +0000 (UTC)
To: Peter Xu <peterx@redhat.com>
References: <20210209134939.13083-1-david@redhat.com>
 <20210209134939.13083-9-david@redhat.com> <20210302175112.GN397383@xz-x1>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v1 8/9] util/mmap-alloc: support RAM_NORESERVE via
 MAP_NORESERVE
Message-ID: <522c672e-9c16-48ef-24a8-3687b5332b2a@redhat.com>
Date: Tue, 2 Mar 2021 20:01:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210302175112.GN397383@xz-x1>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.03.21 18:51, Peter Xu wrote:
> On Tue, Feb 09, 2021 at 02:49:38PM +0100, David Hildenbrand wrote:
>> +#define OVERCOMMIT_MEMORY_PATH "/proc/sys/vm/overcommit_memory"
>> +static bool map_noreserve_effective(int fd, bool shared)
>> +{
>> +#if defined(__linux__)
>> +    gchar *content = NULL;
>> +    const char *endptr;
>> +    unsigned int tmp;
>> +
>> +    /* hugetlbfs behaves differently */
>> +    if (qemu_fd_getpagesize(fd) != qemu_real_host_page_size) {
>> +        return true;
>> +    }
>> +
>> +    /* only private shared mappings are accounted (ignoring /dev/zero) */
>> +    if (fd != -1 && shared) {
>> +        return true;
>> +    }
>> +
>> +    if (g_file_get_contents(OVERCOMMIT_MEMORY_PATH, &content, NULL, NULL) &&
>> +        !qemu_strtoui(content, &endptr, 0, &tmp) &&
>> +        (!endptr || *endptr == '\n')) {
>> +        if (tmp == 2) {
>> +            error_report("Skipping reservation of swap space is not supported: "
>> +                         " \"" OVERCOMMIT_MEMORY_PATH "\" is \"2\"");
>> +            return false;
>> +        }
>> +        return true;
>> +    }
>> +    /* this interface has been around since Linux 2.6 */
>> +    error_report("Skipping reservation of swap space is not supported: "
>> +                 " Could not read: \"" OVERCOMMIT_MEMORY_PATH "\"");
>> +    return false;
>> +#else
>> +    return true;
>> +#endif
>> +}
> 
> I feel like this helper wants to fail gracefully for some conditions.  Could
> you elaborate one example and attach to the commit log?

Sure. The case is "/proc/sys/vm/overcommit_memory == 2" (never overcommit)

MAP_NORESERVE is without effect and sparse memory regions are somewhat 
impossible.

> 
> I'm also wondering whether it would worth to check the global value.  Even if
> overcommit is globally disabled, do we (as an application process) need to care
> about it?  I think the MAP_NORESERVE would simply be silently ignored by the
> kernel and that seems to be design of it, otherwise would all apps who uses > MAP_NORESERVE would need to do similar things too?

Right, I want to catch the "gets silently ignored" part, because someone 
requested "reserved=off" (!default) but does not actually get what he 
asked for.

As one example, glibc manages heaps via:

a) Creating a new heap: mmap(PROT_NONE, MAP_NORESERVE) the maximum size, 
then mprotect(PROT_READ|PROT_WRITE) the initial heap size. Even if 
MAP_NORESERVE is ignored, only !PROT_NONE memory ever gets committed 
("reserve swap space") in Linux.

b) Growing the heap via mprotect(PROT_READ|PROT_WRITE) within the 
existing mmap. This will commit memory in case MAP_NORESERVE got ignored.

c) Shrinking the heap ("discard memory") via MADV_DONTNEED *unless* 
"/proc/sys/vm/overcommit_memory == 2" - the only way to undo 
mprotect(PROT_READ|PROT_WRITE) and to un-commit memory is by doing a 
mmap(PROT_NONE, MAP_FIXED) over the problematic region.

If you're interested, you can take a look at:

malloc/arena.c
sysdeps/unix/sysv/linux/malloc-sysdep.h:check_may_shrink_heap()


Thanks!

-- 
Thanks,

David / dhildenb


