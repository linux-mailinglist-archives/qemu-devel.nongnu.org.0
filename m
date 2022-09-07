Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 734F55B0382
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 13:57:57 +0200 (CEST)
Received: from localhost ([::1]:56724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVtgl-0002hS-5m
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 07:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oVtdH-00018n-H0
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 07:54:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oVtdE-0004YW-E0
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 07:54:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662551651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d3bTlgYtZo9j5g/i5LOPAzj9DbvJOx448YNS31bXn0A=;
 b=F6Q/OgsksHZMumB45k7V1j3+k8NEXVw3TpcSRoJk08BjqmPxXf0ZrUrDieqFC1RNlyMBQG
 Js9VzQoRLiF4ywAk7pcOvdaAeiE3u6DeLr5AUYKGzUSYXF94q4PKucev90dVBwk6zA2nQU
 5Vg/kJ7keIB50Qrri3ZC+duUGsG7HlA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-qcH-d44uOruhzCOAV2drHg-1; Wed, 07 Sep 2022 07:54:07 -0400
X-MC-Unique: qcH-d44uOruhzCOAV2drHg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FD1C80418F;
 Wed,  7 Sep 2022 11:54:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61ADC90A04;
 Wed,  7 Sep 2022 11:54:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DCCDF21E6900; Wed,  7 Sep 2022 13:54:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: Eric Blake <eblake@redhat.com>,  qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: Maximum QMP reply size
References: <CAFn=p-ZkKLQtYAwzkQb7srFf_fF8ij+g5wkZiRofx4U+kSZ7Rw@mail.gmail.com>
Date: Wed, 07 Sep 2022 13:54:05 +0200
In-Reply-To: <CAFn=p-ZkKLQtYAwzkQb7srFf_fF8ij+g5wkZiRofx4U+kSZ7Rw@mail.gmail.com>
 (John Snow's message of "Tue, 6 Sep 2022 15:38:54 -0400")
Message-ID: <87v8pzwgbm.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Hi, I suspect I have asked this before, but I didn't write it down in
> a comment, so I forget my justification...
>
> In the QMP lib, we need to set a buffering limit for how big a QMP
> message can be -- In practice, I found that the largest possible
> response was the QAPI schema reply, and I set the code to this:
>
>     # Maximum allowable size of read buffer
>     _limit = (64 * 1024)
>
> However, I didn't document if this was a reasonable limit or just a
> "worksforme" one. I assume that there's no hard limit for the protocol
> or the implementation thereof in QEMU. Is there any kind of value here
> that would be more sensible than another?
>
> I'm worried that if replies get bigger in the future (possibly in some
> degenerate case I am presently unaware of) that the library default
> will become nonsensical.
>
> Any pointers/tips?

Peter and Daniel already provided some.  I can add a bit of insight into
how QMP output works in QEMU, which may or may not help you.

QEMU executes one command after the other.  A command's response
(success or failure) is a QDict.  Which is then formatted as JSON and
appended to the monitor's output buffer.

Events work similarly.

The conversion to JSON does not limit the resulting string's size.  If
it runs out of memory, QEMU dies.

The output buffer is also unbounded.  It drains into the monitor's
character device.

If the QMP client sends enough commands without reading their responses,
QEMU can run out of memory and die.

Now I'm ready to go back to your question, which is about a *single*
message (QMP command response or event): nothing in QEMU limits the size
of the QMP output message text.

Weak consolation: I guess QEMU is somewhat likely to run out of memory
and die before your client software does.  That's because QDict is a
pig: an empty one eats 4120 Bytes on my system.  Compares unfavourable
to its text representation "{}".


