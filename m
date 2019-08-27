Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D229E2F1
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 10:44:37 +0200 (CEST)
Received: from localhost ([::1]:48256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2X5g-0003ZC-2U
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 04:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39387)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1i2X4C-0002m7-Nh
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 04:43:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1i2X4A-0001qZ-T0
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 04:43:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33284)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>)
 id 1i2X45-0001mJ-7h; Tue, 27 Aug 2019 04:42:57 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5E96E8980EF;
 Tue, 27 Aug 2019 08:42:55 +0000 (UTC)
Received: from redhat.com (ovpn-112-56.ams2.redhat.com [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D89A5D9CC;
 Tue, 27 Aug 2019 08:42:53 +0000 (UTC)
Date: Tue, 27 Aug 2019 09:42:50 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20190827084250.GA16500@redhat.com>
References: <20190824172813.29720-1-eblake@redhat.com>
 <20190824172813.29720-2-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190824172813.29720-2-eblake@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Tue, 27 Aug 2019 08:42:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 1/2] nbd: Use g_autofree in a few places
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>, rjones@redhat.com,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Aug 24, 2019 at 12:28:12PM -0500, Eric Blake wrote:
> Thanks to our recent move to use glib's g_autofree, I can join the
> bandwagon.  Getting rid of gotos is fun ;)
>=20
> There are probably more places where we could register cleanup
> functions and get rid of more gotos; this patch just focuses on the
> labels that existed merely to call g_free.
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  block/nbd.c  | 11 ++++-------
>  nbd/client.c | 22 +++++++---------------
>  nbd/server.c | 12 ++++--------
>  3 files changed, 15 insertions(+), 30 deletions(-)

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

