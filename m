Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 332922FFE5F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 09:41:35 +0100 (CET)
Received: from localhost ([::1]:45086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2s0a-0006ln-TU
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 03:41:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2rz5-00060y-9b
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 03:39:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2rz2-0007dE-Rz
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 03:39:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611304795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L+z3EozE5lUXEeZ/eYMWr47vF/I3R6pqsSTGhTTG9vc=;
 b=YGkE9/HFXsb1qVWJUxbFi4LlJtqVmN11+bs2rORyn++Sj3mQydyqMq8+KSqzpahHgCXyuz
 fkG4uJGohVhcrHo1wJwWI3zUO4M05QVitWzclwocW7fp15mq/vCho8X8Kg2HDm4NVRC/ub
 qxTeqB2rGoQFiTBW3YNJfRTgfZb8qD4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-seqCs_ZzOBmKTbBP4juk1Q-1; Fri, 22 Jan 2021 03:39:53 -0500
X-MC-Unique: seqCs_ZzOBmKTbBP4juk1Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3AC410054FF
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 08:39:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C0248E2DB;
 Fri, 22 Jan 2021 08:39:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3C933113865F; Fri, 22 Jan 2021 09:39:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 04/25] keyval: accept escaped commas in implied option
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-5-pbonzini@redhat.com>
Date: Fri, 22 Jan 2021 09:39:51 +0100
In-Reply-To: <20210118163113.780171-5-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 18 Jan 2021 11:30:52 -0500")
Message-ID: <87mtx1cqlk.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

[...]
> diff --git a/util/keyval.c b/util/keyval.c
> index be34928813..eb9b9c55ec 100644
> --- a/util/keyval.c
> +++ b/util/keyval.c
> @@ -16,8 +16,8 @@
>   *   key-vals     = [ key-val { ',' key-val } [ ',' ] ]
>   *   key-val      = key '=' val | help
>   *   key          = key-fragment { '.' key-fragment }
> - *   key-fragment = / [^=,.]+ /
> - *   val          = { / [^,]+ / | ',,' }
> + *   key-fragment = { / [^=,.] / | ',,' }
> + *   val          = { / [^,] / | ',,' }
>   *   help         = 'help' | '?'
>   *
>   * Semantics defined by reduction to JSON:
> @@ -78,13 +78,13 @@
>   * Alternative syntax for use with an implied key:
>   *
>   *   key-vals     = [ key-val-1st { ',' key-val } [ ',' ] ]
> - *   key-val-1st  = val-no-key | key-val
> - *   val-no-key   = / [^=,]+ / - help
> + *   key-val-1st  = (val-no-key - help) | key-val
> + *   val-no-key   = { / [^=,] / | ',,' }

I finally remembered why I made val-no-key non-empty: to avoid amiguity.

Before the patch, "" can only be parsed as empty key-vals.  Results in
an empty QDict.

Afterwards, the grammar is ambiguous: "" can also be parsed as empty
val-no-key, reduced via key-val-1st to non-empty key-vals.  Results in a
QDict with one entry mapping the implied key to "".

I'm a bit concerned I similarly forgot something that made me avoid ',,'
escapes in val-no-key.

Even if we brushed off the ambiguous grammar issue (and we should not!),
desugaring "" into "implied=" feels unwise, and ",k=v" into
"implied=,k=v" only slightly less so.

Let's keep val-no-key non-empty.

Ripple effect...  I made val-no-key match key (almost):

    val-no-key   = / [^=,]+ /

    key          = key-fragment { '.' key-fragment }
    key-fragment = / [^=,.]+ /

The only difference is val-no-key accepts consecutive '.'.

Commit 8bf12c4f75 "keyval: Parse help options" muddied the waters a bit
by adding '- help' to val-no-key.

Your commit moves it to key-val-1st (good).  It also permits empty
key-fragment, and thus consecutive '.' (good because it makes val-no-key
match key exactly, but also possibly confusing because key-fragment
can't actually be empty due to the "Key-fragments must be valid QAPI
names or consist only of decimal digits" condition).  Okay.

It also changed both val-no-key and key to accept empty.  We need to
keep *both* non-empty.

Your change to val is not wrong, but I prefer the old version, because
it's closer to how the code works.

>   *
>   * where val-no-key is syntactic sugar for implied-key=val-no-key.
>   *
> - * Note that you can't use the sugared form when the value contains
> - * '=' or ','.
> + * Note that you can't use the sugared form when the value is empty

You can with your grammar change, unless the code doesn't match the
grammar.  Which would be a bug.

> + * or contains '='.
>   */
[...]

I apologize for sitting on this patch for so long.  Something felt
wrong, but I couldn't put a finger on it.  Now I can at least for the
empty val-no-key part.


