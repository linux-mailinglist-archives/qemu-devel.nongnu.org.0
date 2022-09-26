Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BE45E9C4B
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 10:45:23 +0200 (CEST)
Received: from localhost ([::1]:33436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocjju-0004Mk-Aq
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 04:45:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ocjgY-0001iJ-8s
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 04:41:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ocjgT-0000yX-Q2
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 04:41:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664181707;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=eksslIK9miwMn2EC8/ulD5CMtixif7z0CMKfgUkojac=;
 b=CYcuxpc2Im/eVA8F91p4A/S0r+XYSytj1AaJ9YvVRm+vRa2D54aiQ2mNNFacMHx4bcftb+
 nY+zJq2ocdXUNsI/4ttu5kPoTZC21VRYmMcYoQPaI0HG4p2cREoWmM9QjbKOQE2MPQWdBE
 M7O6B39ULWP+6uThqf6IecNrNGD+RBA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-z1JpxI4yOrucYsDh5ALkcg-1; Mon, 26 Sep 2022 04:41:44 -0400
X-MC-Unique: z1JpxI4yOrucYsDh5ALkcg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EC22855305;
 Mon, 26 Sep 2022 08:41:43 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6568A1121314;
 Mon, 26 Sep 2022 08:41:42 +0000 (UTC)
Date: Mon, 26 Sep 2022 09:41:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v3] block: Refactor get_tmp_filename()
Message-ID: <YzFlxNs5fLeL+Um4@redhat.com>
References: <20220924163200.1910807-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220924163200.1910807-1-bmeng.cn@gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 25, 2022 at 12:32:00AM +0800, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> At present there are two callers of get_tmp_filename() and they are
> inconsistent.
> 
> One does:
> 
>     /* TODO: extra byte is a hack to ensure MAX_PATH space on Windows. */
>     char *tmp_filename = g_malloc0(PATH_MAX + 1);
>     ...
>     ret = get_tmp_filename(tmp_filename, PATH_MAX + 1);
> 
> while the other does:
> 
>     s->qcow_filename = g_malloc(PATH_MAX);
>     ret = get_tmp_filename(s->qcow_filename, PATH_MAX);
> 
> As we can see different 'size' arguments are passed. There are also
> platform specific implementations inside the function, and this use
> of snprintf is really undesirable.
> 
> Refactor this routine by changing its signature to:
> 
>     int get_tmp_filename(char **filename)
> 
> and use g_file_open_tmp() for a consistent implementation.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
> Changes in v3:
> - Do not use errno directly, instead still let get_tmp_filename() return
>   a negative number to indicate error
> 
> Changes in v2:
> - Use g_autofree and g_steal_pointer
> 
>  include/block/block_int-common.h |  2 +-
>  block.c                          | 36 ++++++++++----------------------
>  block/vvfat.c                    |  3 +--
>  3 files changed, 13 insertions(+), 28 deletions(-)
> 
> diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
> index 8947abab76..eb30193198 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -1230,7 +1230,7 @@ static inline BlockDriverState *child_bs(BdrvChild *child)
>  }
>  
>  int bdrv_check_request(int64_t offset, int64_t bytes, Error **errp);
> -int get_tmp_filename(char *filename, int size);
> +int get_tmp_filename(char **filename);

Change it to:

   char *get_tmp_filename(Error **errp);


> @@ -3737,7 +3723,7 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
>      }
>  
>      /* Create the temporary image */
> -    ret = get_tmp_filename(tmp_filename, PATH_MAX + 1);
> +    ret = get_tmp_filename(&tmp_filename);
>      if (ret < 0) {
>          error_setg_errno(errp, -ret, "Could not get temporary filename");

And pass 'errp' straight into get_tmp_filename, thus avoid the
different error message text here vs below

eg

     tmp_filename = get_tmp_filename(errp);
     if (!tmp_filename) {
         goto out;
     }


>          goto out;
> diff --git a/block/vvfat.c b/block/vvfat.c
> index d6dd919683..43f42fd1ea 100644
> --- a/block/vvfat.c
> +++ b/block/vvfat.c
> @@ -3146,8 +3146,7 @@ static int enable_write_target(BlockDriverState *bs, Error **errp)
>  
>      array_init(&(s->commits), sizeof(commit_t));
>  
> -    s->qcow_filename = g_malloc(PATH_MAX);
> -    ret = get_tmp_filename(s->qcow_filename, PATH_MAX);
> +    ret = get_tmp_filename(&s->qcow_filename);
>      if (ret < 0) {
>          error_setg_errno(errp, -ret, "can't create temporary file");
>          goto err;

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


