Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF5517FD57
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 14:29:12 +0100 (CET)
Received: from localhost ([::1]:32804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBewZ-0000cK-FL
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 09:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45223)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pkrempa@redhat.com>) id 1jBeun-0008EA-7L
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 09:27:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pkrempa@redhat.com>) id 1jBeum-0005pb-7F
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 09:27:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47155
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pkrempa@redhat.com>) id 1jBeum-0005ok-2u
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 09:27:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583846839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nk+YiEjbBp0zS+XutW53B5ZR4s81d8z6piBh4MYE4bA=;
 b=ORagXaBR68CJxcJcrb1RB6GhknvAJcRuOrbYRWJ1/9kouUUwohyeZy/C/tgp+lriPdlwwD
 8ldbcqmXU7yRd9YKAktkhGa16zf6G2a0YJxH49ue8ggHXonUwEVjOoBkCXtznqk4+Y8G9S
 dvCHDjO1PjUKp9kDn+/K/lm8IjgKePA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-5fY-sd42NzyaRQHlJTbfCw-1; Tue, 10 Mar 2020 09:27:17 -0400
X-MC-Unique: 5fY-sd42NzyaRQHlJTbfCw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D996B1922049;
 Tue, 10 Mar 2020 13:27:16 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.43.2.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7C505D9C5;
 Tue, 10 Mar 2020 13:27:15 +0000 (UTC)
Date: Tue, 10 Mar 2020 14:27:13 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 5/7] block: Fix cross-AioContext blockdev-snapshot
Message-ID: <20200310132713.GC1320660@angien.pipo.sk>
References: <20200310113831.27293-1-kwolf@redhat.com>
 <20200310113831.27293-6-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200310113831.27293-6-kwolf@redhat.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 10, 2020 at 12:38:29 +0100, Kevin Wolf wrote:
> external_snapshot_prepare() tries to move the overlay to the AioContext
> of the backing file (the snapshotted node). However, it's possible that
> this doesn't work, but the backing file can instead be moved to the
> overlay's AioContext (e.g. opening the backing chain for a mirror
> target).
>=20
> bdrv_append() already indirectly uses bdrv_attach_node(), which takes
> care to move nodes to make sure they use the same AioContext and which
> tries both directions.
>=20
> So the problem has a simple fix: Just delete the unnecessary extra
> bdrv_try_set_aio_context() call in external_snapshot_prepare() and
> instead assert in bdrv_append() that both nodes were indeed moved to the
> same AioContext.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  block.c    |  1 +
>  blockdev.c | 16 ----------------
>  2 files changed, 1 insertion(+), 16 deletions(-)

Tested-by: Peter Krempa <pkrempa@redhat.com>

Unfortunately I don't feel confident enough in the intricacies of the
aio contexts. Nevertheless Fixing bugs by deleting code is awesome!


