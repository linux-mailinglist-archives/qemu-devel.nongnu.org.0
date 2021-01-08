Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 460662EF10A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 12:04:00 +0100 (CET)
Received: from localhost ([::1]:37498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxpYk-0005xh-UB
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 06:03:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1kxpXn-0005To-Bu
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 06:02:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1kxpXi-0004QK-Kg
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 06:02:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610103772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5s/JZx9E41odL82ibf6tqfWXXQzdQKGljqJ5J4GDEz8=;
 b=Rhyp4VKJVvlcI0MsHZNHiFZTwfcDRKM0CeQyYNdRHsBabf8U+S86XQb5bOhUm/+I1gm3RY
 zO+JEv17KSoTcKVHMEHuLwpncBlUI1G8nkRT7cCJBL4n50SWKgQwzOzfmKE0dd/qGAULQ8
 GXGBErYRgXspcolaIKxdnzB2e7UZabM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-YbGPIh43P0ma8-4DVDecHg-1; Fri, 08 Jan 2021 06:02:49 -0500
X-MC-Unique: YbGPIh43P0ma8-4DVDecHg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3362015725;
 Fri,  8 Jan 2021 11:02:48 +0000 (UTC)
Received: from localhost (ovpn-114-98.ams2.redhat.com [10.36.114.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62FA25B6A7;
 Fri,  8 Jan 2021 11:02:42 +0000 (UTC)
Date: Fri, 8 Jan 2021 11:02:41 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 4/4] block: introduce BDRV_MAX_LENGTH
Message-ID: <20210108110241.GF30079@redhat.com>
References: <20201203222713.13507-1-vsementsov@virtuozzo.com>
 <20201203222713.13507-5-vsementsov@virtuozzo.com>
 <20210107095817.GA2673@redhat.com>
 <d3413d86-845e-ec9f-83b7-75c0720c1656@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <d3413d86-845e-ec9f-83b7-75c0720c1656@virtuozzo.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, berto@igalia.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 08, 2021 at 01:51:35PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 07.01.2021 12:58, Richard W.M. Jones wrote:
> >On Fri, Dec 04, 2020 at 01:27:13AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> >>Finally to be safe with calculations, to not calculate different
> >>maximums for different nodes (depending on cluster size and
> >>request_alignment), let's simply set QEMU_ALIGN_DOWN(INT64_MAX, 2^30)
> >>as absolute maximum bytes length for Qemu. Actually, it's not much less
> >>than INT64_MAX.
> >
> >>+/*
> >>+ * We want allow aligning requests and disk length up to any 32bit alignment
> >>+ * and don't afraid of overflow.
> >>+ * To achieve it, and in the same time use some pretty number as maximum disk
> >>+ * size, let's define maximum "length" (a limit for any offset/bytes request and
> >>+ * for disk size) to be the greatest power of 2 less than INT64_MAX.
> >>+ */
> >>+#define BDRV_MAX_ALIGNMENT (1L << 30)
> >>+#define BDRV_MAX_LENGTH (QEMU_ALIGN_DOWN(INT64_MAX, BDRV_MAX_ALIGNMENT))
> >
> >This change broke nbdkit tests.
> >
> >We test that qemu can handle a qemu NBD export of size 2^63 - 512, the
> >largest size that (experimentally) we found qemu could safely handle.
> >eg:
> >
> >   https://github.com/libguestfs/nbdkit/blob/master/tests/test-memory-largest-for-qemu.sh
> >
> >Before this commit:
> >
> >   $ nbdkit memory $(( 2**63 - 512 )) --run './qemu-img info "$uri"'
> >   image: nbd://localhost:10809
> >   file format: raw
> >   virtual size: 8 EiB (9223372036854775296 bytes)
> >   disk size: unavailable
> >
> >After this commit:
> >
> >   $ nbdkit memory $(( 2**63 - 512 )) --run './qemu-img info "$uri"'
> >   qemu-img: Could not open 'nbd://localhost:10809': Could not refresh total sector count: File too large
> >
> >Can I confirm that this limit is now the new official one and we
> >should adjust nbdkit tests?  Or was this change unintentional given
> >that qemu seemed happy to handle 2^63 - 512 disks before?
> >
> >Note that nbdkit & libnbd support up to 2^63 - 1 bytes (we are not
> >limited to whole sectors).  Also the Linux kernel will let you create
> >a /dev/nbdX device of size 2^63 - 1.
> >
> 
> Hi Rich! The change is intentional.
>
> I think the benefit of having clean limit, allowing us to align up
> bytes to some alignment (which is a common operation) exceeds the
> loss of 1G at the end of 2**63 range. We get simpler and safer
> code. And anyway, new limit is not much worse than 2**63.

That's fine, as long as we settle on this.  I've updated the nbdkit tests:

https://github.com/libguestfs/nbdkit/commit/c3ec8c951e39a0f921252c162c236f23c588d2bd

> If at some
> point we have a problem with it being too restrictive, it's than
> very likely that 2**63 would be too small as well, which will
> require so much work that our a bit more restrictive limit is
> unlikely to increase the difficulty.

The next step is definitely working on 128 bit offsets!
https://rwmj.wordpress.com/2011/10/03/when-will-disk-sizes-go-beyond-64-bits/

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-df lists disk usage of guests without needing to install any
software inside the virtual machine.  Supports Linux and Windows.
http://people.redhat.com/~rjones/virt-df/


