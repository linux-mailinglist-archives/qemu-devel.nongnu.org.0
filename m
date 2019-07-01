Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 978A213463
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 22:24:48 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46910 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMejf-0008E5-Pq
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 16:24:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44169)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hMeiV-0007cm-PC
	for qemu-devel@nongnu.org; Fri, 03 May 2019 16:23:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hMeiU-0005wY-Tw
	for qemu-devel@nongnu.org; Fri, 03 May 2019 16:23:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43772)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hMeiU-0005wF-Ol
	for qemu-devel@nongnu.org; Fri, 03 May 2019 16:23:34 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2166159465
	for <qemu-devel@nongnu.org>; Fri,  3 May 2019 20:23:34 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5EED817B08;
	Fri,  3 May 2019 20:23:27 +0000 (UTC)
Date: Fri, 3 May 2019 17:23:25 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190503202325.GA27890@habkost.net>
References: <20181220054037.24320-1-peterx@redhat.com>
	<20181220054037.24320-2-peterx@redhat.com>
	<20190426132744.2b594bf5@x1.home> <20190426150236.1af2ff08@x1.home>
	<94415012.15677076.1556342950794.JavaMail.zimbra@redhat.com>
	<daded638-42f1-9bc3-8c36-66b0fbba9438@redhat.com>
	<20190429082106.4fd59e77@x1.home>
	<20190429145556.GA28722@habkost.net>
	<20190503155951-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190503155951-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 03 May 2019 20:23:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 1/3] q35: set split kernel irqchip as
 default
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 03, 2019 at 04:00:33PM -0400, Michael S. Tsirkin wrote:
> On Mon, Apr 29, 2019 at 11:55:56AM -0300, Eduardo Habkost wrote:
> > irqchip=split and irqchip=kernel aren't guest ABI compatible, are
> > they?
> 
> Can you remind me why they aren't?

We have the code introduced by patch 3/3 from this series, but I
don't know if it's the only difference:

hw/i386/x86-iommu.c=static void x86_iommu_realize(DeviceState *dev, Error **errp)
[...]
hw/i386/x86-iommu.c:    bool irq_all_kernel = kvm_irqchip_in_kernel() && !kvm_irqchip_is_split();
[...]
hw/i386/x86-iommu.c-    /* If the user didn't specify IR, choose a default value for it */
hw/i386/x86-iommu.c-    if (x86_iommu->intr_supported == ON_OFF_AUTO_AUTO) {
hw/i386/x86-iommu.c-        x86_iommu->intr_supported = irq_all_kernel ?
hw/i386/x86-iommu.c-            ON_OFF_AUTO_OFF : ON_OFF_AUTO_ON;
hw/i386/x86-iommu.c-    }

-- 
Eduardo

