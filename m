Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 962C56DDEC0
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 17:02:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmFUt-00020n-MU; Tue, 11 Apr 2023 11:01:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmFUr-00020G-OH
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:01:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmFUp-0001zT-Py
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:01:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681225283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6+dkSPj7UJitOzVMKxUCkXKy4QvnceYMdkJU/ITQPEU=;
 b=BROPEsJFZbBTVVmezURK2170yNc0RsKuqaQDnu3kenTfBtPdExiIwhaTNh5YsOLGYBlejA
 X6YmBiCVxnzwreOkAfcVZQ8ai4XTSiPq+9g2hHXrMnsUtqvWzH3C8sAmaFixnowWyPLsEb
 Cgb3OCLitGznrm108vEzorLQ0TYtgcg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-wLBYhWAxOtWDmID1plD95Q-1; Tue, 11 Apr 2023 11:01:19 -0400
X-MC-Unique: wLBYhWAxOtWDmID1plD95Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C8F5385054D;
 Tue, 11 Apr 2023 15:01:19 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9773F14171D5;
 Tue, 11 Apr 2023 15:01:18 +0000 (UTC)
Date: Tue, 11 Apr 2023 17:01:17 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, qemu-block@nongnu.org,
 hreitz@redhat.com
Subject: Re: [PATCH 8.0 regression 0/8] block: remove bdrv_co_get_geometry
 coroutines from I/O hot path
Message-ID: <ZDV2PWaYQRVs4/3B@redhat.com>
References: <20230407153303.391121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407153303.391121-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am 07.04.2023 um 17:32 hat Paolo Bonzini geschrieben:
> The introduction of the graph lock is causing blk_get_geometry, a hot
> function used in the I/O path, to create a coroutine for the call to
> bdrv_co_refresh_total_sectors.
> 
> In theory the call to bdrv_co_refresh_total_sectors should only matter
> in the rare case of host CD-ROM devices, whose size changes when a medium
> is added or removed.  However, the call is actually keyed by a field in
> BlockDriver, drv->has_variable_length, and the field is true in the common
> case of the raw driver!  This is because the host CD-ROM is usually
> layered below the raw driver.
> 
> So, this series starts by moving has_variable_length from BlockDriver to
> BlockLimits.  This is patches 1-4, which also include a fix for a small
> latent bug (patch 3).
> 
> The second half of the series then cleans up the functions to retrieve
> the BlockDriverState's size (patches 5-7) to limit the amount of duplicated
> code introduced by the hand-written wrappers of patch 8.  The final result
> is that blk_get_geometry will not anymore create a coroutine.
> 
> This series applies to qemu.git, or to the block-next branch if commit
> d8fbf9aa85ae ("block/export: Fix graph locking in blk_get_geometry()
> call", 2023-03-27) is cherry picked.  Commit d8fbf9aa85ae is also where
> bdrv_co_get_geometry() was introduced and with it the performance
> regression.  It is quite a recent change, and therefore this is
> probably a regression in 8.0 that had not been detected yet (except by
> Stefan who talked to Kevin and me about it yesterday).  I'm not sure how
> we can avoid the regression, if not by disabling completely the graph lock
> (!) or applying this large series.
> 
> I'm throwing this out before disappearing for a couple days for Easter;
> I have only tested it with qemu-iotests and "make check-unit".

Thanks, fixed up patch 8 to make the non-coroutine wrappers almost exact
copies of the coroutine version (including fixing the bug that Eric
found), and applied to the block branch.

I'm not sure if the functions actually need to be coroutine_mixed_fn,
because coroutines should already call blk_co_get_geometry(), but we can
clean that up later.

Kevin


