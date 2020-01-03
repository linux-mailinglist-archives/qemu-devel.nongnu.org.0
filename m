Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D4C12F9A9
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jan 2020 16:22:22 +0100 (CET)
Received: from localhost ([::1]:53384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1inOmL-0002qP-C1
	for lists+qemu-devel@lfdr.de; Fri, 03 Jan 2020 10:22:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56255)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1inOlV-0002PP-5g
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 10:21:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1inOlT-0000KT-Vw
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 10:21:29 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:31303)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1inOlT-0000Gc-Q6
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 10:21:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578064887;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tPIBBokzPXwzCyWHFWcI0LLYoths+a/BUNP8now/meM=;
 b=YGRIWy4g+3/+H48/4XqUsmE6OZ1vUswOH0nkmABRi6AQbr/4zXuG3J1VBQJSxvKwusYsp8
 W3FC720nmhbIWkRCSg6UPHR8X3BuB6KaYqaediWdArTM8IQd7zuIj/Dg/40kgdzXA114AJ
 kX/B3uREzN9VBFEXlNVN400kzIdU1U8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-gDm4UaaPO6KxPdeXrRlk_w-1; Fri, 03 Jan 2020 10:21:25 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05115911E8
 for <qemu-devel@nongnu.org>; Fri,  3 Jan 2020 15:21:25 +0000 (UTC)
Received: from redhat.com (ovpn-112-41.ams2.redhat.com [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D710A60C81;
 Fri,  3 Jan 2020 15:21:20 +0000 (UTC)
Date: Fri, 3 Jan 2020 15:21:17 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 016/104] virtiofsd: Open vhost connection instead of
 mounting
Message-ID: <20200103152117.GJ2753983@redhat.com>
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20191212163904.159893-17-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191212163904.159893-17-dgilbert@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: gDm4UaaPO6KxPdeXrRlk_w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 12, 2019 at 04:37:36PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> When run with vhost-user options we conect to the QEMU instead
> via a socket.  Start this off by creating the socket.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  tools/virtiofsd/fuse_i.h        |  7 ++-
>  tools/virtiofsd/fuse_lowlevel.c | 55 +++-------------------
>  tools/virtiofsd/fuse_virtio.c   | 83 +++++++++++++++++++++++++++++++++
>  tools/virtiofsd/fuse_virtio.h   | 23 +++++++++
>  4 files changed, 118 insertions(+), 50 deletions(-)
>  create mode 100644 tools/virtiofsd/fuse_virtio.c
>  create mode 100644 tools/virtiofsd/fuse_virtio.h

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


