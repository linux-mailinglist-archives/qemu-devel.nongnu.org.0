Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1101BFEF2
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 16:45:39 +0200 (CEST)
Received: from localhost ([::1]:44110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUARW-000682-66
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 10:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35280)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1jUAQ5-0004U4-B8
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 10:44:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1jUAQ4-0008A6-Ij
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 10:44:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53387
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1jUAQ4-00085X-3o
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 10:44:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588257846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=eA+k6+vAsTZasYOnLJglldWMpSTrMVlE7crlNvkt1dY=;
 b=jMxtW1AIeILDO2i0ogg5+g+Ub6TMD7mxXJMxZvkg27E8Rz9htBxrTMEgqKSrglzJSaqAQG
 Lb9YEMDFhGFSxjihV5L23qLLXsbGaADsjRvvip5w6LqCGohBr6h/seDSO0NIt93oC0O1Oc
 7m2fv9BitB7mPbB4omks0iL3l1hN5DY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-souUdeQ2NeqKir48Pp6c1A-1; Thu, 30 Apr 2020 10:44:01 -0400
X-MC-Unique: souUdeQ2NeqKir48Pp6c1A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A635C801503;
 Thu, 30 Apr 2020 14:43:59 +0000 (UTC)
Received: from [10.36.113.172] (ovpn-113-172.ams2.redhat.com [10.36.113.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4599A5EDE2;
 Thu, 30 Apr 2020 14:43:45 +0000 (UTC)
Subject: Re: [PATCH v4 00/13] migrate/ram: Fix resizing RAM blocks while
 migrating
To: qemu-devel@nongnu.org
References: <20200421085300.7734-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <99edb2b8-fa80-ed91-6947-eb6e4243de39@redhat.com>
Date: Thu, 30 Apr 2020 16:43:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421085300.7734-1-david@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=david@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 23:34:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paul Durrant <paul@xen.org>, Alex Williamson <alex.williamson@redhat.com>,
 Shannon Zhao <shannon.zhao@linaro.org>, Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.04.20 10:52, David Hildenbrand wrote:
> Basically a resend. Who's the lucky winner to pick this up for 5.1? :)
> 

Gentle ping, I have loads of patches in my backlog, and it does not seem
to get any shorter.

> ---
> 
> This is the follow up of
>     "[PATCH RFC] memory: Don't allow to resize RAM while migrating" [1]
> 
> This series contains some (slightly modified) patches also contained in:
>     "[PATCH v2 fixed 00/16] Ram blocks with resizable anonymous allocations
>      under POSIX" [2]
> That series will be based on this series. The last patch (#13) in this
> series could be moved to the other series, but I decided to include it in
> here for now (similar context).
> 
> I realized that resizing RAM blocks while the guest is being migrated
> (precopy: resize while still running on the source, postcopy: resize
>  while already running on the target) is buggy. In case of precopy, we
> can simply cancel migration. Postcopy handling is more involved. Resizing
> can currently happen during a guest reboot, triggered by ACPI rebuilds.
> 
> Along with the fixes, some cleanups.
> 
> [1] https://lkml.kernel.org/r/20200213172016.196609-1-david@redhat.com
> [2] https://lkml.kernel.org/r/20200212134254.11073-1-david@redhat.com
> 
> v3 -> v4:
> - Rebased and retested
> - Added RBs
> 
> v2 -> v3:
> - Rebased on current master
> - Added RBs
> - "migration/ram: Tolerate partially changed mappings in postcopy code"
> -- Extended the comment for the uffdio unregister part.
> 
> v1 -> v2:
> - "util: vfio-helpers: Factor out and fix processing of existing ram
>    blocks"
> -- Stringify error
> - "migraton/ram: Handle RAM block resizes during precopy"
> -- Simplified check if we're migrating on the source
> - "exec: Relax range check in ram_block_discard_range()"
> -- Added to make discard during resizes actually work
> - "migration/ram: Discard new RAM when growing RAM blocks after
>    ram_postcopy_incoming_init()"
> -- Better checks if in the right postcopy mode.
> -- Better patch subject/description/comments
> - "migration/ram: Handle RAM block resizes during postcopy"
> -- Better comments
> -- Adapt to changed postcopy checks
> - "migrate/ram: Get rid of "place_source" in ram_load_postcopy()"
> -- Dropped, as broken
> - "migration/ram: Tolerate partially changed mappings in postcopy code"
> -- Better comment / description. Clarify that no implicit wakeup will
>    happen
> -- Warn on EINVAL (older kernels)
> -- Wake up any waiter explicitly
> 
> David Hildenbrand (13):
>   util: vfio-helpers: Factor out and fix processing of existing ram
>     blocks
>   stubs/ram-block: Remove stubs that are no longer needed
>   numa: Teach ram block notifiers about resizeable ram blocks
>   numa: Make all callbacks of ram block notifiers optional
>   migration/ram: Handle RAM block resizes during precopy
>   exec: Relax range check in ram_block_discard_range()
>   migration/ram: Discard RAM when growing RAM blocks after
>     ram_postcopy_incoming_init()
>   migration/ram: Simplify host page handling in ram_load_postcopy()
>   migration/ram: Consolidate variable reset after placement in
>     ram_load_postcopy()
>   migration/ram: Handle RAM block resizes during postcopy
>   migration/multifd: Print used_length of memory block
>   migration/ram: Use offset_in_ramblock() in range checks
>   migration/ram: Tolerate partially changed mappings in postcopy code
> 
>  exec.c                     |  25 +++++--
>  hw/core/numa.c             |  41 +++++++++--
>  hw/i386/xen/xen-mapcache.c |   7 +-
>  include/exec/cpu-common.h  |   1 +
>  include/exec/memory.h      |  10 +--
>  include/exec/ramblock.h    |  10 +++
>  include/exec/ramlist.h     |  13 ++--
>  migration/migration.c      |   9 ++-
>  migration/migration.h      |   1 +
>  migration/multifd.c        |   2 +-
>  migration/postcopy-ram.c   |  54 +++++++++++++-
>  migration/ram.c            | 144 ++++++++++++++++++++++++++++---------
>  stubs/ram-block.c          |  20 ------
>  target/i386/hax-mem.c      |   5 +-
>  target/i386/sev.c          |  18 ++---
>  util/vfio-helpers.c        |  41 ++++-------
>  16 files changed, 283 insertions(+), 118 deletions(-)
> 


-- 
Thanks,

David / dhildenb


