Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB184CDD50
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 20:28:21 +0100 (CET)
Received: from localhost ([::1]:37834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQDbA-0004UT-Ii
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 14:28:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDTD-0008RY-8k
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:20:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDT9-0003wL-Ug
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:20:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646421603;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5W+tuq0fUqUdnl/2IEnEa1IAqD8jcMxrB5i9UOQLm9E=;
 b=WnBbV4y3gbtsB3nRMK6ZrnpWHSl10pXhhbzr0Grk+CHkI8WMuHBeHk1MVGo+nRgiR5EHGR
 5CYqsxis/JaQDFGR0fwfL5DvPq6wK3oF4TOJJNmMYyHEv3W3YH83Tqem0omfIlP7XpOhWL
 miktwwFkbF3aig5MpEUKyxMkmkJ/9qs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-5JOA9gaCPoe0AZ9gagI-TA-1; Fri, 04 Mar 2022 14:20:01 -0500
X-MC-Unique: 5JOA9gaCPoe0AZ9gagI-TA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 476D01006AA7;
 Fri,  4 Mar 2022 19:20:00 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DAF219700;
 Fri,  4 Mar 2022 19:19:58 +0000 (UTC)
Date: Fri, 4 Mar 2022 19:19:55 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 02/12] block: pass desired TLS hostname through from
 block driver client
Message-ID: <YiJmW4+c+Iv8JUIZ@redhat.com>
References: <20220303160330.2979753-1-berrange@redhat.com>
 <20220303160330.2979753-3-berrange@redhat.com>
 <20220303201434.gioet2wepccja7ag@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220303201434.gioet2wepccja7ag@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 03, 2022 at 02:14:34PM -0600, Eric Blake wrote:
> On Thu, Mar 03, 2022 at 04:03:20PM +0000, Daniel P. Berrangé wrote:
> > In
> > 
> >   commit a71d597b989fd701b923f09b3c20ac4fcaa55e81
> >   Author: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> >   Date:   Thu Jun 10 13:08:00 2021 +0300
> > 
> >     block/nbd: reuse nbd_co_do_establish_connection() in nbd_open()
> > 
> > the use of the 'hostname' field from the BDRVNBDState struct was
> > lost, and 'nbd_connect' just hardcoded it to match the IP socket
> > address. This was a harmless bug at the time since we block use
> > with anything other than IP sockets.
> > 
> > Shortly though, We want to allow the caller to override the hostname
> 
> s/We/we/
> 
> > used in the TLS certificate checks. This is to allow for TLS
> > when doing port forwarding or tunneling. Thus we need to reinstate
> > the passing along of the 'hostname'.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  block/nbd.c             |  7 ++++---
> >  include/block/nbd.h     |  3 ++-
> >  nbd/client-connection.c | 12 +++++++++---
> >  3 files changed, 15 insertions(+), 7 deletions(-)
> 
> Nice - this a great step towards fixing a longstanding annoyance of
> mine that libnbd and nbdkit support TLS over Unix sockets, but qemu
> didn't.


> > diff --git a/include/block/nbd.h b/include/block/nbd.h
> > index 78d101b774..a98eb665da 100644
> > --- a/include/block/nbd.h
> > +++ b/include/block/nbd.h
> > @@ -415,7 +415,8 @@ NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
> >                                                 bool do_negotiation,
> >                                                 const char *export_name,
> >                                                 const char *x_dirty_bitmap,
> > -                                               QCryptoTLSCreds *tlscreds);
> > +                                               QCryptoTLSCreds *tlscreds,
> > +                                               const char *tlshostname);
> 
> We already have a lot of parameters; does it make sense to bundle
> tlshostname into the QCryptoTLSCreds struct at all?  But that would
> change the QAPI (or maybe you do it later in the series), it is not a
> show-stopper to this patch.

The credentials object is something that can be used for multiple
connections. The TLS hostname override meanwhile is specific to
a single connection. Thus it would not be appropriate to store the
TLS hostname in the credentials struct.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


