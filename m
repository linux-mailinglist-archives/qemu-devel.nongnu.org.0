Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC68B4B8C4C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 16:21:09 +0100 (CET)
Received: from localhost ([::1]:53986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKM7A-0007Z4-Ul
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 10:21:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nKM5c-0006PP-BG
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 10:19:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nKM5X-0005gm-Fv
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 10:19:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645024766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kAhtc/qvUn1EoOeydeG1AkMu35MrH5pBGXseE2MlG8M=;
 b=RvfWEtfBjJF7COSE8h1jiSRvX41QZ20E53T+ElsMvcRnMak6Nd/TVV8yHx64e9OcbgI0MC
 Fb2Hwy3mHbuakYP97OneWixkz4gjJc04fB+gf0P9bIXf0i64E44gihwe7A6ofOk9VrZwzL
 OC15jaBJ/CsWhVpUV/1aoDfmNb0N+EY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-wIzEv1I_OxOsrWidG0gw_w-1; Wed, 16 Feb 2022 10:19:19 -0500
X-MC-Unique: wIzEv1I_OxOsrWidG0gw_w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AB4B101F7A1;
 Wed, 16 Feb 2022 15:19:18 +0000 (UTC)
Received: from redhat.com (unknown [10.22.17.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C7E356F85;
 Wed, 16 Feb 2022 15:19:17 +0000 (UTC)
Date: Wed, 16 Feb 2022 09:19:15 -0600
From: Eric Blake <eblake@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/qemu-iotests: Rework the checks and spots using
 GNU sed
Message-ID: <20220216151915.h6tszpic45fxsapm@redhat.com>
References: <20220215132031.293563-1-thuth@redhat.com>
 <20220215221027.tpmbyk7rkmuf6lit@redhat.com>
 <88014d58-90cb-022a-b666-5fb985da2052@redhat.com>
MIME-Version: 1.0
In-Reply-To: <88014d58-90cb-022a-b666-5fb985da2052@redhat.com>
User-Agent: NeoMutt/20211029-322-5436a9
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 16, 2022 at 12:39:06PM +0100, Thomas Huth wrote:
> > > -    $SED -re 's/[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}/yyyy-mm-dd hh:mm:ss/'
> > > +    gsed -re 's/[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}/yyyy-mm-dd hh:mm:ss/'
> > 
> > GNU sed recommends spelling it 'sed -E', not 'sed -r', when using
> > extended regex.  Older POSIX did not support either spelling, but the
> > next version will require -E, as many implementations have it now:
> > https://www.austingroupbugs.net/view.php?id=528
> 
> Thanks for the pointer ... I originally checked "man 1p sed" on
> my system and did not see -r or -E in there, so I thought that
> this must be really something specific to GNU sed. But now that
> you've mentioned this, I just double-checked the build environments
> that we support with QEMU, and seems like -E should be supported
> everywhere:

Yay.

> 
> So I think it should be safe to change these spots that are
> using "-r" to "sed -E" (and not use gsed here).
> 
> > Other than the fact that this was easier to write with ERE, I'm not
> > seeing any other GNU-only extensions in use here; but I'd recommend
> > that as long as we're touching the line, we spell it 'gsed -Ee'
> > instead of -re (here, and in several other places).
> > 
> > >   _filter_qom_path()
> > >   {
> > > -    $SED -e '/Attached to:/s/\device[[0-9]\+\]/device[N]/g'
> > > +    gsed -e '/Attached to:/s/\device[[0-9]\+\]/device[N]/g'
> > 
> > Here, it is our use of \+ that is a GNU sed extension, although it is
> > fairly easy (but verbose) to translate that one to portable sed
> > (<PAT>\+ is the same as <PAT><PAT>*).  So gsed is correct.

Then again, since we claim 'sed -E' is portable, we can get the +
operator everywhere by using ERE instead of BRE (and with fewer
leaning toothpicks, another reason I like ERE better than BRE).

On the
> > other hand, the use of [[0-9]\+\] looks ugly - it probably does NOT
> > match what we meant (we have a bracket expression '[...]' that matches
> > the 11 characters [ and 0-9, then '\+' to match that bracket
> > expression 1 or more times, then '\]' which in its context is
> > identical to ']' to match a closing ], since only opening [ needs \
> > escaping for literal treatment).  What we probably meant is:
> > 
> > '/Attached to:/s/\device\[[0-9][0-9]*]/device[N]/g'
> > 
> > at which point normal sed would do.
> 
> Ok ... but I'd prefer to clean such spots rather in a second step,
> to make sure not to introduce bugs and to make the review easier.

Yeah, fixing bugs and cleaning up consistent use of sed/gsed/$SED are
worth separating.

> > >   _filter_qemu_io()
> > >   {
> > > -    _filter_win32 | $SED -e "s/[0-9]* ops\; [0-9/:. sec]* ([0-9/.inf]* [EPTGMKiBbytes]*\/sec and [0-9/.inf]* ops\/sec)/X ops\; XX:XX:XX.X (XXX YYY\/sec and XXX ops\/sec)/" \
> > > +    _filter_win32 | gsed -e "s/[0-9]* ops\; [0-9/:. sec]* ([0-9/.inf]* [EPTGMKiBbytes]*\/sec and [0-9/.inf]* ops\/sec)/X ops\; XX:XX:XX.X (XXX YYY\/sec and XXX ops\/sec)/" \
> > >           -e "s/: line [0-9][0-9]*:  *[0-9][0-9]*\( Aborted\| Killed\)/:\1/" \
> > >           -e "s/qemu-io> //g"
> > 
> > I'm not seeing anything specific to GNU sed in this (long) sed script;
> > can we relax this one to plain 'sed'?  Use of s#some/text## might be
> > easier than having to s/some\/text//, but that's not essential.
> 
> If I switch that to plain sed, I'm getting errors like this on NetBSD:
> 
> --- /home/qemu/qemu-test.is2SLq/src/tests/qemu-iotests/046.out
> +++ 11296-046.out.bad
> @@ -66,6 +66,7 @@
>  64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>  wrote 65536/65536 bytes at offset 2031616
>  64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=6442450944 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT

Huh; not sure what happened that I didn't see.  But I trust your tests
as a more canonical version of "it worked on this platform's sed" than
my "I don't see anything blantantly non-POSIX" ;)

> 
>  == Some concurrent requests touching the same cluster ==
> 
> So I'll keep gsed here for now - we need it for _filter_qemu_io
> anyway since it's calling _filter_win32 that currently needs
> gsed, too.

Yeah, I think your patch is big enough to prove there are places where
it really is easier to rely on gsed than to try and be portable.

> 
> > > @@ -142,7 +142,7 @@ _do_filter_img_create()
> > >       # precedes ", fmt=") and the options part ($options, which starts
> > >       # with "fmt=")
> > >       # (And just echo everything before the first "^Formatting")
> > > -    readarray formatting_line < <($SED -e 's/, fmt=/\n/')
> > > +    readarray formatting_line < <(gsed -e 's/, fmt=/\n/')
> > 
> > This one looks like it should work with plain 'sed'.
> 
> Using normal sed does not really work for me here. For example
> with NetBSD, I get errors like this:
> 
> --- /home/qemu/qemu-test.cSYvEb/src/tests/qemu-iotests/027.out
> +++ 13694-027.out.bad
> @@ -1,5 +1,5 @@
>  QA output created by 027
> -Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
> +Formatting 'TEST_DIR/t.IMGFMT'nIMGFMT cluster_size=65536 extended_l2=off compression_type=zlib size=134217728 lazy_refcounts=off refcount_bits=16, fmt=

Hmm.  I had to go and re-read POSIX.  Okay, POSIX says that
's/...\n.../.../' is required to match a newline in the pattern space,
but for the substitution, \n is not required to work, and instead, you
would write:
s/.../\
/
to portably substitute a literal newline into the output.  But that is
unwieldy in a script, so using gsed is indeed the best approach.

> > I found one or two issues that need to be fixed, and a couple of
> > "might as well improve them while touching the line anyway", but
> > overall I like where this is headed.
> 
> Thanks a lot of your review and suggestions, I'll respin a v2 with the updates...

Looking forward to it.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


