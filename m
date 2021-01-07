Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C97042ECF8B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 13:22:08 +0100 (CET)
Received: from localhost ([::1]:48868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxUIp-0003L7-TH
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 07:22:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1kxUHI-0002nD-AA
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 07:20:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1kxUH7-0003Wu-68
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 07:20:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610022018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4FxkCrAdiAK1rCKRY+7hROoddRWh9ES1di+1TeTTi9o=;
 b=IAqkgrv4BaI23xYUbJsVwJIUR4yR6oTEXN6K8Cbc2Q1GfAGombu3/Vx1YCpeBwXNyIAZ8c
 zTLUA/MB+PuFRLLoVQKBLy++g1f8VTNg6Slk4FbVIH3zjR9ol9p0jbxw6DTMC6uYXu5PI7
 3/r/Mz7ofLfiVxO2u301n2gVCj44S2s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-rgbxWY80MEqrhCCYut-QIg-1; Thu, 07 Jan 2021 07:20:13 -0500
X-MC-Unique: rgbxWY80MEqrhCCYut-QIg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 281D71800D42;
 Thu,  7 Jan 2021 12:20:12 +0000 (UTC)
Received: from localhost (ovpn-114-98.ams2.redhat.com [10.36.114.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E60A119C93;
 Thu,  7 Jan 2021 12:20:05 +0000 (UTC)
Date: Thu, 7 Jan 2021 12:20:05 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 4/4] block: introduce BDRV_MAX_LENGTH
Message-ID: <20210107122005.GC2673@redhat.com>
References: <20201203222713.13507-1-vsementsov@virtuozzo.com>
 <20201203222713.13507-5-vsementsov@virtuozzo.com>
 <20210107095817.GA2673@redhat.com>
 <20210107105611.GB2673@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210107105611.GB2673@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 qemu-devel@nongnu.org, mreitz@redhat.com, berrange@redhat.com,
 stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 07, 2021 at 10:56:12AM +0000, Richard W.M. Jones wrote:
> On Thu, Jan 07, 2021 at 09:58:17AM +0000, Richard W.M. Jones wrote:
> > On Fri, Dec 04, 2020 at 01:27:13AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > Finally to be safe with calculations, to not calculate different
> > > maximums for different nodes (depending on cluster size and
> > > request_alignment), let's simply set QEMU_ALIGN_DOWN(INT64_MAX, 2^30)
> > > as absolute maximum bytes length for Qemu. Actually, it's not much less
> > > than INT64_MAX.
> > 
> > > +/*
> > > + * We want allow aligning requests and disk length up to any 32bit alignment
> > > + * and don't afraid of overflow.
> > > + * To achieve it, and in the same time use some pretty number as maximum disk
> > > + * size, let's define maximum "length" (a limit for any offset/bytes request and
> > > + * for disk size) to be the greatest power of 2 less than INT64_MAX.
> > > + */
> > > +#define BDRV_MAX_ALIGNMENT (1L << 30)
> > > +#define BDRV_MAX_LENGTH (QEMU_ALIGN_DOWN(INT64_MAX, BDRV_MAX_ALIGNMENT))
> > 
> > This change broke nbdkit tests.
> 
> Actually that's not the only problem.  It appears that we're unable to
> read or write the last sector of this disk:
> 
> $ nbdkit memory $(( 2**63 - 2**30 )) --run 'build/qemu-io -r -f raw "$uri" -c "r -v $(( 2**63 - 2**30 - 512 )) 512" ' 
> read failed: Input/output error
> 
> $ nbdkit memory $(( 2**63 - 2**30 )) --run 'build/qemu-io -f raw "$uri" -c "w -P 3 $(( 2**63 - 2**30 - 512 )) 512" ' 
> write failed: Input/output error
> 
> You can play around with the constants.  I found it's possible to read
> and write the non-aligned 512 bytes starting at 2^63-2^30-513.  Could
> be a fencepost error somewhere in qemu?

Actually this is a pre-existing bug in qemu.

What happens is qemu-io calls qemu_strtosz("9223372035781033472")
which returns 0x7fffffffc0000000 and no error.  That answer is plain
flat out wrong.  The reason for that is qemu_strtosz uses floating
point for the calculation(!) so is limited to 53 bits of precision and
silently truncates.

It happened we were just lucky that our earlier test with
2^63 - 1024 worked.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org


