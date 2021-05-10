Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC13377E6E
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 10:43:25 +0200 (CEST)
Received: from localhost ([::1]:58816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg1Vc-0008DP-0q
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 04:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lg1UE-0007NK-S8
 for qemu-devel@nongnu.org; Mon, 10 May 2021 04:41:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lg1UB-0003Y9-5d
 for qemu-devel@nongnu.org; Mon, 10 May 2021 04:41:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620636113;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=zrVSAQs0kbtn1GqqTKtdkfmJ8YF4yZ2Hf0z6JCs0CVE=;
 b=TVPF95kYadXOYEmTEyEDU3twkKXF9M81NkYZ1lHxTVwffbOU8vGQzpAXFi7umKS6oav2qq
 kPZul5if0nHOZNuzLCtMUuDuyP4Szb0117KBElqRcHyHls0y9vq6C4DOBfjLS35fT7xPdm
 93I9l8flrB6BZaQij3LK/wsWJmGQztY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-Ukg_s4asOJyuFaoMlfk1LA-1; Mon, 10 May 2021 04:41:48 -0400
X-MC-Unique: Ukg_s4asOJyuFaoMlfk1LA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B0771006C80;
 Mon, 10 May 2021 08:41:47 +0000 (UTC)
Received: from redhat.com (ovpn-115-110.ams2.redhat.com [10.36.115.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DC005D9CA;
 Mon, 10 May 2021 08:41:44 +0000 (UTC)
Date: Mon, 10 May 2021 09:41:42 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: Re: [PATCH] block: Improve backing file validation
Message-ID: <YJjxqqqEMwpyNB8y@redhat.com>
References: <20210510043045.15238-1-lizhijian@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20210510043045.15238-1-lizhijian@cn.fujitsu.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 10, 2021 at 12:30:45PM +0800, Li Zhijian wrote:
> Image below user cases:
> case 1:
> ```
> $ qemu-img create -f raw source.raw 1G
> $ qemu-img create -f qcow2 -F raw -b source.raw ./source.raw
> qemu-img info source.raw
> image: source.raw
> file format: qcow2
> virtual size: 193K (197120 bytes)
> disk size: 196K
> cluster_size: 65536
> backing file: source.raw <<<<<<
> backing file format: raw
> Format specific information:
>     compat: 1.1
>     lazy refcounts: false
>     refcount bits: 16
>     corrupt: false
> ```
> 
> case 2:
> ```
> $ qemu-img create -f raw source.raw 1G
> $ ln -sf source.raw destination.qcow2
> $ qemu-img create -f qcow2 -F raw -b source.raw ./destination.qcow2
> qemu-img info source.raw
> image: source.raw
> file format: qcow2 <<<<<<
> virtual size: 2.0G (2147483648 bytes)
> disk size: 196K
> cluster_size: 65536
> backing file: source.raw
> backing file format: raw
> Format specific information:
>     compat: 1.1
>     lazy refcounts: false
>     refcount bits: 16
>     corrupt: false
> ```
> Generally, we don't expect to corrupte the source.raw anyway, while
> actually it does.
> 
> Here we validate the realpath of file instead the input string.

That still won't handle the case where you use hard links

  $ ln source.raw destination.qcow2

To properly validate the scenarios I think it is neccessary
to ignore the filename sentirely.

Instead attempt to open both files, and if successful, fstat()
them both, and then compare the st_dev + st_ino  fields.


> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
> ---
>  block.c | 46 +++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 39 insertions(+), 7 deletions(-)
> 
> diff --git a/block.c b/block.c
> index 9ad725d205..523845b763 100644
> --- a/block.c
> +++ b/block.c
> @@ -6431,6 +6431,44 @@ bool bdrv_op_blocker_is_empty(BlockDriverState *bs)
>      return true;
>  }
>  
> +static bool validate_backing_file(const char *filename,
> +                                  const char *backing_file, Error **errp)
> +{
> +    bool ret = false;
> +    char *rf, *real_filename = g_malloc0(PATH_MAX + 1);
> +    char *rb, *real_backing = g_malloc0(PATH_MAX + 1);

Don't do this - PATH_MAX is not required to be defined by POSIX, and
when it is defined, POSIX states that it may be so large that it is
inappropriate to use for allocation.

> +
> +    rf = realpath(filename, real_filename);

GLibC, macOS, FreeBSD, NetBSD and OpenBSD all implement the
POSIX.1-2008 extension that allows the output buffer to be
NULL, in which case realpath returns a newly allocated
string of the correct size.

Windows doesn't provide realpath at all, so I'm surprised
this doesn't break the windows builds.


> +    if (!rf) {
> +        if (errno == ENOENT) {
> +            /* filename doesn't exit, ignore it */
> +            rf = (char *)filename;
> +        } else {
> +            error_setg(errp, "Failed to resolve %s", filename);
> +            goto out;
> +        }
> +    }
> +    rb = realpath(backing_file, real_backing);
> +    if (!rb) {
> +        error_setg(errp, "Failed to resolve %s", backing_file);
> +        goto out;
> +    }
> +    if (!strcmp(rf, rb)) {
> +        error_setg(errp, "Error: Trying to create an image with the "
> +                            "same filename as the backing file");
> +        goto out;
> +    }
> +    if (backing_file[0] == '\0') {
> +        error_setg(errp, "Expected backing file name, got empty string");
> +        goto out;
> +    }
> +    ret = true;
> +out:
> +    g_free(real_filename);
> +    g_free(real_backing);
> +    return ret;
> +}
> +
>  void bdrv_img_create(const char *filename, const char *fmt,
>                       const char *base_filename, const char *base_fmt,
>                       char *options, uint64_t img_size, int flags, bool quiet,
> @@ -6507,13 +6545,7 @@ void bdrv_img_create(const char *filename, const char *fmt,
>  
>      backing_file = qemu_opt_get(opts, BLOCK_OPT_BACKING_FILE);
>      if (backing_file) {
> -        if (!strcmp(filename, backing_file)) {
> -            error_setg(errp, "Error: Trying to create an image with the "
> -                             "same filename as the backing file");
> -            goto out;
> -        }
> -        if (backing_file[0] == '\0') {
> -            error_setg(errp, "Expected backing file name, got empty string");
> +        if (!validate_backing_file(filename, backing_file, errp)) {
>              goto out;
>          }
>      }
> -- 
> 2.30.2
> 
> 
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


