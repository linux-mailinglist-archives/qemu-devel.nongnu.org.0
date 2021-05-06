Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDBD375808
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 17:58:45 +0200 (CEST)
Received: from localhost ([::1]:54846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1legOi-0007IF-CB
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 11:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1legDR-0004fa-2K
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:47:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1legDN-00040S-3g
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:47:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620316019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cy2b1C7IMezTs+CmJkmqRJ36JMdyVSqDDevPY/3x6Ks=;
 b=dm5hrFoaBi9K+GZKfDi2TUuOMtWFIVJpsCmDb1UoFzXOs90/6ylSz6m/XFD5MBP6XRlerL
 lO/IG9CsgmsG8Oc4EalZqeTK9fCEoxVK4KZRe88wkUj2UuiLGCefPVAymLAe6+0FwKexeG
 oLrr6CCI3Yfa/EvtxuN19Yt0HRKaZfs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-a26hagt0MjuLPjfMa0kTIg-1; Thu, 06 May 2021 11:46:57 -0400
X-MC-Unique: a26hagt0MjuLPjfMa0kTIg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8019E8015C6;
 Thu,  6 May 2021 15:46:56 +0000 (UTC)
Received: from work-vm (ovpn-115-37.ams2.redhat.com [10.36.115.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 428185D6AC;
 Thu,  6 May 2021 15:46:48 +0000 (UTC)
Date: Thu, 6 May 2021 16:46:45 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] virtiofsd: Fix side-effect in assert()
Message-ID: <YJQPZcyfM6DAtHcn@work-vm>
References: <20210409100627.451573-1-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210409100627.451573-1-groug@kaod.org>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, misono.tomohiro@jp.fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Greg Kurz (groug@kaod.org) wrote:
> It is bad practice to put an expression with a side-effect in
> assert() because the side-effect won't happen if the code is
> compiled with -DNDEBUG.
> 
> Use an intermediate variable. Consolidate this in an macro to
> have proper line numbers when the assertion is hit.
> 
> virtiofsd: ../../tools/virtiofsd/passthrough_ll.c:2797: lo_getxattr:
>  Assertion `fchdir_res == 0' failed.
> Aborted
> 
>   2796          /* fchdir should not fail here */
> =>2797          FCHDIR_NOFAIL(lo->proc_self_fd);
>   2798          ret = getxattr(procname, name, value, size);
>   2799          FCHDIR_NOFAIL(lo->root.fd);
> 
> Fixes: bdfd66788349 ("virtiofsd: Fix xattr operations")
> Cc: misono.tomohiro@jp.fujitsu.com
> Signed-off-by: Greg Kurz <groug@kaod.org>

Queued

> ---
>  tools/virtiofsd/passthrough_ll.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 1553d2ef454f..6592f96f685e 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -2723,6 +2723,11 @@ static int xattr_map_server(const struct lo_data *lo, const char *server_name,
>      return -ENODATA;
>  }
>  
> +#define FCHDIR_NOFAIL(fd) do {                         \
> +        int fchdir_res = fchdir(fd);                   \
> +        assert(fchdir_res == 0);                       \
> +    } while (0)
> +
>  static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>                          size_t size)
>  {
> @@ -2789,9 +2794,9 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>          ret = fgetxattr(fd, name, value, size);
>      } else {
>          /* fchdir should not fail here */
> -        assert(fchdir(lo->proc_self_fd) == 0);
> +        FCHDIR_NOFAIL(lo->proc_self_fd);
>          ret = getxattr(procname, name, value, size);
> -        assert(fchdir(lo->root.fd) == 0);
> +        FCHDIR_NOFAIL(lo->root.fd);
>      }
>  
>      if (ret == -1) {
> @@ -2864,9 +2869,9 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
>          ret = flistxattr(fd, value, size);
>      } else {
>          /* fchdir should not fail here */
> -        assert(fchdir(lo->proc_self_fd) == 0);
> +        FCHDIR_NOFAIL(lo->proc_self_fd);
>          ret = listxattr(procname, value, size);
> -        assert(fchdir(lo->root.fd) == 0);
> +        FCHDIR_NOFAIL(lo->root.fd);
>      }
>  
>      if (ret == -1) {
> @@ -3000,9 +3005,9 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>          ret = fsetxattr(fd, name, value, size, flags);
>      } else {
>          /* fchdir should not fail here */
> -        assert(fchdir(lo->proc_self_fd) == 0);
> +        FCHDIR_NOFAIL(lo->proc_self_fd);
>          ret = setxattr(procname, name, value, size, flags);
> -        assert(fchdir(lo->root.fd) == 0);
> +        FCHDIR_NOFAIL(lo->root.fd);
>      }
>  
>      saverr = ret == -1 ? errno : 0;
> @@ -3066,9 +3071,9 @@ static void lo_removexattr(fuse_req_t req, fuse_ino_t ino, const char *in_name)
>          ret = fremovexattr(fd, name);
>      } else {
>          /* fchdir should not fail here */
> -        assert(fchdir(lo->proc_self_fd) == 0);
> +        FCHDIR_NOFAIL(lo->proc_self_fd);
>          ret = removexattr(procname, name);
> -        assert(fchdir(lo->root.fd) == 0);
> +        FCHDIR_NOFAIL(lo->root.fd);
>      }
>  
>      saverr = ret == -1 ? errno : 0;
> -- 
> 2.26.3
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


