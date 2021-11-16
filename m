Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEC04531B2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 13:03:17 +0100 (CET)
Received: from localhost ([::1]:57950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmxBE-0001XL-0l
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 07:03:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mmx8Y-00006F-PA
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:00:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mmx8T-0004UL-Nc
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:00:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637064022;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=eJOvMU/jiUSJTk4UVXAUefNXMSblYG3nxNe3QqvhRFs=;
 b=Tlx2Mw9nmJwZzIg8eNm1hOvT95/ZuhX7+kZbPGjNvEIixezfh1OD2JJd8hWFrIogJQL0Ro
 9V9TsaNJXtQg40Vsal50jE7IxkbL/nKJg/PKO1NTjt3Caxsg2jd1XnspFeRjSc/3gn2JJs
 KnDRlbQdcCc6Zm+buOp4UpZBXYzAxF0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-WkY9XqmXOKeusPPXoid0qw-1; Tue, 16 Nov 2021 07:00:15 -0500
X-MC-Unique: WkY9XqmXOKeusPPXoid0qw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5FB2879A08;
 Tue, 16 Nov 2021 12:00:07 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.159])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF98960C81;
 Tue, 16 Nov 2021 12:00:06 +0000 (UTC)
Date: Tue, 16 Nov 2021 12:00:04 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] meson: fix botched compile check conversions
Message-ID: <YZOdRHZn9h9Rdjlr@redhat.com>
References: <20211116093834.76615-1-pbonzini@redhat.com>
 <CAFEAcA8=RsA37ErttuGKKfrb8Ooy9NJs=F4o4agQbgu=On9P5w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8=RsA37ErttuGKKfrb8Ooy9NJs=F4o4agQbgu=On9P5w@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 16, 2021 at 11:51:16AM +0000, Peter Maydell wrote:
> On Tue, 16 Nov 2021 at 09:38, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > Fix a bunch of incorrect conversions from configure to Meson, which result
> > in different outcomes with --extra-cflags=-Werror.
> 
> FWIW this still won't give the right answer for the 'struct iovec'
> test if you include -Werror via --extra-cflags, because the
> generated code trips over an "expression result unused" warning:
> 
> 
> Running compile:
> Working directory:
> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/meson-private/tmpeiz36t2n
> Command line:  clang-7 -m64 -mcx16
> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/meson-private/tmpeiz36t2n/testfile.c
> -o /mnt/nvmedis
> k/linaro/qemu-from-laptop/qemu/build/arm-clang/meson-private/tmpeiz36t2n/output.obj
> -c -fsanitize=undefined -fno-sanitize=shift-base -Werror -D_FI
> LE_OFFSET_BITS=64 -O0 -Werror=implicit-function-declaration
> -Werror=unknown-warning-option -Werror=unused-command-line-argument
> -Werror=ignored-op
> timization-argument -std=gnu11
> 
> Code:
>  #include <sys/uio.h>
>         void bar(void) {
>             sizeof(struct iovec);
>         };
> Compiler stdout:
> 
> Compiler stderr:
>  /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/meson-private/tmpeiz36t2n/testfile.c:3:13:
> error: expression result unused [-Werror,-Wunused-value]
>             sizeof(struct iovec);
>             ^~~~~~~~~~~~~~~~~~~~
> 1 error generated.
> 
> Checking for type "struct iovec" : NO
> 
> 
> But maybe we should just explicitly reject -Werror in --extra-cflags...

I wonder if the problem is more fundamental than that. Passing
stuff in --extra-cflags is done to influence the flags used to
compile the QEMU end user binaries. Unfortunately --extra-cflags
is also getting applied to all the meson.build feature checks.

IMHO we would get a more reliable result if the meson.build
checks were fully isolated from the cflags we used for building
everything else, so the checks get a well understood, predictable
environment.

IIUC, this current behaviour is a result of us adding cflags
using  add_global_arguments / add_project_arguments.

I wonder if we need to exclusively use the 'c_args' parameter
to library()/executable() and friends ?  The downside is of
course would be extra work to make sure we pass c_args in all
the right places.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


