Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 799CA50B3A0
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 11:10:47 +0200 (CEST)
Received: from localhost ([::1]:42144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhpJO-0008QT-Jc
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 05:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhp2D-000274-TP
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:53:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhp2A-00005N-5S
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:52:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650617577;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=3ysMBGy6Csvevk4H3HPtm3hH0qg9itYTNuiElea135g=;
 b=can5KQyUlzSdKGRkKKmbCoaqnoTstAfibYfulauMcXKULZttMPytZHsoWbrDGYxP2NgtyE
 EdOENsKdN1w9+EF029Q5w+3JI6swT/RCkYnzNPxAnPo6wvjaeT19cNoZniZA3p5+4u/PBi
 ZIOzeYgRsLkPNx0gO8HWubnSCWbRVYE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-PLKwYaGDNoa8ZGGjvp8QBA-1; Fri, 22 Apr 2022 04:52:51 -0400
X-MC-Unique: PLKwYaGDNoa8ZGGjvp8QBA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01141185A7BA;
 Fri, 22 Apr 2022 08:52:51 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 512119D7E;
 Fri, 22 Apr 2022 08:52:49 +0000 (UTC)
Date: Fri, 22 Apr 2022 09:52:46 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH v4] Use io_uring_register_ring_fd() to skip fd operations
Message-ID: <YmJs3gzZ9S1+cPmD@redhat.com>
References: <20220421163648.4205-1-faithilikerun@gmail.com>
 <20220422083428.GA61339@fam-dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220422083428.GA61339@fam-dell>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Sam Li <faithilikerun@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>, Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 22, 2022 at 09:34:28AM +0100, Fam Zheng wrote:
> On 2022-04-22 00:36, Sam Li wrote:
> > Linux recently added a new io_uring(7) optimization API that QEMU
> > doesn't take advantage of yet. The liburing library that QEMU uses
> > has added a corresponding new API calling io_uring_register_ring_fd().
> > When this API is called after creating the ring, the io_uring_submit()
> > library function passes a flag to the io_uring_enter(2) syscall
> > allowing it to skip the ring file descriptor fdget()/fdput()
> > operations. This saves some CPU cycles.
> > 
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > ---
> >  block/io_uring.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/block/io_uring.c b/block/io_uring.c
> > index 782afdb433..5247fb79e2 100644
> > --- a/block/io_uring.c
> > +++ b/block/io_uring.c
> > @@ -435,8 +435,16 @@ LuringState *luring_init(Error **errp)
> >      }
> >  
> >      ioq_init(&s->io_q);
> > -    return s;
> > +    if (io_uring_register_ring_fd(&s->ring) < 0) {
> > +        /*
> > +         * Only warn about this error: we will fallback to the non-optimized
> > +         * io_uring operations.
> > +         */
> > +        error_reportf_err(*errp,
> > +                         "failed to register linux io_uring ring file descriptor");
> 
> IIUC errp can be NULL, so let's not dereference it without checking. So, just
> use error_report?

Plenty of people will be running kernels that lack the new feature,
so this "failure" will be an expected scenario. We shouldn't be
spamming the logs with any error or warning message. Assuming  QEMU
remains fully functional, merely not as optimized, we should be
totally silent.

At most stick in a 'trace' point so we can record whether the
optimization is present.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


