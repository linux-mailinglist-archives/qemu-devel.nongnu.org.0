Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3B6691E5B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 12:33:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQReR-0005XC-Nx; Fri, 10 Feb 2023 06:33:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQReP-0005X2-Q3
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 06:33:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQReO-0004Gx-67
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 06:33:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676028787;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=YZtTCvjUY3Bplco/nrch2W/siWy5iQ7rmzXTCAqINh0=;
 b=feg08sBC9SfltuhrAZcZW2AowYp3osmfYKnG1VmDvN1ac/LGwaBU4QXpnVM1NP2uWGOYXc
 9Zh5AF+hylQLN2cNsrN8aW6uFl9l41DryBmFWUAcIh3bvFf/Ad+et+XnnQy/qrnygpIm7M
 d+hVIdh+Id5uhno+LrCA81PWDwCwN1o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-Q9sCMfavMO2mVJJ_AgjtQQ-1; Fri, 10 Feb 2023 06:33:04 -0500
X-MC-Unique: Q9sCMfavMO2mVJJ_AgjtQQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E068857F42;
 Fri, 10 Feb 2023 11:33:03 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 269E42026D68;
 Fri, 10 Feb 2023 11:33:00 +0000 (UTC)
Date: Fri, 10 Feb 2023 11:32:58 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Dov Murik <dovmurik@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH RFC 0/7] revert RNG seed mess
Message-ID: <Y+YratFIX/WHWbFy@redhat.com>
References: <20230208211212.41951-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230208211212.41951-1-mst@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 08, 2023 at 04:12:23PM -0500, Michael S. Tsirkin wrote:
> All attempts to fix up passing RNG seed via setup_data entry failed.
> Let's just rip out all of it.  We'll start over.
> 
> 
> Warning: all I did was git revert the relevant patches and resolve the
> (trivial) conflicts. Not even compiled - it's almost midnight here.
> 
> Jason this is the kind of approach I'd like to see, not yet another
> pointer math rich patch I need to spend time reviewing. Just get us back
> to where we started. We can redo "x86: use typedef for SetupData struct"
> later if we want, it's benign.

This approach looks suitable for applying to the 7.2 tree too,
which will be good for fixing the regressions in stable.

> 
> Could you do something like this pls?
> Or test and ack if this patchset happens to work by luck.
> 
> Michael S. Tsirkin (7):
>   Revert "x86: don't let decompressed kernel image clobber setup_data"
>   Revert "x86: do not re-randomize RNG seed on snapshot load"
>   Revert "x86: re-initialize RNG seed when selecting kernel"
>   Revert "x86: reinitialize RNG seed on system reboot"
>   Revert "x86: use typedef for SetupData struct"
>   Revert "x86: return modified setup_data only if read as memory, not as
>     file"
>   Revert "hw/i386: pass RNG seed via setup_data entry"
> 
>  include/hw/i386/microvm.h |   5 +-
>  include/hw/i386/pc.h      |   3 -
>  include/hw/i386/x86.h     |   3 +-
>  include/hw/nvram/fw_cfg.h |  31 ----------
>  hw/i386/microvm.c         |  17 ++----
>  hw/i386/pc.c              |   4 +-
>  hw/i386/pc_piix.c         |   2 -
>  hw/i386/pc_q35.c          |   2 -
>  hw/i386/x86.c             | 122 ++++++++++----------------------------
>  hw/nvram/fw_cfg.c         |  21 ++-----
>  10 files changed, 49 insertions(+), 161 deletions(-)
> 
> -- 
> MST
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


