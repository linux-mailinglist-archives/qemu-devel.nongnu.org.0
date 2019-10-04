Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF6BCC33E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 21:03:00 +0200 (CEST)
Received: from localhost ([::1]:51288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGSqx-0005EB-By
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 15:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36957)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iGSiX-0000V3-P8
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 14:54:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iGSiS-00020c-JX
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 14:54:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51078)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iGSiQ-0001tt-MJ
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 14:54:11 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 96DBE8A1CA7;
 Fri,  4 Oct 2019 18:54:06 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 577AD1001DC2;
 Fri,  4 Oct 2019 18:54:03 +0000 (UTC)
Date: Fri, 4 Oct 2019 19:54:00 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: Add pread64() to seccomp list for
 posix_fallocate()
Message-ID: <20191004185400.GH2772@work-vm>
References: <20191004110759.32665-1-misono.tomohiro@jp.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191004110759.32665-1-misono.tomohiro@jp.fujitsu.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Fri, 04 Oct 2019 18:54:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Misono Tomohiro (misono.tomohiro@jp.fujitsu.com) wrote:
> I test virtiofs with NFS 4.0 as backend and notice that fallocate
> causes system hang (kernel: 5.4-rc1, qemu: virtio-fs-dev branch):
>  $ mount -t virtiofs myfs /mnt
>  $ dd if=/dev/urandom bs=1000 seek=1 count=1 of=/mnt/file
>  $ fallocate -l 2000 /mnt/file # system hang
> 
> This is because:
>  1. virtiofs supports fallocate syscall while NFS 4.0 does not.
>  2. virtiofsd uses posix_fallocate() and it fallbacks to pread64()/
>     pwrite64() sequence to reserve blocks if fallocate syscall is
>     not available.
>  3. pread64() syscall is prohibited by seccomp and virtiofsd thread
>     is killed by SIGSYS.
> 
> So, just add pread64() to seccomp white list to fix this problem.
> 
> Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>

Thanks, I've squashed this into our seccomp commit.
(It'll be a little while before I push it out, I need to finish a tidyup
I'm doing).

Dave

> ---
>  contrib/virtiofsd/seccomp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/contrib/virtiofsd/seccomp.c b/contrib/virtiofsd/seccomp.c
> index 93b679271d..88b61bca42 100644
> --- a/contrib/virtiofsd/seccomp.c
> +++ b/contrib/virtiofsd/seccomp.c
> @@ -61,6 +61,7 @@ static const int syscall_whitelist[] = {
>  	SCMP_SYS(ppoll),
>  	SCMP_SYS(prctl), /* TODO restrict to just PR_SET_NAME? */
>  	SCMP_SYS(preadv),
> +	SCMP_SYS(pread64),
>  	SCMP_SYS(pwritev),
>  	SCMP_SYS(pwrite64),
>  	SCMP_SYS(read),
> -- 
> 2.21.0
> 
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://www.redhat.com/mailman/listinfo/virtio-fs
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

