Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E13E3240F1
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 16:52:50 +0100 (CET)
Received: from localhost ([::1]:49648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEwT3-0002EK-Fj
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 10:52:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEwQH-0000IX-41
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:49:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEwQC-0007z9-NQ
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:49:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614181791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KfeOEZ1vWlZTt6deAF20ZwaU4GB9Ee+ARTFVXcflCIQ=;
 b=VPNYwe2L5Vk2DDH1WTbHTe4tIFL4gXFVPrl4kF4YGdepdZUiVrKhmt2to6JovpBnBLjke6
 g3fUTR4KG+k9S/fg+NmcUVYO/ARoMJSZA7+PHiJ67VSDJ1tjuqbnIt+p73YUFx3XuDSh3D
 ojR103yiMia2yNSFSZCZsY4DGaYqSac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-88kCeTXtNh22X9l1pPlSbg-1; Wed, 24 Feb 2021 10:49:48 -0500
X-MC-Unique: 88kCeTXtNh22X9l1pPlSbg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 742F61007300;
 Wed, 24 Feb 2021 15:33:04 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-142.ams2.redhat.com [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5015B19727;
 Wed, 24 Feb 2021 15:33:03 +0000 (UTC)
Date: Wed, 24 Feb 2021 16:33:01 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 1/3] backup: Remove nodes from job in .clean()
Message-ID: <20210224153301.GD11025@merkur.fritz.box>
References: <20210219153348.41861-1-mreitz@redhat.com>
 <20210219153348.41861-2-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210219153348.41861-2-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Am 19.02.2021 um 16:33 hat Max Reitz geschrieben:
> The block job holds a reference to the backup-top node (because it is
> passed as the main job BDS to block_job_create()).  Therefore,
> bdrv_backup_top_drop() cannot delete the backup-top node (replacing it
> by its child does not affect the job parent, because that has
> .stay_at_node set).  That is a problem, because all of its I/O functions
> assume the BlockCopyState (s->bcs) to be valid and that it has a
> filtered child; but after bdrv_backup_top_drop(), neither of those
> things are true.

This kind of suggests that block_copy_state_free() doesn't really belong
in bdrv_backup_top_drop(), but in a .bdrv_close callback.

Doesn't make this patch less correct, of course. We still want to have
all references dropped at the end of bdrv_backup_top_drop().

> It does not make sense to add new parents to backup-top after
> backup_clean(), so we should detach it from the job before
> bdrv_backup_top_drop().  Because there is no function to do that for a
> single node, just detach all of the job's nodes -- the job does not do
> anything past backup_clean() anyway.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


