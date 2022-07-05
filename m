Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F11A5673FA
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 18:14:27 +0200 (CEST)
Received: from localhost ([::1]:60646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8lBy-00013H-9v
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 12:14:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8l9z-000840-8G
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:12:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8l9t-0005C5-Fm
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:12:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657037536;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iwX6WqhAmVJDLpESGGUtjDYmBDvQkQ9rrjLXiOu9KLw=;
 b=Mdlra3D6CxdLIpUFmS9+82B388JyHNt+1s61YIm/ieBctyXnZ9h8VTTNBkInDVHOWpTIwK
 wbsQryTo1lvFGL8NWAUlTB+t44ije5Ypjs99JLsO79/aAKiZ5WBc0Q51M2mgpFIqpfoUqb
 DYFVIvrQKVeq73tZTDHf3o1UCFdRzf4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140--mq5k7NzP5eKtArJ4oeK3w-1; Tue, 05 Jul 2022 12:12:07 -0400
X-MC-Unique: -mq5k7NzP5eKtArJ4oeK3w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC43A801231;
 Tue,  5 Jul 2022 16:12:06 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA45540CF8E8;
 Tue,  5 Jul 2022 16:12:03 +0000 (UTC)
Date: Tue, 5 Jul 2022 17:12:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, "Denis V. Lunev" <den@openvz.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alberto Garcia <berto@igalia.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Lieven <pl@kamp.de>
Subject: Re: [RFC 0/8] Introduce an extensible static analyzer
Message-ID: <YsRi0SfAK3SVwQ2H@redhat.com>
References: <20220702113331.2003820-1-afaria@redhat.com>
 <YsMVJLqNYmmpqjGc@redhat.com>
 <CAELaAXymGtALk+ZeMqWJX0mvj1_2p4MbaS4A+eY8V51KDNOddg@mail.gmail.com>
 <YsPlP6t0ALDkF4MU@redhat.com>
 <CAELaAXxdBvtxf2fXu1OxerBH+dTY_iti8CF-GMgGZpaWxgK_Gg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAELaAXxdBvtxf2fXu1OxerBH+dTY_iti8CF-GMgGZpaWxgK_Gg@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 05, 2022 at 12:28:55PM +0100, Alberto Faria wrote:
> On Tue, Jul 5, 2022 at 8:16 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >      for i in `git ls-tree --name-only -r HEAD:`
> >      do
> >         clang-tidy $i 1>/dev/null 2>&1
> >      done
> 
> All of those invocations are probably failing quickly due to missing
> includes and other problems, since the location of the compilation
> database and some other arguments haven't been specified.

Opps yes, I was waaaay too minimalist in testing that.

> 
> Accounting for those problems (and enabling just one random C++ check):
> 
>     $ time clang-tidy -p build \
>         --extra-arg-before=-Wno-unknown-warning-option \
>         --extra-arg='-isystem [...]' \
>         --checks='-*,clang-analyzer-cplusplus.Move' \
>         $( find block -name '*.c' )
>     [...]
> 
>     real    3m0.260s
>     user    2m58.041s
>     sys     0m1.467s

Only analysing the block tree, but if we consider a static analysis
framework is desirable to use for whole of qemu.git, lets see the
numbers for everything.

What follows was done on  my P1 Gen2 thinkpad with 6 core / 12 threads,
where I use 'make -j 12' normally.

First as a benchmark, lets see a full compile of whole of QEMU (with
GCC) on Fedora 36 x86_64

    => 14 minutes


I find this waaaaay too slow though, so I typically configure QEMU with
--target-list=x86_64-softmmu since that suffices 90% of the time.

   => 2 minutes


A 'make check' on this x86_64-only build takes another 2 minutes.


Now, a static analysis baseline across the whole tree with default
tests enabled

 $ clang-tidy --quiet -p build $(git ls-tree -r --name-only HEAD: | grep '\.c$')

  => 45 minutes

wow, wasn't expecting it to be that slow !

Lets restrict to just the block/ dir

 $ clang-tidy --quiet -p build $(find block -name '*.c')

  => 4 minutes

And further restrict to just 1 simple check

 $ clang-tidy --quiet   --checks='-*,clang-analyzer-cplusplus.Move'  -p build $(find block -name '*.c')
  => 2 minutes 30


So extrapolated just that single check would probably work out
at 30 mins for the whole tree.

Overall this isn't cheap, and in the same order of magnitude
as a full compile. I guess this shouldn't be that surprising
really.



> Single-threaded static-analyzer.py without any checks:
> 
>     $ time ./static-analyzer.py build block -j 1
>     Analyzed 79 translation units in 16.0 seconds.
> 
>     real    0m16.665s
>     user    0m15.967s
>     sys     0m0.604s
> 
> And with just the 'return-value-never-used' check enabled for a
> somewhat fairer comparison:
> 
>     $ time ./static-analyzer.py build block -j 1 \
>         -c return-value-never-used
>     Analyzed 79 translation units in 61.5 seconds.
> 
>     real    1m2.080s
>     user    1m1.372s
>     sys     0m0.513s
> 
> Which is good news!

On my machine, a whole tree analysis allowing parallel execution
(iiuc no -j arg means use all cores):

  ./static-analyzer.py build  $(git ls-tree -r --name-only HEAD: | grep '\.c$'

   => 13 minutes

Or just the block layer

  ./static-analyzer.py build  $(find block -name '*.c')

   => 45 seconds


So your script is faster than clang-tidy, which suggests python probably
isn't the major dominating factor in speed, at least at this point in
time.


Still, a full tree analysis time of 13 minutes, compared to  my normal
'make' time of 2 minutes is an order of magnitude.


One thing that I noticed when doing this is that we can only really
do static analysis of files that we can actually compile on the host.
IOW, if on a Linux host, we don't get static analysis of code that
is targetted at FreeBSD / Windows platforms. Obvious really, since
libclang has to do a full parse and this will lack header files
for those platforms. That's just the tradeoff you have to accept
when using a compiler for static analysis, vs a tool that does
"dumb" string based regex matching to detect mistakes. Both kinds
of tools likely have their place for different tasks.


Overall I think a libclang based analysis tool will be useful, but
I can't see us enabling it as a standard part of 'make check'
given the time penalty.


Feels like something that'll have to be opt-in to a large degree
for regular contributors. In terms of gating CI though, it is less
of an issue, since we massively parallelize jobs. As long as we
have a dedicated build job just for running this static analysis
check in isolation, and NOT as 'make check' in all existing jobs,
it can happen in parallel with all the other build jobs, and we
won't notice the speed.

In summary, I think this approach is viable despite the speed
penalty provided we dont wire it into 'make check' by default.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


