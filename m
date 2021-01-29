Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F333087DA
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 11:35:13 +0100 (CET)
Received: from localhost ([::1]:45814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5R7Q-0006Nj-2t
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 05:35:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l5R69-0005yH-90
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 05:33:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l5R65-0003l8-KQ
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 05:33:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611916428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e25xGW6zl9t5bQtjrjyNv213LRXd7dYO4F0S+MUt9ww=;
 b=Kg+YjL9AZB9EiuLT6s6flPTQx4PA7bB4KMK9jWjyiIi5ZIv+oA920/b3nRqnhdSSVC4Pbz
 HM7ZQySHnlsiV5FdYp0/kv34z5V4ACzqTw9nVEiV8Yo3w96ZRLWdMO8fhPdtGxRMtGE14o
 5vW9WJCYnvFBlZHbkn2etVXBjSxV/AM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-_w_055z3MKWDsdbnByfaNA-1; Fri, 29 Jan 2021 05:33:46 -0500
X-MC-Unique: _w_055z3MKWDsdbnByfaNA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DD698030B9;
 Fri, 29 Jan 2021 10:33:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 06144761E0;
 Fri, 29 Jan 2021 10:33:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5C82118000A2; Fri, 29 Jan 2021 11:33:43 +0100 (CET)
Date: Fri, 29 Jan 2021 11:33:43 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: vnc clipboard support
Message-ID: <20210129103343.byaddmkuqvncbqyx@sirius.home.kraxel.org>
References: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
 <CAJ+F1CJvJM0Vjdz1nU92H+x00+NdbqfoJ9TA--9-BuQ8SNmoFg@mail.gmail.com>
 <20210129082758.vx6ebmqhk7e332g4@sirius.home.kraxel.org>
 <CAJ+F1CKLO=kBZy32e0kgh26K_9nv3c16hBJmKO+tWzr3wqOFNA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CKLO=kBZy32e0kgh26K_9nv3c16hBJmKO+tWzr3wqOFNA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 29, 2021 at 12:34:32PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Fri, Jan 29, 2021 at 12:28 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
> >
> > Well.  That is a completely different level of desktop integration.
> > It surely makes sense to have that, and dbus-over-vsock looks like
> > a reasonable choice.
> >
> 
> (using vsock & dbus also goes in the direction where UIs and remote server
> can run in different processes and come and go btw)

Yep, that would mostly (maybe even completely) implemented outside qemu
thanks to vhost vsock.

> > But I'm more after a solution for the "paste that long link into the
> > guest firefox" problem, without putting everything upside-down 😊
> 
> In this case, I would say an agent-less text-to-type solution (even with
> its very limited scope) is quite attractive.

Any suggestions for the keyboard map problem?

take care,
  Gerd


