Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8447A334641
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 19:08:02 +0100 (CET)
Received: from localhost ([::1]:53892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK3FZ-0006PP-HE
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 13:08:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1lK34Z-0005dx-Uq
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:56:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1lK34T-0002Yq-3O
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:56:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615398990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fNKGKfvfLirnhAjT3LHb9xz//kGe1I7fYty+ALoUSQA=;
 b=VdtwCxTJINax1B8PZmlU39xEb12fp7LQwGFKw01Od6rCh9QpXRHs3ttvnmFUrf+KfsldUF
 V9e4HuJ056J9PqYhHQrUr5HsP2f/VOSfdbuw61MFG1ln3t73QrCFbRzQjE2sAF1vPRPYuK
 8GOFhHLqok5G4zKLwZvLgFXLgMAqjNo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-SOeCMap4PMSSyoZapW1eLw-1; Wed, 10 Mar 2021 12:56:28 -0500
X-MC-Unique: SOeCMap4PMSSyoZapW1eLw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 426822F7A2
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 17:56:27 +0000 (UTC)
Received: from localhost (ovpn-114-91.ams2.redhat.com [10.36.114.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA6FF59453;
 Wed, 10 Mar 2021 17:56:20 +0000 (UTC)
Date: Wed, 10 Mar 2021 17:56:19 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] sockets: update SOCKET_ADDRESS_TYPE_FD listen(2) backlog
Message-ID: <20210310175619.GS26415@redhat.com>
References: <20210310173004.420190-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210310173004.420190-1-stefanha@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 05:30:04PM +0000, Stefan Hajnoczi wrote:
> socket_get_fd() fails with the error "socket_get_fd: too many
> connections" if the given listen backlog value is not 1.
> 
> Not all callers set the backlog to 1. For example, commit
> 582d4210eb2f2ab5baac328fe4b479cd86da1647 ("qemu-nbd: Use SOMAXCONN for
> socket listen() backlog") uses SOMAXCONN. This will always fail with in
> socket_get_fd().
> 
> This patch calls listen(2) on the fd to update the backlog value. The
> socket may already be in the listen state. I have tested that this works
> on Linux 5.10 and macOS Catalina.
> 
> As a bonus this allows us to detect when the fd cannot listen. Now we'll
> be able to catch unbound or connected fds in socket_listen().
> 
> Drop the num argument from socket_get_fd() since this function is also
> called by socket_connect() where a listen backlog value does not make
> sense.
> 
> Fixes: e5b6353cf25c99c3f08bf51e29933352f7140e8f ("socket: Add backlog parameter to socket_listen")
> Reported-by: Richard W.M. Jones <rjones@redhat.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Eric Blake <eblake@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

I can confirm it fixes the problem found by the libnbd interop test, so:

Tested-by: Richard W.M. Jones <rjones@redhat.com>

Rich.

> ---
>  util/qemu-sockets.c | 29 ++++++++++++++++++++++-------
>  1 file changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 8af0278f15..2463c49773 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -1116,14 +1116,10 @@ fail:
>      return NULL;
>  }
>  
> -static int socket_get_fd(const char *fdstr, int num, Error **errp)
> +static int socket_get_fd(const char *fdstr, Error **errp)
>  {
>      Monitor *cur_mon = monitor_cur();
>      int fd;
> -    if (num != 1) {
> -        error_setg_errno(errp, EINVAL, "socket_get_fd: too many connections");
> -        return -1;
> -    }
>      if (cur_mon) {
>          fd = monitor_get_fd(cur_mon, fdstr, errp);
>          if (fd < 0) {
> @@ -1159,7 +1155,7 @@ int socket_connect(SocketAddress *addr, Error **errp)
>          break;
>  
>      case SOCKET_ADDRESS_TYPE_FD:
> -        fd = socket_get_fd(addr->u.fd.str, 1, errp);
> +        fd = socket_get_fd(addr->u.fd.str, errp);
>          break;
>  
>      case SOCKET_ADDRESS_TYPE_VSOCK:
> @@ -1187,7 +1183,26 @@ int socket_listen(SocketAddress *addr, int num, Error **errp)
>          break;
>  
>      case SOCKET_ADDRESS_TYPE_FD:
> -        fd = socket_get_fd(addr->u.fd.str, num, errp);
> +        fd = socket_get_fd(addr->u.fd.str, errp);
> +        if (fd < 0) {
> +            return -1;
> +        }
> +
> +        /*
> +         * If the socket is not yet in the listen state, then transition it to
> +         * the listen state now.
> +         *
> +         * If it's already listening then this updates the backlog value as
> +         * requested.
> +         *
> +         * If this socket cannot listen because it's already in another state
> +         * (e.g. unbound or connected) then we'll catch the error here.
> +         */
> +        if (listen(fd, num) != 0) {
> +            error_setg_errno(errp, errno, "Failed to listen on fd socket");
> +            closesocket(fd);
> +            return -1;
> +        }
>          break;
>  
>      case SOCKET_ADDRESS_TYPE_VSOCK:
> -- 
> 2.29.2
> 

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top


