Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A4160C9D3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 12:20:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onH1N-0004fp-1P; Tue, 25 Oct 2022 06:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1onH0r-0004Cw-Ve
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 06:18:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1onH0p-0006vB-NR
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 06:18:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666693102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oqbesKNl/U4/92H/m4vq3FB2XWnmTzbGx/5AmTYTESA=;
 b=W7e5kww9o8xsCZM3Eg7omx6/k+GnaJ+mUKaGhIUasV2WvVDQmip2Or0GBIoq1cg8zHk3EE
 fp0sv2j5RuWGgV5c4y1BCN7h68XVLQg6NHHpeVQhP/DumuHzrmQvDmb1xgN/+n55v/aTdQ
 LQGnqfBzEEfCjXHoaaBxI8ELMdTZLHE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-RByOjxj1Mm-bP2xa95O9kw-1; Tue, 25 Oct 2022 06:18:21 -0400
X-MC-Unique: RByOjxj1Mm-bP2xa95O9kw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF7311C09B89;
 Tue, 25 Oct 2022 10:18:20 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.164])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2276C492B29;
 Tue, 25 Oct 2022 10:18:18 +0000 (UTC)
Date: Tue, 25 Oct 2022 12:18:11 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 00/10] Refactor bdrv_try_set_aio_context using
 transactions
Message-ID: <Y1e348GtAXQs/mLm@redhat.com>
References: <20221025084952.2139888-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221025084952.2139888-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 25.10.2022 um 10:49 hat Emanuele Giuseppe Esposito geschrieben:
> The aim of this series is to reorganize bdrv_try_set_aio_context
> and drop BDS ->set_aio_context and ->can_set_aio_ctx callbacks in
> favour of a new one, ->change_aio_ctx.
> 
> More informations in patch 3 (which is also RFC, due to the doubts
> I have with AioContext locks).
> 
> Patch 1 just add assertions in the code, 2 extends the transactions API to be able to add also transactions in the tail
> of the list.
> Patch 3 is the core of this series, and introduces the new callback.
> It is marked as RFC and the reason is explained in the commit message.
> Patches 4-5-6 implement ->change_aio_ctx in the various block, blockjob
> and block-backend BDSes.
> Patch 7 substitutes ->change_aio_ctx with the old callbacks, and
> patch 8 takes care of deleting the old callbacks and unused code.
> 
> This series is based on "job: replace AioContext lock with job_mutex",
> but just because it uses job_set_aio_context() introduced there.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Based-on: <20220706201533.289775-1-eesposit@redhat.com>
> ---
> v3:
> * add aiocontext lock acquire/remove around bdrv_detach_aio_context
> * typos and nitpicks
> * remove patch 4: bdrv_child_try_change_aio_context: add transaction parameter

Thanks, applied to the block branch.

Kevin


