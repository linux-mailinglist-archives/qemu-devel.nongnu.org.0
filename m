Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1EA42051
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 11:11:23 +0200 (CEST)
Received: from localhost ([::1]:57824 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hazHu-0003YL-Js
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 05:11:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40859)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berrange@redhat.com>) id 1haz98-0007Q9-Ay
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 05:02:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1haz94-0007kT-QW
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 05:02:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45516)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1haz94-0007iw-ED
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 05:02:14 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9B79C300183C;
 Wed, 12 Jun 2019 09:02:10 +0000 (UTC)
Received: from redhat.com (unknown [10.34.246.191])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8CE126FC1;
 Wed, 12 Jun 2019 09:01:54 +0000 (UTC)
Date: Wed, 12 Jun 2019 11:01:50 +0200
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190612090150.GD6897@redhat.com>
References: <155786484688.13873.6037015630912983760.stgit@gimli.home>
 <20190528232626-mutt-send-email-mst@kernel.org>
 <694a140e-1415-2595-8e22-0834ee17139f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <694a140e-1415-2595-8e22-0834ee17139f@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Wed, 12 Jun 2019 09:02:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH for-4.1 v2] q35: Revert to kernel irqchip
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: ehabkost@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, peterx@redhat.com,
 Alex Williamson <alex.williamson@redhat.com>, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 03, 2019 at 10:06:06AM +0200, Paolo Bonzini wrote:
> On 29/05/19 05:30, Michael S. Tsirkin wrote:
> > On Tue, May 14, 2019 at 02:14:41PM -0600, Alex Williamson wrote:
> >> Commit b2fc91db8447 ("q35: set split kernel irqchip as default") changed
> >> the default for the pc-q35-4.0 machine type to use split irqchip, which
> >> turned out to have disasterous effects on vfio-pci INTx support.  KVM
> >> resampling irqfds are registered for handling these interrupts, but
> >> these are non-functional in split irqchip mode.  We can't simply test
> >> for split irqchip in QEMU as userspace handling of this interrupt is a
> >> significant performance regression versus KVM handling (GeForce GPUs
> >> assigned to Windows VMs are non-functional without forcing MSI mode or
> >> re-enabling kernel irqchip).
> >>
> >> The resolution is to revert the change in default irqchip mode in the
> >> pc-q35-4.1 machine and create a pc-q35-4.0.1 machine for the 4.0-stable
> >> branch.  The qemu-q35-4.0 machine type should not be used in vfio-pci
> >> configurations for devices requiring legacy INTx support without
> >> explicitly modifying the VM configuration to use kernel irqchip.
> >>
> >> Link: https://bugs.launchpad.net/qemu/+bug/1826422
> >> Fixes: b2fc91db8447 ("q35: set split kernel irqchip as default")
> >> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> > 
> > OK I guess but it's really a kvm patch.
> > So I'd like Paolo to review and merge if appropriate.
> > 
> > Can't say this makes me too happy. split irqchip
> > has a bunch of advantages.
> 
> Yeah, me too but I don't see an alternative.  I'll merge it today.

FYI in Fedora we've had another unrelated regression bug that was identified
as caused by the split irqchip change. With a Windows 7 guest, the clock
is way too fast, for every 1 second wallclock time, 15 seconds passes
in the guest. See the bug for more info:

  https://bugzilla.redhat.com/show_bug.cgi?id=1704375

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

