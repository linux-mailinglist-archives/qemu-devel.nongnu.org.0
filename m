Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C5915C98E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 18:38:16 +0100 (CET)
Received: from localhost ([::1]:56584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2IRL-0004g3-OQ
	for lists+qemu-devel@lfdr.de; Thu, 13 Feb 2020 12:38:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40102)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1j2IQI-0004Cr-GE
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 12:37:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1j2IQG-0005TX-7J
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 12:37:09 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:21805
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1j2IQG-0005S7-3d
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 12:37:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581615427;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+TdAZNMDPjgLwjm2KQC5PdBWxitdO5kstsLLYbVCU5g=;
 b=Qf7XzLeK0maPpsBMEZg1jeMx3wSA9qJ0GnC3iRlbxkPGBq2ArpB1xQmdS8XRYNFhLokRH3
 C5QsKvgo2/LIW70nkkO1oFqsEA2FXMwdZSJ9KBI7O56pKwqjodPXpeLtjBMhnvYHDBc08h
 zetBCmXSQvuDBXoGadVBaBz8JH2snJA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-l2rJPHUcP6K-wFDSNPKR6A-1; Thu, 13 Feb 2020 12:37:03 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DAF0800D48;
 Thu, 13 Feb 2020 17:37:02 +0000 (UTC)
Received: from redhat.com (unknown [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 713526D7E;
 Thu, 13 Feb 2020 17:37:00 +0000 (UTC)
Date: Thu, 13 Feb 2020 17:36:57 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alberto Garcia <berto@igalia.com>
Subject: Re: [PATCH] qcow2: Fix alignment checks in encrypted images
Message-ID: <20200213173657.GS594756@redhat.com>
References: <20200213171646.15876-1-berto@igalia.com>
MIME-Version: 1.0
In-Reply-To: <20200213171646.15876-1-berto@igalia.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: l2rJPHUcP6K-wFDSNPKR6A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 13, 2020 at 06:16:46PM +0100, Alberto Garcia wrote:
> I/O requests to encrypted media should be aligned to the sector size
> used by the underlying encryption method, not to BDRV_SECTOR_SIZE.
> Fortunately this doesn't break anything at the moment because
> both existing QCRYPTO_BLOCK_*_SECTOR_SIZE have the same value as
> BDRV_SECTOR_SIZE.
>=20
> The checks in qcow2_co_preadv_encrypted() are also unnecessary because
> they are repeated immediately afterwards in qcow2_co_encdec().
>=20
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>  block/qcow2-threads.c | 12 ++++++++----
>  block/qcow2.c         |  2 --
>  2 files changed, 8 insertions(+), 6 deletions(-)

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


