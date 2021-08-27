Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6943F9CC8
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 18:49:56 +0200 (CEST)
Received: from localhost ([::1]:51440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJf32-0000zN-NU
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 12:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mJf1g-0008Fn-S4
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 12:48:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mJf1d-0004VO-8Y
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 12:48:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630082895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KnhTNhcQ7muLX70pYQJXjUoVMfummg7FWfZ8CaWBJyE=;
 b=huFc7XZsdyzLz/lWd2yy3qnGeAN6wld6VMFVM01VuUdH4+DTFbDK/XK389L3gCD6fTphAv
 cfY8jNZ9H6DBvrDAbi5BW6NWZTFGnshwTga2WU1l+cJ+iUNCoonA9RTQ5gmDyebYE8gfNq
 eNjfig0mgF6/0iR/aJ++OOCHCHtm9P8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-Z9XIKUQcNSCgeQNv0r0jsQ-1; Fri, 27 Aug 2021 12:48:12 -0400
X-MC-Unique: Z9XIKUQcNSCgeQNv0r0jsQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 896CC1009600;
 Fri, 27 Aug 2021 16:48:11 +0000 (UTC)
Received: from localhost (unknown [10.39.192.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2158A5D6B1;
 Fri, 27 Aug 2021 16:48:10 +0000 (UTC)
Date: Fri, 27 Aug 2021 17:48:10 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH] nbd/server: Advertise MULTI_CONN for shared writable
 exports
Message-ID: <20210827164810.GO26415@redhat.com>
References: <20210827150916.532260-1-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210827150916.532260-1-eblake@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, nsoffer@redhat.com,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 27, 2021 at 10:09:16AM -0500, Eric Blake wrote:
> +# Parallel client connections are easier with libnbd than qemu-io:
> +if ! (nbdsh --version) >/dev/null 2>&1; then

I'm curious why the parentheses are needed here?

> +export nbd_unix_socket
> +nbdsh -c '
> +import os
> +sock = os.getenv("nbd_unix_socket")
> +h = []
> +
> +for i in range(3):
> +  h.append(nbd.NBD())
> +  h[i].connect_unix(sock)
> +  assert h[i].can_multi_conn()
> +
> +buf1 = h[0].pread(1024 * 1024, 0)
> +if buf1 != b"\x01" * 1024 * 1024:
> +  print("Unexpected initial read")
> +buf2 = b"\x03" * 1024 * 1024
> +h[1].pwrite(buf2, 0)                   #1
> +h[2].flush()
> +buf1 = h[0].pread(1024 * 1024, 0)
> +if buf1 == buf2:
> +  print("Flush appears to be consistent across connections")

The test is ... simple.

Would it be a better test if the statement at line #1 above was
h.aio_pwrite instead, so the operation is only started?  This would
depend on some assumptions inside libnbd: That the h[1] socket is
immediately writable and that libnbd's statement will write before
returning, which are likely to be true, but perhaps you could do
something with parsing libnbd debug statements to check that the state
machine has started the write.

Another idea would be to make the write at line #1 be very large, so
that perhaps the qemu block layer would split it up.  After the flush
you would read the beginning and end bytes of the written part to
approximate a check that the whole write has been flushed so parts of
it are not hanging around in the cache of the first connection.

Anyway the patch as written seems fine to me so:

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html


