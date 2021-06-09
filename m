Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAB13A1492
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 14:37:30 +0200 (CEST)
Received: from localhost ([::1]:59380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqxSb-0002UX-BS
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 08:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqxRj-0001ot-Dk
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:36:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqxRf-0004Nj-OT
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:36:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623242190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R74rCbDcquMnRl+b5cKrZUlHAouNm1w+a5DqN4h9ieY=;
 b=YIDJNjHlDKqAfAc0/LsA0TGdpKMt2TwtQ47//3hMASlUkxTpBv+hI3UiujU/F8ykQ51nzU
 gNZTJploy17OjFNyFiR4kVq7TT6bekPyT7b0LSm8BHOL2JjybRxUYm+UT6ofIf+nQb0bbD
 TfC3l5bfm1KPrwRrc/uonTUaoNnBsG0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-4272bD-7P-iAB6Ly_9EM-w-1; Wed, 09 Jun 2021 08:36:26 -0400
X-MC-Unique: 4272bD-7P-iAB6Ly_9EM-w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEBD1C7419;
 Wed,  9 Jun 2021 12:36:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76E455D9C6;
 Wed,  9 Jun 2021 12:36:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0C4A1113865F; Wed,  9 Jun 2021 14:36:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] tests/unit/test-char.c: Fix error handling issues
References: <20210608170607.21902-1-peter.maydell@linaro.org>
 <CAMxuvay_bMs_hRzMjc-bVfFJaqk_Zui8anU-dNam4tUztxcvWQ@mail.gmail.com>
 <CAFEAcA9wHEcHO7GpiWZif2w-CUBmLPJYUgr11su7S2hAPhiuwA@mail.gmail.com>
Date: Wed, 09 Jun 2021 14:36:07 +0200
In-Reply-To: <CAFEAcA9wHEcHO7GpiWZif2w-CUBmLPJYUgr11su7S2hAPhiuwA@mail.gmail.com>
 (Peter Maydell's message of "Tue, 8 Jun 2021 21:19:05 +0100")
Message-ID: <87bl8fnrk8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 8 Jun 2021 at 20:51, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com> wrote:
>>
>> Hi
>>
>> On Tue, Jun 8, 2021 at 9:06 PM Peter Maydell <peter.maydell@linaro.org> =
wrote:
>>> I think that improving the quality of the failure reporting
>>> in 'make check' is useful, and that we should probably turn
>>> on g_test_set_nonfatal_assertions() everywhere. (The worst that
>>> can happen is that instead of crashing on the assert we proceed
>>> and crash a bit later, I think.) Awkwardly we don't have a single
>>> place where we could put that call, so I guess it's a coccinelle
>>> script to add it to every test's main() function.
>>>
>>
>> I don't have any strong opinion on this. But I don't see much sense in
>> having extra code for things that should never happen.
>
> The point is that I want to make them happen, though...

I'd prefer not to.

Writing tests is tedious enough as it is.  Replacing

    assert COND in one of the many ways GLib provides

by

    assert COND in one of the many ways GLib provides
    if (!COND) {
        bail out
    }

makes it worse.

Readability suffers, too.

>> I would teach coverity instead that those asserts are always fatal.
>
> If you want an assert that's always fatal, that's g_assert().
> These ones are documented as not always fatal.

You'd sacrifice the additional output from g_assert_cmpint() & friends,
which can sometimes save a trip through the debugger.  I don't care all
that much myself, but I know others do.

>> Fwiw, none of the tests in glib or gtk seem to use
>> g_test_set_nonfatal_assertions(), probably for similar considerations.
>
> That's interesting. I did wonder about these APIs, and if glib
> themselves aren't using them that seems like a reason why they're
> so awkward.

Plain assert()'s behavior is configurable at compile time: assertion
checking on / off.  This sets a trap for the unwary: side effects in the
argument.  We avoid the trap by gluing the compile-time switch to "on".

GLib's optionally non-fatal assertions add new traps, with much less
excuse.  Without recovery code, non-fatal assertions make little sense.
But when you have to add recovery code anyway, you could easily switch
to a new set of check functions, too.  Overloading the existing
assertion functions was in bad taste.


