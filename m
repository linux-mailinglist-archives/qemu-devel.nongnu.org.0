Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1BD44E5A6
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 12:39:28 +0100 (CET)
Received: from localhost ([::1]:42524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlUtz-0004dG-9B
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 06:39:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mlUt5-0003oa-TQ
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:38:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mlUt1-0001j7-LM
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:38:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636717105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=52uo0Bxw+j8SuaLywxAcQfiO/qAfqfMRlqofKg11Y+Q=;
 b=XjxJ1mw+6ZSyyVsF1QTO+OPyjOnb3XqQjgHzhYWrNsQrd+hzs4O9i5IeHWBX984OBVQP4k
 X9wA/yIxie0ywqXv1C4kOOBSXddG6044G9OFsem0ijwfjO9FeTrOFfFtKcBQYqTnFfY+Ai
 2JjSXNWpjXfE93Nsq/cHA6FcywI0BZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-OKkQx6GYMVKaOKLIkaRNhQ-1; Fri, 12 Nov 2021 06:38:22 -0500
X-MC-Unique: OKkQx6GYMVKaOKLIkaRNhQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50E2D1023F4E;
 Fri, 12 Nov 2021 11:38:21 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.237])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CF595C1B4;
 Fri, 12 Nov 2021 11:38:00 +0000 (UTC)
Date: Fri, 12 Nov 2021 12:37:59 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, yc-core@yandex-team.ru,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 01/10] vhost-user-blk: reconnect on any error during
 realize
Message-ID: <YY5SF0uPkoEvX9qM@redhat.com>
References: <20211111153354.18807-1-rvkagan@yandex-team.ru>
 <20211111153354.18807-2-rvkagan@yandex-team.ru>
 <YY1YXrCPgt+Fcb2+@redhat.com> <YY4aGok6e8Z6BRQu@rvkaganb.lan>
MIME-Version: 1.0
In-Reply-To: <YY4aGok6e8Z6BRQu@rvkaganb.lan>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 12.11.2021 um 08:39 hat Roman Kagan geschrieben:
> On Thu, Nov 11, 2021 at 06:52:30PM +0100, Kevin Wolf wrote:
> > Am 11.11.2021 um 16:33 hat Roman Kagan geschrieben:
> > > vhost-user-blk realize only attempts to reconnect if the previous
> > > connection attempt failed on "a problem with the connection and not an
> > > error related to the content (which would fail again the same way in the
> > > next attempt)".
> > > 
> > > However this distinction is very subtle, and may be inadvertently broken
> > > if the code changes somewhere deep down the stack and a new error gets
> > > propagated up to here.
> > > 
> > > OTOH now that the number of reconnection attempts is limited it seems
> > > harmless to try reconnecting on any error.
> > > 
> > > So relax the condition of whether to retry connecting to check for any
> > > error.
> > > 
> > > This patch amends a527e312b5 "vhost-user-blk: Implement reconnection
> > > during realize".
> > > 
> > > Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> > 
> > It results in less than perfect error messages. With a modified export
> > that just crashes qemu-storage-daemon during get_features, I get:
> > 
> > qemu-system-x86_64: -device vhost-user-blk-pci,chardev=c: Failed to read msg header. Read 0 instead of 12. Original request 1.
> > qemu-system-x86_64: -device vhost-user-blk-pci,chardev=c: Reconnecting after error: vhost_backend_init failed: Protocol error
> > qemu-system-x86_64: -device vhost-user-blk-pci,chardev=c: Reconnecting after error: Failed to connect to '/tmp/vsock': Connection refused
> > qemu-system-x86_64: -device vhost-user-blk-pci,chardev=c: Reconnecting after error: Failed to connect to '/tmp/vsock': Connection refused
> > qemu-system-x86_64: -device vhost-user-blk-pci,chardev=c: Failed to connect to '/tmp/vsock': Connection refused
> 
> This patch doesn't change any error messages.  Which ones specifically
> became less than perfect as a result of this patch?

But it adds error messages (for each retry), which are different from
the first error message. As I said this is not the end of the world, but
maybe a bit more confusing.

> > I guess this might be tolerable. On the other hand, the patch doesn't
> > really fix anything either, but just gets rid of possible subtleties.
> 
> The remaining patches in the series make other errors beside -EPROTO
> propagate up to this point, and some (most) of them are retryable.  This
> was the reason to include this patch at the beginning of the series (I
> guess I should've mentioned that in the patch log).

I see. I hadn't looked at the rest of the series yet because I ran out
of time, but now that I'm skimming them, I see quite a few places that
use non-EPROTO, but I wonder which of them actually should be
reconnected. So far all I saw were presumably persistent errors where a
retry won't help. Can you give me some examples?

Kevin


