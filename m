Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BB325C258
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 16:18:24 +0200 (CEST)
Received: from localhost ([::1]:58932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDq4E-0000vC-Tj
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 10:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kDq3K-0000PH-0Q
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 10:17:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39423
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kDq3I-0006HI-HH
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 10:17:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599142643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xvxnSNwDzlIVEHlpefacFgjhFvhV9xGgPVfJJ4oJVN4=;
 b=HwR4AubcFcNTMqgZTkeVMBqXL3QK5xOWzGZNhZPg7PRGuGndwluGqSSespuhWob0uHBNV2
 0/g3qsUSQdoaCak/Y1Jnt2FyHjMTtlMDhb1BVM4si/P/ANdJRlAKbBZven+H6ybT2mOo0I
 YBjD/cAgsLwaGEQHeoRKrLX3M5TYTVo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-ptfvPL4tOo2dDvbLrFs-8g-1; Thu, 03 Sep 2020 10:17:19 -0400
X-MC-Unique: ptfvPL4tOo2dDvbLrFs-8g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60CC210082EB;
 Thu,  3 Sep 2020 14:17:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-68.ams2.redhat.com
 [10.36.113.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AC8E5D9CC;
 Thu,  3 Sep 2020 14:17:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 96C40113865F; Thu,  3 Sep 2020 16:17:16 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v6 00/12] monitor: Optionally run handlers in coroutines
References: <20200528153742.274164-1-kwolf@redhat.com>
 <87d046d5k1.fsf@dusky.pond.sub.org>
 <87y2mtpbrf.fsf@dusky.pond.sub.org>
 <87ft7zm8yr.fsf@dusky.pond.sub.org>
 <20200903124529.GC8835@linux.fritz.box>
Date: Thu, 03 Sep 2020 16:17:16 +0200
In-Reply-To: <20200903124529.GC8835@linux.fritz.box> (Kevin Wolf's message of
 "Thu, 3 Sep 2020 14:45:29 +0200")
Message-ID: <87363zkkr7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 00:24:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: marcandre.lureau@gmail.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 03.09.2020 um 12:49 hat Markus Armbruster geschrieben:
>> Markus Armbruster <armbru@redhat.com> writes:
>> 
>> > Markus Armbruster <armbru@redhat.com> writes:
>> >
>> >> I let this series slide to get my Error API rework done, along with much
>> >> else.  My sincere apologies!
>> >>
>> >> Unsurprisingly, it needs a rebase now.  I suggest to let me review it as
>> >> is first.
>> >
>> > I'm done with v6.  Summary:
>> >
>> > * A few trivial things to correct here and there.
>> >
>> > * A few ideas to improve things in relatively minor ways.
>> >
>> > * PATCH 03 looks "why bother" to me until PATCH 09 makes me suspect you
>> >   did the former to enable the latter.  If you had captured that in your
>> >   commit message back then, like you did for the similar PATCH 05, I
>> >   wouldn't be scratching my head now :)
>> >
>> > * I dislike PATCH 06, and would like to explore an alternative idea.
>> >
>> > * PATCH 08 makes hairy monitor code even hairier, but I don't have
>> >   better ideas.
>> >
>> > * I don't feel comfortable as a sole reviewer of the AIO magic in PATCH
>> >   10-12.  Let's ask Stefan for an eye-over.
>> >
>> > I'd like to proceed as follows.  You rebase, and address "easy" review
>> > comments (you decide what's easy).  Post as v7, cc'ing Stefan for the
>> > AIO magic and David Gilbert for HMP.  While they review (hopefully), I
>> > explore a replacement for PATCH 06.  And then we touch bases and decide
>> > how to get this thing wrapped.
>> 
>> I explored:
>> 
>>     Subject: Ways to do per-coroutine properties (was: [PATCH v6 06/12] monitor: Make current monitor a per-coroutine property)
>>     Date: Fri, 07 Aug 2020 15:09:19 +0200 (3 weeks, 5 days, 21 hours ago)
>>     Message-ID: <87a6z6wqkg.fsf_-_@dusky.pond.sub.org>
>> 
>> May I have v7?  Feel free to keep your PATCH 06.  If I decide to replace
>> it, I can do it myself, possibly on top.
>
> It's one of the next things on my list. I can't promise anything more
> specific, though.

Take your time.  I've certainly taken mine and then some.


