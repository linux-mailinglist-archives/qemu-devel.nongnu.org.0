Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60097388CA1
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 13:21:32 +0200 (CEST)
Received: from localhost ([::1]:52228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljKGZ-0005lO-GM
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 07:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ljKFS-0004uY-57
 for qemu-devel@nongnu.org; Wed, 19 May 2021 07:20:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ljKFQ-0004Ir-8c
 for qemu-devel@nongnu.org; Wed, 19 May 2021 07:20:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621423219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ut7H8pjDhlLN0Zk1yHr0kPOHs/OxlK+xwlJkDEB1+fA=;
 b=Iq/1ROVdlvzeoWcBAKm+f86Y6wNOlieEDaCihrlNupY5ssOkS/s1XGR1GKh6G94PXjx5Ru
 GJiDrLErkSI3R21TzAvyE7FWKTKBthiSm0qZ5ZZNF+xjAov9671nsW1rPppibAP1k9aVT2
 8/IquLW5+oEQT4qCH6xgfEeWoMILob4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-7Xp2EnI2O_ulxrWD2Q7h4g-1; Wed, 19 May 2021 07:20:17 -0400
X-MC-Unique: 7Xp2EnI2O_ulxrWD2Q7h4g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79414101371B;
 Wed, 19 May 2021 11:20:16 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-58.ams2.redhat.com [10.36.115.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BB102AE99;
 Wed, 19 May 2021 11:20:08 +0000 (UTC)
Date: Wed, 19 May 2021 13:20:07 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: RFC: Qemu backup interface plans
Message-ID: <YKT0Z8aCZiCpcysd@merkur.fritz.box>
References: <ad71ced7-d0f6-5d99-4678-7d0e2d3e2561@virtuozzo.com>
 <eba2f2c5-a867-91bc-64ab-08dcd67a295d@redhat.com>
 <e3853894-ec71-bdd4-adea-b61fceee4ba5@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <e3853894-ec71-bdd4-adea-b61fceee4ba5@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Peter Krempa <pkrempa@redhat.com>, qemu-block@nongnu.org,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 Dmitry Mishin <dim@virtuozzo.com>, Igor Sukhih <igor@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 yur@virtuozzo.com, Nikolay Shirokovskiy <nshirokovskiy@virtuozzo.com>,
 "Denis V. Lunev" <den@openvz.org>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 19.05.2021 um 08:11 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > 2. Test, that we can start backup job with source = (target of
> > > backup-top filter), so that we have "push backup with fleecing".
> > > Make an option for backup to start without a filter, when we don't
> > > need copy-before-write operations, to not create extra superfluous
> > > filter.
> > 
> > OK, so the backup job is not really a backup job, but just anything
> > that copies data.
> 
> Not quite. For backup without a filter we should protect source from
> changing, by unsharing WRITE permission on it.
> 
> I'll try to avoid adding an option. The logic should work like in
> commit job: if there are current writers on source we create filter.
> If there no writers, we just unshare writes and go without a filter.
> And for this copy-before-write filter should be able to do
> WRITE_UNCHANGED in case of fleecing.

If we ever get to the point where we would make a block-copy job visible
to the user, I wouldn't copy the restrictions from the current jobs, but
keep it really generic to cover all cases.

There is no way for the QMP command starting the job to know what the
user is planning to do with the image in the future. Even if it's
currently read-only, the user may want to add a writer later.

I think this means that we want to always add a filter node, and then
possibly dynamically switch between modes if being read-only provides a
significant advantage for the job.

Kevin


