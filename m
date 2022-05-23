Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A83F530EB3
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 14:46:44 +0200 (CEST)
Received: from localhost ([::1]:43796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt7SM-0001Q5-E4
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 08:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nt7O5-0007Lm-Du
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:42:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nt7O1-0007Gi-Lj
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:42:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653309728;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mna3/FoPSP+3RCeJ537QIckvwOWwpdR44ozQRu/o1XI=;
 b=Rhch525+t4dQURTiY8byL5bsLfbbs48bc98PXXFRdzhhQ6O5b9wYg6fn3xDxaRlP4z4AAN
 wBXsgGZnP56lslvaIp2NEF/6Ig/19m+9F8yBpz0TUOXzpKAtMTCgWOaX+EV1nuhcCMH2bV
 8gMVGRsj+IcG2zmNQ6C5LPdyZN7TT0M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-3le13fdRMB-Zz1RtKYuNag-1; Mon, 23 May 2022 08:42:04 -0400
X-MC-Unique: 3le13fdRMB-Zz1RtKYuNag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 904BF811E80;
 Mon, 23 May 2022 12:42:04 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A06CE2026D6A;
 Mon, 23 May 2022 12:42:03 +0000 (UTC)
Date: Mon, 23 May 2022 13:42:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 05/15] osdep: export qemu_open_cloexec()
Message-ID: <YouBGRfgzlsGi99n@redhat.com>
References: <20220513180821.905149-1-marcandre.lureau@redhat.com>
 <20220513180821.905149-6-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220513180821.905149-6-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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

On Fri, May 13, 2022 at 08:08:11PM +0200, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Used in the next patch, to simplify qga code.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu/osdep.h |  1 +
>  util/osdep.c         | 10 ++++++++--
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index 67cc465416..64f51cfb7a 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -489,6 +489,7 @@ void sigaction_invoke(struct sigaction *action,
>   */
>  int qemu_open_old(const char *name, int flags, ...);
>  int qemu_open(const char *name, int flags, Error **errp);
> +int qemu_open_cloexec(const char *name, int flags, mode_t mode, Error **errp);

I don't think we should be exporting this - it is just a variant of the
'qemu_open_old' method that we wanted callers to stop using in favour
of explicitly deciding between 'qemu_open' and 'qemu_create'.

>  int qemu_create(const char *name, int flags, mode_t mode, Error **errp);
>  int qemu_close(int fd);
>  int qemu_unlink(const char *name);
> diff --git a/util/osdep.c b/util/osdep.c
> index 60fcbbaebe..545a88e1fd 100644
> --- a/util/osdep.c
> +++ b/util/osdep.c
> @@ -279,9 +279,11 @@ int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive)
>  }
>  #endif
>  
> -static int qemu_open_cloexec(const char *name, int flags, mode_t mode)
> +int qemu_open_cloexec(const char *name, int flags, mode_t mode, Error **errp)
>  {
> +    ERRP_GUARD();
>      int ret;
> +
>  #ifdef O_CLOEXEC
>      ret = open(name, flags | O_CLOEXEC, mode);
>  #else
> @@ -290,6 +292,10 @@ static int qemu_open_cloexec(const char *name, int flags, mode_t mode)
>          qemu_set_cloexec(ret);
>      }
>  #endif
> +    if (ret == -1) {
> +        error_setg_errno(errp, errno, "Failed to open file '%s'", name);
> +    }
> +

This will mean that qemu_open_internal() caller will now be overwriting
an existing error message.

>      return ret;
>  }
>  
> @@ -327,7 +333,7 @@ qemu_open_internal(const char *name, int flags, mode_t mode, Error **errp)
>      }
>  #endif
>  
> -    ret = qemu_open_cloexec(name, flags, mode);
> +    ret = qemu_open_cloexec(name, flags, mode, NULL);
>  
>      if (ret == -1) {
>          const char *action = flags & O_CREAT ? "create" : "open";
> -- 
> 2.36.1
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


