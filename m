Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB2424D1DC
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 11:59:14 +0200 (CEST)
Received: from localhost ([::1]:54348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k93pK-00007F-2t
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 05:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1k93od-00089z-5Z
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 05:58:31 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:48360
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1k93ob-0006tk-4Y
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 05:58:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598003907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QnIlE2suKxUZMHxx+jnxZbqDknAAVRcnb9epNa6H8Gg=;
 b=aJxXQdIOHpKXxG1t5w723WSNB40t+KDW7PoWbLuXTIvP1251kN+cpDHPYaRfE1cauhgIpD
 AJUzgzeExyvs5lM4tJBoZCcqXUUj+3VX3Nk4MK2tX46/Rm0Pe4i0YR26crceoLLsYXXHYn
 n46gRsI058Kqza/FNqVwqSuvaCxKh/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-v4wK6vH8Ncy3zymqm7T6aQ-1; Fri, 21 Aug 2020 05:58:24 -0400
X-MC-Unique: v4wK6vH8Ncy3zymqm7T6aQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D496218A2245;
 Fri, 21 Aug 2020 09:58:23 +0000 (UTC)
Received: from linux.fritz.box (ovpn-113-251.ams2.redhat.com [10.36.113.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 919427E318;
 Fri, 21 Aug 2020 09:58:22 +0000 (UTC)
Date: Fri, 21 Aug 2020 11:58:21 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH] configure: add support for psuedo-"in source tree" builds
Message-ID: <20200821095821.GA5153@linux.fritz.box>
References: <20200820165543.215372-1-berrange@redhat.com>
 <938bfa57-01f9-a50a-6439-0965c91dce1b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <938bfa57-01f9-a50a-6439-0965c91dce1b@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 01:00:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 20.08.2020 um 19:42 hat Eric Blake geschrieben:
> On 8/20/20 11:55 AM, Daniel P. Berrangé wrote:
> > Meson requires the build dir to be separate from the source tree. Many
> > people are used to just running "./configure && make" though and the
> > meson conversion breaks that.
> > 
> > This introduces some backcompat support to make it appear as if an
> > "in source tree" build is being done, but with the the results in the
> > "build/" directory. This allows "./configure && make" to work as it
> > did historically, albeit with the output binaries staying under build/.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> 
> In addition to reviews you already have,
> 
> 
> > I've not tested it beyond that. Note it blows away the "build/"
> > dir each time ./configure is run so it is pristine each time.
> 
> I definitely like the idea of only blowing away what we created - but if we
> created build, then recreating it for each new configure run is nice.

I think I actually wouldn't automatically remove anything on configure.
It can be surprising behaviour for configure to delete directories, and
the old setup didn't do an automatic "make clean" either. By having a
separate build directory, manually emptying as needed has already become
easier.

> > We could optionally symlink binaries from build/ into $PWD
> > if poeople think that is important, eg by changing GNUmakefile
> > to have:
> > 
> > recurse: all
> > 	for bin in `find build -maxdepth 1 -type f -executable | grep -v -E '(ninjatool|config.status)'`; \
> 
> Using -maxdepth gets rid of the need to pre-create empty directories for
> nested binaries, but also loses out on binaries such as
> x86_64-softmmu/qemu-system-x86_64.  Oh, it looks like meson creates
> qemu-system-x86_64 as a binary in the top level, then a symlink in its old
> location.  Populating symlinks to ALL old locations is thus trickier than
> what you are proposing here, so it is fine to save that for a followup patch
> (let's get the bare minimum in first, so that at least ./configure && make
> works, before we worry about back-compat symlinks).

Having the system emulator symlinks in the top level would be a change,
but even more convenient than the original places. I'd vote for adding
the auto-symlinking at least for the tools; if the top-level symlinks
for system emulators get also symlinked by this, that's fine, too.

I was actually surprised that Dan reports "make check" from the source
tree to be working without the symlinks. Some code must be cleverer than
I thought!

Kevin


