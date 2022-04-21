Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CBA50A6B6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:12:25 +0200 (CEST)
Received: from localhost ([::1]:46718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhaLw-0007Iw-U4
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nhZj1-000620-9H
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:32:11 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:23639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nhZiz-0001ZV-EW
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:32:10 -0400
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-1okRVHfgNpKiQOG9rlU_WQ-1; Thu, 21 Apr 2022 12:32:05 -0400
X-MC-Unique: 1okRVHfgNpKiQOG9rlU_WQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92C97381A82A;
 Thu, 21 Apr 2022 16:32:04 +0000 (UTC)
Received: from bahia (unknown [10.39.192.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E161550A46;
 Thu, 21 Apr 2022 16:32:03 +0000 (UTC)
Date: Thu, 21 Apr 2022 18:32:02 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 1/5] 9pfs: fix qemu_mknodat(S_IFREG) on macOS
Message-ID: <20220421183202.15daadc0@bahia>
In-Reply-To: <a4825b66184778ca0337cd5e24dec3fc9da16de6.1650553693.git.qemu_oss@crudebyte.com>
References: <cover.1650553693.git.qemu_oss@crudebyte.com>
 <a4825b66184778ca0337cd5e24dec3fc9da16de6.1650553693.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

On Thu, 21 Apr 2022 17:07:38 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> mknod() on macOS does not support creating regular files, so
> divert to openat_file() if S_IFREG is passed with mode argument.
> 
> Furthermore, 'man 2 mknodat' on Linux says: "Zero file type is
> equivalent to type S_IFREG".
> 
> Link: https://lore.kernel.org/qemu-devel/17933734.zYzKuhC07K@silver/
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Reviewed-by: Will Cohen <wwcohen@gmail.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

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


