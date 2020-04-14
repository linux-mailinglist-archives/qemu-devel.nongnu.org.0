Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CCE1AD4E9
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Apr 2020 05:42:52 +0200 (CEST)
Received: from localhost ([::1]:41906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jPHtz-00088r-AB
	for lists+qemu-devel@lfdr.de; Thu, 16 Apr 2020 23:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46812)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1jPHt6-0007in-AQ
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 23:41:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1jPHt3-00079e-Pa
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 23:41:54 -0400
Received: from [192.146.154.243] (port=54773 helo=mcp01.nutanix.com)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1jPHt3-00079B-L3
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 23:41:53 -0400
Received: from localhost.localdomain (unknown [10.40.36.165])
 by mcp01.nutanix.com (Postfix) with ESMTP id A9F36100CCC9;
 Fri, 17 Apr 2020 03:41:51 +0000 (UTC)
Date: Mon, 13 Apr 2020 21:24:02 -0400
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Li Feng <fengli@smartx.com>
Subject: Re: [PATCH 1/4] vhost-user-blk: delay vhost_user_blk_disconnect
Message-ID: <20200414012255.GA7710@localhost.localdomain>
References: <20200415032826.16701-1-fengli@smartx.com>
 <20200415032826.16701-2-fengli@smartx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200415032826.16701-2-fengli@smartx.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 192.146.154.243
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 15, 2020 at 11:28:23AM +0800, Li Feng wrote:
>=20
>      switch (event) {
>      case CHR_EVENT_OPENED:
> @@ -363,7 +376,16 @@ static void vhost_user_blk_event(void *opaque, QEM=
UChrEvent event)
>          }
>          break;
>      case CHR_EVENT_CLOSED:
> -        vhost_user_blk_disconnect(dev);
> +        /*
> +         * a close event may happen during a read/write, but vhost
> +         * code assumes the vhost_dev remains setup, so delay the
> +         * stop & clear to idle.
> +         */
> +        ctx =3D qemu_get_current_aio_context();
> +
> +        qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL, NULL,
> +                                 NULL, NULL, NULL, false);
> +        aio_bh_schedule_oneshot(ctx, vhost_user_blk_chr_closed_bh, opa=
que);

This seems a bit racy. What=E2=80=99s to stop the async operation from ex=
ecuting before
the next read?

If the issue is just that the vhost_dev state is being destroyed too earl=
y, why
don=E2=80=99t we rather move the vhost_dev_cleanup() call from vhost_user=
_blk_disconnect()
to vhost_user_blk_connect()? We may need to add some state to tell if thi=
s is the
first connect or a reconnect so we don=E2=80=99t call vhost_dev_cleanup()=
 on initial
connect, but as long as we call vhost_dev_cleanup() before vhost_dev_init=
()
every time the device reconnects it shouldn=E2=80=99t matter that we keep=
 that state
around.

Thoughts?

>          break;
>      case CHR_EVENT_BREAK:
>      case CHR_EVENT_MUX_IN:

