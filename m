Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA97A388F70
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:46:16 +0200 (CEST)
Received: from localhost ([::1]:39736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljMWd-0006Bu-M0
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:46:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljM3K-0006jv-49
 for qemu-devel@nongnu.org; Wed, 19 May 2021 09:15:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljM3G-00066K-4B
 for qemu-devel@nongnu.org; Wed, 19 May 2021 09:15:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621430152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yVTDva9+6M2BjP6SYdfmn5x0oF3SC97Zbfn4ueP2do8=;
 b=iOwA1bn/4rmQ/5RICXMCmPrfPobjal+5W8xCXibR94z4fGyKSIrHSWVZT/D6nYHNtSe1t2
 xFPgPBQpTLLWS4qg+9iT44UFRbI5H+rhubl3a44l6+/46IC3ExkOYfdWJVM9CM6P9a0uaX
 t57oebX3bEuTa2iFU2oi4sgqTMCOKHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-qdYlAMwlOW--Bzj_1nbbjA-1; Wed, 19 May 2021 09:15:48 -0400
X-MC-Unique: qdYlAMwlOW--Bzj_1nbbjA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A227F8064DE
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 13:15:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 934AA5D6AC;
 Wed, 19 May 2021 13:14:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1F3FB113861E; Wed, 19 May 2021 15:14:54 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Automatic module loading (was: [PATCH] qemu-config: load modules
 when instantiating option groups)
References: <20210518131542.2941207-1-pbonzini@redhat.com>
Date: Wed, 19 May 2021 15:14:54 +0200
In-Reply-To: <20210518131542.2941207-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Tue, 18 May 2021 09:15:42 -0400")
Message-ID: <87h7iyoofl.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> Right now the SPICE module is special cased to be loaded when processing
> of the -spice command line option.  However, the spice option group
> can also be brought in via -readconfig, in which case the module is
> not loaded.
>
> Add a generic hook to load modules that provide a QemuOpts group,
> and use it for the "spice" and "iscsi" groups.
>
> Fixes: #194
> Fixes: https://bugs.launchpad.net/qemu/+bug/1910696
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

What follows is not an objection to this patch.

I think we have this kind of bugs because we're kind of wobbly on when
to load modules.

On the one hand, we're trying to load modules only when needed.  This is
obviously useful to conserve resources, and to keep the attack surface
small.  Some background in

    Message-ID: <20210409064642.ah2tz5vjz2ngfiyo@sirius.home.kraxel.org>
    https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg01393.html

On the other hand, we're trying to make modules transparent to
management applications, i.e. QEMU looks the same whether something was
compiled as a loadable module or linked into QEMU itself.  See

    Message-ID: <YHAhQWdX15V54U8G@redhat.com>
    https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg01450.html

I'm afraid we sort of fail at both.

Transparency to management applications requires us to load modules on
QOM introspection already.

Example: to answer "show me all QOM types", we need to load all modules
that could possibly register QOM types.  As long as module code can do
whatever it wants, that means loading all of them.

Example: to answer "show me QOM type FOO", where FOO is currently
unknown, we need to load all modules that could possible register QOM
type FOO.  Again, that means loading all of them.

We don't actually do this.  Instead, we hardcode a map from type name to
module name[*], so we don't have to load them all, and we actually load
the module specified by this map only sometimes, namely when we call
module_object_class_by_name() instead of object_class_by_name().  I
can't discern rules when to call which one.  Wobbly.

Things other than QOM might be affected, too.

QAPI introspection is not: the value of query-qmp-schema is fixed at
compile-time, and *how* something is compiled (loadable module
vs. linked into QEMU itself) does not affect it.

I'd like us to develop a clearer understanding when exactly modules are
to be loaded.


[*] qom_modules[] in util/module.c.  This is a basically an (unchecked)
assertion that the (unrelated!) module code won't register anything
else.  Ugh!


