Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C22F360554
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 11:12:26 +0200 (CEST)
Received: from localhost ([::1]:44252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWy2z-0002xM-R0
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 05:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lWy1G-0001bq-9E
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 05:10:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lWy1A-00064v-D5
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 05:10:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618477829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L5H5PzqI9rsGZ4+7YJjLbd+dp5/VVtmeyTDlBOKB1sc=;
 b=Mt7UPXP1mJ5m94SPkJJ/UoZ2+yZON8Gu4dHV6nF3+36iaDAa+bfUkq92mSIFxPlXAu5rzR
 7DPI/bVa+0sCfgxfoG26BdWSxDjtsdkzRLsClffRAdC1HiEXZRXuEn5iJgEM115MRKy1nL
 xgYZv2IpRxE1fqLfHncJeXjhchjFCIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-IdimcSusPhWVXncW6toiJQ-1; Thu, 15 Apr 2021 05:10:28 -0400
X-MC-Unique: IdimcSusPhWVXncW6toiJQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 027C981744F;
 Thu, 15 Apr 2021 09:10:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5F4617D8E;
 Thu, 15 Apr 2021 09:10:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4BFA2113525D; Thu, 15 Apr 2021 11:10:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: tidying up osdep.h
References: <CAFEAcA95ZobYrOaDA4O4ESWNAKkMi-y8QUGoVQRkC2ujbtNeSA@mail.gmail.com>
Date: Thu, 15 Apr 2021 11:10:25 +0200
In-Reply-To: <CAFEAcA95ZobYrOaDA4O4ESWNAKkMi-y8QUGoVQRkC2ujbtNeSA@mail.gmail.com>
 (Peter Maydell's message of "Wed, 14 Apr 2021 20:17:04 +0100")
Message-ID: <87y2djewvy.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> (cc'ing people related to the recent 'extern "C"' patches and also
> randomly Markus as somebody who's had opinions on header cleanups
> in the past...)
>
> osdep.h as it stands today is a mix of two things:
>  (1) it has the "must be included by everybody" items:
>    (a) config-host.h, poison.h, compiler.h
>    (b) things which must be done before any system header is included
>        (like defining __STDC_CONSTANT_MACROS or WIN32_LEAN_AND_MEAN)
>    (c) includes of system headers which we need to then fix up for
>        portability issues (eg redefining assert on mingw, defining
>        fallback versions of missing macros)
>  (2) it has declarations for a library of QEMU functions, some of which
>      typically wrap and abstract away OS specifics (like qemu_create(),
>      qemu_unlink()), and some of which seem to have just been dumped
>      in here for convenience (like qemu_hw_version())

It's such a convenient dumping ground :)

> Every file needs (1), which is why we mandate osdep.h as the first
> include; most files don't need a lot of the things in (2) (for instance
> qemu_hw_version() is used in just half a dozen .c files). Is it worth
> trying to split some of the type (2) items out into their own header files?
>
> I suspect that the advantages would be primarily just making osdep.h
> a bit clearer to read and less of an "attractive nuisance" for new
> additions; I imagine the bulk of the extra compilation time represented
> by osdep.h is going to be because it pulls in dozens of system
> headers, most of which are going to be required under heading (1).

I agree that keeping it focused on (1) would be cleaner, and that such a
cleanup probably won't speed up builds.  Regarding your question whether
the cleanup is worth the bother: I guess if somebody posts patches, it
is.


