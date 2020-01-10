Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D46136A0C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 10:36:24 +0100 (CET)
Received: from localhost ([::1]:43102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipqiN-0003cc-CK
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 04:36:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55786)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1ipqhQ-0002vt-LZ
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 04:35:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1ipqhP-0004DL-I0
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 04:35:24 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:43672
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1ipqhP-0004As-CO
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 04:35:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578648922;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xFhxeMUjTXhcRcV5HAseFSxOv/MgJKw0dU5MmlIiR+E=;
 b=cfRGJG4VQnP6k4dg7Awq4E6+sh/KCatx95CqhOcVlTr7QYR8P2XTGtGW9mtWaZ5G8GbKXg
 vYWMqIUyDTh+0ytyaC8XMitQFPjomhV8XJbbEJdwT1FI6LDJ2et6dl1tCJkNmnosCXw8p1
 atC8HI11ftfnXrKW4FuFBWVgrwQeiMM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-ohu6aOKwOL23AI6lS1HRnQ-1; Fri, 10 Jan 2020 04:35:21 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2ECCE477;
 Fri, 10 Jan 2020 09:35:20 +0000 (UTC)
Received: from redhat.com (ovpn-112-65.ams2.redhat.com [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CB2886CCA;
 Fri, 10 Jan 2020 09:35:18 +0000 (UTC)
Date: Fri, 10 Jan 2020 09:35:15 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Tong Ho <tong.ho@xilinx.com>
Subject: Re: [PATCH] crypto: fix getter of a QCryptoSecret's property
Message-ID: <20200110093515.GC3423494@redhat.com>
References: <1578600598-335744-1-git-send-email-tong.ho@xilinx.com>
MIME-Version: 1.0
In-Reply-To: <1578600598-335744-1-git-send-email-tong.ho@xilinx.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: ohu6aOKwOL23AI6lS1HRnQ-1
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 09, 2020 at 12:09:58PM -0800, Tong Ho wrote:
> This fixes the condition-check done by the "loaded" property
> getter, such that the property returns true even when the
> secret is loaded by the 'file' option.
>=20
> Signed-off-by: Tong Ho <tong.ho@xilinx.com>
> ---
>  Pre-existing getter returns true only when the secret is loaded
>  by the 'data' option.
>=20
>  crypto/secret.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Added to my pending queue


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


