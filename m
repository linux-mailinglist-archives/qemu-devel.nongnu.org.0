Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A631325C4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 13:12:26 +0100 (CET)
Received: from localhost ([::1]:47494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ionii-00073o-Su
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 07:12:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45090)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1ionIT-0004Kx-FT
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 06:45:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1ionIQ-00027e-3Y
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 06:45:17 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:44387
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1ionIP-00027O-Vu
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 06:45:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578397513;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r3rfncJK7BRmlw7Qv+pJ2Ia3+z7PYuzxta0tOeYZFnM=;
 b=f+lM2K/WjRtp8xlUvYkEs5s0x/yU/PogiG2HO0kcyH1LODwY1WcJcJFGo3UK3Ed2L5sL+z
 jMSAD4IV6Vni6K0Bj5/0yU+O0S2lBie53QHnD8NkX3m72EXAYbf8w2gB0LnptKhphoOaIB
 oQVp42RNmH2bMwJc63oqcwJ5q3M2ORc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-Dw19OH9cNaeBZ3tUhnM6Mg-1; Tue, 07 Jan 2020 06:45:12 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67DFF107ACC9
 for <qemu-devel@nongnu.org>; Tue,  7 Jan 2020 11:45:11 +0000 (UTC)
Received: from redhat.com (ovpn-112-61.ams2.redhat.com [10.36.112.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BDCF86C44;
 Tue,  7 Jan 2020 11:45:07 +0000 (UTC)
Date: Tue, 7 Jan 2020 11:45:04 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 083/104] virtiofsd: fix incorrect error handling in
 lo_do_lookup
Message-ID: <20200107114504.GX3368802@redhat.com>
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20191212163904.159893-84-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191212163904.159893-84-dgilbert@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: Dw19OH9cNaeBZ3tUhnM6Mg-1
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

On Thu, Dec 12, 2019 at 04:38:43PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: Eric Ren <renzhen@linux.alibaba.com>
>=20
> Signed-off-by: Eric Ren <renzhen@linux.alibaba.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 1 -
>  1 file changed, 1 deletion(-)

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


