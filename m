Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DFE41E87F
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 09:41:15 +0200 (CEST)
Received: from localhost ([::1]:55334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWDAP-0007TV-O2
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 03:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1mWD8G-0005i5-7Y
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 03:39:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1mWD8C-0001kO-Et
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 03:38:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633073934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PeT8s/Bq8F8bITuiIDYlMPB+tf4bezmx9TuWR/mtYJM=;
 b=FHes0C6UjKYnJQYBPSvvuvq8D0GRIqjwyMViZePKvje6N7FT3O2chPB/AG+CtroIKQd0RR
 ymKN5IUKM+lyyu8Zj5xfMn4umSZy/RCSmTRm3Pzoa/pgHy9pn+iniEIeDSDiQzvtq32IxJ
 wHzTkG7INV8hQ0yosZhPDOAXiA85G4Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-zzVHWoGRMgy243DSi4sNhA-1; Fri, 01 Oct 2021 03:38:52 -0400
X-MC-Unique: zzVHWoGRMgy243DSi4sNhA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17F2A802B9F
 for <qemu-devel@nongnu.org>; Fri,  1 Oct 2021 07:38:52 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E916A5C25A;
 Fri,  1 Oct 2021 07:37:50 +0000 (UTC)
Date: Fri, 1 Oct 2021 09:37:47 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Laine Stump <laine@redhat.com>
Subject: Re: [PATCH] failover: allow to pause the VM during the migration
Message-ID: <YVa6y5arhPjRTSl1@angien.pipo.sk>
References: <20210930170926.1298118-1-lvivier@redhat.com>
 <f1898bf0-dadb-4e2e-a45a-9087d2c63678@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f1898bf0-dadb-4e2e-a45a-9087d2c63678@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Libvirt <libvir-list@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Jiri Denemark <jdenemar@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 30, 2021 at 16:17:44 -0400, Laine Stump wrote:
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

Yup, see below ...

> There are a couple of cases when libvirt apparently *doesn't* pause the
> guest during the migrate-to-disk, both having to do with saving a coredump
> of the guest. Since I really have no idea of how common/important that is

In most cases when doing a coredump the guest is paused because of an
emulation/guest error.

One example where the VM is not paused is a 'live' snapshot. It wastes
disk space and is not commonly used thoug.

Where it might become interesting is with the 'background-snapshot'
migration flag. Ideally failover will be fixed to properly work with
that one too. In such case we don't want to pause the VM (but we have to
AFAIK, the backround-snapshot migration can't be done as part of
'transacetion' yet, so we need to pause the VM to kick off the migration
(memory-snapshot) and then snapshot the disks).

> (or even if my assessment of the code is correct), I'm Cc'ing this patch to
> libvir-list to make sure it catches the attention of someone who knows the
> answers and implications.

Well cc-ing relevant patches to libvirt is always good. Especially if
we'll need to adapt the code to support the new feature.

> > But when failover is configured, it doesn't work anymore.
> > 
> > As the failover needs to ask the guest OS to unplug the card
> > the machine cannot be paused.
> > 
> > This patch introduces a new migration parameter, "pause-vm", that
> > asks the migration to pause the VM during the migration startup
> > phase after the the card is unplugged.

Is there a time limit to this? If guest interaction is required it might
take unbounded time.

In case of snapshots the expectation from the user is that the state
capture happens "reasonably" immediately after issuing the command. If
we introduce an possibly unbounded wait time, it will need an
re-imagining of the snapshot workflow and the feature will need to be an
opt-in.

> > 
> > Once the migration is done, we only need to resume the VM with
> > "cont" and the card is plugged back:
> > 
> > 1- set the parameter:
> >     (qemu) migrate_set_parameter pause-vm on
> > 
> > 2- migrate the VM to a file:
> >     (qemu) migrate "exec:cat > snapshot"
> > 
> >     The primary failover card (VFIO) is unplugged and the VM is paused.
> > 
> > 3- resume the VM:
> >     (qemu) cont
> > 
> >     The VM restarts and the primary failover card is plugged back
> > 
> > The VM state sent in the migration stream is "paused", it means
> > when the snapshot is loaded or if the stream is sent to a destination
> > QEMU, the VM needs to be resumed manually.

This is not a problem, libvirt is already dealing with this internally
anyways.


