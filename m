Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3702ECD68
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 11:00:16 +0100 (CET)
Received: from localhost ([::1]:51290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxS5X-0008Dv-2O
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 05:00:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1kxS3v-0007iD-0z
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 04:58:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1kxS3r-0003jn-Hu
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 04:58:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610013508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aEU5MZcMQhymtuikXuLy9TJeQJ18+FbBlbhpoPJd/2k=;
 b=dFW+61gBE1Jq+3kcUMApJSvku1juhb5EJK+Auosdj+vw2FgUae7ltGp3WcMuDD9QixQfkc
 S1AVkEPCSr7kMbhxaZjol/A1Hsxml6I3D9LNZfnGugkA6fmPunG5A9CG7mJFSHxKDSxzOc
 VtWIPo08Zc+ZPUt/FCEv7zSW5Ye7A1w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-um7aYS99PrOs8FqlQnKnjg-1; Thu, 07 Jan 2021 04:58:24 -0500
X-MC-Unique: um7aYS99PrOs8FqlQnKnjg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 626C4803623;
 Thu,  7 Jan 2021 09:58:22 +0000 (UTC)
Received: from localhost (ovpn-114-98.ams2.redhat.com [10.36.114.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 772831346D;
 Thu,  7 Jan 2021 09:58:18 +0000 (UTC)
Date: Thu, 7 Jan 2021 09:58:17 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 4/4] block: introduce BDRV_MAX_LENGTH
Message-ID: <20210107095817.GA2673@redhat.com>
References: <20201203222713.13507-1-vsementsov@virtuozzo.com>
 <20201203222713.13507-5-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201203222713.13507-5-vsementsov@virtuozzo.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, berto@igalia.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 04, 2020 at 01:27:13AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Finally to be safe with calculations, to not calculate different
> maximums for different nodes (depending on cluster size and
> request_alignment), let's simply set QEMU_ALIGN_DOWN(INT64_MAX, 2^30)
> as absolute maximum bytes length for Qemu. Actually, it's not much less
> than INT64_MAX.

> +/*
> + * We want allow aligning requests and disk length up to any 32bit alignment
> + * and don't afraid of overflow.
> + * To achieve it, and in the same time use some pretty number as maximum disk
> + * size, let's define maximum "length" (a limit for any offset/bytes request and
> + * for disk size) to be the greatest power of 2 less than INT64_MAX.
> + */
> +#define BDRV_MAX_ALIGNMENT (1L << 30)
> +#define BDRV_MAX_LENGTH (QEMU_ALIGN_DOWN(INT64_MAX, BDRV_MAX_ALIGNMENT))

This change broke nbdkit tests.

We test that qemu can handle a qemu NBD export of size 2^63 - 512, the
largest size that (experimentally) we found qemu could safely handle.
eg:

  https://github.com/libguestfs/nbdkit/blob/master/tests/test-memory-largest-for-qemu.sh

Before this commit:

  $ nbdkit memory $(( 2**63 - 512 )) --run './qemu-img info "$uri"'
  image: nbd://localhost:10809
  file format: raw
  virtual size: 8 EiB (9223372036854775296 bytes)
  disk size: unavailable

After this commit:

  $ nbdkit memory $(( 2**63 - 512 )) --run './qemu-img info "$uri"'
  qemu-img: Could not open 'nbd://localhost:10809': Could not refresh total sector count: File too large

Can I confirm that this limit is now the new official one and we
should adjust nbdkit tests?  Or was this change unintentional given
that qemu seemed happy to handle 2^63 - 512 disks before?

Note that nbdkit & libnbd support up to 2^63 - 1 bytes (we are not
limited to whole sectors).  Also the Linux kernel will let you create
a /dev/nbdX device of size 2^63 - 1.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org


