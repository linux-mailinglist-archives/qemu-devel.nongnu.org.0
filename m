Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B76624193
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 12:38:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot5sl-00006W-Ed; Thu, 10 Nov 2022 06:38:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ot5sh-0008VS-J6
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 06:38:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ot5sX-0000K8-U4
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 06:38:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668080270;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=gY2R1eaUkPECsDEhZ/IfTGxXUCKHMwFwqigIXS2kalE=;
 b=HJ4ctBtLM1U8cs/IAQbRkcu4iIWFVP1yQDYBsRiqKJdGiVU29hh9gy7398cUtDlhvYNYCg
 +pNGIKZdv4wfUagP4uTmcT9jEDF+XC7lXwEIZx2HbSRRwTu9mCXdBcByfceriwjlEzJnsE
 8l7ppatc1j2/vOl3m3uIyWrXEBg8chI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-OdaLlH64POOCDfbA8qiMEg-1; Thu, 10 Nov 2022 06:37:48 -0500
X-MC-Unique: OdaLlH64POOCDfbA8qiMEg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 565238001B8
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 11:37:48 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26D1A202903F;
 Thu, 10 Nov 2022 11:37:47 +0000 (UTC)
Date: Thu, 10 Nov 2022 11:37:44 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] net: stream: add a new option to automatically reconnect
Message-ID: <Y2ziiGtM/EeS4lij@redhat.com>
References: <20221110073400.968475-1-lvivier@redhat.com>
 <87v8nnhx5e.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87v8nnhx5e.fsf@pond.sub.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Nov 10, 2022 at 12:22:21PM +0100, Markus Armbruster wrote:
> Laurent Vivier <lvivier@redhat.com> writes:
> 
> > In stream mode, if the server shuts down there is currently
> > no way to reconnect the client to a new server without removing
> > the NIC device and the netdev backend (or to reboot).
> >
> > This patch introduces a reconnect option that specifies a delay
> > to try to reconnect with the same parameters.
> >
> > Add a new test in qtest to test the reconnect option and the
> > connect/disconnect events.
> >
> > Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> > ---
> 
> [...]
> 
> > diff --git a/qapi/net.json b/qapi/net.json
> > index 522ac582edeb..5b72c936b3ac 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -585,6 +585,9 @@
> >  # @addr: socket address to listen on (server=true)
> >  #        or connect to (server=false)
> >  # @server: create server socket (default: false)
> > +# @reconnect: For a client socket, if a socket is disconnected,
> > +#             then attempt a reconnect after the given number of seconds.
> > +#             Setting this to zero disables this function. (default: 0)
> 
> Double-checking: it attempts to reconnect *once*.  Correct?

Repeatedly.

IIUC, this doesn't just try to reconnect a failed connection, it'll
reconnect the initial connection if the server doesn't listen when
QEMU first startup.

> Are we sure multiples of seconds will be fine?

FWIW, this text & behaviour (AFAICT) is identical to the same named
option against ChardevSocket, which is good for consistency.

Since the reconnect is continuous until connected, you don't
want too frequent reconnects otherwise it'll burn CPU time.

That said, if it wasn't for the pre-existing chardev option,
I would have suggested milliseconds be worth considering as
units. Arguably it should probaby have an increasing backoff.

We could achieve that without changing semantics in a way that
would matter to apps, by declaring that 'reconnect' is the
maximum reconnect time. So start a reconnect at 50ms, 100ms,
200ms, 500ms, 1s, .... $reconnect

IOW, I think its okey to set reconnect units to seconds, and
we have the option to retrofit the fast start + backwoff
later.

> "For a client socket": what happens for a server socket?


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


