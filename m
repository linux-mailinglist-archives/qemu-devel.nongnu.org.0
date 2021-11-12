Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CD244ED0B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 20:06:20 +0100 (CET)
Received: from localhost ([::1]:34106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlbsP-00039O-W5
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 14:06:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mlbrL-0002NA-BQ; Fri, 12 Nov 2021 14:05:11 -0500
Received: from [2a02:6b8:0:1619::183] (port=56608
 helo=forwardcorp1j.mail.yandex.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mlbrF-0004ES-RN; Fri, 12 Nov 2021 14:05:10 -0500
Received: from iva8-d2cd82b7433e.qloud-c.yandex.net
 (iva8-d2cd82b7433e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:a88e:0:640:d2cd:82b7])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 6D1112E1D66;
 Fri, 12 Nov 2021 22:04:57 +0300 (MSK)
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net [2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by iva8-d2cd82b7433e.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 BhSK4sSUlg-4usKn3OS; Fri, 12 Nov 2021 22:04:57 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1636743897; bh=11MecmbV4238I742S6pPWzuLFzr3cc6qqA7MZemzAoE=;
 h=In-Reply-To:Subject:To:From:Message-ID:Cc:References:Date;
 b=EI8nIk8D0/mjQlWBDvH7rsjKfle//7/qc9+EwU9DOThPK0nPC4Hqk/jn8v0dvKXPR
 9Xk/fHxIewGBmp2YkTNxSoOofg0KRtLi9Fz50LbqfnVJUWraUvu1Uan2RxAPIZa4Cp
 dJPBSHKliCfjK/gDeBdSZr1BU5OuiEf1tiQhNBIk=
Authentication-Results: iva8-d2cd82b7433e.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from rvkaganb.lan (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:1206::1:19])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 9wHKkIfIe3-4uw0CKTq; Fri, 12 Nov 2021 22:04:56 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Date: Fri, 12 Nov 2021 22:04:54 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH 04/10] chardev/char-fe: don't allow EAGAIN from blocking
 read
Message-ID: <YY661s3JqoL6GQMZ@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Hanna Reitz <hreitz@redhat.com>, yc-core@yandex-team.ru,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20211111153354.18807-1-rvkagan@yandex-team.ru>
 <20211111153354.18807-5-rvkagan@yandex-team.ru>
 <CAJ+F1CKmAR9K6_HRr66+rTxzBVUTbw+GNJ22tByuLyx+CHYfVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CKmAR9K6_HRr66+rTxzBVUTbw+GNJ22tByuLyx+CHYfVw@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a02:6b8:0:1619::183
 (failed)
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, Hanna Reitz <hreitz@redhat.com>,
 yc-core@yandex-team.ru, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 12, 2021 at 12:24:06PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Thu, Nov 11, 2021 at 7:44 PM Roman Kagan <rvkagan@yandex-team.ru> wrote:
> 
> > As its name suggests, ChardevClass.chr_sync_read is supposed to do a
> > blocking read.  The only implementation of it, tcp_chr_sync_read, does
> > set the underlying io channel to the blocking mode indeed.
> >
> > Therefore a failure return with EAGAIN is not expected from this call.
> >
> > So do not retry it in qemu_chr_fe_read_all; instead place an assertion
> > that it doesn't fail with EAGAIN.
> >
> 
> The code was introduced in :
> commit 7b0bfdf52d694c9a3a96505aa42ce3f8d63acd35
> Author: Nikolay Nikolaev <n.nikolaev@virtualopensystems.com>
> Date:   Tue May 27 15:03:48 2014 +0300
> 
>     Add chardev API qemu_chr_fe_read_all

Right, but at that point chr_sync_read wasn't made to block.  It
happened later in

commit bcdeb9be566ded2eb35233aaccf38742a21e5daa
Author: Marc-André Lureau <marcandre.lureau@redhat.com>
Date:   Thu Jul 6 19:03:53 2017 +0200

    chardev: block during sync read
    
    A sync read should block until all requested data is
    available (instead of retrying in qemu_chr_fe_read_all). Change the
    channel to blocking during sync_read.

> > @@ -68,13 +68,10 @@ int qemu_chr_fe_read_all(CharBackend *be, uint8_t
> > *buf, int len)
> >      }
> >
> >      while (offset < len) {
> > -    retry:
> >          res = CHARDEV_GET_CLASS(s)->chr_sync_read(s, buf + offset,
> >                                                    len - offset);
> > -        if (res == -1 && errno == EAGAIN) {
> > -            g_usleep(100);
> > -            goto retry;
> > -        }
> > +        /* ->chr_sync_read should block */
> > +        assert(!(res < 0 && errno == EAGAIN));
> >
> >
> While I agree with the rationale to clean this code a bit, I am not so sure
> about replacing it with an assert(). In the past, when we did such things
> we had unexpected regressions :)

Valid point, qemu may be run against some OS where a blocking call may
sporadically return -EAGAIN, and it would be hard to reliably catch this
with testing.

> A slightly better approach perhaps is g_warn_if_fail(), although it's not
> very popular in qemu.

I think the first thing to decide is whether -EAGAIN from a blocking
call isn't broken enough, and justifies (unlimited) retries.  I'm
tempted to just remove any special handling of -EAGAIN and treat it as
any other error, leaving up to the caller to handle (most probably to
fail the call and initiate a recovery, if possible).

Does this make sense?

Thanks,
Roman.

