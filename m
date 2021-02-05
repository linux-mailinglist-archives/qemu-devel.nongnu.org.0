Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E113108A3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 11:04:48 +0100 (CET)
Received: from localhost ([::1]:45124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7xyp-00017P-BE
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 05:04:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1l7xvj-0007yZ-Q1
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 05:01:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1l7xvg-0001rM-P0
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 05:01:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612519290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yQWpMSvdwNObBkMA1ZynQCd5r0vJKJpXcxoo5UQMbOI=;
 b=Jage1Kwes98ffQooLA+xIeiAfSPctFDRK+6dCy42HIKEuvcv7HGR5rGT+L+2uEuGzqxkoC
 1x4MUbmZJwJhq243R/ibqJs2ZNRczmlmYN3FIzU+SyCfP7cngybibENRCR6whI1BFCd/rO
 Ac+8zxpwJkIzaPh5WS1ZklPjx2OXNc0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-tadkXNufND-bY_hQOLq2NA-1; Fri, 05 Feb 2021 05:01:27 -0500
X-MC-Unique: tadkXNufND-bY_hQOLq2NA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4F4C801965;
 Fri,  5 Feb 2021 10:01:26 +0000 (UTC)
Received: from localhost (ovpn-114-98.ams2.redhat.com [10.36.114.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3654D5C1B4;
 Fri,  5 Feb 2021 10:01:23 +0000 (UTC)
Date: Fri, 5 Feb 2021 10:01:22 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH] sockets: Use SOMAXCONN for Unix socket listen()
Message-ID: <20210205100122.GY30079@redhat.com>
References: <20210204222018.1432848-1-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210204222018.1432848-1-eblake@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 04, 2021 at 04:20:18PM -0600, Eric Blake wrote:
> Our default of a backlog of 1 connection is rather puny, particularly
> for scenarios where we expect multiple listeners to connect (such as
> qemu-nbd -e X).  For Unix sockets, there's no real harm in supporting
> a larger backlog, and a definite benefit to the clients: at least on
> Linux, a client trying to connect to a Unix socket with a backlog gets
> an EAGAIN failure with no way to poll() for when the backlog is no
> longer present short of sleeping an arbitrary amount of time before
> retrying.
> 
> See https://bugzilla.redhat.com/1925045 for a demonstration of where
> our low backlog prevents libnbd from connecting as many parallel
> clients as it wants.
> 
> Reported-by: Richard W.M. Jones <rjones@redhat.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  util/qemu-sockets.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 8af0278f15c6..a7573e9f0fda 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -1059,7 +1059,7 @@ int unix_listen(const char *str, Error **errp)
> 
>      saddr = g_new0(UnixSocketAddress, 1);
>      saddr->path = g_strdup(str);
> -    sock = unix_listen_saddr(saddr, 1, errp);
> +    sock = unix_listen_saddr(saddr, SOMAXCONN, errp);
>      qapi_free_UnixSocketAddress(saddr);
>      return sock;
>  }

Does this fix the problem with qemu-nbd?  Not for me - I still seem to
see the old behaviour with this patch applied.

Also looking more generally at util/qemu-sockets.c I think it would be
better if all of those "num" parameters were renamed "backlog".

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org


