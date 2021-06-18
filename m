Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 489133ACEEB
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 17:28:20 +0200 (CEST)
Received: from localhost ([::1]:48672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luGPr-0005yz-99
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 11:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1luGOs-0005EM-GA
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:27:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1luGOp-0007Zf-Du
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:27:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624030034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9BEGAfk1HFimoh2uLT6tS1TknO2OZbA4PX/3ihbPL9M=;
 b=dxE1vfZqe7OeUReVWdOTz00SDocX+Zacpfs+Sy1Q+fALwkcyi7Fh6EZoEEUv3NkJ/lpgNj
 lmfL0bDOUkPzd84xKe+cOVYnuJ2h4NBpXlk1m4Pw4QrQBPtC1GKS7ijaAM9sAKCxqqqFi3
 HsTrE928zhsOR14dH7o+UG3R804YbKU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-4GxjhFJ7PEiZE6UBK9IJew-1; Fri, 18 Jun 2021 11:27:13 -0400
X-MC-Unique: 4GxjhFJ7PEiZE6UBK9IJew-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0143581C86A;
 Fri, 18 Jun 2021 15:27:12 +0000 (UTC)
Received: from localhost (ovpn-113-13.ams2.redhat.com [10.36.113.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91801604CD;
 Fri, 18 Jun 2021 15:27:04 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH v4 0/4] s390x: Fix IRB sense data
In-Reply-To: <20210617232537.1337506-1-farman@linux.ibm.com>
Organization: Red Hat GmbH
References: <20210617232537.1337506-1-farman@linux.ibm.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 18 Jun 2021 17:27:02 +0200
Message-ID: <87y2b7nqgp.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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
Cc: Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 18 2021, Eric Farman <farman@linux.ibm.com> wrote:

> Conny, et al,
>
> Here is a quick update to the series for fixing passthrough
> sense data in the irb, using a subchannel-specific callback.
>
> As before, the first three patches are code refactoring.
> Since patch 3 doesn't implement the callback for vfio-ccw
> subchannels, it fixes the problem encountered with
> "dasdfmt -M quick" failing to run correctly in the guest.
> Since the callback isn't invoked for passthrough subchannels
> the SCSW and ERW bits don't get set indicating sense data
> is present, even though the sense data itself is still zero.
>
> Patch 4 implements that for vfio-ccw.

Thanks, applied (with the discussed modifications in patch 1).

[s390-next is getting full; I plan to send a pull req on Monday, as it
is a bit late in the day for me already.]

>
> v3->v4:
>  - [CH] Rename ESW.sublog to ESW.word0
>  - [CH] Add comment that ESW.f_addr and .s_addr are only Fmt0 ESW
>  - [CH] Always copy ECW data into IRB to include mysterious
>         "model-dependent information" that could exist there
>  - [TH] Added r-b to patch 2 (thank you!!)
>
> v2->v3:
>  - [EF] Drop Fixes tag
>  - [CH] Implement a callback for the IRB sense data
>  - [CH] Copy IRB.ESW from passthrough hardware
>  - [CH] Only put sense in IRB.ECW if passthrough device did
>
> v1->v2:
>  - [MR] Add Fixes: tags
>  - [CH] Reinstate the memcpy(sch->sense_data, irb.ecw) in vfio_ccw
>  - [CH] Look at IRB.SCSW.E before copying sense into guest IRB
>
> v3: https://lore.kernel.org/qemu-devel/20210616014749.2460133-1-farman@linux.ibm.com/
> v2: https://lore.kernel.org/qemu-devel/20210611202151.615410-1-farman@linux.ibm.com/
> v1: https://lore.kernel.org/qemu-devel/20210610202011.391029-1-farman@linux.ibm.com/
>
> Eric Farman (4):
>   s390x/css: Introduce an ESW struct
>   s390x/css: Split out the IRB sense data
>   s390x/css: Refactor IRB construction
>   s390x/css: Add passthrough IRB
>
>  hw/s390x/3270-ccw.c       |  1 +
>  hw/s390x/css.c            | 87 ++++++++++++++++++++++++++++-----------
>  hw/s390x/s390-ccw.c       |  1 +
>  hw/s390x/virtio-ccw.c     |  1 +
>  hw/vfio/ccw.c             |  4 ++
>  include/hw/s390x/css.h    |  5 +++
>  include/hw/s390x/ioinst.h | 12 +++++-
>  7 files changed, 86 insertions(+), 25 deletions(-)


