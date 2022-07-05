Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB025663D2
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 09:18:35 +0200 (CEST)
Received: from localhost ([::1]:33972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8cpN-0005cW-VY
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 03:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8cnQ-00047M-JO
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 03:16:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8cnM-0000bx-UG
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 03:16:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657005387;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GhaUD0h45CAGDkXJCfWu2HO25IHuXt2cZsbciSiTQgo=;
 b=QIpvMdJvrrG69SFm//4NaWi3/nrK791iEvpesP6FH3UxQqF1ulBu9AVuLfHdTyaWUO+897
 4ggBW6x3JHaXXQX8EaSmZeLXY6kLwFCJbgaxhi7Qo8/N0IUMpLkgNtX6JJYEJ8sI4g2gch
 CopktPHC6hToY6EKMs9ltWHfwj8+hxU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-yu6fldAoM8isev_7bi3QrQ-1; Tue, 05 Jul 2022 03:16:22 -0400
X-MC-Unique: yu6fldAoM8isev_7bi3QrQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4006738217E5;
 Tue,  5 Jul 2022 07:16:22 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 57B6CC50941;
 Tue,  5 Jul 2022 07:16:18 +0000 (UTC)
Date: Tue, 5 Jul 2022 08:16:15 +0100
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
Message-ID: <YsPlP6t0ALDkF4MU@redhat.com>
References: <20220702113331.2003820-1-afaria@redhat.com>
 <YsMVJLqNYmmpqjGc@redhat.com>
 <CAELaAXymGtALk+ZeMqWJX0mvj1_2p4MbaS4A+eY8V51KDNOddg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAELaAXymGtALk+ZeMqWJX0mvj1_2p4MbaS4A+eY8V51KDNOddg@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, Jul 04, 2022 at 08:30:08PM +0100, Alberto Faria wrote:
> On Mon, Jul 4, 2022 at 5:28 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > Have you done any measurement see how much of the overhead is from
> > the checks you implemented, vs how much is inherantly forced on us
> > by libclang ? ie what does it look like if you just load the libclang
> > framework and run it actross all source files, without doing any
> > checks in python.
> 
> Running the script with all checks disabled, i.e., doing nothing after
> TranslationUnit.from_source():
> 
>     $ time ./static-analyzer.py build
>     [...]
>     Analyzed 8775 translation units in 274.0 seconds.
> 
>     real    4m34.537s
>     user    49m32.555s
>     sys     1m18.731s
> 
>     $ time ./static-analyzer.py build block util
>     Analyzed 162 translation units in 4.2 seconds.
> 
>     real    0m4.804s
>     user    0m40.389s
>     sys     0m1.690s
> 
> This is still with 12 threads on a 12-hardware thread laptop, but
> scalability is near perfect. (The time reported by the script doesn't
> include loading and inspection of the compilation database.)
> 
> So, not great. What's more, TranslationUnit.from_source() delegates
> all work to clang_parseTranslationUnit(), so I suspect C libclang
> wouldn't do much better.
> 
> And with all checks enabled:
> 
>     $ time ./static-analyzer.py build block util
>     [...]
>     Analyzed 162 translation units in 86.4 seconds.
> 
>     real    1m26.999s
>     user    14m51.163s
>     sys     0m2.205s
> 
> Yikes. Also not great at all, although the current implementation does
> many inefficient things, like redundant AST traversals. Cutting
> through some of clang.cindex's abstractions should also help, e.g.,
> using libclang's visitor API properly instead of calling
> clang_visitChildren() for every get_children().
> 
> Perhaps we should set a target for how slow we can tolerate this thing
> to be, as a percentage of total build time, and determine if the
> libclang approach is viable. I'm thinking maybe 10%?
> 
> > If i run 'clang-tidy' across the entire source tree, it takes 3 minutes
> > on my machine, but there's overhead of repeatedly starting the process
> > in there.
> 
> Is that parallelized in some way? It seems strange that clang-tidy
> would be so much faster than libclang.

No, that was me doing a dumb

     for i in `git ls-tree --name-only -r HEAD:`
     do
        clang-tidy $i 1>/dev/null 2>&1
     done

so in fact it was parsing all source files, not just .c files (and
likely whining about non-C files.  This was on my laptop with 6
cores / 2 SMT

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


