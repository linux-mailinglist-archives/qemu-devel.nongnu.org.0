Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2DD195B5D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 17:47:43 +0100 (CET)
Received: from localhost ([::1]:44386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHs90-0006hM-Jw
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 12:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47950)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1jHs7u-0006HA-5e
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 12:46:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1jHs7s-00072P-OU
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 12:46:33 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:25913)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1jHs7s-0006vt-Jw
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 12:46:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585327591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WrvWjEVAogqGLXAVUnUNcFoDwPHvVTSNWLcFCDUMuag=;
 b=AAeMpQRCjv8Df6xDWA4iEcxnR5lK6upUuCkOAsIMFHQvODMDj3lmM7VfZSLuc4zg9wMs0X
 LDL1Wp34FWDpCQQ52liBxOUI813rkVvoC1HAQOvOvsFmirhlox0OSsvh6O+JVtARBge0yi
 w+xPngZUsxwGl9WC+JYmEDW1/J2aQCg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-NnruVez9MZqd8O2jTd5OkA-1; Fri, 27 Mar 2020 12:46:30 -0400
X-MC-Unique: NnruVez9MZqd8O2jTd5OkA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A89B3800D4E;
 Fri, 27 Mar 2020 16:46:28 +0000 (UTC)
Received: from localhost (unknown [10.40.208.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E1385E02B;
 Fri, 27 Mar 2020 16:46:22 +0000 (UTC)
Date: Fri, 27 Mar 2020 17:46:20 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH v1] s390x: Reject unaligned RAM sizes
Message-ID: <20200327174620.06b9c324@redhat.com>
In-Reply-To: <24681aa0-9053-238f-89da-8ce08d34241d@de.ibm.com>
References: <20200327152930.66636-1-david@redhat.com>
 <64cefab8-f1e0-fbc7-27d3-4f28758c595a@de.ibm.com>
 <d8fb50c1-639a-826c-0dce-e2ddc26ae5e1@redhat.com>
 <24681aa0-9053-238f-89da-8ce08d34241d@de.ibm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: =?UTF-8?B?THVrw6HFoQ==?= Doktor <ldoktor@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 Mar 2020 17:05:34 +0100
Christian Borntraeger <borntraeger@de.ibm.com> wrote:

> On 27.03.20 17:01, David Hildenbrand wrote:
> > On 27.03.20 16:34, Christian Borntraeger wrote:  
> >>
> >>
> >> On 27.03.20 16:29, David Hildenbrand wrote:  
> >>> Historically, we fixed up the RAM size (rounded it down), to fit into
> >>> storage increments. Since commit 3a12fc61af5c ("390x/s390-virtio-ccw: use
> >>> memdev for RAM"), we no longer consider the fixed-up size when
> >>> allcoating the RAM block - which will break migration.
> >>>
> >>> Let's simply drop that manual fixup code and let the user supply sane
> >>> RAM sizes. This will bail out early when trying to migrate (and make
> >>> an existing guest with e.g., 12345 MB non-migratable), but maybe we
> >>> should have rejected such RAM sizes right from the beginning.
> >>>
> >>> As we no longer fixup maxram_size as well, make other users use ram_size
> >>> instead. Keep using maxram_size when setting the maximum ram size in KVM,
> >>> as that will come in handy in the future when supporting memory hotplug
> >>> (in contrast, storage keys and storage attributes for hotplugged memory
> >>>  will have to be migrated per RAM block in the future).
> >>>
> >>> This fixes (or rather rejects early):
> >>>
> >>> 1. Migrating older QEMU to upstream QEMU (e.g., with "-m 1235M"), as the
> >>>    RAM block size changed.  
> >>
> >> Not sure I like this variant. Instead of breaking migration (that was 
> >> accidentially done by Igors changes) we now reject migration from older
> >> QEMUs to 5.0. This is not going to help those that still have such guests
> >> running and want to migrate.   
> > 
> > As Igor mentioned on another channel, you most probably can migrate an
> > older guest by starting it on the target with a fixed-up size.
> > 
> > E.g., migrate an old QEMU "-m 1235M" to a new QEMU "-m 1234M"  
> 
> Yes, that should probably work.
I'm in process of testing it.

> > Not sure how many such weird-size VMs we actually do have in practice.  
> 
> I am worried about some automated deployments where tooling has created
> these sizes for dozens or hundreds of containers in VMS and so.
Yep, it's possible but then that tooling/configs should be fixed to work with
new QEMU that validates user's input.


