Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1570413D9D6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 13:23:43 +0100 (CET)
Received: from localhost ([::1]:40850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1is4Ba-0002pB-4H
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 07:23:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33347)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <misono.tomohiro@fujitsu.com>) id 1is49R-000865-1r
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 07:21:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <misono.tomohiro@fujitsu.com>) id 1is49M-0006YI-Vw
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 07:21:28 -0500
Received: from mgwkm02.jp.fujitsu.com ([202.219.69.169]:50083)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <misono.tomohiro@fujitsu.com>)
 id 1is49M-0006Ws-F5
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 07:21:24 -0500
Received: from kw-mxoi1.gw.nic.fujitsu.com (unknown [192.168.231.131]) by
 mgwkm02.jp.fujitsu.com with smtp
 id 11ae_b330_7961ab74_8604_4c4b_b58d_df9702d321f4;
 Thu, 16 Jan 2020 21:21:16 +0900
Received: from g01jpfmpwyt01.exch.g01.fujitsu.local
 (g01jpfmpwyt01.exch.g01.fujitsu.local [10.128.193.38])
 by kw-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id 39769AC00D0
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 21:21:16 +0900 (JST)
Received: from G01JPEXCHYT13.g01.fujitsu.local
 (G01JPEXCHYT13.g01.fujitsu.local [10.128.194.52])
 by g01jpfmpwyt01.exch.g01.fujitsu.local (Postfix) with ESMTP id 2F24B6D67A1;
 Thu, 16 Jan 2020 21:21:15 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 G01JPEXCHYT13.g01.fujitsu.local (10.128.194.52) with Microsoft SMTP Server id
 14.3.439.0; Thu, 16 Jan 2020 21:21:16 +0900
From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
To: <dgilbert@redhat.com>
Subject: Re: [PATCH 095/104] virtiofsd: convert more fprintf and perror to use
 fuse log infra
Date: Thu, 16 Jan 2020 21:29:30 +0900
Message-ID: <20200116122930.23078-1-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20191212163904.159893-96-dgilbert@redhat.com>
References: <20191212163904.159893-96-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 202.219.69.169
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
Cc: misono.tomohiro@jp.fujitsu.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Eryu Guan <eguan@linux.alibaba.com>
> 
> Signed-off-by: Eryu Guan <eguan@linux.alibaba.com>
> ---
>  tools/virtiofsd/fuse_signals.c | 6 +++++-
>  tools/virtiofsd/helper.c       | 9 ++++++---
>  2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/virtiofsd/fuse_signals.c b/tools/virtiofsd/fuse_signals.c
> index 10a6f88088..edabf24e0d 100644
> --- a/tools/virtiofsd/fuse_signals.c
> +++ b/tools/virtiofsd/fuse_signals.c
> @@ -11,6 +11,7 @@
>  #include "fuse_i.h"
>  #include "fuse_lowlevel.h"
>  
> +#include <errno.h>
>  #include <signal.h>
>  #include <stdio.h>
>  #include <stdlib.h>
> @@ -46,12 +47,15 @@ static int set_one_signal_handler(int sig, void (*handler)(int), int remove)
>      sa.sa_flags = 0;
>  
>      if (sigaction(sig, NULL, &old_sa) == -1) {
> -        perror("fuse: cannot get old signal handler");
> +        fuse_log(FUSE_LOG_ERR, "fuse: cannot get old signal handler: %s\n",
> +                 strerror(errno));
>          return -1;
>      }
>  
>      if (old_sa.sa_handler == (remove ? handler : SIG_DFL) &&
>          sigaction(sig, &sa, NULL) == -1) {
> +        fuse_log(FUSE_LOG_ERR, "fuse: cannot set signal handler: %s\n",
> +                 strerror(errno));

I notice one perror is remaining:
>          perror("fuse: cannot set signal handler");

other than that,
Reviewed-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>

>          return -1;
>      }
> diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
> index 7b28507a38..bcb8c05063 100644
> --- a/tools/virtiofsd/helper.c
> +++ b/tools/virtiofsd/helper.c
> @@ -200,7 +200,8 @@ int fuse_daemonize(int foreground)
>          char completed;
>  
>          if (pipe(waiter)) {
> -            perror("fuse_daemonize: pipe");
> +            fuse_log(FUSE_LOG_ERR, "fuse_daemonize: pipe: %s\n",
> +                     strerror(errno));
>              return -1;
>          }
>  
> @@ -210,7 +211,8 @@ int fuse_daemonize(int foreground)
>           */
>          switch (fork()) {
>          case -1:
> -            perror("fuse_daemonize: fork");
> +            fuse_log(FUSE_LOG_ERR, "fuse_daemonize: fork: %s\n",
> +                     strerror(errno));
>              return -1;
>          case 0:
>              break;
> @@ -220,7 +222,8 @@ int fuse_daemonize(int foreground)
>          }
>  
>          if (setsid() == -1) {
> -            perror("fuse_daemonize: setsid");
> +            fuse_log(FUSE_LOG_ERR, "fuse_daemonize: setsid: %s\n",
> +                     strerror(errno));
>              return -1;
>          }
>  
> -- 
> 2.23.0

