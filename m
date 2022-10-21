Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB6A60746B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:47:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olod6-00054l-IE
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:47:52 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olo9Z-0004Tz-AS
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1olo9F-0004N4-SI
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:17:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1olo9C-0003iC-L2
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666343817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zVSpRSJo29H3kP4HL3MThDYZnsOwLIC+1tGoje/x+L0=;
 b=M0HcG5jMyMsv9DrUbUI1I+p2Puzcj/jWv6Fu6yM//3k0AAw8HGagdI1YZRi/Qj+etcfrGG
 EPFOsui+yo0GZeoXPPys/j8OryCjSTfzHOOxoSK3knK+mZXQeUchZBgqWR1ahkyA8lQMqt
 Gt8XFflrqptRNTrovyK8gWaeT8YwLIY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-y6DV_hmaNtqXWEvmvIUeDw-1; Fri, 21 Oct 2022 05:16:55 -0400
X-MC-Unique: y6DV_hmaNtqXWEvmvIUeDw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37C848279A6;
 Fri, 21 Oct 2022 09:16:54 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 44ABB2166B2D;
 Fri, 21 Oct 2022 09:16:45 +0000 (UTC)
Date: Fri, 21 Oct 2022 11:16:39 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Bin Meng <bin.meng@windriver.com>
Cc: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v6 2/2] block: Refactor get_tmp_filename()
Message-ID: <Y1Jjd3AVlWwpttFz@redhat.com>
References: <20221010040432.3380478-1-bin.meng@windriver.com>
 <20221010040432.3380478-2-bin.meng@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010040432.3380478-2-bin.meng@windriver.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 10.10.2022 um 06:04 hat Bin Meng geschrieben:
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
> platform specific implementations inside the function, and the use
> of snprintf is really undesirable.
> 
> The function name is also misleading. It creates a temporary file,
> not just a filename.
> 
> Refactor this routine by changing its name and signature to:
> 
>     char *create_tmp_file(Error **errp)
> 
> and use g_get_tmp_dir() / g_mkstemp() for a consistent implementation.
> 
> While we are here, add some comments to mention that /var/tmp is
> preferred over /tmp on non-win32 hosts.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
> Changes in v6:
> - use g_mkstemp() and stick to use /var/tmp for non-win32 hosts
> 
> Changes in v5:
> - minor change in the commit message
> - add some notes in the function comment block
> - add g_autofree for tmp_filename
> 
> Changes in v4:
> - Rename the function to create_tmp_file() and take "Error **errp" as
>   a parameter, so that callers can pass errp all the way down to this
>   routine.
> - Commit message updated to reflect the latest change
> 
> Changes in v3:
> - Do not use errno directly, instead still let get_tmp_filename() return
>   a negative number to indicate error
> 
> Changes in v2:
> - Use g_autofree and g_steal_pointer
> 
>  include/block/block_int-common.h |  2 +-
>  block.c                          | 56 +++++++++++++++++---------------
>  block/vvfat.c                    |  7 ++--
>  3 files changed, 34 insertions(+), 31 deletions(-)
> 
> diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
> index 8947abab76..d7c0a7e96f 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -1230,7 +1230,7 @@ static inline BlockDriverState *child_bs(BdrvChild *child)
>  }
>  
>  int bdrv_check_request(int64_t offset, int64_t bytes, Error **errp);
> -int get_tmp_filename(char *filename, int size);
> +char *create_tmp_file(Error **errp);
>  void bdrv_parse_filename_strip_prefix(const char *filename, const char *prefix,
>                                        QDict *options);
>  
> diff --git a/block.c b/block.c
> index 582c205307..8eeaa5623e 100644
> --- a/block.c
> +++ b/block.c
> @@ -860,35 +860,42 @@ int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo)
>  
>  /*
>   * Create a uniquely-named empty temporary file.
> - * Return 0 upon success, otherwise a negative errno value.
> + * Return the actual file name used upon success, otherwise NULL.
> + * This string should be freed with g_free() when not needed any longer.
> + *
> + * Note: creating a temporary file for the caller to (re)open is
> + * inherently racy. Use g_file_open_tmp() instead whenever practical.
>   */
> -int get_tmp_filename(char *filename, int size)
> +char *create_tmp_file(Error **errp)
>  {
> -#ifdef _WIN32
> -    char temp_dir[MAX_PATH];
> -    /* GetTempFileName requires that its output buffer (4th param)
> -       have length MAX_PATH or greater.  */
> -    assert(size >= MAX_PATH);
> -    return (GetTempPath(MAX_PATH, temp_dir)
> -            && GetTempFileName(temp_dir, "qem", 0, filename)
> -            ? 0 : -GetLastError());
> -#else
>      int fd;
>      const char *tmpdir;
> -    tmpdir = getenv("TMPDIR");
> -    if (!tmpdir) {
> +    g_autofree char *filename = NULL;
> +
> +    tmpdir = g_get_tmp_dir();
> +#ifndef _WIN32
> +    /*
> +     * See commit 69bef79 ("block: use /var/tmp instead of /tmp for -snapshot")
> +     *
> +     * This function is used to create temporary disk images (like -snapshot),
> +     * so the files can become very large. /tmp is often a tmpfs where as
> +     * /var/tmp is usually on a disk, so more appropriate for disk images.
> +     */
> +    if (!g_strcmp0(tmpdir, "/tmp")) {
>          tmpdir = "/var/tmp";
>      }

This is still a slight change in behaviour: If the TMPDIR environment
variable was explicit set to /tmp, QEMU would store the image file in
/tmp before this patch. After the patch, it will use /var/tmp even in
this case.

I suppose this is a tolerable change.

Kevin


