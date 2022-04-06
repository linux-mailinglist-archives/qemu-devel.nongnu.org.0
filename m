Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 050494F5AC3
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 12:39:42 +0200 (CEST)
Received: from localhost ([::1]:40360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc34f-0002F3-5E
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 06:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nc33P-0000kY-IA
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 06:38:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nc33M-0006Nf-KP
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 06:38:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649241499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UmWUKX4D/rkhQ38lAfBZLoSA0gM0dguNno33FNOJr7Q=;
 b=TW3+DDFdqK6cmrWg3WTXn9+tGuVCMfwqy0t9cw30H4vxVvE/fGaZmf4IZnxsOgBltmW9dY
 CX7FRU1kR5EJSl8PUH86gceaXT2hyfh/LwT2Qi+KiRDqyHGOtU4GIMGQiGpiRDlF0oZhOQ
 xY8Bw4o0Mt1YfXwYcgM49oAmdUpZFqA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-XDFimXXlPSmNfAn8kiAUgg-1; Wed, 06 Apr 2022 06:38:18 -0400
X-MC-Unique: XDFimXXlPSmNfAn8kiAUgg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FF80833963
 for <qemu-devel@nongnu.org>; Wed,  6 Apr 2022 10:38:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B8AD1415126;
 Wed,  6 Apr 2022 10:38:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DE43D21E6A00; Wed,  6 Apr 2022 12:38:16 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 13/32] error-report: replace deprecated
 g_get_current_time() with glib >= 2.62
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-14-marcandre.lureau@redhat.com>
 <87fsmqr34l.fsf@pond.sub.org>
 <CAMxuvazZMQFJ4-8my4kLOe_XuJQNSqttXd2tn7zXGS9U+6FeEA@mail.gmail.com>
 <CAMxuvaxVMMhVdaXBt+YhdbDgxC8yV=AqbfaH119LKGWp3bgmZA@mail.gmail.com>
Date: Wed, 06 Apr 2022 12:38:16 +0200
In-Reply-To: <CAMxuvaxVMMhVdaXBt+YhdbDgxC8yV=AqbfaH119LKGWp3bgmZA@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Wed, 6 Apr 2022
 13:40:54 +0400")
Message-ID: <87sfqqpkdj.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

> On Wed, Apr 6, 2022 at 1:35 PM Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com> wrote:
>>
>> Hi
>>
>> On Wed, Apr 6, 2022 at 1:08 PM Markus Armbruster <armbru@redhat.com> wro=
te:
>> >
>> > marcandre.lureau@redhat.com writes:
>> >
>> > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> > >
>> > > According to GLib API:
>> > > g_get_current_time has been deprecated since version 2.62 and should=
 not
>> > > be used in newly-written code. GTimeVal is not year-2038-safe. Use
>> > > g_get_real_time() instead.
>> > >
>> > > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> > > ---
>> > >  include/glib-compat.h | 10 ++++++++++
>> > >  util/qemu-error.c     | 17 ++++++++++++++---
>> > >  2 files changed, 24 insertions(+), 3 deletions(-)
>> > >
>> > > diff --git a/include/glib-compat.h b/include/glib-compat.h
>> > > index 3113a7d2af84..dc14d3ec0d1e 100644
>> > > --- a/include/glib-compat.h
>> > > +++ b/include/glib-compat.h
>> > > @@ -145,6 +145,16 @@ qemu_g_test_slow(void)
>> > >  #define g_test_thorough() qemu_g_test_slow()
>> > >  #define g_test_quick() (!qemu_g_test_slow())
>> > >
>> > > +#if GLIB_CHECK_VERSION(2,62,0)
>> > > +static inline gchar *
>> > > +g_date_time_format_iso8601_compat(GDateTime *datetime)
>> > > +{
>> > > +    return g_date_time_format_iso8601(datetime);
>> > > +}
>> > > +
>> > > +#define g_date_time_format_iso8601 g_date_time_format_iso8601_compa=
t
>> > > +#endif
>> >
>> > I'm confused.
>> >
>> > If we're using v2.62 or later, g_time_val_to_iso8601(dt) calls GLib's
>> > g_time_val_to_iso8601().  Why do we need the inline function and the
>> > macro?
>>
>> To hide the "deprecation" warning because GLIB_VERSION_MAX_ALLOWED is 2.=
56.

Ah, now I see!

> This is probably a better solution, I will change the patch:
>
> --- a/util/qemu-error.c
> +++ b/util/qemu-error.c
> @@ -185,7 +185,10 @@ real_time_iso8601(void)
>  {
>  #if GLIB_CHECK_VERSION(2,62,0)
>      g_autoptr(GDateTime) dt =3D g_date_time_new_from_unix_utc(g_get_real=
_time());
> +#pragma GCC diagnostic push
> +#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
>      return g_date_time_format_iso8601(dt);
> +#pragma GCC diagnostic pop
>  #else
>      GTimeVal tv;

Yup, this is clearer.  Throw in a comment, perhaps?

[...]


