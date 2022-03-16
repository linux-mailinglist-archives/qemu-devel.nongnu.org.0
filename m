Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE664DB05C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:06:43 +0100 (CET)
Received: from localhost ([::1]:58546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUTMR-0007XL-06
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:06:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUTFI-0008PN-3q
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:59:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUTFE-0007ms-RD
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:59:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647435555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k0BeVrFcDFzW21rI23dvNnLdoXrfyMGYR0FXaWZc+rM=;
 b=hWcgbiRx9+ZX0GCj2uQer1ncwN+Ns0LDWEPrEsc1WSpS0cEZJXn0peKgtz6A5PkVCh1YHW
 U1tFLtJ5lsb1oK7iP/T7QIfneNSnZw+WrPWpS0E4wZTEE7ERu6Cw/952meKpQY1nFczCxn
 +mH59BoEaSh3rGQd/idfdFU0ditibAI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-_ZNKdr6LN6285YnRYMbXnQ-1; Wed, 16 Mar 2022 08:59:14 -0400
X-MC-Unique: _ZNKdr6LN6285YnRYMbXnQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 204243C14CCB
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 12:59:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE0C14010A2A;
 Wed, 16 Mar 2022 12:59:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6338D21E6821; Wed, 16 Mar 2022 13:59:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 25/27] include/qapi: add g_autoptr support for qobject
 types
References: <20220316095454.2613871-1-marcandre.lureau@redhat.com>
 <87bky65bb4.fsf@pond.sub.org>
 <CAMxuvazmKfOcKo2dJeduvifrYFOMYCVgCDkC4qak0e8yioCWOQ@mail.gmail.com>
Date: Wed, 16 Mar 2022 13:59:12 +0100
In-Reply-To: <CAMxuvazmKfOcKo2dJeduvifrYFOMYCVgCDkC4qak0e8yioCWOQ@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Wed, 16 Mar 2022
 16:37:39 +0400")
Message-ID: <87fsnixdcv.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:

> Hi
>
> On Wed, Mar 16, 2022 at 4:31 PM Markus Armbruster <armbru@redhat.com> wro=
te:
>>
>> marcandre.lureau@redhat.com writes:
>>
>> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >
>> > Add small inline wrappers for qobject_unref() calls, which is a macro.
>> >
>> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> > ---
>> >  include/qapi/qmp/qbool.h   | 6 ++++++
>> >  include/qapi/qmp/qdict.h   | 6 ++++++
>> >  include/qapi/qmp/qlist.h   | 8 +++++++-
>> >  include/qapi/qmp/qnull.h   | 6 ++++++
>> >  include/qapi/qmp/qnum.h    | 6 ++++++
>> >  include/qapi/qmp/qstring.h | 6 ++++++
>> >  6 files changed, 37 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/include/qapi/qmp/qbool.h b/include/qapi/qmp/qbool.h
>> > index 2f888d10573f..52b1c5c15280 100644
>> > --- a/include/qapi/qmp/qbool.h
>> > +++ b/include/qapi/qmp/qbool.h
>> > @@ -21,6 +21,12 @@ struct QBool {
>> >      bool value;
>> >  };
>> >
>> > +static inline void qbool_unref(QBool *q) {
>> > +    qobject_unref(q);
>> > +}
>> > +
>> > +G_DEFINE_AUTOPTR_CLEANUP_FUNC(QBool, qbool_unref)
>> > +
>>
>> You need the wrapper function around the wrapper macro qobject_unref(),
>> because
>>
>>    G_DEFINE_AUTOPTR_CLEANUP_FUNC(QBool, qobject_unref_impl)
>>
>> dies with "passing argument 1 of =E2=80=98qobject_unref_impl=E2=80=99 fr=
om incompatible
>> pointer type [-Wincompatible-pointer-types]".  Okay.
>
> Yeah, unfortunately. There might be other tricks possible, but they
> would likely be less obvious.
>
>>
>> Style nitpick: a function's opening brace goes on its own line:
>>
>>    static inline void qbool_unref(QBool *q)
>>    {
>>        qobject_unref(q);
>>    }
>>
>
> right
>
>> Moreover, I prefer to put code in headers only when there's a real need.
>> I don't see one here.  Most existing uses of
>
> I agree, I generally don't like inline. However, simple one-liner
> wrapper kinda fit. I was even tempted to use extra _ at the end of the
> function to prevent usage outside of the macro, but decided that
> wouldn't be much better.
>
> Btw, what's' your rule for using "static inline" in headers then :) ?

Demonstrated performance improvement would be compelling.

Occasionally, there's no good .c home for the function, and putting it
in the header is overall less bad than creating a .c for it.

>> G_DEFINE_AUTOPTR_CLEANUP_FUNC() use a plain extern function.

[...]


