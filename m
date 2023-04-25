Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1426EE8C6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 22:05:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prOtk-0008Ah-M9; Tue, 25 Apr 2023 16:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1prOtj-0008AS-8V
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 16:04:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1prOth-0004N5-FI
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 16:04:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682453060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6cUVHOIwW0+I4OMAzxPKPifKsGwUF5dCkazwtaR4L4I=;
 b=AP/C2hegjfD5ZgT8fWi6mYuk0JOIZtORuPP2UFfURkBtAxAJTvJJHWg8/IzFoyz7/HBUiO
 tjknRCdDBycvyhKblAnaJCC3HZHwJ4l+qGPS7BiITCtQ2PusjMdrKHqzCf/Cxip94JTteV
 N/U2tA6z4wOJEFUTuGdQ6UbKQGR9qts=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-5HIlCMyKM8ez4ZhA2R8MNA-1; Tue, 25 Apr 2023 16:04:11 -0400
X-MC-Unique: 5HIlCMyKM8ez4ZhA2R8MNA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD59AA0F387;
 Tue, 25 Apr 2023 20:04:05 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E1D8492C14;
 Tue, 25 Apr 2023 20:04:05 +0000 (UTC)
Date: Tue, 25 Apr 2023 15:04:03 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, stefanha@redhat.com, pbonzini@redhat.com, 
 eesposit@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 03/20] block: bdrv/blk_co_unref() for calls in coroutine
 context
Message-ID: <kku2ccvarnyfykucwbqpeqbfvpomt3cvmatpca57q5mgs63pen@bijq2o3md3kp>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-4-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425173158.574203-4-kwolf@redhat.com>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, Apr 25, 2023 at 07:31:41PM +0200, Kevin Wolf wrote:
> These functions must not be called in coroutine context, because they
> need write access to the graph.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/block/block-global-state.h          |  3 ++-
>  include/sysemu/block-backend-global-state.h |  5 ++++-
>  block.c                                     |  2 +-
>  block/crypto.c                              |  6 +++---
>  block/parallels.c                           |  6 +++---
>  block/qcow.c                                |  6 +++---
>  block/qcow2.c                               | 14 +++++++-------
>  block/qed.c                                 |  6 +++---
>  block/vdi.c                                 |  6 +++---
>  block/vhdx.c                                |  6 +++---
>  block/vmdk.c                                | 18 +++++++++---------
>  block/vpc.c                                 |  6 +++---
>  12 files changed, 44 insertions(+), 40 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


