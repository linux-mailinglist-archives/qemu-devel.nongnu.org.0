Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAC56AE356
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:50:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYdx-0003lc-A2; Tue, 07 Mar 2023 09:50:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pZYdt-0003l6-Cx
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:50:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pZYdr-00035k-GS
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:50:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678200614;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=exv6IBpbIQ6Up2imCps4zSQtC0tCLYvfs4DkWyUNqys=;
 b=bMRLC+PARDfc9dtSgQON3LAtXvK5ONPUYe/IUw0M1iclQN2x9uEYjIEjHPkxy9DtUgILQM
 8jw6wNoEOYDW2caWhY2aWw3SMMbMfLYhZKc85/9JwcRZoJqycQJ6aRE3p4c9Bsv531LBCo
 EZPqYLVDMtIkibId5BcKLGDaAMk3Sf8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-gBX79MgwPyiO4vxzcd0CBw-1; Tue, 07 Mar 2023 09:50:11 -0500
X-MC-Unique: gBX79MgwPyiO4vxzcd0CBw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1547E87B2A2;
 Tue,  7 Mar 2023 14:50:11 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C87A81121331;
 Tue,  7 Mar 2023 14:50:08 +0000 (UTC)
Date: Tue, 7 Mar 2023 14:50:06 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v4 04/11] osdep: implement qemu_socketpair() for win32
Message-ID: <ZAdPHkheoRweyYzw@redhat.com>
References: <20230306122751.2355515-1-marcandre.lureau@redhat.com>
 <20230306122751.2355515-5-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230306122751.2355515-5-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Mon, Mar 06, 2023 at 04:27:44PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Manually implement a socketpair() function, using UNIX sockets and
> simple peer credential checking.
> 
> QEMU doesn't make much use of socketpair, beside vhost-user which is not
> available for win32 at this point. However, I intend to use it for
> writing some new portable tests.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu/sockets.h |   2 -
>  util/oslib-win32.c     | 110 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 110 insertions(+), 2 deletions(-)
> 
> diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
> index 2b0698a7c9..d935fd80da 100644
> --- a/include/qemu/sockets.h
> +++ b/include/qemu/sockets.h
> @@ -15,7 +15,6 @@ int inet_aton(const char *cp, struct in_addr *ia);
>  bool fd_is_socket(int fd);
>  int qemu_socket(int domain, int type, int protocol);
>  
> -#ifndef WIN32
>  /**
>   * qemu_socketpair:
>   * @domain: specifies a communication domain, such as PF_UNIX
> @@ -30,7 +29,6 @@ int qemu_socket(int domain, int type, int protocol);
>   * Return 0 on success.
>   */
>  int qemu_socketpair(int domain, int type, int protocol, int sv[2]);
> -#endif
>  
>  int qemu_accept(int s, struct sockaddr *addr, socklen_t *addrlen);
>  /*
> diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> index 29a667ae3d..16f8a67f7e 100644
> --- a/util/oslib-win32.c
> +++ b/util/oslib-win32.c
> @@ -310,6 +310,116 @@ bool qemu_socket_unselect(int sockfd, Error **errp)
>      return qemu_socket_select(sockfd, NULL, 0, errp);
>  }
>  
> +int qemu_socketpair(int domain, int type, int protocol, int sv[2])
> +{
> +    struct sockaddr_un addr = {
> +        0,
> +    };
> +    socklen_t socklen;
> +    int listener = -1;
> +    int client = -1;
> +    int server = -1;
> +    g_autofree char *path = NULL;
> +    int tmpfd;
> +    u_long arg;
> +    int ret = -1;
> +
> +    g_return_val_if_fail(sv != NULL, -1);
> +
> +    addr.sun_family = AF_UNIX;
> +    socklen = sizeof(addr);
> +
> +    tmpfd = g_file_open_tmp(NULL, &path, NULL);
> +    if (tmpfd == -1 || !path) {
> +        errno = EACCES;
> +        goto out;
> +    }
> +
> +    close(tmpfd);
> +
> +    if (strlen(path) >= sizeof(addr.sun_path)) {
> +        errno = EINVAL;
> +        goto out;
> +    }
> +
> +    strncpy(addr.sun_path, path, sizeof(addr.sun_path) - 1);
> +
> +    listener = socket(domain, type, protocol);
> +    if (listener == -1) {
> +        goto out;
> +    }
> +
> +    if (DeleteFile(path) == 0 && GetLastError() != ERROR_FILE_NOT_FOUND) {
> +        errno = EACCES;
> +        goto out;
> +    }
> +    g_clear_pointer(&path, g_free);
> +
> +    if (bind(listener, (struct sockaddr *)&addr, socklen) == -1) {
> +        goto out;
> +    }
> +
> +    if (listen(listener, 1) == -1) {
> +        goto out;
> +    }
> +
> +    client = socket(domain, type, protocol);
> +    if (client == -1) {
> +        goto out;
> +    }
> +
> +    arg = 1;
> +    if (ioctlsocket(client, FIONBIO, &arg) != NO_ERROR) {
> +        goto out;
> +    }
> +
> +    if (connect(client, (struct sockaddr *)&addr, socklen) == -1 &&
> +        WSAGetLastError() != WSAEWOULDBLOCK) {
> +        goto out;
> +    }
> +
> +    server = accept(listener, NULL, NULL);
> +    if (server == -1) {
> +        goto out;
> +    }

In theory at this point 'client' if connect() returned WSAEWOULDBLOCK,
then at this point it should be fully connected. I wonder if that is
actually guaranteed though, or should we do something to validate
there's no race condition ?

> +
> +    arg = 0;
> +    if (ioctlsocket(client, FIONBIO, &arg) != NO_ERROR) {
> +        goto out;
> +    }
> +
> +    arg = 0;
> +    if (ioctlsocket(client, SIO_AF_UNIX_GETPEERPID, &arg) != NO_ERROR) {
> +        goto out;
> +    }

Maybe this will force a synchronization point ?

Alteratively select() + getsockopt(SO_ERROR) is what we used to
do to check for connect() completion (logic removed now but can
be seen in b2587932582333197c88bf663785b19f441989d7)



> +
> +    if (arg != GetCurrentProcessId()) {
> +        errno = EPERM;
> +        goto out;
> +    }
> +
> +    sv[0] = server;
> +    server = -1;
> +    sv[1] = client;
> +    client = -1;
> +    ret = 0;
> +
> +out:
> +    if (listener != -1) {
> +        close(listener);
> +    }
> +    if (client != -1) {
> +        close(client);
> +    }
> +    if (server != -1) {
> +        close(server);
> +    }
> +    if (path) {
> +        DeleteFile(path);
> +    }
> +    return ret;
> +}
> +
>  #undef connect
>  int qemu_connect_wrap(int sockfd, const struct sockaddr *addr,
>                        socklen_t addrlen)
> -- 
> 2.39.2
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


