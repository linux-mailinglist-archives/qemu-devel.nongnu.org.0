Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA09E36DF2
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 09:58:20 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56154 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYnHv-0004dA-QV
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 03:58:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hYnGl-0004Az-7f
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 03:57:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hYnGj-0007p1-6l
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 03:57:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43744)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1hYnGj-0007cJ-0p; Thu, 06 Jun 2019 03:57:05 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DCEF7A3240;
	Thu,  6 Jun 2019 07:56:32 +0000 (UTC)
Received: from gondolin (dhcp-192-191.str.redhat.com [10.33.192.191])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B85367662;
	Thu,  6 Jun 2019 07:56:24 +0000 (UTC)
Date: Thu, 6 Jun 2019 09:56:21 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20190606095621.5b984245.cohuck@redhat.com>
In-Reply-To: <20190606025635.GO22416@habkost.net>
References: <20190518205428.90532-1-like.xu@linux.intel.com>
	<20190518205428.90532-7-like.xu@linux.intel.com>
	<20190606025635.GO22416@habkost.net>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 06 Jun 2019 07:56:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 06/10] hw/s390x: Replace global smp
 variables with machine smp properties
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Like Xu <like.xu@linux.intel.com>,
	David Hildenbrand <david@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, "Dr . David Alan
	Gilbert" <dgilbert@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-s390x@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Alistair Francis <alistair23@gmail.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 5 Jun 2019 23:56:35 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Sun, May 19, 2019 at 04:54:24AM +0800, Like Xu wrote:
> > The global smp variables in s390x are replaced with smp machine properties.
> > 
> > A local variable of the same name would be introduced in the declaration
> > phase if it's used widely in the context OR replace it on the spot if it's
> > only used once. No semantic changes.
> > 
> > Signed-off-by: Like Xu <like.xu@linux.intel.com>  
> 
> CCing s390 maintainers.
> 
> Any objections to merging this through the Machine Core tree?

None at all.

> 
> > ---
> >  hw/s390x/s390-virtio-ccw.c | 3 ++-
> >  hw/s390x/sclp.c            | 2 +-
> >  target/s390x/cpu.c         | 3 +++
> >  target/s390x/excp_helper.c | 5 +++++
> >  4 files changed, 11 insertions(+), 2 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

