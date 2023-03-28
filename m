Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E50B66CBF03
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 14:28:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph8QU-0000Ff-RQ; Tue, 28 Mar 2023 08:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ph8QS-0000Cx-Ou
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:27:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ph8QQ-0004mM-Cc
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:27:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680006460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=10tVOMonaSszclXZZ181+QqoiCu0e/J+9hgd28XMcF4=;
 b=h4lpQ+KE2iDe13d+9TM2lao4P9RwUiGULDbm2myrtaz/p1fp4pR+BbIgZYAgCo4R+fXbK5
 GQPwaZeHuXh+XGZ7Ezp2lslFM2TfglY2Jl2tho6kq04ev9P/m5puizWvP/f+97IXFW7end
 spu9n4adG46h4Lch1Z6jaqDDgOURW5s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-2ujk8cJ-Nja3LGXJXbiPWQ-1; Tue, 28 Mar 2023 08:27:37 -0400
X-MC-Unique: 2ujk8cJ-Nja3LGXJXbiPWQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50148185A790;
 Tue, 28 Mar 2023 12:27:37 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C20440BC797;
 Tue, 28 Mar 2023 12:27:36 +0000 (UTC)
Date: Tue, 28 Mar 2023 14:27:35 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Coiby Xu <Coiby.Xu@gmail.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH for-8.0] block/export: fix assume_graph_lock() assertion
 failure
Message-ID: <ZCLdNxESMsE0r92T@redhat.com>
References: <20230327211921.1612727-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327211921.1612727-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

Am 27.03.2023 um 23:19 hat Stefan Hajnoczi geschrieben:
> When I/O request parameters are validated for virtio-blk exports like
> vhost-user-blk and vduse-blk, we call blk_get_geometry() from a
> coroutine. This hits an assume_graph_lock() assertion failure.
> 
> Use blk_co_nb_sectors() instead and mark virtio_blk_sect_range_ok() with
> coroutine_fn.
> 
> This assertion failure is triggered by any I/O to a vhost-user-blk
> export.
> 
> Fixes: 8ab8140a04cf ("block: Mark bdrv_co_refresh_total_sectors() and callers GRAPH_RDLOCK")
> Cc: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

This is a duplicate of this fix:

https://patchew.org/QEMU/20230327113959.60071-1-kwolf@redhat.com/

Kevin


