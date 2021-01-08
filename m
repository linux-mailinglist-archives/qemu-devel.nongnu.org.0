Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF442EF13D
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 12:29:23 +0100 (CET)
Received: from localhost ([::1]:50180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxpxK-0005HV-Ei
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 06:29:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kxpvc-0004ar-VD
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 06:27:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kxpvZ-0008Mh-Co
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 06:27:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610105251;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=yQXRI+PDZvoZDy2eORhBJPXVSxP9olZn5ofe/0/08I0=;
 b=Tr+xJYSw2FSlrdBLqhDKJ6tDNObBgzLKP4kMVBwjKvzxzwZk9bf4wBRgRymgXEUCjZOEYy
 qG/C9XtIU+nyeRoEv+GaMOTSvSOgJeeJDiN2zckJjBxWrXu3UQzBSkE21l+BPdX93ruhsa
 XwhfnvptScvkVkRKP8fv/9sKx12hagU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-KrF0KkfnNSaLLJllk1BQdw-1; Fri, 08 Jan 2021 06:27:30 -0500
X-MC-Unique: KrF0KkfnNSaLLJllk1BQdw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 758F7800D53;
 Fri,  8 Jan 2021 11:27:28 +0000 (UTC)
Received: from redhat.com (ovpn-114-227.ams2.redhat.com [10.36.114.227])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 673B45B6A2;
 Fri,  8 Jan 2021 11:27:21 +0000 (UTC)
Date: Fri, 8 Jan 2021 11:27:17 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 4/4] block: introduce BDRV_MAX_LENGTH
Message-ID: <20210108112717.GH1082385@redhat.com>
References: <20201203222713.13507-1-vsementsov@virtuozzo.com>
 <20201203222713.13507-5-vsementsov@virtuozzo.com>
 <20210107095817.GA2673@redhat.com>
 <20210107105611.GB2673@redhat.com>
 <20210107122005.GC2673@redhat.com>
 <4dffd554-06cf-ff2d-f4c1-24feffd53283@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <4dffd554-06cf-ff2d-f4c1-24feffd53283@virtuozzo.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: fam@euphon.net, kwolf@redhat.com, berto@igalia.com, qemu-block@nongnu.org,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-devel@nongnu.org,
 stefanha@redhat.com, den@openvz.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 08, 2021 at 02:14:30PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 07.01.2021 15:20, Richard W.M. Jones wrote:
> > On Thu, Jan 07, 2021 at 10:56:12AM +0000, Richard W.M. Jones wrote:
> > > On Thu, Jan 07, 2021 at 09:58:17AM +0000, Richard W.M. Jones wrote:
> > > > On Fri, Dec 04, 2020 at 01:27:13AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > > > Finally to be safe with calculations, to not calculate different
> > > > > maximums for different nodes (depending on cluster size and
> > > > > request_alignment), let's simply set QEMU_ALIGN_DOWN(INT64_MAX, 2^30)
> > > > > as absolute maximum bytes length for Qemu. Actually, it's not much less
> > > > > than INT64_MAX.
> > > > 
> > > > > +/*
> > > > > + * We want allow aligning requests and disk length up to any 32bit alignment
> > > > > + * and don't afraid of overflow.
> > > > > + * To achieve it, and in the same time use some pretty number as maximum disk
> > > > > + * size, let's define maximum "length" (a limit for any offset/bytes request and
> > > > > + * for disk size) to be the greatest power of 2 less than INT64_MAX.
> > > > > + */
> > > > > +#define BDRV_MAX_ALIGNMENT (1L << 30)
> > > > > +#define BDRV_MAX_LENGTH (QEMU_ALIGN_DOWN(INT64_MAX, BDRV_MAX_ALIGNMENT))
> > > > 
> > > > This change broke nbdkit tests.
> > > 
> > > Actually that's not the only problem.  It appears that we're unable to
> > > read or write the last sector of this disk:
> > > 
> > > $ nbdkit memory $(( 2**63 - 2**30 )) --run 'build/qemu-io -r -f raw "$uri" -c "r -v $(( 2**63 - 2**30 - 512 )) 512" '
> > > read failed: Input/output error
> > > 
> > > $ nbdkit memory $(( 2**63 - 2**30 )) --run 'build/qemu-io -f raw "$uri" -c "w -P 3 $(( 2**63 - 2**30 - 512 )) 512" '
> > > write failed: Input/output error
> > > 
> > > You can play around with the constants.  I found it's possible to read
> > > and write the non-aligned 512 bytes starting at 2^63-2^30-513.  Could
> > > be a fencepost error somewhere in qemu?
> > 
> > Actually this is a pre-existing bug in qemu.
> > 
> > What happens is qemu-io calls qemu_strtosz("9223372035781033472")
> > which returns 0x7fffffffc0000000 and no error.  That answer is plain
> > flat out wrong.  The reason for that is qemu_strtosz uses floating
> > point for the calculation(!) so is limited to 53 bits of precision and
> > silently truncates.
> 
> Hmm.. Seems it wants to support floats, like 1.5G.. Don't seem to be very useful, but why not. I think we should call qemu_strtou64 first, and only if it fails or leaves '.', 'e' or 'E' (anything else?) as end character we should do all this floating point logic.

I'm not sure we actually care about the floating point exponent
syntax suffixes. The test suite doesn't cover that format, only
the plain fractional parts.

It should be possible to avoid floating point entirely if we just
split on "." and then use int64 arithmetic to scale the two parts
before recombining them. 


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


