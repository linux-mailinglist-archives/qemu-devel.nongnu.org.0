Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4577C4DA332
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 20:19:01 +0100 (CET)
Received: from localhost ([::1]:33352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUChA-0008Ar-3E
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 15:19:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nUCez-0005cg-CJ
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 15:16:45 -0400
Received: from smtp109.iad3a.emailsrvr.com ([173.203.187.109]:34051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nUCew-0002VS-V6
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 15:16:44 -0400
X-Auth-ID: adeason@sinenomine.net
Received: by smtp38.relay.iad3a.emailsrvr.com (Authenticated sender:
 adeason-AT-sinenomine.net) with ESMTPSA id 023765697; 
 Tue, 15 Mar 2022 15:15:06 -0400 (EDT)
Date: Tue, 15 Mar 2022 14:16:13 -0500
From: Andrew Deason <adeason@sinenomine.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 1/3] util/osdep: Avoid madvise proto on modern Solaris
Message-Id: <20220315141613.67bed566f6c6295b73436ca0@sinenomine.net>
In-Reply-To: <CAFEAcA-FzgoTS=WAhU35v5jW7QbUzrTHSX4r_4nYRdmoGZrpTA@mail.gmail.com>
References: <20220315022025.18908-1-adeason@sinenomine.net>
 <20220315022025.18908-2-adeason@sinenomine.net>
 <CAFEAcA-FzgoTS=WAhU35v5jW7QbUzrTHSX4r_4nYRdmoGZrpTA@mail.gmail.com>
Organization: Sine Nomine Associates
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Classification-ID: 06fb7bcf-9cf4-4f64-9cf3-9af91adf7524-1-1
Received-SPF: pass client-ip=173.203.187.109;
 envelope-from=adeason@sinenomine.net; helo=smtp109.iad3a.emailsrvr.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Mar 2022 18:33:33 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> Since this is a little bit tricky, I think a comment here will help
> future readers:
> 
> # Older Solaris/Illumos provide madvise() but forget to prototype it.

I don't think it matters much, but just to mention, the prototype is in
there, but it's deliberately hidden by some #ifdef logic for (older?)
POSIX/XPG compliance or something. I sometimes try to phrase this in a
way that reflects that, but it's hard so I probably won't care.

> > +#ifdef HAVE_MADVISE_MISSING_PROTOTYPE
> >  /* See MySQL bug #7156 (http://bugs.mysql.com/bug.php?id=7156) for
> >     discussion about Solaris header problems */
> >  extern int madvise(char *, size_t, int);
> >  #endif
> 
> As you note, this doesn't match the name we picked in meson.build.
> I don't feel very strongly about the name (we certainly don't manage
> consistency across the project about CONFIG_ vs HAVE_ !), but my suggestion
> is HAVE_MADVISE_WITHOUT_PROTOTYPE.
> 
> Can you put the prototype in include/qemu/osdep.h, please?
> (Exact location not very important as long as it's inside
> the extern-C block, but I suggest just under the bit where we
> define SIGIO for __HAIKU__.)

Okay, but this will cause callers that call madvise() directly to
"work", even though they're not going through the qemu_madvise wrapper.
There's one area in cross-platform code you noted before, in
softmmu/physmem.c, and that does cause the same build error if the
prototype is missing. (I'm going to add another commit to make that use
the wrapper in the next patchset.)

I assume that's not a concern unless I hear otherwise; just pointing it
out.

And all other comments will be addressed; thanks.

-- 
Andrew Deason
adeason@sinenomine.net

