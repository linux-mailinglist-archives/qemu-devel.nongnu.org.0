Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2B211712D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Dec 2019 17:08:07 +0100 (CET)
Received: from localhost ([::1]:42032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieLZu-0003aB-JU
	for lists+qemu-devel@lfdr.de; Mon, 09 Dec 2019 11:08:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59173)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1ieLZ5-0002xx-C3
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 11:07:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1ieLZ4-0000iG-A3
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 11:07:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59590
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1ieLZ4-0000gb-5v
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 11:07:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575907633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vP6VNKdJRcphu5z3jxbuaQmrRW1htck0r0LeJVfPd/E=;
 b=I41x5Ajkd6X45K7nMFcYQ5Aiyvyc1rhiL7bOPEnJTE0rAlfB/ycoDt9ZB+4DESXnhGj3CZ
 bRq3Eq6SBfWSqziUONyk+nBMB46ITtZrzsTKElIMydZ212l//15RoF4nbVYK+Hrzu/gyPn
 HKrP/2wi0b4TtkKs5H/mRF0jiCS73es=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-eoAheURvOV2BP3IedlUGjw-1; Mon, 09 Dec 2019 11:07:10 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DE78800D53;
 Mon,  9 Dec 2019 16:07:09 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-116.ams2.redhat.com [10.36.117.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E14F710016DA;
 Mon,  9 Dec 2019 16:07:05 +0000 (UTC)
Date: Mon, 9 Dec 2019 17:07:04 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH v5 0/4] blockdev: avoid acquiring AioContext lock twice
 at do_drive_backup and do_blockdev_backup
Message-ID: <20191209160704.GC6715@linux.fritz.box>
References: <20191128104129.250206-1-slp@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191128104129.250206-1-slp@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: eoAheURvOV2BP3IedlUGjw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 28.11.2019 um 11:41 hat Sergio Lopez geschrieben:
> do_drive_backup() acquires the AioContext lock of the corresponding
> BlockDriverState. This is not a problem when it's called from
> qmp_drive_backup(), but drive_backup_prepare() also acquires the lock
> before calling it. The same things happens with do_blockdev_backup()
> and blockdev_backup_prepare().
>=20
> This patch series merges do_drive_backup() with drive_backup_prepare()
> and do_blockdev_backup() with blockdev_backup_prepare(), and ensures
> they're only getting called from a transaction context. This way,
> there's a single code path for both transaction requests and qmp
> commands, as suggested by Kevin Wolf.
>=20
> We also take this opportunity to ensure we're honoring the context
> acquisition semantics required by bdrv_try_set_aio_context, as
> suggested by Max Reitz.

I think there is a small problem with the error paths in patch 4, but
for patches 1 to 3 you can add:

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


