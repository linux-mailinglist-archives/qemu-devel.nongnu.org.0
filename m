Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DDA324F62
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 12:47:39 +0100 (CET)
Received: from localhost ([::1]:52446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFF7K-0006Es-Ot
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 06:47:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lFF6N-0005mr-KC
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 06:46:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lFF6L-0004Bq-Qm
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 06:46:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614253596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xKmTEivAGnpXirok/FZMI9IT5+2rG+YO+T2SvKiBEY0=;
 b=Ql8JZVqPmgVE9wpuuRWmh0n1wqGVISyEFBolXguG6/xyTMnjY5wEiOkGkZg2wFgqqJhYJG
 PjAZZv28+7VB368wwEk6UnLte+1bFhl4bOkBBcZcxyTZYTJXHZIZ/WPsHie0L1pIR11Zi2
 s5x9t4yJbBe6bBacm6mSAMgBHFrqd9s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-gTc3-8vAOWS90hJJXyCksg-1; Thu, 25 Feb 2021 06:46:33 -0500
X-MC-Unique: gTc3-8vAOWS90hJJXyCksg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7FEC8030C1;
 Thu, 25 Feb 2021 11:46:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-4.ams2.redhat.com
 [10.36.114.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 247E91980D;
 Thu, 25 Feb 2021 11:46:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8821D18000A7; Thu, 25 Feb 2021 12:46:26 +0100 (CET)
Date: Thu, 25 Feb 2021 12:46:26 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] virtio-gpu: Respect graphics update interval for EDID
Message-ID: <20210225114626.dn7wevr3fozp5rcu@sirius.home.kraxel.org>
References: <20210221133414.7262-1-akihiko.odaki@gmail.com>
 <20210222105738.w2q6vp5pi4p6bx5m@sirius.home.kraxel.org>
 <CAMVc7JVo_XJcGcxW0Wmqje3Y40fRZDY6T8dnQTc2=Ehasz4UHw@mail.gmail.com>
 <20210224111540.xd5a6yszql6wln7m@sirius.home.kraxel.org>
 <CAMVc7JXUXnrK_amhQsy=paMeqjMU_8r86Hj4UF5haZ+Oq15JkA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMVc7JXUXnrK_amhQsy=paMeqjMU_8r86Hj4UF5haZ+Oq15JkA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu Developers <qemu-devel@nongnu.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > Because of the wasted frames I'd like this to be an option you can
> > enable when needed.  For the majority of use cases this seems to be
> > no problem ...
> 
> I see blinks with GNOME on Wayland on Ubuntu 20.04 and virtio-gpu with
> the EDID change included in this patch.

/me looks closely at the patch again.

So you update the edid dynamically, each time the refresh rate changes.
Problem with that approach is software doesn't expect edid to change
dynamically because on physical hardware it is static information about
the connected monitor.

So what the virtio-gpu guest driver does is emulate a monitor hotplug
event to notify userspace.  If you resize the qemu window on the host
it'll look like the monitor with the old window size was unplugged and
a new monitor with the new window size got plugged instead, so gnome
shell goes adapt the display resolution to the new virtual monitor size.

The blink you are seeing probably comes from gnome-shell processing the
monitor hotplug event.

We could try to skip generating a monitor hotplug event in case only the
refresh rate did change.  That would fix the blink, but it would also
have the effect that nobody will notice the update.

Bottom line:  I think making the edid refresh rate configurable might be
useful, but changing it dynamically most likely isn't.

take care,
  Gerd


