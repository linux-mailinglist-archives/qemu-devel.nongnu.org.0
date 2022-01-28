Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A36F94A02FB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 22:37:54 +0100 (CET)
Received: from localhost ([::1]:57338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDYwL-00040X-G6
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 16:37:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nDYng-00005E-J0
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 16:28:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nDYml-0001K0-Ol
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 16:28:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643405258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u2eA1jBWU29BDG3sCRO7j1EHyS7zja4EsZ/sq/VMB1Q=;
 b=Fx2o568FWWsnpgZ6FB+uosdMnQZHMSaUP3jTUClBPZjLHBM7hXUYBC6nl6F1fFwNtFTWhT
 FjwPOn2Uz2SATMqWdZEnKRvX6iZ4y+OtFKMPGiGI6HqmJiS3L3KYSgZwcZ3uF4E8OudkRW
 uVjVqBGYGHIIVBQREC1BKJejAhBTXqg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-EZRPa0Q8PLyFN-AntDOgwg-1; Fri, 28 Jan 2022 16:27:35 -0500
X-MC-Unique: EZRPa0Q8PLyFN-AntDOgwg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E236C1091DA0;
 Fri, 28 Jan 2022 21:27:33 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3D82610AF;
 Fri, 28 Jan 2022 21:27:30 +0000 (UTC)
Date: Fri, 28 Jan 2022 15:27:28 -0600
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [RFC] block/nbd: Move s->ioc on AioContext change
Message-ID: <20220128212728.vsiysj2vvpl5utdm@redhat.com>
References: <20220128155130.13326-1-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220128155130.13326-1-hreitz@redhat.com>
User-Agent: NeoMutt/20211029-256-77b59a
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.167, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 28, 2022 at 04:51:30PM +0100, Hanna Reitz wrote:
> s->ioc must always be attached to the NBD node's AioContext.  If that
> context changes, s->ioc must be attached to the new context.

Eww.  Good catch; and looks like it is not the first time where we've
run into issues (a quick grep for context through git history of nbd/
finds commit e6cada923).

> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1990835
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
> This is an RFC because I believe there are some other things in the NBD
> block driver that need attention on an AioContext change, too.  Namely,
> there are two timers (reconnect_delay_timer and open_timer) that are

As Vladimir is more familiar with the timers needed for reconnecting
an NBD connection, I'm hoping he will chime in.  But yes, your worry
about context changes sounds reasonable.

> also attached to the node's AioContext, and I'm afraid they need to be
> handled, too.  Probably pause them on detach, and resume them on attach,
> but I'm not sure, which is why I'm posting this as an RFC to get some
> comments from that from someone who knows this code better than me. :)
> 
> (Also, in a real v1, of course I'd want to add a regression test.)
> ---
>  block/nbd.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index 63dbfa807d..119a774c04 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -2036,6 +2036,25 @@ static void nbd_cancel_in_flight(BlockDriverState *bs)
>      nbd_co_establish_connection_cancel(s->conn);
>  }
>  
> +static void nbd_attach_aio_context(BlockDriverState *bs,
> +                                   AioContext *new_context)
> +{
> +    BDRVNBDState *s = bs->opaque;
> +
> +    if (s->ioc) {
> +        qio_channel_attach_aio_context(s->ioc, new_context);
> +    }
> +}
> +
> +static void nbd_detach_aio_context(BlockDriverState *bs)
> +{
> +    BDRVNBDState *s = bs->opaque;
> +
> +    if (s->ioc) {
> +        qio_channel_detach_aio_context(s->ioc);
> +    }
> +}
> +
>  static BlockDriver bdrv_nbd = {
>      .format_name                = "nbd",
>      .protocol_name              = "nbd",
> @@ -2059,6 +2078,9 @@ static BlockDriver bdrv_nbd = {
>      .bdrv_dirname               = nbd_dirname,
>      .strong_runtime_opts        = nbd_strong_runtime_opts,
>      .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
> +
> +    .bdrv_attach_aio_context    = nbd_attach_aio_context,
> +    .bdrv_detach_aio_context    = nbd_detach_aio_context,

Looks straightforward, but as you say, fleshing out what else may need
similar treatment could make the "real" v1 more interesting.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


