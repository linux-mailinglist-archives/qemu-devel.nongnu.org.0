Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FC128174C
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 17:59:40 +0200 (CEST)
Received: from localhost ([::1]:48374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kONT9-00016H-Kr
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 11:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kONQF-0007kC-UP
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 11:56:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kONQ4-0006NJ-2c
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 11:56:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601654187;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/vU7/rX1RmuOlDxg8zsajDMlz96tOhIoFHNZANkcxJc=;
 b=U+xlen669Ip8TrRFJJcikIfW31qQxTuD0IHCzayL9N1GHp5svy9eGRh9soAoMZJ55N9R/f
 LJwtmBwm57iWaOorAS1hgUntvNkgmwi7LFWuKGGcV2HOHKi8q9VbUM30rV382BY0n3bHiJ
 4B1bGjFmCvy97u9lhHQ4r7O8x1kGq/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-5AY9jjJtMHqC3JvieaKdZA-1; Fri, 02 Oct 2020 11:56:25 -0400
X-MC-Unique: 5AY9jjJtMHqC3JvieaKdZA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B162A186842A;
 Fri,  2 Oct 2020 15:56:23 +0000 (UTC)
Received: from redhat.com (ovpn-114-9.ams2.redhat.com [10.36.114.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E87F72C31E;
 Fri,  2 Oct 2020 15:56:19 +0000 (UTC)
Date: Fri, 2 Oct 2020 16:56:17 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v4 9/9] migration: introduce snapshot-{save, load,
 delete} QMP commands
Message-ID: <20201002155617.GN2338114@redhat.com>
References: <20200915113523.2520317-1-berrange@redhat.com>
 <20200915113523.2520317-10-berrange@redhat.com>
 <87tuvyt9sf.fsf@dusky.pond.sub.org>
 <0b8eef3d-db87-f82b-798d-2a0cb7ec1198@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0b8eef3d-db87-f82b-798d-2a0cb7ec1198@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 23:37:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 "Denis V. Lunev" <den@virtuozzo.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 21, 2020 at 01:16:16PM -0500, Eric Blake wrote:
> On 9/16/20 3:17 AM, Markus Armbruster wrote:
> > Daniel P. Berrangé <berrange@redhat.com> writes:
> > 
> > > savevm, loadvm and delvm are some of the few HMP commands that have never
> > > been converted to use QMP. The reasons for the lack of conversion are
> > > that they blocked execution of the event thread, and the semantics
> > > around choice of disks were ill-defined.
> > > 
> > > Despite this downside, however, libvirt and applications using libvirt
> > > have used these commands for as long as QMP has existed, via the
> > > "human-monitor-command" passthrough command. IOW, while it is clearly
> > > desirable to be able to fix the problems, they are not a blocker to
> > > all real world usage.
> > > 
> > > Meanwhile there is a need for other features which involve adding new
> > > parameters to the commands. This is possible with HMP passthrough, but
> > > it provides no reliable way for apps to introspect features, so using
> > > QAPI modelling is highly desirable.
> > > 
> > > This patch thus introduces new snapshot-{load,save,delete} commands to
> > > QMP that are intended to replace the old HMP counterparts. The new
> > > commands are given different names, because they will be using the new
> > > QEMU job framework and thus will have diverging behaviour from the HMP
> > > originals. It would thus be misleading to keep the same name.
> > > 
> > > While this design uses the generic job framework, the current impl is
> > > still blocking. The intention that the blocking problem is fixed later.
> > > None the less applications using these new commands should assume that
> > > they are asynchronous and thus wait for the job status change event to
> > > indicate completion.
> > > 
> > > In addition to using the job framework, the new commands require the
> > > caller to be explicit about all the block device nodes used in the
> > > snapshot operations, with no built-in default heuristics in use.
> > > 
> > > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > [...]
> > > diff --git a/qapi/job.json b/qapi/job.json
> > > index 280c2f76f1..b2cbb4fead 100644
> > > --- a/qapi/job.json
> > > +++ b/qapi/job.json
> > > @@ -22,10 +22,17 @@
> > >   #
> > >   # @amend: image options amend job type, see "x-blockdev-amend" (since 5.1)
> > >   #
> > > +# @snapshot-load: snapshot load job type, see "snapshot-load" (since 5.2)
> > > +#
> > > +# @snapshot-save: snapshot save job type, see "snapshot-save" (since 5.2)
> > > +#
> > > +# @snapshot-delete: snapshot delete job type, see "snapshot-delete" (since 5.2)
> > > +#
> > >   # Since: 1.7
> > >   ##
> > >   { 'enum': 'JobType',
> > > -  'data': ['commit', 'stream', 'mirror', 'backup', 'create', 'amend'] }
> > > +  'data': ['commit', 'stream', 'mirror', 'backup', 'create', 'amend',
> > > +           'snapshot-load', 'snapshot-save', 'snapshot-delete'] }
> > >   ##
> > >   # @JobStatus:
> > > diff --git a/qapi/migration.json b/qapi/migration.json
> > > index 675f70bb67..b584c0be31 100644
> > > --- a/qapi/migration.json
> > > +++ b/qapi/migration.json
> > > @@ -1720,3 +1720,123 @@
> > >   ##
> > >   { 'event': 'UNPLUG_PRIMARY',
> > >     'data': { 'device-id': 'str' } }
> > > +
> > > +##
> > > +# @snapshot-save:
> > > +#
> > > +# Save a VM snapshot
> > > +#
> > > +# @job-id: identifier for the newly created job
> > > +# @tag: name of the snapshot to create
> > > +# @devices: list of block device node names to save a snapshot to
> > 
> > Looks like you dropped the idea to also accept drive IDs.  Is that for
> > good, or would you like to add it later?
> 
> Is it necessary?  Several of our newer block interfaces have required node
> names, rather than permitting alternation.  If we rewrite the existing HMP
> commands to operate on top of the new QMP command, it is still possible for
> HMP to support drive names even when QMP does not.  I don't think the
> complexity of worrying about drive names is worth it; after all, the QMP
> command is new enough that the only libvirt that will use it is also a
> libvirt that knows how to use -blockdev, and thus node names are sufficient.
> 
> Yes, we can add drive ids later if I turn out to be wrong, but for now, I'm
> hoping their exclusion is intentional.

I didn't realize we have precedent for new commands only accepting
node names. Given that, I'm going to stick with this design and
only support node names.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


