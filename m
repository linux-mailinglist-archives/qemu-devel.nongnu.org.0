Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DAE37A2EB
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:04:05 +0200 (CEST)
Received: from localhost ([::1]:39572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOJA-0005qi-Qa
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgNry-0003cT-A8
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:35:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgNrv-00055g-3N
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:35:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620722154;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tncpYjac+AV0k7sXsaic4YCrCF2ds6Bc8+b13W/ntwc=;
 b=cI7Dge0xDxo8gZ+qvFA8NuI/Z9UJ8Fs3QRO9oDjSgUeDF/x70kXS+gBTg3s0C+eckIc/1c
 dWrjwzQKtllkoLAiQoCy3ugFzCQbMRXJ/wo4KzmNCEhiWNXPu6Xyn6pBqDvym0cHQLsrbt
 2z7U7F2/AB6ZSi1vNXr5TuXA2ChzcBw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-hyrYMhrJNiqbGnyem-yY_Q-1; Tue, 11 May 2021 04:35:49 -0400
X-MC-Unique: hyrYMhrJNiqbGnyem-yY_Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AB3194C;
 Tue, 11 May 2021 08:35:48 +0000 (UTC)
Received: from redhat.com (ovpn-115-93.ams2.redhat.com [10.36.115.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 244085D9D7;
 Tue, 11 May 2021 08:35:46 +0000 (UTC)
Date: Tue, 11 May 2021 09:35:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: Re: [PATCH v2] block: Improve backing file validation
Message-ID: <YJpB4IVbg8vHBiOZ@redhat.com>
References: <20210511055518.31876-1-lizhijian@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20210511055518.31876-1-lizhijian@cn.fujitsu.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, May 11, 2021 at 01:55:18PM +0800, Li Zhijian wrote:
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
> Here we check their inode number instead of file name.
> 
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
> 
> ---
> v2: utilize stat() instead of realpath() (Daniel)
> 
> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
> ---
>  block.c | 39 ++++++++++++++++++++++++++++++++-------
>  1 file changed, 32 insertions(+), 7 deletions(-)
> 
> diff --git a/block.c b/block.c
> index 9ad725d205..db4ae57959 100644
> --- a/block.c
> +++ b/block.c
> @@ -6431,6 +6431,37 @@ bool bdrv_op_blocker_is_empty(BlockDriverState *bs)
>      return true;
>  }
>  
> +static bool validate_backing_file(const char *filename,
> +                                  const char *backing_file, Error **errp)
> +{
> +    struct stat filename_stat, backing_stat;
> +
> +    if (backing_file[0] == '\0') {
> +        error_setg(errp, "Expected backing file name, got empty string");
> +        goto out;
> +    }
> +
> +    /* check whether filename and backing_file are refering to the same file */
> +    if (stat(backing_file, &backing_stat) == -1) {
> +        error_setg(errp, "Cannot stat backing file %s", backing_file);
> +        goto out;
> +    }
> +    if (stat(filename, &filename_stat) == -1) {
> +        /* Simply consider filename doesn't exist, no need to further check */
> +        return true;
> +    }
> +    if ((filename_stat.st_dev == backing_stat.st_dev) &&
> +        (filename_stat.st_ino == backing_stat.st_ino)) {
> +        error_setg(errp, "Error: Trying to create an image with the "
> +                         "same filename as the backing file");
> +        goto out;
> +    }
> +
> +    return true;
> +out:
> +    return false;
> +}
> +
>  void bdrv_img_create(const char *filename, const char *fmt,
>                       const char *base_filename, const char *base_fmt,
>                       char *options, uint64_t img_size, int flags, bool quiet,
> @@ -6507,13 +6538,7 @@ void bdrv_img_create(const char *filename, const char *fmt,
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

Thinking about this again, this seems to be quite high in the generic block
layer code. As such I don't think we can assume that the backing file here
is actually a plain file on disk. IIUC the backing file could still be any
of the block drivers. Only once we get down into the protocol specific
drivers can be validate the type of backend.

I'm not sure what the right way to deal with that is, so perhaps Kevin or
Max can make a suggestion.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


