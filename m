Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDAE3250AA
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 14:43:38 +0100 (CET)
Received: from localhost ([::1]:44318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFGvZ-00077n-C5
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 08:43:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lFGu0-0005s4-Lu
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 08:42:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lFGtw-0007Tc-EL
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 08:42:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614260514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V8WpRqVtu7T2sX0Fzts5oaG5GRQuppb2GTAAg1f0UUg=;
 b=buTnR4+zOuilu7a2myd4z2N8jZE4Vkr6icRl4KK8DPnbpJQ6Mfl/aEcKzT0KAOXuEU31/M
 NSWY9DMTX7/Ycq9oBVNW558dmEGVFN5nxRs3EBRUp064XVRiZBhHFQrJb56f07AxPBOpwz
 TDPqIAl7cm7PRq2e+SOqms4L9UcSI8E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-0EAu_L7sNMemnqvXq86PfQ-1; Thu, 25 Feb 2021 08:41:52 -0500
X-MC-Unique: 0EAu_L7sNMemnqvXq86PfQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F3CA801977;
 Thu, 25 Feb 2021 13:41:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 37C485D6D7;
 Thu, 25 Feb 2021 13:41:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C0FFC113860F; Thu, 25 Feb 2021 14:41:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Bogus "is either too old or uses too old a Python version" from
 docs/meson.build
References: <87ft1kqqsp.fsf@dusky.pond.sub.org>
 <CAFEAcA-NyQT_m37UfeH5KAQ9+dkNBHcQivYyrS4C9F3EUqJ+Nw@mail.gmail.com>
Date: Thu, 25 Feb 2021 14:41:49 +0100
In-Reply-To: <CAFEAcA-NyQT_m37UfeH5KAQ9+dkNBHcQivYyrS4C9F3EUqJ+Nw@mail.gmail.com>
 (Peter Maydell's message of "Thu, 25 Feb 2021 12:55:49 +0000")
Message-ID: <87zgzsb6xu.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 25 Feb 2021 at 12:23, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> I just chanced on this one:
>>
>>     Program sphinx-build-3 found: YES
>>     ../docs/meson.build:30: WARNING: /usr/bin/sphinx-build-3 is either too old or uses too old a Python version
>>
>>     ../docs/meson.build:33:6: ERROR: Problem encountered: Install a Python 3 version of python-sphinx
>>
>>     A full log can be found at /work/armbru/qemu/bld-x86/meson-logs/meson-log.txt
>>
>>     ERROR: meson setup failed
>>
>> My sphinx-build-3 is just fine, the problem is caused by me changing my
>> tree so that
>>
>> 1. qapi-gen.py fails (because I messed up), and
>>
>> 2. make re-runs configure.
>>
>> Perhaps the test for a working sphinx-build-3 could be made a bit more
>> robust.
>
> I'm not sure what could reasonably be done. The Sphinx test is just
> "try building a trivial document with our config (which is what
> enforces the version requirement)".

This question is almost certainly naive: why is it necessary for the
"trivial" document to include the truckload generated by qapi-gen.py

>                                     So yes, if you modify the QEMU sources
> in a way that breaks the config file or one of the Sphinx plugins then
> it'll trip the configure check. If you give the configure-check run
> its own config file, then you end up with the version checks in two places
> and they could get out of sync. One could try to have the conf.py have a
> lot of conditionals to cut out things that the test-document doesn't use,
> but then you run the risk that we no longer catch something for end-users
> that we didn't anticipate that means we can't build the docs.
>
> It seems more reasonable to me to assume that developers who are
> actively modifying the QEMU code which is used in docs building
> are able to read the log file that the error message points them
> at, and can figure out what really happened from the log.


