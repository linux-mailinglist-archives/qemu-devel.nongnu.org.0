Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 033045F084C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 12:15:06 +0200 (CEST)
Received: from localhost ([::1]:40982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeD2v-0001Xo-JK
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 06:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeD1G-0008UQ-Fc
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 06:13:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeD1D-0004xD-7a
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 06:13:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664532798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nRLqHtdAbZ46YBJC7n+PEetTF7u+2N2sxKAzOThSVlc=;
 b=CO1Ry0Zc89Buy5cureDqHm9es/SGhuYBA7d/Xuh97UAyLS3ounAr1cm3c3g81v8B9b3+Pu
 MACLWbayXSq4Yv+SAmdTePCtaK94RG0Edn5bkxjsr9kS+HwOHBB7xOz0UBRLxWtW/F3Jkh
 FgcJdHDn77uWnHGcmod85dCKz0KnE0I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-jbny4GCwMA6AtH_3zBLL7w-1; Fri, 30 Sep 2022 06:13:10 -0400
X-MC-Unique: jbny4GCwMA6AtH_3zBLL7w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B65887B2A6;
 Fri, 30 Sep 2022 10:13:10 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E917040C6EC2;
 Fri, 30 Sep 2022 10:13:08 +0000 (UTC)
Date: Fri, 30 Sep 2022 12:13:07 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 2/2] block: Refactor get_tmp_filename()
Message-ID: <YzbBM7Qc3p+Hiyvo@redhat.com>
References: <20220928144125.1997128-1-bmeng.cn@gmail.com>
 <20220928144125.1997128-2-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928144125.1997128-2-bmeng.cn@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Am 28.09.2022 um 16:41 hat Bin Meng geschrieben:
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
> and use g_file_open_tmp() for a consistent implementation.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
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
>  block.c                          | 45 ++++++++++++--------------------
>  block/vvfat.c                    |  7 +++--
>  3 files changed, 20 insertions(+), 34 deletions(-)
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
> index 582c205307..bd3006d85d 100644
> --- a/block.c
> +++ b/block.c
> @@ -860,35 +860,25 @@ int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo)
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

We're using different prefixes on Windows and on Linux. This patch
unifies both paths to use the Linux name. Nobody should rely on the name
of temporary files, so there is hope it won't break anything.

> -            ? 0 : -GetLastError());
> -#else
> +    g_autofree char *name = NULL;
> +    g_autoptr(GError) err = NULL;
>      int fd;
> -    const char *tmpdir;
> -    tmpdir = getenv("TMPDIR");
> -    if (!tmpdir) {
> -        tmpdir = "/var/tmp";
> -    }
> -    if (snprintf(filename, size, "%s/vl.XXXXXX", tmpdir) >= size) {
> -        return -EOVERFLOW;
> -    }
> -    fd = mkstemp(filename);
> +
> +    fd = g_file_open_tmp("vl.XXXXXX", &name, &err);

This implicitly reverts commit 69bef7931e8, g_file_open_tmp() uses /tmp
as the default instead of /var/tmp as this function does before the
patch.

This is probably not a good idea, we should keep the /var/tmp default.

But if we did want to do this, it's definitely a change in behaviour
that should be mentioned in the commit message at least.

Kevin


