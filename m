Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 170462325B2
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jul 2020 21:57:41 +0200 (CEST)
Received: from localhost ([::1]:34688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0sCp-0004jC-2j
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 15:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1k0sBr-0004IE-Kn
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 15:56:39 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:43890
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1k0sBp-0007ym-8A
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 15:56:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596052592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+XdDXQ90+evBlCxXRfWZJdXeFaDBFjG5pDqxewmhYAY=;
 b=GsO087liVWKG6eHvnDeadPGP883MJDjEh+9OEaNH+NHH1k7BPK9U3iY3p/7wVROOJxI5H1
 VLlW4A8Eol1Hy5hFsMnYWek+gTBrXi2FovVx27pAspmqaq4/v0g6+nc1APK9W/eNrZk2ox
 WN9h35SOzfcR+L+Pxrvh5nD21qcaMi0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-RDmmID7SNSK-xMSrNIYr9Q-1; Wed, 29 Jul 2020 15:56:28 -0400
X-MC-Unique: RDmmID7SNSK-xMSrNIYr9Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98C4459;
 Wed, 29 Jul 2020 19:56:27 +0000 (UTC)
Received: from starship (unknown [10.35.206.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59EBB6179C;
 Wed, 29 Jul 2020 19:56:20 +0000 (UTC)
Message-ID: <f17f71c37203691509821bace64ee4a616d8f651.camel@redhat.com>
Subject: Re: [PATCH v3 0/7] Fix scsi devices plug/unplug races w.r.t
 virtio-scsi iothread
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 29 Jul 2020 22:56:19 +0300
In-Reply-To: <20200715150159.95050-1-mlevitsk@redhat.com>
References: <20200715150159.95050-1-mlevitsk@redhat.com>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 09:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. =?ISO-8859-1?Q?Berrang=E9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2020-07-15 at 18:01 +0300, Maxim Levitsky wrote:
> Hi!
> 
> This is a patch series that is a result of my discussion with Paulo on
> how to correctly fix the root cause of the BZ #1812399.
> 
> The root cause of this bug is the fact that IO thread is running mostly
> unlocked versus main thread on which device hotplug is done.
> 
> qdev_device_add first creates the device object, then places it on the bus,
> and only then realizes it.
> 
> However some drivers and currently only virtio-scsi enumerate its child bus
> devices on each request that is received from the guest and that can happen on the IO
> thread.
> 
> Thus we have a window when new device is on the bus but not realized and can be accessed
> by the virtio-scsi driver in that state.
> 
> Fix that by doing two things:
> 
> 1. Add partial RCU protection to the list of a bus's child devices.
> This allows the scsi IO thread to safely enumerate the child devices
> while it races with the hotplug placing the device on the bus.
> 
> 2. Make the virtio-scsi driver check .realized property of the scsi device
> and avoid touching the device if it isn't
> 
> Note that in the particular bug report the issue wasn't a race but rather due
> to combination of things, the .realize code in the middle managed to trigger IO on the virtqueue
> which caused the virtio-scsi driver to access the half realized device. However
> since this can happen as well with real IO thread, this patch series was done,
> which fixes this as well.
> 
> Changes from V1:
>   * Patch 2 is new, as suggested by Stefan, added drain_call_rcu() to fix the failing unit test,
>     make check pass now
> 
>   * Patches 6,7 are new as well: I added scsi_device_get as suggested by Stefan as well, although
>     this is more a refactoring that anything else as it doesn't solve
>     an existing race.
> 
>   * Addressed most of the review feedback from V1
>     - still need to decide if we need QTAILQ_FOREACH_WITH_RCU_READ_LOCK
> 
> Changes from V2:
> 
>   * No longer RFC
>   * Addressed most of the feedback from Stefan
>   * Fixed reference count leak in patch 7 when device is about to be unrealized
>   * Better testing
> 
> This series was tested by adding a virtio-scsi drive with iothread,
> then running fio stress job in the guest in a loop, and then adding/removing
> the scsi drive on the host in the loop.
> This test was failing usually on 1st iteration withouth this patch series,
> and now it seems to work smoothly.
> 
> Best regards,
> 	Maxim Levitsky
> 
> Maxim Levitsky (7):
>   scsi/scsi_bus: switch search direction in scsi_device_find
>   Implement drain_call_rcu and use it in hmp_device_del
>   device-core: use RCU for list of childs of a bus
>   device-core: use atomic_set on .realized property
>   virtio-scsi: don't touch scsi devices that are not yet realized or
>     about to be un-realized
>   scsi: Add scsi_device_get
>   virtio-scsi: use scsi_device_get
> 
>  hw/core/bus.c          | 28 +++++++++++++--------
>  hw/core/qdev.c         | 56 +++++++++++++++++++++++++++++++-----------
>  hw/scsi/scsi-bus.c     | 48 +++++++++++++++++++++++++++++++-----
>  hw/scsi/virtio-scsi.c  | 47 ++++++++++++++++++++++++++++-------
>  include/hw/qdev-core.h | 11 +++++++++
>  include/hw/scsi/scsi.h |  2 ++
>  include/qemu/rcu.h     |  1 +
>  qdev-monitor.c         | 22 +++++++++++++++++
>  util/rcu.c             | 55 +++++++++++++++++++++++++++++++++++++++++
>  9 files changed, 230 insertions(+), 40 deletions(-)
> 
> -- 
> 2.26.2
> 
Very gentle ping about this patch series.

Best regards,
	Maxim Levitsky


