Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B38213E5F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 19:15:13 +0200 (CEST)
Received: from localhost ([::1]:45392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrPHM-00054R-Ey
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 13:15:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jrPCZ-0006CN-5a
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 13:10:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57355
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jrPCW-0001ew-AH
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 13:10:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593796211;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d60eSZ5KRTL/FNyuZeELxjzbcwGLIYRwWmygS/ckOOI=;
 b=X6jTFlnMbWNY0VdzMS0RFjzfPoelrzqtu3xbtxcovMGl4klc7qBdMxsUY1a5OUYv2sDNn9
 QfKFV332IqGsS/GOgs3NIyfj2oNitSNZCQVTBSPeuz2cp6j83b7VZvGu9Rf6OOJMe8eaHY
 /01xcFYkoivonIVLFQfhzhiEDGNUZcY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-kF1zaQSNPL2i_t9RlhAc6w-1; Fri, 03 Jul 2020 13:10:09 -0400
X-MC-Unique: kF1zaQSNPL2i_t9RlhAc6w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D4A68064B3;
 Fri,  3 Jul 2020 17:10:08 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B0C97AC83;
 Fri,  3 Jul 2020 17:10:03 +0000 (UTC)
Date: Fri, 3 Jul 2020 18:10:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 2/6] migration: introduce savevm, loadvm, delvm QMP
 commands
Message-ID: <20200703171000.GR2213227@redhat.com>
References: <20200702175754.2211821-3-berrange@redhat.com>
 <fcff0e8b-fd60-2897-0553-49ab24a9b7fa@redhat.com>
 <20200702182452.GP1888119@redhat.com>
 <20200703154933.GE6641@work-vm>
 <20200703160235.GM2213227@redhat.com>
 <20200703161012.GH6641@work-vm>
 <20200703161654.GN2213227@redhat.com>
 <20200703162246.GI6641@work-vm>
 <20200703164958.GP2213227@redhat.com>
 <20200703170050.GK6641@work-vm>
