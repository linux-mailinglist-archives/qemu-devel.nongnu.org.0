Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6375A9517
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 12:54:05 +0200 (CEST)
Received: from localhost ([::1]:52424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oThpj-000398-6P
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 06:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oThnD-0001j0-0j
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 06:51:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oThn8-00073j-Va
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 06:51:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662029481;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XEg2kebWDH3P9Aos6lhEJWmI4I4Pi0zofuKf8SfwHuQ=;
 b=glzSD7fycpSlBf7oBfCmoh28ixnLt8dMbRneeoLC9IWb9cyz6PUJrqSoYD8cAEYCU9BpIe
 LIvTs5Eoe908fKWn8evmp83CDlR2saljv684cwZV6XxaP1LHcV8XJr+FEcGpOySLAF3Bp3
 6xOdj2zY4VpTIz+F/IkCHuGEjFJKZxs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-5L3t_dOjOauHwJBck_NfwA-1; Thu, 01 Sep 2022 06:51:20 -0400
X-MC-Unique: 5L3t_dOjOauHwJBck_NfwA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 655553C11720;
 Thu,  1 Sep 2022 10:51:20 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CED89C15BC3;
 Thu,  1 Sep 2022 10:51:19 +0000 (UTC)
Date: Thu, 1 Sep 2022 11:51:16 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] qio: fix command spawn RDONLY/WRONLY
Message-ID: <YxCOpKg14gSvijX9@redhat.com>
References: <20220901101120.2741109-1-marcandre.lureau@redhat.com>
 <YxCJ/yh/V/92YZ9O@redhat.com>
 <CAJ+F1C+t59uYMPtaaxay1uZfxMu=J47LPKiYO1tnYL4oQBbwxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1C+t59uYMPtaaxay1uZfxMu=J47LPKiYO1tnYL4oQBbwxw@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 01, 2022 at 02:47:17PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Thu, Sep 1, 2022 at 2:32 PM Daniel P. Berrangé <berrange@redhat.com>
> wrote:
> 
> > On Thu, Sep 01, 2022 at 02:11:20PM +0400, marcandre.lureau@redhat.com
> > wrote:
> > > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> > >
> > > The in/out handling is inverted, although nothing seemed to notice that
> > yet.
> >
> > On the contrary, it is correct, and the unit tests validate this.
> >
> 
> > > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > > ---
> > >  io/channel-command.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/io/channel-command.c b/io/channel-command.c
> > > index 9f2f4a1793..ed17b44f74 100644
> > > --- a/io/channel-command.c
> > > +++ b/io/channel-command.c
> > > @@ -79,10 +79,10 @@ qio_channel_command_new_spawn(const char *const
> > argv[],
> > >      flags = flags & O_ACCMODE;
> > >
> > >      if (flags == O_RDONLY) {
> > > -        stdinnull = true;
> > > +        stdoutnull = true;
> > >      }
> > >      if (flags == O_WRONLY) {
> > > -        stdoutnull = true;
> > > +        stdinnull = true;
> > >      }
> >
> > This change breaks the unit tests.
> >
> >
> Does it really test it then? we are talking about test-io-channel-command ?
> It works before and after for me. Other tests as well.

Yes, it certainly fails for me:

$ ./build/tests/unit/test-io-channel-command -p /io/channel/command/fifo/sync
# random seed: R02S5134a426f643aeefdbe73921046b66da
# Start of io tests
# Start of channel tests
# Start of command tests
# Start of fifo tests
**
ERROR:../tests/unit/io-channel-helpers.c:152:qio_channel_test_validate: assertion failed: (test->readerr == NULL)
Bail out! ERROR:../tests/unit/io-channel-helpers.c:152:qio_channel_test_validate: assertion failed: (test->readerr == NULL)
Aborted (core dumped)

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


