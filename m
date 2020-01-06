Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1691314E2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 16:35:10 +0100 (CET)
Received: from localhost ([::1]:53648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioUPM-00086n-SB
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 10:35:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52476)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1ioTtA-00068n-MK
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 10:01:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1ioTt8-0004Z0-VX
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 10:01:52 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46146
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1ioTt8-0004YN-RD
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 10:01:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578322910;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=scK1UZx8dn1/G565hvUwsFXXTb9RMF/QMQxt5ZiVf2M=;
 b=TcJvEU+GUowcY3z3iEgJr8dnrLgZtyqcdWzQ2Wv2rQhKJocXncMhj+xsnj3ECu3nnSnrxR
 YyMOCynfFLBnJwHcmISiD9d02c+hk3bW3LmSJqkSKo3x+VyPQpsrfXRHt+ohXXdJL7IIMm
 wVzBB6LgFo+/oC4U+6+mrXrUMC1jBtE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-PUvsbILHNNeM0Rl4uf5ZZA-1; Mon, 06 Jan 2020 10:01:48 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D597801E6C
 for <qemu-devel@nongnu.org>; Mon,  6 Jan 2020 15:01:47 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3EFB60F82;
 Mon,  6 Jan 2020 15:01:43 +0000 (UTC)
Date: Mon, 6 Jan 2020 15:01:43 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 055/104] virtiofsd: fix libfuse information leaks
Message-ID: <20200106150143.GS2930416@redhat.com>
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20191212163904.159893-56-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191212163904.159893-56-dgilbert@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: PUvsbILHNNeM0Rl4uf5ZZA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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

On Thu, Dec 12, 2019 at 04:38:15PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> Some FUSE message replies contain padding fields that are not
> initialized by libfuse.  This is fine in traditional FUSE applications
> because the kernel is trusted.  virtiofsd does not trust the guest and
> must not expose uninitialized memory.
>=20
> Use C struct initializers to automatically zero out memory.  Not all of
> these code changes are strictly necessary but they will prevent future
> information leaks if the structs are extended.
>=20
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  tools/virtiofsd/fuse_lowlevel.c | 150 ++++++++++++++++----------------
>  1 file changed, 76 insertions(+), 74 deletions(-)

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


