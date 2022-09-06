Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FCC5AE270
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 10:26:54 +0200 (CEST)
Received: from localhost ([::1]:50144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVTv2-0003Ze-R0
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 04:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oVTm7-0007Wz-Fo
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:17:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oVTm0-0002AG-IY
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:17:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662452252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oqLHtBKy/V3giRuWxnYHs821O4uHxlNtGLZqUN1lQhg=;
 b=b6yFSeV0s/y90Ofc01yqJHQ/bIrHbutFuYBNHz6vAwSO/Dy8JO2UBWR57l1rsL6M6iANks
 PSu8Kjy2WeuugxyGz1XR5VV71B8w9trFs42J7ZMCXDeQ3rC5gJ3PtOC7HMEwSnr0pX8Fwn
 TO9nGmkvJjsgqcVJo0qBQWLSkJGj2tg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-esxTGp38M-qu7YO8PM0Ujw-1; Tue, 06 Sep 2022 04:17:28 -0400
X-MC-Unique: esxTGp38M-qu7YO8PM0Ujw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B9FA299E745;
 Tue,  6 Sep 2022 08:17:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5632C1121314;
 Tue,  6 Sep 2022 08:17:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1C54D21E6900; Tue,  6 Sep 2022 10:17:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Claudio Fontana <cfontana@suse.de>,  qemu-devel <qemu-devel@nongnu.org>
Subject: Re: sphinx-build is really slow, any way to improve that?
References: <53b94520-f02b-aef5-b372-0460531b566f@suse.de>
 <CAFEAcA_ed-ny6eodA=9fK6Y5WpUaRO0jPfbKHYCB6uLikiyiHQ@mail.gmail.com>
Date: Tue, 06 Sep 2022 10:17:27 +0200
In-Reply-To: <CAFEAcA_ed-ny6eodA=9fK6Y5WpUaRO0jPfbKHYCB6uLikiyiHQ@mail.gmail.com>
 (Peter Maydell's message of "Mon, 5 Sep 2022 22:21:55 +0100")
Message-ID: <87h71k533c.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 5 Sept 2022 at 20:51, Claudio Fontana <cfontana@suse.de> wrote:
>> when I build qemu, there is a lot of time spent at the end of the build where one cpu goes 100% on sphinx-build.
>>
>> Is there some way to parallelize that? It seems it is the current bottleneck for rebuilds for me..
>
> It's a big fat python program, so I suspect not, but
> maybe I'm wrong.
>
> You can always configure --disable-docs if you don't care
> about the docs and want to make builds faster.

I care about the docs, but the impact on turnaround time is so bad I
stopped building the docs in the build trees I use for development, and
instead keep a separate tree that has docs enabled.  Tends to delay
diagnosis of doc markup errors, but that's the lesser evil for me.

We used to have a similar problem with generated C: touch the QAPI
schema, rebuild everything and its dog.  That was because everything and
its dog depended on the generated QAPI header.  C projects 101: putting
everything in a single header slows down rebuilds.

We solved this by splitting up the generated header, and updating
generated headers only when they actually change.

I have no idea whether Sphinx could do a similarly incremental rebuild.


