Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8001091C0
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Nov 2019 17:24:24 +0100 (CET)
Received: from localhost ([::1]:46186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZH9z-0007zB-CG
	for lists+qemu-devel@lfdr.de; Mon, 25 Nov 2019 11:24:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39444)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iZH8x-0007OC-Jf
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 11:23:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iZH8w-00052z-Jq
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 11:23:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55389
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iZH8w-00052n-GX
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 11:23:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574698998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TooIdBeUCZWVYTQnruxX6Kkj22QPebXxc72Zebiczyc=;
 b=UeutN/qh4NESdgVMjYU7vZvnMOKRn0a03AfhJxUTbhxLA/GRQvijJ39WZFNluMOY+2OzCw
 dNJwSXAsGOq3MboMHrXvh1qLGhVc97MXnQDf0lE9fn0IK6oA3ZcLNf9S1o1nS65PML6oxt
 ikhIiHGYpMwu3LnypdxZMoIq589NtU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-QEjC3oyMOGSj9cQRVGgtVA-1; Mon, 25 Nov 2019 11:23:14 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82DC21087C82;
 Mon, 25 Nov 2019 16:23:13 +0000 (UTC)
Received: from linux.fritz.box (unknown [10.36.118.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5741960878;
 Mon, 25 Nov 2019 16:23:09 +0000 (UTC)
Date: Mon, 25 Nov 2019 17:23:07 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 3/4] block/io: bdrv_common_block_status_above: support bs
 == base
Message-ID: <20191125162307.GG4638@linux.fritz.box>
References: <20191116163410.12129-1-vsementsov@virtuozzo.com>
 <20191116163410.12129-4-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20191116163410.12129-4-vsementsov@virtuozzo.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: QEjC3oyMOGSj9cQRVGgtVA-1
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
Cc: fam@euphon.net, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.11.2019 um 17:34 hat Vladimir Sementsov-Ogievskiy geschrieben:
> We are going to reuse bdrv_common_block_status_above in
> bdrv_is_allocated_above. bdrv_is_allocated_above may be called with
> include_base =3D=3D false and still bs =3D=3D base (for ex. from img_reba=
se()).
>=20
> So, support this corner case.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Worth a comment in the code why we need this? Either way:

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


