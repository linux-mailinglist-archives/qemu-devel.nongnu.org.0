Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EB45188F8
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 17:46:19 +0200 (CEST)
Received: from localhost ([::1]:50676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlujC-0004Cb-Cb
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 11:46:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nlufy-00019w-Ns
 for qemu-devel@nongnu.org; Tue, 03 May 2022 11:42:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nlufw-0006ww-Of
 for qemu-devel@nongnu.org; Tue, 03 May 2022 11:42:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651592576;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cpAnUMdaXTZzQicn+341w+3yzdNsi/YpoXzP4Zvl8K8=;
 b=X6mF8oQvTFN9264IzDm34oLiizhUBTbG75Oi9BMFt0IyI/xUQD/SVjuBwyjWGwmRc6AWMA
 Jvr9aewPya4StwBaLu2nRg/EKX3iXTmHFcIz+DxiBPd7NZPT7pUANRyr+FZCBBmczTYiiP
 svQl1JHepR0Np8ec6igEbcCCdT+pm4s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-P_BbkmRQMyOKUF0NufWlZw-1; Tue, 03 May 2022 11:42:43 -0400
X-MC-Unique: P_BbkmRQMyOKUF0NufWlZw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0BEAAE9F01;
 Tue,  3 May 2022 13:13:09 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B26141537DFC;
 Tue,  3 May 2022 13:13:08 +0000 (UTC)
Date: Tue, 3 May 2022 14:13:05 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vitaly Cheptsov <cheptsov@ispras.ru>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] net: fix multicast support with BSD (macOS) socket
 implementations
Message-ID: <YnEqYRUpnZCIBfet@redhat.com>
References: <20220502003830.31062-1-cheptsov@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220502003830.31062-1-cheptsov@ispras.ru>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 02, 2022 at 03:38:30AM +0300, Vitaly Cheptsov wrote:
> This patch fixes socket communication with QEMU -> host on macOS,
> which was originally impossible due to QEMU and host program
> having to bind to the same ip/port in a way not supported by BSD
> sockets. The change was tested on both Linux and macOS.
> 
> As per BSD manual pages SO_REUSEPORT allows completely duplicate
> bindings by multiple processes, permitting multiple instances of
> a program to each receive UDP/IP multicast datagrams destined
> for the bound port. Without this option macOS, unlike Linux,
> which (ab)uses SO_REUSEADDR for this purpose, will return
> "Address already in use" on bind().


When looking in Google there's a comprehensive looking
description of SO_REUSEADDR + SO_REUSEPORT across all the
different OS which insists that SO_REUSEPORT and SO_REUSEADDR
are functionally equivalent for multicast IP addresses:

  https://stackoverflow.com/questions/14388706/how-do-so-reuseaddr-and-so-reuseport-differ

And AFAIK, macOS should behave the same way, which suggests
this patch is not needed.

Oddly though, I don't find this in the FreeBSD man page - its
description seems fairly clear that SO_REUSEPORT is needed for
multicast

[quote]
     SO_REUSEPORT allows completely duplicate bindings by multiple processes
     if they all set SO_REUSEPORT before binding the port.  This option
     permits multiple instances of a program to each receive UDP/IP multicast
     or broadcast datagrams destined for the bound port.
[/quote]


> 
> As per BSD manual pages binding to any address, even one not bound
> to any available network interface in the system, should be
> IP_BINDANY. Without binding to INADDR_ANY macOS will return
> "Can't assign requested address" on send().

I didn't find a quote about this in the FreeBSD man pages I looked
at, and it feels dubious to me. If the user gives QEMU a address to
bind to, we should surely be honouring that, not changing it to
INADDR_ANY.

If using INADDR_ANY though, thsi could explain the need for
SO_REUSEPORT, since INADDR_ANY is not a designated mcast address.

> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Daniel P. Berrange <berrange@redhat.com>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Vitaly Cheptsov <cheptsov@ispras.ru>
> ---
>  net/socket.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/net/socket.c b/net/socket.c
> index ea5220a2eb..8b2c6c4bb8 100644
> --- a/net/socket.c
> +++ b/net/socket.c
> @@ -252,10 +252,24 @@ static int net_socket_mcast_create(struct sockaddr_in *mcastaddr,
>          goto fail;
>      }
>  
> -    ret = bind(fd, (struct sockaddr *)mcastaddr, sizeof(*mcastaddr));
> +    val = 1;
> +    ret = qemu_setsockopt(fd, SOL_SOCKET, SO_REUSEPORT, &val, sizeof(val));
> +    if (ret < 0) {
> +        error_setg_errno(errp, errno,
> +                         "can't set socket option SO_REUSEPORT");
> +        goto fail;
> +    }

AFAIK, this likely won't compile on Windows since it lacks SO_REUSEPORT

> +
> +    struct sockaddr_in bindaddr;
> +    memset(&bindaddr, 0, sizeof(bindaddr));
> +    bindaddr.sin_family = AF_INET;
> +    bindaddr.sin_addr.s_addr = htonl(INADDR_ANY);
> +    bindaddr.sin_port = mcastaddr->sin_port;
> +    ret = bind(fd, (struct sockaddr *)&bindaddr, sizeof(bindaddr));
> +
>      if (ret < 0) {
>          error_setg_errno(errp, errno, "can't bind ip=%s to socket",
> -                         inet_ntoa(mcastaddr->sin_addr));
> +                         inet_ntoa(bindaddr.sin_addr));
>          goto fail;
>      }


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


