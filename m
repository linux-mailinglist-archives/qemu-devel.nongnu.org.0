Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD0961500C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:10:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opsSN-0004CX-Es; Tue, 01 Nov 2022 10:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1opsSK-0004CL-UT
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:41:32 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1opsSJ-00058x-3K
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:41:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=bWPeeu4/wqczp7QNsjN6213ygEXFPZoALcPaeg2CGgo=; b=nHok6/mR6XoMRq7cvJwfS237TZ
 9lCxz/jG2htCl0lwN4wEi+Z/969HoCQuOQrsApzRp8IaA0JSEuaGJS5PkdMSDA/GY0629LZTkPM92
 iA5yMquMNP1UXT8oWlGGw1iFVGK2XQfrWwh1wd/bOTGQFa6mcpQ9b1mERr4IjYJ6G2WU3r1EDSvcT
 QZ4wXBmHC4+Uo90DWbWR5YXFENLvosVo1pxUvEpTfY/VqLwBQ6O2tckdEPYvJJxoXqL2zO3vsHKi0
 wU3prNzIp1sSujP4SJkw6996aQWhtcrA4CrcaRsgbFAPyX9DzTcENIs8KEZ9CtdFBs9lL4em68Aak
 iReNpq02yDfotd2ezZVaeb+Uq1VsmVvkBws3STZAuoY/1DihO/RwxPCPmTOVtM1Hil3PfgElSxxS/
 i2Fyd7qDGgd7vGlWcs9cv7EU3fkZqWKsGQgcEkjXgW7lUFfeXUGJ1AJDmYc+CzbFZbuH4jVVW7JBp
 h5NUXDaMfcYjYcj7rKqX9GCAuRGja4wi3oPSokzWscnjcZQhDfhD3dKvdg6zYgOGKPB8L3oPSP/p1
 Lo6XYfXy9f6XGKpC+VhNKg3IvLCOQKySjhD5nomGddC00TyA7V2xzaMJk9+x3395M3iUhbPyeup7K
 1/Sq9vkmjA9ACkrLuieXx13nXFAi8WmefjnEAaGJ0=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>, Greg Kurz <groug@kaod.org>,
 Bin Meng <bin.meng@windriver.com>
Subject: Re: [PATCH 08/16] hw/9pfs: Handle current directory offset for Windows
Date: Tue, 01 Nov 2022 15:41:26 +0100
Message-ID: <3257969.DIln5oVMBi@silver>
In-Reply-To: <20221024045759.448014-9-bin.meng@windriver.com>
References: <20221024045759.448014-1-bin.meng@windriver.com>
 <20221024045759.448014-9-bin.meng@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Monday, October 24, 2022 6:57:51 AM CET Bin Meng wrote:
> From: Guohuai Shi <guohuai.shi@windriver.com>
> 
> On Windows 'struct dirent' does not have current directory offset.
> We have to save current directory offset and update offset when
> reading directory.
> 
> Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  hw/9pfs/9p.c    | 16 ++++++++++++++++
>  hw/9pfs/codir.c | 15 +++++++++++++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index aebadeaa03..6c4af86240 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -2319,7 +2319,15 @@ static int coroutine_fn v9fs_do_readdir_with_stat(V9fsPDU *pdu,
>          count += len;
>          v9fs_stat_free(&v9stat);
>          v9fs_path_free(&path);
> +#ifndef CONFIG_WIN32
>          saved_dir_pos = qemu_dirent_off(dent);
> +#else
> +        /*
> +         * Get offset by calling telldir() manually,
> +         * as Windows does not have dent->d_off.
> +         */
> +        saved_dir_pos = v9fs_co_telldir(pdu, fidp);
> +#endif
>      }

That's not the way to go. We already had the same discussion with the macOS
patches and why we introduced qemu_dirent_off() for exactly that purpose:

v9fs_co_telldir() would dispatch the coroutine from QEMU main thread to
background worker thread and vice versa. So you would get side effects by
doing this.

Please implement this adequately in qemu_dirent_off() instead of touching the
controller portion here.

>  
>      v9fs_readdir_unlock(&fidp->fs.dir);
> @@ -2520,7 +2528,15 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
>              qid.version = 0;
>          }
>  
> +#ifndef CONFIG_WIN32
>          off = qemu_dirent_off(dent);
> +#else
> +        /*
> +         * Get offset by calling telldir() manually,
> +         * as Windows does not have dent->d_off.
> +         */
> +        off = v9fs_co_telldir(pdu, fidp);
> +#endif
>          v9fs_string_init(&name);
>          v9fs_string_sprintf(&name, "%s", dent->d_name);
>  
> diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
> index 93ba44fb75..2fbe7b831b 100644
> --- a/hw/9pfs/codir.c
> +++ b/hw/9pfs/codir.c
> @@ -78,6 +78,9 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
>      int len, err = 0;
>      int32_t size = 0;
>      off_t saved_dir_pos;
> +#ifdef CONFIG_WIN32
> +    off_t next_dir_pos;
> +#endif
>      struct dirent *dent;
>      struct V9fsDirEnt *e = NULL;
>      V9fsPath path;
> @@ -124,6 +127,14 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
>              break;
>          }
>  
> +#ifdef CONFIG_WIN32
> +        next_dir_pos = s->ops->telldir(&s->ctx, &fidp->fs);
> +        if (next_dir_pos < 0) {
> +            err = next_dir_pos;
> +            goto out;
> +        }
> +#endif
> +
>          /*
>           * stop this loop as soon as it would exceed the allowed maximum
>           * response message size for the directory entries collected so far,
> @@ -168,7 +179,11 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
>          }
>  
>          size += len;
> +#ifndef CONFIG_WIN32
>          saved_dir_pos = qemu_dirent_off(dent);
> +#else
> +        saved_dir_pos = next_dir_pos;
> +#endif
>      }
>  
>      /* restore (last) saved position */
> 




