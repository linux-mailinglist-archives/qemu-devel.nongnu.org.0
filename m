Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380E4565C1F
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 18:30:29 +0200 (CEST)
Received: from localhost ([::1]:44172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Oxv-0007eh-RE
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 12:30:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8OwA-0006rj-Jj
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 12:28:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8Ow5-0004Tm-LH
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 12:28:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656952112;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=6BoeQKEg96zZSlyN0B3FK1hC/jmdaQuWr799bnUXXVM=;
 b=b/g5xutiadzCqnFzYRXFyMVqHkK2EkiYFHDYwGUObummBzpjQvH66c2+xKjmv8pcnSg0LE
 OL5zH5fpBlKE2mKAcmRRGmv/UGnd+2gipKtNsa4HjfxQv5jUINttRePpAcaRcLT/fPVvZG
 w9eBBGn8d0t550J2FGZDcAYI4LDfrBk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-A7gXbrz4MBiCn1M462PGzw-1; Mon, 04 Jul 2022 12:28:29 -0400
X-MC-Unique: A7gXbrz4MBiCn1M462PGzw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A85AF2999B4A;
 Mon,  4 Jul 2022 16:28:28 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38DBD4010FA6;
 Mon,  4 Jul 2022 16:28:23 +0000 (UTC)
Date: Mon, 4 Jul 2022 17:28:20 +0100
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
Message-ID: <YsMVJLqNYmmpqjGc@redhat.com>
References: <20220702113331.2003820-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220702113331.2003820-1-afaria@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jul 02, 2022 at 12:33:23PM +0100, Alberto Faria wrote:
> This series introduces a static analyzer for QEMU. It consists of a
> single static-analyzer.py script that relies on libclang's Python
> bindings, and provides a common framework on which arbitrary static
> analysis checks can be developed and run against QEMU's code base.
> 
> Summary of the series:
> 
>   - Patch 1 adds the base static analyzer, along with a simple check
>     that finds static functions whose return value is never used, and
>     patch 2 fixes some occurrences of this.
> 
>   - Patch 3 adds a check to ensure that non-coroutine_fn functions don't
>     perform direct calls to coroutine_fn functions, and patch 4 fixes
>     some violations of this rule.
> 
>   - Patch 5 adds a check to enforce coroutine_fn restrictions on
>     function pointers, namely around assignment and indirect calls, and
>     patch 6 fixes some problems it detects. (Implementing this check
>     properly is complicated, since AFAICT annotation attributes cannot
>     be applied directly to types. This part still needs a lot of work.)
> 
>   - Patch 7 introduces a no_coroutine_fn marker for functions that
>     should not be called from coroutines, makes generated_co_wrapper
>     evaluate to no_coroutine_fn, and adds a check enforcing this rule.
>     Patch 8 fixes some violations that it finds.
> 
> The current primary motivation for this work is enforcing rules around
> block layer coroutines, which is why most of the series focuses on that.
> However, the static analyzer is intended to be sufficiently generic to
> satisfy other present and future QEMU static analysis needs.
> 
> This is very early work-in-progress, and a lot is missing. One notable
> omission is build system integration, including keeping track of which
> translation units have been modified and need re-analyzing.
> 
> Performance is bad, but there is a lot of potential for optimization,
> such as avoiding redundant AST traversals. Switching to C libclang is
> also a possibility, although Python makes it easy to quickly prototype
> new checks, which should encourage adoption and contributions.

Have you done any measurement see how much of the overhead is from
the checks you implemented, vs how much is inherantly forced on us
by libclang ? ie what does it look like if you just load the libclang
framework and run it actross all source files, without doing any
checks in python.

If i run 'clang-tidy' across the entire source tree, it takes 3 minutes
on my machine, but there's overhead of repeatedly starting the process
in there.

I think anything that actually fully parses the source files is going
to have a decent sized unavoidable overhead, when run across the whole
source tree.

Still having a properly parsed abstract source tree is an inherantly
useful thing. for certain types of static analysis check. Some things
get unreliable real fast if you try to anlyse using regex matches and
similar approaches that are the common alternative. So libclang is
understandably appealing in this respect.

> The script takes a path to the build directory, and any number of paths
> to directories or files to analyze. Example run on a 12-thread laptop:
> 
>     $ time ./static-analyzer.py build block
>     block/commit.c:525:15: non-coroutine_fn function calls coroutine_fn
>     block/nbd.c:206:5: non-coroutine_fn function calls coroutine_fn
>     [...]
>     block/ssh.c:1167:13: non-coroutine_fn function calls coroutine_fn
>     block/nfs.c:229:27: non-coroutine_fn function calls coroutine_fn
>     Analyzed 79 translation units.
> 
>     real    0m45.277s
>     user    7m55.496s
>     sys     0m1.445s

Ouch, that is incredibly slow :-(

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


