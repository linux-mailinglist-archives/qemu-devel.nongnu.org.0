Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FBF388BE6
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 12:44:37 +0200 (CEST)
Received: from localhost ([::1]:41430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljJgr-000342-0x
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 06:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ljJfF-0001dr-EE
 for qemu-devel@nongnu.org; Wed, 19 May 2021 06:42:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ljJfD-0007ZC-5I
 for qemu-devel@nongnu.org; Wed, 19 May 2021 06:42:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621420973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NzV6jtBpZdoG3yrBFsQDPb3xOjwyt6kjOH3KYUFQoXw=;
 b=OjXc1DlwmtpvSMvvXYEvuZ6CNIF+D0LIlM5HHZQK0YjDgYL5hcC38NYjgHHhH9Qo9P02Y7
 0D5Z6H3QyIUighQnxMEg1ZNkfYKJTeyaPQTCvwA8+bnRTmyUS8mCTZSdPVJIrg1VmopgTQ
 DFPSwinJwH7uIPbuj7XWsFl09XlqhIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-viQtcxvXODq6wJNDZNMTdQ-1; Wed, 19 May 2021 06:42:52 -0400
X-MC-Unique: viQtcxvXODq6wJNDZNMTdQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB2B3801B13;
 Wed, 19 May 2021 10:42:50 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-58.ams2.redhat.com [10.36.115.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B807550FBF;
 Wed, 19 May 2021 10:42:49 +0000 (UTC)
Date: Wed, 19 May 2021 12:42:48 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] qemu-io-cmds: assert that we don't have .perm requested
 in no-blk case
Message-ID: <YKTrqJtlDJqDgNbR@merkur.fritz.box>
References: <20210519090532.3753-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210519090532.3753-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: stefanha@gmail.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 19.05.2021 um 11:05 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Coverity things blk may be NULL. It's a false-positive, as described in

s/things/thinks/

> a new comment.
> 
> Fixes: Coverity CID 1453194
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  qemu-io-cmds.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
> index 998b67186d..3b7cceecbf 100644
> --- a/qemu-io-cmds.c
> +++ b/qemu-io-cmds.c
> @@ -92,9 +92,19 @@ static int command(BlockBackend *blk, const cmdinfo_t *ct, int argc,
>          return -EINVAL;
>      }
>  
> -    /* Request additional permissions if necessary for this command. The caller
> +    /*
> +     * Request additional permissions if necessary for this command. The caller
>       * is responsible for restoring the original permissions afterwards if this
> -     * is what it wants. */
> +     * is what it wants.
> +     *
> +     * Coverity things that blk may be NULL in the following if condition. It's

And here.

> +     * not so: in init_check_command() we fail if blk is NULL for command with
> +     * both CMD_FLAG_GLOBAL and CMD_NOFILE_OK flags unset. And in
> +     * qemuio_add_command() we assert that command with non-zero .perm field
> +     * doesn't set this flags. So, the following assertion is to silence
> +     * Coverity:
> +     */
> +    assert(blk || !ct->perm);
>      if (ct->perm && blk_is_available(blk)) {
>          uint64_t orig_perm, orig_shared_perm;
>          blk_get_perm(blk, &orig_perm, &orig_shared_perm);

Thanks, applied with the typo fixed up.

Kevin


