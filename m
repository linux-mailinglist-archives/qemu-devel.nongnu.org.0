Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECF55135CF
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 15:54:50 +0200 (CEST)
Received: from localhost ([::1]:33558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk4bZ-0003vS-F8
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 09:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nk4Y1-0001Hx-9i
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 09:51:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nk4Xy-0004xd-Ut
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 09:51:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651153865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2nNARmoPsrh+qjg5g1BnmMK2m/IsnT+YeLidbBuS7y4=;
 b=huDRCmajp0t6KcX7JKXx2BGgx3NuNhb7lGRn0suhnwTrJ/g7FVsMVPZifpd+GVMl5SMnHO
 YXa0BNMqzzy6c8HyoSLtitrIsxLXszImrvyZA1TwU4/UH5f50SMZE1fPgO2FrGEry3pSuI
 PNCbc183zT9PRVHvIwVkaNF6gPjoSLk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-_Fmt6_keMeyBWVAHbW0rTw-1; Thu, 28 Apr 2022 09:50:56 -0400
X-MC-Unique: _Fmt6_keMeyBWVAHbW0rTw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8202B1C05157
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 13:50:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5170B416156;
 Thu, 28 Apr 2022 13:50:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1DABB21E6889; Thu, 28 Apr 2022 15:50:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
References: <20220401224104.145961-1-victortoso@redhat.com>
 <CABJz62PBHFqUyBNtwd_K6pra9_zOz9Ps56JOsNZL8XHf2u35Uw@mail.gmail.com>
Date: Thu, 28 Apr 2022 15:50:55 +0200
In-Reply-To: <CABJz62PBHFqUyBNtwd_K6pra9_zOz9Ps56JOsNZL8XHf2u35Uw@mail.gmail.com>
 (Andrea Bolognani's message of "Tue, 19 Apr 2022 11:12:28 -0700")
Message-ID: <87a6c52u68.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: John Snow <jsnow@redhat.com>, Victor Toso <victortoso@redhat.com>,
 qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Andrea Bolognani <abologna@redhat.com> writes:

> On Sat, Apr 02, 2022 at 12:40:56AM +0200, Victor Toso wrote:
>> Thanks for taking a look, let me know if you have questions, ideas
>> or suggestions.
>
> Full disclosure: I have only given the actual implementation a very
> cursory look so far, and I've focused on the generated Go API
> instead.
>
> Overall things look pretty good.
>
> One concern that I have is about naming struct members: things like
> SpiceInfo.MouseMode and most others are translated from the QAPI
> schema exactly the way you'd expect them, but for example
> ChardevCommon.Logappend doesn't look quite right.

It doesn't look quite right in the QAPI schema, either: @logappend.  If
it was @log-append, as it should, then it would get translated to
LogAppend, I guess.

Fixing up style isn't a code generator's job.

>                                                   Of course there's
> no way to programmatically figure out what to capitalize,

Some case conversions are straightforward enough.  For instance, the C
code generator generates qapi_event_send_some_event() for event
SOME_EVENT, and inclusion guard macro FILE_NAME_H for module file name
file-name.json.  No magic involved.

Conversion from lower-case-with-dashes to CamelCase doesn't have to be
magic, either.  You just have to accept garbage-in (like missing dashes)
will give you garbage-out.  I wouldn't care too much;
CamelCaseIsAnIllegibleMessAnyway.

Conversion from CamelCase is always trouble, though.  There is one
instance so far: generating C enumeration constants.  We want TYPE_NAME
+ '_' + MEMBER_NAME, where TYPE_NAME is the enumeration type's name
converted from CamelCase to UPPER_CASE_WITH_UNDERSCORES, and MEMBER_NAME
is the member name converted from lower-case-with-dashes to
UPPER_CASE_WITH_UNDERSCORES.

camel_to_upper() tries, but the result is often unappealing, surprising,
or both.

>                                                           but maybe
> there's room for adding this kind of information in the form of
> additional annotations or something like that?

We did for enumeration types: 'prefix' overrides the TYPE_NAME prefix.
I fear this was a mistake.

>                                                Same for the various
> structs or members that have unexpectedly-capitalized "Tls" or "Vnc"
> in them.

Examples?

> To be clear, I don't think the above is a blocker - just something to
> be aware of, and think about.

Yup.

[...]


