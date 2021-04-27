Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA7636C12C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 10:45:28 +0200 (CEST)
Received: from localhost ([::1]:51404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbJLT-0006B9-R5
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 04:45:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbJK1-0005Ja-VN
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 04:43:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbJJu-0002Uh-MN
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 04:43:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619513024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yZLO0Wtr0PDuJBCDRkoSUCiFoeGoG7T+Dy1+JuGVUcU=;
 b=ciSRsgT/oom/6hiYR43akNobNNDG/H5oH3nlWRa171uDftuAZG4OxQoFRTLEvRo2CzO/cs
 782OY8kSlQn+RfbSUN2zr1CGry4lPTqIH58oulCxS/cUjoGIe4ELcRA6+DWr/ljm4hidTU
 Z8fVF8YoQE6V6Syj9snn+egGszjICNs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-X4i5GjZiOXOUyk7hZB_ylg-1; Tue, 27 Apr 2021 04:43:40 -0400
X-MC-Unique: X4i5GjZiOXOUyk7hZB_ylg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6DB7107ACCD;
 Tue, 27 Apr 2021 08:43:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7D416A035;
 Tue, 27 Apr 2021 08:43:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3A51F113525D; Tue, 27 Apr 2021 10:43:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 12/22] qapi/parser: add type hint annotations
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-13-jsnow@redhat.com>
 <87zgxm5yrp.fsf@dusky.pond.sub.org>
 <07ad14a5-a1bb-691f-cdc1-93ef82b28e77@redhat.com>
Date: Tue, 27 Apr 2021 10:43:38 +0200
In-Reply-To: <07ad14a5-a1bb-691f-cdc1-93ef82b28e77@redhat.com> (John Snow's
 message of "Mon, 26 Apr 2021 19:55:15 -0400")
Message-ID: <87tuns2k3p.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 4/25/21 8:34 AM, Markus Armbruster wrote:
>> value: object isn't wrong, but why not _ExprValue?
>> 
>
> Updated excuse:
>
> because all the way back outside in _parse, we know that:
>
> 1. expr is a dict (because of get_expr(False))
> 2. expr['pragma'] is also a dict, because we explicitly check it there.

Yes:

                pragma = expr['pragma']
-->             if not isinstance(pragma, dict):
-->                 raise QAPISemError(
-->                     info, "value of 'pragma' must be an object")
                for name, value in pragma.items():
                    self._pragma(name, value, info)

> 3. We iterate over the keys; all we know so far is that the values are
> ... something.

Actually, *we* know more about the values.  get_expr() returns a tree
whose inner nodes are dict or list, and whose leaves are str or bool.
Therefore, the values are dict, list, str, or bool.

It's *mypy* that doesn't know, because it lacks recursive types.

I know that you're prbably using "we" in the sense of "the toolchain".
I'm annoying you with the difference between "the toolchain" and "we
(you, me, and other humans) because I'm concerned about us humans
dumbing ourselves down to mypy's level of understanding.

To be honest, I'm less and less sure typing these trees without the
necessary typing tools is worth the bother.  The notational overhead it
more oppressive than elsewhere, and yet the typing remains weak.  The
result fails to satisfy, and that's a constant source of discussions
(between us as well as just in my head) on how to best mitigate.

> 4. _pragma()'s job is to validate the type(s) anyway.

_pragma() can safely assume @value is dict, list, str, or bool.  It just
happens not to rely on this assumption.

> More or less, the _ExprValue type union isn't remembered here -- even
> though it was once upon a time something returned by get_expr, it 
> happened in a nested call that is now opaque to mypy in this context.

Understand.

> So, it's some combination of "That's all we know about it" and "It
> happens to be exactly sufficient for this function to operate."

I can accept "it's all mypy can figure out by itself, and it's good
enough to get the static checking we want".


