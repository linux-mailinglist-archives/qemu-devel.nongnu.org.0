Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7426B372911
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:28:56 +0200 (CEST)
Received: from localhost ([::1]:53590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldsIR-0008Uh-Ha
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lds0g-0003n5-68
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:10:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lds0e-0007TX-4r
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:10:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620123031;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=wWf0xemB/j9F0y6QEWWJKy+0UNllXLsrvDT0x9z7U1I=;
 b=fg/3DMUFprYraC2HtDsbfB0WPf/4YEgvAVAsPRaQv047FQLgrSAkq1Ic8uOP2DUOT2K7Ay
 nsjCuvO60PQWghmEMltXlQBTKaAsUWO7BezOE7xloD/wXWf/GmXsBIVCr+8Y9Et7pfANHA
 YrrGXB6YqYAN1RfdSBF8zYmI/Ic10co=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-yv3QPmhAMFSQXhGhSUQxkg-1; Tue, 04 May 2021 06:10:25 -0400
X-MC-Unique: yv3QPmhAMFSQXhGhSUQxkg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BCEC8030D5;
 Tue,  4 May 2021 10:10:24 +0000 (UTC)
Received: from redhat.com (ovpn-113-37.ams2.redhat.com [10.36.113.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8263C1F051;
 Tue,  4 May 2021 10:10:01 +0000 (UTC)
Date: Tue, 4 May 2021 11:09:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v7 09/15] util/mmap-alloc: Support RAM_NORESERVE via
 MAP_NORESERVE under Linux
Message-ID: <YJEddjCsFgXa4tiR@redhat.com>
References: <20210428133754.10713-1-david@redhat.com>
 <20210428133754.10713-10-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210428133754.10713-10-david@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>, Nitesh Lal <nilal@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 28, 2021 at 03:37:48PM +0200, David Hildenbrand wrote:
> Let's support RAM_NORESERVE via MAP_NORESERVE on Linux. The flag has no
> effect on most shared mappings - except for hugetlbfs and anonymous memory.
> 
> Linux man page:
>   "MAP_NORESERVE: Do not reserve swap space for this mapping. When swap
>   space is reserved, one has the guarantee that it is possible to modify
>   the mapping. When swap space is not reserved one might get SIGSEGV
>   upon a write if no physical memory is available. See also the discussion
>   of the file /proc/sys/vm/overcommit_memory in proc(5). In kernels before
>   2.6, this flag had effect only for private writable mappings."
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
>   1) Without MAP_NORESERVE *or* with memory overcommit under Linux
>      disabled ("/proc/sys/vm/overcommit_memory == 2"), the following
>      accounting/reservation happens:
>       For a file backed map
>        SHARED or READ-only - 0 cost (the file is the map not swap)
>        PRIVATE WRITABLE - size of mapping per instance
> 
>       For an anonymous or /dev/zero map
>        SHARED   - size of mapping
>        PRIVATE READ-only - 0 cost (but of little use)
>        PRIVATE WRITABLE - size of mapping per instance
> 
>   2) With MAP_NORESERVE, no accounting/reservation happens.
> 
> b) Hugetlbfs:
> 
>   1) Without MAP_NORESERVE, huge pages are reserved.
> 
>   2) With MAP_NORESERVE, no huge pages are reserved.
> 
> Note: With "/proc/sys/vm/overcommit_memory == 0", we were already able
> to configure it for !hugetlbfs globally; this toggle now allows
> configuring it more fine-grained, not for the whole system.
> 
> The target use case is virtio-mem, which dynamically exposes memory
> inside a large, sparse memory area to the VM.

Can you explain this use case in more real world terms, as I'm not
understanding what a mgmt app would actually do with this in
practice ?




Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


