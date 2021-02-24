Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 773CD3240F8
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 16:57:49 +0100 (CET)
Received: from localhost ([::1]:35054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEwXs-0007zB-EG
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 10:57:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEwVt-0006Ky-Fi
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:55:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEwVp-0001oQ-Je
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:55:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614182140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YayT9Aq7N7PjUhDNC+DYJR+XRasujo5kpAtxQopB+e4=;
 b=e7eJit+7vNtSLQpIl3GDs+KcXIEiCJX+Pt7GHoOIejBvO8uwBbv3FVumNU0QDEHp0JSb5t
 7O90KGP3uoMhmKmdaC2WPgrjJ396c3Sr+dAAPOBi+ggeAHOi3rPqWu1WZ6g8bZeADwgl86
 zSgWhxcqsCTpKL6WXvRaUPfEru2onmY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-MO1pOvdCMz-3Fp992FWk4g-1; Wed, 24 Feb 2021 10:55:38 -0500
X-MC-Unique: MO1pOvdCMz-3Fp992FWk4g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F1C211A1F2C;
 Wed, 24 Feb 2021 15:51:02 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-142.ams2.redhat.com [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5475A5D6A8;
 Wed, 24 Feb 2021 15:51:01 +0000 (UTC)
Date: Wed, 24 Feb 2021 16:50:59 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 3/3] iotests/283: Check that finalize drops backup-top
Message-ID: <20210224155059.GE11025@merkur.fritz.box>
References: <20210219153348.41861-1-mreitz@redhat.com>
 <20210219153348.41861-4-mreitz@redhat.com>
 <244e3b6f-591c-2e5b-64a8-b0f7eb295220@redhat.com>
MIME-Version: 1.0
In-Reply-To: <244e3b6f-591c-2e5b-64a8-b0f7eb295220@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 19.02.2021 um 16:59 hat Max Reitz geschrieben:
> On 19.02.21 16:33, Max Reitz wrote:
> > Without any of HEAD^ or HEAD^^ applied, qemu will most likely crash on
> > the qemu-io invocation, for a variety of immediate reasons.  The
> > underlying problem is generally a use-after-free access into
> > backup-top's BlockCopyState.
> > 
> > With only HEAD^ applied, qemu-io will run into an EIO (which is not
> > capture by the output, but you can see that the qemu-io invocation will
> > be accepted (i.e., qemu-io will run) in contrast to the reference
> > output, where the node name cannot be found), and qemu will then crash
> > in query-named-block-nodes: bdrv_get_allocated_file_size() detects
> > backup-top to be a filter and passes the request through to its child.
> > However, after bdrv_backup_top_drop(), that child is NULL, so the
> > recursive call crashes.
> > 
> > With HEAD^^ applied, this test should pass.
> > 
> > Signed-off-by: Max Reitz <mreitz@redhat.com>
> > ---
> >   tests/qemu-iotests/283     | 55 ++++++++++++++++++++++++++++++++++++++
> >   tests/qemu-iotests/283.out | 15 +++++++++++
> >   2 files changed, 70 insertions(+)
> > 
> > diff --git a/tests/qemu-iotests/283 b/tests/qemu-iotests/283
> > index 79643e375b..509dcbbcf4 100755
> > --- a/tests/qemu-iotests/283
> > +++ b/tests/qemu-iotests/283
> > @@ -97,3 +97,58 @@ vm.qmp_log('blockdev-add', **{
> >   vm.qmp_log('blockdev-backup', sync='full', device='source', target='target')
> >   vm.shutdown()
> > +
> > +
> > +"""
> > +Check that the backup-top node is gone after job-finalize.
> > +
> > +During finalization, the node becomes inactive and can no longer
> > +function.  If it is still present, new parents might be attached, and
> > +there would be no meaningful way to handle their I/O requests.
> > +"""
> 
> Oh no, 297/pylint complains that this “string statement has no effect”.
> Guess it should be a normal comment under the following print() then...

Thanks, fixed up the comment as you suggest and applied to the block
branch.

Kevin


