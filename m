Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F207E41356D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 16:35:29 +0200 (CEST)
Received: from localhost ([::1]:35654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSgrp-0005as-2d
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 10:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mSgqG-0004mV-Qp
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 10:33:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mSgqF-0000ep-C1
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 10:33:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632234829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f45UtmYf/2zGoTE7Hm+gBQL07DlN/mX4+diB1lj0zS0=;
 b=Lq+wniuf3HBqvn2X9/0GVOcXHwkJ8GnMbySPe0oc6EIM2+3nUVDMi7eHwDi8aFnfIP3rmE
 hhRGgLCJgeMRGPYHgF95n3B67j3cytzmzsc7bjBRAhFcIol4ulbBmDCxUmDq7+MuY9Vsel
 gycwZV44o6DSU8apiI43Wj6RLi0Ofig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-4KdhROdMN5WCV0StsLUzzA-1; Tue, 21 Sep 2021 10:33:48 -0400
X-MC-Unique: 4KdhROdMN5WCV0StsLUzzA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BB4110151E2;
 Tue, 21 Sep 2021 14:33:47 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 943A216A30;
 Tue, 21 Sep 2021 14:33:46 +0000 (UTC)
Date: Tue, 21 Sep 2021 16:33:45 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 4/5] block: bdrv_insert_node(): don't use bdrv_open()
Message-ID: <YUntSdh5Pg+H5lem@redhat.com>
References: <20210920115538.264372-1-vsementsov@virtuozzo.com>
 <20210920115538.264372-5-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210920115538.264372-5-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.475, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: hreitz@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 20.09.2021 um 13:55 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Use bdrv_new_open_driver_opts() instead of complicated bdrv_open().
> 
> Among other extra things bdrv_open() also check for white-listed
> formats, which we don't want for internal node creation: currently
> backup doesn't work when copy-before-write filter is not white-listed.
> As well block-stream doesn't work when copy-on-read is not
> white-listed.
> 
> Fixes: 751cec7a261adaf1145dc7adf6de7c9c084e5a0b
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=2004812
> Reported-by: Yanan Fu
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block.c | 32 +++++++++++++++++++++++++++-----
>  1 file changed, 27 insertions(+), 5 deletions(-)
> 
> diff --git a/block.c b/block.c
> index 3a90407b83..a174801785 100644
> --- a/block.c
> +++ b/block.c
> @@ -5134,11 +5134,29 @@ BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *options,
>      ERRP_GUARD();
>      int ret;
>      BlockDriverState *new_node_bs;

gcc tells me that this needs to be initialised now because of the
bdrv_unref() aftert the fail: label.

Fixed this up to be new_node_bs = NULL and applied the series to the
block branch, thanks.

Kevin


