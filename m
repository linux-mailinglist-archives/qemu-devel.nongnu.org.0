Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8DD32F8BB
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 08:17:15 +0100 (CET)
Received: from localhost ([::1]:51990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIRBa-00060W-FP
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 02:17:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lIRAL-0005aS-3F
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 02:15:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lIRAI-0006qL-H8
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 02:15:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615014952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pCAiWVxJqSTVrNJI/2z/vw6UrirE3Jr2/+s/1SggDds=;
 b=h7RHTMfLj9jVcWf0XM0vCnKovctIIUE8K8V71Z2kk8NOJJRwXZia7TetXpAlPfw9R5J9Yl
 MHZCTmw0WsLU1+wszDgZHnrj4Zil04cKLGdynsnqLKklURugTmAs7ktxYeQGywJe5SQ+RT
 0Cd9OABUZ5IDVQWzAM3Br8XTEWn9L0Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-v-k80mDEN1agbDX9Oz16iQ-1; Sat, 06 Mar 2021 02:15:48 -0500
X-MC-Unique: v-k80mDEN1agbDX9Oz16iQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2C25800D53;
 Sat,  6 Mar 2021 07:15:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E9657092E;
 Sat,  6 Mar 2021 07:15:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D7E961132C12; Sat,  6 Mar 2021 08:15:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [Qemu-devel] [PATCH] monitor: increase amount of data for
 monitor to read
References: <20190610105906.28524-1-dplotnikov@virtuozzo.com>
 <87lfxfy67u.fsf@dusky.pond.sub.org> <20190710163610.GG2682@work-vm>
 <31dd78ba-bd64-2ed6-3c8f-eed4e904d14c@virtuozzo.com>
 <02668cd8-7c1c-6bae-edcb-1123ae026983@virtuozzo.com>
 <87ft19zo66.fsf@dusky.pond.sub.org>
 <405eb948-cab6-869a-80eb-cca4c99f110d@virtuozzo.com>
 <87im65vasl.fsf@dusky.pond.sub.org>
 <fce5bb3f-5d29-4a16-f572-4f9ca31e1e7c@virtuozzo.com>
Date: Sat, 06 Mar 2021 08:15:44 +0100
In-Reply-To: <fce5bb3f-5d29-4a16-f572-4f9ca31e1e7c@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 5 Mar 2021 19:20:36 +0300")
Message-ID: <87lfb0pxb3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: den@virtuozzo.com, Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> Hmm. An idea. What we want: read more than one character at a time, as
> it's inefficient. May be instead of modifying monitor_can_read() and
> therefore influence monitor behavior in unpredictable way, we'd better
> add a separate read-cache, and just read through this cache?

I think this idea is worth exploring.

With a classical parser structure, this would be trivial.  Classical
structure: application gets expression tree from parser, parser gets
tokens from lexer, lexer reads characters from the input.  Just use a
suitably buffered read.

We use a streaming structure, though: main loop reads and pushes
characters to lexer one by one, lexer pushes tokens to parser one by
one, parser pushes expression tree to the monitor application.  All via
callbacks.

Additional complication: flow control.  The monitor can tell the main
loop to stop / resume pushing.  This is monitor_suspend(),
monitor_resume().  It takes effect immediately.

We can make the read buffered, but we still have to ensure "stop
pushing" takes effect immediately.  Stupidest way that could possibly
work: keep pushing characters to the lexer one by one.

I think that's what you have in mind.  Would be great if you could give
it a try!


