Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A91C0432D1E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 07:23:44 +0200 (CEST)
Received: from localhost ([::1]:40030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mchbD-00077b-D7
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 01:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mchZa-0006Mf-Lg
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 01:22:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mchZW-0001ra-Ff
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 01:22:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634620916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H05AqTEn6HNpFw2my/J+z/UBrljG2A4N+hK5XBQ949I=;
 b=BVBT41IGwYYbm77G0gs5LnwSAD2iogoC+x5xkqo4GPClq/pLraI89nshyqByk7k3ZUNic7
 wGwXYZ/ZdaXXruCLEztx1+29GwSnfrN0q0sb3+xIJGZDWFaXdHEuurXtiDwBrv7i9+V8PI
 pQi4aNYGZISjAHbWsrywmIFAz85K6nc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-PBWm3hg-M_O3Ol5qNpIqXw-1; Tue, 19 Oct 2021 01:21:54 -0400
X-MC-Unique: PBWm3hg-M_O3Ol5qNpIqXw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D4D31017965;
 Tue, 19 Oct 2021 05:21:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70F9F17CEE;
 Tue, 19 Oct 2021 05:21:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C46711800393; Tue, 19 Oct 2021 07:21:44 +0200 (CEST)
Date: Tue, 19 Oct 2021 07:21:44 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/6] RfC: try improve native hotplug for pcie root ports
Message-ID: <20211019052144.q4cy2qrvdh34rxml@sirius.home.kraxel.org>
References: <20211011120504.254053-1-kraxel@redhat.com>
 <20211018113535-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211018113535-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

On Mon, Oct 18, 2021 at 11:36:45AM -0400, Michael S. Tsirkin wrote:
> On Mon, Oct 11, 2021 at 02:04:58PM +0200, Gerd Hoffmann wrote:
> > 
> > 
> > Gerd Hoffmann (6):
> >   pci: implement power state
> >   pcie: implement slow power control for pcie root ports
> >   pcie: add power indicator blink check
> >   pcie: factor out pcie_cap_slot_unplug()
> >   pcie: fast unplug when slot power is off
> >   pcie: expire pending delete
> 
> So what's left to do here?
> I'm guessing more testing?

Yes.  Maybe ask rh qe to run the patch set through their hotplug test
suite (to avoid a apci-hotplug style disaster where qe found various
issues after release)?

> I would also like to see a shorter timeout, maybe 100ms, so
> that we are more responsive to guest changes in resending request.

I don't think it is a good idea to go for a shorter timeout given that
the 5 seconds are in the specs and we want avoid a resent request being
interpreted as cancel.

It also wouldn't change anything at least for linux guests because linux
is waiting those 5 seconds (with power indicator in blinking state).
Only the reason for refusing 'device_del' changes from "5 secs not over
yet" to "guest is busy processing the hotplug request".

We could consider to tackle the 5sec timeout on the guest side, i.e.
have linux skip the 5sec wait in case the root port is virtual (should
be easy to figure by checking the pci id).

take care,
  Gerd


