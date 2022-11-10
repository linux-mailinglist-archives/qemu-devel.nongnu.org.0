Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 008E962488F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 18:47:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otBdJ-0001Da-Do; Thu, 10 Nov 2022 12:46:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1otBdH-0001D7-6d
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 12:46:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1otBdF-0005DG-9d
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 12:46:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668102388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gNSXoGsb1MyjjZh3k3wUX/1a0zqzZ3ELTDM0moh8/ho=;
 b=I2Z6ecAbcqu0nVV3XFv5Isr4kFnF82MrD7zRTm4cSrSixHLNFQYcH2zUqxjnTUWd2jGb+X
 YHnYKdaND84vVrr4HDJMLr54aXQSV15FTA0sImAmNhrDb6W6BzBPu3CX+5h3w5mNGdevL9
 LLlvykEB2LTgTz4JEe3iY7c2SvXxf8o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-vT2wlnqFOGmWZY6piEHuuw-1; Thu, 10 Nov 2022 12:46:25 -0500
X-MC-Unique: vT2wlnqFOGmWZY6piEHuuw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17C8C185A79C;
 Thu, 10 Nov 2022 17:46:25 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 53EA640C83DF;
 Thu, 10 Nov 2022 17:46:24 +0000 (UTC)
Date: Thu, 10 Nov 2022 18:46:23 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 0/3] block: Start/end drain on correct AioContext
Message-ID: <Y2047+8HinvJE25K@redhat.com>
References: <20221107151321.211175-1-hreitz@redhat.com>
 <Y20EJFt1w7xstZtC@redhat.com>
 <4b94c12a-13d3-67a0-f46b-631c40e2b2cb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4b94c12a-13d3-67a0-f46b-631c40e2b2cb@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

Am 10.11.2022 um 17:11 hat Hanna Reitz geschrieben:
> On 10.11.22 15:01, Kevin Wolf wrote:
> > Am 07.11.2022 um 16:13 hat Hanna Reitz geschrieben:
> > > Hi,
> > > 
> > > v1 cover letter:
> > > https://lists.nongnu.org/archive/html/qemu-block/2022-09/msg00389.html
> > > 
> > > bdrv_replace_child_noperm() drains the child via
> > > bdrv_parent_drained_{begin,end}_single().  When it removes a child, the
> > > bdrv_parent_drained_end_single() at its end will be called on an empty
> > > child, making the BDRV_POLL_WHILE() in it poll the main AioContext
> > > (because c->bs is NULL).
> > > 
> > > That’s wrong, though, because it’s supposed to operate on the parent.
> > > bdrv_parent_drained_end_single_no_poll() will have scheduled any BHs in
> > > the parents’ AioContext, which may be anything, not necessarily the main
> > > context.  Therefore, we must poll the parent’s context.
> > > 
> > > Patch 3 does this for both bdrv_parent_drained_{begin,end}_single().
> > > Patch 1 ensures that we can legally call
> > > bdrv_child_get_parent_aio_context() from those I/O context functions,
> > > and patch 2 fixes blk_do_set_aio_context() to not cause an assertion
> > > failure if it beginning a drain can end up in blk_get_aio_context()
> > > before blk->ctx has been updated.
> > Thanks, applied to the block branch.
> 
> Thanks!
> 
> I tested your drain series, and it does indeed fix the bug, too.
> (Sorry for the delay, I thought it’d take less time to write an
> iotest...)

Thanks for testing, it's good to have this confirmed.

> > I would still be interested in a test case as a follow-up.
> 
> Got it working now and sent as “tests/stream-under-throttle: New test”.

Great! I'll take a look.

Kevin


