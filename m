Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F38A66243CC
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 15:02:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot87L-0007ik-0z; Thu, 10 Nov 2022 09:01:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ot87J-0007ia-10
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 09:01:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ot87H-00077r-3Q
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 09:01:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668088874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ofmZqiDWuEFCKD5Ztsqxkv1Vrpsth+8eP5q7VkG/8jg=;
 b=HHcHQdYOhNsVr1d3pO6PU41E9j92fejBm/CJgjVtEcwp5qIfPwNVfEGy485A1TEgB/LWoT
 etOQHWBT2JUSM2l0aiREkMOh+RGwOqIuSbk5z7NslgpbkLJIEYol6yK8sEgcpwEwYA4pxF
 bC7hXk7glD3NAWL+67A2e1f0V8rlbR0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-cWLvk4DkPx-CHARdwhWYQA-1; Thu, 10 Nov 2022 09:01:12 -0500
X-MC-Unique: cWLvk4DkPx-CHARdwhWYQA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CC873850E89;
 Thu, 10 Nov 2022 14:01:11 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6546112131B;
 Thu, 10 Nov 2022 14:01:10 +0000 (UTC)
Date: Thu, 10 Nov 2022 15:01:08 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 0/3] block: Start/end drain on correct AioContext
Message-ID: <Y20EJFt1w7xstZtC@redhat.com>
References: <20221107151321.211175-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221107151321.211175-1-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

Am 07.11.2022 um 16:13 hat Hanna Reitz geschrieben:
> Hi,
> 
> v1 cover letter:
> https://lists.nongnu.org/archive/html/qemu-block/2022-09/msg00389.html
> 
> bdrv_replace_child_noperm() drains the child via
> bdrv_parent_drained_{begin,end}_single().  When it removes a child, the
> bdrv_parent_drained_end_single() at its end will be called on an empty
> child, making the BDRV_POLL_WHILE() in it poll the main AioContext
> (because c->bs is NULL).
> 
> That’s wrong, though, because it’s supposed to operate on the parent.
> bdrv_parent_drained_end_single_no_poll() will have scheduled any BHs in
> the parents’ AioContext, which may be anything, not necessarily the main
> context.  Therefore, we must poll the parent’s context.
> 
> Patch 3 does this for both bdrv_parent_drained_{begin,end}_single().
> Patch 1 ensures that we can legally call
> bdrv_child_get_parent_aio_context() from those I/O context functions,
> and patch 2 fixes blk_do_set_aio_context() to not cause an assertion
> failure if it beginning a drain can end up in blk_get_aio_context()
> before blk->ctx has been updated.

Thanks, applied to the block branch.

I would still be interested in a test case as a follow-up.

Kevin


