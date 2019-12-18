Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB8A124E63
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 17:52:43 +0100 (CET)
Received: from localhost ([::1]:57256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihcZ0-0002YD-8v
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 11:52:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60762)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1ihcXn-0001Yh-Ka
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 11:51:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1ihcXl-000331-Br
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 11:51:26 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:48262
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1ihcXl-0002xb-6W
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 11:51:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576687883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4KhdTY5TR+ZGrvSLypB3faUQRTdZLrWtF4m90aJGacw=;
 b=chnm9YojZFJ9jV9nq2JRGwXR8+nwSjQ9SBe+YB7NbaeX1J8oEoIuidzA0OjW/htg1yUwPn
 TgMTV6vlyMEinHljsld9+B9PobAfTSQf5Hltfx5qNPGgfcsPw2/9Ystb03vGPuYFwm+fJ3
 cyeXV78Y/1tjgN5Ee/XLssscTjGYlN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-0NaomYnLPbGd-BT5r7rQmw-1; Wed, 18 Dec 2019 11:51:19 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 158571404BC;
 Wed, 18 Dec 2019 16:51:18 +0000 (UTC)
Received: from linux.fritz.box (ovpn-116-210.ams2.redhat.com [10.36.116.210])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 102F71000322;
 Wed, 18 Dec 2019 16:51:16 +0000 (UTC)
Date: Wed, 18 Dec 2019 17:51:15 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/3] block: eliminate BDRV_REQ_NO_SERIALISING
Message-ID: <20191218165115.GE4632@linux.fritz.box>
References: <1576675026-25046-1-git-send-email-pbonzini@redhat.com>
 <1576675026-25046-2-git-send-email-pbonzini@redhat.com>
 <20191218163636.GC4632@linux.fritz.box>
 <ebdddf75-60a7-48b2-c075-232149979776@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ebdddf75-60a7-48b2-c075-232149979776@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 0NaomYnLPbGd-BT5r7rQmw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
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
Cc: Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.12.2019 um 17:43 hat Paolo Bonzini geschrieben:
> On 18/12/19 17:37, Kevin Wolf wrote:
> >>       * passthrough flags.  */
> >> -    assert(!(flags & ~(BDRV_REQ_NO_SERIALISING | BDRV_REQ_COPY_ON_REA=
D |
> >> -                       BDRV_REQ_PREFETCH)));
> >> +    assert(!(flags & ~(BDRV_REQ_COPY_ON_READ | BDRV_REQ_PREFETCH)));
> >> =20
> >>      /* Handle Copy on Read and associated serialisation */
> >>      if (flags & BDRV_REQ_COPY_ON_READ) {
> >> @@ -1458,12 +1457,7 @@ static int coroutine_fn bdrv_aligned_preadv(Bdr=
vChild *child,
> >>          bdrv_mark_request_serialising(req, bdrv_get_cluster_size(bs))=
;
> >>      }
> >> =20
> >> -    /* BDRV_REQ_SERIALISING is only for write operation */
> >> -    assert(!(flags & BDRV_REQ_SERIALISING));
> > I think we shoud still keep this assertion as long as read requests
> > don't mark themselves as serialising when BDRV_REQ_SERIALISING is given=
.
> > Otherwise, someone might add the flag to a read request and will later
> > be surprised that it didn't work.
>=20
> I'm removing it because it's anyway tested by the earlier
>=20
>     assert(!(flags & ~(BDRV_REQ_COPY_ON_READ | BDRV_REQ_PREFETCH)));

Ah, right. Never mind then.

Kevin


