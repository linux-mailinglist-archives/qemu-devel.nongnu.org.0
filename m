Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36732476A3C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 07:13:42 +0100 (CET)
Received: from localhost ([::1]:54678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxk1M-0003Ku-Dy
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 01:13:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mxjzT-0002b6-Vk
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 01:11:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mxjzP-0005dl-AB
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 01:11:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639635095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SIfou6Mx4pH9PzLKLu8nXmeFRc9rYSghvRdrQpBXUSg=;
 b=C0PIpq68XDb1Emjg/HFIH+50b8tJkNGUlDbK4jESKO85xLFYB2SE+YUZyuHniP0lbQLirM
 DsJbFomvGVTjEImF96XsZxk9B7oYeek19S8mu/8X7CdzVF6NqsRk5IYyF4TH0cHXFiY5r4
 JnctBtRCupT2w81Gyp/MAhX9XbHvdWc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-SqA5DrNZON-zk-ehOWUG_Q-1; Thu, 16 Dec 2021 01:11:32 -0500
X-MC-Unique: SqA5DrNZON-zk-ehOWUG_Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B08C2F31;
 Thu, 16 Dec 2021 06:11:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 237577D490;
 Thu, 16 Dec 2021 06:11:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DE7FB18003A3; Thu, 16 Dec 2021 07:11:28 +0100 (CET)
Date: Thu, 16 Dec 2021 07:11:28 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Annie.li" <annie.li@oracle.com>
Subject: Re: [PATCH 1/1] pcie: Do not set power state for some hot-plugged
 devices
Message-ID: <20211216061128.vtap3lunpuye36il@sirius.home.kraxel.org>
References: <20211214215312.944-1-annie.li@oracle.com>
 <20211215060513.kugy3y32nj2te7ui@sirius.home.kraxel.org>
 <1f85fe9e-0753-c35a-668d-3b6779bc703b@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1f85fe9e-0753-c35a-668d-3b6779bc703b@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > Maybe we should just not set DeviceState->hotplugged = true for devices
> > added in VM_STATE_PRELAUNCH?  It's not actual hotplug (i.e. device added
> > while the system is running) after all ...

> Simply not setting "DeviceState->hotplugged" doesn't work. Devices created
> in
> PHASE_MACHINE_READY phase are treated as hot-plugged devices. So I just
> tried
> following change for the quick test, the device is still invisible to the
> firmware with
> this change.

Looking again, the difference is probably the reset handling.
pcie_cap_slot_reset() will turn on power (via PCI_EXP_SLTCTL_PCC) in
case some device is plugged into the slot.

So I suspect when plugging devices during VM_STATE_PRELAUNCH they are
resetted individually (specifically before the device is plugged),
whereas otherwise they are resetted when all devices are plugged in.

Does resetting devices when leaving RUN_STATE_PRELAUNCH fix this?

take care,
  Gerd


