Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EC5367CE6
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 10:50:32 +0200 (CEST)
Received: from localhost ([::1]:56078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZV2d-00048A-8l
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 04:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lZV1N-0003dK-Qj; Thu, 22 Apr 2021 04:49:13 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:53344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lZV1J-0002GW-1S; Thu, 22 Apr 2021 04:49:11 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id D5C452E172B;
 Thu, 22 Apr 2021 11:49:03 +0300 (MSK)
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net [2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 UJAQdQNd2n-n31Gte0l; Thu, 22 Apr 2021 11:49:03 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1619081343; bh=S7NizheHyvUGEynPIrtRxCYFdkbIu2afcOOryvRZ8Pg=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=Jn0lAcZcgG48NaldfXs1TcTqYuBenzbclp0ewqK3mxB5s/vq57h0fQksfx6QYkgw9
 j3fSCbhamHTgfa7cDvAfRGDTnpJiVpgncPptFwSpv3059/lps9THkcclglOwj8CHig
 ma2aAZ9LfgGCDCvfkY49RPLJzHXTHC2a6Dg6mJPY=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:219::1:22])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 dvJdDyKiKQ-n3pqwSu4; Thu, 22 Apr 2021 11:49:03 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Thu, 22 Apr 2021 11:49:00 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 02/33] block/nbd: fix how state is cleared on
 nbd_open() failure paths
Message-ID: <YIE4fKtOB8T5MYMQ@rvkaganb>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-3-vsementsov@virtuozzo.com>
 <YIAwEYbLpqzzFzd4@rvkaganb.lan>
 <2f1afa65-fb15-7ccd-7285-dee9fe41161c@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f1afa65-fb15-7ccd-7285-dee9fe41161c@virtuozzo.com>
Received-SPF: pass client-ip=5.45.199.163; envelope-from=rvkagan@yandex-team.ru;
 helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 22, 2021 at 01:27:22AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 21.04.2021 17:00, Roman Kagan wrote:
> > On Fri, Apr 16, 2021 at 11:08:40AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > @@ -2305,20 +2301,23 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
> > >           return -EEXIST;
> > >       }
> > > +    ret = nbd_process_options(bs, options, errp);
> > > +    if (ret < 0) {
> > > +        goto fail;
> > > +    }
> > > +
> > >       /*
> > >        * establish TCP connection, return error if it fails
> > >        * TODO: Configurable retry-until-timeout behaviour.
> > >        */
> > >       if (nbd_establish_connection(bs, s->saddr, errp) < 0) {
> > > -        yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
> > > -        return -ECONNREFUSED;
> > > +        ret = -ECONNREFUSED;
> > > +        goto fail;
> > >       }
> > >       ret = nbd_client_handshake(bs, errp);
> > Not that this was introduced by this patch, but once you're at it:
> > AFAICT nbd_client_handshake() calls yank_unregister_instance() on some
> > error path(s); I assume this needs to go too, otherwise it's called
> > twice (and asserts).
> > 
> > Roman.
> > 
> 
> No, nbd_client_handshake() only calls yank_unregister_function(), not instance.

Indeed.  Sorry for confusion.

Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>

