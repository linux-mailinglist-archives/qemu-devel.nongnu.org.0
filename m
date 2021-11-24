Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BB245C570
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 14:55:49 +0100 (CET)
Received: from localhost ([::1]:59558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpskW-0003aE-8P
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 08:55:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mpsXv-0000VB-5F
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:42:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mpsXr-0003Jv-05
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:42:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637761361;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2W+AiDBYREYi8GxmAPATNcqIkvGsVylJ4V5ckzsYDsA=;
 b=IfguHzV/iJ7PR2sy2EbZMSityqlgzi2AhYTnNspdreX1lSKxL0dL5DxH9pUMEkbMULIRYo
 kwB4LUnm/Am0oCXWPDPpEMJT1CWUYirE2usmO6CVIxhv1kjAQSy3HC8CGG/CFyaEsvcYpA
 Ebtu3y5FQbGfUElUerX5OyGfxxt4BXI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-endaiw0xPp-opRfvdlU_Uw-1; Wed, 24 Nov 2021 08:42:26 -0500
X-MC-Unique: endaiw0xPp-opRfvdlU_Uw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 928271023F51;
 Wed, 24 Nov 2021 13:42:24 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 228C960C05;
 Wed, 24 Nov 2021 13:42:06 +0000 (UTC)
Date: Wed, 24 Nov 2021 13:42:04 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v4 04/18] ui: avoid warnings about directdb on Alpine /
 musl libc
Message-ID: <YZ5BLGegxcbFmEpo@redhat.com>
References: <20211124130150.268230-1-berrange@redhat.com>
 <20211124130150.268230-5-berrange@redhat.com>
 <b1babd61-02f9-8083-cda0-99d69839b10e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b1babd61-02f9-8083-cda0-99d69839b10e@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 24, 2021 at 02:32:56PM +0100, Thomas Huth wrote:
> On 24/11/2021 14.01, Daniel P. Berrangé wrote:
> > On Alpine, SDL is built with directfb support and this triggers warnings
> > during QEMU build
> > 
> > In file included from /usr/include/directfb/direct/thread.h:38,
> >                   from /usr/include/directfb/direct/debug.h:43,
> >                   from /usr/include/directfb/direct/interface.h:36,
> >                   from /usr/include/directfb/directfb.h:49,
> >                   from /usr/include/SDL2/SDL_syswm.h:80,
> >                   from /builds/berrange/qemu/include/ui/sdl2.h:8,
> >                   from ../ui/sdl2-gl.c:31:
> > /usr/include/directfb/direct/os/waitqueue.h:41:25: error: redundant redeclaration of 'direct_waitqueue_init' [-Werror=redundant-decls]
> >     41 | DirectResult DIRECT_API direct_waitqueue_init        ( DirectWaitQueue *queue );
> >        |                         ^~~~~~~~~~~~~~~~~~~~~
> 
> I think that's a bug in the SDL2 package of Alpine. I've had trouble with
> that one in the past already ... so not sure whether it's our job now to
> work around bugs in that crappy Alpine package... I'd prefer if we simply do
> not compile-test SDL on Alpine instead.

It is a harmless bug in directfb headers, which has no ill
effects other than producing a warning when some app uses
-Wredundant-decls.  Of course Alpine would ideally get this
patched, but at the same time it is reasonable for Alpine
users to want SDL and if someone has this package installed
already we don't want QEMU build to break due to -Werror.

Case in point, as we auto-generate dockerfiles to ensure
all pre-requisites are installed in all dockerfiles,  the
Alpine dockerfile gains SDL and exposes this bug. We could
turn off -Werror but that's a overly big hammer compared
to this targetted fix.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


