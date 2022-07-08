Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C82CF56BB56
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 15:59:35 +0200 (CEST)
Received: from localhost ([::1]:53024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9oVy-00043Y-I6
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 09:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o9oT1-0007tb-LP
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 09:56:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o9oSx-00039U-Mh
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 09:56:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657288579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7EuVtXP9AIp7qSgoM9UcUXdVWshMXRoz+0Inuz+fhAQ=;
 b=AdYHOHr6TYRm+3sEGvIduo2ZCOC4JwfwknhdotWh+jS7furNciUzsefGi1Sl4AX21KY6Em
 qqR1y1qAJBog19TkbzLJBRw1bzlVx13hgQQyNFBnRRPKQ3NFT56h2nEILohLWXX22Mjanl
 +SU3Qa1dmcPX9L5dHTgVI4eqYWQsvDY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-94-nB4YMGOnPAiGKE-mKHOOHg-1; Fri, 08 Jul 2022 09:56:09 -0400
X-MC-Unique: nB4YMGOnPAiGKE-mKHOOHg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB7F918E528F;
 Fri,  8 Jul 2022 13:56:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D07A04010D2A;
 Fri,  8 Jul 2022 13:56:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9946021E690D; Fri,  8 Jul 2022 15:56:06 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>,  Michael Roth <michael.roth@amd.com>,
 Kevin Wolf <kwolf@redhat.com>,  Laurent Vivier <laurent@vivier.eu>,
 Warner Losh <imp@bsdimp.com>,  Kyle Evans <kevans@freebsd.org>,  Hanna
 Reitz <hreitz@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  Fam Zheng <fam@euphon.net>,  Eric Blake
 <eblake@redhat.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  "open list:Block layer core"
 <qemu-block@nongnu.org>
Subject: Re: [PATCH 1/9] monitor: make error_vprintf_unless_qmp() static
References: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
 <20220616124034.3381391-2-marcandre.lureau@redhat.com>
 <87edyxdscx.fsf@pond.sub.org>
 <CAJ+F1CLtkoHZWwyBDJH6ZNek=McM3k8OQhKsVfcidXvRToqY3Q@mail.gmail.com>
Date: Fri, 08 Jul 2022 15:56:06 +0200
In-Reply-To: <CAJ+F1CLtkoHZWwyBDJH6ZNek=McM3k8OQhKsVfcidXvRToqY3Q@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Thu, 7 Jul 2022
 21:35:05 +0400")
Message-ID: <87fsjb6749.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:

> Hi
>
> On Thu, Jul 7, 2022 at 4:25 PM Markus Armbruster <armbru@redhat.com> wrot=
e:
>
>> marcandre.lureau@redhat.com writes:
>>
>> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >
>> > Not needed outside monitor.c. Remove the needless stub.
>> >
>> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> > ---
>> >  include/monitor/monitor.h | 1 -
>> >  monitor/monitor.c         | 3 ++-
>> >  stubs/error-printf.c      | 5 -----
>> >  3 files changed, 2 insertions(+), 7 deletions(-)
>> >
>> > diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
>> > index a4b40e8391db..44653e195b45 100644
>> > --- a/include/monitor/monitor.h
>> > +++ b/include/monitor/monitor.h
>> > @@ -56,7 +56,6 @@ void monitor_register_hmp(const char *name, bool inf=
o,
>> >  void monitor_register_hmp_info_hrt(const char *name,
>> >                                     HumanReadableText *(*handler)(Erro=
r **errp));
>> >
>> > -int error_vprintf_unless_qmp(const char *fmt, va_list ap) G_GNUC_PRIN=
TF(1, 0);
>> >  int error_printf_unless_qmp(const char *fmt, ...) G_GNUC_PRINTF(1, 2);
>> >
>> >  #endif /* MONITOR_H */
>> > diff --git a/monitor/monitor.c b/monitor/monitor.c
>> > index 86949024f643..ba4c1716a48a 100644
>> > --- a/monitor/monitor.c
>> > +++ b/monitor/monitor.c
>> > @@ -273,7 +273,8 @@ int error_vprintf(const char *fmt, va_list ap)
>> >      return vfprintf(stderr, fmt, ap);
>> >  }
>> >
>> > -int error_vprintf_unless_qmp(const char *fmt, va_list ap)
>> > +G_GNUC_PRINTF(1, 0)
>> > +static int error_vprintf_unless_qmp(const char *fmt, va_list ap)
>> >  {
>> >      Monitor *cur_mon =3D monitor_cur();
>> >
>> > diff --git a/stubs/error-printf.c b/stubs/error-printf.c
>> > index 0e326d801059..1afa0f62ca26 100644
>> > --- a/stubs/error-printf.c
>> > +++ b/stubs/error-printf.c
>> > @@ -16,8 +16,3 @@ int error_vprintf(const char *fmt, va_list ap)
>> >      }
>> >      return vfprintf(stderr, fmt, ap);
>> >  }
>> > -
>> > -int error_vprintf_unless_qmp(const char *fmt, va_list ap)
>> > -{
>> > -    return error_vprintf(fmt, ap);
>> > -}
>>
>> When I write a printf-like utility function, I habitually throw in a
>> vprintf-like function.
>>
>> Any particular reason for hiding this one?  To avoid misunderstandings:
>> I'm fine with hiding it if it's causing you trouble.
>
> I don't think I had an issue with it, only that I wrote tests for the
> error-report.h API, and didn't see the need to cover a function that isn't
> used outside the unit.

I'd keep it and not worry about missing tests; the tests of
error_printf_unless_qmp() exercise it fine.

>> Except I think we'd better delete than hide then: inline into
>> error_printf_unless_qmp().  Makes sense?
>
> It can't be easily inlined because of the surrounding va_start/va_end

Easily enough, I think:

diff --git a/monitor/monitor.c b/monitor/monitor.c
index 86949024f6..201a672ac6 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -273,27 +273,22 @@ int error_vprintf(const char *fmt, va_list ap)
     return vfprintf(stderr, fmt, ap);
 }
=20
-int error_vprintf_unless_qmp(const char *fmt, va_list ap)
-{
-    Monitor *cur_mon =3D monitor_cur();
-
-    if (!cur_mon) {
-        return vfprintf(stderr, fmt, ap);
-    }
-    if (!monitor_cur_is_qmp()) {
-        return monitor_vprintf(cur_mon, fmt, ap);
-    }
-    return -1;
-}
-
 int error_printf_unless_qmp(const char *fmt, ...)
 {
+    Monitor *cur_mon =3D monitor_cur();
     va_list ap;
     int ret;
=20
     va_start(ap, fmt);
-    ret =3D error_vprintf_unless_qmp(fmt, ap);
+    if (!cur_mon) {
+        ret =3D vfprintf(stderr, fmt, ap);
+    } else if (!monitor_cur_is_qmp()) {
+        ret =3D monitor_vprintf(cur_mon, fmt, ap);
+    } else {
+        ret =3D -1;
+    }
     va_end(ap);
+
     return ret;
 }
=20


