Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B879058C90C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 15:09:31 +0200 (CEST)
Received: from localhost ([::1]:48614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL2Ve-00067g-Un
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 09:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oL2L5-0002X0-KB
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 08:58:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oL2L3-0002GL-FB
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 08:58:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659963512;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ei00RvElfz7wkXW5TnWPKeifzNeKn209XUd21GcSKeY=;
 b=L5O1MKPINhGvS7o6gdDG540sXtl/SdsuIj9UMdvU+9+pjUUHTMbWATzADfMWopH+qsjihN
 3kRXoSlCh4boMcNCCWzd8E4sbz1dkNONYNN06vADBLar89ly1d/EFjABksL9SMDgMD2xyG
 qiGz8WqbNaXrFb2Z+tywq+FWCI4PvXw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-5a_sNTXdPlWvuWa6q6vrHw-1; Mon, 08 Aug 2022 08:58:29 -0400
X-MC-Unique: 5a_sNTXdPlWvuWa6q6vrHw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4145885A587;
 Mon,  8 Aug 2022 12:58:29 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.229])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 84EB618ECC;
 Mon,  8 Aug 2022 12:58:27 +0000 (UTC)
Date: Mon, 8 Aug 2022 13:58:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: Migration tests are very slow in the CI
Message-ID: <YvEIcNZ/CnFzdpkS@redhat.com>
References: <7bf333f0-7bdc-1ba7-2a45-ffa2894ad809@redhat.com>
 <YvD+FXVf//5xvlgy@redhat.com>
 <41dd9dd2-55bc-5a49-1bf7-757373dac465@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <41dd9dd2-55bc-5a49-1bf7-757373dac465@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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

On Mon, Aug 08, 2022 at 02:43:49PM +0200, Thomas Huth wrote:
> On 08/08/2022 14.14, Daniel P. Berrangé wrote:
> > On Mon, Aug 08, 2022 at 01:57:17PM +0200, Thomas Huth wrote:
> > > 
> > >   Hi!
> > > 
> > > Seems like we're getting more timeouts in the CI pipelines since commit
> > > 2649a72555e ("Allow test to run without uffd") enabled the migration tests
> > > in more scenarios.
> > > 
> > > For example:
> > > 
> > >   https://gitlab.com/qemu-project/qemu/-/jobs/2821578332#L49
> > > 
> > > You can see that the migration-test ran for more than 20 minutes for each
> > > target (x86 and aarch64)! I think that's way too much by default.
> > 
> > Definitely too much.
> > 
> > > I had a check whether there is one subtest taking a lot of time, but it
> > > rather seems like each of the migration test is taking 40 to 50 seconds in
> > > the CI:
> > > 
> > >   https://gitlab.com/thuth/qemu/-/jobs/2825365836#L44
> > 
> > Normally with CI we expect a constant slowdown factor, eg x2.
> > 
> > I expect with migration though, we're triggering behaviour whereby
> > the guest workload is generating dirty pages quicker than we can
> > migrate them over localhost. The balance in this can quickly tip
> > to create an exponential slowdown.
> 
> If I run the aarch64 migration-test on my otherwise idle x86 laptop, it also
> takes already ca. 460 seconds to finish, which is IMHO also already too much
> for a normal "make check" run (without SPEED=slow).
> 
> > I'm not sure if  'g_test_slow' gives us enough granularity though, as
> > if we enable that, it'll impact the whole test suite, not just
> > migration tests.
> 
> We could also check for the GITLAB_CI environment variable, just like we
> already do it in some of the avocado-based tests ... but given the fact that
> the migration test is already very slow on my normal x86 laptop, I think I'd
> prefer if we added some checks with g_test_slow() in there ...
> 
> Are there any tests in migration-test.c that are rather redundant and could
> be easily skipped in quick mode?

The trouble with migration is that there are alot of subtle permutations
that interact in wierd ways, so we've got alot of test scenarios, includuing
many with TLS:

/x86_64/migration/bad_dest
/x86_64/migration/fd_proto
/x86_64/migration/validate_uuid
/x86_64/migration/validate_uuid_error
/x86_64/migration/validate_uuid_src_not_set
/x86_64/migration/validate_uuid_dst_not_set
/x86_64/migration/auto_converge
/x86_64/migration/dirty_ring
/x86_64/migration/vcpu_dirty_limit
/x86_64/migration/postcopy/unix
/x86_64/migration/postcopy/plain
/x86_64/migration/postcopy/recovery/plain
/x86_64/migration/postcopy/recovery/tls/psk
/x86_64/migration/postcopy/preempt/plain
/x86_64/migration/postcopy/preempt/recovery/plain
/x86_64/migration/postcopy/preempt/recovery/tls/psk
/x86_64/migration/postcopy/preempt/tls/psk
/x86_64/migration/postcopy/tls/psk
/x86_64/migration/precopy/unix/plain
/x86_64/migration/precopy/unix/xbzrle
/x86_64/migration/precopy/unix/tls/psk
/x86_64/migration/precopy/unix/tls/x509/default-host
/x86_64/migration/precopy/unix/tls/x509/override-host
/x86_64/migration/precopy/tcp/plain
/x86_64/migration/precopy/tcp/tls/psk/match
/x86_64/migration/precopy/tcp/tls/psk/mismatch
/x86_64/migration/precopy/tcp/tls/x509/default-host
/x86_64/migration/precopy/tcp/tls/x509/override-host
/x86_64/migration/precopy/tcp/tls/x509/mismatch-host
/x86_64/migration/precopy/tcp/tls/x509/friendly-client
/x86_64/migration/precopy/tcp/tls/x509/hostile-client
/x86_64/migration/precopy/tcp/tls/x509/allow-anon-client
/x86_64/migration/precopy/tcp/tls/x509/reject-anon-client
/x86_64/migration/multifd/tcp/plain/none
/x86_64/migration/multifd/tcp/plain/cancel
/x86_64/migration/multifd/tcp/plain/zlib
/x86_64/migration/multifd/tcp/plain/zstd
/x86_64/migration/multifd/tcp/tls/psk/match
/x86_64/migration/multifd/tcp/tls/psk/mismatch
/x86_64/migration/multifd/tcp/tls/x509/default-host
/x86_64/migration/multifd/tcp/tls/x509/override-host
/x86_64/migration/multifd/tcp/tls/x509/mismatch-host
/x86_64/migration/multifd/tcp/tls/x509/allow-anon-client
/x86_64/migration/multifd/tcp/tls/x509/reject-anon-client

Each takes about 4 seconds, except for the xbzrle, autoconverge and
vcpu-dirty-rate tests which take 8-12 seconds.

We could short-circuit most of the tls tests, because 90% of what
they're validating is the initial connection setup phase. We don't
really need to run the full migration to completion, we can just
abort once we're running. Just keep 3 doing the full migration
to completion - one precopy, one postcopy and one multifd.

That'd cut most of thte TLS tests from 4 seconds to 0.5 seconds.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


