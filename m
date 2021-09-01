Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2A73FE26B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 20:31:50 +0200 (CEST)
Received: from localhost ([::1]:53598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLV1Z-000874-9A
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 14:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mLV0C-0007Gj-IJ
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 14:30:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mLV05-0003IJ-HI
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 14:30:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630521016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K4+QDLp/CVQLqCHfdh6oDH9y1jpzfJPNjlovsyQcf3I=;
 b=P0iCotAOsUFjbMmuW/tR3yshhFnkTiOAdeZXB4xJetVBMALVD6ruWehug0QmemrHTAzYMg
 +phuRb+RielduFm7KJlMTYpyRhmQ8iFMhNBWjvRE8+MtGz5Dgbvlzu8EAOmSnQv5stzJiO
 iv9ljMf0+HxbuVDqWe2wJZ/Ly3BwgUg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-qb5oKm0QPbWFULa5F9kjJA-1; Wed, 01 Sep 2021 14:30:12 -0400
X-MC-Unique: qb5oKm0QPbWFULa5F9kjJA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3303A1883526;
 Wed,  1 Sep 2021 18:30:11 +0000 (UTC)
Received: from localhost (unknown [10.39.192.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9AEB560E1C;
 Wed,  1 Sep 2021 18:30:10 +0000 (UTC)
Date: Wed, 1 Sep 2021 19:30:09 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] tcg/arm: Increase stack alignment for function generation
Message-ID: <20210901183009.GG26415@redhat.com>
References: <20210901164446.2722007-1-rjones@redhat.com>
 <20210901164446.2722007-2-rjones@redhat.com>
 <CAFEAcA8WD97HqQRRzB8Z1LVMCmkKZu3_EAQZM1HAMxccQ=PMnA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8WD97HqQRRzB8Z1LVMCmkKZu3_EAQZM1HAMxccQ=PMnA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-stable <qemu-stable@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 01, 2021 at 07:18:03PM +0100, Peter Maydell wrote:
> On Wed, 1 Sept 2021 at 18:01, Richard W.M. Jones <rjones@redhat.com> wrote:
> >
> > This avoids the following assertion when the kernel initializes X.509
> > certificates:
> >
> > [    7.315373] Loading compiled-in X.509 certificates
> > qemu-system-arm: ../tcg/tcg.c:3063: temp_allocate_frame: Assertion `align <= TCG_TARGET_STACK_ALIGN' failed.
> >
> > Fixes: commit c1c091948ae
> > Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1999878
> > Cc: qemu-stable@nongnu.org
> > Tested-by: Richard W.M. Jones <rjones@redhat.com>
> > Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> > ---
> >  tcg/arm/tcg-target.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
> > index d113b7f8db..09df3b39a1 100644
> > --- a/tcg/arm/tcg-target.h
> > +++ b/tcg/arm/tcg-target.h
> > @@ -115,7 +115,7 @@ extern bool use_neon_instructions;
> >  #endif
> >
> >  /* used for function call generation */
> > -#define TCG_TARGET_STACK_ALIGN         8
> > +#define TCG_TARGET_STACK_ALIGN          16
> >  #define TCG_TARGET_CALL_ALIGN_ARGS     1
> >  #define TCG_TARGET_CALL_STACK_OFFSET   0
> 
> The 32-bit Arm procedure call standard only guarantees 8-alignment
> of SP, not 16-alignment, so I suspect this is not the correct fix.

Wouldn't it be a good idea if asserts in TCG dumped out something
useful about the guest code?  Because I can only reproduce this bug in
a very awkward batch environment I need to collect as much information
from log messages as possible.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org


