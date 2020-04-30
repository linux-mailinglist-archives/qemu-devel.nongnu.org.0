Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BC81C0ACA
	for <lists+qemu-devel@lfdr.de>; Fri,  1 May 2020 01:01:22 +0200 (CEST)
Received: from localhost ([::1]:34418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUIBE-0008NO-Jz
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 19:01:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41458)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slyfox@gentoo.org>) id 1jUI9m-000723-Nq
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 18:59:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <slyfox@gentoo.org>) id 1jUI9k-0005T0-St
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 18:59:49 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:35202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <slyfox@gentoo.org>) id 1jUI9k-0005Ak-7t
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 18:59:48 -0400
Date: Thu, 30 Apr 2020 23:59:34 +0100
From: Sergei Trofimovich <slyfox@gentoo.org>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] linux-user/strace.list: fix epoll_create{,1} -strace
 output
Message-ID: <20200430235934.210904e7@sf>
In-Reply-To: <20200416175957.1274882-1-slyfox@gentoo.org>
References: <20200416175957.1274882-1-slyfox@gentoo.org>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=140.211.166.183; envelope-from=slyfox@gentoo.org;
 helo=smtp.gentoo.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/30 18:59:39
X-ACL-Warn: Detected OS   = ???
X-Received-From: 140.211.166.183
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Apr 2020 18:59:57 +0100
Sergei Trofimovich <slyfox@gentoo.org> wrote:

> Fix syscall name and parameters priinter.
> 
> Before the change:
> 
> ```
> $ alpha-linux-user/qemu-alpha -strace -L /usr/alpha-unknown-linux-gnu/ /tmp/a
> ...
> 1274697 %s(%d)(2097152,274903156744,274903156760,274905840712,274877908880,274903235616) = 3
> 1274697 exit_group(0)
> ```
> 
> After the change:
> 
> ```
> $ alpha-linux-user/qemu-alpha -strace -L /usr/alpha-unknown-linux-gnu/ /tmp/a
> ...
> 1273719 epoll_create1(2097152) = 3
> 1273719 exit_group(0)
> ```
> 
> Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
> CC: Riku Voipio <riku.voipio@iki.fi>
> CC: Laurent Vivier <laurent@vivier.eu>
> ---
>  linux-user/strace.list | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index d49a1e92a8..9281c0a758 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -125,10 +125,10 @@
>  { TARGET_NR_dup3, "dup3" , "%s(%d,%d,%d)", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_epoll_create
> -{ TARGET_NR_epoll_create, "%s(%d)", NULL, NULL, NULL },
> +{ TARGET_NR_epoll_create, "epoll_create", "%s(%d)", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_epoll_create1
> -{ TARGET_NR_epoll_create1, "%s(%d)", NULL, NULL, NULL },
> +{ TARGET_NR_epoll_create1, "epoll_create1", "%s(%d)", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_epoll_ctl
>  { TARGET_NR_epoll_ctl, "epoll_ctl" , NULL, NULL, NULL },
> -- 
> 2.26.1
> 

Should it be handled differently?

-- 

  Sergei

