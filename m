Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCA333A884
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 23:27:56 +0100 (CET)
Received: from localhost ([::1]:35942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLZDH-0006J8-Ct
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 18:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lLZCF-0005qm-6t
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 18:26:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lLZCD-0000T2-Gv
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 18:26:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615760807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FplKn3vlQVGrgecCnOUuWzn5E0ZWjCETnnT4UmbK77s=;
 b=DM7PNrg1NVKpp7GzMYWTkiKLPso01laHvfsRZn76IjQMbTs/6XSfTiExfkBpprLRa3t0mQ
 cKfW70GphPWgj/VerSVLWbJCbC5m1Why+VQro8bUN5uPdu6FNuMHoz9fsfmYhoINzRfIlR
 m3ROrgXiUu/+pj5ReV1I7kMRRtLtCrQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-clTAgw4ZPA6pnWdne-rVrw-1; Sun, 14 Mar 2021 18:26:46 -0400
X-MC-Unique: clTAgw4ZPA6pnWdne-rVrw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0927107ACCD;
 Sun, 14 Mar 2021 22:26:44 +0000 (UTC)
Received: from horse.redhat.com (ovpn-112-132.rdu2.redhat.com [10.10.112.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FA6C5C5DF;
 Sun, 14 Mar 2021 22:26:30 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id C1ACD22054F; Sun, 14 Mar 2021 18:26:29 -0400 (EDT)
Date: Sun, 14 Mar 2021 18:26:29 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH 0/6] vhost-user: Shutdown/Flush slave channel properly
Message-ID: <20210314222629.GB223210@redhat.com>
References: <20210125180115.22936-1-vgoyal@redhat.com>
 <20210314182048-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210314182048-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org, virtio-fs@redhat.com,
 stefanha@redhat.com, marcandre.lureau@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Mar 14, 2021 at 06:21:04PM -0400, Michael S. Tsirkin wrote:
> On Mon, Jan 25, 2021 at 01:01:09PM -0500, Vivek Goyal wrote:
> > Hi,
> > 
> > We are working on DAX support in virtiofs and have some patches out of
> > the tree hosted here.
> > 
> > https://gitlab.com/virtio-fs/qemu/-/commits/virtio-fs-dev
> 
> ping anyone wants to pick this up and post a non-rfc version?

Hi Michael,

Greg has picked this work and has alredy posted V2 of patches here.

https://lore.kernel.org/qemu-devel/20210312092212.782255-8-groug@kaod.org/T/

Please have a look.

Thanks
Vivek

> 
> > These patches have not been proposed for merge yet, becasue David
> > Gilbert noticed that we can run into a deadlock during an emergency
> > reboot of guest kernel. (echo b > /proc/sysrq-trigger).
> > 
> > I have provided details of deadlock in 4th path of the series with
> > subject "qemu, vhost-user: Extend protocol to start/stop/flush slave
> > channel".
> > 
> > Basic problem seems to be that we don't have a proper mechanism to
> > shutdown slave channel when vhost-user device is stopping. This means
> > there might be pending messages in slave channel and slave is blocked
> > and waiting for response.
> > 
> > This is an RFC patch series to enhance vhost-user protocol to 
> > properly shutdown/flush slave channel and avoid the deadlock. Though
> > we faced the issue in the context of virtiofs, any vhost-user
> > device using slave channel can potentially run into issues and
> > can benefit from these patches.
> > 
> > Any feedback is welcome. Currently patches are based on out of
> > tree code but after I get some feedback, I can only take pieces
> > which are relevant to upstream and post separately.
> > 
> > Thanks
> > Vivek
> > 
> > Vivek Goyal (6):
> >   virtiofsd: Drop ->vu_dispatch_rwlock while waiting for thread to exit
> >   libvhost-user: Use slave_mutex in all slave messages
> >   vhost-user: Return error code from slave_read()
> >   qemu, vhost-user: Extend protocol to start/stop/flush slave channel
> >   libvhost-user: Add support to start/stop/flush slave channel
> >   virtiofsd: Opt in for slave start/stop/shutdown functionality
> > 
> >  hw/virtio/vhost-user.c                    | 151 +++++++++++++++++++++-
> >  subprojects/libvhost-user/libvhost-user.c | 147 +++++++++++++++++----
> >  subprojects/libvhost-user/libvhost-user.h |   8 +-
> >  tools/virtiofsd/fuse_virtio.c             |  20 +++
> >  4 files changed, 294 insertions(+), 32 deletions(-)
> > 
> > -- 
> > 2.25.4
> 


