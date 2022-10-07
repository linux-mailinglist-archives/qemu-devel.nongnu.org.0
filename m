Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E99065F75C8
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 11:12:39 +0200 (CEST)
Received: from localhost ([::1]:42888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogjPL-0003Hs-1A
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 05:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogjJ2-0000Ik-9E
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 05:06:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogjIx-0005V6-HQ
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 05:06:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665133563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JhKslZP7W36V84fs6nRI4aCIWjE34hGOTKv9+cpsWDU=;
 b=Ptpfw+X+HMnLbYTHvb6V0AItOWTJk7dkBlI8XEN0Br7IWzlbb/O3ODGR0ExLAHoxHmCEMF
 YlxpyLG3qrQHKL6mv9Y8iWGU+XhSzIgcwWUj0DZhBloOt3rdd6hwv0uCHWJzS9fCvN6tDE
 zYaBqYiLDaU7KNE6UffI4tSQEvgkagk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-0JYmXBLvMrS5aPZN6YWgrw-1; Fri, 07 Oct 2022 05:05:59 -0400
X-MC-Unique: 0JYmXBLvMrS5aPZN6YWgrw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7365E3826A44;
 Fri,  7 Oct 2022 09:05:59 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB71B111CA08;
 Fri,  7 Oct 2022 09:05:58 +0000 (UTC)
Date: Fri, 7 Oct 2022 11:05:57 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 3/3] block: Start/end drain on correct AioContext
Message-ID: <Yz/r9Y3M0z6WEHkT@redhat.com>
References: <20220923125227.300202-1-hreitz@redhat.com>
 <20220923125227.300202-4-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220923125227.300202-4-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.09.2022 um 14:52 hat Hanna Reitz geschrieben:
> bdrv_parent_drained_{begin,end}_single() are supposed to operate on the
> parent, not on the child, so they should not attempt to get the context
> to poll from the child but the parent instead.  BDRV_POLL_WHILE(c->bs)
> does get the context from the child, so we should replace it with
> AIO_WAIT_WHILE() on the parent's context instead.
> 
> This problem becomes apparent when bdrv_replace_child_noperm() invokes
> bdrv_parent_drained_end_single() after removing a child from a subgraph
> that is in an I/O thread.  By the time bdrv_parent_drained_end_single()
> is called, child->bs is NULL, and so BDRV_POLL_WHILE(c->bs, ...) will
> poll the main loop instead of the I/O thread; but anything that
> bdrv_parent_drained_end_single_no_poll() may have scheduled is going to
> want to run in the I/O thread, but because we poll the main loop, the
> I/O thread is never unpaused, and nothing is run, resulting in a
> deadlock.
> 
> Closes: https://gitlab.com/qemu-project/qemu/-/issues/1215
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>

Hmm... Seeing a BdrvChild with child->bs == NULL outside of functions
directly manipulating it is surprising. I think we need to document that
at least for bdrv_parent_drained_begin/end_single(), that they can get
such BdrvChild objects passed.

Even then, polling with an incomplete BdrvChild in the graph doesn't
sound like the best idea either, but not sure how to avoid that best.
Maybe we would need a different order in bdrv_replace_child_noperm() if
either old_bs or new_bs is NULL.

Anyway, the code change itself looks reasonable:

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


