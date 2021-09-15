Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA6040C25D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 11:05:54 +0200 (CEST)
Received: from localhost ([::1]:39214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQQrZ-0008Bv-65
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 05:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mQQmV-00063O-I8
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 05:00:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mQQmN-0001YU-VT
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 05:00:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631696431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ScQreEvlUnZODc+46+HapyUOFyzdcB6Hso9m98nJU0Q=;
 b=PJSzyMKbvz0/FHj+uthryXb5ptQxCS0yowX1JDHaTnOLf3GIcGJt7bKL0fho+tmYZNcB89
 /uzUXscZ88j6XFNWCXjwSRFEqcFzGmhCpDF0j67cnpxy+GF/lHWKGvIm2R7L7CZhfB8vo3
 OvWLjNV+CAxIKkt93HqrmJ7foFCuQDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-b7pEkshnOnSmaLuOB5ybAg-1; Wed, 15 Sep 2021 05:00:27 -0400
X-MC-Unique: b7pEkshnOnSmaLuOB5ybAg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFAC41B18BC5;
 Wed, 15 Sep 2021 09:00:26 +0000 (UTC)
Received: from localhost (unknown [10.39.192.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DC91100EBBE;
 Wed, 15 Sep 2021 09:00:25 +0000 (UTC)
Date: Wed, 15 Sep 2021 10:00:25 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2] nbd/server: Suppress Broken pipe errors on abrupt
 disconnection
Message-ID: <20210915090025.GP26415@redhat.com>
References: <20210913151936.392705-1-rjones@redhat.com>
 <6c59b070-b9b4-6ecb-8557-3ea54af3d45a@virtuozzo.com>
 <20210914145200.GJ26415@redhat.com>
 <997fe8b4-3610-2336-c7f3-67a0e2cbf34e@virtuozzo.com>
 <20210914163232.GN26415@redhat.com>
 <0bdef3d9-df05-f49d-038c-9930c2677f54@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <0bdef3d9-df05-f49d-038c-9930c2677f54@virtuozzo.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 15, 2021 at 10:15:20AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 14.09.2021 19:32, Richard W.M. Jones wrote:
> >On Tue, Sep 14, 2021 at 06:21:58PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> >>14.09.2021 17:52, Richard W.M. Jones wrote:
> >>>On the
> >>>server side when the server receives NBD_CMD_DISC it must complete any
> >>>in-flight requests, but there's no requirement for the server to
> >>>commit anything to disk.  IOW you can still lose data even though you
> >>>took the time to disconnect.
> >>>
> >>>So I don't think there's any reason for libnbd to always gracefully
> >>
> >>Hmm. Me go to NBD spec :)
> >>
> >>I think, there is a reason:
> >>
> >>"The client and the server MUST NOT initiate any form of disconnect other than in one of the above circumstances."
> >>
> >>And the only possibility for client to initiate a hard disconnect listed above is "if it detects a violation by the other party of a mandatory condition within this document".
> >>
> >>So at least, nbdsh violates NBD protocol. May be spec should be updated to satisfy your needs.
> >
> >I would say the spec is at best contradictory, but if you read other
> >parts of the spec, then it's pretty clear that we're allowed to drop
> >the connection whenever we like.  This section says as much:
> >
> >https://github.com/NetworkBlockDevice/nbd/blob/5805b25ad3da96e7c0b3160cda51ea19eb518d5b/doc/proto.md#terminating-the-transmission-phase
> 
> Hmm, that was exactly the section I read and quoted :)
> 
> >
> >   There are two methods of terminating the transmission phase:
> >   ...
> >   "The client or the server drops the TCP session (in which case it
> >   SHOULD shut down the TLS session first). This is referred to as
> >   'initiating a hard disconnect'."
> 
> Right. Here the method is defined, no word that client can do it at any time.

I don't read this as a definition.

But we should probably clarify the spec to note that dropping the
connection is fine, because it is - no one has made any argument so
far that there's an actual reason to waste time on NBD_CMD_DISC.

Rich.

> Next, in same section:
> 
>    Either side MAY initiate a hard disconnect if it detects a violation by the other party of a mandatory condition within this document.
> 
> Next
>    The client MAY issue a soft disconnect at any time
> 
> And finally:
> 
>    The client and the server MUST NOT initiate any form of disconnect other than in one of the above circumstances.
> 
> 
> Or do you mean some other spec section I missed?
> 
> >
> >Anyway we're dropping the TCP connection because sometimes we are just
> >interrogating an NBD server eg to find out what it supports, and doing
> >a graceful shutdown is a waste of time and internet.
> >
> >>>shut down (especially in this case where there are no in-flight
> >>>requests), and anyway it would break ABI to make that change and slow
> >>>down the client in cases when there's nothing to clean up.
> >>
> >>Which ABI will it break?
> >
> >Our contract with callers using nbd_close(3), if nbd_shutdown(3) is
> >not called beforehand.
> >https://libguestfs.org/nbd_shutdown.3.html
> >https://libguestfs.org/nbd_create.3.html (really nbd_close ...)
> >
> >Rich.
> >
> 
> 
> -- 
> Best regards,
> Vladimir

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-df lists disk usage of guests without needing to install any
software inside the virtual machine.  Supports Linux and Windows.
http://people.redhat.com/~rjones/virt-df/


