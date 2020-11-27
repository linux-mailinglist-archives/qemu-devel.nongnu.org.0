Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A212C60FF
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 09:39:19 +0100 (CET)
Received: from localhost ([::1]:55478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiZHh-0008MT-Ui
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 03:39:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kiZGf-0007tv-TJ
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 03:38:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kiZGc-0003vi-MX
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 03:38:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606466288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1smsFNTpfUpQSODMZC9wCPdfD9Rpg3JPILNGXI1Er8s=;
 b=cTeUwHgzAxdDpRTtbfzEuOA1XFZe9TbV3fOQyM6ePtAXxlj/gqj2KsaG+DzZAbMTMQ1PTZ
 RjXPTlh80Gpvo1zxYo9tr/lYPYtn0sHT2IUu8XjUX2+aKAl8ZiVz8M/m7ddQYFLfxq+IQE
 28q3QvgBmo3UtonuysKcYqCZZuQjpuI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-So4a4p39PTeloXx97VCyNw-1; Fri, 27 Nov 2020 03:38:06 -0500
X-MC-Unique: So4a4p39PTeloXx97VCyNw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC666185E49E
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 08:38:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 99F5D63BA7;
 Fri, 27 Nov 2020 08:38:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1B952113864E; Fri, 27 Nov 2020 09:38:04 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/2] keyval: accept escaped commas in implied option
References: <20201111104521.1179396-1-pbonzini@redhat.com>
 <20201111104521.1179396-2-pbonzini@redhat.com>
Date: Fri, 27 Nov 2020 09:38:04 +0100
In-Reply-To: <20201111104521.1179396-2-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Wed, 11 Nov 2020 05:45:20 -0500")
Message-ID: <87h7pburdf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> This is used with the weirdly-named device "SUNFD,two", so accepting it

"SUNW,fdtwo"

> is also a preparatory step towards keyval-ifying -device and the
> device_add monitor command.

Not quite.  Device "SUNW,fdtwo" has user_creatable = false (it's a
sysbus device), and therefore isn't available with -device or
device_add.

There are more device names containing comma, but only one is available
with -device or device_add: xlnx,zynqmp-pmu-soc.  I doubt it makes sense
there.

Parameter values with comma need special treatment before and after the
patch.  Before the patch, you have to use the unsugared form and double
the commas.  After the patch, that still works, but you can now *also*
use the sugared form and double the commas.  Not much of an improvement,
I'm afraid.

Of course, we aren't really after improvement, we're after switching to
keyval_parse() with fewer compatiblity issues.  But this issue only
exists where values with comma are valid.

None of the QemuOpts I looked at take such values, except for -device
xlnx,zynqmp-pmu-soc, which I believe to be useless.  If an actual use
exists, I missed it.

Permit me to digress: we should kill the anti-social device names
regardless of this patch.

I want device names to conform to QAPI naming rules for enum values.  If
we ever do QAPI-schema-based device configuration, "driver" changes from
str to enum.  Even if we're ready to reject QAPI-schema-based device
configuration as impractical forever, there's still a consistency
argument: names of things should conform to a common set of rules.

This applies to all implied parameters with an emumeration-like value.
I'm not aware of other offenders, though.

>                              But in general it is an unexpected wart
> of the keyval syntax and leads to suboptimal errors compared to QemuOpts:
>
>   $ ./qemu-system-x86_64 -object foo,,bar,id=obj
>   qemu-system-x86_64: -object foo,,bar,id=obj: invalid object type: foo,bar
>   $ storage-daemon/qemu-storage-daemon --object foo,,bar,id=obj
>   qemu-storage-daemon: Invalid parameter ''

The suboptimal error message is due to the way I coded the parser, not
due to the grammar.

> To implement this, the flow of the parser is changed to first unescape
> everything up to the next comma or equal sign.  This is done in a
> new function keyval_fetch_string for both the key and value part.
> Keys therefore are now parsed in unescaped form, but this makes no
> difference in practice because a comma is an invalid character for a
> QAPI name.  Thus keys with a comma in them are rejected anyway, as
> demonstrated by the new testcase.
>
> As a side effect of the new code, parse errors are slightly improved as
> well: "Invalid parameter ''" becomes "Expected parameter before '='"
> when keyval is fed a string starting with an equal sign.

Yes, my parse errors are less than friendly.  Let's review some of them.
I'm testing with

    $ qemu-storage-daemon --nbd $ARG

because that one doesn't have an implied key, which permits slightly
simpler $ARG.

* Empty key

  --nbd ,

    master:       Invalid parameter ''
    your patch:   Expected parameter before ','

    Improvement.

  --nbd key=val,=,fob=

    master:       Invalid parameter ''
    your patch:   Expected parameter before '='

    Improvement, but which '='?  Possibly better:

                  Expected parameter before '=,fob='

* Empty key fragment

  --nbd key..=

    master:       Invalid parameter 'key..'
    your patch:   same

    Slightly better, I think:

                  Name or number expected after 'key.'

  --nbd .key=

    master:       Invalid parameter '..key'
    your patch:   same

    Better, I think:

                  Name expected before '..key'

  Odd: if I omit the '=', your patch's message often changes to

                  Expected '=' after parameter ...

  This means the parser reports a non-first syntax error.  Parsing
  smell, I'm afraid :)

* Invalid key fragment

  --nbd _=

    master:       Invalid parameter '_'
    your patch:   same

  --nbd key.1a.b=

    master:       Invalid parameter 'key.1a.b'
    your patch:   same

    Slightly better, I think:

                  'key.1a' is not a valid parameter name

  --ndb anti,,social,,key=

    master:       Expected '=' after parameter 'anti'
    your patch:   Invalid parameter 'anti,social,key'

    The new error message shows the *unescaped* string.  Okay.

> The slightly baroque interface of keyval_fetch_string lets me keep the
> key parsing loop mostly untouched.  It is simplified in the next patch,
> however.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

I believe there are two, maybe three reasons for this series:

1. Support ',' in values with an implicit keys.

2. Improve error reporting.

3. Maybe nicer code.

1. is a feature without a known use.  2. can be had with much less churn
(I'm ready to back that up with a patch).  Since I haven't looked at
PATCH 2, I'm reserving judgement on 3.


