Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DB02489A2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 17:23:44 +0200 (CEST)
Received: from localhost ([::1]:33664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k83Sh-0002pe-Uv
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 11:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1k82bj-0003Al-4T
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:28:59 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:53280
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1k82bh-0001lX-Dc
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:28:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597760936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2574vWCL8WZtX672BEkYWbJtR6z63k/EPnBBJ21um+M=;
 b=WPnPM9p1EmcinQ0jyah+SoMMMstvGocZBZpObg1iDYCUSK3T3L9RBgr2zVw4zTUQl7P1nv
 ZgKTtIy+w+fgTQlszQX3AydKtHWrgnc9VLH6IEfoGEoJlnN8nCLnioBTt5KZKHPxWfQo9K
 94ARGELb6V5rD42v8jz2tVDiNKy3LV0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-y2MANI1-P_KyTYjhngMjtw-1; Tue, 18 Aug 2020 10:28:54 -0400
X-MC-Unique: y2MANI1-P_KyTYjhngMjtw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D541610062B7;
 Tue, 18 Aug 2020 14:28:53 +0000 (UTC)
Received: from linux.fritz.box (ovpn-112-105.ams2.redhat.com [10.36.112.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE5AF101417D;
 Tue, 18 Aug 2020 14:28:52 +0000 (UTC)
Date: Tue, 18 Aug 2020 16:28:51 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v7 14/47] stream: Deal with filters
Message-ID: <20200818142851.GD6865@linux.fritz.box>
References: <20200625152215.941773-1-mreitz@redhat.com>
 <20200625152215.941773-15-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200625152215.941773-15-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 08:01:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.06.2020 um 17:21 hat Max Reitz geschrieben:
> Because of the (not so recent anymore) changes that make the stream job
> independent of the base node and instead track the node above it, we
> have to split that "bottom" node into two cases: The bottom COW node,
> and the node directly above the base node (which may be an R/W filter
> or the bottom COW node).
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  qapi/block-core.json |  4 +++
>  block/stream.c       | 63 ++++++++++++++++++++++++++++++++------------
>  blockdev.c           |  4 ++-
>  3 files changed, 53 insertions(+), 18 deletions(-)
> 
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index b20332e592..df87855429 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -2486,6 +2486,10 @@
>  # On successful completion the image file is updated to drop the backing file
>  # and the BLOCK_JOB_COMPLETED event is emitted.
>  #
> +# In case @device is a filter node, block-stream modifies the first non-filter
> +# overlay node below it to point to base's backing node (or NULL if @base was
> +# not specified) instead of modifying @device itself.

Not to @base's backing node, but to @base itself (or actually, to
above_base's backing node, which is initially @base, but may have
changed when the job is completed).

Should we also document what using a filter node for @base means?

The code changes look good.

Kevin


