Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CD84D8B9A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 19:19:55 +0100 (CET)
Received: from localhost ([::1]:53842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTpIQ-000090-KK
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 14:19:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nTpGi-0007MO-8e
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 14:18:08 -0400
Received: from smtp86.iad3b.emailsrvr.com ([146.20.161.86]:33901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nTpGc-00065w-Dc
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 14:18:07 -0400
X-Auth-ID: adeason@sinenomine.net
Received: by smtp11.relay.iad3b.emailsrvr.com (Authenticated sender:
 adeason-AT-sinenomine.net) with ESMTPSA id 7C91F400BF; 
 Mon, 14 Mar 2022 14:18:00 -0400 (EDT)
Date: Mon, 14 Mar 2022 13:18:00 -0500
From: Andrew Deason <adeason@sinenomine.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 1/2] util/osdep: Avoid madvise proto on modern Solaris
Message-Id: <20220314131800.89dbb505371e68c7ad382795@sinenomine.net>
In-Reply-To: <CAFEAcA8DZby3k7rZ3F4m037b_qjANzEk-ekVQYxAm5tN1_v84w@mail.gmail.com>
References: <20220314154557.306-1-adeason@sinenomine.net>
 <20220314154557.306-2-adeason@sinenomine.net>
 <CAFEAcA8DZby3k7rZ3F4m037b_qjANzEk-ekVQYxAm5tN1_v84w@mail.gmail.com>
Organization: Sine Nomine Associates
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Classification-ID: af789d99-18ac-4243-a9cb-e688bb2a5834-1-1
Received-SPF: pass client-ip=146.20.161.86;
 envelope-from=adeason@sinenomine.net; helo=smtp86.iad3b.emailsrvr.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Mar 2022 16:36:00 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Mon, 14 Mar 2022 at 16:12, Andrew Deason <adeason@sinenomine.net> wrote:
> >  #ifdef CONFIG_SOLARIS
> >  #include <sys/statvfs.h>
> > +#ifndef HAVE_MADVISE_PROTO
> >  /* See MySQL bug #7156 (http://bugs.mysql.com/bug.php?id=7156) for
> >     discussion about Solaris header problems */
> >  extern int madvise(char *, size_t, int);
> >  #endif
> > +#endif
> 
> Rather than keeping this inside a CONFIG_SOLARIS and only doing
> the meson.build test if targetos == sunos, I would prefer it if we
> unconditionally determined two things in meson.build:
>  (1) do we have madvise in the usual way? (this is what we would
>      want CONFIG_MADVISE to be, and might even be what it actually is)
>  (2) do we have madvise but only if we provide a prototype for it
>      ourselves? (maybe CONFIG_MADVISE_NO_PROTO)

CONFIG_MADVISE is set if we can cc.links() something that calls
madvise(). If we're missing the prototype, that will fail with -Werror,
but I expect succeeds otherwise. If cc.links() just uses the cflags for
the build, then it seems like it might succeed or fail depending on
--enable-werror. I see some other tests give -Werror as an explicit
extra argument (HAVE_BROKEN_SIZE_MAX, and something for fuzzing); should
this be doing the same to make sure it fails for a missing prototype?

Also just to mention, if we don't care about older Solaris, the
prototype can just be unconditionally removed. It's pretty annoying to
even try to build qemu from git on Solaris 11.4 and earlier, because
many of the build requirements need to be installed/compiled manually
(notably python 3.6+, but iirc also ninja, meson, etc). So I haven't
really tried; there may be many other build issues there.

> Side note: do you know why CONFIG_SOLARIS includes sys/statvfs.h ?
> Is that unrelated to madvise() ?

I think so, it was added in commit 605686cd7ac, which predates madvise()
in that file. It does look like it could be removed from a quick glance.

Would you want me to add a commit to remove it? (Assuming it still
compiles okay.) Or just do that in the same commit as changing the
madvise prototype logic?

-- 
Andrew Deason
adeason@sinenomine.net

