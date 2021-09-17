Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E2940F6C5
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 13:36:23 +0200 (CEST)
Received: from localhost ([::1]:45134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRCAI-0004sj-OK
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 07:36:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mRC8s-00040Z-1E
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 07:34:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mRC8l-0002nF-Kk
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 07:34:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631878485;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=5tsAvw8/lP3qpkuKHMTX/cg4oxV6xyDtoI8VDO9wdYQ=;
 b=N64WHNfkUhhawpI4jbYtpl5kYuJk9HVsnSqdnQ0bj3CRCj4qnLs2MCpeMEgqlxlMVMREiK
 Suq88bqPiMHvpAgHfd2rdue+4Jt5hf5Xf+sNpqNJzikug8tfINWx+XqEQXg6i3rMH6V+5E
 jn5ztAboDLziG5CmfMhjveGSAuQDctk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-CKUvSXMzNc6FR9BX3K2Ugw-1; Fri, 17 Sep 2021 07:34:42 -0400
X-MC-Unique: CKUvSXMzNc6FR9BX3K2Ugw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72C84CC622;
 Fri, 17 Sep 2021 11:34:41 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1552577F3C;
 Fri, 17 Sep 2021 11:34:31 +0000 (UTC)
Date: Fri, 17 Sep 2021 12:34:29 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: Rust in Qemu BoF followup: Rust vs. qemu platform support
Message-ID: <YUR9RXXZ4lSRfcyB@redhat.com>
References: <YURYvaOpya498Xx2@yekko>
MIME-Version: 1.0
In-Reply-To: <YURYvaOpya498Xx2@yekko>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, slp@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, f4bug@amsat.org, hreitz@redhat.com, stefanha@redhat.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org,
 sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 17, 2021 at 06:58:37PM +1000, David Gibson wrote:
> Hi all,
> 
> At the qemu-in-rust BoF at KVM Forum, I volunteered to look into
> whether Rust supported all the host/build platforms that qemu does,
> which is obviously vital if we want to make Rust a non-optional
> component of the build.
> 
> I've added the information to our wiki at:
> 	https://wiki.qemu.org/RustInQemu
> 
> TBH, the coverage is not as good as I expected.  Linux, macOS and
> Windows are pretty much ok, with the exception of Linux on Sparc.
> There are a lot of gaps in *BSD support, however.

To me the coverage looks pretty much what I'd expect to need
for QEMU - almost all boxes that I'd want to see green are
green, except OpenBSD, possibly x86 32-bit for *BSD and
sparc(64) on Linux.

Mostly it highlights that we've never explicitly declared what
our architecture coverage is intended to be. We do check host
arches in configure, but we didn't distinguish this by OS and
I think that's a mistake.

In terms of our CI coverage, the only non-x86 testing we do
is for Linux based systems.

Although its possible people use non-x86 on non-Linux, I don't
recall any discussions/bugs/patches targetting this situation,
so if we do have users I doubt there's many.

Would be interesting to hear input from anyone representing
interests of the various *BSD platforms about their thoughts
wrt non-x86 coverage.

I think our first step is probably to make our architecture
support explicit, regardless of our use of Rust.

If we assume QEMU followed a similar 3 tier policy, on the QEMU
side my interpretation of what we're implicitly targetting would
be:

 Linux:  all arches with a TCG target
 macOS: x86_64
 Windows: i686, x86_64
 FreeBSD: x86_64  (maybe +i686 too)
 NetBSD: x86_64  (maybe +i686 too)
 OpenBSD: x86_64  (maybe +i686 too)

with tier 1 vs 2 for the above depending on whether we run
'make check' in gating CI)

That isn't to say that other combinations don't work, but if they
did work, they would be at most Tier 3 from QEMU's POV.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


