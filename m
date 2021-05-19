Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C35CB388D70
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 14:03:58 +0200 (CEST)
Received: from localhost ([::1]:58402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljKvd-000633-E4
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 08:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ljKsv-0002W2-F9
 for qemu-devel@nongnu.org; Wed, 19 May 2021 08:01:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ljKsl-0004Ef-ED
 for qemu-devel@nongnu.org; Wed, 19 May 2021 08:01:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621425657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pq+rG7hJdl0vY3claS72cBYfZgI/jOXZ38IOFSkTBOk=;
 b=XdraOE1vkUrXvie7yNU+NWL7OIs2uhbGSHnYGj3o04peAZY1Wiwr1hc5MtikMTyuNPragu
 fNzzcH+d/MEadNO97vRiOpS973oKiY2Am+DSScJ5LvGCpYJHjGvt7BTLIqV8r6xkVDXkfl
 XBBFGK2Hu63kVfW0V/k8ahlQngbfXt8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-KaWtLzUdPm6ajF6ZSOZotg-1; Wed, 19 May 2021 08:00:55 -0400
X-MC-Unique: KaWtLzUdPm6ajF6ZSOZotg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8612A101371F;
 Wed, 19 May 2021 12:00:54 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-58.ams2.redhat.com [10.36.115.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0811D5D9C0;
 Wed, 19 May 2021 12:00:51 +0000 (UTC)
Date: Wed, 19 May 2021 14:00:50 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: RFC: Qemu backup interface plans
Message-ID: <YKT98o8DNl1kJiyK@merkur.fritz.box>
References: <ad71ced7-d0f6-5d99-4678-7d0e2d3e2561@virtuozzo.com>
 <eba2f2c5-a867-91bc-64ab-08dcd67a295d@redhat.com>
 <e3853894-ec71-bdd4-adea-b61fceee4ba5@virtuozzo.com>
 <YKT0Z8aCZiCpcysd@merkur.fritz.box>
 <b519b530-f268-59af-145e-6370004bdbdd@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <b519b530-f268-59af-145e-6370004bdbdd@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am 19.05.2021 um 13:49 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 19.05.2021 14:20, Kevin Wolf wrote:
> > Am 19.05.2021 um 08:11 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > > > 2. Test, that we can start backup job with source = (target of
> > > > > backup-top filter), so that we have "push backup with fleecing".
> > > > > Make an option for backup to start without a filter, when we don't
> > > > > need copy-before-write operations, to not create extra superfluous
> > > > > filter.
> > > > 
> > > > OK, so the backup job is not really a backup job, but just anything
> > > > that copies data.
> > > 
> > > Not quite. For backup without a filter we should protect source from
> > > changing, by unsharing WRITE permission on it.
> > > 
> > > I'll try to avoid adding an option. The logic should work like in
> > > commit job: if there are current writers on source we create filter.
> > > If there no writers, we just unshare writes and go without a filter.
> > > And for this copy-before-write filter should be able to do
> > > WRITE_UNCHANGED in case of fleecing.
> > 
> > If we ever get to the point where we would make a block-copy job visible
> > to the user, I wouldn't copy the restrictions from the current jobs, but
> > keep it really generic to cover all cases.
> > 
> > There is no way for the QMP command starting the job to know what the
> > user is planning to do with the image in the future. Even if it's
> > currently read-only, the user may want to add a writer later.
> > 
> > I think this means that we want to always add a filter node, and then
> > possibly dynamically switch between modes if being read-only provides a
> > significant advantage for the job.
> 
> Still, in push-backup-with-fleecing scheme we really don't need the
> second filter, so why to insert extra thing to block graph?
> 
> I see your point still, that user may want to add writer later. Still,
> I'd be surprised if such use-cases exist now.
> 
> What about the following:
> 
> add some source-mode tri-state parameter for backup:
> 
> auto: insert filter iff there are existing writers [default]
> filtered: insert filter unconditionally
> immutable: don't insert filter. will fail if there are existing
> writers, and creating writers during block-job would be impossible

Yes, that's an option, too.

Kevin


