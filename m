Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8B337366C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 10:40:04 +0200 (CEST)
Received: from localhost ([::1]:48244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leD4d-0004KQ-46
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 04:40:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1leD0y-0001uB-ST
 for qemu-devel@nongnu.org; Wed, 05 May 2021 04:36:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1leD0x-0003RN-9n
 for qemu-devel@nongnu.org; Wed, 05 May 2021 04:36:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620203774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DXWk06cn5+p1gjQAmqPbrRaCgSjvzmAH7dLwutgFynQ=;
 b=E+mqwcb4kBy697W2YLWTTthhBEfnza+RN2Kearx0r3XyUoNos1NyqykMbRrK275Usowu3P
 e7TkuzvOPYiKALhqofJKOpoi2n0+ytMDHs5NC0n5pldJCdhQQghd6rbF8BvpT7kH4u+7NR
 D6y1EPt6GucqeNEj7g0oMXfZ9L25lEg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-3jFcWrsWO7WEYRd_588LZw-1; Wed, 05 May 2021 04:36:13 -0400
X-MC-Unique: 3jFcWrsWO7WEYRd_588LZw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 090E91020C25;
 Wed,  5 May 2021 08:36:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CFDC960D08;
 Wed,  5 May 2021 08:36:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 536411138529; Wed,  5 May 2021 10:36:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: QEMU tests, Coverity, and g_test_set_nonfatal_assertions()
References: <CAFEAcA9juOChqrh5orybJQwpQsyEZ5z3Dvmy7fjX0DW4Nbgmrg@mail.gmail.com>
Date: Wed, 05 May 2021 10:36:10 +0200
In-Reply-To: <CAFEAcA9juOChqrh5orybJQwpQsyEZ5z3Dvmy7fjX0DW4Nbgmrg@mail.gmail.com>
 (Peter Maydell's message of "Mon, 3 May 2021 17:49:50 +0100")
Message-ID: <877dkdvapx.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

[...]

> In summary, we have a few options:
>
> (1) Expand "assertions always fatal" to test code, and add "panics"
> models of the g_assertion_message* functions. Remove all the calls
> to g_test_set_nonfatal_assertions().
>
> (2) Aim to expand the ability to use g_test_set_nonfatal_assertions()
> to other tests than the handful that currently use it (perhaps by
> providing a standard place where it gets called for all tests, though
> there isn't currently an obvious place to do that). Treat Coverity
> issues in our test code which flag up "this would crash if the
> assertion fired but execution continued" as bugs to be fixed (though
> not very high-priority ones, obviously).

Further discussed under Richard's reply.

> (3) Something else ?

We could try to model what the GLib functions do:
g_test_set_nonfatal_assertions() sets a global flag, the g_assert_FOO()
other than g_assert_not_reached() check it.  We'll then find out whether
Coverity's analysis is strong enough to propagate the value passed to
g_test_set_nonfatal_assertions() to its uses.

[...]


