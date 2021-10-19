Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5295432E51
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 08:31:58 +0200 (CEST)
Received: from localhost ([::1]:44236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcifF-0006jt-Rz
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 02:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mcicv-00064s-S0
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 02:29:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mcicu-0002HG-8X
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 02:29:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634624970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XCAUZQk3xmUBAO1w6fiPEfuyPsTmtq4wnZ/TTx3hrqs=;
 b=PPtu3NAiOITOHdx8fFa0d7JjAlFaPrkuo1ycNosJ89dZIUvDb4OCN81JZHtHmemvuu1T5p
 1TR/4xXfu3XnDrz1pgeU0UwU+BgLeM+cj3vpdlUZxs7C3S/hjsCV5S17fj/Yr3JqHskJ7N
 QjZWtEf7LWK/DGpigufuEiKamdBW4F4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-N6mNI1bKNceAUsDnP3HsUQ-1; Tue, 19 Oct 2021 02:29:27 -0400
X-MC-Unique: N6mNI1bKNceAUsDnP3HsUQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1938291272;
 Tue, 19 Oct 2021 06:29:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CAAF460C17;
 Tue, 19 Oct 2021 06:29:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 167971800393; Tue, 19 Oct 2021 08:29:19 +0200 (CEST)
Date: Tue, 19 Oct 2021 08:29:19 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/6] RfC: try improve native hotplug for pcie root ports
Message-ID: <20211019062919.35wnhiwimr7l3574@sirius.home.kraxel.org>
References: <20211011120504.254053-1-kraxel@redhat.com>
 <20211018113535-mutt-send-email-mst@kernel.org>
 <20211019052144.q4cy2qrvdh34rxml@sirius.home.kraxel.org>
 <20211019014209-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211019014209-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > Yes.  Maybe ask rh qe to run the patch set through their hotplug test
> > suite (to avoid a apci-hotplug style disaster where qe found various
> > issues after release)?
> 
> I'll poke around to see if they can help us... we'll need
> a backport for that though.

Easy, it's a clean cherry-pick for 6.1, scratch build is on the way.

> > > I would also like to see a shorter timeout, maybe 100ms, so
> > > that we are more responsive to guest changes in resending request.
> > 
> > I don't think it is a good idea to go for a shorter timeout given that
> > the 5 seconds are in the specs and we want avoid a resent request being
> > interpreted as cancel.
> > It also wouldn't change anything at least for linux guests because linux
> > is waiting those 5 seconds (with power indicator in blinking state).
> > Only the reason for refusing 'device_del' changes from "5 secs not over
> > yet" to "guest is busy processing the hotplug request".
> 
> First 5 seconds yes. But the retries afterwards?

Hmm, maybe, but I'd tend to keep it simple and go for 5 secs no matter
what.  If the guest isn't responding (maybe because it is in the middle
of a reboot) it's unlikely that fast re-requests are fundamentally
changing things.

> > We could consider to tackle the 5sec timeout on the guest side, i.e.
> > have linux skip the 5sec wait in case the root port is virtual (should
> > be easy to figure by checking the pci id).
> > 
> > take care,
> >   Gerd
> 
> Yes ... do we want to control how long it blinks from hypervisor side?

Is there a good reason for that?
If not, then no.  Keep it simple.

When the guest powers off the slot pcie_cap_slot_write_config() will
happily unplug the device without additional checks (no check whenever
the 5 seconds are over, also no check whenever there is a pending unplug
request in the first place).

So in theory the guest turning off slot power quickly should work just
fine and speed up the unplug process in the common case (guest is
up'n'running and responsitive).  Down to 1-2 secs instead of 5-7.
Didn't actually test that though.

take care,
  Gerd


