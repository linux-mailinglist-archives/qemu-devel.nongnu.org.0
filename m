Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A3A41E963
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 11:06:38 +0200 (CEST)
Received: from localhost ([::1]:33864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWEV0-0005zz-LP
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 05:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mWERL-00025u-Nv
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 05:02:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mWERH-0005rn-6y
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 05:02:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633078960;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=h02nqfp8RCpQakVSP4ApThZJ4aYWZwAtlhml1//tolg=;
 b=CrPgHiA/wpzgnKXOuWRmpNFsVY9WBtpnXK0l9oSzaEyZ+FKGe3HQG1UTsf9IBXGQTVGd1s
 M6hQfp2LSWzrK9CbKyFQ39AWkjadldH8B2eWMOBQx5E/bgYWCrbCQpjhNOzBqLo9tEEjoK
 qYHsKTbOmASBp5AUrfA7XU+QnPyDd6Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-GVlhjqfuMp6jfnKY97WM6Q-1; Fri, 01 Oct 2021 05:02:37 -0400
X-MC-Unique: GVlhjqfuMp6jfnKY97WM6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69C56802C98
 for <qemu-devel@nongnu.org>; Fri,  1 Oct 2021 09:02:36 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C7E319736;
 Fri,  1 Oct 2021 09:01:45 +0000 (UTC)
Date: Fri, 1 Oct 2021 10:01:43 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Laine Stump <laine@redhat.com>
Subject: Re: [PATCH] failover: allow to pause the VM during the migration
Message-ID: <YVbOd7dYNst3BBfA@redhat.com>
References: <20210930170926.1298118-1-lvivier@redhat.com>
 <f1898bf0-dadb-4e2e-a45a-9087d2c63678@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f1898bf0-dadb-4e2e-a45a-9087d2c63678@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Libvirt <libvir-list@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Jiri Denemark <jdenemar@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 30, 2021 at 04:17:44PM -0400, Laine Stump wrote:
> On 9/30/21 1:09 PM, Laurent Vivier wrote:
> > If we want to save a snapshot of a VM to a file, we used to follow the
> > following steps:
> > 
> > 1- stop the VM:
> >     (qemu) stop
> > 
> > 2- migrate the VM to a file:
> >     (qemu) migrate "exec:cat > snapshot"
> > 
> > 3- resume the VM:
> >     (qemu) cont
> > 
> > After that we can restore the snapshot with:
> >    qemu-system-x86_64 ... -incoming "exec:cat snapshot"
> >    (qemu) cont
> 
> This is the basics of what libvirt does for a snapshot, and steps 1+2 are
> what it does for a "managedsave" (where it saves the snapshot to disk and
> then terminates the qemu process, for later re-animation).
> 
> In those cases, it seems like this new parameter could work for us - instead
> of explicitly pausing the guest prior to migrating it to disk, we would set
> this new parameter to on, then directly migrate-to-disk (relying on qemu to
> do the pause). Care will need to be taken to assure that error recovery
> behaves the same though.

What libvirt does is actually quite different from this in a signficant
way.  In the HMP example here 'migrate' is a blocking command that does
not return until migration is finished.

Libvirt uses QMP and 'migrate' there is a asynchronous command that merely
launches the migration and returns control to the client.

IOW, what libvirt does is

    stop
    migrate
    while status != failed || completed
       query-migrate
       
       ...also receive any QMP migration events...

       ...possibly modify migration parameters...

    cont

With this pattern I'm not seeing any need for a new migration parameter
for libvirt. The migration status lets us distinguish when QEMU is in
the "waiting for unplug" phase vs the "active" phase. So AFAICT, libvirt
can do:

    migrate
    while status != failed || completed
       query-migrate
       
       ...also receive any QMP migration events..

       if status changed wait-for-unplug to active
         stop

       ...possibly modify migration parameters...

    cont


There is a small window here when the guest CPUs are running
but migration is active.  In most cases for libvirt that is
harmless.  If there are cases where libvirt needs a strong
guarantee to synchonize the 'stop' with some other option,
then the new proposed "pause-vm" parameter as the same problem
as libvirt can't sychronize against that either.


> There are a couple of cases when libvirt apparently *doesn't* pause the
> guest during the migrate-to-disk, both having to do with saving a coredump
> of the guest. Since I really have no idea of how common/important that is
> (or even if my assessment of the code is correct), I'm Cc'ing this patch to
> libvir-list to make sure it catches the attention of someone who knows the
> answers and implications.

IIUC, the problem with unplug only happens when libvirt pauses
the guest. So surely if there are some scenarios where we're not
pausing the guest, there's no problem to solve for those.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


