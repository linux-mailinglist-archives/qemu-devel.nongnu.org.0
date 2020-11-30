Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8260C2C8A6F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 18:06:49 +0100 (CET)
Received: from localhost ([::1]:38562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjmdU-0002n7-B2
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 12:06:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kjmaf-0000Ly-Lw
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 12:03:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kjmad-0006i6-Tr
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 12:03:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606755830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wD0Hkk7b/XHDyFhAXl4/KLBEJtVKcg5SVxciLCeL+kE=;
 b=FjqAaaiA905WtLV+AFJGKvtkWmEz15wdiQArIL1gaeynoS0dP0qwDtzhOCPCrVnFrZEEZE
 yVNb+lHCcF/7awWyuNNZgstiiD2w9AMd+9xLBhWFjduaPS1vz+KCgzgMAqg77xZWEp5lrs
 Vx9g3/3Yl3qxEhXBDex1GHp+qZ12OEI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-FHsoxYl6Nwas0bCCxmjraQ-1; Mon, 30 Nov 2020 12:03:43 -0500
X-MC-Unique: FHsoxYl6Nwas0bCCxmjraQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68195100F36A;
 Mon, 30 Nov 2020 17:03:42 +0000 (UTC)
Received: from w520.home (ovpn-112-10.phx2.redhat.com [10.3.112.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E2E35D9C2;
 Mon, 30 Nov 2020 17:03:38 +0000 (UTC)
Date: Mon, 30 Nov 2020 10:03:37 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Shenming Lu <lushenming@huawei.com>
Subject: Re: [PATCH RFC] vfio: Move the saving of the config space to the
 right place in VFIO migration
Message-ID: <20201130100337.4afe8eb4@w520.home>
In-Reply-To: <ed6c0920-8a26-fafe-01a6-3021c5a92adb@huawei.com>
References: <20201114091731.157-1-lushenming@huawei.com>
 <860bd707-8862-2584-6e12-67c86f092dba@nvidia.com>
 <20201119104127.5e243efa@w520.home>
 <a7be9306-f800-0323-293e-217e2e9f6015@huawei.com>
 <20201120150146.5e5693e9@w520.home>
 <09549a98-85a0-fe4e-59fc-fdb636a4a5cd@huawei.com>
 <20201123193336.GA32690@nvidia.com>
 <20201123144622.75a18812@w520.home>
 <ed6c0920-8a26-fafe-01a6-3021c5a92adb@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Neo Jia <cjia@nvidia.com>, Marc Zyngier <maz@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 qemu-arm@nongnu.org, yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Nov 2020 14:56:17 +0800
Shenming Lu <lushenming@huawei.com> wrote:

> Hi,
> 
> After reading everyone's opinions, we have a rough idea for this issue.
> 
> One key point is whether it is necessary to setup the config space before
> the device can accept further migration data. I think it is decided by
> the vendor driver, so we can simply ask the vendor driver about it in
> .save_setup, which could avoid a lot of unnecessary copies and settings.
> Once we have known the need, we can iterate the config space (before)
> along with the device migration data in .save_live_iterate and
> .save_live_complete_precopy, and if not needed, we can only migrate the
> config space in .save_state.
> 
> Another key point is that the interrupt enabling should be after the
> restoring of the interrupt controller (might not only interrupts).
> My solution is to add a subflag at the beginning of the config data
> (right after VFIO_MIG_FLAG_DEV_CONFIG_STATE) to indicate the triggered
> actions on the dst (such as whether to enable interrupts).
> 
> Below is it's workflow.
> 
> On the save path:
> 	In vfio_save_setup():
> 	Ask the vendor driver if it needs the config space setup before it
> 	can accept further migration data.

How does "ask the vendor driver" actually work?

> 		|
> 	In vfio_save_iterate() (pre-copy):
> 	If *needed*, save the config space which would be setup on the dst
> 	before the migration data, but send with a subflag to instruct not
> 	to (such as) enable interrupts.

If not for triggering things like MSI/X configuration, isn't config
space almost entirely virtual?  What visibility does the vendor driver
have to the VM machine dependencies regarding device interrupt versus
interrupt controller migration?

> 		|
> 	In vfio_save_complete_precopy() (stop-and-copy, iterable process):
> 	The same as that in vfio_save_iterate().
> 		|
> 	In .save_state (stop-and-copy, non-iterable process):
> 	If *needed*, only send a subflag to instruct to enable interrupts.
> 	If *not needed*, save the config space and setup everything on the dst.

Again, how does the vendor driver have visibility to know when the VM
machine can enable interrupts?

> 
> Besides the above idea, we might be able to choose to let the vendor driver do
> more: qemu just sends and writes the config data (before) along with the device
> migration data every time, and it's up to the vendor driver to filter out/buffer
> the received data or reorder the settings...

There is no vendor driver in QEMU though, so are you suggesting that
QEMU follows a standard protocol and the vendor driver chooses when to
enable specific features?  For instance, QEMU would call SET_IRQS and
the driver would return success, but defer that setup if necessary?
That seems quite troubling as we then have ioctls that behave
differently depending on the device state and we have no error path to
userspace should that setup fail later.  The vendor driver does have
its own data stream for migration, so the vendor driver could tell the
destination version of itself what type of interrupt to use, which
might be sufficient if we were to ignore the latency if QEMU were to
defer interrupt setup until stop-and-copy.

Is the question of when to setup device interrupts versus the interrupt
controller state largely a machine issue within QEMU?  If so, shouldn't
it be at QEMU's determination when to act on the config space
information on the target?  IOW, if a vendor driver has a dependency on
interrupt configuration, they need to include it in their own pre-copy
data stream and decouple that dependency from userspace interrupt
configuration via the SET_IRQS ioctl.  Is that possible?  Thanks,

Alex


