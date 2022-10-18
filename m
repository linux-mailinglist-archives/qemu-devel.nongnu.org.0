Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9446031A0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 19:32:55 +0200 (CEST)
Received: from localhost ([::1]:58544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okqSU-0004ow-D6
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 13:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1okqAt-0001x6-Mu
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 13:14:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1okqAX-0008WN-CP
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 13:14:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666113254;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=emOOrveM+e836bL7MvDUs5FX4+Q8g/v5Pu4XnB1ELU0=;
 b=JHwFxtdtySPsBkjG9AYBQkjqA0Y7AsMmbAk6NVH7KAcyXNUirKRHUSu6NqdAoDjrqz73LH
 aThq7jK+9CBTPSpt/gcJ3BrN/6h9/RaBUkxZUqPczAuXp0/UgwJs6biRPu48OEcpa7/aBt
 sV4YncEUf8bzpsKqUxU6OAFQnZEiaIk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-Y-Lf6i7kNiqzF1WMLELpww-1; Tue, 18 Oct 2022 13:14:10 -0400
X-MC-Unique: Y-Lf6i7kNiqzF1WMLELpww-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A6D5833AEF;
 Tue, 18 Oct 2022 17:14:10 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C72D540C2064;
 Tue, 18 Oct 2022 17:14:07 +0000 (UTC)
Date: Tue, 18 Oct 2022 18:14:05 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v5 09/18] tests/qtest: Use send/recv for socket
 communication
Message-ID: <Y07e3ZCDgv4IIzQW@redhat.com>
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
 <20221006151927.2079583-10-bmeng.cn@gmail.com>
 <CAFEAcA9nyy47p=Mextm8qTFu1LDTMYBv1BubtywyzGPuDiD0XQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA9nyy47p=Mextm8qTFu1LDTMYBv1BubtywyzGPuDiD0XQ@mail.gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 18, 2022 at 06:09:28PM +0100, Peter Maydell wrote:
> On Thu, 6 Oct 2022 at 17:20, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >
> > Socket communication in the libqtest and libqmp codes uses read()
> > and write() which work on any file descriptor on *nix, and sockets
> > in *nix are an example of a file descriptor.
> >
> > However sockets on Windows do not use *nix-style file descriptors,
> > so read() and write() cannot be used on sockets on Windows.
> > Switch over to use send() and recv() instead which work on both
> > Windows and *nix.
> >
> > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > ---
> >
> > (no changes since v2)
> >
> > Changes in v2:
> > - Introduce qemu_send_full() and use it
> >
> >  include/qemu/sockets.h |  2 ++
> >  tests/qtest/libqmp.c   |  5 +++--
> >  tests/qtest/libqtest.c |  4 ++--
> >  util/osdep.c           | 33 +++++++++++++++++++++++++++++++++
> >  4 files changed, 40 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
> > index 036745e586..adf2b21bd9 100644
> > --- a/include/qemu/sockets.h
> > +++ b/include/qemu/sockets.h
> > @@ -33,6 +33,8 @@ int qemu_socketpair(int domain, int type, int protocol, int sv[2]);
> >  #endif
> >
> >  int qemu_accept(int s, struct sockaddr *addr, socklen_t *addrlen);
> > +ssize_t qemu_send_full(int s, const void *buf, size_t count)
> > +    G_GNUC_WARN_UNUSED_RESULT;
> 
> New global function prototypes in headers need documentation
> comments, please.

In previous versions of this series I suggested we should be making
libqmp/libqtest use the QIOChannelSocket API, instead of raw sockets
code. The latter gives us portability already, and is what almost
all of the rest of the codebase uses for sockets I/O.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


