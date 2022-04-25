Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD7350E163
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 15:17:45 +0200 (CEST)
Received: from localhost ([::1]:48658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niyb1-000786-Tv
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 09:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1niyZl-0005np-QD
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 09:16:25 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:21617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1niyZj-00019Q-Ms
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 09:16:25 -0400
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-QvXvtK2pMQedaJdP_QGFxQ-1; Mon, 25 Apr 2022 09:16:11 -0400
X-MC-Unique: QvXvtK2pMQedaJdP_QGFxQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CECD6803D7C;
 Mon, 25 Apr 2022 13:16:10 +0000 (UTC)
Received: from bahia (unknown [10.39.193.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5DBE40C1241;
 Mon, 25 Apr 2022 13:16:09 +0000 (UTC)
Date: Mon, 25 Apr 2022 15:16:08 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v3 6/6] 9pfs: fix qemu_mknodat() to always return -1 on
 error on macOS host
Message-ID: <20220425151608.19c3b1db@bahia>
In-Reply-To: <a48ced8707c1e07420e692088905ee23fde132f8.1650889269.git.qemu_oss@crudebyte.com>
References: <cover.1650889268.git.qemu_oss@crudebyte.com>
 <a48ced8707c1e07420e692088905ee23fde132f8.1650889269.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

On Mon, 25 Apr 2022 14:21:00 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> qemu_mknodat() is expected to behave according to its POSIX API, and
> therefore should always return exactly -1 on any error, and errno
> should be set for the actual error code.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/9pfs/9p-util-darwin.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> index 63797e60cd..7364da394c 100644
> --- a/hw/9pfs/9p-util-darwin.c
> +++ b/hw/9pfs/9p-util-darwin.c
> @@ -116,7 +116,8 @@ int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
>      }
>      if (!pthread_fchdir_np) {
>          error_report_once("pthread_fchdir_np() not available on this version of macOS");
> -        return -ENOTSUP;
> +        errno = ENOTSUP;
> +        return -1;
>      }
>      if (pthread_fchdir_np(dirfd) < 0) {
>          return -1;


