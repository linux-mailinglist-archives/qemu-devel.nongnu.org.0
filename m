Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 223042F48B9
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 11:33:13 +0100 (CET)
Received: from localhost ([::1]:46054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzdSi-0001R5-7Q
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 05:33:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kzdRf-0000ap-E0
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 05:32:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kzdRd-0006ai-FF
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 05:32:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610533924;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=+QW1Jp+IOSY3/O/cXBgLFwxkax8/btFBH5OCiJiNEHk=;
 b=SqFySATiZ2MO152uofQJWVPf0lfkQLvbRKbdloVv5VwLpkulToiwR867T++X2ljvR9DLkx
 twX8JxHUfosQTRqK5gdfJOBZPAnOkR1CKvMp4txBkdbmAX1axlMRhIuV96bv6sqVTYUVRj
 ub7ywKKkO0Oz/O1LHvp84VLUAJltxtg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-hA3FmsTtO5aQCjSal8CERA-1; Wed, 13 Jan 2021 05:31:57 -0500
X-MC-Unique: hA3FmsTtO5aQCjSal8CERA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 009518144E5;
 Wed, 13 Jan 2021 10:31:56 +0000 (UTC)
Received: from redhat.com (ovpn-115-107.ams2.redhat.com [10.36.115.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F270A1C936;
 Wed, 13 Jan 2021 10:31:47 +0000 (UTC)
Date: Wed, 13 Jan 2021 10:31:43 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 8/8] configure: automatically parse command line for
 meson -D options
Message-ID: <20210113103143.GA1568240@redhat.com>
References: <20210107140039.467969-1-pbonzini@redhat.com>
 <20210107140039.467969-9-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210107140039.467969-9-pbonzini@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 07, 2021 at 03:00:39PM +0100, Paolo Bonzini wrote:
> Right now meson_options.txt lists almost 60 options.  Each option
> needs code in configure to parse it and pass the option down to Meson as
> a -D command-line argument; in addition the default must be duplicated
> between configure and meson_options.txt.
> 
> This series tries to remove the code duplication by passing unknown
> --enable and --disable options to a Perl program, and using Meson's
> introspection support to match those to meson_options.txt.
> About 80% of the options can be handled completely by the new
> mechanism.  Five meson options are not of the --enable/--disable
> kind.  Six more need to be parsed in configure for various reasons
> documented in the patch, but they still have their help automatically
> generated.
> 
> The advantages are simple to explain, and are basically what you
> can expect from an introspection-based system:
> 
> - there is obviously much less code in configure.  About 1000 lines
>   of the script deal with command line parsing, and the patch removes
>   a quarter of them.
> 
> - the script is higher quality than the repetitive code in configure.
>   Help is generally more complete and useful, for example it consistently
>   lists defaults as well as the possible choices if they are not just
>   enabled/disabled/auto.  Parsing is more consistent too, for example
>   --enable-slirp and --enable-blobs were not supported.
> 
> - new Meson options do not need any change to the configure script.
>   This increases the attractiveness of converting options from
>   hand-crafted parsing and config-host.mak to Meson.
> 
> The disadvantages are:
> 
> - a few options change name: --enable-tcmalloc and --enable-jemalloc
>   become --enable-malloc={tcmalloc,jemalloc}; --disable-blobs becomes
>   --disable-install-blobs.
> 
> - because we need to run the script to generate the full help, we
>   cannot rely on the user supplying the path to a Python interpreter
>   with --python.  For this reason, the script is written in Perl.
>   Perl 5 is universally available as "/usr/bin/env perl", while
>   (even ignoring the Python 2/3 difference) some systems do not
>   have a "python" or "python3" binary on the path.

Can't we just use  "/usr/bin/env python3", and if that doesn't
exist in $PATH, simply show truncated --help output, with a
message requesting that they pass --python to see full help.

> 
> - because we parse command-line options before meson is available,
>   the introspection output is stored in the source tree.  This is
>   the reason for the unattractive diffstat; the number of JSON lines
>   added is higher than the number of configure lines removed.
>   Of course the latter are code that must be maintained manually and
>   the former is not.
> 
> Note that the output of "meson introspect --buildoptions" is massaged
> slightly, in order to make it more stable and avoid horrible conflicts
> on every modification to meson_options.txt.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  Makefile                                |  11 +
>  configure                               | 371 ++----------
>  docs/devel/build-system.rst             |  49 +-
>  meson-buildoptions.json                 | 717 ++++++++++++++++++++++++

I'm not a fan of seeing this file introduced as it has significant
overlap with meson_options.txt.    I feel like the latter has enough
information present to do an acceptable job for help output. After
all that's sufficient if we were using meson directly.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


