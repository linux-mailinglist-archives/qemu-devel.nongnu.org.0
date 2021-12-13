Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D530A4730E1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 16:48:49 +0100 (CET)
Received: from localhost ([::1]:42680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwnZI-0004HK-Mb
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 10:48:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mwnXw-0002TD-9b
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:47:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mwnXt-000331-Sw
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:47:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639410440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D75PDYSycn/CxcKMsZ6GXg8a1Y5XuKvx9ddQo6oYekE=;
 b=Jk3TWUPfIvFr9uKtUbbkphG2sXX5uCEjYyf0i4ewuwB6OX467rcvOZPFXS5qnWVyv1yNMB
 wl0By3hgbo2VfFd/7+UT0HqP95Iyf1pMNqhKFlC7IuhEk0GOQt8WZMXi5PAqsFnYSujyG+
 pDlxmwQHdj5Ww7N3rnnrlLUdJlCAwaw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-St7A8-qaOyuQutR2iOjKow-1; Mon, 13 Dec 2021 10:47:17 -0500
X-MC-Unique: St7A8-qaOyuQutR2iOjKow-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FEDD10144E2;
 Mon, 13 Dec 2021 15:47:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-2.ams2.redhat.com [10.36.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0D871001F4D;
 Mon, 13 Dec 2021 15:47:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 546C7113865F; Mon, 13 Dec 2021 16:47:01 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: Redesign of QEMU startup & initial configuration
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <87mtl88t0j.fsf@dusky.pond.sub.org>
 <7fece46b-c578-8303-2dec-cf851ff5b61b@greensocs.com>
Date: Mon, 13 Dec 2021 16:47:01 +0100
In-Reply-To: <7fece46b-c578-8303-2dec-cf851ff5b61b@greensocs.com> (Damien
 Hedde's message of "Mon, 13 Dec 2021 11:51:40 +0100")
Message-ID: <8735mwzeve.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-devel@nongnu.org,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Damien Hedde <damien.hedde@greensocs.com> writes:


[...]

>> Painted with a big brush, there are two kinds of code in hw/: actual
>> device emulation, and "wiring".  Both in C, and sometimes in the same .c
>> file.
>> 
>> Doing the "wiring" in configuration instead is less powerful (no longer
>> Turing complete[2]), but easier to reason about, maintain and change.
>> Change is possible even in the field.  The obvious separation between
>> emulation and wiring is a nice bonus.
>> 
>> The wiring C code supports something not unlike templating: we have a
>> number of configuration knobs that deposit something for the wiring C
>> code to pick up.
>> 
>> It's rather limited, though: the "variables" are fixed at compile time.
>> 
>> Aside: the handling of variables that doesn't get substituted is wildly
>> inconsistent.
>> 
>> Perhaps doing wiring in configuration reduces the maintenance burden to
>> a degree where we can mitigate the "defaults gone bad, but no want
>> change" issue by offering additional, better things instead of changing
>> existing, bad things.  I don't know.
>
> We should be careful with config files, because the configuration
> parser can become a real mess.

Oh yes.

>                                There are 2 kinds of config files:
>
> 1. Imperative: an equivalent of QAPI/QMP command script. (eg like CLI
> config files Markus proposed). These are easy to handle because they 
> follow the QMP flow. We do one command after the other, the ordering
> of tasks is clear.
>
> 2. Descriptive: A description of the configuration where we describe
> the components and the wiring. This can be really complicated because
> we easily end up with ordering/determinism issues when instantiating
> them afterwards. For example the  configuration parser may have to
> solve : Which device do I create first ? I don't think a configuration
> parser should have to solve such issues, but I'm not sure if we can
> avoid it.

Actual instantiation necessarily happens in some order[*].

An imperative configuration dictates the order.

A descriptive configuration leaves it to some planner software.

Any descriptive configuration can therefore be transformed into an
imperative one.  *Unless* the planner *also* breaks up components into
smaller ones that aren't accessible in the imperative configuration.

Example: say the configuration specifies a device and its connections as
a unit.  Say we have two devices A and B, where A has a connection A->B,
and B a connection B->A.  A sufficiently smart planner can then create
A, B, A->B, B->A.  You can't express this imperatively unless connection
B->A can be specified separately from device A.

I propose to start stupid, i.e. with an imperative, low-level
configuration.  Then add smarts as we need them.


[*] Even if you instantiate stuff concurrently for some reason, there
should be at least some conceptual order.


