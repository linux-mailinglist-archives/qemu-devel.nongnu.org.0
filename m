Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6403A4046DF
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 10:16:44 +0200 (CEST)
Received: from localhost ([::1]:49070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOFEj-0003Qd-5f
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 04:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mOFBk-0001Fg-Md
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 04:13:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mOFBh-0000sl-Pr
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 04:13:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631175216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jYXDQR+pORKNgcMJKDuBa2NvBT5zDkMlQWRe8f24o3E=;
 b=i24zXr3UhepzSxOb9yx6keSAhDAmhSxUlNANZ22qZhMWZKpkrn/2KgvuRtJwV8RYmePK1A
 YEfSZKDI3heEUYqMF8UOKQoOyRUwesuVJuH1hcWry0AvdBrJH7AXGwUP1+JRrSefgXPMW8
 Dl1+hmVpGTjdUgRSUKst5tjOfWxsNJ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-BfRTgLTJOE6_Knw27Ov6ig-1; Thu, 09 Sep 2021 04:13:34 -0400
X-MC-Unique: BfRTgLTJOE6_Knw27Ov6ig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEC76362F8;
 Thu,  9 Sep 2021 08:13:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80DA46A904;
 Thu,  9 Sep 2021 08:13:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3B6121138606; Thu,  9 Sep 2021 10:13:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 0/5] Stop adding HMP-only commands, allow QMP for all
References: <20210908103711.683940-1-berrange@redhat.com>
 <875yvbrtnq.fsf@dusky.pond.sub.org> <YTjVuEg+wlKPHkAi@redhat.com>
 <87lf46pd62.fsf@dusky.pond.sub.org>
Date: Thu, 09 Sep 2021 10:13:32 +0200
In-Reply-To: <87lf46pd62.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Thu, 09 Sep 2021 06:48:21 +0200")
Message-ID: <878s06p3o3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

[...]

> Limitations:
>
> 1. If we convert a long-running HMP command to this technique, we print
>    its output only after it completed its work.  We also end up with a
>    long-running QMP command, which is bad, because it stops the main
>    loop and makes the QMP monitor unresponsive (except for OOB commands,
>    if the client is careful).  The former can be mitigated with
>    'coroutine': true.  The latter can't.
>
> 2. We can't prompt for input.
>
>    The only current use I can see is HMP "change vnc passwd" prompting
>    for a password.  Except you currently have to say "change vnc passwd
>    wtf" to get it to prompt (suspect logic error in commit cfb5387a1de).

Subject: [PATCH 1/2] hmp: Unbreak "change vnc"
Message-Id: <20210909081219.308065-2-armbru@redhat.com>

>
>
> [...]


