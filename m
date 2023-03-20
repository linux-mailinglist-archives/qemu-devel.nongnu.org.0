Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1466C11AC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 13:17:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peES6-0007G7-DD; Mon, 20 Mar 2023 08:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peES4-0007Fa-Te
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 08:17:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peERu-0007QR-Mh
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 08:17:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679314633;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lOy8/hkDM5j0v8GKGZvlEhLYhdcYmNXwqUixUXIRjCU=;
 b=Xmpao5PDrh8RT1R8Jh+wptyLMkaGATQFVnpuFFJBh0D6u0MCRYMJmzSkOG8ajlSUG16UtC
 +R3Fz0Z5Sh5XU6Ba3VMMwOx2pRMESYZt1lPS09xNLaH6F2I6M/zB6UMtSqlxUmkQg8YbGv
 CDvoTIdTyLy//MhaMHQmEQ1FCfGhXfY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-rSZCAzP4PrWVU4LZzLOSvg-1; Mon, 20 Mar 2023 08:17:10 -0400
X-MC-Unique: rSZCAzP4PrWVU4LZzLOSvg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6E613815F6A;
 Mon, 20 Mar 2023 12:17:09 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B07732027061;
 Mon, 20 Mar 2023 12:17:08 +0000 (UTC)
Date: Mon, 20 Mar 2023 12:17:06 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 3/3] ui/dbus: fix passing SOCKET to GSocket API & leak
Message-ID: <ZBhOwnsGyZ0cV5rI@redhat.com>
References: <20230320111412.1516419-1-marcandre.lureau@redhat.com>
 <20230320111412.1516419-4-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230320111412.1516419-4-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Mar 20, 2023 at 03:14:12PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> -display dbus is not currently available to win32 users, so it's not
> considered a regression.
> 
> Note also the close() leak fix in case of error.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  ui/dbus.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/ui/dbus.c b/ui/dbus.c
> index 0513de9918..5389ac493f 100644
> --- a/ui/dbus.c
> +++ b/ui/dbus.c
> @@ -304,9 +304,17 @@ dbus_display_add_client(int csock, Error **errp)
>          g_cancellable_cancel(dbus_display->add_client_cancellable);
>      }
>  
> +#ifdef WIN32
> +    csock = qemu_close_to_socket(csock);
> +#endif

Happens to work because 'int' and 'SOCKET' are the same, but I feel
like this is confusing to overload one variable for two different
purposes. This confusing code pattern is the only reason why the
method in patch 1 needs to return SOCKET. 

>      socket = g_socket_new_from_fd(csock, &err);
>      if (!socket) {
>          error_setg(errp, "Failed to setup D-Bus socket: %s", err->message);
> +#ifdef WIN32
> +        closesocket(csock);
> +#else
> +        close(csock);
> +#endif

IMHO it would be clearer to write it as

  #ifdef WIN32
  socket = g_socket_new_from_fd(_get_osfhandle(csock), &err);
  #else
  socket = g_socket_new_from_fd(csock, &err);
  #endif

  if (!socket) {
     error_setg(errp, "Failed to setup D-Bus socket: %s", err->message);
     close(csock);
     return ...
  }

  #ifdef WIN32
  /* socket owns the SOCKET handle now, so release our osf handle */
  qemu_close_socket_osfhandle(csock);
  #endif

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


