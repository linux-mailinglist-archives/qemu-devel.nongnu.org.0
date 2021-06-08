Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEBF3A0537
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 22:42:50 +0200 (CEST)
Received: from localhost ([::1]:44674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqiYj-00082Y-OT
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 16:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqiWm-0006ev-B2
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 16:40:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqiWj-0000Hd-QG
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 16:40:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623184845;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+cKZ6bnLmmr79Bssr/rhL1mBsGrJpxUtvRz+WxGg69Y=;
 b=QqUpNs/FBYyRw2pKbjk20YhHK+7miBr43NvVfXa/PuJEOMCMWSOhuAZtaMkpneTgk9nYTt
 HUQsvTcwSbqntv2ABcqXZ2xC4izdZc0YHd6tk0VJoe0VuBdkY1fYMADL85bpNBjj0mcnLR
 fGSxdZTBvCu/FZaJ6HOzlUiwR7WU8VE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-Itt1v_QxMsKpl034YH9tcA-1; Tue, 08 Jun 2021 16:40:38 -0400
X-MC-Unique: Itt1v_QxMsKpl034YH9tcA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0EA5107ACCA;
 Tue,  8 Jun 2021 20:40:37 +0000 (UTC)
Received: from redhat.com (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3CEF10016F8;
 Tue,  8 Jun 2021 20:40:32 +0000 (UTC)
Date: Tue, 8 Jun 2021 21:40:30 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH] tests/unit/test-char.c: Fix error handling issues
Message-ID: <YL/VvhE7VjXz6bwM@redhat.com>
References: <20210608170607.21902-1-peter.maydell@linaro.org>
 <CAMxuvay_bMs_hRzMjc-bVfFJaqk_Zui8anU-dNam4tUztxcvWQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMxuvay_bMs_hRzMjc-bVfFJaqk_Zui8anU-dNam4tUztxcvWQ@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 08, 2021 at 11:51:35PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Tue, Jun 8, 2021 at 9:06 PM Peter Maydell <peter.maydell@linaro.org>
> wrote:
> 
> > Coverity spots some minor error-handling issues in this test code.
> > These are mostly due to the test code assuming that the glib test
> > macros g_assert_cmpint() and friends will always abort on failure.
> > This is not the case: if the test case chooses to call
> > g_test_set_nonfatal_assertions() then they will mark the test case as
> > a failure and continue.  (This is different to g_assert(),
> > g_assert_not_reached(), and assert(), which really do all always kill
> > the process.) The idea is that you use g_assert() for things
> > which are really assertions, as you would in normal QEMU code,
> > and g_assert_cmpint() and friends for "this check is the thing
> > this test case is testing" checks.
> >
> > In fact this test case does not currently set assertions to be
> > nonfatal, but we should ideally be aiming to get to a point where we
> > can set that more generally, because the test harness gives much
> > better error reporting (including minor details like "what was the
> > name of the test case that actually failed") than a raw assert/abort
> > does.  So we mostly fix the Coverity nits by making the error-exit
> > path return early if necessary, rather than by converting the
> > g_assert_cmpint()s to g_assert()s.
> >
> > Fixes: Coverity CID 1432505, 1432514, 1432600, 1451384
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > We had some previous not-very-conclusive discussion about
> > g_assert_foo vs g_assert in this thread:
> >
> > https://lore.kernel.org/qemu-devel/CAFEAcA9juOChqrh5orybJQwpQsyEZ5z3Dvmy7fjX0DW4Nbgmrg@mail.gmail.com/
> > This patch is in some sense me asserting my opinion about the
> > right thing to do. You might disagree...
> >
> > I think that improving the quality of the failure reporting
> > in 'make check' is useful, and that we should probably turn
> > on g_test_set_nonfatal_assertions() everywhere. (The worst that
> > can happen is that instead of crashing on the assert we proceed
> > and crash a bit later, I think.) Awkwardly we don't have a single
> > place where we could put that call, so I guess it's a coccinelle
> > script to add it to every test's main() function.
> >
> >
> I don't have any strong opinion on this. But I don't see much sense in
> having extra code for things that should never happen. I would teach
> coverity instead that those asserts are always fatal. aborting right where
> the assert is reached is easier for the developer, as you get a direct
> backtrace. Given that tests are usually grouped in domains, it doesn't help
> much to keep running the rest of the tests in that group anyway.
> 
> Fwiw, none of the tests in glib or gtk seem to use
> g_test_set_nonfatal_assertions(), probably for similar considerations.

The method was introduced relatively recently (recent in glib terms,
this was still 2013).

commit a6a87506877939fee54bdc7eca70d47fc7d893d4
Author: Matthias Clasen <mclasen@redhat.com>
Date:   Sat Aug 17 15:18:29 2013 -0400

    Add a way to make assertions non-fatal
    
    When using test harnesses other than gtester (e.g. using TAP),
    it can be suboptimal to have the very first failed assertion
    abort the test suite.
    
    This commit adds a g_test_set_nonfatal_assertions() that can
    be called in a test binary to change the behaviour of most
    assert macros to just call g_test_fail() and continue. We
    don't change the behavior of g_assert() and g_assert_not_reached(),
    since these to assertion macros are older than GTest, are
    widely used outside of testsuites, and will cause compiler
    warnings if they loose their noreturn annotation.
    
    https://bugzilla.gnome.org/show_bug.cgi?id=692125


This makes sense as a rationale so I'm surprised that they
never then used it in glib tests.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


