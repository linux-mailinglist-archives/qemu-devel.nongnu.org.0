Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E20F330A740
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 13:09:44 +0100 (CET)
Received: from localhost ([::1]:42044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Y1X-0002ys-UY
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 07:09:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6Xyf-0001aS-1D
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:06:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6Xyd-0001c0-IQ
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:06:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612181202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k3trAbtOf+34l7YzyCaK6AKk3gLGHa/yi/kgk+N5CRI=;
 b=VjZNeSBKNlLbJPKD4aIV/AhUci4qVaW5B0PULKPHOVbBz5sPWuJVGprFu9AqkmWGpykAWJ
 u32mEJ1UrQi96C+2jTM5K0wajC+PlCOOmYpdLBBre8KqnQky6sFtqKs0BvdzyeiIJGMCK8
 fO2Dn52fV7VVbo6poCcLXmQSbRjZ3lM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-gfjRTTgIPC6TOcmQd4pITg-1; Mon, 01 Feb 2021 07:06:37 -0500
X-MC-Unique: gfjRTTgIPC6TOcmQd4pITg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF8F91800D50;
 Mon,  1 Feb 2021 12:06:36 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C17695D735;
 Mon,  1 Feb 2021 12:06:32 +0000 (UTC)
Date: Mon, 1 Feb 2021 13:06:31 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH v3 1/2] block: Avoid processing BDS twice in
 bdrv_set_aio_context_ignore()
Message-ID: <20210201120631.GA13157@merkur.fritz.box>
References: <20210121170700.59734-1-slp@redhat.com>
 <20210121170700.59734-2-slp@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210121170700.59734-2-slp@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 21.01.2021 um 18:06 hat Sergio Lopez geschrieben:
> Some graphs may contain an indirect reference to the first BDS in the
> chain that can be reached while walking it bottom->up from one its
> children.
> 
> Doubling-processing of a BDS is especially problematic for the
> aio_notifiers, as they might attempt to work on both the old and the
> new AIO contexts.
> 
> To avoid this problem, add every child and parent to the ignore list
> before actually processing them.
> 
> Suggested-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> ---
>  block.c | 34 +++++++++++++++++++++++++++-------
>  1 file changed, 27 insertions(+), 7 deletions(-)

The patch looks correct to me, I'm just wondering about one thing:

> diff --git a/block.c b/block.c
> index 8b9d457546..3da99312db 100644
> --- a/block.c
> +++ b/block.c
> @@ -6414,7 +6414,10 @@ void bdrv_set_aio_context_ignore(BlockDriverState *bs,
>                                   AioContext *new_context, GSList **ignore)
>  {
>      AioContext *old_context = bdrv_get_aio_context(bs);
> -    BdrvChild *child;
> +    GSList *children_to_process = NULL;
> +    GSList *parents_to_process = NULL;

Why do we need these separate lists? Can't we just iterate over
bs->parents/children a second time? I don't think the graph can change
between the first and the second loop (and if it could, the result would
be broken anyway).

Kevin


