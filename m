Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1E150A6A4
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:09:23 +0200 (CEST)
Received: from localhost ([::1]:36680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhaJ0-0000ZG-Cb
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nhZq8-0006Ve-2G
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:39:32 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:29107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nhZq2-0002eF-Rl
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:39:31 -0400
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-qeDa5izgPA-oEH2sK59Bzg-1; Thu, 21 Apr 2022 12:39:13 -0400
X-MC-Unique: qeDa5izgPA-oEH2sK59Bzg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A80143C0F09E;
 Thu, 21 Apr 2022 16:39:12 +0000 (UTC)
Received: from bahia (unknown [10.39.192.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 803E2409B3F0;
 Thu, 21 Apr 2022 16:39:11 +0000 (UTC)
Date: Thu, 21 Apr 2022 18:39:10 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 3/5] 9pfs: fix wrong encoding of rdev field in
 Rgetattr on macOS
Message-ID: <20220421183910.334e012d@bahia>
In-Reply-To: <22b21b3ddd5c11c43fcfb150a5cec30bd2cca8df.1650553693.git.qemu_oss@crudebyte.com>
References: <cover.1650553693.git.qemu_oss@crudebyte.com>
 <22b21b3ddd5c11c43fcfb150a5cec30bd2cca8df.1650553693.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Apr 2022 17:07:46 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> The 'rdev' field in 9p reponse 'Rgetattr' is of type dev_t,
> which is actually a system dependant type and therefore both the
> size and encoding of dev_t differ between macOS and Linux.
> 
> So far we have sent 'rdev' to guest in host's dev_t format as-is,
> which caused devices to appear with wrong device numbers on
> guests running on macOS hosts, eventually leading to various
> misbehaviours on guest in conjunction with device files.
> 
> This patch fixes this issue by converting the device number from
> host's dev_t format to Linux dev_t format. As 9p request
> 'Tgettattr' is exclusive to protocol version 9p2000.L, it should
> be fair to assume that 'rdev' field is assumed to be in Linux dev_t
> format by client as well.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Link: https://lore.kernel.org/qemu-devel/20220421093056.5ab1e7ed@bahia/
> Reviewed-by: Greg Kurz <groug@kaod.org>
> ---

Reviewed-again-by: Greg Kurz <groug@kaod.org>

>  hw/9pfs/9p-util.h | 39 +++++++++++++++++++++++++++++++++++++++
>  hw/9pfs/9p.c      |  2 +-
>  2 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> index 97e681e167..2cc9a5dbfb 100644
> --- a/hw/9pfs/9p-util.h
> +++ b/hw/9pfs/9p-util.h
> @@ -19,6 +19,45 @@
>  #define O_PATH_9P_UTIL 0
>  #endif
>  
> +#if !defined(CONFIG_LINUX)
> +
> +/*
> + * Generates a Linux device number (a.k.a. dev_t) for given device major
> + * and minor numbers.
> + *
> + * To be more precise: it generates a device number in glibc's format
> + * (MMMM_Mmmm_mmmM_MMmm, 64 bits) actually, which is compatible with
> + * Linux's format (mmmM_MMmm, 32 bits), as described in <bits/sysmacros.h>.
> + */
> +static inline uint64_t makedev_dotl(uint32_t dev_major, uint32_t dev_minor)
> +{
> +    uint64_t dev;
> +
> +    // from glibc sysmacros.h:
> +    dev  = (((uint64_t) (dev_major & 0x00000fffu)) <<  8);
> +    dev |= (((uint64_t) (dev_major & 0xfffff000u)) << 32);
> +    dev |= (((uint64_t) (dev_minor & 0x000000ffu)) <<  0);
> +    dev |= (((uint64_t) (dev_minor & 0xffffff00u)) << 12);
> +    return dev;
> +}
> +
> +#endif
> +
> +/*
> + * Converts given device number from host's device number format to Linux
> + * device number format. As both the size of type dev_t and encoding of
> + * dev_t is system dependant, we have to convert them for Linux guests if
> + * host is not running Linux.
> + */
> +static inline uint64_t host_dev_to_dotl_dev(dev_t dev)
> +{
> +#ifdef CONFIG_LINUX
> +    return dev;
> +#else
> +    return makedev_dotl(major(dev), minor(dev));
> +#endif
> +}
> +
>  #ifdef CONFIG_DARWIN
>  #define qemu_fgetxattr(...) fgetxattr(__VA_ARGS__, 0, 0)
>  #define qemu_lgetxattr(...) getxattr(__VA_ARGS__, 0, XATTR_NOFOLLOW)
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 225f31fc31..4a296a0b94 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -1327,7 +1327,7 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
>      v9lstat->st_nlink = stbuf->st_nlink;
>      v9lstat->st_uid = stbuf->st_uid;
>      v9lstat->st_gid = stbuf->st_gid;
> -    v9lstat->st_rdev = stbuf->st_rdev;
> +    v9lstat->st_rdev = host_dev_to_dotl_dev(stbuf->st_rdev);
>      v9lstat->st_size = stbuf->st_size;
>      v9lstat->st_blksize = stat_to_iounit(pdu, stbuf);
>      v9lstat->st_blocks = stbuf->st_blocks;


