Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0400B2DB03C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:41:13 +0100 (CET)
Received: from localhost ([::1]:39788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCRs-0002PN-0s
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:41:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kpCLa-0003Pw-PA
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:34:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kpCLX-00043E-Nc
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:34:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608046479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JGAmSk/5NnCmnaOU3RbF+dwSsWHRiNNwBCIq+AYP6jw=;
 b=X8H/aZGi+Yk2fGiTj4Q7D3IffC2nbdd6eaMc7HkoQQ4uVck5claOBr8Q5j+FwofPG+WanF
 ZVUDvNioJ+39MubG1D6foY/w0BocMOfZo7uYxCY/0xsjeeIY5mS8bgm9p5VELxqnfk0xW9
 bj4ufixnEleCZJKggm3XsgMwD6+FQJg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-mB2UIrCmOIiyNDQ8CYSesw-1; Tue, 15 Dec 2020 10:34:35 -0500
X-MC-Unique: mB2UIrCmOIiyNDQ8CYSesw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13D2F81CB08;
 Tue, 15 Dec 2020 15:34:10 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-117-65.ams2.redhat.com [10.36.117.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E72060854;
 Tue, 15 Dec 2020 15:34:07 +0000 (UTC)
Date: Tue, 15 Dec 2020 16:34:05 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH v2 4/4] block: Close block exports in two steps
Message-ID: <20201215153405.GF8185@merkur.fritz.box>
References: <20201214170519.223781-1-slp@redhat.com>
 <20201214170519.223781-5-slp@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201214170519.223781-5-slp@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Fam Zheng <fam@euphon.net>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.12.2020 um 18:05 hat Sergio Lopez geschrieben:
> There's a cross-dependency between closing the block exports and
> draining the block layer. The latter needs that we close all export's
> client connections to ensure they won't queue more requests, but the
> exports may have coroutines yielding in the block layer, which implies
> they can't be fully closed until we drain it.

A coroutine that yielded must have some way to be reentered. So I guess
the quesiton becomes why they aren't reentered until drain. We do
process events:

    AIO_WAIT_WHILE(NULL, blk_exp_has_type(type));

So in theory, anything that would finalise the block export closing
should still execute.

What is the difference that drain makes compared to a simple
AIO_WAIT_WHILE, so that coroutine are reentered during drain, but not
during AIO_WAIT_WHILE?

This is an even more interesting question because the NBD server isn't a
block node nor a BdrvChildClass implementation, so it shouldn't even
notice a drain operation.

Kevin

> To break this cross-dependency, this change adds a "bool wait"
> argument to blk_exp_close_all() and blk_exp_close_all_type(), so
> callers can decide whether they want to wait for the exports to be
> fully quiesced, or just return after requesting them to shut down.
> 
> Then, in bdrv_close_all we make two calls, one without waiting to
> close all client connections, and another after draining the block
> layer, this time waiting for the exports to be fully quiesced.
> 
> RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=1900505
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> ---
>  block.c                   | 20 +++++++++++++++++++-
>  block/export/export.c     | 10 ++++++----
>  blockdev-nbd.c            |  2 +-
>  include/block/export.h    |  4 ++--
>  qemu-nbd.c                |  2 +-
>  stubs/blk-exp-close-all.c |  2 +-
>  6 files changed, 30 insertions(+), 10 deletions(-)
> 
> diff --git a/block.c b/block.c
> index bc8a66ab6e..41db70ac07 100644
> --- a/block.c
> +++ b/block.c
> @@ -4472,13 +4472,31 @@ static void bdrv_close(BlockDriverState *bs)
>  void bdrv_close_all(void)
>  {
>      assert(job_next(NULL) == NULL);
> -    blk_exp_close_all();
> +
> +    /*
> +     * There's a cross-dependency between closing the block exports and
> +     * draining the block layer. The latter needs that we close all export's
> +     * client connections to ensure they won't queue more requests, but the
> +     * exports may have coroutines yielding in the block layer, which implies
> +     * they can't be fully closed until we drain it.
> +     *
> +     * Make a first call to close all export's client connections, without
> +     * waiting for each export to be fully quiesced.
> +     */
> +    blk_exp_close_all(false);
>  
>      /* Drop references from requests still in flight, such as canceled block
>       * jobs whose AIO context has not been polled yet */
>      bdrv_drain_all();
>  
>      blk_remove_all_bs();
> +
> +    /*
> +     * Make a second call to shut down the exports, this time waiting for them
> +     * to be fully quiesced.
> +     */
> +    blk_exp_close_all(true);
> +
>      blockdev_close_all_bdrv_states();
>  
>      assert(QTAILQ_EMPTY(&all_bdrv_states));
> diff --git a/block/export/export.c b/block/export/export.c
> index bad6f21b1c..0124ebd9f9 100644
> --- a/block/export/export.c
> +++ b/block/export/export.c
> @@ -280,7 +280,7 @@ static bool blk_exp_has_type(BlockExportType type)
>  }
>  
>  /* type == BLOCK_EXPORT_TYPE__MAX for all types */
> -void blk_exp_close_all_type(BlockExportType type)
> +void blk_exp_close_all_type(BlockExportType type, bool wait)
>  {
>      BlockExport *exp, *next;
>  
> @@ -293,12 +293,14 @@ void blk_exp_close_all_type(BlockExportType type)
>          blk_exp_request_shutdown(exp);
>      }
>  
> -    AIO_WAIT_WHILE(NULL, blk_exp_has_type(type));
> +    if (wait) {
> +        AIO_WAIT_WHILE(NULL, blk_exp_has_type(type));
> +    }
>  }
>  
> -void blk_exp_close_all(void)
> +void blk_exp_close_all(bool wait)
>  {
> -    blk_exp_close_all_type(BLOCK_EXPORT_TYPE__MAX);
> +    blk_exp_close_all_type(BLOCK_EXPORT_TYPE__MAX, wait);
>  }
>  
>  void qmp_block_export_add(BlockExportOptions *export, Error **errp)
> diff --git a/blockdev-nbd.c b/blockdev-nbd.c
> index d8443d235b..d71d4da7c2 100644
> --- a/blockdev-nbd.c
> +++ b/blockdev-nbd.c
> @@ -266,7 +266,7 @@ void qmp_nbd_server_stop(Error **errp)
>          return;
>      }
>  
> -    blk_exp_close_all_type(BLOCK_EXPORT_TYPE_NBD);
> +    blk_exp_close_all_type(BLOCK_EXPORT_TYPE_NBD, true);
>  
>      nbd_server_free(nbd_server);
>      nbd_server = NULL;
> diff --git a/include/block/export.h b/include/block/export.h
> index 7feb02e10d..71c25928ce 100644
> --- a/include/block/export.h
> +++ b/include/block/export.h
> @@ -83,7 +83,7 @@ BlockExport *blk_exp_find(const char *id);
>  void blk_exp_ref(BlockExport *exp);
>  void blk_exp_unref(BlockExport *exp);
>  void blk_exp_request_shutdown(BlockExport *exp);
> -void blk_exp_close_all(void);
> -void blk_exp_close_all_type(BlockExportType type);
> +void blk_exp_close_all(bool wait);
> +void blk_exp_close_all_type(BlockExportType type, bool wait);
>  
>  #endif
> diff --git a/qemu-nbd.c b/qemu-nbd.c
> index a7075c5419..928f4466f6 100644
> --- a/qemu-nbd.c
> +++ b/qemu-nbd.c
> @@ -1122,7 +1122,7 @@ int main(int argc, char **argv)
>      do {
>          main_loop_wait(false);
>          if (state == TERMINATE) {
> -            blk_exp_close_all();
> +            blk_exp_close_all(true);
>              state = TERMINATED;
>          }
>      } while (state != TERMINATED);
> diff --git a/stubs/blk-exp-close-all.c b/stubs/blk-exp-close-all.c
> index 1c71316763..ecd0ce611f 100644
> --- a/stubs/blk-exp-close-all.c
> +++ b/stubs/blk-exp-close-all.c
> @@ -2,6 +2,6 @@
>  #include "block/export.h"
>  
>  /* Only used in programs that support block exports (libblockdev.fa) */
> -void blk_exp_close_all(void)
> +void blk_exp_close_all(bool wait)
>  {
>  }
> -- 
> 2.26.2
> 


