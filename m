Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A0D10E7FE
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 10:54:32 +0100 (CET)
Received: from localhost ([::1]:33014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibiPW-0004xS-Pn
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 04:54:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57214)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jfreimann@redhat.com>) id 1ibiOZ-0004TU-G0
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 04:53:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jfreimann@redhat.com>) id 1ibiOX-0006tB-Na
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 04:53:30 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:35830
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jfreimann@redhat.com>)
 id 1ibiOX-0006si-JG
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 04:53:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575280408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=REHhBQX/67xMHa5F9m8jvUB43KftUKZxVPiUxXQy1K8=;
 b=GQGM+mAS2wfWQCs1tq6vunVbIkILqtr4kcTj2JmfQlwEqBUJ3xuM1q69kZNxnLEz1oZOzg
 xT+qNG/AjBvKkraIznstj5Mg2lUNfJRHEDU1RrWRs/nvEPQNP3i5DPmFMu5g9FjXm/R1MK
 OKaAS9kAbLPiy1zyFwqaFCGttC0f21c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-CZgoHSWxPSGMCW4DGd-WJA-1; Mon, 02 Dec 2019 04:53:27 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70D69800D4E;
 Mon,  2 Dec 2019 09:53:26 +0000 (UTC)
Received: from localhost (dhcp-192-223.str.redhat.com [10.33.192.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6625819756;
 Mon,  2 Dec 2019 09:53:23 +0000 (UTC)
Date: Mon, 2 Dec 2019 10:53:22 +0100
From: Jens Freimann <jfreimann@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 02/21] net/virtio: Fix failover error handling crash bugs
Message-ID: <20191202095322.lsun3mhqetfzrd2p@jenstp.localdomain>
References: <20191130194240.10517-1-armbru@redhat.com>
 <20191130194240.10517-3-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191130194240.10517-3-armbru@redhat.com>
User-Agent: NeoMutt/20180716-1376-5d6ed1
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: CZgoHSWxPSGMCW4DGd-WJA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii; format=flowed
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
Cc: vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Nov 30, 2019 at 08:42:21PM +0100, Markus Armbruster wrote:
>Functions that take an Error ** parameter to pass an error to the
>caller expect the parameter to point to null.
>failover_replug_primary() violates this precondition in several
>places:
>
>* After qemu_opts_from_qdict() failed, *errp is no longer null.
>  Passing it to error_setg() is wrong, and will trip the assertion in
>  error_setv().  Messed up in commit 150ab54aa6 "net/virtio: fix
>  re-plugging of primary device".  Simply drop the error_setg().
>
>* Passing @errp to qemu_opt_set_bool(), hotplug_handler_pre_plug(),
>  and hotplug_handler_plug() is wrong.  If one of the first two fails,
>  *errp is no longer null.  Risks tripping the same assertion.
>  Moreover, continuing after such errors is unsafe.  Messed up in
>  commit 9711cd0dfc "net/virtio: add failover support".  Fix by
>  handling each error properly.
>
>failover_replug_primary() crashes when passed a null @errp.  Also
>messed up in commit 9711cd0dfc.  This bug can't bite as no caller
>actually passes null.  Fix it anyway.
>
>Fixes: 9711cd0dfc3fa414f7f64935713c07134ae67971
>Fixes: 150ab54aa6934583180f88a2bd540bc6fc4fbff3
>Cc: Jens Freimann <jfreimann@redhat.com>
>Cc: Michael S. Tsirkin <mst@redhat.com>
>Signed-off-by: Markus Armbruster <armbru@redhat.com>
>---
> hw/net/virtio-net.c | 19 +++++++++++++------
> 1 file changed, 13 insertions(+), 6 deletions(-)
>

Thanks Markus!

Reviewed-by: Jens Freimann <jfreimann@redhat.com>



