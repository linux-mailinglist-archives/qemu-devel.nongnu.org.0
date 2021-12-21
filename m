Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E10547C339
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 16:43:25 +0100 (CET)
Received: from localhost ([::1]:42552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzhIR-00068j-VS
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 10:43:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mzhFm-0004AM-64
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 10:40:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mzhFj-00060w-DY
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 10:40:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640101233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oyS4TFueLEAUnFjT1iR8ltaWnhccVxNDc4Ov39Js4yM=;
 b=UwDAj+yyeX1pQpx1mOAEXNYPjR7qiQWRH8M34+MIEIS+1PQrAsPnTxFS2+MgTQfG83Zg27
 7E0LNNHjvOYi6jxKe8gNLxQy3fxbknsNyJ3Hurt5Jp5dp0LKJVC2k0GmW8NRWyixSvTi3G
 58be9X84Rkv4BfbgYZIRWHOoFMjzhCc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-h9qJJLz6OxWvL0ux8nEzww-1; Tue, 21 Dec 2021 10:40:30 -0500
X-MC-Unique: h9qJJLz6OxWvL0ux8nEzww-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9BF293922;
 Tue, 21 Dec 2021 15:40:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-2.ams2.redhat.com [10.36.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A224B4BC4C;
 Tue, 21 Dec 2021 15:40:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 25452113865F; Tue, 21 Dec 2021 16:40:28 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] vl: Add -set options to device opts dict when using
 JSON syntax for -device
References: <20211221071818.34731-1-mkfssion@mkfssion.com>
 <877dbyjj0t.fsf@dusky.pond.sub.org>
 <87h7b2i07h.fsf@dusky.pond.sub.org>
 <1b8249e6-ffe1-86e4-a2e8-c85c794438e0@redhat.com>
Date: Tue, 21 Dec 2021 16:40:28 +0100
In-Reply-To: <1b8249e6-ffe1-86e4-a2e8-c85c794438e0@redhat.com> (Paolo
 Bonzini's message of "Tue, 21 Dec 2021 15:47:41 +0100")
Message-ID: <871r26ge4z.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, MkfsSion <mkfssion@mkfssion.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 12/21/21 13:58, Markus Armbruster wrote:
>>> Is this a regression?  I suspect commit 5dacda5167 "vl: Enable JSON
>>> syntax for -device" (v6.2.0).
>> 
>> Obviously not a regression: everything that used to work still works.
>
> FWIW I think -set should be deprecated.  I'm not aware of any
> particularly useful use of it.  There are a couple in the QEMU tests
> (in vhost-user-test and in qemu-iotests 068), but in both cases the
> code would be easier to follow without; patches can be dusted off if
> desired.

-set has its uses, but they're kind of obscure.  When you want to use
some canned configuration with slight modifications, then -readconfig
canned.cfg -set ... is nicer than editing a copy of canned.cfg.  For
what it's worth, we have a few cans in docs/config/, and we refer to at
least one of them in the manual (in docs/system/devices/usb.rst).

There are a few really good ideas in QemuOpts.  I count -readconfig,
-writeconfig and -set among them.  Unfortunately, they have been marred
by us not converting the whole CLI to QemuOpts as envisaged.  And now we
never will, because our needs have long outgrown what QemuOpts can
provide.

I'd love to have unmarred, QAPI-based replacements.  However, I doubt
maintaining backwards compatibility will be practical and worthwhile.

Declare these options unstable?


