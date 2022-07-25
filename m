Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B53057FE62
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 13:29:41 +0200 (CEST)
Received: from localhost ([::1]:46636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFwHM-0001aA-2t
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 07:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oFwFo-0000A1-RL
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 07:28:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oFwFl-0005Ti-QU
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 07:28:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658748480;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SPXvXfYBPsKmqug+Z/sHqrC6MzZVUBr6exufPN305T8=;
 b=ZKRvl+kkNTzqK+fWg5wqkOmCTJURxrPXMD5/ym3vpQ1uHEwabBioGjpj2to8d8Ulmer9Hm
 xWqMLfbmINd3Um2kSgYswhFacaoP65PC3FJc2OQaqDCo/5I7vW86HVdwa86y2cutO9RU2Y
 cajXnCvj0BNnQe7IaNeUEBXzN5xewgM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-320-otXCs-iFM72NPTDluVzBpA-1; Mon, 25 Jul 2022 07:27:57 -0400
X-MC-Unique: otXCs-iFM72NPTDluVzBpA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D76C185A7A4;
 Mon, 25 Jul 2022 11:27:57 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA515C15D67;
 Mon, 25 Jul 2022 11:27:53 +0000 (UTC)
Date: Mon, 25 Jul 2022 12:27:48 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH v2 0/3] python/qemu/machine: fix potential hang in QMP
 accept
Message-ID: <Yt5+NMuW+l4OhDH2@redhat.com>
References: <20220630123419.1019367-1-marcandre.lureau@redhat.com>
 <CAFn=p-Z1JqriE2iD26pYFycNBZhkxK3wqOcz6KzD-CegFP+qKQ@mail.gmail.com>
 <CAJ+F1C+NEqp-P9BAzT5ADkxVP_pZyvtZPAOVz3R_Xq0w7tCmpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1C+NEqp-P9BAzT5ADkxVP_pZyvtZPAOVz3R_Xq0w7tCmpg@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Mon, Jul 25, 2022 at 03:23:26PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Fri, Jul 1, 2022 at 2:51 AM John Snow <jsnow@redhat.com> wrote:
> 
> > On Thu, Jun 30, 2022 at 8:34 AM <marcandre.lureau@redhat.com> wrote:
> > >
> > > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> > >
> > > Hi,
> > >
> > > As reported earlier by Richard Henderson ("virgl avocado hang" thread),
> > avocado
> > > tests may hang when QEMU exits before the QMP connection is established.
> > >
> > > v2:
> > >  - use a socketpair() for QMP (instead of async concurrent code from v1)
> > as
> > >    suggested by Daniel Berrange.
> > >  - should not regress (hopefully)
> > >
> > > Marc-André Lureau (3):
> > >   python/qmp/protocol: add open_with_socket()
> > >   python/qmp/legacy: make QEMUMonitorProtocol accept a socket
> > >   python/qemu/machine: use socketpair() for QMP by default
> > >
> > >  python/qemu/machine/machine.py | 24 ++++++++++++++++--------
> > >  python/qemu/qmp/legacy.py      | 18 +++++++++++++++---
> > >  python/qemu/qmp/protocol.py    | 25 ++++++++++++++++++++-----
> > >  3 files changed, 51 insertions(+), 16 deletions(-)
> > >
> > > --
> > > 2.37.0.rc0
> > >
> >
> > For anything that touches python/qemu/qmp/*, may I please ask that you
> > submit them to https://gitlab.com/qemu-project/python-qemu-qmp ?
> >
> >
> Ok
> 
> 
> > (I'll review them in the meantime on-list just in the interest of
> > moving things along.)
> >
> 
> I was waiting for a review before updating the patches / moving to
> python-qemu-qmp.

This code looks decent to me

  Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