MIME-Version: 1.0
In-Reply-To: <20200703170050.GK6641@work-vm>
User-Agent: Mutt/1.14.3 (2020-06-14)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 02:53:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 03, 2020 at 06:00:50PM +0100, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > On Fri, Jul 03, 2020 at 05:22:46PM +0100, Dr. David Alan Gilbert wrote:
> > > * Daniel P. BerrangÃÂ© (berrange@redhat.com) wrote:
> > > > On Fri, Jul 03, 2020 at 05:10:12PM +0100, Dr. David Alan Gilbert wrote:
> > > > > * Daniel P. BerrangÃÂ© (berrange@redhat.com) wrote:
> > > > > > On Fri, Jul 03, 2020 at 04:49:33PM +0100, Dr. David Alan Gilbert wrote:
> > > > > > > * Daniel P. BerrangÃÂ© (berrange@redhat.com) wrote:
> > > > > > > > On Thu, Jul 02, 2020 at 01:12:52PM -0500, Eric Blake wrote:
> > > > > > > > > On 7/2/20 12:57 PM, Daniel P. BerrangÃÂ© wrote:
> > > > > > > > > > savevm, loadvm and delvm are some of the few commands that have never
> > > > > > > > > > been converted to use QMP. The primary reason for this lack of
> > > > > > > > > > conversion is that they block execution of the thread for as long as
> > > > > > > > > > they run.
> > > > > > > > > > 
> > > > > > > > > > Despite this downside, however, libvirt and applications using libvirt
> > > > > > > > > > has used these commands for as long as QMP has existed, via the
> > > > > > > > > > "human-monitor-command" passthrough command. IOW, while it is clearly
> > > > > > > > > > desirable to be able to fix the blocking problem, this is not an
> > > > > > > > > > immediate obstacle to real world usage.
> > > > > > > > > > 
> > > > > > > > > > Meanwhile there is a need for other features which involve adding new
> > > > > > > > > > parameters to the commands. This is possible with HMP passthrough, but
> > > > > > > > > > it provides no reliable way for apps to introspect features, so using
> > > > > > > > > > QAPI modelling is highly desirable.
> > > > > > > > > > 
> > > > > > > > > > This patch thus introduces trival savevm, loadvm, delvm commands
> > > > > > > > > 
> > > > > > > > > trivial
> > > > > > > > > 
> > > > > > > > > > to QMP that are functionally identical to the HMP counterpart, including
> > > > > > > > > > the blocking problem.
> > > > > > > > > 
> > > > > > > > > Should we name them 'x-savevm', 'x-loadvm', 'x-delvm' to give ourselves room
> > > > > > > > > to change them when we DO solve the blocking issue?  Or will the solution of
> > > > > > > > > the blocking issue introduce new QMP commands, at which point we can add QMP
> > > > > > > > > deprecation markers on these commands to eventually retire them?
> > > > > > > > 
> > > > > > > > I was in two minds about this, so I'm open to arguments either way.
> > > > > > > > 
> > > > > > > > The primary goal is for libvirt to consume the APIs as soon as possible,
> > > > > > > > and generally libvirt doesn't want todo this is they are declared experimental
> > > > > > > > via a "x-" prefix. So that pushes me away from "x-".
> > > > > > > > 
> > > > > > > > If we don't have an "x-" prefix and want to make changes, we can add extra
> > > > > > > > parameters to trigger new behaviour in backwards compatible manner. Or we can
> > > > > > > > simply deprecate these commands, deleting them 2 releases later, while adding
> > > > > > > > completely new commands.
> > > > > > > > 
> > > > > > > > If we think the prposed design will definitely need incompatible changes in
> > > > > > > > a very short time frame though, that would push towards "x-".
> > > > > > > > 
> > > > > > > > So IMHO the right answer largely depends on whether there is a credible
> > > > > > > > strategy to implement the ideal non-blocking solution in a reasonable amount
> > > > > > > > of time. I can't justify spending much time on this myself, but I'm willing
> > > > > > > > to consider & try proposals for solving the blocking problem if they're not
> > > > > > > > too complex / invasive.
> > > > > > > 
> > > > > > > Remind me, what was the problem with just making a block: migration
> > > > > > > channel, and then we can migrate to it?
> > > > > > 
> > > > > > migration only does vmstate, not disks. The current blockdev commands
> > > > > > are all related to external snapshots, nothing for internal snapshots
> > > > > > AFAIK. So we still need commands to load/save internal snapshots of
> > > > > > the disk data in the qcow2 files.
> > > > > > 
> > > > > > So we could look at loadvm/savevm conceptually as a syntax sugar above
> > > > > > a migration transport that targets disk images, and blockdev QMP command
> > > > > > that can do internal snapshots. Neither of these exist though and feel
> > > > > > like a significantly larger amount of work than using existing functionality
> > > > > > that is currently working.
> > > > > 
> > > > > I think that's what we should aim for; adding this wrapper isn't gaining
> > > > > that much without moving a bit towards that; so I would stick with the
> > > > > x- for now.
> > > > 
> > > > The question is how much work that approach will be and whether anyone can
> > > > realistically commit to doing that ? It looks like a much larger piece of
> > > > work in both QEMU and libvirt side to do that. I don't want to see us stuck
> > > > with a x-savevm for years because no one has resource to work on the perfect
> > > > solution. If we did get a perfect solution at a point in future, we can
> > > > still deprecate and then remove any "savevm" command we add to QMP.
> > > 
> > > I'd at least like to understand that we've got a worklist for it though.
> > > We've already got qemu_fopen_bdrv - what's actually wrong with that - is
> > > that enough to do the migrate to a stream (given a tiny amount of
> > > syntax) ?
> > 
> > It is close. The migration code works with the QEMUFile layer, but in terms
> > of the monitor commands the current framework expects a QIOChannel based
> > QEMUFile. It would be possible to add new helpers to work with the bdrv
> > backed QEMUFile. The ideal would be to create a QIOChannel impl that is
> > backed by a block device though. At that point there would only be a single
> > QEMUFile impl based on QIOChannel. 
> > 
> > That would be another step closer to unlocking the ability to eliminate the
> > QEMUFile wrapper entirely. QEMUFile does I/O buffering too for performance,
> > that could be done in a QIOChannel layer too, as that's a concept useful
> > for other QIOChannel users too.
> 
> There's some separate patches on list to do buffering in bdrv for
> vmsave because apparently the qemufile ones don't play well with it.
> 
> > That's still only the vmstate part though, and a solution is needed for
> > the internal snapshot handling.
> 
> Which bit is the bit that makes it block?

The entire  save_snapshot / load_snapshot methods really. They doing I/O
operations throughout and this executes in context of the thread running
the monitor, so their execution time is proportional to I/O time.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


