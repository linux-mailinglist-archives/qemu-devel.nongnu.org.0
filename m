Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC1A45C9E4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 17:23:31 +0100 (CET)
Received: from localhost ([::1]:60208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpv3S-000257-JI
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 11:23:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mpv0w-0008K4-Ep
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 11:20:55 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:51061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mpv0s-0006IY-Em
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 11:20:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=XY6cd4+mxTD1f0VXw9jh/SOo5ekhM6oRBUJs18xb76k=; b=T0Dt/qzze53EaG5k+DkM7lLHEe
 TPblNOSgGox+xQ/ZNAoYDeMciXDh119pxxCZJ6g3HuH2baBVnBXw9AUMuotv1shR/OiOSFdEBR9kZ
 6z8XuBykzX5cjCrJxBczu3473PvbzQJZcLIt7zo2i+mAg7kgxLbD6WL1nZTOyX7a7mtsUZWAmvHIx
 XXst+ndhBHVL5153gyCm3H+YPgkRSHoNGDc2hlhvwx/VlkOjU1xMCWJwMJ3OQ5Oxz1rhd9Pgw7axv
 5TN+cvyi5B/X7wJZpA7YPwp4Lj6cA98KvA8FdshqX8CP1bm5TOkXo/9WTbjQqqS7PndUgR+KLF4PP
 u1OYJ6aJ2uWNnqf8pFZwgLYE5qMBIdsm2BThlvYGFMPOMutkeWKYB1/RHDSDTBxRfCNXRKxUv1HTa
 ktn1np6IBuDjGuvOwj3fSKFDX/wvue/KTZVYFZWxtsCuQuYKkd4mRHsXGRWgqEXuaCKKTlKtKujJr
 ya64jHE/HJoIKVmZuKDAS9lfLiEZuph2rtL1nzV+gIDTitqc8mwFLlP3BIarLB7WEgFaLatAOye9b
 tFe6t0KUJE0CRFQamlbUlkO5JQrfHpQMmjnukdJe7G3hje5hWA2fDDQHNdrbmoZaVEKl//vHRbCAd
 mpW7csAmb56r7jTwgzR35fqHxEuzeg1w+mE5RgxWw=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Keno Fischer <keno@juliacomputing.com>,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>
Subject: Re: [PATCH v2 08/11] 9p: darwin: Compatibility for f/l*xattr
Date: Wed, 24 Nov 2021 17:20:47 +0100
Message-ID: <2301973.IoarFkLyKX@silver>
In-Reply-To: <20211122004913.20052-9-wwcohen@gmail.com>
References: <20211122004913.20052-1-wwcohen@gmail.com>
 <20211122004913.20052-9-wwcohen@gmail.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Montag, 22. November 2021 01:49:10 CET Will Cohen wrote:
> From: Keno Fischer <keno@juliacomputing.com>
> 
> On darwin `fgetxattr` takes two extra optional arguments,
> and the l* variants are not defined (in favor of an extra
> flag to the regular variants.
> 
> Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> [Michael Roitzsch: - Rebase for NixOS]
> Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> ---
>  hw/9pfs/9p-local.c | 12 ++++++++----
>  hw/9pfs/9p-util.h  | 17 +++++++++++++++++
>  2 files changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> index 1a5e3eed73..2bfff79b12 100644
> --- a/hw/9pfs/9p-local.c
> +++ b/hw/9pfs/9p-local.c
> @@ -781,16 +781,20 @@ static int local_fstat(FsContext *fs_ctx, int
> fid_type, mode_t tmp_mode;
>          dev_t tmp_dev;
> 
> -        if (fgetxattr(fd, "user.virtfs.uid", &tmp_uid, sizeof(uid_t)) > 0)
> { +        if (qemu_fgetxattr(fd, "user.virtfs.uid",
> +                           &tmp_uid, sizeof(uid_t)) > 0) {
>              stbuf->st_uid = le32_to_cpu(tmp_uid);
>          }
> -        if (fgetxattr(fd, "user.virtfs.gid", &tmp_gid, sizeof(gid_t)) > 0)
> { +        if (qemu_fgetxattr(fd, "user.virtfs.gid",
> +                           &tmp_gid, sizeof(gid_t)) > 0) {
>              stbuf->st_gid = le32_to_cpu(tmp_gid);
>          }
> -        if (fgetxattr(fd, "user.virtfs.mode", &tmp_mode, sizeof(mode_t)) >
> 0) { +        if (qemu_fgetxattr(fd, "user.virtfs.mode",
> +                           &tmp_mode, sizeof(mode_t)) > 0) {
>              stbuf->st_mode = le32_to_cpu(tmp_mode);
>          }
> -        if (fgetxattr(fd, "user.virtfs.rdev", &tmp_dev, sizeof(dev_t)) > 0)
> { +        if (qemu_fgetxattr(fd, "user.virtfs.rdev",
> +                           &tmp_dev, sizeof(dev_t)) > 0) {
>              stbuf->st_rdev = le64_to_cpu(tmp_dev);
>          }
>      } else if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> index 627baebaba..38ef8b289d 100644
> --- a/hw/9pfs/9p-util.h
> +++ b/hw/9pfs/9p-util.h
> @@ -19,6 +19,23 @@
>  #define O_PATH_9P_UTIL 0
>  #endif
> 
> +#ifdef CONFIG_DARWIN
> +#define qemu_fgetxattr(...) fgetxattr(__VA_ARGS__, 0, 0)

Why does this not have XATTR_NOFOLLOW and the others do? -^

> +#define qemu_lgetxattr(...) getxattr(__VA_ARGS__, 0, XATTR_NOFOLLOW)
> +#define qemu_llistxattr(...) listxattr(__VA_ARGS__, XATTR_NOFOLLOW)
> +#define qemu_lremovexattr(...) removexattr(__VA_ARGS__, XATTR_NOFOLLOW)
> +static inline int qemu_lsetxattr(const char *path, const char *name,
> +                                 const void *value, size_t size, int flags)
> { +    return setxattr(path, name, value, size, 0, flags | XATTR_NOFOLLOW);
> +}
> +#else
> +#define qemu_fgetxattr fgetxattr
> +#define qemu_lgetxattr lgetxattr
> +#define qemu_llistxattr llistxattr
> +#define qemu_lremovexattr lremovexattr
> +#define qemu_lsetxattr lsetxattr
> +#endif
> +
>  static inline void close_preserve_errno(int fd)
>  {
>      int serrno = errno;

Hmm, so we would have two different behaviours for Linux vs. macOS here.

If there is a symbolic link on host, Linux currently applies the permission
map as xattrs to the destination of the symlink, whereas macOS would map the
permissions as xattrs to the symbolic link itself.

Who is right?



