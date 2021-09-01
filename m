Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC92C3FD9FA
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 15:11:33 +0200 (CEST)
Received: from localhost ([::1]:44078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLQ1c-0006M4-SR
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 09:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLPsf-0008Hr-QR
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 09:02:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLPsW-0001u2-BP
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 09:02:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630501327;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=36d7twqxIVPd10QfZ3xm4NjpdJXlzz3fh64p4Fuj2BU=;
 b=Lerfh7F3O8qNO7nxqo+gtGNmcvwDPI19IR4/9CYqtcEfoADBPKG3ArGmXIVUlXs+sWi9fQ
 qbEFZ5tSf5ZvOsk6y94VUQekLcsml3ZiT3YVR3c3NPv3jb70axJMa6Sj8bT3yskFubpppK
 j3bGO4zLjbF+LHK7FNd9XTFePPMYm18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-rrDNtaAMMh26A_o6kuJvQQ-1; Wed, 01 Sep 2021 09:02:04 -0400
X-MC-Unique: rrDNtaAMMh26A_o6kuJvQQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0136F1B2C983;
 Wed,  1 Sep 2021 13:02:03 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 350386ACED;
 Wed,  1 Sep 2021 13:01:56 +0000 (UTC)
Date: Wed, 1 Sep 2021 14:01:53 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [PATCH v2] qemu-sockets: fix unix socket path copy (again)
Message-ID: <YS95wa4y4hcKxvNu@redhat.com>
References: <20210901125055.41915-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
In-Reply-To: <20210901125055.41915-1-mjt@msgid.tls.msk.ru>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 01, 2021 at 03:50:55PM +0300, Michael Tokarev wrote:
> Commit 4cfd970ec188558daa6214f26203fe553fb1e01f added an
> assert which ensures the path within an address of a unix
> socket returned from the kernel is at least one byte and
> does not exceed sun_path buffer. Both of this constraints
> are wrong:
> 
> A unix socket can be unnamed, in this case the path is
> completely empty (not even \0)
> 
> And some implementations (notable linux) can add extra
> trailing byte (\0) _after_ the sun_path buffer if we
> passed buffer larger than it (and we do).
> 
> So remove the assertion (since it causes real-life breakage)
> but at the same time fix the usage of sun_path. Namely,
> we should not access sun_path[0] if kernel did not return
> it at all (this is the case for unnamed sockets),
> and use the returned salen when copyig actual path as an
> upper constraint for the amount of bytes to copy - this
> will ensure we wont exceed the information provided by
> the kernel, regardless whenever there is a trailing \0
> or not. This also helps with unnamed sockets.
> 
> Note the case of abstract socket, the sun_path is actually
> a blob and can contain \0 characters, - it should not be
> passed to g_strndup and the like, it should be accessed by
> memcpy-like functions.
> 
> Fixes: 4cfd970ec188558daa6214f26203fe553fb1e01f
> Fixes: http://bugs.debian.org/993145
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> CC: qemu-stable@nongnu.org
> ---
>  util/qemu-sockets.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index f2f3676d1f..842bd707ac 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -1345,13 +1345,11 @@ socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
>      SocketAddress *addr;
>      struct sockaddr_un *su = (struct sockaddr_un *)sa;
>  
> -    assert(salen >= sizeof(su->sun_family) + 1 &&
> -           salen <= sizeof(struct sockaddr_un));
> -
>      addr = g_new0(SocketAddress, 1);
>      addr->type = SOCKET_ADDRESS_TYPE_UNIX;
> +    salen -= offsetof(struct sockaddr_un, sun_path);

Adjusted salen value....

>  #ifdef CONFIG_LINUX
> -    if (!su->sun_path[0]) {
> +    if (salen > 0 && !su->sun_path[0]) {
>          /* Linux abstract socket */
>          addr->u.q_unix.path = g_strndup(su->sun_path + 1,
>                                          salen - sizeof(su->sun_family) - 1);

....still assuming the original salen value.

> @@ -1363,7 +1361,7 @@ socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
>      }
>  #endif
>  
> -    addr->u.q_unix.path = g_strndup(su->sun_path, sizeof(su->sun_path));
> +    addr->u.q_unix.path = g_strndup(su->sun_path, salen);
>      return addr;
>  }
>  #endif /* WIN32 */

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


