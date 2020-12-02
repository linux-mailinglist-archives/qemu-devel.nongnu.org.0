Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8712CBB20
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:57:55 +0100 (CET)
Received: from localhost ([::1]:39172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPpa-0005wB-3L
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:57:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kkPn7-00048R-F3
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 05:55:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kkPn4-0008Nf-N0
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 05:55:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606906517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wwQ2Z99fbK0pJUe2OXB8+CpZer7mpev4TFTQTlhxWWM=;
 b=RH3tO9379ZhgfXkrbsWLNVRAkp+19QZqSl+mXmkd/jIApkIdgCFId1aIN8NXgYLKk8XiLA
 TutJ1ESen6KaUO+H6Ve25J2uTfWpmHv2KPgDLks/w2ki0l53WP9bkFElqOU9L1k7FZfkBl
 eaHXdL6YMr0qd25a8MnGo3JOT2agOC8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-UW0m6CzxPxO7tk8qFs4sOw-1; Wed, 02 Dec 2020 05:55:15 -0500
X-MC-Unique: UW0m6CzxPxO7tk8qFs4sOw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22A6F8030DC;
 Wed,  2 Dec 2020 10:55:14 +0000 (UTC)
Received: from work-vm (ovpn-115-3.ams2.redhat.com [10.36.115.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED57C19D80;
 Wed,  2 Dec 2020 10:55:04 +0000 (UTC)
Date: Wed, 2 Dec 2020 10:55:02 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Shenming Lu <lushenming@huawei.com>
Subject: Re: [PATCH RFC] vfio: Move the saving of the config space to the
 right place in VFIO migration
Message-ID: <20201202105502.GB3226@work-vm>
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
In-Reply-To: <ed6c0920-8a26-fafe-01a6-3021c5a92adb@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
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
 Cornelia Huck <cohuck@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Shenming Lu (lushenming@huawei.com) wrote:
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

You could argue that you could always send an initial copy of the config
data at the start; and then send new versions at the end anyway.
But is this just about interrupts? Is the dst going to interpret the
received migration data differently depending on the config data?  That
would seem dangerous if the config data was to change during the
migration.

Dave

> 		|
> 	In vfio_save_iterate() (pre-copy):
> 	If *needed*, save the config space which would be setup on the dst
> 	before the migration data, but send with a subflag to instruct not
> 	to (such as) enable interrupts.
> 		|
> 	In vfio_save_complete_precopy() (stop-and-copy, iterable process):
> 	The same as that in vfio_save_iterate().
> 		|
> 	In .save_state (stop-and-copy, non-iterable process):
> 	If *needed*, only send a subflag to instruct to enable interrupts.
> 	If *not needed*, save the config space and setup everything on the dst.
> 
> Besides the above idea, we might be able to choose to let the vendor driver do
> more: qemu just sends and writes the config data (before) along with the device
> migration data every time, and it's up to the vendor driver to filter out/buffer
> the received data or reorder the settings...
> 
> Thanks,
> Shenming
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


