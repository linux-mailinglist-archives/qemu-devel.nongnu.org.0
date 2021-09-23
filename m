Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFCA4166C7
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 22:36:21 +0200 (CEST)
Received: from localhost ([::1]:34260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTVS8-0001WE-Vs
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 16:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTVPy-0000En-AN
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 16:34:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTVPv-0002Pb-H4
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 16:34:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632429241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UQxGloWJPoL35y+LCeC8eZ1y74KFxCNhy3YU7t10Q/A=;
 b=HU9WAw6qQdAX++dYLX+gPBwwTOEx1kv836ogB54aoTQqxQLPp5jDLri1VimYPnn7STDp+G
 iD8V319/2VgSjRwV2sI2h+sTIBUxkgcG93To47SIPZqs09RNCSWANd9h0Gs31fFxrrsMkz
 5cYlaIZ263gw6YlMwTcZq3Fn9TzR+BY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-DDKCub2vOwSwunigQuIC7w-1; Thu, 23 Sep 2021 16:33:57 -0400
X-MC-Unique: DDKCub2vOwSwunigQuIC7w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D839EA40C0;
 Thu, 23 Sep 2021 20:33:55 +0000 (UTC)
Received: from redhat.com (ovpn-115-8.phx2.redhat.com [10.3.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AD0460BE5;
 Thu, 23 Sep 2021 20:33:47 +0000 (UTC)
Date: Thu, 23 Sep 2021 15:33:45 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v6 07/11] block: use int64_t instead of int in driver
 write_zeroes handlers
Message-ID: <20210923203345.efajcgbm3qd2sam5@redhat.com>
References: <20210903102807.27127-1-vsementsov@virtuozzo.com>
 <20210903102807.27127-8-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210903102807.27127-8-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205-773-8890a5
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, integration@gluster.org, berto@igalia.com,
 stefanha@redhat.com, qemu-block@nongnu.org, pavel.dovgaluk@ispras.ru,
 sw@weilnetz.de, pl@kamp.de, qemu-devel@nongnu.org, jsnow@redhat.com,
 hreitz@redhat.com, kraxel@redhat.com, ronniesahlberg@gmail.com,
 pbonzini@redhat.com, idryomov@gmail.com, philmd@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 03, 2021 at 01:28:03PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> We are generally moving to int64_t for both offset and bytes parameters
> on all io paths.
> 
> Main motivation is realization of 64-bit write_zeroes operation for
> fast zeroing large disk chunks, up to the whole disk.
> 
> We chose signed type, to be consistent with off_t (which is signed) and
> with possibility for signed return type (where negative value means
> error).
> 
> So, convert driver write_zeroes handlers bytes parameter to int64_t.
> 
> The only caller of all updated function is bdrv_co_do_pwrite_zeroes().
> 
> bdrv_co_do_pwrite_zeroes() itself is of course OK with widening of
> callee parameter type. Also, bdrv_co_do_pwrite_zeroes()'s
> max_write_zeroes is limited to INT_MAX. So, updated functions all are
> safe, they will not get "bytes" larger than before.
> 
> Still, let's look through all updated functions, and add assertions to
> the ones which are actually unprepared to values larger than INT_MAX.
> For these drivers also set explicit max_pwrite_zeroes limit.
> 
[snip]
> 
> At this point all block drivers are prepared to support 64bit
> write-zero requests, or have explicitly set max_pwrite_zeroes.

The long commit message is essential, but the analysis looks sane.

> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---

> +++ b/block/iscsi.c

> @@ -1250,11 +1250,21 @@ coroutine_fn iscsi_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
>      iscsi_co_init_iscsitask(iscsilun, &iTask);
>  retry:
>      if (use_16_for_ws) {
> +        /*
> +         * iscsi_writesame16_task num_blocks argument is uint32_t. We rely here
> +         * on our max_pwrite_zeroes limit.
> +         */
> +        assert(nb_blocks < UINT32_MAX);
>          iTask.task = iscsi_writesame16_task(iscsilun->iscsi, iscsilun->lun, lba,
>                                              iscsilun->zeroblock, iscsilun->block_size,
>                                              nb_blocks, 0, !!(flags & BDRV_REQ_MAY_UNMAP),
>                                              0, 0, iscsi_co_generic_cb, &iTask);

Should this be <= instead of < ?

>      } else {
> +        /*
> +         * iscsi_writesame10_task num_blocks argument is uint16_t. We rely here
> +         * on our max_pwrite_zeroes limit.
> +         */
> +        assert(nb_blocks < UINT16_MAX);
>          iTask.task = iscsi_writesame10_task(iscsilun->iscsi, iscsilun->lun, lba,
>                                              iscsilun->zeroblock, iscsilun->block_size,
>                                              nb_blocks, 0, !!(flags & BDRV_REQ_MAY_UNMAP),

here too.  The 16-bit limit is where we're most likely to run into
someone actually trying to zeroize that much at once.

> +++ b/block/nbd.c
> @@ -1407,15 +1407,17 @@ static int nbd_client_co_pwritev(BlockDriverState *bs, int64_t offset,
>  }
>  
>  static int nbd_client_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
> -                                       int bytes, BdrvRequestFlags flags)
> +                                       int64_t bytes, BdrvRequestFlags flags)
>  {
>      BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
>      NBDRequest request = {
>          .type = NBD_CMD_WRITE_ZEROES,
>          .from = offset,
> -        .len = bytes,
> +        .len = bytes,  /* .len is uint32_t actually */
>      };
>  
> +    assert(bytes < UINT32_MAX); /* relay on max_pwrite_zeroes */

And again.  Here, you happen to get by with < because we clamped
bl.max_pwrite_zeroes at BDRV_REQUEST_MAX_BYTES, which is INT_MAX
rounded down.  But I had to check; whereas using <= would be less
worrisome, even if we never get a request that large.

If you agree with my analysis, I can make that change while preparing
my pull request.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


