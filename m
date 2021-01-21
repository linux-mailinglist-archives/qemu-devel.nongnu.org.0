Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3B52FEAF2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 14:00:53 +0100 (CET)
Received: from localhost ([::1]:36724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Za0-0007Eu-IW
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 08:00:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2ZYM-0006O0-5C
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:59:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2ZYH-00075o-Pv
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:59:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611233945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RE0wHG5suEZtZzx73Nx34/o6MSZU4feeH/B/ikC3kdk=;
 b=UeCCid6hbpE5u32yMRqTpH5qnoC1fMVixqSIuj93hfLGYRVEY8X5MSB5cBjZ+caWTiXoRk
 1XdGoVO+Cza3G35Mh1LVax8cTtdNB42ClijI8iHJllbE3Sp8pmpBX3MJMlDanaW3fnJhGC
 0Q59beiFFM8QvFD3OE0VpsT5/SkGORE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-YWFOaEKpP0uogmVliIdxUA-1; Thu, 21 Jan 2021 07:59:02 -0500
X-MC-Unique: YWFOaEKpP0uogmVliIdxUA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCEEB64155
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 12:58:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 018FB77CB7;
 Thu, 21 Jan 2021 12:58:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 81493113865F; Thu, 21 Jan 2021 13:58:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 04/25] keyval: accept escaped commas in implied option
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-5-pbonzini@redhat.com>
Date: Thu, 21 Jan 2021 13:58:38 +0100
In-Reply-To: <20210118163113.780171-5-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 18 Jan 2021 11:30:52 -0500")
Message-ID: <87turah2f5.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> This is used with the weirdly-named device "SUNFD,fdtwo":

"SUNW,fdtwo"

Suggest "with weirdly-named devices such as "SUNW,fdtwo:", because we've
got more weirdos.

>   $ qemu-system-sparc -device SUNW,,fdtwo,help
>   SUNW,fdtwo options:
>     drive=<str>            - Node name or ID of a block device to use as a backend
>     fallback=<FdcDriveType> - FDC drive type, 144/288/120/none/auto (default: "144")
>     ...
>
> Therefore, accepting it is a preparatory step towards keyval-ifying
> -device and the device_add monitor command.

It's a preparatory step, but is it a necessary one?  More on that below.

>                                              In general, however, this
> unexpected wart of the keyval syntax leads to suboptimal errors compared
> to QemuOpts:
>
>   $ ./qemu-system-x86_64 -object foo,,bar,id=obj
>   qemu-system-x86_64: -object foo,,bar,id=obj: invalid object type: foo,bar
>   $ storage-daemon/qemu-storage-daemon --object foo,,bar,id=obj
>   qemu-storage-daemon: Invalid parameter ''

This is a second, independent argument supporting your patch.

As I remarked in reply to a prior post as "[PATCH 1/2] keyval: accept
escaped commas in implied option", the suboptimal errors could be
improved in a less invasive way.  Your way has a distinct advantage,
though: a working patch.

A third argument you've put forward elsewhere, but modestly left out
here: nicer code.  I'll get back to it after looking at the followup
cleanup in the next patch.

Either one argument could justify the patch, I think.

I'm this explicit to avoid the impression that the critique of the first
argument that comes next is me trying to find a reason to shoot down
your patch.

I don't think -device *needs* to accept anti-social device names.

We have a few devices with anti-social names, but none of them works
with -device, except in a help request.

We don't have to keep requests for human-readable help backwards
compible.

Anti-social device names are a usability issue with or without this
patch, with or without keyvalified -device.  The patch ensures the
sugared form of the help request continues to work after keyvalification
(the unsugared from is unaffected).  You could argue that loss of the
sugared form is a usability regression.  Maybe.  But usability is *poor*
in any case.  If we really cared for it, we'd get rid of the anti-social
names.

My point is: we're sitting in a hole, and the commit message starts with
"we need to dig a bit deeper to keep us comfortable".

My first preference: get rid of the anti-social names, drop the first
argument from the commit message, and let the patch rest on the other
two.

Second preference: rephrase the commit message along the lines of "This
is a step towards keyval-ifying -device without fixing the anti-social
device names first, and without breaking backward compatibility for help
requests".

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
>
> The slightly baroque interface of keyval_fetch_string lets me keep the
> key parsing loop mostly untouched.  It is simplified in the next patch,
> however.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

I'll now look at the next patch, then get back to this one.


