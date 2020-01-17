Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30527140592
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 09:43:06 +0100 (CET)
Received: from localhost ([::1]:54094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isNDd-00087p-1K
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 03:43:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42474)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <misono.tomohiro@fujitsu.com>) id 1isNCn-0006n1-MC
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 03:42:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <misono.tomohiro@fujitsu.com>) id 1isNCj-0005JW-9b
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 03:42:12 -0500
Received: from mgwkm02.jp.fujitsu.com ([202.219.69.169]:62705)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <misono.tomohiro@fujitsu.com>)
 id 1isNCi-0005EM-PS
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 03:42:09 -0500
Received: from kw-mxauth.gw.nic.fujitsu.com (unknown [192.168.231.132]) by
 mgwkm02.jp.fujitsu.com with smtp
 id 6c01_2676_2d46be08_a99b_44b5_9651_3ee9091bf8d8;
 Fri, 17 Jan 2020 17:41:55 +0900
Received: from g01jpfmpwyt03.exch.g01.fujitsu.local
 (g01jpfmpwyt03.exch.g01.fujitsu.local [10.128.193.57])
 by kw-mxauth.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A828AC00B1
 for <qemu-devel@nongnu.org>; Fri, 17 Jan 2020 17:41:54 +0900 (JST)
Received: from g01jpexchyt33.g01.fujitsu.local (unknown [10.128.193.4])
 by g01jpfmpwyt03.exch.g01.fujitsu.local (Postfix) with ESMTP id 2CB5846E46F;
 Fri, 17 Jan 2020 17:41:53 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 g01jpexchyt33.g01.fujitsu.local (10.128.193.36) with Microsoft SMTP Server id
 14.3.439.0; Fri, 17 Jan 2020 17:41:53 +0900
From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
To: <dgilbert@redhat.com>
Subject: Re: [PATCH 094/104] virtiofsd: do not always set FUSE_FLOCK_LOCKS
Date: Fri, 17 Jan 2020 17:50:16 +0900
Message-ID: <20200117085016.14635-1-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20191212163904.159893-95-dgilbert@redhat.com>
References: <20191212163904.159893-95-dgilbert@redhat.com>
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

> From: Peng Tao <tao.peng@linux.alibaba.com>
> 
> Right now we always enable it regardless of given commandlines.
> Fix it by setting the flag relying on the lo->flock bit.
> 
> Signed-off-by: Peng Tao <tao.peng@linux.alibaba.com>

I think we should remove LL_SET_DEFAULT for flock/posix_lock in do_init()
but that can be done in another patch.

Reviewed-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>

> ---
>  tools/virtiofsd/passthrough_ll.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 8f4ab8351c..cf6b548eee 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -548,9 +548,14 @@ static void lo_init(void *userdata, struct fuse_conn_info *conn)
>          fuse_log(FUSE_LOG_DEBUG, "lo_init: activating writeback\n");
>          conn->want |= FUSE_CAP_WRITEBACK_CACHE;
>      }
> -    if (lo->flock && conn->capable & FUSE_CAP_FLOCK_LOCKS) {
> -        fuse_log(FUSE_LOG_DEBUG, "lo_init: activating flock locks\n");
> -        conn->want |= FUSE_CAP_FLOCK_LOCKS;
> +    if (conn->capable & FUSE_CAP_FLOCK_LOCKS) {
> +        if (lo->flock) {
> +            fuse_log(FUSE_LOG_DEBUG, "lo_init: activating flock locks\n");
> +            conn->want |= FUSE_CAP_FLOCK_LOCKS;
> +        } else {
> +            fuse_log(FUSE_LOG_DEBUG, "lo_init: disabling flock locks\n");
> +            conn->want &= ~FUSE_CAP_FLOCK_LOCKS;
> +        }
>      }
>  
>      if (conn->capable & FUSE_CAP_POSIX_LOCKS) {
> -- 
> 2.23.0

