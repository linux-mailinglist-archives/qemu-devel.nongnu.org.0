Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 528044255D9
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 16:54:31 +0200 (CEST)
Received: from localhost ([::1]:34964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYUn0-0002ad-BT
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 10:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mYUky-0008J8-La
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:52:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mYUkv-00083G-CX
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:52:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633618340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0NH9jobNvwHIaCkuJqIQtKWyXJjQ06bw0AL3eueD+68=;
 b=LY26uGTLENMLnklUIecP6P1AaSOT6hrwlMLzuLb6sVmiWVx06wE4ShkOP2NYRrIb3Yx0R3
 v41nwdnX0nF+DN02vfGh1LRNXvu7s44yIi1wHB3xvgYGACZ52x25xnrCuXufyNGlhBkAuJ
 USp9PHWki8AgvZhyjgK7J5fVIkzD3oU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-BVJyYs3nM1W_YQNjZPgT9w-1; Thu, 07 Oct 2021 10:52:17 -0400
X-MC-Unique: BVJyYs3nM1W_YQNjZPgT9w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B617100C660;
 Thu,  7 Oct 2021 14:52:16 +0000 (UTC)
Received: from redhat.com (ovpn-113-216.phx2.redhat.com [10.3.113.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8F3C4180;
 Thu,  7 Oct 2021 14:52:15 +0000 (UTC)
Date: Thu, 7 Oct 2021 09:52:14 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 04/17] python/aqmp: add send_fd_scm
Message-ID: <20211007145214.ua7db2hwifhtawis@redhat.com>
References: <20210923004938.3999963-1-jsnow@redhat.com>
 <20210923004938.3999963-5-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210923004938.3999963-5-jsnow@redhat.com>
User-Agent: NeoMutt/20210205-818-e2615c
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 22, 2021 at 08:49:25PM -0400, John Snow wrote:
> The single space is indeed required to successfully transmit the file
> descriptor to QEMU.

Sending fds requires a payload of at least one byte, but I don't think
that qemu cares which byte.  Thus, while your choice of space is fine,
the commit message may be a bit misleading at implying it must be
space.

> 
> Python 3.11 removes support for calling sendmsg directly from a
> transport's socket. There is no other interface for doing this, our use
> case is, I suspect, "quite unique".
> 
> As far as I can tell, this is safe to do -- send_fd_scm is a synchronous
> function and we can be guaranteed that the async coroutines will *not* be
> running when it is invoked. In testing, it works correctly.
> 
> I investigated quite thoroughly the possibility of creating my own
> asyncio Transport (The class that ultimately manages the raw socket
> object) so that I could manage the socket myself, but this is so wildly
> invasive and unportable I scrapped the idea. It would involve a lot of
> copy-pasting of various python utilities and classes just to re-create
> the same infrastructure, and for extremely little benefit. Nah.
> 
> Just boldly void the warranty instead, while I try to follow up on
> https://bugs.python.org/issue43232

Bummer that we have to do that, but at least you are documenting the
problems and pursuing a remedy upstream.

> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/aqmp/qmp_client.py | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/python/qemu/aqmp/qmp_client.py b/python/qemu/aqmp/qmp_client.py
> index d2ad7459f9f..f987da02eb0 100644
> --- a/python/qemu/aqmp/qmp_client.py
> +++ b/python/qemu/aqmp/qmp_client.py
> @@ -9,6 +9,8 @@
>  
>  import asyncio
>  import logging
> +import socket
> +import struct
>  from typing import (
>      Dict,
>      List,
> @@ -624,3 +626,23 @@ async def execute(self, cmd: str,
>          """
>          msg = self.make_execute_msg(cmd, arguments, oob=oob)
>          return await self.execute_msg(msg)
> +
> +    @upper_half
> +    @require(Runstate.RUNNING)
> +    def send_fd_scm(self, fd: int) -> None:
> +        """
> +        Send a file descriptor to the remote via SCM_RIGHTS.
> +        """
> +        assert self._writer is not None
> +        sock = self._writer.transport.get_extra_info('socket')
> +
> +        if sock.family != socket.AF_UNIX:
> +            raise AQMPError("Sending file descriptors requires a UNIX socket.")
> +
> +        # Void the warranty sticker.
> +        # Access to sendmsg in asyncio is scheduled for removal in Python 3.11.
> +        sock = sock._sock  # pylint: disable=protected-access
> +        sock.sendmsg(
> +            [b' '],
> +            [(socket.SOL_SOCKET, socket.SCM_RIGHTS, struct.pack('@i', fd))]
> +        )

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


