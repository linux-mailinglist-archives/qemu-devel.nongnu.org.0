Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C16CD3BE562
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 11:12:04 +0200 (CEST)
Received: from localhost ([::1]:42458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m13b9-0005nf-Sr
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 05:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m13aN-000596-3T
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 05:11:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m13aJ-0000eP-AN
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 05:11:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625649069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v0nxyjVYiMGUJUNt0WHi8llSehQoKZDuRNxRYnDWmV0=;
 b=LXTrPtdst35zPTrCdRVbYCuGtnvKwpDa+LwoiYd3+y5M4XF6SP6/WmUOV8YFkM/1jPsUMT
 VMG3HDmxp56Qx9iPXpjT2qbmToNMKyzIk8yC52cioAEt8Y6SetKhKSxME/1wb2pjAxW+JO
 B2hJgH9sBHJLQBWqGgdSyK6uPnvjYBw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-6en57m7qMce1lnejfGMAtA-1; Wed, 07 Jul 2021 05:11:07 -0400
X-MC-Unique: 6en57m7qMce1lnejfGMAtA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D89D804141
 for <qemu-devel@nongnu.org>; Wed,  7 Jul 2021 09:11:07 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A3EB5D9FC;
 Wed,  7 Jul 2021 09:11:02 +0000 (UTC)
Date: Wed, 7 Jul 2021 11:11:01 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 00/53] acpi: refactor error prone build_header() and
 packed structures usage in ACPI tables
Message-ID: <20210707111101.1601960e@redhat.com>
In-Reply-To: <20210705140002-mutt-send-email-mst@kernel.org>
References: <20210625091818.1047980-1-imammedo@redhat.com>
 <20210702104548-mutt-send-email-mst@kernel.org>
 <20210705095618.69fed068@redhat.com>
 <20210705140002-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 5 Jul 2021 14:00:51 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Mon, Jul 05, 2021 at 09:56:18AM +0200, Igor Mammedov wrote:
> > On Fri, 2 Jul 2021 10:47:20 -0400
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >   
> > > On Fri, Jun 25, 2021 at 05:17:24AM -0400, Igor Mammedov wrote:  
> > > > Highlights:
> > > >   * drop pointer arithmetic in ACPI tables code
> > > >   * use endian agnostic API
> > > >   * simplifies review of tables. /in most cases just line by line comparision with spec/    
> > > 
> > > 
> > > A hue amount of work, thank you!
> > > To make it easier to merge, how about splitting it up a bit?
> > > E.g. I think first 10-11 patches make sense on their own, right?  
> > 
> > I think you've meant 01-11 patches, and answer is yes, it's in-depended
> > of actual ACPI refactoring as was mentioned is cover letter, see below.
> > 
> > [...]  
> > > > 
> > > > Series also includes optional qtest patches that add missing acpi
> > > > tests for tables that I'm touching to verify conversion changes.
> > > > That includes an alternative build time based impl. of
> > > > qtest_has_accel() API. So if we start bike-shedding this qtest_has_accel()
> > > > we can safely drop all tests included, till the time discussion settles
> > > > and some form of a qtest_has_accel() is merged, at which point I'd respin
> > > > depended tests.  
> > [...]
> > 
> > it's ok to split tests into a separate series if that's what you prefer.  
> 
> Let's start with a smaller series that still makes sense.
> I'll merge that we'll look at the next chunk.
> 

Ok, I'll drop tests for now and respin as v2 with TPM fixes.


