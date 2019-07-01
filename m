Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7594CA5F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 11:12:02 +0200 (CEST)
Received: from localhost ([::1]:45066 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdt6v-00022S-AO
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 05:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38529)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berrange@redhat.com>) id 1hdsqT-0006Ts-PA
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 04:55:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1hdsqQ-0006bU-5m
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 04:55:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55626)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hdsqP-0006Y7-Kn
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 04:54:57 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BCF3A223883
 for <qemu-devel@nongnu.org>; Thu, 20 Jun 2019 08:54:54 +0000 (UTC)
Received: from redhat.com (ovpn-112-65.ams2.redhat.com [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8AA45DA5B;
 Thu, 20 Jun 2019 08:54:50 +0000 (UTC)
Date: Thu, 20 Jun 2019 09:54:47 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20190620085447.GP25448@redhat.com>
References: <20190619201050.19040-1-armbru@redhat.com>
 <20190619201050.19040-15-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190619201050.19040-15-armbru@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Thu, 20 Jun 2019 08:54:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 14/17] qapi: Split dump.json off misc.json
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
Cc: kwolf@redhat.com,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 19, 2019 at 10:10:47PM +0200, Markus Armbruster wrote:
> Move commands dump-guest-memory, query-dump,
> query-dump-guest-memory-capability with their types from misc.json to
> new dump.json.  Add dump.json to MAINTAINERS section "Dump".
>=20
> Cc: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  MAINTAINERS           |   1 +
>  dump.c                |   4 +-
>  include/sysemu/dump.h |   2 +-
>  monitor/hmp-cmds.c    |   1 +
>  qapi/Makefile.objs    |   2 +-
>  qapi/dump.json        | 200 ++++++++++++++++++++++++++++++++++++++++++
>  qapi/misc.json        | 192 ----------------------------------------
>  qapi/qapi-schema.json |   1 +
>  8 files changed, 207 insertions(+), 196 deletions(-)
>  create mode 100644 qapi/dump.json

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

