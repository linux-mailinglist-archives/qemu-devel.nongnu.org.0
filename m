Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF84B5123C1
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 22:17:51 +0200 (CEST)
Received: from localhost ([::1]:56984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njo6g-0002kc-W9
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 16:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1njo5O-0001re-DW
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 16:16:30 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:51995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1njo5M-00016Y-Fc
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 16:16:30 -0400
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-bYsxNg30PcusZhBydMNK8A-1; Wed, 27 Apr 2022 16:16:23 -0400
X-MC-Unique: bYsxNg30PcusZhBydMNK8A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96C6C19705BE;
 Wed, 27 Apr 2022 20:16:15 +0000 (UTC)
Received: from bahia (unknown [10.39.195.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 574DD14C1E82;
 Wed, 27 Apr 2022 20:16:14 +0000 (UTC)
Date: Wed, 27 Apr 2022 22:16:12 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v4 1/6] 9pfs: fix qemu_mknodat(S_IFREG) on macOS
Message-ID: <20220427221612.75febe47@bahia>
In-Reply-To: <a5338eada3c5130046785014c185ec4fa0ddeaa7.1651085921.git.qemu_oss@crudebyte.com>
References: <cover.1651085921.git.qemu_oss@crudebyte.com>
 <a5338eada3c5130046785014c185ec4fa0ddeaa7.1651085921.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
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

On Wed, 27 Apr 2022 20:54:04 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> mknod() on macOS does not support creating regular files, so
> divert to openat_file() if S_IFREG is passed with mode argument.
> 
> Furthermore, 'man 2 mknodat' on Linux says: "Zero file type is
> equivalent to type S_IFREG".
> 

Thinking again I have mixed feelings about this... qemu_mknodat()
should certainly match POSIX semantics, even non-portable, as
described in [1] but I'm not sure it should mimic linux-specific
behaviors.

[1] https://pubs.opengroup.org/onlinepubs/9699919799/functions/mknod.html

> Link: https://lore.kernel.org/qemu-devel/17933734.zYzKuhC07K@silver/
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Reviewed-by: Will Cohen <wwcohen@gmail.com>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> ---
>  hw/9pfs/9p-util-darwin.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> index bec0253474..e24d09763a 100644
> --- a/hw/9pfs/9p-util-darwin.c
> +++ b/hw/9pfs/9p-util-darwin.c
> @@ -77,6 +77,15 @@ int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
>  int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
>  {
>      int preserved_errno, err;
> +
> +    if (S_ISREG(mode) || !(mode & S_IFMT)) {

... so maybe I'd just check S_ISREG() here. Not a request, just food
for thought : sticking to POSIX semantics might help to make the code
more portable across all the new host supports that are showing up
these days.

> +        int fd = openat_file(dirfd, filename, O_CREAT, mode);
> +        if (fd == -1) {
> +            return fd;
> +        }
> +        close(fd);
> +        return 0;
> +    }
>      if (!pthread_fchdir_np) {
>          error_report_once("pthread_fchdir_np() not available on this version of macOS");
>          return -ENOTSUP;


