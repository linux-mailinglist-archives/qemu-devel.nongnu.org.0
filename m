Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CB83FC828
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:24:10 +0200 (CEST)
Received: from localhost ([::1]:40328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL3kH-00088j-QE
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mL3Ya-00061r-RT
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 09:12:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mL3YP-0001nl-2p
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 09:12:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630415512;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z0xZ4ztJr6t9GUkKyFcg1x6Kn0Zur+X5Qn0jJu79sa4=;
 b=MPHZ67maxLeYb13CAPS3xpiQH7ozGuesAyhb/wG3LjJxc2pHj6i7Vbb+Yglw01xdRf8iw3
 6zFOf8K911hJUr5zl9pMIRF7OZ32B1YGTgl4+7KrYOTKgtZ1G228O6FxsPB4mBzhH8Vzrv
 pjilDhTNtSVm2W99zXVo3bxznrJXOwI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-cTwNv_4cNViO9Gl6Jq9XOg-1; Tue, 31 Aug 2021 09:11:44 -0400
X-MC-Unique: cTwNv_4cNViO9Gl6Jq9XOg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6D3C101C8AB;
 Tue, 31 Aug 2021 13:11:43 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 77A8179582;
 Tue, 31 Aug 2021 13:11:42 +0000 (UTC)
Date: Tue, 31 Aug 2021 14:11:39 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: qemu-sockets: account for trailing \0 byte in unix socket pathname
Message-ID: <YS4qiyTNdMuJOkM1@redhat.com>
References: <20210830225449.1509719-1-mjt@msgid.tls.msk.ru>
 <CAJ+F1CLXQmwD2u-a4tLeSkCj6hgM-mUSD8bGHqmgXCrAuQ-+WA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CLXQmwD2u-a4tLeSkCj6hgM-mUSD8bGHqmgXCrAuQ-+WA@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>, QEMU <qemu-devel@nongnu.org>,
 qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 31, 2021 at 04:32:36PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Tue, Aug 31, 2021 at 3:00 AM Michael Tokarev <mjt@tls.msk.ru> wrote:
> 
> > Linux kernel can return size of af_unix socket to be
> > one byte larger than sockaddr_un structure - adding
> > the trailing zero byte.
> >
> > Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> > Fixes: 4cfd970ec188558daa6214f26203fe553fb1e01f (first in 6.1.0)
> > Cc: qemu-stable@nongnu.org
> >
> > diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> > index f2f3676d1f..83926dc2bc 100644
> > --- a/util/qemu-sockets.c
> > +++ b/util/qemu-sockets.c
> > @@ -1345,8 +1345,9 @@ socket_sockaddr_to_address_unix(struct
> > sockaddr_storage *sa,
> >      SocketAddress *addr;
> >      struct sockaddr_un *su = (struct sockaddr_un *)sa;
> >
> > +    /* kernel might have added \0 terminator to non-abstract socket */
> >      assert(salen >= sizeof(su->sun_family) + 1 &&
> > -           salen <= sizeof(struct sockaddr_un));
> > +           salen <= sizeof(struct sockaddr_un) + su->sun_path[0] ? 1 : 0);
> >
> >
> Looks right, but we may want to drop the upper bound check altogether. I
> thought the path must always fit the sockaddr_un, but since that's not the
> case it's only harmful here.

Yeah, I don't think either old or new code are good here. The assert
is validating Linux semantics here, other platforms don't add the
extra NUL

Also later in the same method the string copy is dubious too:

    addr->u.q_unix.path = g_strndup(su->sun_path, sizeof(su->sun_path));

The man page says that to take account of non-portable semantics
wrt trailing NULs, the path length should be calculated using:

     strnlen(addr.sun_path, salen - offsetof(sockaddr_un, sun_path))


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


