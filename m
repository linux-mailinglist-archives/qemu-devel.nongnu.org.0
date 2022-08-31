Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 810815A8012
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 16:24:38 +0200 (CEST)
Received: from localhost ([::1]:60572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTOdw-00081A-Pf
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 10:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oTOZf-0004lf-Pf
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 10:20:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oTOZb-0007Sz-Rd
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 10:20:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661955601;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5yH/p7Bq62ARuiBFz9DKEjkU+KjkD+23YBYo+NacLaA=;
 b=XgfzWiZdlPR8iJrG8xnqVKGg4FRb92WXcDwT1eKmA17A7WLKORY7LfHo3pdg2rY02noYgU
 qbapLa3p6hJqOoGb3OTHkVD5Mm2nPNyQXx4LGXmoSQ2/qxCsVMxRHw2M0aKS8AhFe2smFt
 SRoVL1LFyt9J9uezK2zG4Dcj3BTKhJ8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-Vc_JczO9O8anCuC1Asieuw-1; Wed, 31 Aug 2022 10:19:59 -0400
X-MC-Unique: Vc_JczO9O8anCuC1Asieuw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 406448037AF;
 Wed, 31 Aug 2022 14:19:59 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C72472026D4C;
 Wed, 31 Aug 2022 14:19:57 +0000 (UTC)
Date: Wed, 31 Aug 2022 15:19:55 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: Thomas Huth <thuth@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 27/51] tests/qtest: Use send/recv for socket communication
Message-ID: <Yw9uC+pkJcfxyYxG@redhat.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-28-bmeng.cn@gmail.com>
 <dbb7f0fd-22e6-a5e0-88ce-5810290170ce@redhat.com>
 <CAEUhbmVmyT7ETTJdJH=UzZyf5_PaA8QMfsc=0rjJKK+8RHeztw@mail.gmail.com>
 <91c5a3b9-555e-51d4-1daa-9a4692ea437a@redhat.com>
 <CAJ+F1CJNt1d2uymwy-ONdAbqWd+MGMvw46B3VOTPPhd8FrVJMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CJNt1d2uymwy-ONdAbqWd+MGMvw46B3VOTPPhd8FrVJMw@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 31, 2022 at 06:05:51PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Fri, Aug 26, 2022 at 10:27 PM Thomas Huth <thuth@redhat.com> wrote:
> 
> > On 26/08/2022 16.59, Bin Meng wrote:
> > > On Thu, Aug 25, 2022 at 9:04 PM Thomas Huth <thuth@redhat.com> wrote:
> > >>
> > >> On 24/08/2022 11.40, Bin Meng wrote:
> > >>> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > >>>
> > >>> Socket communication in the libqtest and libqmp codes uses read()
> > >>> and write() which work on any file descriptor on *nix, and sockets
> > >>> in *nix are an example of a file descriptor.
> > >>>
> > >>> However sockets on Windows do not use *nix-style file descriptors,
> > >>> so read() and write() cannot be used on sockets on Windows.
> > >>> Switch over to use send() and recv() instead which work on both
> > >>> Windows and *nix.
> > >>>
> > >>> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > >>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > >>> ---
> > >>>
> > >>>    tests/qtest/libqmp.c   | 4 ++--
> > >>>    tests/qtest/libqtest.c | 4 ++--
> > >>>    2 files changed, 4 insertions(+), 4 deletions(-)
> > >>>
> > >>> diff --git a/tests/qtest/libqmp.c b/tests/qtest/libqmp.c
> > >>> index ade26c15f0..995a39c1f8 100644
> > >>> --- a/tests/qtest/libqmp.c
> > >>> +++ b/tests/qtest/libqmp.c
> > >>> @@ -36,7 +36,7 @@ typedef struct {
> > >>>
> > >>>    static void socket_send(int fd, const char *buf, size_t size)
> > >>>    {
> > >>> -    size_t res = qemu_write_full(fd, buf, size);
> > >>> +    ssize_t res = send(fd, buf, size, 0);
> > >>
> > >> This way we're losing the extra logic from qemu_write_full() here (i.e.
> > the
> > >> looping and EINTR handling) ... not sure whether that's really OK?
> > Maybe you
> > >> have to introduce a qemu_send_full() first?
> > >>
> > >
> > > I am not sure if qemu_send_full() is really needed because there is an
> > > assert() right after the send() call.
> >
> > That's just a sanity check ... I think this function still has to take
> > care
> > of EINTR - it originally looked like this:
> >
> >   https://git.qemu.org/?p=qemu.git;a=commitdiff;h=c3e5704af19ac6
> >
> > ... and you can also see the while loop there.
> >
> >
> Agree, that would be the correct thing to do.
> 
> Fwiw, the SOCKET vs fd situation is giving me some nervous feelings,
> sometimes.
> 
> For ex, as I checked recently, it seems close(fd) correctly closes the
> underlying SOCKET - as if closesocket() was called on it.. but this is not
> really documented.
> 
> And it's easy to mix fd vs SOCKET in QEMU code paths (we cast/map SOCKET to
> "int fd" in general), and reach a close() on a SOCKET. That wouldn't be
> valid, and would likely create leaks or other issues.
> 
> Maybe we should introduce a type for safety / documentation purposes...

We already have QIOChannel APIs, the problem here is that libtest is still
using low level sockets APIs and needs converting to the high level APIs
instead.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


