Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4133D10A215
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Nov 2019 17:28:54 +0100 (CET)
Received: from localhost ([::1]:56848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZdhs-0005ol-O5
	for lists+qemu-devel@lfdr.de; Tue, 26 Nov 2019 11:28:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36649)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iZdfu-0004KP-7A
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 11:26:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iZdfs-00053R-6G
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 11:26:49 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41412
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iZdfs-00053G-2j
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 11:26:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574785607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LhUuGUpHRcq9ltTSgYzcNUeuxBWh3F/0cZfpvqD0KvI=;
 b=ZY4OkpZgw6fzcxutngImw0q2bO5GcZQXileY+Dh/tIYKnKqHcbMPXRhCUzDQaRy9FH8Fvp
 dBoMK/DT86uMPva1lYs1JHxSgherZQgfMZDfkTtGYOO7FyQR7Ns6rFj0xOYvDp2BRtVEC/
 cyy3TpUfU4a/18ThEFoFyPs+Zgn40Bc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221--0h0FHtyPEeNnL640y_rbA-1; Tue, 26 Nov 2019 11:26:44 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06300100551D;
 Tue, 26 Nov 2019 16:26:43 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-171.ams2.redhat.com [10.36.117.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D2FAE600CA;
 Tue, 26 Nov 2019 16:26:41 +0000 (UTC)
Date: Tue, 26 Nov 2019 17:26:40 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH] block: Error out on image creation with conflicting size
 options
Message-ID: <20191126162640.GC5889@linux.fritz.box>
References: <20191126154835.27915-1-kwolf@redhat.com>
 <cf113754-c582-03ae-9e53-ab0213c0ccf9@redhat.com>
 <2e913e12-4819-a729-2179-2b664601087a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2e913e12-4819-a729-2179-2b664601087a@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: -0h0FHtyPEeNnL640y_rbA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=iso-8859-1
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.11.2019 um 16:56 hat Eric Blake geschrieben:
> On 11/26/19 9:54 AM, Eric Blake wrote:
> > On 11/26/19 9:48 AM, Kevin Wolf wrote:
> > > If both the create options (qemu-img create -o ...) and the size
> > > parameter were given, the size parameter was silently ignored. Instea=
d,
> > > make specifying two sizes an error.
> > >=20
> > > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > > ---
> > > =A0 block.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
| 10 ++++++++--
> > > =A0 tests/qemu-iotests/049=A0=A0=A0=A0 |=A0 5 +++++
> > > =A0 tests/qemu-iotests/049.out |=A0 5 +++++
> > > =A0 3 files changed, 18 insertions(+), 2 deletions(-)
> >=20
> > Longtime bug, so not essential for 4.2-rc3.=A0 But small enough that yo=
u
> > could sneak it in if you have other patches to queue and don't want to
> > wait for 5.0.
> >=20
> > Reviewed-by: Eric Blake <eblake@redhat.com>
>=20
> Actually, your patch fails to diagnose:
>=20
> $ qemu-img create -o size=3D1m,size=3D2m -f qcow2 x.qcow2
> Formatting 'x.qcow2', fmt=3Dqcow2 size=3D2097152 cluster_size=3D65536
> lazy_refcounts=3Doff refcount_bits=3D16
>=20
> so you may want to enhance this patch to also catch the case of -o size u=
sed
> more than once.

Hm... Isn't this something that QemuOpts should already catch? Or do we
have callers that actually expect the same option specified multiple
times?

Somehow I'm almost sure that Markus will know an example...

But anyway, I figure the same problem exists for almost all options.

Kevin


