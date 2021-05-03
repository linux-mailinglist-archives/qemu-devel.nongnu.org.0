Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 426643715BF
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 15:10:40 +0200 (CEST)
Received: from localhost ([::1]:36812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldYLP-0007JJ-4h
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 09:10:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1ldYIV-0004OI-KL
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:07:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1ldYIP-0004on-2o
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:07:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620047250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=09rXqiaTUywzSMvmE0+oi/p9QKDaKHKsSfMTcogwyT0=;
 b=Zh3WlsvsIZnHAJVZuVoAumFcNHNdrBXicqWXve63OcU6P1PNfnNpGl/QQO7wOLe/aQuzIN
 1sjxL2chR5IDDsj7Dz9LKMK0K5xlkkOvecSNycKAd/mgMt88IUG92czpKhzCsci3zxAe3J
 nGKMzEMEO9yiHz9mDu3bK7KMG8px+yg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-pgFWX_R3PM-8tk5GYSYTMw-1; Mon, 03 May 2021 09:07:28 -0400
X-MC-Unique: pgFWX_R3PM-8tk5GYSYTMw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAA1C804035;
 Mon,  3 May 2021 13:07:27 +0000 (UTC)
Received: from horse.redhat.com (ovpn-115-10.rdu2.redhat.com [10.10.115.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ADB4319C79;
 Mon,  3 May 2021 13:07:16 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 39A7122054F; Mon,  3 May 2021 09:07:16 -0400 (EDT)
Date: Mon, 3 May 2021 09:07:16 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: "Ge, Xiongzi" <Xiongzi.Ge@netapp.com>
Subject: Re: [Virtio-fs] Live migration support for virtio-fs
Message-ID: <20210503130716.GB81443@redhat.com>
References: <714BD741-AE3F-4BC5-8DFB-F5C74A8623B1@netapp.com>
 <YFnC9QXo6uP+2zC1@work-vm> <20210323145312.GB483930@redhat.com>
 <YFoCpIh5PCSP6gXB@work-vm>
 <40D27E5F-C65A-4441-BA23-ABA6880DAA71@netapp.com>
 <YG8tXxdyakzkyI0h@stefanha-x1.localdomain>
 <423DD084-E08F-4402-AD5A-3583117A6B4E@netapp.com>
MIME-Version: 1.0
In-Reply-To: <423DD084-E08F-4402-AD5A-3583117A6B4E@netapp.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: "virtio-fs@redhat.com" <virtio-fs@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Xiongzi,

Try qemu monitor to hot device add/remove that works. I think libvirt
support is yet to be added.

One issue I faced was that I had to add a pcie root to move virtiofs
device off pcie.0 and then hot add remove functionality works.

So I had to add pcie root port by adding following to qemu command
line.

-device pcie-root-port,id=root1,slot=0

And now you can hot add a device using device_add.

 (qemu) device_add vhost-user-fs-pci,bus=root1,id=myvirtiofs,chardev=char0,tag=myfs,queue-size=1024

- To hot remove device, issue from qemu monitor.

  (qemu) device_del <device_id>
  ex. device_del myvirtiofs

Thanks
Vivek

On Mon, May 03, 2021 at 12:50:56PM +0000, Ge, Xiongzi wrote:
> Thanks, Stefan!
> It seems that libvirt does not support device-attach for filesystem type device, like virtiofs. Are there any other ways to do this hot-unplugging? 
> 
> Xiongzi
> 
> ﻿On 4/8/21, 12:21 PM, "Stefan Hajnoczi" <stefanha@redhat.com> wrote:
> 
>     On Wed, Apr 07, 2021 at 06:05:29PM +0000, Ge, Xiongzi wrote:
>     > Thanks Dr Gilbert, Vivek, Stefan, Greg!
>     > I put together the discussion into this thread and CC qemu-devel@nongnu.org. 
>     > 
>     > Problem:
>     > Current Virtio-FS does not support live migration.  Even when the virtiofs directory is not mounted on the guest, VM cannot do live migration. Any suggestions/interest If we want to make this work so we can still have the live migration feature for other purpose on that VM? 
>     > 
>     > If we already have a shared file system like Ceph, does this make it different? 
> 
>     (Marc-André: I CCed you regarding D-Bus VMState, see below.)
> 
>     During the last virtio-fs call on Wednesday we discussed how to allow
>     live migration when the file system is not mounted. This means live
>     migration of a mounted file system still wouldn't be supported, but at
>     least it would be possible to migrate when the file system is not
>     mounted.
> 
>     The easiest way to do that is to hot unplug the vhost-user-fs-pci device
>     so that QEMU can live migrate the VM and then hot plug the
>     vhost-user-fs-pci device again after migration has completed. This
>     requires either manually performing the hot plug operations or some
>     automation to do this around live migration.
> 
>     A smoother approach would be for QEMU to allow live migration when the
>     file system is not mounted. Unfortunately it turns out this is actually
>     rather involved because virtiofsd runs as a separate process from QEMU
>     and the live migration interface for vhost-user devices is currently
>     pretty basic
>     (https://qemu.readthedocs.io/en/latest/interop/dbus-vmstate.html). There
>     is currently no way for virtiofsd to communicate with QEMU to allow/deny
>     live migration depending on whether virtiofsd currently has an active
>     FUSE session (mount). It might be possible to extend the D-Bus VMState
>     interface and implement support for "migration blockers" as they are
>     known in QEMU, but I wonder whether it's not better to just work on
>     full virtio-fs live migration instead. Either task is complex and I
>     wouldn't recommend it as a first contribution to virtiofsd or QEMU.
> 
>     Can you make use of the hotplug approach to live migration?
> 
>     Stefan
> 


