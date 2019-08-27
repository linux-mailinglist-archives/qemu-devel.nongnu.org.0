Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E36E9E309
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 10:48:45 +0200 (CEST)
Received: from localhost ([::1]:48370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2X9g-0005OI-Jl
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 04:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40459)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1i2X8P-0004so-IA
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 04:47:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1i2X8J-0004Qj-PQ
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 04:47:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56110)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>)
 id 1i2X8C-0004MS-Tt; Tue, 27 Aug 2019 04:47:13 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 35C643D962;
 Tue, 27 Aug 2019 08:47:12 +0000 (UTC)
Received: from redhat.com (ovpn-112-56.ams2.redhat.com [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AD365D6B0;
 Tue, 27 Aug 2019 08:47:09 +0000 (UTC)
Date: Tue, 27 Aug 2019 09:47:06 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20190827084706.GB16500@redhat.com>
References: <20190824172813.29720-1-eblake@redhat.com>
 <20190824172813.29720-3-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190824172813.29720-3-eblake@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Tue, 27 Aug 2019 08:47:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 2/2] nbd: Tolerate more errors to
 structured reply request
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
Cc: vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>, rjones@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Aug 24, 2019 at 12:28:13PM -0500, Eric Blake wrote:
> A server may have a reason to reject a request for structured replies,
> beyond just not recognizing them as a valid request; similarly, it may
> have a reason for rejecting a request for a meta context.  It doesn't
> hurt us to continue talking to such a server; otherwise 'qemu-nbd
> --list' of such a server fails to display all available details about
> the export.
>=20
> Encountered when temporarily tweaking nbdkit to reply with
> NBD_REP_ERR_POLICY.  Present since structured reply support was first
> added (commit d795299b reused starttls handling, but starttls is
> different in that we can't fall back to other behavior on any error).
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  nbd/client.c     | 63 +++++++++++++++++++++++++-----------------------
>  nbd/trace-events |  2 +-
>  2 files changed, 34 insertions(+), 31 deletions(-)

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

