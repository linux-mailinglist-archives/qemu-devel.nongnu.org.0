Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA986C118B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 13:10:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peELD-0004KG-LH; Mon, 20 Mar 2023 08:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peELA-0004Js-Pb
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 08:10:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peEL8-0004rZ-FU
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 08:10:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679314212;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kNzLS6JcwDNUk5uzD9Btx7Xd7xeoYUStGmsCKwIgd0c=;
 b=KugM3lYZVQNKPekaaYvECyn26BZBTrGuON1Ek15EL53WIs71sfDMgus+wM/1/pMkQgi4MQ
 JfpqV8ZsY6PPzbG1qjXQxUzrjWUbNotiwZBI7O52nbjzrEGSqdm4eIbQOQ/8j1hvLGaL2F
 gRZU669TXAIb1mtcunI7z1GDuYmG4us=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-zrnVo_hcNaiqTnQk7ILuyw-1; Mon, 20 Mar 2023 08:10:11 -0400
X-MC-Unique: zrnVo_hcNaiqTnQk7ILuyw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 491B1185A791;
 Mon, 20 Mar 2023 12:10:11 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E8C3140EBF4;
 Mon, 20 Mar 2023 12:10:10 +0000 (UTC)
Date: Mon, 20 Mar 2023 12:10:07 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 1/3] win32: add qemu_close_to_socket()
Message-ID: <ZBhNH11aUoRTWHD1@redhat.com>
References: <20230320111412.1516419-1-marcandre.lureau@redhat.com>
 <20230320111412.1516419-2-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230320111412.1516419-2-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

On Mon, Mar 20, 2023 at 03:14:10PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Close the given file descriptor, but returns the underlying SOCKET.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  include/sysemu/os-win32.h |  1 +
>  util/oslib-win32.c        | 68 +++++++++++++++++++++------------------
>  2 files changed, 38 insertions(+), 31 deletions(-)
> 
> diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
> index e2849f88ab..95cba6b284 100644
> --- a/include/sysemu/os-win32.h
> +++ b/include/sysemu/os-win32.h
> @@ -174,6 +174,7 @@ bool qemu_socket_unselect(int sockfd, Error **errp);
>  /* We wrap all the sockets functions so that we can
>   * set errno based on WSAGetLastError()
>   */
> +SOCKET qemu_close_to_socket(int fd);

Took me a while to understand what this function is actually doing.

IIUC, it assumes 'fd' was previously created by _open_osfhandle,
and close this OSF handle, leaving the SOCKET still open.

Could we call this one  'qemu_close_socket_osfhandle' and also
add a comment describing what this does.

>  
>  #undef close
>  #define close qemu_close_wrap
> diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> index 16f8a67f7e..e37276b414 100644
> --- a/util/oslib-win32.c
> +++ b/util/oslib-win32.c
> @@ -479,52 +479,58 @@ int qemu_bind_wrap(int sockfd, const struct sockaddr *addr,
>      return ret;
>  }
>  
> -
>  #undef close
> -int qemu_close_wrap(int fd)
> +SOCKET qemu_close_to_socket(int fd)
>  {
> -    int ret;
> +    SOCKET s = _get_osfhandle(fd);
>      DWORD flags = 0;
> -    SOCKET s = INVALID_SOCKET;
> -
> -    if (fd_is_socket(fd)) {
> -        s = _get_osfhandle(fd);
>  
> -        /*
> -         * If we were to just call _close on the descriptor, it would close the
> -         * HANDLE, but it wouldn't free any of the resources associated to the
> -         * SOCKET, and we can't call _close after calling closesocket, because
> -         * closesocket has already closed the HANDLE, and _close would attempt to
> -         * close the HANDLE again, resulting in a double free. We can however
> -         * protect the HANDLE from actually being closed long enough to close the
> -         * file descriptor, then close the socket itself.
> -         */
> -        if (!GetHandleInformation((HANDLE)s, &flags)) {
> -            errno = EACCES;
> -            return -1;
> -        }
> -
> -        if (!SetHandleInformation((HANDLE)s, HANDLE_FLAG_PROTECT_FROM_CLOSE, HANDLE_FLAG_PROTECT_FROM_CLOSE)) {
> -            errno = EACCES;
> -            return -1;
> -        }
> +    /*
> +     * If we were to just call _close on the descriptor, it would close the
> +     * HANDLE, but it wouldn't free any of the resources associated to the
> +     * SOCKET, and we can't call _close after calling closesocket, because
> +     * closesocket has already closed the HANDLE, and _close would attempt to
> +     * close the HANDLE again, resulting in a double free. We can however
> +     * protect the HANDLE from actually being closed long enough to close the
> +     * file descriptor, then close the socket itself.
> +     */
> +    if (!GetHandleInformation((HANDLE)s, &flags)) {
> +        errno = EACCES;
> +        return INVALID_SOCKET;
>      }
>  
> -    ret = close(fd);
> -
> -    if (s != INVALID_SOCKET && !SetHandleInformation((HANDLE)s, flags, flags)) {
> +    if (!SetHandleInformation((HANDLE)s, HANDLE_FLAG_PROTECT_FROM_CLOSE, HANDLE_FLAG_PROTECT_FROM_CLOSE)) {
>          errno = EACCES;
> -        return -1;
> +        return INVALID_SOCKET;
>      }
>  
>      /*
>       * close() returns EBADF since we PROTECT_FROM_CLOSE the underlying handle,
>       * but the FD is actually freed
>       */
> -    if (ret < 0 && (s == INVALID_SOCKET || errno != EBADF)) {
> -        return ret;
> +    if (close(fd) < 0 && errno != EBADF) {
> +        return INVALID_SOCKET;
> +    }
> +
> +    if (!SetHandleInformation((HANDLE)s, flags, flags)) {
> +        errno = EACCES;
> +        return INVALID_SOCKET;
> +    }
> +
> +    return s;
> +}
> +
> +int qemu_close_wrap(int fd)
> +{
> +    SOCKET s = INVALID_SOCKET;
> +    int ret = -1;
> +
> +    if (!fd_is_socket(fd)) {
> +        return close(fd);
>      }
>  
> +    s = qemu_close_to_socket(fd);
> +
>      if (s != INVALID_SOCKET) {
>          ret = closesocket(s);
>          if (ret < 0) {
> -- 
> 2.39.2
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


