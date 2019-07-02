Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DBD5D61B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 20:27:52 +0200 (CEST)
Received: from localhost ([::1]:56114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiNVP-0006ri-Qm
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 14:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48989)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.williamson@redhat.com>) id 1hiLfq-0007l8-RF
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 12:30:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.williamson@redhat.com>) id 1hiLfp-0000lM-SV
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 12:30:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43610)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
 id 1hiLfp-0000kP-MB
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 12:30:29 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A2CC4316290B;
 Tue,  2 Jul 2019 16:30:28 +0000 (UTC)
Received: from x1.home (ovpn-116-83.phx2.redhat.com [10.3.116.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E43A73737;
 Tue,  2 Jul 2019 16:30:25 +0000 (UTC)
Date: Tue, 2 Jul 2019 10:30:25 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190702103025.72258b47@x1.home>
In-Reply-To: <CAFEAcA-KuwMqTdw9Co+KRJTD=gvQ9qwU9QF3xsScLyZzPzaK2A@mail.gmail.com>
References: <156046151566.26543.17274661862206856605.stgit@gimli.home>
 <156046164094.26543.10016703921328261988.stgit@gimli.home>
 <CAFEAcA_nGMfUYpSiaw7xhRjacZQhY1U780ehA0UR0StyBwammg@mail.gmail.com>
 <63a37329-f892-ed5f-4929-e40dac25b64d@redhat.com>
 <20190702095546.11842fec@x1.home>
 <CAFEAcA-KuwMqTdw9Co+KRJTD=gvQ9qwU9QF3xsScLyZzPzaK2A@mail.gmail.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 02 Jul 2019 16:30:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PULL 3/3] vfio/common: Introduce
 vfio_set_irq_signaling helper
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
Cc: Auger Eric <eric.auger@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Jul 2019 16:58:02 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Tue, 2 Jul 2019 at 16:56, Alex Williamson <alex.williamson@redhat.com> wrote:
> > When we're emulating writes to the MSI-X vector table we have no
> > failure path up to the guest.  Real hardware cannot fail to enable a
> > vector that's available in hardware, thus we can either log the issue,
> > ignore the issue, or fault.  I guess Coverity is simply noting that
> > other cases are tested while this is not, therefore we should either
> > explicitly ignore the return value with a cast to void or take this as
> > an opportunity to log the fault, which might be useful in debugging a
> > device that isn't working properly.  Thanks,  
> 
> Yeah, Coverity's check here is purely a heuristic ("did we seem
> to check returns from this function in other places?") so it's
> wrong sometimes. If you want me to mark this as a false positive
> in the coverity UI I can do that.

TBH, it seems like a good nag to log it properly.  Eric, do you mind
posting a fix to do that?  Thanks,

Alex

