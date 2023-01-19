Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F25306739C3
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 14:18:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIUnd-00033M-9D; Thu, 19 Jan 2023 08:17:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIUnX-00032f-MY
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:17:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIUnV-0006aK-N5
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:17:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674134260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t8IAOyfj0JsiojdwK1YKPbJLYU6wgg8fmfQIOjYqDVk=;
 b=J4k9MLO+Hmlrb9fXwicY4141tmXgazn0Lp/jhiBov+gb1VFboLem7/A58SrhH5GENbg6qp
 1FPVCDE9OalyRDap6Jegx9dS6ebxU8xxS6hMftGnb8jQxpIRXc3CLwhgdXDO0SFdg2bVZl
 wuDlIY2SD0U73EC2aHK1o0sHq4L5r6w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-dolrixXxOaWi-kMWdrj2rw-1; Thu, 19 Jan 2023 08:17:39 -0500
X-MC-Unique: dolrixXxOaWi-kMWdrj2rw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1070B811E9C;
 Thu, 19 Jan 2023 13:17:39 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CEA41400AFC;
 Thu, 19 Jan 2023 13:17:38 +0000 (UTC)
Date: Thu, 19 Jan 2023 14:17:37 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH 2/3] block: do not check bdrv_file_open
Message-ID: <Y8lC8d0/XdEct7Mc@redhat.com>
References: <20221212131700.250209-1-pbonzini@redhat.com>
 <20221212131700.250209-3-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221212131700.250209-3-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 12.12.2022 um 14:16 hat Paolo Bonzini geschrieben:
> The set of BlockDrivers that have .bdrv_file_open coincides with those
> that have .protocol_name and guess what---checking drv->bdrv_file_open
> is done to see if the driver is a protocol.  So check drv->protocol_name
> instead.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/block.c b/block.c
> index 0a625a489a6e..7a66cc2ea23a 100644
> --- a/block.c
> +++ b/block.c
> @@ -911,7 +911,6 @@ BlockDriver *bdrv_find_protocol(const char *filename,
>      int i;
>  
>      GLOBAL_STATE_CODE();
> -    /* TODO Drivers without bdrv_file_open must be specified explicitly */
>  
>      /*
>       * XXX(hch): we really should not let host device detection
> @@ -1618,7 +1617,7 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
>      bs->opaque = g_malloc0(drv->instance_size);
>  
>      assert(!drv->bdrv_needs_filename || bs->filename[0]);
> -    if (drv->bdrv_file_open) {
> +    if (drv->bdrv_open) {
>          ret = drv->bdrv_file_open(bs, options, open_flags, &local_err);
>      } else if (drv->bdrv_open) {
>          ret = drv->bdrv_open(bs, options, open_flags, &local_err);

I suppose you mean drv->protocol_name for the first if condition?

The bug will disappear again after patch 3, but this intermediate state
is very broken.

Kevin


