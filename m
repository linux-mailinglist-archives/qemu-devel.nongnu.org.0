Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 257DC37B97A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 11:43:06 +0200 (CEST)
Received: from localhost ([::1]:46084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lglOS-0004XX-OD
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 05:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lglLn-0002aG-I6; Wed, 12 May 2021 05:40:19 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:58790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lglLj-0004O0-69; Wed, 12 May 2021 05:40:17 -0400
Received: from sas1-ec30c78b6c5b.qloud-c.yandex.net
 (sas1-ec30c78b6c5b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:2704:0:640:ec30:c78b])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id DAD4F2E146B;
 Wed, 12 May 2021 12:40:09 +0300 (MSK)
Received: from sas2-d40aa8807eff.qloud-c.yandex.net
 (sas2-d40aa8807eff.qloud-c.yandex.net [2a02:6b8:c08:b921:0:640:d40a:a880])
 by sas1-ec30c78b6c5b.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 99m86GigqM-e800ubxq; Wed, 12 May 2021 12:40:09 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1620812409; bh=DPAXy9omRoVupCfoi+pQbopIwmrSw9ge5AX2Sp6C0GU=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=CjJWIbDQLfZuqPDkhHifvE8yyTp/5dybGiwx3CHrZn5ib+qhWanML0SGy75MZI3R5
 /5N/fNeeFpHmFb+XbiJ8Hr/Gm9NqVX2VxbqNjV8RZSYr/qnqlz9Hh1iQWEbhG+/D93
 uGpXRoRVnLg+jIE1MKaWtPx3/gZpbY0Y54rqmAW8=
Authentication-Results: sas1-ec30c78b6c5b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:716::1:17])
 by sas2-d40aa8807eff.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 TPxem5vCQo-e7oCWPpV; Wed, 12 May 2021 12:40:08 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Wed, 12 May 2021 12:40:03 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v3 21/33] qemu-socket: pass monitor link to socket_get_fd
 directly
Message-ID: <YJuic4P8LxL2K3SQ@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-22-vsementsov@virtuozzo.com>
 <YH1OuUYuLYkHY2ni@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YH1OuUYuLYkHY2ni@redhat.com>
Received-SPF: pass client-ip=77.88.29.217; envelope-from=rvkagan@yandex-team.ru;
 helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 19, 2021 at 10:34:49AM +0100, Daniel P. Berrangé wrote:
> On Fri, Apr 16, 2021 at 11:08:59AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > Detecting monitor by current coroutine works bad when we are not in
> > coroutine context. And that's exactly so in nbd reconnect code, where
> > qio_channel_socket_connect_sync() is called from thread.
> > 
> > Add a possibility to pass monitor by hand, to be used in the following
> > commit.
> > 
> > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > ---
> >  include/io/channel-socket.h    | 20 ++++++++++++++++++++
> >  include/qemu/sockets.h         |  2 +-
> >  io/channel-socket.c            | 17 +++++++++++++----
> >  tests/unit/test-util-sockets.c | 16 ++++++++--------
> >  util/qemu-sockets.c            | 10 +++++-----
> >  5 files changed, 47 insertions(+), 18 deletions(-)
> > 
> > diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
> > index e747e63514..6d0915420d 100644
> > --- a/include/io/channel-socket.h
> > +++ b/include/io/channel-socket.h
> > @@ -78,6 +78,23 @@ qio_channel_socket_new_fd(int fd,
> >                            Error **errp);
> >  
> >  
> > +/**
> > + * qio_channel_socket_connect_sync_mon:
> > + * @ioc: the socket channel object
> > + * @addr: the address to connect to
> > + * @mon: current monitor. If NULL, it will be detected by
> > + *       current coroutine.
> > + * @errp: pointer to a NULL-initialized error object
> > + *
> > + * Attempt to connect to the address @addr. This method
> > + * will run in the foreground so the caller will not regain
> > + * execution control until the connection is established or
> > + * an error occurs.
> > + */
> > +int qio_channel_socket_connect_sync_mon(QIOChannelSocket *ioc,
> > +                                        SocketAddress *addr,
> > +                                        Monitor *mon,
> > +                                        Error **errp);
> 
> I don't really like exposing the concept of the QEMU monitor in
> the IO layer APIs. IMHO these ought to remain completely separate
> subsystems from the API pov,

Agreed. 

> and we ought to fix this problem by
> making monitor_cur() work better in the scenario required.

Would it make sense instead to resolve the fdstr into actual file
descriptor number in the context where monitor_cur() works and makes
sense, prior to passing it to the connection thread?

Roman.

