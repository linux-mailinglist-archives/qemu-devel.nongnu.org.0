Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CC563A890
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 13:40:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozdOc-0001YG-JD; Mon, 28 Nov 2022 07:38:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ozdO2-0001WT-Qh
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 07:37:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ozdO0-0003Mu-So
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 07:37:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669639042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eaOYjpz0dF7JxXEbgo5/zz6H39rde7jeaUZiVsm26y8=;
 b=f7W3NaWe/a2iw6PJj8NhlshSe2IMn8dH+JqtOpUSEOw2xeqfcJ4rVuSDBHw0wY+vEBmsc2
 Avmnk80/AUTq3hJ5pFqoonJatArSFhhTUghjAU4TC+/m8GUp/27iP+0DTGXeBB5kW+qgVo
 8kr+0T2LoYr2tztNEAFVxDNtmYlJAsk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-BD3-UVoUNWuwxvnLK2UQZA-1; Mon, 28 Nov 2022 07:37:21 -0500
X-MC-Unique: BD3-UVoUNWuwxvnLK2UQZA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D85F58828C2;
 Mon, 28 Nov 2022 12:37:20 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B968C112132D;
 Mon, 28 Nov 2022 12:37:19 +0000 (UTC)
Date: Mon, 28 Nov 2022 13:37:15 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-block@nongnu.org, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 11/15] block: Call drain callbacks only once
Message-ID: <Y4Sre2NtpGtuA9AF@redhat.com>
References: <20221118174110.55183-1-kwolf@redhat.com>
 <20221118174110.55183-12-kwolf@redhat.com>
 <2f4a4c25-c215-bec9-5148-5b5892232345@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f4a4c25-c215-bec9-5148-5b5892232345@yandex-team.ru>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Am 25.11.2022 um 15:59 hat Vladimir Sementsov-Ogievskiy geschrieben:
> On 11/18/22 20:41, Kevin Wolf wrote:
> > We only need to call both the BlockDriver's callback and the parent
> > callbacks when going from undrained to drained or vice versa. A second
> > drain section doesn't make a difference for the driver or the parent,
> > they weren't supposed to send new requests before and after the second
> > drain.
> > 
> > One thing that gets in the way is the 'ignore_bds_parents' parameter in
> > bdrv_do_drained_begin_quiesce() and bdrv_do_drained_end(): It means that
> > bdrv_drain_all_begin() increases bs->quiesce_counter, but does not
> > quiesce the parent through BdrvChildClass callbacks. If an additional
> > drain section is started now, bs->quiesce_counter will be non-zero, but
> > we would still need to quiesce the parent through BdrvChildClass in
> > order to keep things consistent (and unquiesce it on the matching
> > bdrv_drained_end(), even though the counter would reach 0 yet as long as
> 
> would reach -> would NOT reach
> 
> if I understand correctly)

Yes, you're right. Thanks for catching it. Fixing this while applying
the series.

Kevin

> > the bdrv_drain_all() section is still active).
> > 
> > Instead of keeping track of this, let's just get rid of the parameter.
> > It was introduced in commit 6cd5c9d7b2d as an optimisation so that
> > during bdrv_drain_all(), we wouldn't recursively drain all parents up to
> > the root for each node, resulting in quadratic complexity. As it happens,
> > calling the callbacks only once solves the same problem, so as of this
> > patch, we'll still have O(n) complexity and ignore_bds_parents is not
> > needed any more.
> > 
> > This patch only ignores the 'ignore_bds_parents' parameter. It will be
> > removed in a separate patch.
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > Reviewed-by: Hanna Reitz <hreitz@redhat.com>
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> 
> 
> 
> 
> -- 
> Best regards,
> Vladimir
> 


