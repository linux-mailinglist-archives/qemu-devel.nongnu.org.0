Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D04E82F4EF3
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 16:41:25 +0100 (CET)
Received: from localhost ([::1]:43746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kziGy-00046c-Tt
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 10:41:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kziF3-00031M-OO
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:39:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kziF2-0003BA-4z
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:39:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610552363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BhP6uBeIWxHYrJGeOJF8+njxxPyHvisi/r3JX1Q9/cM=;
 b=BipQECaNoQGfmPZHV2fkPOC+uHgtRPu6vegwj1yiaWx/RX2XuoS+zcif9t8+xiYB39EvRQ
 ViO6//rnCsgB0wNcrYJaZuJiwla6T9vLRUeXf0Ln86R8nBqOwqtv5zPY29XprEQqMctN88
 MXHG5neeKaBmWijDIM7RZalY7jvhYVo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-BdB5toYOO1uePrqYEevR6w-1; Wed, 13 Jan 2021 10:39:20 -0500
X-MC-Unique: BdB5toYOO1uePrqYEevR6w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7F351009609;
 Wed, 13 Jan 2021 15:39:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-172.ams2.redhat.com
 [10.36.112.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF4245C3E5;
 Wed, 13 Jan 2021 15:39:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3730211386A7; Wed, 13 Jan 2021 16:39:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 06/12] qapi/source: Add builtin null-object sentinel
References: <20201217015927.197287-1-jsnow@redhat.com>
 <20201217015927.197287-7-jsnow@redhat.com>
Date: Wed, 13 Jan 2021 16:39:15 +0100
In-Reply-To: <20201217015927.197287-7-jsnow@redhat.com> (John Snow's message
 of "Wed, 16 Dec 2020 20:59:21 -0500")
Message-ID: <878s8wyhgc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
 qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Spelling nitpick: s/builtin/built-in/ in the title.

John Snow <jsnow@redhat.com> writes:

> We use None to represent an object that has no source information
> because it's a builtin. This complicates interface typing, since many
> interfaces expect that there is an info object available to print errors
> with.
>
> Introduce a special QAPISourceInfo that represents these built-ins so
> that if an error should so happen to occur relating to one of these
> builtins that we will be able to print its information, and interface
> typing becomes simpler: you will always have a source info object.
>
> This object will evaluate as False, so "if info" remains a valid
> idiomatic construct.
>
> NB: It was intentional to not allow empty constructors or similar to
> create "empty" source info objects; callers must explicitly invoke
> 'builtin()' to pro-actively opt into using the sentinel. This should
> prevent use-by-accident.
>
> Signed-off-by: John Snow <jsnow@redhat.com>

As I pointed out in review of v1, this patch has two aspects mixed up:

1. Represent "no source info" as special QAPISourceInfo instead of
   None

2. On error with "no source info", don't crash.

The first one is what de-complicates interface typing.  It's clearly
serving this patch series' stated purpose: "static typing conversion".

The second one is not.  It sidetracks us into a design discussion that
isn't related to static typing.  Maybe it's something we should discuss.
Maybe the discussion will make us conclude we want to do this.  But
letting the static typing work get delayed by that discussion would be
stupid, and I'll do what I can to prevent that.

The stupidest possible solution that preserves the crash is adding an
assertion right where it crashes before this patch: in
QAPISourceInfo.__str__().  Yes, crashing in a __str__() method is not
nice, but it's no worse than before.  Making it better than before is a
good idea, and you're quite welcome to try, but please not in this
series.  Add a TODO comment asking for "make it better", then sit on
your hands.

The pipeline must move.


