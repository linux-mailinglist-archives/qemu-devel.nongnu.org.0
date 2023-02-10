Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E03116923D7
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:59:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWkA-00068f-O6; Fri, 10 Feb 2023 11:59:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQWk9-00065y-1M
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:59:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQWk7-00049J-8u
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:59:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676048362;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=UCYSNLRfBXEPDj9IVbmKjLul0jJAvA1W10GThck/1m0=;
 b=hyOIiieSbKySsTOzIDrOnCfXya4lzFLLTirQHHjffzKWKmee5liyxq5kYDrBzsKJqHx4au
 HbJqr2KgnUaYxuJdDfKqXLM9mcdrCOXJEPuk3aFyoASVDvCNjy30xfV3KN72aSHb9VQGX1
 dcNiUtEMwocuorMefh4jrFe1jJfcLeQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-k0UY51uQMLShi76SPkltLw-1; Fri, 10 Feb 2023 11:59:19 -0500
X-MC-Unique: k0UY51uQMLShi76SPkltLw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 178CF857D07;
 Fri, 10 Feb 2023 16:59:19 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0183A2166B29;
 Fri, 10 Feb 2023 16:59:17 +0000 (UTC)
Date: Fri, 10 Feb 2023 16:59:15 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Nikolay Borisov <nborisov@suse.com>
Cc: dgilbert@redhat.com, qemu-devel@nongnu.org, jfehlig@suse.com,
 Claudio.Fontana@suse.com, dfaggioli@suse.com
Subject: Re: [PATCH v3 09/14] migration: add qemu_get_buffer_at
Message-ID: <Y+Z34+67WGHr62hL@redhat.com>
References: <20221028103914.908728-1-nborisov@suse.com>
 <20221028103914.908728-10-nborisov@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221028103914.908728-10-nborisov@suse.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

On Fri, Oct 28, 2022 at 01:39:09PM +0300, Nikolay Borisov wrote:
> Restoring a 'fixed-ram' enabled migration stream would require reading
> from specific offsets in the file so add a helper to QEMUFile that uses
> the newly introduced qio_channel_file_preadv.
> 
> Signed-off-by: Nikolay Borisov <nborisov@suse.com>
> ---
>  migration/qemu-file.c | 23 +++++++++++++++++++++++
>  migration/qemu-file.h |  1 +
>  2 files changed, 24 insertions(+)
> 
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index d0e0ba6150f7..b24972d5728d 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -564,6 +564,29 @@ void qemu_put_buffer_at(QEMUFile *f, const uint8_t *buf, size_t buflen, off_t po
>      return;
>  }
>  
> +
> +size_t qemu_get_buffer_at(QEMUFile *f, const uint8_t *buf, size_t buflen, off_t pos)
> +{
> +    Error *err = NULL;
> +    struct iovec iov = { .iov_base = (char *)buf, .iov_len = buflen };
> +    ssize_t ret;
> +
> +    if (f->last_error) {
> +        return 0;
> +    }
> +
> +    ret = qio_channel_io_preadv(f->ioc, &iov, 1, pos, &err);

If we have a qio_channel_io_preadv that does NOT use iovecs,
then this code gets simpler, as the iovec wrapping can be
hidden in the QIOChannel code.

> +    if (ret == -1) {
> +	    goto error;
> +    }
> +
> +    return (size_t)ret;
> +
> + error:
> +    qemu_file_set_error_obj(f, -EIO, err);
> +    return 0;
> +}
> +
>  void qemu_set_offset(QEMUFile *f, off_t off, int whence)
>  {
>      Error *err = NULL;
> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index 33cfc07b81d1..ab10c3ad7e42 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -151,6 +151,7 @@ void qemu_file_set_blocking(QEMUFile *f, bool block);
>  void qemu_set_offset(QEMUFile *f, off_t off, int whence);
>  off_t qemu_get_offset(QEMUFile *f);
>  void qemu_put_buffer_at(QEMUFile *f, const uint8_t *buf, size_t buflen, off_t pos);
> +size_t qemu_get_buffer_at(QEMUFile *f, const uint8_t *buf, size_t buflen, off_t pos);
>  
>  void ram_control_before_iterate(QEMUFile *f, uint64_t flags);
>  void ram_control_after_iterate(QEMUFile *f, uint64_t flags);
> -- 
> 2.34.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


