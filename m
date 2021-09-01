Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B28B03FD9F9
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 15:11:08 +0200 (CEST)
Received: from localhost ([::1]:43110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLQ1D-0005j5-QS
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 09:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLPmA-00069L-NL
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 08:55:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLPm9-0007i6-0D
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 08:55:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630500932;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jQEgd0IgKWkL4J0GQaWEa84cT5LccwUwxALpjoYy8aI=;
 b=FChx55W9NU++RxgPPND8WnTj0NhWinAvtEHz9xeK2+Cca119TK0AHjBptCPDSavHB6P/ji
 qpxHF2uHLtTQnb1hbxMkKyL467KC8oUxb2mm+cEUmblFtmSVXSkcFvQwyEU8rEgSbPO1Gr
 OovbthqVYO3vKdjbBO5qPu2asMrzhGc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-389IPMmiNteJH64m7vlJNw-1; Wed, 01 Sep 2021 08:55:26 -0400
X-MC-Unique: 389IPMmiNteJH64m7vlJNw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5009F107ACC7;
 Wed,  1 Sep 2021 12:55:25 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 060AA5C1BB;
 Wed,  1 Sep 2021 12:55:22 +0000 (UTC)
Date: Wed, 1 Sep 2021 13:55:20 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [PULL 30/33] tcg: Allocate sufficient storage in
 temp_allocate_frame
Message-ID: <YS94OImIRPOh+KSN@redhat.com>
References: <20210619181452.877683-1-richard.henderson@linaro.org>
 <20210619181452.877683-31-richard.henderson@linaro.org>
 <20210901105231.GA719@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210901105231.GA719@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: peter.maydell@linaro.org, Stefan Weil <sw@weilnetz.de>,
 qemu-stable@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 01, 2021 at 11:52:31AM +0100, Richard W.M. Jones wrote:
> On Sat, Jun 19, 2021 at 11:14:49AM -0700, Richard Henderson wrote:
> > This function should have been updated for vector types
> > when they were introduced.
> > 
> > Fixes: d2fd745fe8b
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/367
> > Cc: qemu-stable@nongnu.org
> > Tested-by: Stefan Weil <sw@weilnetz.de>
> > Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  tcg/tcg.c | 32 +++++++++++++++++++++++++++-----
> >  1 file changed, 27 insertions(+), 5 deletions(-)
> > 
> ...
> > +    assert(align <= TCG_TARGET_STACK_ALIGN);
> 
> This assertion is triggering:
> https://bugzilla.redhat.com/show_bug.cgi?id=1999878
> 
> It happens when the kernel is booting after this line:
> 
>   [    7.315373] Loading compiled-in X.509 certificates
> 
> If everything was working then the next line of output *should* be:
> 
>   Loaded X.509 cert 'Fedora kernel signing key: 65d4930f94e951d5c1531017b9559872a4e7b0b0'
> 
> but instead it is:
> 
>   [    7.183521] ThumbEE CPU extension supported.
>   [    7.186066] Registering SWP/SWPB emulation handler
>   [    7.304374] registered taskstats version 1
>   [    7.315373] Loading compiled-in X.509 certificates
>   qemu-system-arm: ../tcg/tcg.c:3063: temp_allocate_frame: Assertion `align <= TCG_TARGET_STACK_ALIGN' failed.
> 
> Unfortunately I don't have an easy reproducer.  It reproduces very
> reliably in Fedora's build system (qemu 6.1.0 running a TCG armv7 L2
> guest on armv7 L1 host on unknown aarch64 L0 host).  But my attempts
> to perform the same operation anywhere else don't reproduce the
> problem.
> 
> What does the assertion mean?

For arm we can see the TCG_TARGET_STACK_ALIGN value is 8:

  $ git grep TARGET_STACK_ALIGN | grep define | grep arm
  tcg/arm/tcg-target.h:#define TCG_TARGET_STACK_ALIGN		8

The value of 'align' can be larger than that though:

    switch (ts->type) {
    case TCG_TYPE_I32:
        size = align = 4;
        break;
    case TCG_TYPE_I64:
    case TCG_TYPE_V64:
        size = align = 8;
        break;
    case TCG_TYPE_V128:
        size = align = 16;
        break;
    case TCG_TYPE_V256:
        /* Note that we do not require aligned storage for V256. */
        size = 32, align = 16;

So something in TCG arm host/guest is triggering usage
of TCG_TYPE_V128 or TCG_TYPE_V256 types, and thus violating
the assert.

Either the assert is bogus, or TCG arm host/guest should not
be using those types that imply 16 byte alignment.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


